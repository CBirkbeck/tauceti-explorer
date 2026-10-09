/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/AbelianSchemesAndArithmeticModuli.md is definitive.
These statements suggest Lean forms so contributors and reviewers converge on
names and signatures. Every proof/body is a prototype; no implementation is claimed.
Pinned Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174,
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The native field carrier, End, multiplication, product and Cartier duality are imported.
Unavailable relative/analytic/PD carriers have exact named omission records below.
A missing condition is omitted, never represented by an arbitrary Prop field.
-/
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny
import TauCeti.AlgebraicGeometry.AbelianVariety.Product
import TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.BaseChange
import TauCeti.Geometry.Hodge.WeightOne.Basic
import Mathlib.Algebra.Module.ZLattice.Basic
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.NumberTheory.Padics.Complex
import Mathlib.RingTheory.IntegralClosure.IsIntegral.Basic
import Mathlib.RingTheory.SimpleModule.WedderburnArtin
import Mathlib.RingTheory.DividedPowers.Basic
import Mathlib.RingTheory.MvPolynomial.Homogeneous

open CategoryTheory Polynomial
open scoped TensorProduct

namespace TauCeti.AlgebraicGeometry.AbelianVariety
open scoped Hom
universe u
variable {K : Type u} [Field K] {A B C : AbelianVariety K}

/-- A6/degree-of-an-endomorphism: equal-dimensional maps use rank if isogenies, zero otherwise.
The degree-zero object has its unique map of degree one. -/
noncomputable def Hom.deg (f : A ⟶ B) : ℕ := by sorry

/-- API `deg_comp`: dimension equality is necessary for this statement. -/
theorem deg_comp (f : A ⟶ B) (h : B ⟶ C) (hAB : A.dim = B.dim) (hBC : B.dim = C.dim) :
    Hom.deg (f ≫ h) = Hom.deg f * Hom.deg h := by sorry

/-- API `deg_mulBy`: the zero-dimensional case uses 0^0=1. -/
theorem deg_mulBy (A : AbelianVariety K) (g : ℕ) (hg : A.dim = (g : WithBot ℕ∞)) (n : ℤ) :
    Hom.deg (mulBy A n) = n.natAbs ^ (2 * g) := by sorry

theorem isIsogeny_iff_deg_ne_zero (f : A ⟶ B) (hAB : A.dim = B.dim) :
    IsIsogeny f ↔ Hom.deg f ≠ 0 := by sorry

/-- API `End.degRat`: Q is the coefficient factor, not a geometric field extension. -/
noncomputable def End.degRat (α : ℚ ⊗[ℤ] End A) : ℚ := by sorry

theorem degree_dimension_zero (A : AbelianVariety K) (hg : A.dim = 0) (α : End A) :
    Hom.deg (End.toHom α) = 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.AbelianVariety.deg_mulBy_two_elliptic`. -/
example (A : AbelianVariety K) (hg : A.dim = 1) : Hom.deg (mulBy A 2) = 4 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.AbelianVariety.deg_zero`: positive dimension. -/
example (A : AbelianVariety K) (g : ℕ) (hg : A.dim = (g : WithBot ℕ∞)) (hpos : 0 < g) :
    Hom.deg (End.toHom (0 : End A)) = 0 ∧ Hom.deg (𝟙 A) = 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.AbelianVariety.deg_zero`: dimension zero. -/
example (A : AbelianVariety K) (hg : A.dim = 0) : Hom.deg (End.toHom (0 : End A)) = 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.AbelianVariety.deg_neg_one`. -/
example (A : AbelianVariety K) : Hom.deg (mulBy A (-1)) = 1 := by sorry

/-- A6/characteristic-polynomial-of-an-endomorphism, integral construction. -/
noncomputable def End.charpoly (α : End A) : ℤ[X] := by sorry

/-- The positive-dimensional trace is minus the penultimate coefficient; at dimension zero it is 0. -/
noncomputable def End.trace (α : End A) : ℤ := by sorry

theorem End.charpoly_eval (α : End A) (r : ℤ) :
    (End.charpoly α).eval r = (Hom.deg (End.toHom (α - (r : End A))) : ℤ) := by sorry

theorem End.charpoly_monic (α : End A) (g : ℕ) (hg : A.dim = (g : WithBot ℕ∞)) :
    (End.charpoly α).Monic ∧ (End.charpoly α).natDegree = 2 * g := by sorry

theorem End.charpoly_coeff_zero (α : End A) :
    (End.charpoly α).coeff 0 = (Hom.deg (End.toHom α) : ℤ) := by sorry

theorem End.trace_add (α β : End A) : End.trace (α + β) = End.trace α + End.trace β := by sorry

/-- Test `TauCeti.AlgebraicGeometry.AbelianVariety.charpoly_mulBy`:
explicit conversion from native mulBy (a morphism) to End (an additive ring). -/
example (A : AbelianVariety K) (g : ℕ) (hg : A.dim = (g : WithBot ℕ∞)) (n : ℤ) :
    End.charpoly (End.ofHom (mulBy A n)) = (X - Polynomial.C n) ^ (2 * g) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.AbelianVariety.charpoly_zero`. -/
example (A : AbelianVariety K) (g : ℕ) (hg : A.dim = (g : WithBot ℕ∞)) :
    End.charpoly (0 : End A) = X ^ (2 * g) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.AbelianVariety.charpoly_ne_minpoly`: the scalar minimal
polynomial is linear, while the geometric characteristic polynomial has degree 2g. -/
example (A : AbelianVariety K) (g : ℕ) (hg : A.dim = (g : WithBot ℕ∞)) (hpos : 0 < g) (n : ℤ) :
    End.charpoly (n : End A) ≠ X - Polynomial.C n := by sorry

/-- Dimension-zero boundary of the characteristic-polynomial construction. -/
example (A : AbelianVariety K) (hg : A.dim = 0) (α : End A) :
    End.charpoly α = 1 ∧ End.trace α = 0 := by sorry

/-- Algebraic lemma used for uniqueness of P, against native polynomial evaluation. -/
theorem eq_of_eval_intCast {p q : ℚ[X]} (h : ∀ r : ℤ, p.eval (r : ℚ) = q.eval (r : ℚ)) :
    p = q := by sorry

/-- A6/polynomials-determined-by-l-adic-values, on the native algebraic closure. -/
theorem eq_of_padicNorm_roots_products (ℓ : ℕ) [Fact ℓ.Prime]
    (P Q : (Padic ℓ)[X]) (hP : P.Monic) (hQ : Q.Monic)
    (hdegree : P.natDegree = Q.natDegree)
    (h : ∀ F : ℤ[X],
      ‖((P.map (algebraMap (Padic ℓ) (PadicAlgCl ℓ))).roots.map
        fun x => aeval x F).prod‖ =
      ‖((Q.map (algebraMap (Padic ℓ) (PadicAlgCl ℓ))).roots.map
        fun x => aeval x F).prod‖) : P = Q := by sorry

/-- Matrix instance of A6/multiplicative-polynomial-functions; its full polynomial-law
signature is omitted until the degree law is bundled. -/
theorem det_aeval_eq_prod_roots {F : Type*} [Field F] [IsAlgClosed F] {n : ℕ}
    (M : Matrix (Fin n) (Fin n) F) (P : F[X]) :
    (aeval M P).det = (M.charpoly.roots.map fun a => P.eval a).prod := by sorry

/-- Native field/Hom target: the finite-rank conclusion needs no placeholder carrier. -/
theorem hom_is_free_of_finite_rank (A B : AbelianVariety K) :
    Module.Free ℤ (Additive (A ⟶ B)) ∧ Module.Finite ℤ (Additive (A ⟶ B)) := by sorry

/-- A6/endomorphism-algebra-is-semisimple: the native rational coefficient algebra. -/
theorem endQ_isSemisimple (A : AbelianVariety K) :
    IsSemisimpleRing (ℚ ⊗[ℤ] End A) ∧ Module.Finite ℚ (ℚ ⊗[ℤ] End A) := by sorry

/-- A6/degree-is-a-polynomial-function: genuine homogeneous polynomials on every finite family. -/
theorem degree_polynomial (A : AbelianVariety K) (g : ℕ) (hg : A.dim = (g : WithBot ℕ∞))
    {ι : Type*} [Fintype ι] (e : ι → ℚ ⊗[ℤ] End A) :
    ∃ p : MvPolynomial ι ℚ, p.IsHomogeneous (2 * g) ∧
      ∀ x : ι → ℚ, MvPolynomial.eval x p = End.degRat (∑ i, x i • e i) := by sorry

/-- Integral congruence lemma used in full-level descent and polarized automorphism rigidity. -/
theorem eq_one_of_root_of_unity {F : Type*} [Field F] [CharZero F] {ζ π : F}
    (hπ : IsIntegral ℤ π) {n : ℤ} (hn : 3 ≤ n) (hζ : ζ = 1 + n * π)
    {m : ℕ} (hm : 0 < m) (hζm : ζ ^ m = 1) : ζ = 1 := by sorry

/-- Rosati matrix-shape check; this is not a replacement for the missing native polarization type. -/
theorem trace_mul_transpose_pos {n : ℕ} (x : Matrix (Fin n) (Fin n) ℚ) (hx : x ≠ 0) :
    0 < (x * x.transpose).trace := by sorry

/-- A6/coefficient-hom-and-units: coefficient extension on the native additive Hom.
For Q-algebras this is canonically R⊗Q(Q⊗Z Hom); objects remain over K. -/
abbrev CoefficientHom (A B : AbelianVariety K) (R : Type*) [CommRing R] [Algebra ℚ R] :=
  R ⊗[ℤ] Additive (A ⟶ B)

namespace CoefficientHom
variable {R : Type*} [CommRing R] [Algebra ℚ R]

/-- API `CoefficientHom.comp`: bilinear categorical composition. -/
noncomputable def comp : CoefficientHom A B R →ₗ[R]
    CoefficientHom B C R →ₗ[R] CoefficientHom A C R := by sorry

/-- API `CoefficientHom.baseChange`: a coefficient map, not a change of the field K. -/
noncomputable def baseChange {R' : Type*} [CommRing R'] [Algebra ℚ R']
    (f : R →ₐ[ℚ] R') : CoefficientHom A B R →+ CoefficientHom A B R' := by sorry

/-- The actual unit group, supplying the points of the future affine unit-group scheme. -/
abbrev units (A : AbelianVariety K) := (R ⊗[ℤ] End A)ˣ

/-- Test `CoefficientHom.dual_numbers`: 1+εα has two-sided inverse 1−εα if ε²=0. -/
example (A : AbelianVariety K) (ε : R) (hε : ε * ε = 0) (α : R ⊗[ℤ] End A) :
    (1 + ε • α) * (1 - ε • α) = 1 ∧ (1 - ε • α) * (1 + ε • α) = 1 := by sorry

end CoefficientHom

end TauCeti.AlgebraicGeometry.AbelianVariety

namespace TauCeti.AbelianRiemann
variable {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]
variable (Λ : Submodule ℤ V) [DiscreteTopology Λ] [IsZLattice ℝ Λ]

/-- A5/riemann-form, expressed on native real bilinear maps, a native full Z-lattice and the
native complex structure. Integrality, alternation and positivity are actual predicates. -/
structure RiemannForm (J : TauCeti.AlmostComplexStructure V) where
  form : V →ₗ[ℝ] V →ₗ[ℝ] ℝ
  alternating : ∀ v, form v v = 0
  integral : ∀ x y : Λ, ∃ n : ℤ, form x y = (n : ℝ)
  invariant : ∀ v w, form (J v) (J w) = form v w
  positive : ∀ v, v ≠ 0 → 0 < form (J v) v

namespace RiemannForm
variable {Λ} {J : TauCeti.AlmostComplexStructure V}

/-- API `RiemannForm.hermitian`; this formula is first-variable linear in the induced complex
structure, and its imaginary part is the alternating form. -/
noncomputable def hermitian (E : RiemannForm Λ J) (v w : V) : ℂ := by sorry

/-- API `RiemannForm.integral` is the actual structure projection above. -/
theorem hermitian_formula (E : RiemannForm Λ J) (v w : V) :
    E.hermitian v w = (E.form (J v) w : ℂ) + Complex.I * (E.form v w : ℂ) := by sorry

/-- API `RiemannForm.integralPairing`: choose the integer values using the actual integrality proof. -/
noncomputable def integralPairing (E : RiemannForm Λ J) : Λ →ₗ[ℤ] Λ →ₗ[ℤ] ℤ := by sorry

/-- API `RiemannForm.isPrincipal`: unimodularity, not merely rational nondegeneracy. -/
def isPrincipal (E : RiemannForm Λ J) : Prop := Function.Bijective E.integralPairing

/-- API `RiemannForm.pullback`: positivity requires an injective map and the lattice and
complex structures must be respected. -/
noncomputable def pullback {W : Type*} [NormedAddCommGroup W] [NormedSpace ℝ W]
    (Λ' : Submodule ℤ W) [DiscreteTopology Λ'] [IsZLattice ℝ Λ']
    (J' : TauCeti.AlmostComplexStructure W) (E : RiemannForm Λ J)
    (f : W →ₗ[ℝ] V) (hinj : Function.Injective f)
    (hΛ : ∀ x : Λ', f x ∈ Λ) (hJ : ∀ v, f (J' v) = J (f v)) :
    RiemannForm Λ' J' := by sorry

/-- Test `RiemannForm.zero_dimension`: both the lattice and its integral dual are zero. -/
example [Subsingleton V] (E : RiemannForm Λ J) : E.isPrincipal := by sorry

/-- Test `RiemannForm.negative`: the negative form fails the positive convention. -/
example (E : RiemannForm Λ J) (v : V) (hv : v ≠ 0) : ¬ 0 < -(E.form (J v) v) := by sorry

end RiemannForm
end TauCeti.AbelianRiemann

/-! ## Exact target and omission manifest

Names below are relative to the namespaces of their mathematical carriers.
Each record states whether a native signature above covers all or part of it,
and identifies the absent carrier for the remaining conditions. Mathematical
statements are planning records, not elaborated declarations. See the reader
for hypotheses, source locators, prerequisites and proof obligations.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A0/field-and-elliptic-boundary (comparison): Field and elliptic comparison interfaces
Exact mathematical signature: The relative carrier imported from R09.4 specializes over Spec k to Tau Ceti’s AbelianVariety k, through the smooth/proper/geometrically-connected and proper/geometrically-integral descriptions. The genus-one carrier, group law, rigidified Picard dual, and finite-flat Cartier duality are the existing ModularCurves interfaces. The comparisons preserve zero, addition, products, pullback, and the chosen Poincaré rigidifications. In dimension zero the object is S with its identity structure map.
Signature boundary: The lower-tier relative abelian-scheme carrier and its field/elliptic comparison equivalences are not native pinned declarations.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A0/relative-moduli-imports (comparison): Relative moduli import contracts
Exact mathematical signature: Reexport R09.1 projective/coherent foundations, R09.2 Hilbert graphs, R09.3 algebraic spaces and descent, R09.4 abelian carrier/dual/polarization definitions, R09.5 Artin representability and R09.6 proper-flat coherent base change, with A0-extension fppf Picard, rigidified Picard and Pic⁰ sheaves. Each use retains finite presentation, flatness, section, base-change and sheafification hypotheses. This is an import boundary and imports no R09.7 resolution or higher moduli space.
Signature boundary: The lower-tier relative abelian-scheme carrier and its field/elliptic comparison equivalences are not native pinned declarations.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A1/relative-cube-and-power (theorem): Relative cube and multiplication pullback
Exact mathematical signature: For an abelian scheme A/S and a line bundle L rigidified at zero, the alternating tensor of its seven nonempty subset-sum pullbacks on A³ is canonically trivial, with compatible face rigidifications. For every integer n, [n]*L≃L^{n(n+1)/2}⊗([-1]*L)^{n(n−1)/2}, compatibly with rigidification and base change. Consequently symmetric L has [n]*L≃L^{n²}, antisymmetric L has [n]*L≃L^n, and [2]*L≃L³⊗[-1]*L in general. For unrigidified L the formula includes the zero-fibre line from S. For symmetric rigidified L, the sum/difference map (x,y)↦(x+y,x−y) pulls L⊠L back to L²⊠L².
Signature boundary: The imported relative abelian-scheme, rigidified invertible-sheaf and relative Picard comparison carriers are not native pinned declarations.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A1/relative-elliptic-equivalence (comparison): Relative elliptic equivalence
Exact mathematical signature: Relative-dimension-one abelian schemes over S are equivalent to the native pointed smooth proper genus-one curves of ModularCurves. The equivalence preserves zero, group law, invariant differential bundle, dual/Poincaré normalization, multiplication and Cartier–Nishi/Weil pairing. Over a field it agrees with the existing field carrier. The genus-zero identity is a separate object, not an elliptic curve.
Signature boundary: The imported relative abelian-scheme, rigidified invertible-sheaf and relative Picard comparison carriers are not native pinned declarations.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A1/relative-invariant-forms (theorem): Invariant forms and coherent constants
Exact mathematical signature: For π:A→S an abelian scheme, O_S≃π_*O_A universally, and evaluation at zero identifies π_*Ω¹_(A/S)≃ω_A=e*Ω¹_(A/S). Translation gives Ω¹_(A/S)≃π*ω_A, where ω_A is locally free of rank g_A; Lie(A/S)=ω_A^∨. These maps commute with arbitrary base change. The trivial tangent/cotangent bundles here are relative bundles, not assertions about the absolute tangent bundle over a varying base.
Signature boundary: The imported relative abelian-scheme, rigidified invertible-sheaf and relative Picard comparison carriers are not native pinned declarations.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A1/relative-products-and-dimension (theorem): Relative products, pullback and dimension
Exact mathematical signature: For abelian schemes A,B over any scheme S, A×_S B is an abelian scheme; arbitrary base change gives A_T, and the canonical product/pullback comparisons respect all group laws. The geometric-fibre dimension g_A:S→N is locally constant, with g_(A×B)=g_A+g_B and g_(A_T)=g_A∘(T→S). A dimension-zero abelian scheme is canonically the identity group scheme S.
Signature boundary: The imported relative abelian-scheme, rigidified invertible-sheaf and relative Picard comparison carriers are not native pinned declarations.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A1/relative-rigidity-comparison (comparison): Rigidity over nonreduced bases
Exact mathematical signature: The imported zero-preserving rigidity theorem holds over arbitrary S, including nilpotent thickenings: every S-map A→B between abelian schemes is the composite of a unique homomorphism h and translation by f∘e_A. Zero-preserving homomorphisms restrict injectively across nilpotent closed immersions S_0→S; the relative Hom functor is formally unramified. Automatic commutativity and the equality of group structures with the same zero section follow from the same rigidity input.
Signature boundary: The imported relative abelian-scheme, rigidified invertible-sheaf and relative Picard comparison carriers are not native pinned declarations.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A1/relative-seesaw (theorem): Relative seesaw with rigidification
Exact mathematical signature: Let X→S be proper flat of finite presentation with geometrically integral fibres, S reduced locally noetherian, and e:S→X a section. If L restricts trivially to every geometric fibre, then π_*L is invertible, commutes with arbitrary base change, and π*π_*L→L is an isomorphism; thus L≃π*e*L. A rigidification makes the resulting trivialization unique. For abelian schemes the normalized Picard functor supplies the corresponding seesaw comparison over arbitrary bases; the reduced-base fibre test is not used to erase infinitesimal Picard classes.
Signature boundary: The imported relative abelian-scheme, rigidified invertible-sheaf and relative Picard comparison carriers are not native pinned declarations.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A1/torsion-restriction-of-rigidified-lines (theorem): Torsion restrictions of rigidified line bundles
Exact mathematical signature: For a rigidified L on A/S and n≥1, L|_(A[n]) is torsion in Pic(A[n]). If L is symmetric its n²-th tensor power is trivial there; if antisymmetric its n-th power is trivial. For arbitrary L the decomposition L²=(L⊗[-1]*L)⊗(L⊗([-1]*L)^−1) gives an explicit annihilating tensor power 2n². The same statements hold on any torsion multisection contained in A[n], including connected nonétale torsion.
Signature boundary: The imported relative abelian-scheme, rigidified invertible-sheaf and relative Picard comparison carriers are not native pinned declarations.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A2/abelian-neron-severi (definition): Néron–Severi group of an abelian variety
Exact mathematical signature: For A/k put NS(A)=Pic(A)/Pic⁰(A), where Pic⁰(A) consists of k-defined line classes algebraically equivalent to zero. Define NS(A)_Q=NS(A)⊗_Z Q and NS(A)_R similarly, and define the ample cone as the positive real cone generated by ample line classes. The geometric group NS(A_kbar) is distinguished from NS(A) and from its Galois invariants. The Mumford map factors to an injection NS(A)→Hom(A,A∨); translation acts trivially and [n]* acts as n². Finite generation is the separate A6 consequence of Hom finiteness, not a definition axiom.
Signature boundary: The imported relative dual/Poincaré and polarization carriers, rigidified Picard quotient and intersection/type interfaces are not native pinned declarations. Native field End is used above where it suffices.
API `AbelianNS.mk`: Send a line class to its quotient class.
API `AbelianNS.eq_iff`: Two classes agree exactly when their quotient is in Pic⁰(A).
API `AbelianNS.toSymmetricHom`: Expose the injective Mumford homomorphism into Hom(A,A∨).
API `AbelianNS.pullback`: Contravariant pullback respects identity, composition and the n² multiplication formula.
API `AbelianNS.tensorQ`: Scalar extension gives the rational NS space and clears denominators in rational pullbacks.
Test `AbelianNS.elliptic_degree` (computation): NS(E) over an algebraically closed field is Z with O(0) mapping to 1.
Test `AbelianNS.pic0_zero` (characterisation): For L in Pic⁰(A), its NS class and φ_L both vanish.
Test `AbelianNS.multiplication_square` (computation): For E and O(0), [2]* acts on NS by 4, not 2.
Test `AbelianNS.geometric_descent` (non-example): A Galois-fixed geometric class need not lift to a k-line class; do not identify NS(A) with NS(A_kbar)^G without a descent theorem.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A2/ample-cohomology-and-degree (theorem): Ample cohomology, Riemann–Roch and degree
Exact mathematical signature: For an ample line bundle L on a dimension-g abelian variety, H^i(A,L)=0 for i>0, h⁰(A,L)=χ(L)>0, χ(L)=c₁(L)^g/g!, and deg φ_L=χ(L)². More generally the last two formulas hold for any L, with degree zero for a nonisogeny φ_L. For relatively ample L on A/S, π_*L is locally free, commutes with arbitrary base change and has fibre rank h⁰(L_s); higher direct images vanish. For an isogeny f:B→A, h⁰(B,f*L)=deg(f)h⁰(A,L). For g=0 all ranks and degrees here are one.
Signature boundary: The imported relative dual/Poincaré and polarization carriers, rigidified Picard quotient and intersection/type interfaces are not native pinned declarations. Native field End is used above where it suffices.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A2/divisor-ample-criterion (theorem): Effective divisor ampleness criterion
Exact mathematical signature: For an abelian variety over an algebraically closed field, a nonzero effective divisor whose support contains no translate of a positive-dimensional abelian subvariety is ample. Its translation stabilizer is a finite group scheme, so its Mumford map is an isogeny and the effective nondegenerate line is ample.
Signature boundary: The imported relative dual/Poincaré and polarization carriers, rigidified Picard quotient and intersection/type interfaces are not native pinned declarations. Native field End is used above where it suffices.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A2/mumford-map-and-biextension (comparison): Mumford map and biextension identities
Exact mathematical signature: For π:A→S and any line bundle L, define φ_L by the imported relative dual: on a:T→A it is represented by t_a*L_T⊗L_T^−1⊗π_T*(a*L_T)^−1⊗π_T*e_T*L_T. The double-rigidified bundle on A² is m*L⊗p₁*L^−1⊗p₂*L^−1⊗π²*e*L. The cube makes φ_L a symmetric homomorphism. One has φ_(L⊗M)=φ_L+φ_M, φ_(t_a*L)=φ_L, φ_(π*N)=0, and φ_(f*L)=f∨φ_L f for a homomorphism f. These are identities of relative sheaf morphisms, compatible with base change; their bilinear correspondence is additive in each variable.
Signature boundary: The imported relative dual/Poincaré and polarization carriers, rigidified Picard quotient and intersection/type interfaces are not native pinned declarations. Native field End is used above where it suffices.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A2/nef-normalized-lines-over-curves (theorem): Nef rigidified symmetric lines over curves
Exact mathematical signature: Let S be a smooth projective integral curve over a field and A/S an abelian scheme. A symmetric rigidified relatively ample line L is nef on the total space. Given another symmetric rigidified line L′, some integer a>0 makes aL−L′ nef. Moreover L has torsion restriction on every torsion multisection. These conclusions concern the normalized line: tensoring by a line of negative degree from S can destroy nefness.
Signature boundary: The imported relative dual/Poincaré and polarization carriers, rigidified Picard quotient and intersection/type interfaces are not native pinned declarations. Native field End is used above where it suffices.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison (theorem): Normalized Poincaré and relative dual comparison
Exact mathematical signature: For the imported A∨=Pic⁰_(A/S), its Poincaré line P on A×_S A∨ has trivializations on both zero faces agreeing at (0,0). Evaluation identifies A with A∨∨. Dual maps are contravariant and compatible with arbitrary base change and products; under the field and elliptic adapters the comparison identifies the rigidified line bundle itself. Biduality on abelian schemes and finite-flat Cartier biduality are tracked separately: after interchanging factors the intrinsic Weil pairings are inverse, not equal.
Signature boundary: The imported relative dual/Poincaré and polarization carriers, rigidified Picard quotient and intersection/type interfaces are not native pinned declarations. Native field End is used above where it suffices.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A2/polarization-representatives-and-graph (comparison): Polarization representatives and graph bundle
Exact mathematical signature: For the imported fibrewise-ample polarization λ, the rigidified line bundles L with φ_L=λ form a torsor under A∨. This describes the ambiguity of representatives without assuming a global L. The graph pullback M=(id,λ)*P is canonically rigidified, symmetric and relatively ample, with φ_M=2λ; if λ=φ_L then M≃[2]*L⊗L^−2 with the base normalization, and its class is 2[L] in NS. Symmetric representatives form a torsor under A∨[2], so they exist fppf locally and étale locally when 2 is invertible. The graph bundle itself needs no inversion of 2.
Signature boundary: The imported relative dual/Poincaré and polarization carriers, rigidified Picard quotient and intersection/type interfaces are not native pinned declarations. Native field End is used above where it suffices.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A2/polarization-type-and-pfaffian (theorem): Polarization type and Pfaffian comparison
Exact mathematical signature: For a polarized complex abelian variety (A,L), the integral alternating lattice form has elementary divisors d₁|⋯|d_g with d_i>0 and matrix [[0,D],[-D,0]] in a suitable basis. They determine the polarization type. Put d=∏d_i (empty product one); then h⁰(L)=d, deg_L(A)=g!d and deg λ=d². In an algebraic family over a connected base with polarization degree invertible, the prime-to-characteristic kernel and its symplectic type are locally constant. At primes dividing the degree use the finite-flat polarization kernel, not a constant étale elementary-divisor description.
Signature boundary: The imported relative dual/Poincaré and polarization carriers, rigidified Picard quotient and intersection/type interfaces are not native pinned declarations. Native field End is used above where it suffices.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A2/principal-quotient-and-spreading (theorem): Principal polarized quotients and spreading
Exact mathematical signature: Over an algebraically closed field an ample L admits an isogeny u:A→A₀ and a principal ample line L₀ with L≃u*L₀, of degree h⁰(L). Equivalently use a maximal isotropic subgroup for the theta commutator pairing and descend L through its compatible linearization. For a family over an integral noetherian normal base, a chosen geometric-generic principal isogeny spreads after a quasi-finite étale dominant base change and shrinking; this is a local generic statement, not a global principalization over every base.
Signature boundary: The imported relative dual/Poincaré and polarization carriers, rigidified Picard quotient and intersection/type interfaces are not native pinned declarations. Native field End is used above where it suffices.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A2/projective-presentation-over-normal-bases (theorem): Projective presentations over normal bases
Exact mathematical signature: An abelian scheme over a noetherian normal base is projective. Over a regular integral base, a symmetric ample line on the generic fibre has a positive tensor power extending to a symmetric rigidified relatively ample line bundle. For a smooth projective curve base this yields an absolutely projective total space. After tensoring by a sufficiently ample base line and taking a suitable positive power, it gives a projective presentation over S. On each field fibre L^n is very ample for n≥3, and its complete embedding is projectively normal for n≥3; using n≥4 gives the uniform interface needed by the routed height papers.
Signature boundary: The imported relative dual/Poincaré and polarization carriers, rigidified Picard quotient and intersection/type interfaces are not native pinned declarations. Native field End is used above where it suffices.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A2/rational-ns-and-ample-cone (theorem): Rational Néron–Severi and the ample cone
Exact mathematical signature: Over an algebraically closed field, φ induces NS(A)⊗Q≅Hom⁰(A,A∨)^sym, hence θ_λ([L])=λ^−1φ_L identifies rational NS with Rosati-fixed End⁰. This holds in characteristic two: the graph Poincaré line of a symmetric f has φ=2f, and rationalization divides by 2. LT’s half-normalized θ′=θ/2 is a separately named scalar adapter. An integral class is ample iff θ_λ is positive in the Rosati cone; on real scalar extension the cone is the product of positive-definite Hermitian matrix cones in the R,C,H factors of End⁰_R.
Signature boundary: The imported relative dual/Poincaré and polarization carriers, rigidified Picard quotient and intersection/type interfaces are not native pinned declarations. Native field End is used above where it suffices.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A2/raynaud-scheme-representability (theorem): Raynaud scheme representability
Exact mathematical signature: Over any scheme S, every abelian algebraic space (a smooth proper group algebraic space with geometrically connected fibres) is represented by a scheme. For an abelian scheme A/S the fppf relative Picard sheaf Pic_(A/S) is also represented by a scheme, locally of finite presentation, with Pic⁰ represented by its smooth proper identity component. Over affine S, any finite set of points of an abelian scheme lies in an affine open. No normality, reducedness, noetherianity, or globally chosen polarization is a hypothesis of these representability conclusions.
Signature boundary: The imported relative dual/Poincaré and polarization carriers, rigidified Picard quotient and intersection/type interfaces are not native pinned declarations. Native field End is used above where it suffices.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A2/rosati-involution (definition): The Rosati involution of a polarization
Exact mathematical signature: For a field abelian variety and polarization λ, Rosati is the Q-linear anti-involution α†=λ^−1 α∨ λ on End⁰ A. It fixes rational scalars, is involutive under the fixed biduality, and is the adjoint for the polarized rational Tate pairing with its cyclotomic target. For principal λ it preserves integral End A. Rational NS/symmetric-Hom comparison is a separate theorem, valid in every characteristic; no NS hypothesis is part of the definition.
Additional hypotheses: † depends on λ. For a principal polarization it preserves End(A); for general λ it preserves End⁰(A) only.; The source prints (αβ)† = β α without daggers; the author's errata page corrects this to β†α†.; The identification with NS(A) ⊗ ℚ uses the characterization of the φ_L as the homomorphisms with skew-symmetric e_ℓ pairing, which needs char k ≠ 2 and odd ℓ (Milne 13.6).
Signature boundary: The imported relative dual/Poincaré and polarization carriers, rigidified Picard quotient and intersection/type interfaces are not native pinned declarations. Native field End is used above where it suffices.
API `TauCeti.AlgebraicGeometry.AbelianVariety.Polarization.rosati`: Polarization.rosati (λ : Polarization A) : End⁰ A ≃ₗ[ℚ] (End⁰ A)ᵐᵒᵖ, α ↦ λ⁻¹ ∘ α^∨ ∘ λ.
API `TauCeti.AlgebraicGeometry.AbelianVariety.rosati_mul`: (α * β)† = β† * α†.
API `TauCeti.AlgebraicGeometry.AbelianVariety.rosati_rosati`: α†† = α.
API `TauCeti.AlgebraicGeometry.AbelianVariety.rosati_algebraMap`: (algebraMap ℚ _ a)† = algebraMap ℚ _ a.
API `TauCeti.AlgebraicGeometry.AbelianVariety.weilPairing_rosati`: e_ℓ^λ (α x) y = e_ℓ^λ x (α† y).
API `TauCeti.AlgebraicGeometry.AbelianVariety.rosati_principal_mem_End`: For λ principal, α ∈ End A → α† ∈ End A.
Test `TauCeti.AlgebraicGeometry.AbelianVariety.rosati_elliptic` (computation): For an elliptic curve with its principal polarization, α† is the dual isogeny and αα† = [deg α].
Test `TauCeti.AlgebraicGeometry.AbelianVariety.rosati_mulBy` (degenerate): [n]† = [n] for every polarization.
Test `TauCeti.AlgebraicGeometry.AbelianVariety.rosati_not_multiplicative` (non-example): † is not multiplicative: for a supersingular E over 𝔽̄_p and non-commuting α, β ∈ End(E), (αβ)† = β†α† ≠ α†β†.
Test `TauCeti.AlgebraicGeometry.AbelianVariety.rosati_product` (computation): On E × E with the product principal polarization, † is conjugate transpose on M_2(End⁰(E)).
-/
/-
Target AbelianSchemesAndArithmeticModuli:A3/dual-isogeny-and-cartier-kernel (theorem): Dual isogenies and Cartier-dual kernels
Exact mathematical signature: For an isogeny f:A→B with kernel H, f∨:B∨→A∨ is an isogeny with kernel canonically Hᴰ, preserving rank and base change. For n≠0 the Poincaré biextension gives e_n:A[n]×A∨[n]→μ_n, perfect in the finite-flat Cartier sense, natural for homomorphisms and compatible with n|m transition maps. The swapped bidual pairing is the inverse pairing under the fixed evaluation convention.
Signature boundary: The nonaffine relative abelian carrier, quotient, dual-isogeny and theta central-extension interfaces are not native pinned declarations. Native affine Cartier duality is imported and must be glued through the supplied arbitrary-base interface.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A3/genus-two-two-torsion (theorem): Genus-two Weierstrass differences
Exact mathematical signature: For a smooth genus-two curve in characteristic ≠2, its fifteen unordered differences of distinct geometric Weierstrass points give exactly the nonzero Jacobian 2-torsion. With the six-point permutation convention fixed, pairing of two such differences is (−1)^|{i,j}∩{k,l}|. This identifies Jac(C)[2] with the even-subset quotient of F₂⁶ by the all-ones line, equivariantly under S₆≅Sp₄(F₂).
Signature boundary: The nonaffine relative abelian carrier, quotient, dual-isogeny and theta central-extension interfaces are not native pinned declarations. Native affine Cartier duality is imported and must be glued through the supplied arbitrary-base interface.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density (theorem): Multiplication, torsion and prime-to-characteristic density
Exact mathematical signature: For n≠0, [n] on A/S of locally constant dimension g is finite locally free of rank |n|^(2g). On a positive-dimensional component it is étale iff n is a unit on that component; on a dimension-zero component it is always the identity. Over an algebraically closed field, the union of prime-to-characteristic torsion is Zariski dense.
Signature boundary: The nonaffine relative abelian carrier, quotient, dual-isogeny and theta central-extension interfaces are not native pinned declarations. Native affine Cartier duality is imported and must be glued through the supplied arbitrary-base interface.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A3/nonaffine-abelian-quotient (construction): Finite-flat abelian quotients
Exact mathematical signature: For an abelian scheme A/S and a finite locally free closed subgroup H, the fppf sheaf quotient A/H is represented by an abelian scheme B/S. The quotient q is an H-torsor and isogeny of rank rk H, commutes with arbitrary base change and is initial among homomorphisms killing H. No affine hypothesis on A is used.
Signature boundary: The nonaffine relative abelian carrier, quotient, dual-isogeny and theta central-extension interfaces are not native pinned declarations. Native affine Cartier duality is imported and must be glued through the supplied arbitrary-base interface.
API `AbelianQuotient.mk`: Construct A/H and its quotient isogeny.
API `AbelianQuotient.desc`: Descend a map killing H uniquely.
API `AbelianQuotient.baseChange`: (A/H)_T≅A_T/H_T, respecting quotient maps.
API `AbelianQuotient.kernel_rank`: The kernel is H and the quotient rank is rk H.
Test `AbelianQuotient.zero` (degenerate): A/0≅A with identity quotient map.
Test `AbelianQuotient.full_torsion` (computation): E/E[2]≅E with quotient [2], of rank four.
Test `AbelianQuotient.local_kernel` (non-example): For supersingular E, quotient by the connected Frobenius kernel has rank p and does not equal quotient by its trivial geometric point group.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing (theorem): Polarized torsion pairings
Exact mathematical signature: For a polarization λ:A→A∨ put e_(λ,n)(x,y)=e_n(x,λy). It is alternating, including at n even, and is perfect iff λ induces an isomorphism on A[n] (equivalently ker λ has no n-primary part fibrewise). In particular gcd(n,deg λ)=1 suffices. Isogeny pullbacks obey e_(f∨μf,n)(x,y)=e_(μ,n)(fx,fy).
Signature boundary: The nonaffine relative abelian carrier, quotient, dual-isogeny and theta central-extension interfaces are not native pinned declarations. Native affine Cartier duality is imported and must be glued through the supplied arbitrary-base interface.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A3/relative-isogeny (definition): Relative isogenies
Exact mathematical signature: An isogeny A→B over S is a group homomorphism whose scheme map is finite locally free and surjective. Its kernel is finite locally free; the map is an fppf torsor under that kernel, and its rank equals the kernel rank. This definition agrees with native IsIsogeny over fields. Ranks are locally constant, multiply under composition and survive arbitrary base change.
Signature boundary: The nonaffine relative abelian carrier, quotient, dual-isogeny and theta central-extension interfaces are not native pinned declarations. Native affine Cartier duality is imported and must be glued through the supplied arbitrary-base interface.
API `RelativeIsogeny.kernel`: Return the finite locally free kernel with its inclusion.
API `RelativeIsogeny.quotient`: For any group target C, maps B→C correspond to maps A→C killing the kernel.
API `RelativeIsogeny.baseChange`: Pull back the isogeny and kernel along any T→S.
API `RelativeIsogeny.comp_rank`: The rank of a composite is the product of ranks.
API `RelativeIsogeny.field_iff`: Over Spec k agree with native AbelianVariety.IsIsogeny.
Test `RelativeIsogeny.identity` (degenerate): The identity isogeny has kernel zero and rank one.
Test `RelativeIsogeny.elliptic_two` (computation): [2] on an elliptic scheme has rank four.
Test `RelativeIsogeny.inclusion` (non-example): E→E×E in the first factor is not an isogeny.
Test `RelativeIsogeny.nonreduced_kernel` (non-example): [p] on a supersingular elliptic curve in characteristic p has rank p², not the number of geometric kernel points.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A3/theta-group (construction): Theta groups and polarized descent
Exact mathematical signature: For a rigidified line L on an abelian variety, let K(L)=ker φ_L and let G(L)(T) consist of pairs (x, t_x*L_T≅L_T); composition forms a central extension 1→G_m→G(L)→K(L)→1. Its commutator is a perfect strongly alternating pairing when L is ample. A subgroup H⊂K(L) admits descent of L to A/H exactly after choosing a compatible splitting of the theta extension over H; isotropy alone is not a chosen linearization.
Signature boundary: The nonaffine relative abelian carrier, quotient, dual-isogeny and theta central-extension interfaces are not native pinned declarations. Native affine Cartier duality is imported and must be glued through the supplied arbitrary-base interface.
API `ThetaGroup.mk`: Form the central extension with the translation-isomorphism data.
API `ThetaGroup.commutator`: Return the strongly alternating K(L)-pairing.
API `ThetaGroup.descend`: A splitting on H gives the descended line on A/H.
API `ThetaGroup.baseChange`: Pull back the extension, splitting and descended line together.
Test `ThetaGroup.trivial` (degenerate): For L=O_A, K(L)=A and the extension splits, but K(L) is not finite when g>0.
Test `ThetaGroup.elliptic_degree_two` (computation): For a degree-two line on E, K(L)=E[2] of rank four.
Test `ThetaGroup.diagonal` (non-example): A skew self-duality of a characteristic-two finite group is not sufficient data for a strongly alternating theta commutator.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A3/torsion-divisibility (theorem): Torsion detects divisibility and integrality
Exact mathematical signature: For n≠0, a homomorphism f:A→B factors uniquely as [n]_B∘h iff it kills A[n] as a group scheme. Hom(A,B) is torsion free. For q=f/n in Hom⊗Q, integrality is equivalent to this finite-flat kernel condition. For ℓ invertible the condition for ℓ^r is equivalently divisibility of the induced integral Tate-module map by ℓ^r. No criterion using only prime-to-characteristic realizations detects p-denominators in characteristic p.
Signature boundary: The nonaffine relative abelian carrier, quotient, dual-isogeny and theta central-extension interfaces are not native pinned declarations. Native affine Cartier duality is imported and must be glued through the supplied arbitrary-base interface.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A4/abelian-h1-de-rham (construction): Relative first de Rham cohomology
Exact mathematical signature: For π:A→S, H¹_dR(A/S)=R¹π_*(Ω•_(A/S)) is locally free of rank 2g, commutes with arbitrary base change and has the natural exact sequence 0→ω_A→H¹_dR→Lie(A∨)→0, with ω_A=π_*Ω¹_(A/S). Over a smooth base S/k it carries the integrable Gauss–Manin k-connection; its filtration obeys Griffiths transversality. Duality and polarizations give the contravariant perfect first-cohomology pairing, retaining the inverse Tate twist in cohomological realizations.
Signature boundary: The abelian Tate local system, BT tower, relative de Rham hypercohomology, PD evaluation and structured deformation categories have no native pinned declarations. Their full mathematical conditions are retained here; no arbitrary proposition replaces them.
API `AbelianH1dR.mk`: Construct the rank-2g bundle from degree-one de Rham hypercohomology.
API `AbelianH1dR.hodgeSequence`: Expose the invariant-form subbundle and Lie(A∨) quotient.
API `AbelianH1dR.baseChange`: Transport the filtered bundle through every T→S.
API `AbelianH1dR.pullback`: A homomorphism A→B induces H¹_dR(B)→H¹_dR(A).
API `AbelianH1dR.connection`: On smooth S/k expose the integrable Gauss–Manin connection and horizontal pullbacks.
Test `AbelianH1dR.elliptic` (computation): For an elliptic curve H¹_dR has rank two and Fil¹ rank one.
Test `AbelianH1dR.zero` (degenerate): Dimension zero gives the zero bundle and zero connection.
Test `AbelianH1dR.inseparable` (non-example): In characteristic p, [p]* on H¹_dR is zero although [p] is an isogeny of nonzero degree.
Test `AbelianH1dR.product` (compatibility): H¹_dR(A×B)≅H¹_dR(A)⊕H¹_dR(B), with both filtrations and connections.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A4/all-degree-exterior-cohomology (theorem): Exterior cohomology of abelian schemes
Exact mathematical signature: For every abelian scheme π:A→S, R^iπ_*Ω^j and H^n_dR are finite locally free and commute with arbitrary base change. Cup products identify R^iπ_*Ω^j≅∧^i R¹π_*O⊗∧^j π_*Ω¹ and H^n_dR≅∧^n H¹_dR, compatibly with products and pullbacks; the Hodge spectral sequence degenerates. Exterior means squares vanish also in characteristic two. Over an algebraically closed field of characteristic zero, H*_et(A,F_p) is the exterior algebra on H¹_et, for every prime p.
Signature boundary: The abelian Tate local system, BT tower, relative de Rham hypercohomology, PD evaluation and structured deformation categories have no native pinned declarations. Their full mathematical conditions are retained here; no arbitrary proposition replaces them.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A4/etale-tate-module (construction): Integral prime-to-characteristic Tate modules
Exact mathematical signature: For ℓ prime and invertible on S, T_ℓ A is the inverse system of étale sheaves A[ℓ^r] with [ℓ] transition maps, a locally free Z_ℓ local system of rank 2g on each dimension component. At a geometric point it is lim A[ℓ^r](sbar), with its continuous π₁-action; V_ℓ=T_ℓ⊗Q_ℓ. Preserve group maps, products, arbitrary base change and T_ℓ A/ℓ^r≅A[ℓ^r]. The dual Weil pairing lands in Z_ℓ(1)=lim μ_(ℓ^r), not Z_ℓ.
Signature boundary: The abelian Tate local system, BT tower, relative de Rham hypercohomology, PD evaluation and structured deformation categories have no native pinned declarations. Their full mathematical conditions are retained here; no arbitrary proposition replaces them.
API `AbelianTate.mk`: Build the integral local system from the torsion inverse system.
API `AbelianTate.modPow`: T_ℓ/ℓ^r≅A[ℓ^r], compatible with transitions.
API `AbelianTate.map`: Homomorphisms induce continuous linear maps respecting composition and addition.
API `AbelianTate.baseChange`: Pullback commutes with torsion and the inverse system.
API `AbelianTate.dualPairing`: Identify T_ℓ(A∨) with Hom_Zℓ(T_ℓ A,Z_ℓ(1)).
Test `AbelianTate.zero` (degenerate): The zero-dimensional abelian scheme has the zero Tate module.
Test `AbelianTate.elliptic_rank` (computation): For complex E, T₃ E≅Z₃² and E[3]≅F₃².
Test `AbelianTate.characteristic_prime` (non-example): For supersingular E in characteristic p, lim E[p^r](kbar)=0 and is not its rank-two prime-to-characteristic Tate module.
Test `AbelianTate.twist` (compatibility): The determinant character for an elliptic polarization is the cyclotomic character, with μ_(ℓ^r) finite targets.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A4/genus-two-jacobian-lifting (theorem): Genus-two Jacobian lift comparison
Exact mathematical signature: In the odd-prime situation above, if A₀ is the principally polarized Jacobian of a smooth genus-two curve C₀, a principally polarized abelian lift is the Jacobian of a unique formal curve lift, effective over O. Here 2 is invertible, and the tangent map dual is Sym² H⁰(C₀,ω)→H⁰(C₀,ω²), an isomorphism of three-dimensional spaces.
Signature boundary: The abelian Tate local system, BT tower, relative de Rham hypercohomology, PD evaluation and structured deformation categories have no native pinned declarations. Their full mathematical conditions are retained here; no arbitrary proposition replaces them.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A4/grothendieck-messing (theorem): Grothendieck–Messing for abelian schemes
Exact mathematical signature: Under A4/pd-first-cohomology hypotheses, abelian lifts of A₀/S₀ are equivalent to rank-g locally direct summand lifts of Fil¹⊂D(A₀)_(S₀) in D(A₀)_S. Morphisms lift iff their contravariant evaluations preserve the lifted summands. A polarization lifts iff the summand is isotropic for its pairing; for principal polarization it is Lagrangian. Endomorphism structures lift by simultaneous stability conditions. No statement for an arbitrary nonnilpotent thickening is intended.
Signature boundary: The abelian Tate local system, BT tower, relative de Rham hypercohomology, PD evaluation and structured deformation categories have no native pinned declarations. Their full mathematical conditions are retained here; no arbitrary proposition replaces them.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A4/odd-prime-finite-level-lifting (theorem): Odd-prime polarized finite-level lifting
Exact mathematical signature: Let p>2, O the integers in a finite extension of Q_p, and A₀ a principally polarized abelian surface over its residue field. Given a finite flat group G₁ killed by p, of order p⁴, with a principally quasi-polarized structure and a compatible identification G₁,k≅A₀[p], there is a principally polarized lift A/O with A[p]≅G₁. The finite group has order p⁴, not rank four.
Signature boundary: The abelian Tate local system, BT tower, relative de Rham hypercohomology, PD evaluation and structured deformation categories have no native pinned declarations. Their full mathematical conditions are retained here; no arbitrary proposition replaces them.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A4/ordinary-dyadic-finite-level-lifting (theorem): Ordinary dyadic finite-level lifting
Exact mathematical signature: Let O be the integers of a finite extension of Q₂ and A₀/k a principally polarized ordinary abelian surface. Let G₁/O be killed by 2, finite flat of order 16, with a Cartier self-duality λ satisfying λ∨=−λ and G₁,k≅A₀[2]. Then there is a principally polarized lift A/O with A[2]≅G₁. This conclusion specifies the underlying torsion identification; it does not assert that every prescribed λ lifts as the chosen principal polarization. Strong alternation and skew self-duality remain distinct notions.
Signature boundary: The abelian Tate local system, BT tower, relative de Rham hypercohomology, PD evaluation and structured deformation categories have no native pinned declarations. Their full mathematical conditions are retained here; no arbitrary proposition replaces them.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A4/ordinary-frobenius-and-weighted-polarization (theorem): Canonical Frobenius and nonprincipal ordinary equations
Exact mathematical signature: The quotient of an ordinary deformation by its canonical multiplicative p-torsion subgroup has q parameters q^p after the Frobenius identifications of the special fibre; the canonical lift has q=1. For any prescribed λ₀ between ordinary special fibres its lift condition is q(x,λ₀y)=q(y,λ₀x). In bases write this as the integral weighted symmetry equation for the matrix of λ₀; do not divide by p. In genus two paramodular degree-p coordinates this yields the pattern (X,pZ;Z,Y) in additive/linearized coordinates, rather than unrestricted symmetric coordinates.
Signature boundary: The abelian Tate local system, BT tower, relative de Rham hypercohomology, PD evaluation and structured deformation categories have no native pinned declarations. Their full mathematical conditions are retained here; no arbitrary proposition replaces them.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A4/ordinary-serre-tate-coordinates (construction): Ordinary Serre–Tate coordinates
Exact mathematical signature: For ordinary A₀ over perfect k, work over kbar with descent, or fix trivializations of the étale part and its multiplicative dual. For local Artin W(k)-algebras R, deformations are bilinear maps q:T_p(A₀^et)×T_p((A₀∨)^et)→1+m_R, with group law multiplication. The identity q=1 is the canonical lift. A homomorphism f lifts iff q_A(x,f∨y)=q_B(fx,y). A principal λ₀ lifts iff q(x,λ₀y)=q(y,λ₀x), giving a formal torus of rank g(g+1)/2; the unpolarized rank is g². Its character lattice is the symmetric quotient of the two identified rank-g étale lattices, not the full rank-2g prime-to-p Tate module.
Signature boundary: The abelian Tate local system, BT tower, relative de Rham hypercohomology, PD evaluation and structured deformation categories have no native pinned declarations. Their full mathematical conditions are retained here; no arbitrary proposition replaces them.
API `SerreTate.q`: Return the bilinear extension pairing of a deformation.
API `SerreTate.fromPairing`: Recover the deformation from its q pairing.
API `SerreTate.homCriterion`: A special-fibre homomorphism lifts exactly when its two q pullbacks agree.
API `SerreTate.polarized`: Principal polarization is exactly symmetry after λ₀ identifies the étale lattices.
API `SerreTate.descent`: Coordinate changes and perfect-field descent act on both arguments.
Test `SerreTate.elliptic_one` (computation): An ordinary elliptic deformation has one parameter q∈1+m_R.
Test `SerreTate.surface_three` (computation): A principally polarized ordinary surface has q₁₂=q₂₁ and three parameters.
Test `SerreTate.canonical` (degenerate): q=1 corresponds to the split extension and canonical lift.
Test `SerreTate.supersingular` (non-example): A supersingular elliptic deformation is not classified by an ordinary rank-one étale q pairing.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A4/p-divisible-group (definition): Minimal Barsotti–Tate interface
Exact mathematical signature: A p-divisible group G/S of locally constant height h is a compatible inductive system G_r of finite locally free commutative groups, rk G_r=p^(rh), with exact 0→G_r→G_(r+s)→G_s→0 under [p^r]. Its Tate sheaf is not its group of geometric p-power points in characteristic p. Include morphisms, Cartier duals and connected–étale sequences over perfect fields and complete henselian local bases where the connected part is finite flat at each level. A[p∞] has height 2g.
Signature boundary: The abelian Tate local system, BT tower, relative de Rham hypercohomology, PD evaluation and structured deformation categories have no native pinned declarations. Their full mathematical conditions are retained here; no arbitrary proposition replaces them.
API `AbelianBT.ofAbelian`: Form A[p∞] with its height and finite-level maps.
API `AbelianBT.truncation`: Return G[p^r] of rank p^(rh).
API `AbelianBT.dual`: Dualize finite levels and recover biduality.
API `AbelianBT.baseChange`: Pull back all finite levels, exact sequences and duals.
API `AbelianBT.connectedEtale`: Return the connected–étale exact sequence only under the specified henselian/perfect hypotheses.
Test `AbelianBT.ordinary_elliptic` (computation): Over kbar an ordinary E gives μ_(p∞)⊕Q_p/Z_p, height two and étale height one.
Test `AbelianBT.supersingular` (non-example): A supersingular elliptic BT group has height two and no nonzero étale geometric Tate module.
Test `AbelianBT.zero` (degenerate): Dimension zero gives height zero and trivial finite levels.
Test `AbelianBT.finite_dual` (compatibility): The dual of μ_(p^r) is Z/p^r, agreeing with native finite-flat Cartier duality.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A4/pd-first-cohomology (construction): Degree-one PD realization
Exact mathematical signature: For a PD thickening S₀→S with p locally nilpotent, quasi-coherent defining ideal J and locally PD-nilpotent divided powers, attach to A₀/S₀ a functorial locally free rank-2g evaluation D(A₀)_S. For any abelian lift A/S it identifies with H¹_dR(A/S), with its lifted Hodge rank-g direct summand. The PD evaluation is independent of the lift and compatible with morphisms, pullback of PD thickenings and duality. Over perfect k its W(k)-realization uses the contravariant cohomology convention; this does not assert a general crystalline site or Dieudonné equivalence.
Signature boundary: The abelian Tate local system, BT tower, relative de Rham hypercohomology, PD evaluation and structured deformation categories have no native pinned declarations. Their full mathematical conditions are retained here; no arbitrary proposition replaces them.
API `AbelianPD.evaluate`: Construct D(A₀)_S for the stated PD thickening.
API `AbelianPD.liftComparison`: Identify D(A₀)_S with H¹_dR of a chosen lift.
API `AbelianPD.pullback`: Commute with PD base change and composition.
API `AbelianPD.dual`: Identify the contravariant dual realization and its evaluation pairing.
Test `AbelianPD.identity` (degenerate): For J=0 recover H¹_dR with its usual Hodge summand.
Test `AbelianPD.elliptic_ranks` (computation): For an elliptic special fibre rank D=2 and a lift has a rank-one Hodge summand.
Test `AbelianPD.pd_boundary` (non-example): Ordinary ideal nilpotence alone is not sufficient for the evaluation/lifting equivalence.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A4/polarized-effectivity (theorem): Effectivity of polarized formal lifts
Exact mathematical signature: Over a complete noetherian local ring R, a compatible system of polarized abelian lifts over R/m^n, together with a compatible relatively ample line after finite faithfully flat extension if necessary, is effective as a polarized abelian scheme over R. Morphisms and finite-flat torsion algebraize uniquely; the descended polarization does not require a global chosen line on the original base.
Signature boundary: The abelian Tate local system, BT tower, relative de Rham hypercohomology, PD evaluation and structured deformation categories have no native pinned declarations. Their full mathematical conditions are retained here; no arbitrary proposition replaces them.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A4/realization-conventions (theorem): Degree-one dual and twist comparisons
Exact mathematical signature: For a polarized abelian variety over a field and ℓ prime to the characteristic and polarization degree, H¹_et(A_kbar,Q_ℓ)=V_ℓ(A)*. The polarization identifies V_ℓ(A)≅H¹_et(A,Q_ℓ)(1); the cohomological multiplier is χ_ℓ^−1. Over C, H₁=Λ, H¹=Λ*, and de Rham comparison carries invariant forms to Fil¹ in cohomological weight one. Hodge–Tate/Sen weight conventions are exported to their higher-tier consumer, not proved from this complex comparison.
Signature boundary: The abelian Tate local system, BT tower, relative de Rham hypercohomology, PD evaluation and structured deformation categories have no native pinned declarations. Their full mathematical conditions are retained here; no arbitrary proposition replaces them.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A4/serre-tate-equivalence (theorem): Serre–Tate equivalence with structures
Exact mathematical signature: For affine S=Spec R where p is nilpotent, a nilpotent ideal I and R₀=R/I, the category of abelian schemes over R is equivalent to pairs (A₀/R₀,G/R, G_(R₀)≅A₀[p∞]). Morphisms are compatible pairs of abelian and BT homomorphisms. The equivalence respects duality, polarizations and specified endomorphisms; a polarization must reduce to the fixed special-fibre polarization. Extend to local Artin W(k)-algebras by the same equivalence, and to complete local noetherian bases as formal systems, with algebraic effectivity proved separately.
Signature boundary: The abelian Tate local system, BT tower, relative de Rham hypercohomology, PD evaluation and structured deformation categories have no native pinned declarations. Their full mathematical conditions are retained here; no arbitrary proposition replaces them.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A5/analytic-families-and-comparison (theorem): Analytic polarized families and algebraic comparison
Exact mathematical signature: Over a complex analytic base T, proper smooth analytic group families with a locally constant integral polarization type correspond to polarized integral homological variations of the above types. Construct the family as the quotient of its holomorphic Lie bundle by the locally constant lattice, and recover its zero and group law. For an algebraic abelian scheme over a finite-type complex base, analytification gives this variation, with H¹_dR⊗O_an≅H¹_B⊗O_an and its Hodge filtration and connection under the smooth-base hypothesis. No converse algebraization over an algebraic base is asserted.
Signature boundary: The complex abelian analytification, standard integral torus lattice, homological integral polarized Hodge carrier and analytic family/period quotient are not native pinned declarations. The expressible real Riemann-form signature above uses actual native bilinear maps, complex structures and full lattices.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A5/appell-humbert-and-algebraicity (theorem): Appell–Humbert and algebraicity
Exact mathematical signature: Holomorphic line classes on V/Λ are uniquely described by a Hermitian H with integral imaginary part E and a unitary semicharacter α with α(λ+μ)=(−1)^E(λ,μ)α(λ)α(μ). The factors j_λ(z)=α(λ)exp(πH(z,λ)+πH(λ,λ)/2) construct the line. Positive H gives an ample line, and its third and higher powers embed the torus. A complex torus is algebraizable iff it admits a positive Riemann form; Chow and proper GAGA then algebraize its group law. The Riemann form is its c₁ and determines φ_L.
Signature boundary: The complex abelian analytification, standard integral torus lattice, homological integral polarized Hodge carrier and analytic family/period quotient are not native pinned declarations. The expressible real Riemann-form signature above uses actual native bilinear maps, complex structures and full lattices.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A5/complex-lattice-realization (construction): Complex lattice realization
Exact mathematical signature: For a complex abelian variety A, its analytic exponential identifies A^an with V/Λ, where V=T₀(A^an) and Λ=ker exp is a full Z-lattice of rank 2g. Identify Λ naturally with H₁(A^an,Z) and T_ℓ A with Λ⊗Z_ℓ. A holomorphic homomorphism is exactly a complex-linear map V→W carrying Λ into Γ. Use existing real-lattice and manifold carriers; no second definition of a Z-lattice or smooth manifold is introduced.
Signature boundary: The complex abelian analytification, standard integral torus lattice, homological integral polarized Hodge carrier and analytic family/period quotient are not native pinned declarations. The expressible real Riemann-form signature above uses actual native bilinear maps, complex structures and full lattices.
API `AbelianLattice.ofAbelian`: Return V, Λ and the analytic exponential quotient isomorphism.
API `AbelianLattice.homology`: Identify Λ with integral H₁ naturally.
API `AbelianLattice.map`: Differentiate a homomorphism and preserve its lattice.
API `AbelianLattice.tate`: Identify Λ⊗Z_ℓ with the integral Tate module.
Test `AbelianLattice.elliptic` (computation): For C/(Z+iZ), Λ is Z², not a rank-one complex lattice.
Test `AbelianLattice.zero` (degenerate): Dimension zero gives V=0 and Λ=0.
Test `AbelianLattice.irrational_map` (non-example): Multiplication by √2 on C does not descend to C/(Z+iZ).
-/
/-
Target AbelianSchemesAndArithmeticModuli:A5/polarized-hodge-equivalence (theorem): Polarized integral Hodge equivalence
Exact mathematical signature: Analytification and H₁ give an equivalence between complex abelian varieties with polarizations and polarizable free finite integral Hodge structures of types (−1,0),(0,−1), with integral alternating positive forms. Morphisms are group homomorphisms/integral Hodge maps, with pullback condition when polarization preservation is requested. Principal objects correspond to unimodular forms. On cohomology the equivalence is contravariant and has types (1,0),(0,1): Hom(A,B)≅Hom_HS(H¹(B,Z),H¹(A,Z)).
Signature boundary: The complex abelian analytification, standard integral torus lattice, homological integral polarized Hodge carrier and analytic family/period quotient are not native pinned declarations. The expressible real Riemann-form signature above uses actual native bilinear maps, complex structures and full lattices.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A5/riemann-form (definition): Riemann forms and polarization sign
Exact mathematical signature: For V with complex structure J and full lattice Λ, a Riemann form is an integral alternating form E:Λ×Λ→Z whose real extension satisfies E(Jv,Jw)=E(v,w) and E(Jv,v)>0 for v≠0. Its Hermitian form, linear in the first variable, is H(v,w)=E(Jv,w)+iE(v,w). Its degree/type uses the integral elementary divisors; unimodularity is an additional principal-polarization condition. The associated homological polarization has weight −1 and types (−1,0),(0,−1).
Signature boundary: The native RiemannForm structure, Hermitian formula, pullback, integral pairing, principal predicate, zero-dimensional and negative tests appear above. A constructed Gaussian lattice/polarized torus and the weight-minus-one integral Hodge-duality adapter are unavailable pinned signatures.
API `RiemannForm.hermitian`: Recover H=E(J·,·)+iE.
API `RiemannForm.integral`: The restriction to Λ has integer values and E(x,x)=0.
API `RiemannForm.pullback`: Pull back along an injective complex-linear lattice map.
API `RiemannForm.isPrincipal`: The induced Λ→Λ* is an isomorphism exactly for unimodular E.
API `RiemannForm.hodgeDual`: Dualizing the homological structure gives the existing weight-one cohomological Hodge structure.
Test `RiemannForm.gaussian` (computation): On Z+iZ with standard H, E(i,1)=1 and E(1,i)=−1.
Test `RiemannForm.double` (non-example): 2E is positive integral but has lattice cokernel (Z/2)², hence is not principal.
Test `RiemannForm.zero_dimension` (degenerate): On V=0 positivity is vacuous and the zero pairing is unimodular.
Test `RiemannForm.negative` (non-example): −E on a positive-dimensional torus fails E(Jv,v)>0.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A5/siegel-analytic-family (construction): Siegel universal analytic family
Exact mathematical signature: For H_g={Ω∈M_g(C):Ωᵀ=Ω, Im Ω positive definite}, define X_Ω=C^g/(Z^g+ΩZ^g) and the family (C^g×H_g)/Z^(2g). The standard unimodular alternating lattice form gives its principal polarization. Sp_(2g)(Z) acts by Ω↦(AΩ+B)(CΩ+D)^−1 and z↦(CΩ+D)^−T z in the column convention for this lattice. Integral monodromy is the lattice action. Full level N is a symplectic lattice trivialization modulo N with its μ_N target; N≥3 removes stabilizers. Nonprincipal types use their actual lattice automorphism groups.
Signature boundary: The complex abelian analytification, standard integral torus lattice, homological integral polarized Hodge carrier and analytic family/period quotient are not native pinned declarations. The expressible real Riemann-form signature above uses actual native bilinear maps, complex structures and full lattices.
API `SiegelFamily.fibre`: Identify the fibre with C^g/(Z^g+ΩZ^g).
API `SiegelFamily.polarization`: Return the unimodular positive form on the universal lattice.
API `SiegelFamily.symplecticAction`: Give the compatible period, lattice and fibre action.
API `SiegelFamily.level`: Identify N-torsion with the lattice modulo N and retain μ_N.
Test `SiegelFamily.genus_one` (compatibility): For g=1 recover the standard elliptic period quotient and dz.
Test `SiegelFamily.genus_zero` (degenerate): H₀ and the fibre are points with trivial lattices.
Test `SiegelFamily.bad_period` (non-example): A symmetric matrix with singular Im Ω does not give a compact polarized torus.
Test `SiegelFamily.level_two` (non-example): At level two −1 acts trivially on torsion and remains a stabilizer.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/abelian-torsor-twist (construction): Twists up to localized isogeny
Exact mathematical signature: Let Z/D be flat affine of finite type, P a Z-torsor trivialized over a finite integral torsion-free D-algebra D′, and Z act on A in the D-isogeny category. Define A^P(T)=(A(T)⊗D O_P)^Z as the contracted descent object in the localized category. It is represented up to D-isogeny by an abelian scheme over S, independently of a trivialization. The notation describes coefficient descent of the additive sheaf; it is not a literal tensor product of schemes.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
API `AbelianTwist.mk`: Construct the localized descent object and a representing abelian scheme.
API `AbelianTwist.trivial`: A chosen section of P identifies the twist with A.
API `AbelianTwist.baseChange`: Pullback of S and of the torsor commutes with twisting.
API `AbelianTwist.dual`: The dual twist uses the contragredient torsor action.
Test `AbelianTwist.trivial_torsor` (degenerate): For P=Z, A^P≅A in the D-isogeny category.
Test `AbelianTwist.quadratic` (compatibility): For D=Z and Z={±1}, the construction agrees with the ordinary quadratic twist.
Test `AbelianTwist.coefficients` (non-example): A torsor of coefficient automorphisms is not a torsor changing the base field of the abelian scheme.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/automorphisms-of-polarized-abelian-varieties (comparison): Automorphism groups of polarized abelian varieties are finite, and rigid at level n ≥ 3 prime to p
Exact mathematical signature: Supply the arithmetic proof and field compatibility of the already-owned R09.4 polarized-automorphism theorem: Aut(A,λ) is finite, and its action on A[n] is faithful for n≥3 prime to char k. Relative representability/unramifiedness is imported from R09.4; do not construct a second automorphism functor.
Additional hypotheses: (ii) needs char k ∤ n, or trivial action on the finite group scheme A[n]. The source states it for all n ≥ 3 with trivial action on A_n(k^al), which is false when char k divides n: a supersingular elliptic curve E over 𝔽̄_2 has E[4](k̄) = 0 and 24 automorphisms, all preserving the principal polarization (recorded in sourceIssues).; In the source's proof of (a), the compact set is {α ∈ End(A) ⊗ ℝ : Tr(αα†) = 2g}, not End(A) ⊗ ℝ (sourceIssues).; In the source's proof of (b), the contradiction needs β†β to be nilpotent. This holds because β and β† commute, since α† = α⁻¹ (sourceIssues).
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-of-an-endomorphism (definition): The characteristic polynomial and trace of an endomorphism
Exact mathematical signature: For α∈End A there is a unique monic P_α∈Z[X] of degree 2g with P_α(r)=deg(α−[r]) for all r∈Z. For g>0 Tr α is minus the coefficient of X^(2g−1); for g=0 set Tr α=0 and P_α=1. On End⁰ A put P_(α/n)(X)=n^(−2g)P_α(nX)∈Q[X]. It is monic, denominator-independent and Tr is Q-linear; its constant coefficient is deg α.
Additional hypotheses: Uniqueness holds because a polynomial is determined by its values on ℤ (infinitely many points).; Integrality of the coefficients for α ∈ End(A) uses an ample symmetric divisor D, with (2)^*D ≡ 4D.; P_α is not the minimal polynomial of α in End⁰(A): for α = [n] it is (X − n)^{2g}.
Signature boundary: Native integral characteristic polynomial, trace and scalar tests appear above. The Frobenius test requires the missing native Frobenius endomorphism adapter; the rational rescaling API is recorded in this exact target statement.
API `TauCeti.AlgebraicGeometry.AbelianVariety.End.charpoly`: End.charpoly (α : End A) : ℤ[X], monic of degree 2g.
API `TauCeti.AlgebraicGeometry.AbelianVariety.End.charpoly_eval`: (End.charpoly α).eval r = Hom.deg (α − r) for r : ℤ.
API `TauCeti.AlgebraicGeometry.AbelianVariety.End.charpoly_monic`: (End.charpoly α).Monic ∧ (End.charpoly α).natDegree = 2 * g.
API `TauCeti.AlgebraicGeometry.AbelianVariety.End.trace`: End.trace α is minus coeff(2g−1) when g>0, and zero when g=0.
API `TauCeti.AlgebraicGeometry.AbelianVariety.End.charpoly_coeff_zero`: (End.charpoly α).coeff 0 = Hom.deg α.
API `TauCeti.AlgebraicGeometry.AbelianVariety.End.trace_add`: End.trace (α + β) = End.trace α + End.trace β.
Test `TauCeti.AlgebraicGeometry.AbelianVariety.charpoly_mulBy` (computation): End.charpoly (mulBy A n) = (X − n)^{2g}.
Test `TauCeti.AlgebraicGeometry.AbelianVariety.charpoly_zero` (degenerate): End.charpoly 0 = X^{2g}, since deg(−r) = r^{2g}.
Test `TauCeti.AlgebraicGeometry.AbelianVariety.charpoly_frobenius_elliptic` (computation): For an elliptic curve over 𝔽_q with trace of Frobenius a: End.charpoly π = X² − aX + q.
Test `TauCeti.AlgebraicGeometry.AbelianVariety.charpoly_ne_minpoly` (non-example): For g>0 the minimal polynomial of [n] is X−n whereas P_[n]=(X−n)^(2g); for g=0 P=1 and trace=0.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module (theorem): P_α is the characteristic polynomial of α on V_ℓA, for every ℓ ≠ char k
Exact mathematical signature: Let A be an abelian variety over a field k, α ∈ End(A), and ℓ ≠ char k. Then P_α(X) = det(X − V_ℓα | V_ℓA), where V_ℓA = T_ℓA ⊗ ℚ_ℓ. Hence Tr α and deg α are the trace and determinant of α on V_ℓA, and the characteristic polynomial of V_ℓα has integer coefficients independent of ℓ. The same holds for α ∈ End⁰(A) with rational coefficients.
Additional hypotheses: ℓ ≠ char k. For ℓ = p the p-adic Tate module has rank less than 2g in general, and the statement fails.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/cm-isotypic-boundary (theorem): CM isotypic comparison
Exact mathematical signature: For a complex CM abelian variety, complete reducibility gives a product of powers of pairwise nonisogenous simple CM factors, whose rational endomorphism fields are CM fields; its rational End is the product of the corresponding matrix algebras. Multiplicities and nonisogenous CM types must remain visible: equality of CM fields alone does not identify the simple factors. This is a complex/characteristic-zero CM specialization, not a claim for reductions with enlarged endomorphism rings.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/coefficient-hom-and-units (construction): Coefficient Hom, quasi-isogenies and unit schemes
Exact mathematical signature: For field abelian varieties define Hom⁰(A,B)=Q⊗Z Hom(A,B), End⁰(A)=Hom⁰(A,A). For a commutative Q-algebra R use R⊗Q Hom⁰, with bilinear composition and two-sided inverses defining R-isogenies. The Hom functor is the affine Q-space Spec Sym(Hom⁰*); End⁰ units are the determinant-open locus for left multiplication, forming Aut_Q(A). R changes coefficients, not the geometric base field of A.
Signature boundary: The native tensor carrier, bilinear composition, coefficient map, unit group and nilpotent-coefficient inverse test appear above. The represented affine Hom scheme and its point equivalence require the missing affine coefficient-functor interface.
API `CoefficientHom.points`: Hom_Q(A,B)(R)≅R⊗Q Hom⁰(A,B).
API `CoefficientHom.comp`: Composition is bilinear and compatible with coefficient maps.
API `CoefficientHom.units`: Aut_Q(A)(R) is the two-sided unit group of R⊗End⁰(A).
API `CoefficientHom.baseChange`: R→R′ extends coefficients and preserves identities and inverses.
Test `CoefficientHom.scalar_isogeny` (computation): For nonzero A, multiplication by 2 is a rational unit with inverse id/2.
Test `CoefficientHom.dual_numbers` (computation): Over Q[ε]/ε², (1+ε)id has inverse (1−ε)id.
Test `CoefficientHom.zero` (non-example): Zero is not a unit when A has positive dimension.
Test `CoefficientHom.not_field_extension` (non-example): An R-coefficient point for nonfield R does not change A into an abelian variety over R.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/coefficient-isom-torsors (construction): Coefficient isogeny torsors
Exact mathematical signature: The two-sided invertible locus Isog_Q(A,B) in Hom_Q(A,B) is open; it is empty for nonisogenous objects and otherwise a right Aut_Q(A)-torsor under precomposition. For equal-dimensional A,B a coefficient left inverse is a two-sided inverse. Endomorphism compatibility cuts out a rational linear subspace before taking the unit open. If this compatible open is geometrically nonempty it has a rational point, since Q-points are dense in a rational affine space. Polarization equations are quadratic and are not covered by that last argument.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
API `CoefficientIsog.open`: Take the two-sided invertible open in coefficient Hom.
API `CoefficientIsog.action`: Use source automorphisms by precomposition.
API `CoefficientIsog.torsor`: Two invertible arrows differ by a unique source unit.
API `CoefficientIsog.baseChange`: Extend coefficients and preserve the inverse and torsor identities.
Test `CoefficientIsog.self` (compatibility): Isog_Q(A,A)=Aut_Q(A).
Test `CoefficientIsog.empty` (non-example): Nonisogenous elliptic curves have empty Isog_Q.
Test `CoefficientIsog.dual_numbers` (computation): (1+ε)id is invertible over Q[ε]/ε².
Test `CoefficientIsog.dimensions` (non-example): A→A×E cannot be an invertible coefficient arrow for E>0.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/curve-generated-subvariety (construction): Abelian subvariety generated by a curve
Exact mathematical signature: For a geometrically integral projective curve C⊂A over an algebraically closed field and a chosen c₀∈C, the smallest abelian subvariety containing C−c₀ is the image of Jac(C̃)→A induced by the normalization C̃ and c₀. It is independent of c₀; C generates A iff this map is surjective. The translate by c₀ is essential: C itself need not contain zero.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
API `CurveGenerated.mk`: Take the abelian image of the normalization-Jacobian map.
API `CurveGenerated.minimal`: Factor through every abelian subvariety containing C−c₀.
API `CurveGenerated.basepoint`: Changing c₀ does not change the image subgroup.
API `CurveGenerated.generates_iff`: Generation of A is surjectivity of the Jacobian map.
Test `CurveGenerated.translate` (non-example): For C=a+(E×0), the generated subgroup is E×0, although C may not contain zero.
Test `CurveGenerated.elliptic` (computation): An embedded elliptic subgroup generates itself.
Test `CurveGenerated.point` (degenerate): A constant normalized curve map has zero image.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/degree-formulas-for-polarized-isogenies (theorem): Degrees of polarizations under isogenies
Exact mathematical signature: Let α : A → B be an isogeny of abelian varieties over k and λ′ a polarization of B. Then α^*λ′ = α^∨ ∘ λ′ ∘ α is a polarization of A and deg(α^*λ′) = deg(λ′)·deg(α)². The degree of a polarization is a square, deg φ_L = χ(L)², and a principal polarization has degree 1.
Additional hypotheses: deg α^∨ = deg α, for the dual isogeny (A2, A3).; deg φ_L = χ(L)² is Mumford's Riemann–Roch theorem for abelian varieties. The source states it without proof, and A2 owns it; it is a gap until A2 plans it.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/degree-is-a-polynomial-function (theorem): The degree is a homogeneous polynomial function of degree 2g on End⁰(A)
Exact mathematical signature: Let A be an abelian variety of dimension g over a field k. The function deg : End⁰(A) → ℚ is a homogeneous polynomial function of degree 2g: for every finite family e_1, …, e_n in End⁰(A), deg(x_1e_1 + … + x_ne_n) is given by a homogeneous polynomial of degree 2g in (x_1, …, x_n) with rational coefficients.
Additional hypotheses: The source's Lemma 10.12 must be read with a bound on degrees: if x ↦ f(xv + w) is a polynomial of degree at most d for all v and w, then f is a polynomial function. Without the bound the proof's first sum can be infinite (a known erratum, recorded in sourceIssues).; The proof uses intersection numbers of divisors and their behaviour under finite surjective maps, requested from SchemeAndStackFoundations SF.5, and the theorem of the cube (A1).
Signature boundary: The native signature degree_polynomial above states the full finite-family homogeneous polynomial assertion.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/degree-of-an-endomorphism (definition): The degree of an endomorphism, extended to End⁰(A)
Exact mathematical signature: For field abelian varieties A,B of equal dimension g, deg f is the finite-flat rank if f is an isogeny and zero otherwise; for an isogeny it equals the function-field degree, including inseparable degree. For equal-dimensional composable maps it is multiplicative. On End A, deg[n]=|n|^(2g), including n=0 with 0^0=1. Extend to End⁰ A by deg(q)=deg(nq)/n^(2g) for any positive denominator n; the extension is independent of n and is nonzero exactly on units. For g=0 End A is the zero ring, its unique morphism is the identity and has degree one.
Additional hypotheses: The degree counts inseparable degree. For the Frobenius π of an elliptic curve over 𝔽_p, deg π = p while ker π(k̄) = 0. So deg is not the number of geometric points of the kernel.; The extension to End⁰(A) uses that End(A) is torsion-free (theorem hom-to-tate-module-homs-is-injective).; deg [n] = n^{2g} is AbelianSchemesAndArithmeticModuli A3's statement that [n] is finite locally free of rank n^{2g}.
Signature boundary: Native Hom.deg, composition, multiplication, isogeny characterization, rational extension and zero-dimensional signatures appear above. Frobenius constructor and its elliptic finite-flat kernel comparison are not supplied by the pinned carrier.
API `TauCeti.AlgebraicGeometry.AbelianVariety.Hom.deg`: Hom.deg (α : A ⟶ B) : ℕ, the degree of α if it is an isogeny and 0 otherwise.
API `TauCeti.AlgebraicGeometry.AbelianVariety.deg_comp`: For A,B,C of equal dimension, deg(f≫h)=deg f·deg h.
API `TauCeti.AlgebraicGeometry.AbelianVariety.deg_mulBy`: Hom.deg (mulBy A n) = n.natAbs ^ (2 * g) for g the dimension of A.
API `TauCeti.AlgebraicGeometry.AbelianVariety.isIsogeny_iff_deg_ne_zero`: IsIsogeny α ↔ Hom.deg α ≠ 0 for α : A ⟶ B with dim A = dim B.
API `TauCeti.AlgebraicGeometry.AbelianVariety.End.degRat`: End.degRat : Q⊗Z End A → Q, the coefficient extension n^(−2g) deg(nα); swapping tensor factors gives End A⊗Z Q.
API `TauCeti.AlgebraicGeometry.AbelianVariety.degree_dimension_zero`: For dim A=0 every endomorphism has degree one.
Test `TauCeti.AlgebraicGeometry.AbelianVariety.deg_mulBy_two_elliptic` (computation): On an elliptic curve deg [2] = 4 (four 2-torsion points when char k ≠ 2).
Test `TauCeti.AlgebraicGeometry.AbelianVariety.deg_zero` (degenerate): For g>0, deg 0=0 and deg 1=1; for g=0, 0=1 and its degree is one.
Test `TauCeti.AlgebraicGeometry.AbelianVariety.deg_frobenius_ne_card_ker` (non-example): For the Frobenius π of an elliptic curve over 𝔽_p, deg π = p although π is injective on k̄-points: deg is not the number of geometric points of the kernel.
Test `TauCeti.AlgebraicGeometry.AbelianVariety.deg_neg_one` (computation): deg [−1] = 1, consistent with deg [n] = n^{2g}.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/endomorphism-algebra-is-semisimple (theorem): The endomorphism algebra End⁰(A) is semisimple
Exact mathematical signature: Let A be an abelian variety over a field k, isogenous to A_1^{n_1} × … × A_r^{n_r} with the A_i simple and pairwise non-isogenous. Then End⁰(A) ≅ ∏_i M_{n_i}(D_i), with D_i = End⁰(A_i) a division algebra of finite dimension over ℚ. So End⁰(A) is a finite-dimensional semisimple ℚ-algebra. Moreover End(Aⁿ) = M_n(End(A)), and End(A × B) is the ring of matrices [[End(A), Hom(B, A)], [Hom(A, B), End(B)]], compatibly with T_ℓ.
Additional hypotheses: Semisimplicity is of End⁰(A), not of End(A), which is an order.
Signature boundary: The native semisimple and finite-dimensional conclusions are endQ_isSemisimple above. The simple-factor decomposition needs the missing native abelian-subvariety/simple-factor interfaces.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/endomorphisms-of-simple-abelian-varieties (theorem): Endomorphisms of simple abelian varieties form a division algebra
Exact mathematical signature: Let A be a simple abelian variety over a field k: A ≠ 0 and its only abelian subvarieties are 0 and A. Then every nonzero α ∈ End(A) is an isogeny, and End⁰(A) = End(A) ⊗ ℚ is a division algebra. If A and B are simple, Hom⁰(A, B) = 0 unless A and B are isogenous, in which case it is free of rank one over End⁰(A) on the right and over End⁰(B) on the left. For simple A, End⁰(Aⁿ) ≅ M_n(End⁰(A)).
Additional hypotheses: The argument through the image of α works over every field. The source argues through the connected component of the kernel, which needs geometric reducedness over an imperfect field; the author flags this in footnote 11.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/finite-etale-weil-restriction-of-abelian-schemes (theorem): Weil restriction along finite étale maps preserves abelian schemes; finite locally free does not
Exact mathematical signature: (i) Let S′ → S be finite étale of constant degree d and A an abelian scheme over S′ of relative dimension g. Then Res_{S′/S}(A) is an abelian scheme over S of relative dimension dg. (ii) This fails for finite locally free S′ → S: for D = k[ε]/(ε²) and an elliptic curve E/k, Res_{D/k}(E_D) is the tangent bundle of E, isomorphic by translation to E × Lie(E) ≅ E × 𝔾_a, which is not proper.
Additional hypotheses: The algebraic space Res_{S′/S}(A) (weil-restriction-functor) is a scheme by the abelian-algebraic-space-to-scheme theorem of A2 (Raynaud; Faltings–Chai I.1.9), with its stated base hypotheses. This is not an inference from properness of finite locally free morphisms.; (i) is the specified descent proof that the atlas asks for. (ii) is its negative acceptance example.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/frobenius-semisimplicity (theorem): Frobenius semisimplicity
Exact mathematical signature: For A/F_q, q-Frobenius π is central in End⁰_(Fq)(A), π†π=q, and Q[π] is a product of number fields. It and its powers act semisimply on V_ℓ A for ℓ≠p; any faithful characteristic-zero realization carrying the same End⁰ action has the same conclusion. Compatibility with a future Dieudonné realization is an export, not a construction of that realization here.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/hodge-determinant-and-moduli-export (construction): Hodge determinant and moduli export
Exact mathematical signature: For a family π:A→S let ω_A=e*Ω¹_(A/S) and λ_H=det ω_A, using the existing geometric vector-bundle determinant. Both commute with base change; λ_(A×B)=λ_A⊗λ_B. For the Siegel analytic family its transition factor is det(CΩ+D), with the chosen cohomological Hodge-frame convention. These define line bundles by descent on the already-owned polarized/PEL/Hilbert moduli functors when those objects are supplied; this roadmap constructs no moduli stack and no converse algebraization theorem.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
API `AbelianHodgeLine.mk`: Take det(e*Ω¹_(A/S)) through the existing vector-bundle API.
API `AbelianHodgeLine.baseChange`: Pullback of a family pulls back its Hodge line.
API `AbelianHodgeLine.product`: The Hodge line of a product is the tensor product.
API `AbelianHodgeLine.analyticFactor`: In the Siegel Hodge frame the factor is det(CΩ+D).
Test `AbelianHodgeLine.elliptic` (compatibility): For an elliptic family the determinant is its rank-one invariant-differential line.
Test `AbelianHodgeLine.zero` (degenerate): Dimension zero has determinant O_S.
Test `AbelianHodgeLine.product` (computation): For E×E′ the line is ω_E⊗ω_E′.
Test `AbelianHodgeLine.not_theta` (non-example): The Hodge determinant is not a chosen theta line on A and descends without choosing a theta characteristic.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/hom-descent-at-full-level (theorem): Full-level descent of homomorphisms
Exact mathematical signature: For abelian varieties A,B over k and n≥3 prime to char k, every geometric homomorphism is defined over k(A[n],B[n]). In particular geometric endomorphisms are defined over the n-torsion field. To descend polarizations also include the dual n-torsion pairing and μ_n, rather than assuming the polarization is a chosen rational ample line.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank (theorem): Hom(A, B) is free of finite rank, and Hom ⊗ ℤ_ℓ → Hom(T_ℓA, T_ℓB) is injective
Exact mathematical signature: Hom(A,B) is a free finite Z-module of rank at most 4 dim A·dim B. For each ℓ≠char k, Hom(A,B)⊗Z_ℓ→Hom_Zℓ(T_ℓ A,T_ℓ B) is injective with torsion-free cokernel. Thus End⁰ A is finite dimensional over Q. The statement is faithfulness and saturation, not the surjectivity of a Tate isogeny theorem.
Additional hypotheses: The source's proof has two known faults, listed on the author's errata page. The submodule M must lie in End⁰(A), not End(T_ℓA). Choosing a ℚ-basis of End⁰(A) assumes the finite-dimensionality being proved. The proof steps below take the corrected route: a lattice argument for each finitely generated saturated submodule, then a rank bound.; NS(A) ↪ Hom(A, A^∨) through L ↦ φ_L needs the dual abelian variety (A2 and Tau Ceti JacobianChallenge Layer E).
Signature boundary: The native finite/free conclusion is hom_is_free_of_finite_rank above. The rank-bound and saturated Tate-map signatures require the abelian Tate realization planned in A4.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/hom-to-tate-module-homs-is-injective (theorem): Hom(A, B) embeds in Hom(T_ℓA, T_ℓB); Hom(A, B) is torsion-free
Exact mathematical signature: Let A and B be abelian varieties over a field k and ℓ ≠ char k a prime. The map Hom(A, B) → Hom_{ℤ_ℓ}(T_ℓA, T_ℓB) is injective, so Hom(A, B) is torsion-free. If T_ℓα is divisible by ℓ^n in Hom(T_ℓA, T_ℓB), then α is divisible by ℓ^n in Hom(A, B).
Additional hypotheses: ℓ ≠ char k. For ℓ = p the ℓ-adic Tate module can be 0 (supersingular varieties) and the map is not injective.; T_ℓA = lim A[ℓ^n](k^sep), free of rank 2g over ℤ_ℓ, is AbelianSchemesAndArithmeticModuli A4's.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/localized-isogeny-category (definition): Localized isogeny categories
Exact mathematical signature: For Z⊂D⊂Q a localization, keep the abelian schemes over S as objects and set Hom_D=D⊗Z Hom_S, with extended composition; call the invertible arrows D-isogenies. Aut_D(A)(R)=(End_D(A)⊗D R)× for commutative D-algebras R, on bases where the Hom module is finite projective. Integral, prime-to-p and rational categories are distinct coefficient choices. No geometric field extension is performed.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
API `LocalizedHom.mk`: Form D⊗Hom without altering objects.
API `LocalizedHom.comp`: Extend bilinear composition and identity.
API `LocalizedHom.unitFunctor`: Coefficient automorphisms are the two-sided units.
API `LocalizedHom.extend`: A further localization extends every arrow and inverse.
Test `LocalizedHom.integral` (compatibility): D=Z recovers integral Hom.
Test `LocalizedHom.prime_to_p` (non-example): [p] is not a Z_(p)-isogeny for g>0, while any [n] with p∤n is invertible.
Test `LocalizedHom.rational` (computation): D=Q makes [p] invertible with inverse id/p.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/morikawa-endomorphism (construction): Matsusaka–Morikawa endomorphism
Exact mathematical signature: For ample H on A and a curve C generating A, let ν:Jac(C̃)→A be its normalized map and λ_J the canonical principal Jacobian polarization. Define α=ν λ_J^−1 ν∨ λ_H∈End A, the positive adjoint product. This agrees with the positive intersection-sum Morikawa convention; a convention using t_x* instead of translate-by-x needs its sign corrected. It is λ_H-Rosati symmetric and positive, has Tr α=2(C·H), and P_α=Q² with Q monic integral of degree g and all roots positive real.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
API `Morikawa.mk`: Form ν λ_J^−1 ν∨ λ_H with the positive sign.
API `Morikawa.selfAdjoint`: The endomorphism is Rosati symmetric.
API `Morikawa.trace`: Its geometric trace is 2(C·H).
API `Morikawa.squarePolynomial`: Return the monic integral degree-g Q with P_α=Q².
Test `Morikawa.elliptic` (computation): For C=E and H of degree d>0, α=[d] and Q=X−d.
Test `Morikawa.nongenerating` (non-example): For C=E×0⊂E², the adjoint product has a zero eigenvalue, so strict positivity needs generation.
Test `Morikawa.sign` (non-example): The negative adjoint product has negative elliptic eigenvalues and fails the positive-root assertion.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/multiplicative-polynomial-functions (lemma): A multiplicative polynomial function evaluated on polynomials in an element
Exact mathematical signature: Let E be a unital K-algebra over an infinite field K and δ:E→K a multiplicative homogeneous polynomial law of degree d with δ(1)=1, stable under scalar extension. Let P_α(X)=δ(X·1−α) be monic of degree d with roots a_i in a splitting extension. Then δ(F(α))=∏_i F(a_i) for every F∈K[T]. For the abelian degree law d=2g, the conventions δ(α−X) and δ(X−α) agree.
Additional hypotheses: The sign is (−1)^{deg F · deg P}; only absolute values are used in the application.
Signature boundary: The native matrix specialization is det_aeval_eq_prod_roots above. The scalar-extension-stable homogeneous polynomial-law carrier for the full statement is not supplied by the pinned degree API.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/neron-severi-rank (theorem): Néron–Severi finiteness
Exact mathematical signature: For a field abelian variety, NS(A)=Pic(A)/Pic⁰(A) defined through the Mumford-map kernel is torsion free of finite rank at most 4g², by its injection into Hom(A,A∨). The geometric NS group is computed after kbar base change; its Galois invariants are not identified with NS(A) without an actual line-descent statement.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/poincare-complete-reducibility (theorem): Poincaré complete reducibility
Exact mathematical signature: Let A be an abelian variety over a field k. For every abelian subvariety B ⊆ A there is an abelian subvariety B′ ⊆ A such that (b, b′) ↦ b + b′ : B × B′ → A is an isogeny. Consequently A is isogenous to a product A_1^{n_1} × … × A_r^{n_r} of simple abelian varieties, pairwise non-isogenous, and the multiset of isogeny classes with multiplicities is unique.
Additional hypotheses: The source proves this with B′ the connected component through 0 of ker(i^∨ ∘ φ_L), for i : B → A the inclusion and L ample. Over an imperfect field, geometric reducedness of B′ is not proved in the source (footnote 10). The node states the theorem over every field, and the imperfect case is recorded as a gap.; Uniqueness of the decomposition follows from the theorem endomorphisms-of-simple-abelian-varieties: Hom⁰ between non-isogenous simple factors vanishes.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/polarization-orbits (theorem): Polarization orbits and elliptic-power tests
Exact mathematical signature: Fix a principal λ₀ over kbar. Principal polarizations correspond to integral Rosati-symmetric positive units s=λ₀^−1λ; isomorphism classes are the congruence orbits s↦u†su for u∈End(A)×. For E^n with End(E)=Z this is the GL_n(Z)-congruence action on positive-definite integral symmetric unimodular matrices. For a simple maximal CM-order case the principal classes relative to λ₀ are totally positive units in the real suborder modulo u·conj(u). These examples require the stated endomorphism order and an existing principal λ₀.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/polynomials-determined-by-l-adic-values (lemma): Monic polynomials are determined by ℓ-adic absolute values of resultants
Exact mathematical signature: Let P = ∏(X − a_i) and Q = ∏(X − b_i) be monic polynomials of the same degree with coefficients in ℚ_ℓ. If |∏_i F(a_i)|_ℓ = |∏_i F(b_i)|_ℓ for all F ∈ ℤ[T], then P = Q.
Additional hypotheses: The hypothesis concerns absolute values only; it is extended to F with coefficients in ℚ_ℓ by continuity.
Signature boundary: The complete native polynomial signature is eq_of_padicNorm_roots_products above. The coefficients belong to Padic ℓ; arbitrary algebraic-closure multisets would make this statement false.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/quadratic-twists-and-restriction (construction): Quadratic abelian twists
Exact mathematical signature: For a separable quadratic L/K and its character χ, descend A_L using the cocycle [−1] to form A^χ. The twist retains the principal/specified polarization because inversion preserves it. Res_(L/K)(A_L) is isogenous over K to A×A^χ; on L the sum/difference map is the matrix [[1,1],[1,−1]] with degree 2^(2g), including in characteristic two as a finite-flat isogeny. A(L)⊗Q decomposes into ± eigenspaces A(K)⊗Q and A^χ(K)⊗Q. Whenever these dimensions are finite, rank A(L)=rank A(K)+rank A^χ(K).
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
API `QuadraticAbelianTwist.mk`: Descend A_L by the inversion cocycle.
API `QuadraticAbelianTwist.overExtension`: Identify the twist with A after extending to L.
API `QuadraticAbelianTwist.polarization`: Transport an inversion-invariant polarization.
API `QuadraticAbelianTwist.restrictionIsogeny`: Construct the sum/difference isogeny with degree 2^(2g).
Test `QuadraticAbelianTwist.trivial` (degenerate): For the trivial character the twist is A.
Test `QuadraticAbelianTwist.elliptic` (compatibility): For a Weierstrass elliptic curve agree with its usual quadratic twist.
Test `QuadraticAbelianTwist.degree` (computation): For g=1 the restriction/product isogeny has degree four, not two.
Test `QuadraticAbelianTwist.sign` (non-example): The anti-invariant eigenspace belongs to A^χ(K), not a second copy of A(K) with the same descent action.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/real-isometries-and-polarized-torsors (theorem): Real isometries and polarized torsors
Exact mathematical signature: For a polarization, {u∈End⁰_R×:u†u=1} is compact; the positive-similitude group modulo R× is compact. Any nonempty coefficient isogeny torsor respecting two polarizations up to positive scalar is trivial over R: from an isogeny f, adjust by the inverse positive square root of f†f. Extra endomorphism data is permitted only when the adjoint/square-root operator commutes with it, as ensured by compatible positive involutions.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/reduced-trace-comparison (theorem): Geometric and reduced traces
Exact mathematical signature: For simple A of dimension g with D=End⁰ A, centre F of degree e and dim_F D=m², the geometric trace on D is (2g/(em))Trd_(D/Q). For product matrix factors it is the sum of the corresponding factor traces with the actual multiplicities. A positive involution on a CM-field factor restricts to complex conjugation; the assertion presupposes that the factor is a CM field, not that every centre is CM.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/relative-hom-and-normal-extension (theorem): Relative Hom and normal-base extension
Exact mathematical signature: For abelian schemes A,B/S, the Hom functor is an unramified separated algebraic space, locally of finite type, a disjoint union of finite unramified S-schemes (the bounded graph components); it is not globally finite type. It is rigid under nilpotent thickenings and embeds under specialization at a geometric point when S is connected locally noetherian. If S is locally noetherian normal and U⊂S is dense open, Hom_S(A,B)→Hom_U(A_U,B_U) is an isomorphism. For a smooth connected complex base, a Hodge homomorphism of one fibre that is invariant under monodromy extends uniquely to the family.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/rosati-positivity (theorem): Positivity of the Rosati involution
Exact mathematical signature: Let (A, λ) be a polarized abelian variety of dimension g over k, with Rosati involution †. The bilinear form (α, β) ↦ Tr(α ∘ β†) on End⁰(A) is symmetric and positive definite: Tr(αα†) > 0 for α ≠ 0. More precisely, if λ is defined by an ample divisor D over k̄, then Tr(αα†) = (2g/(D^g))·(D^{g−1} · α^*D).
Additional hypotheses: The source omits the calculation proving the formula; it cites the author's 1986 article, §17. That proof was not read, and it is recorded as a gap.; Positive definiteness over ℚ implies it over ℝ: a rational quadratic form that is positive on ℚ^n ∖ 0 is positive semidefinite over ℝ, and its radical is a rational subspace, hence 0.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/tate-module-of-a-weil-restriction (theorem): T_ℓ(Res_{L/K} A) ≅ Ind_{G_L}^{G_K} T_ℓ(A)
Exact mathematical signature: Let L/K be a finite separable extension of fields, A an abelian variety over L, and ℓ ≠ char K. Choosing a separable closure K^s and an embedding L ⊂ K^s gives a G_K-equivariant isomorphism T_ℓ(Res_{L/K} A) ≅ Ind_{G_L}^{G_K} T_ℓ(A) = ℤ_ℓ[G_K] ⊗_{ℤ_ℓ[G_L]} T_ℓ(A). A different choice of embedding changes the isomorphism by the canonical isomorphism between the corresponding induced modules. For number fields, V_ℓ(Res_{L/K}A) is the induced Galois representation of V_ℓA.
Additional hypotheses: Induction and coinduction coincide for the finite-index subgroup G_L ⊆ G_K.; This field-level formula implies nothing about good reduction at ramified integral places, as the atlas warns.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield (theorem): Trace and degree through a subfield of End⁰(A); V_ℓA is free over K ⊗ ℚ_ℓ
Exact mathematical signature: For a unital subfield F⊂End⁰ A of degree f, f divides 2g, V_ℓ A is free of rank 2g/f over F⊗Q_ℓ, and Tr(α)=(2g/f)Tr_F/Q(α), deg α=Nm_F/Q(α)^(2g/f). More generally when Q[α] is a product of fields, P_α has the same distinct roots as the characteristic polynomial of multiplication by α on Q[α]; the multiplicities can differ. This does not say the two characteristic polynomials are equal.
Additional hypotheses: K must share the identity of End⁰(A); a field embedded in a corner eAe has a different identity.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/twist-realizations-polarizations-and-level (theorem): Structured twist exports
Exact mathematical signature: An additive D-linear realization F commuting with finite sums and the defining idempotent images obeys F(A^P)≅F(A)^P; this applies to the integral prime-to-denominator Tate systems and relative de Rham bundles, with their functorial structures. A weak D-polarization is a polarization ray under totally positive D× scalar ratios. If the Z-action transforms λ by a positive character, it descends to a weak polarization of the twist. Twisted adelic level is the transported orbit: under a trivialization g it changes by conjugation of both the level subgroup K and the Z-action.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/weak-localized-polarization (definition): Weak localized polarizations
Exact mathematical signature: For D⊂Q a localization, a weak D-polarization is a D-polarization class under multiplication by positive units in D. A D-polarization is a symmetric D-isogeny A→A∨ some positive integer multiple of which is an integral polarization. This definition records a positive ray, not equality up to every signed unit; its pullbacks and twists preserve positivity.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
API `WeakDPolarization.mk`: Map a D-polarization to its positive-unit class.
API `WeakDPolarization.eq_iff`: Two representatives agree exactly by a positive D-unit ratio.
API `WeakDPolarization.pullback`: Pull back through a D-isogeny.
API `WeakDPolarization.integral`: An integral polarization defines its weak D-class.
Test `WeakDPolarization.positive_scalar` (computation): For D=Q, λ and 2λ have the same weak class.
Test `WeakDPolarization.negative_scalar` (non-example): For positive-dimensional A, −λ is not a positive weak representative.
Test `WeakDPolarization.integral_units` (compatibility): For D=Z the only positive unit is one, so equality of weak representatives is equality of polarizations.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor (comparison): Weil restriction along a finite locally free morphism
Exact mathematical signature: Import the R09.3 finite-locally-free restriction functor T↦Hom_(S′)(T×_S S′,X), its fppf sheaf property and algebraic-space representability. Apply its scheme criterion when every finite subset of a fibre lies in an affine open; do not assert that restrictions of an arbitrary affine cover cover the whole restriction.
Additional hypotheses: Algebraic-space representability is AlgebraicModuliForArithmeticGeometry R09.3's (Stacks 05YF), as RS-02 directs.; The morphism S′ → S must be finite locally free. For a non-flat S′ → S, T ↦ X(T ×_S S′) is not in general representable.
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes (comparison): Weil restriction of quasi-projective varieties over fields is a scheme
Exact mathematical signature: Import the R09.3 finite-locally-free restriction functor T↦Hom_(S′)(T×_S S′,X), its fppf sheaf property and algebraic-space representability. Apply its scheme criterion when every finite subset of a fibre lies in an affine open; do not assert that restrictions of an arbitrary affine cover cover the whole restriction.
Additional hypotheses: The general criterion is Bosch–Lütkebohmert–Raynaud §7.6, Theorem 4, which Poonen cites and which was not read. The scheme-representability criterion is requested with the algebraic-space theory from AlgebraicModuliForArithmeticGeometry R09.3.; The affine-open hypothesis cannot be weakened to a cover by affines (Poonen Exercise 4.8).
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
/-
Target AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits (theorem): After base change to k̄, a separable Weil restriction is a product of conjugates
Exact mathematical signature: Let L/k be a finite separable extension and X an L-variety with Res_{L/k}(X) representable. Then Res_{L/k}(X) ×_k k̄ ≅ ∏_{σ ∈ Hom_k(L, k̄)} X ×_{L,σ} k̄. When L/k is Galois with group G, Res_{L/k}(X)_L ≅ ∏_{σ∈G} σX. The Galois group Gal(k̄/k) acts on the right-hand side by permuting the factors through its action on Hom_k(L, k̄), compatibly with its action on each factor.
Additional hypotheses: Separability makes L ⊗_k k̄ ≅ ∏_σ k̄. For inseparable L/k the base change is not a product of copies of k̄ (Poonen Exercise 4.9).
Signature boundary: The needed relative dual/polarization, subvariety, geometric realization, relative Hom/graph, affine coefficient functor, restriction-of-scalars or localized torsor interface has no native pinned declaration. Field Hom/End and coefficient tensor modules are used above where they suffice.
-/
