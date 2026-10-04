import Mathlib.LinearAlgebra.TensorPower.Basic
import Mathlib.Algebra.Module.Submodule.EqLocus
import Mathlib.Algebra.Module.Submodule.Lattice
import Mathlib.RingTheory.Polynomial.Resultant.Basic
import Mathlib.NumberTheory.Padics.RingHoms

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. They claim no implementation.
Native invariant-tensor, degree-product and polynomial adapters are expressed at
the pinned Mathlib baseline. Individual omissions follow below.
-/

noncomputable section
namespace AbelianArithmetic
variable (R M : Type*) [CommRing R] [AddCommGroup M] [Module R M]

/-- The invariant submodule, as opposed to the symmetric-power quotient. -/
def tensorSymmetricPower (n : ℕ) : Submodule R (TensorPower R n M) := by
  sorry

lemma tensorSymmetricPower_mem (n : ℕ) (t : TensorPower R n M) :
    t ∈ tensorSymmetricPower R M n ↔
      ∀ σ : Equiv.Perm (Fin n),
        PiTensorProduct.reindex R (fun _ : Fin n => M) σ t = t := by
  sorry

lemma tensorSymmetricPower_diagonal (n : ℕ) (v : M) :
    PiTensorProduct.tprod R (fun _ : Fin n => v) ∈ tensorSymmetricPower R M n := by
  sorry

def tensorSymmetricPower_map {N : Type*} [AddCommGroup N] [Module R N]
    (n : ℕ) (f : M →ₗ[R] N) :
    ↥(tensorSymmetricPower R M n) →ₗ[R] ↥(tensorSymmetricPower R N n) := by
  sorry

lemma tensorSymmetricPower_ext (n : ℕ) (x y : ↥(tensorSymmetricPower R M n)) :
    x = y ↔ (x : TensorPower R n M) = (y : TensorPower R n M) := by
  sorry

-- Test AbelianArithmetic.tensorSymmetricPower_zero
example : tensorSymmetricPower R M 0 = ⊤ := by
  sorry

-- Test AbelianArithmetic.tensorSymmetricPower_one
example : tensorSymmetricPower R M 1 = ⊤ := by
  sorry

-- Test AbelianArithmetic.tensorSymmetricPower_nonfixed
example : PiTensorProduct.tprod ℤ
    (fun i : Fin 2 => fun j : Fin 2 => if i = j then (1 : ℤ) else 0)
      ∉ tensorSymmetricPower ℤ (Fin 2 → ℤ) 2 := by
  sorry

/-- Structural carrier alias only; all proposed maps and facts remain unproved. -/
abbrev degreeCompletion := ∀ n : ℕ, ↥(tensorSymmetricPower R M n)

def degreeCompletion_component (n : ℕ) (c : degreeCompletion R M) :
    ↥(tensorSymmetricPower R M n) := by
  sorry

lemma degreeCompletion_ext (c d : degreeCompletion R M) :
    c = d ↔ ∀ n, degreeCompletion_component R M n c =
      degreeCompletion_component R M n d := by
  sorry

lemma degreeCompletion_zero (n : ℕ) :
    degreeCompletion_component R M n (0 : degreeCompletion R M) = 0 := by
  sorry

-- Test AbelianArithmetic.degreeCompletion_zero_component
example : degreeCompletion_component R M 0 (0 : degreeCompletion R M) = 0 := by
  sorry

-- Test AbelianArithmetic.degreeCompletion_single
example (n : ℕ) (x : ↥(tensorSymmetricPower R M n)) :
    degreeCompletion_component R M n
      (Function.update (0 : degreeCompletion R M) n x) = x := by
  sorry

-- Test AbelianArithmetic.degreeCompletion_product
example : degreeCompletion R M = (∀ n : ℕ, ↥(tensorSymmetricPower R M n)) := by
  sorry

-- Node F2/monic-lift: an ideal version supplies every ideal-power instance.
theorem monicCoefficientLift {D O : Type*} [CommRing D] [CommRing O]
    (φ : D →+* O) (I : Ideal O)
    (hφ : ∀ o : O, ∃ d : D, o - φ d ∈ I)
    (P : Polynomial O) (hP : P.Monic) :
    ∃ ψ : Polynomial D, ψ.Monic ∧ ψ.natDegree = P.natDegree ∧
      ∀ i, (ψ.map φ).coeff i - P.coeff i ∈ I := by
  sorry

-- Node F2/fixed-resultant-congruence: explicit m,n are deliberately retained.
theorem fixedResultantCongruence {O : Type*} [CommRing O]
    (I : Ideal O) (P Q Q' : Polynomial O) (m n : ℕ)
    (hQ : ∀ i, Q.coeff i - Q'.coeff i ∈ I) :
    Polynomial.resultant P Q m n - Polynomial.resultant P Q' m n ∈ I := by
  sorry

-- Node F2/padic-recognition: the native valuation sends zero to zero,
-- so common nonzero resultants are essential hypotheses.
theorem padicResultantRecognition {p : ℕ} [Fact p.Prime]
    (P Q : Polynomial (PadicInt p)) (hP : P.Monic) (hQ : Q.Monic)
    (h : ∀ ψ : Polynomial ℤ, ψ.Monic →
      Polynomial.resultant P (ψ.map (Int.castRingHom (PadicInt p))) ≠ 0 →
      Polynomial.resultant Q (ψ.map (Int.castRingHom (PadicInt p))) ≠ 0 →
      PadicInt.valuation (Polynomial.resultant P (ψ.map (Int.castRingHom (PadicInt p)))) =
        PadicInt.valuation (Polynomial.resultant Q (ψ.map (Int.castRingHom (PadicInt p))))) :
    P = Q := by
  sorry

end AbelianArithmetic

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P0/shuffle-divided-powers
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For tensors invariant under S_m and S_n, sum over (m,n)-shuffles to obtain TSym^m(M)×TSym^n(M)→TSym^(m+n)(M). It is associative and commutative; diagonal divided tensors satisfy v^[m]v^[n]=binom(m+n,m)v^[m+n] and v^n=n!v^[n].
API omitted AbelianArithmetic.tensorSymmetricAlgebra_mul: On ⊕n TSym^n(M), multiply degree m,n by the sum over (m,n)-shuffles.
API omitted AbelianArithmetic.tensorSymmetricAlgebra_unit: The unit is 1 in degree zero, using the native empty tensor equivalence.
API omitted AbelianArithmetic.tensorSymmetricAlgebra_divided: For diagonal tensors v^[n], v^[m]v^[n]=binom(m+n,m)v^[m+n].
Test omitted AbelianArithmetic.tensorSymmetricAlgebra_zero_degree: The degree-zero subalgebra is the native base ring R.
Test omitted AbelianArithmetic.tensorSymmetricAlgebra_char_two: For M=F₂·v, the shuffle square v·v is zero, but v^[2] is nonzero; ordinary tensor concatenation would fail this test.
Test omitted AbelianArithmetic.tensorSymmetricAlgebra_free: For a free module, the construction agrees with the existing DividedPowerAlgebra via the separately planned diagonal comparison.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P0/divided-power-comparison
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For a free R-module M, the diagonal divided tensors extend to a graded algebra isomorphism DividedPowerAlgebra R M≃TSym_R(M), using shuffle multiplication. For nonfree M only the natural comparison is asserted, with its universal-property hypotheses.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P0/multigrading
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For a finite direct-sum decomposition M=⊕σ Mσ, TSym^k(M)≃⊕_{|α|=k}⊗σ TSym^{α(σ)}(Mσ), and v^[α] is the tensor of its component divided powers.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P1/universal-vector-extension
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For an abelian scheme A/S in the source noetherian setting, A♮ represents rigidified invertible sheaves L on A_T with integrable T-relative connection satisfying the theorem of the square. The forgetful map p:A♮→A∨ has vector kernel ω_A and universal bundle P♮=(id_A×p)^*P with universal connection. Thus A♮ is the extension of A∨, not A.
API omitted AbelianArithmetic.universalVectorExtension_forget: p sends a rigidified pair (L,∇) to the class of L in A∨.
API omitted AbelianArithmetic.universalVectorExtension_kernel: ker p is the vector group associated to ω_A.
API omitted AbelianArithmetic.universalVectorExtension_represent: Hom_S(T,A♮) is naturally the group of rigidified square-compatible line bundles with integrable relative connection on A_T.
API omitted AbelianArithmetic.universalPoincare_pullback: The underlying line bundle of P♮ equals (id×p)^*P with its rigidification.
Test omitted AbelianArithmetic.universalVectorExtension_zero: For the zero-dimensional abelian scheme the representing group and vector kernel are trivial.
Test omitted AbelianArithmetic.universalVectorExtension_elliptic: For an elliptic scheme the vector kernel has rank one and Lie(A♮) has rank two.
Test omitted AbelianArithmetic.universalVectorExtension_dual: The forgetful target is the imported dual A∨ and the underlying universal sheaf is the imported Poincaré sheaf, not a newly defined Picard functor.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P1/vector-extension-hodge
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Lie(A♮/S)≃H¹_dR(A/S) identifies 0→ω_A→Lie(A♮)→Lie(A∨)→0 with the Hodge exact sequence. Its dual identifies H=(H¹_dR)∨ with ω_A♮ and the dual Gauss–Manin connection.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P2/group-moment-map
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For a smooth commutative group G/S, its unit ideal J has J^n/J^(n+1)≃Sym^n(ω_G). Iterating the coproduct and projecting each factor O_G/J²→ω_G gives mom_n:O_G/J^(n+1)→⊕_{b≤n}TSym^b(ω_G), compatible with truncation; their inverse limit lands in degree completion. Over a Q-algebra the moment maps are isomorphisms.
API omitted AbelianArithmetic.momentMap_truncate: Projection from the n-th to the m-th formal neighborhood commutes with moments for m≤n.
API omitted AbelianArithmetic.momentMap_degree_one: The degree-one component is the canonical projection O_G/J²→ω_G.
API omitted AbelianArithmetic.momentMap_functorial: A homomorphism of smooth commutative groups commutes with moments through its invariant cotangent map.
Test omitted AbelianArithmetic.momentMap_zero: At n=0 the moment map is the identity of O_S.
Test omitted AbelianArithmetic.momentMap_additive_char_zero: For G_a over a Q-algebra, x^n maps to n! times the nth invariant divided tensor.
Test omitted AbelianArithmetic.momentMap_additive_char_p: For G_a over F_p, the degree-p associated-graded map sends x^p to zero because p!=0; the integral moment map is not automatically an isomorphism.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P2/poincare-top-cohomology-input
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For A/S of relative dimension d, the normalized Poincaré transform and its derived completion at the dual unit must identify Rπ_*(P_hat⊗Ω^d) with O_S[−d]. This statement includes derived-limit and ordinary-limit comparison, not merely finite-level cohomology.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P3/square-zero-extension-class
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For S=Spec k, char k=0, and finite-dimensional M, the universal connection identifies ker(A♮(k⊕M)→A♮(k))≃Lie(A♮)⊗M≃Hom(H,M) with Ext¹ of O_A by π^*M in integrable connections, compatibly with the split unit. Taking M=H and id_H gives Log¹.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P3/smooth-connection-calculation
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Over C, for the Hodge/CM component conventions of §3.1, ν is the identity tensor in H⊗(ω⊕conj ω). On ⊕_{k≤n}TSym^k(H) the connection d+ν has the same rigidified first extension as P♮(1) and induces the higher symmetric constructions.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P4/ordinary-completed-base-change
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Start with the noetherian CM model of Notation 5.1 and an ordinary CM type at p. Base change and complete over O_Cp; its ordinary connected p-divisible subgroup is the formal part used in the infinitesimal trivialization. No noetherian assertion about O_Cp is used.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B0/period-coordinate-trivialization
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For a polarized abelian scheme A→S of relative dimension g over C, choose connected simply connected U⊂S^an and a symplectic lattice frame of polarization type D=diag(d₁,…,d_g). Its period matrix Z gives (a,b,s)↦(Da+Z(s)b,s), and the inverse induces (b_U,π):A_U^an≃(R/Z)^(2g)×U as real analytic manifolds. b_U alone is projection to the torus.
API omitted AbelianArithmetic.periodCoordinates_betti: b_U is the torus-coordinate projection, excluding the base coordinate.
API omitted AbelianArithmetic.periodCoordinates_fibre: The restriction b_U:A_s^an→(R/Z)^(2g) is an analytic group isomorphism.
API omitted AbelianArithmetic.periodCoordinates_leaf: For fixed torus coordinate β, s↦(b_U,π)^−1(β,s) is holomorphic.
API omitted AbelianArithmetic.periodCoordinates_transition: Two choices on connected U differ by a constant element of GL_(2g)(Z); these are automorphisms, not arbitrary endomorphisms.
Test omitted AbelianArithmetic.periodCoordinates_point: Over a point the torus-coordinate map is the imported complex uniformization expressed in real period coordinates.
Test omitted AbelianArithmetic.periodCoordinates_zero: The zero section has Betti coordinate zero.
Test omitted AbelianArithmetic.periodCoordinates_base_not_counted: On a constant family over a positive-dimensional U, db_U annihilates the base directions although d(b_U,π) is invertible.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B1/betti-form
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For a principal polarization upstairs on C^g×H_g set Y=Im Z and ω_hat=i∂∂bar(2(Im w)^tY^−1(Im w)). In real coordinates w=a+Zb it equals 2∑ da_j∧db_j. It descends under the arithmetic semidirect action to the universal family and pulls back to A/S. For type D the alternating polarization form is transported in the D-coordinate convention.
API omitted AbelianArithmetic.bettiForm_pullback: The form on A is the pullback of the universal Betti form in the chosen polarization type.
API omitted AbelianArithmetic.bettiForm_closed: dω=0 and ω has type (1,1).
API omitted AbelianArithmetic.bettiForm_nonnegative: ω is semipositive on each complex tangent space.
API omitted AbelianArithmetic.bettiForm_scale: For every N∈Z, [N]^*ω=N²ω.
Test omitted AbelianArithmetic.bettiForm_elliptic: For w=a+τb, the principal elliptic Betti form is 2 da∧db.
Test omitted AbelianArithmetic.bettiForm_zero_multiplication: [0]^*ω=0, while [−1]^*ω=ω.
Test omitted AbelianArithmetic.bettiForm_single_fibre: On a single fibre the form agrees with the translation-invariant positive (1,1) form of its imported principal polarization.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B1/betti-form-kernel
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: At a smooth point x of a complex subvariety X, ker(ω|T_xX)=ker(db_U|T_xX), and the real rank of db_U is the rank of the restricted alternating form. Thus ω^dim_CX is nonzero exactly when rank_R db_U=2 dim_CX.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B1/non-degenerate
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: An irreducible complex X⊂A is non-degenerate if at some x∈X^sm(C), rank_R(db_U|X)_x=2 dim_C X. Equivalently the top restricted Betti form is nonzero somewhere. The dimension is total complex dimension, including base directions. For Qbar varieties use the fixed embedding into C.
API omitted AbelianArithmetic.nonDegenerate_rank: Non-degeneracy iff generic real Betti rank equals twice total complex dimension.
API omitted AbelianArithmetic.nonDegenerate_form: Non-degeneracy iff ω^dim_CX is nonzero on X^sm.
API omitted AbelianArithmetic.nonDegenerate_smooth_point: A non-degenerate X has a smooth nonvanishing point over a smooth point of π(X).
Test omitted AbelianArithmetic.nonDegenerate_single_fibre: Every irreducible subvariety of a single polarized abelian variety over a point is non-degenerate.
Test omitted AbelianArithmetic.nonDegenerate_diagonal: For an elliptic family E over a curve, Δ(E)⊂E×_S E has dim_C=2 and real Betti rank≤2, so is degenerate.
Test omitted AbelianArithmetic.nonDegenerate_torsion: A torsion section over a positive-dimensional base has locally constant Betti coordinates and is degenerate.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B0/birational-betti-rank
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: A birational base change between irreducible complex bases identifies generic real Betti rank on the corresponding dominating subvarieties.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B2/curve-degenerate
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For an irreducible subvariety Y⊂A over a smooth irreducible complex curve S, x is a degenerate point when it is not isolated in the local fibre of b_U|Y. Y is curve-degenerate when its degenerate points contain a nonempty relatively open subset. This is the GH convention, not a definition using only generic relative dimension.
API omitted AbelianArithmetic.curveDegenerate_point: DegenerateAt(x) iff x is nonisolated in its local Betti fibre.
API omitted AbelianArithmetic.curveDegenerate_open: CurveDegenerate(Y) iff a nonempty open subset of Y consists of degenerate points.
API omitted AbelianArithmetic.curveDegenerate_rank: On the smooth generic constant-rank locus curve degeneracy is the failure of the total-dimension Betti rank criterion.
Test omitted AbelianArithmetic.curveDegenerate_torsion: A torsion section over a curve is curve-degenerate.
Test omitted AbelianArithmetic.curveDegenerate_fibre: A smooth subvariety contained in one fibre has isolated local Betti fibres and is not curve-degenerate.
Test omitted AbelianArithmetic.curveDegenerate_full_family: A constant abelian family over a curve is curve-degenerate, despite positive definite form on each individual fibre.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B2/function-field-trace
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For K=C(S) and an abelian variety A/K, a C-trace is an abelian variety T/C with a K-homomorphism τ:T_K→A universal among maps from constant abelian varieties. In characteristic zero τ has finite kernel. Its image has a complementary abelian subvariety up to isogeny by imported Poincaré reducibility. Universal equivariant Hom, not all fibrewise Hom, detects this trace.
API omitted AbelianArithmetic.functionFieldTrace_map: τ:T_K→A is the universal homomorphism from the constant trace.
API omitted AbelianArithmetic.functionFieldTrace_universal: For every B/C, Hom_C(B,T)→Hom_K(B_K,A), f↦τ∘f_K, is a bijection.
API omitted AbelianArithmetic.functionFieldTrace_complement: In characteristic zero there is an abelian complement B and a K-isogeny T_K×B→A.
Test omitted AbelianArithmetic.functionFieldTrace_constant: The C-trace of a constant B_K is B with identity map.
Test omitted AbelianArithmetic.functionFieldTrace_zero: The zero abelian variety has zero trace.
Test omitted AbelianArithmetic.functionFieldTrace_nonconstant: For a non-isotrivial elliptic variety over C(S), the trace is zero even though its complex fibres are nonzero elliptic curves.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B2/torus-annihilators
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Every closed subgroup H of (R/Z)^n is the intersection of kernels of integer characters in its annihilator L⊂Z^n. Since subgroups of Z^n are finitely generated, there are countably many such H. L need not be saturated: H may be disconnected.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B2/free-group-orbit-growth
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Let Γ⊂GL_n(Z) be freely generated by two matrices. Fix c>1 bounding the submultiplicative norms of both generators and both inverses. There are at least 2^k distinct Γ matrices of norm at most c^k, so for sufficiently large T there are at least C T^(log2/logc) matrices of norm at most T for some C>0. This counts matrices; distinct orbit points require the separate collision argument.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B2/fixed-homology-trace
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For an extendable polarized integral weight-one variation of an abelian scheme over a smooth curve, a nonzero integer homology class fixed by a finite-index monodromy subgroup yields a nonzero constant part over its finite étale cover. The invariant-to-geometric map is equivariant Hom, not all Hom of Hodge fibres.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B2/generically-special
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Over the geometric generic point of a complex curve, a GH generically special subvariety is a finite union of translates τ(Z_Kbar)+B+t, where Z is an algebraic subvariety of the constant trace T over C, B is an abelian subvariety and t is torsion. A Gao special-generically subvariety, used for degeneracy loci, instead uses a constant section and an abelian subgroup, not a general constant Z.
API omitted AbelianArithmetic.genericallySpecial_components: Each geometric generic irreducible component has the stated constant-variety plus torsion-coset description.
API omitted AbelianArithmetic.genericallySpecial_constant: A constant subvariety of a constant abelian family is generically special.
API omitted AbelianArithmetic.genericallySpecial_torsion: A torsion translate of an abelian subvariety is generically special.
Test omitted AbelianArithmetic.genericallySpecial_constant_curve: A constant genus≥2 curve in its constant Jacobian is GH generically special but is not itself a torsion coset.
Test omitted AbelianArithmetic.genericallySpecial_torsion_point: A torsion point is a zero-dimensional generically special subvariety.
Test omitted AbelianArithmetic.genericallySpecial_trace: For a constant family with identity trace, every subvariety defined over C is supplied by the imported trace map.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-growth
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For the graph component in Gao Theorem 4.1, the definable incidence set Θ has polynomially many arithmetic points of bounded height along an unbounded sequence; prove both zero-horizontal and positive-horizontal cases, then the bounded/unbounded vertical dichotomy.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-stabilizer
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Unless the mixed Ax–Schanuel dimension inequality already holds, the identity component of the rational Zariski stabilizer of the ambient algebraic graph closure has positive dimension.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-normality
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: After the Hilbert-family and very-general-fibre reduction, the rational stabilizer is normal in the Kuga group: its vector part is a Hodge-stable G-module and its reductive part acts trivially on the quotient; quotienting gives the final dimension inequality.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B3/mixed-ax-finite-data
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For a fixed algebraic subvariety of a Kuga mixed Shimura variety, weakly optimal subvarieties have weakly special closures from a finite set of rational subdata and connected normal subgroups with semisimple reductive parts.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B3/degeneracy-locus
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For irreducible X⊂A→S and t∈Z, define X^deg(t) as the union of positive-dimensional irreducible Y⊂X with dim⟨Y⟩_sg−dimπ(Y)<dimY+t. Here ⟨Y⟩_sg is the smallest special-generically closure: torsion plus constant section plus abelian subscheme after finite cover. X^deg(t) is a set before its Zariski closedness theorem.
API omitted AbelianArithmetic.degeneracyLocus_member: x∈X^deg(t) iff x lies on a positive-dimensional Y satisfying the strict dimension inequality.
API omitted AbelianArithmetic.degeneracyLocus_mono: For t≤u, X^deg(t)⊂X^deg(u).
API omitted AbelianArithmetic.degeneracyLocus_zero: The non-degenerate open is X minus the 0-th degeneracy locus once closedness is proved.
Test omitted AbelianArithmetic.degeneracyLocus_point: For a zero-dimensional X all t-degeneracy loci are empty because no positive-dimensional Y exists.
Test omitted AbelianArithmetic.degeneracyLocus_torsion_section: A torsion section over a positive-dimensional base belongs to its 0-th degeneracy locus.
Test omitted AbelianArithmetic.degeneracyLocus_strict: If dim⟨Y⟩_sg−dimπY=dimY+t, that Y is excluded; replacing < with ≤ changes the definition.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B3/degeneracy-closed
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For every t∈Z, X^deg(t) is Zariski closed. On the universal modular image it is a finite union of fibre-dimension-jump loci for the finite normal quotient data; on an arbitrary family use Lemma 9.1 with the relative dimension r of its modular map.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B3/betti-rank-quotient
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Let S be an irreducible complex algebraic variety and X⊂A→S a closed irreducible subvariety dominating S. After the indicated finite cover, translate the smallest torsion translate of an abelian subscheme containing X to obtain the group family A_X. For each integer l≥0, generic real Betti rank of X is <2l iff there is an abelian subscheme B⊂A_X with quotient p_B and its modular map ι/B such that dim((ι/B)∘p_B)(X)<l−dim(B/S).
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B4/non-degenerate-product
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For dominant irreducible X,Y⊂A→S with geometrically irreducible generic fibres, if X is non-degenerate then X×_S Y is non-degenerate in A×_S A. For general fibre products apply the assertion to each dominating component after the requisite finite cover.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B4/fibre-power-induction
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For X→S dominant with geometrically irreducible generic fibre, positive relative dimension, generating fibres and finite generic stabilizer, the quotient-rank criterion applied to X^[m] for m≥dimS and generically finite modular map cannot yield a deficient rank.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F0/compact-preimages
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: If compact nonempty closed sets of preimages in a fixed compact polarized parameter space form a nested inverse system, their intersection is nonempty. This proves equality of the lattice image with the limiting isotropic subspace only after the compatible preimages are constructed.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F0/split-prime-tate
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For ℓ≠p where the separable Frobenius factors split, Tate Proposition 2 and the isotropic image lemma identify the geometric Hom space with the Frobenius commutant; the dimension is independent of ℓ and the integral image is saturated.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F2/shifted-factor-slope
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Let O be a DVR, R,S monic with gcd(R,S)=1 over Frac(O), d=degR>0, and P=R^e S. If monic ψ_n≡R+π^n mod π^(2n) and degψ_n=d, then eventually Res(P,ψ_n)≠0 and v Res(P,ψ_n)=nde+v Res(S,R).
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F2/resultant-recognition
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: If monic P,Q∈O[X] have equal valuations of every common nonzero resultant with monic polynomials lifted from D, and D→O is surjective modulo each π^N, then P=Q. Equal degree, completeness, separability, characteristic zero and finite residue field are unnecessary.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F1/dieudonne-degree-length
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For an isogeny f:A→B over a perfect field, the contravariant map C(f):C(B)→C(A) is injective and length_W coker C(f)=v_p(deg f). For an endomorphism its determinant valuation gives the same value.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F1/p-characteristic-polynomial
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For every u∈End(A), the W(k)-linear map C(u) has characteristic polynomial in Z_p[X] equal to the imported integer characteristic polynomial of u. No semisimplicity of arbitrary u is assumed.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F1/p-tate-proof
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For A,B/F_q, Hom(A,B)⊗Q_p≃Hom_(F,V)(C(B)[1/p],C(A)[1/p]); the integral map is an isomorphism onto the F,V-compatible integral morphisms after its injectivity and p-saturation are proved.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F5/finite-field-abelian-lang
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For B/F_q, the morphism Frob_q−1 on B is an étale surjective isogeny, hence H¹(F_q,B)=0 for the actual Galois torsor cohomology.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P2/completed-poincare
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For coherent ℱ on 𝒢, ℱ̂ = e^{-1}(lim ℱ ⊗ 𝒪_𝒢/𝒥^{n+1}) ≅ ι^*_{𝒢̂}ℱ and ℱ^{(n)} = e^{-1}(ℱ ⊗ 𝒪_𝒢/𝒥^{n+1}) (Definition 2.4). 𝒫̂ = (id × e^∨)^{-1}(lim 𝒫 ⊗ 𝒪_{𝒜×𝒜^{∨(n)}}), an 𝒪_{𝒜×𝒜̂^∨}-module on 𝒜, with 𝒫^{(n)} = (id × π^{∨(n)})_*(𝒫|_{𝒜×𝒜^{∨(n)}}); likewise 𝒫^{♮(n)}, 𝒫̂^♮ with the relative connection ∇ (Definition 2.7). The rigidifications give 𝒫^{(0)} ≅ 𝒪_𝒜, exact sequences 0 → π^*Sym^n(ω_{𝒜^∨}) → 𝒫^{(n)} → 𝒫^{(n−1)} → 0 and 0 → π^*Sym^n(ℋ) → 𝒫^{♮(n)} → 𝒫^{♮(n−1)} → 0, compatible sections 1^{(n)} and 1 : 𝒪_𝒮 → e^*𝒫̂ ≅ 𝒪_{𝒜̂^∨} (equation (2.1.4)), and 𝒫^{(n)} → 𝒫^{♮(n)} ≅ 𝒫^{(n)} ⊗ 𝒪_{𝒜×𝒜^{♮(n)}} (equation (2.1.5)). Completion is along the dual unit and uses the inverse system of finite pushforwards; arbitrary tensor interchange with the limit is not asserted.
API omitted AbelianArithmetic.completedPoincare_truncate: P_hat→P(n) is the projection to the n-th infinitesimal dual neighborhood, and similarly for P♮.
API omitted AbelianArithmetic.completedPoincare_unit: Rigidification gives the compatible unit sections O_S→e^*P(n).
API omitted AbelianArithmetic.completedPoincare_filtration: The nth kernel is π^*Sym^n(ω_A∨), respectively π^*Sym^n(H) in the connection version.
Test omitted AbelianArithmetic.completedPoincare_zero: P(0)≃O_A and P♮(0)≃O_A with trivial relative connection.
Test omitted AbelianArithmetic.completedPoincare_first: P(1) is an extension of O_A by π^*ω_A∨ with the imported unit rigidification.
Test omitted AbelianArithmetic.completedPoincare_base: At every finite level the underlying sheaf is pushforward of the imported rigidified Poincaré sheaf restricted to A×A∨(n), rather than a tensor-power replacement.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F0/frobenius-polynomial
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For A/F_q of dimension g, P_A(X)=det(X−Frob_q|V_ℓA) is a monic polynomial in Z[X] of degree 2g, independent of ℓ, with all complex roots of absolute value √q and coefficients satisfying a_(2g−i)=q^(g−i)a_i. Coefficients a_i are indexed in descending powers: P_A=∑_(i=0)^(2g) a_i X^(2g−i), with a_0=1 and a_(2g)=q^g.
API omitted AbelianArithmetic.frobeniusPolynomial_integral: P_A∈Z[X] is independent of ℓ≠p and has degree 2 dim A.
API omitted AbelianArithmetic.frobeniusPolynomial_reciprocal: Writing P_A=∑a_i X^(2g−i), a_(2g−i)=q^(g−i)a_i for 0≤i≤g, a_0=1 and a_(2g)=q^g.
API omitted AbelianArithmetic.frobeniusPolynomial_product: P_(A×B)=P_A P_B.
API omitted AbelianArithmetic.frobeniusPolynomial_points: #A(F_(q^r))=det(1−π^r) on V_ℓA.
Test omitted AbelianArithmetic.frobeniusPolynomial_zero: For the zero-dimensional abelian variety P_A=1 and the point count is 1.
Test omitted AbelianArithmetic.frobeniusPolynomial_elliptic: For an elliptic curve, P_A=X²−tX+q and #A(F_q)=q+1−t.
Test omitted AbelianArithmetic.frobeniusPolynomial_native: For ℓ≠p its image in Q_ℓ[X] is the imported characteristic polynomial of the Frobenius action on V_ℓA.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F3/marked-lattice-space
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: X^p is the restricted product of Frob-stable full Z_ℓ-lattices in V_ℓ(A₀), equal to T_ℓ(A₀) almost everywhere; X_p is the set of W(F_q)-lattices in D(A₀) stable under both F and V.
API omitted AbelianArithmetic.markedLattice_primeToP: For each ℓ≠p choose a Frobenius-stable full Z_ℓ-lattice in V_ℓA equal to T_ℓA at all but finitely many ℓ.
API omitted AbelianArithmetic.markedLattice_p: At p choose a full W(k)-lattice in the p-realization stable under F and V, in the stated variance convention.
API omitted AbelianArithmetic.markedLattice_action: End⁰(A)^× acts on the tuple through its realization, with the contravariant or linear-dual transport specified.
Test omitted AbelianArithmetic.markedLattice_identity: The identity marking gives precisely the imported T_ℓA and C(A) (or its stated linear dual).
Test omitted AbelianArithmetic.markedLattice_zero: The zero-dimensional abelian variety has one lattice tuple.
Test omitted AbelianArithmetic.markedLattice_support: A tuple differing from the standard lattice at infinitely many primes is excluded from the finite-support space.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F4/adelic-class-set
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For G=(End⁰(A₀))^× and an adelic lattice L, the global orbits inside its G(A_fin)-orbit are G(Q)\G(A_fin)/Stab(L).
API omitted AbelianArithmetic.adelicClassSet_mk: A finite adele in E^×(A_f) determines its double coset modulo left E^×(Q) and right K.
API omitted AbelianArithmetic.adelicClassSet_equiv: g,h have the same class iff h=e g k for e∈E^×(Q),k∈K.
API omitted AbelianArithmetic.adelicClassSet_stabilizer: K is the restricted product of the automorphism groups of the chosen local lattices, including the p-component.
Test omitted AbelianArithmetic.adelicClassSet_rational: Any rational unit e∈E^×(Q) has the identity class.
Test omitted AbelianArithmetic.adelicClassSet_compact: Changing a local lattice by conjugation replaces K by its conjugate and induces the corresponding class-set bijection.
Test omitted AbelianArithmetic.adelicClassSet_notPic: For a nonmaximal order include nonprojective full lattices; its class set is not identified with Pic(R).
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F1/frobenius-block-algebra
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Let L/Q_p be unramified of degree a≥1 with arithmetic Frobenius σ, and let m∈Q_p[X] be monic irreducible with m(0)≠0. Put K=Q_p[X]/m and θ=X mod m. On ⊕_(0≤j<a)(L⊗Qp K)U^j define multiplication by U b=(σ⊗1)(b)U and U^a=θ. This defines a K-algebra B of dimension a². If a semilinear bijection F on an L-vector space V satisfies m(F^a)=0, the actions of L, θ↦F^a and U↦F define a B-module structure on V. The coefficient tensor L⊗Q_p K may be étale with several factors; preserve the σ action on all factors.
API omitted AbelianArithmetic.frobeniusBlock_relation: U c=σ(c)U and U^a=θ on L⊗_(Q_p)K; θ is the chosen q-Frobenius root.
API omitted AbelianArithmetic.frobeniusBlock_dimension: The algebra has K-dimension a² after the coefficient étale algebra is handled correctly.
API omitted AbelianArithmetic.frobeniusBlock_action: On the corresponding isocrystal block, the semilinear F gives an action of this cyclic algebra.
Test omitted AbelianArithmetic.frobeniusBlock_prime: For a=1 the block algebra is K, with U=θ.
Test omitted AbelianArithmetic.frobeniusBlock_split: After a splitting base extension it is a full a×a matrix algebra, with weighted cyclic U and diagonal coefficient action.
Test omitted AbelianArithmetic.frobeniusBlock_product_coeff: If L⊗Q_p K is a product, the construction retains every idempotent and its σ-permutation; it is not replaced by one arbitrarily selected coefficient field.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P2/isogeny-functoriality
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For an isogeny φ : 𝒜 → ℬ, the isomorphisms (φ × id)^*𝒫_ℬ ≅ (id × φ^∨)^*𝒫_𝒜 and their ♮-versions (equation (2.2.1)) give canonical maps φ^{(n)}_# : 𝒫^{(n)}_𝒜 → φ^*𝒫^{(n)}_ℬ and 𝒫^{♮(n)}_𝒜 → φ^*𝒫^{♮(n)}_ℬ, isomorphisms if φ^∨ (resp. φ^♮) is étale (e.g. if deg φ is invertible), and in the limit φ_# : 𝒫̂_𝒜 → φ^*𝒫̂_ℬ, 𝒫̂^♮_𝒜 → φ^*𝒫̂^♮_ℬ.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P2/torsion-splitting
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For an isogeny φ : 𝒜 → ℬ and a φ-torsion section x, φ_# induces φ_{#x} : x^*𝒫̂_𝒜 → x^*φ^*𝒫̂_ℬ ≅ e^*𝒫̂_ℬ ≅ 𝒪_{ℬ̂^∨}; if φ^∨ is étale, 𝒫̂_𝒜|_{ker φ} ≅ π^*_{ker φ}𝒪_{ℬ̂^∨} and there is a canonical ϱ_x : x^*𝒫̂_𝒜 ≅ 𝒪_{𝒜̂^∨}; the same for 𝒫̂^♮ when φ^♮ is étale. Composing with the moment map gives _ϱmom_x : x^*𝒫̂_𝒜 → TSym^̂(ω_{𝒜^∨}) and x^*𝒫̂^♮_𝒜 → TSym^̂(ℋ), with components _ϱmom^b_x.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P2/gamma-equivariance
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: If a discrete group Γ acts on 𝒜/𝒮 by automorphisms, (γ_#)^{-1} : γ^*𝒫̂ ≅ 𝒫̂ and γ^*𝒫̂^♮ ≅ 𝒫̂^♮ make 𝒫̂ and 𝒫̂^♮ Γ-equivariant sheaves.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P2/poincare-comultiplication
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: There are canonical 𝒫^{(n+m)} → 𝒫^{(n)} ⊗_{𝒪_𝒜} 𝒫^{(m)} and 𝒫̂ → 𝒫̂ ⊗̂ 𝒫̂, co-commutative, whose associated graded is induced by the diagonal of ω_{𝒜^∨} (Proposition 2.12, reflecting the partial group law of the Poincaré torsor, Remark 2.13); likewise for 𝒫^♮. Hence 𝒫^{(n)} → TSym^n_{𝒪_𝒜}(𝒫^{(1)}) and 𝒫^{♮(n)} → TSym^n(𝒫^{♮(1)}), isomorphisms if n! is invertible on 𝒮 (Corollary 2.14).
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P2/completed-cohomology
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: R^iπ_*(𝒫̂ ⊗ Ω^d_{𝒜/𝒮}) ≅ 𝒪_𝒮 for i = d and 0 for i ≠ d (from the known higher direct images of the Poincaré bundle); a similar result holds for 𝒫^♮ over a field of characteristic zero (Scheider, Theorem 1.2.1; Remark 2.16).
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P3/logarithm-comparison
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For 𝒮 = Spec k with k of characteristic zero: the first logarithm sheaf is the extension of 𝒟_𝒜-modules 0 → π^*ℋ → Log^{(1)} → 𝒪_𝒜 → 0 mapping to id_ℋ under the local-to-global sequence 0 → Ext^1_{𝒟_𝒮}(𝒪_𝒮, ℋ) → Ext^1_{𝒟_𝒜}(𝒪_𝒜, π^*ℋ) → Hom_{𝒟_𝒮}(ℋ, ℋ) → 0 (equation (2.7.1)), with a fixed splitting 1^{(1)} : e^*Log^{(1)} ≅ 𝒪_𝒮 ⊕ ℋ; Log^{(n)} = Sym^n Log^{(1)} and 𝓛og = lim Log^{(n)} (Huber–Kings). Theorem 2.36 (Scheider, Theorem 2.3.1): there is a canonical isomorphism (Log^{(1)}, ∇, 1^{(1)}) ≅ (𝒫^{♮(1)}, ∇, 1^{(1)}), hence 𝓛og ≅ 𝒫̂^♮ respecting the sections 1 along e. The proof identifies ker(𝒜^♮(𝒮[M]) → 𝒜^♮(𝒮)) = Lie(𝒜^♮/𝒮) ⊗ M ≅ Hom_k(ℋ, M) (Mazur–Messing (4.1.4); equation (2.7.2)) with Ext^1_{𝒟_𝒜}(𝒪_𝒜, π^*M) through pullback of 𝒫^♮. The base here is Spec k with char k=0; no arbitrary-base version is inferred.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P3/smooth-dolbeault
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Over ℂ, with ℂ-bases (ū_1, …, ū_d, u_1, …, u_d) of ℋ ≅ conj(Lie(𝒜/ℂ)) ⊕ Lie(𝒜/ℂ) dual to ∂/∂z̄_i, ∂/∂z_i (Definition 3.3), ν = ν^{1,0} + ν^{0,1} ∈ ℋ ⊗ (ω ⊕ ω̄) the identity (Definition 3.2), and the smooth pro-bundles 𝒫^{(n)}, 𝒫^{♮(n)} ⊗ 𝒞^∞ (Notation 3.4): there is a compatible system of horizontal isomorphisms (𝒫^{♮(n)}, ∇_{𝒞^∞}) ≅ (⊕_{k≤n} TSym^k(ℋ), d + ν) restricting to 𝒫^{(n)} ≅ ⊕_{k≤n} TSym^k(ℋ(Σ̄)) and compatible with the moment map along e. Corollary 3.6: 𝒫^{(n),an}[0] ≅ (𝒫^{(n)} ⊗ ℰ^{0,•}, ∇″) and (𝒫^{(n),an} ⊗ Ω^p)[0] ≅ (𝒫^{(n)} ⊗ ℰ^{p,•}, ∇″) (Dolbeault resolutions).
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P4/ordinary-infinitesimal-trivialization
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For 𝒜 over 𝒪_{ℂ_p} as in Notation 5.1 (CM by 𝒪_L with p-ordinary CM type), let C_n = 𝒜[𝔭_Σ^n], so that lim C_n = 𝒜̂; since [𝔭_Σ^n]^∨ is étale, the splitting principle applied to the diagonal section of 𝒜 × C_n gives a canonical isomorphism 𝒫̂|_{𝒜̂} ≅ 𝒪_{(𝒜×𝒜^∨)^∧} (Proposition 5.9, after Norman's p-adic theta functions). Hence 𝒫^{(1)}|_{𝒜̂} ≅ 𝒪_{𝒜̂} ⊗ (𝒪_{ℂ_p} ⊕ ω_{𝒜^∨}), 𝒫^{♮(1)}|_{𝒜̂} ≅ 𝒪_{𝒜̂} ⊗ (𝒪_{ℂ_p} ⊕ ℋ) and injections 𝒫̂^♮|_{𝒜̂} ↪ 𝒪_{𝒜̂} ⊗̂ TSym^̂(ℋ), 𝒫̂|_{𝒜̂} ↪ 𝒪_{𝒜̂} ⊗̂ TSym^̂(ω_{𝒜^∨}) (equations (5.2.1)–(5.2.4)). On the generic fibre A (Notation 5.10), Lemma 5.11: these become isomorphisms, the splitting of the Hodge filtration gives an 𝒪_Â-linear retraction p of i : 𝒫̂_{ℂ_p}|_Â ↪ 𝒫̂^♮_{ℂ_p}|_Â, and p ∘ ∇ ∘ i corresponds to d ⊗ id on 𝒪_{(A×A^∨)^∧} (equation (5.2.5)); the proof shows the ℋ(Σ)-component η_Σ of ∇(e^{(1)}) satisfies p^2η_Σ = pη_Σ, using [p]_♯.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P4/translation-trivialization
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For y ∈ 𝒜(𝒪_{ℂ_p}) in the kernel of an isogeny φ with étale dual, T_y^*𝒫̂ ≅ 𝒫̂ (always on the generic fibre; Lemma 5.12), and ϱ̂_y : T_y^*𝒫̂|_{𝒜̂} ≅ 𝒫̂|_{𝒜̂} ≅ 𝒪_{(𝒜×𝒜^∨)^∧} (Definition 5.13). Lemma 5.14: (1) mom_{Â^∨} ∘ e^*ϱ̂_y = ϱ_y; (2) ϱ̂_y ∘ p ∘ ∇ ∘ i = d_Â ∘ ϱ̂_y; (3) for s ∈ 𝒜̂[p^n](𝒪_{ℂ_p}) = 𝒜[𝔭_Σ^n](𝒪_{ℂ_p}), translation by s intertwines ϱ̂_y and ϱ̂_{y+s} with (T_s × id)^* (integrally). Integral translation assumes y killed by an isogeny with étale dual; the generic-fibre extension here is for torsion y, not for every point.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B1/dgh-22
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Under (Hyp), for an irreducible X ⊆ A of dimension d and an open Δ ⊆ S^an that is the domain of a Betti map b_Δ with X^{sm,an} ∩ A_Δ ≠ ∅: (ω|_{X^{sm,an}})^{∧d} ≢ 0 iff max_{x} rank_ℝ (db_Δ|_{X^{sm,an}})_x = 2d.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B4/dgh-25
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Let S be an irreducible variety over ℚ̄ with a quasi-finite morphism S → M_g, g ≥ 2, M ≥ 3g − 2 (Gao's theorem is stated over ℂ). Then D_M(C_S^{[M+1]}) ⊆ 𝔄_g^{[M]} ×_{A_g} S is non-degenerate.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B2/definable-ax-set
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Let X ⊆ T^n be closed, definable and of Ax-type, and Γ ⊆ GL_n(ℤ) free on two generators with γ(X) = X for all γ ∈ Γ. Then either X lies in a finite union of proper closed subgroups of T^n, or there are a non-empty open U ⊆ X and a closed connected infinite subgroup G with U + G ⊆ X.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B2/monodromy-invariant-variety
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Let A be a complex abelian variety and Γ ⊆ GL_{2g}(ℤ) act continuously on A^an via a Betti isomorphism, of monodromy type (every abelian subvariety is Γ-stable), containing a free subgroup of rank 2 and with no non-zero invariant vector in ℤ^{2g}. If Z ⊆ A is irreducible closed with Γ(Z(ℂ)) = Z(ℂ), then Z lies in a proper torsion coset, or Z + B = Z for some abelian subvariety B of positive dimension.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B2/monodromy-transport
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Glueing Betti maps along loops gives a homomorphism ρ̃ : π₁(S^an, s) → {homeomorphic group automorphisms of 𝒜_s^an} with ρ̃(h)_* = ρ(h), the monodromy on H₁(𝒜_s^an, ℤ). (i) If P ∈ Y^an over s is not isolated in its Betti fibre in Y, then ρ̃(h)(P) ∈ Y^an for all h, and if P has order N then dim_P Y ∩ 𝒜[N] ≥ 1. (ii) ρ̃ commutes with homomorphisms of abelian schemes.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B2/tits-free-subgroups
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: A subgroup of GL_n over a field of characteristic 0 that is not virtually solvable contains a free subgroup on two generators; in particular a Zariski-dense subgroup of a non-trivial connected semisimple group does ([Tit72, Thm. 3]).
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B2/free-monodromy
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: If G⁰_s is non-trivial, every finite-index subgroup of Γ_s = ρ(π₁(S^an, s)) contains a free subgroup on two generators.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B2/invariant-homology-trace
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: If H₁(𝒜_s^an, ℤ) has a non-zero monodromy-invariant element, then the ℂ(S)/ℂ-trace of the generic fibre is non-zero (over ℂ(S) itself, as Lemma 5.8 needs).
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B2/virtual-invariant-kernel
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Let Y ⊆ 𝒜 be irreducible closed dominating S, virtually monodromy invariant (some component of Y_s is ρ̃-stable under a finite-index subgroup) above every point of an uncountable set of extendable points, and suppose the generic fibre of 𝒜 ×_S S′ has trivial trace for every finite étale S′ → S. Then there is a homomorphism 𝒜 → 𝒞 of abelian schemes over S whose kernel contains Y and has dimension dim Y.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B2/degenerate-generically-special
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Over a smooth irreducible complex curve S, an irreducible closed subvariety of 𝒜 that is degenerate is generically special.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B2/full-rank-algebraic-point
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: If X ⊆ 𝒜, defined over F and dominating S, is not generically special, there is P ∈ X^{sm}(F) with π(P) ∈ Δ and P ∈ (X_{π(P)})^{sm} such that dim im T_P(b|_{X^{sm,an} ∩ 𝒜_Δ}) = 2 dim X (6.1).
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B2/invariance-of-domain
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: A continuous injective map f:U→ℝ^m from an open subset U⊆ℝ^m is open and is a homeomorphism onto its image. Consequently the same local assertion holds between real m-manifolds.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B2/real-constant-rank
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For a C^k map f:M^m→N^n of finite-dimensional real manifolds, 1≤k≤∞, with differential of constant rank r on an open neighbourhood, local C^k coordinates put f in projection form. Each nonempty fibre in that neighbourhood is a C^k submanifold of dimension m−r. Apply to the real-analytic Betti map on its smooth maximal-rank locus, where m=2 dim X.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B2/closed-torus-subgroups
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Every closed subgroup H⊆(ℝ/ℤ)^n is the common kernel of a subgroup Λ≤ℤ^n of integer characters: H={x: m·x=0 in ℝ/ℤ for every m∈Λ}. Since Λ is finitely generated, finitely many integer equations suffice, and the set of closed subgroups of this finite-dimensional torus is countable.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B2/riemann-good-cover
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Every open cover of a second-countable Hausdorff Riemann surface has a locally finite refinement by relatively compact coordinate neighbourhoods such that every nonempty finite intersection is contractible. In the connected noncompact intersections used here these are topological open discs.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B4/gao-fibre-power
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Let A → S be an abelian scheme over an irreducible base and X ⊆ A an irreducible subvariety dominating S with (a) relative dimension ≥ 1, (b) X_s generating A_s for all s, (c) X_η of finite stabilizer. If m ≥ dim S and ι^{[m]}|_{X^{[m]}} (the moduli map to 𝔄_g^{[m]}) is generically finite, then X^{[m]} ⊆ A^{[m]} is non-degenerate. Work with a geometrically irreducible generic fibre, or select a dominating component after the quasi-finite étale cover in survey footnote 6; the whole reducible fibre product is not called irreducible.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B1/nonzero-smooth-point
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: If X ⊆ A → S is non-degenerate, there is a smooth point z ∈ X^{sm}(ℂ), which may be taken over a smooth point of S, with (ω|_X)^{∧ dim X}_z ≠ 0 (an open condition).
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:B4/difference-product
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: If X^{[m]}_{S′} is non-degenerate, then so is D(X^{[m(M+2)]}_{S′}) = X^{[m]}_{S′} ×_{S′} D₀((X^{[m]}_{S′})^{[M+1]}) ⊆ A^{[m(M+1)]}_{S′}. For arbitrary abelian families the group-valued difference is the native group-law specialization; the curve case uses the imported Jacobian map. Choose the dominating irreducible components when needed.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F0/weil-q-number
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For q=p^a with p prime and a≥1, a Weil q-number is an algebraic integer π whose image under every complex embedding of Q(π) has absolute value sqrt(q). Classification uses conjugacy classes of these numbers, not arbitrary reciprocal polynomials of degree 2g.
API omitted AbelianArithmetic.weilQNumber_norm: For every embedding σ:Q(π)→C, |σπ|²=q.
API omitted AbelianArithmetic.weilQNumber_conjugate: Algebraic conjugates of a Weil q-number are Weil q-numbers.
API omitted AbelianArithmetic.weilQNumber_power: π^r is a Weil q^r-number for r≥1.
Test omitted AbelianArithmetic.weilQNumber_real: ±sqrt(p) are Weil p-numbers and have minimal polynomial X²−p.
Test omitted AbelianArithmetic.weilQNumber_one: For q>1 the algebraic integer 1 is not a Weil q-number.
Test omitted AbelianArithmetic.weilQNumber_frobenius: Every Frobenius eigenvalue of the imported characteristic polynomial of A/F_q is a Weil q-number.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F0/tate-hom
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For A,B/F_q and ℓ≠p, Hom_Fq(A,B)⊗Z_ℓ→Hom_Gal(T_ℓA,T_ℓB) is an isomorphism; rationalizing gives the analogous Q_ℓ statement.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F0/tate-isotropic-image
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Let A/k have a k-polarization θ of degree d², let ℓ≠char(k), and assume Tate’s Hyp(k,A,d,ℓ): only finitely many k-isomorphism classes B admitting a degree-d² k-polarization and an ℓ-power isogeny B→A. Every Galois-stable maximal isotropic Q_ℓ-subspace W⊆V_ℓ(A) for θ is the image of some u∈End_k(A)⊗Q_ℓ.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F1/integral-p-tate
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For abelian varieties A,B/F_q, let C(A),C(B) be the contravariant Dieudonné modules of their p-divisible groups over W(F_q), with their F,V actions. The natural map Hom_Fq(A,B)⊗Z_p→Hom_{W(F_q),F,V}(C(B),C(A)) is an isomorphism.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F1/rational-p-tate
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For A,B/F_(p^a), Hom_k(A,B)⊗Q_p→Hom_(L,F)(C(B)[1/p],C(A)[1/p]) is an isomorphism of Q_p-vector spaces. For A=B it identifies End⁰_k(A)^op⊗Q_p with the equivariant endomorphism algebra.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F1/p-hom-saturation
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For A,B/F_(p^a), the natural map j:Hom_k(A,B)⊗Z_p→Hom_(W,F,V)(C(B),C(A)) is injective with p-saturated image. This statement does not assume rational p-Tate or equality of ranks.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F1/q-frobenius-semisimple
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For A/F_(p^a), C(π_A)=F^a is an L-linear semisimple endomorphism of C(A)[1/p], where π_A is the q-power Frobenius. Its characteristic polynomial is P_A. No semisimplicity claim for arbitrary endomorphisms is included.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F1/cyclic-block-split
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: The algebra B in p-frobenius-block-algebra is central simple over K. For an algebraic closure Ω/K, B⊗K Ω≅M_a(Ω). In particular the conclusion includes the cases where L⊗Qp K is a product of fields.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F1/p-commutant-dimension
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For A/F_(p^a), factor P_A=∏m_i^(e_i) over Q_p into distinct monic irreducibles of degrees d_i. For V=C(A)[1/p] and R=L[F,F^(-1)], dim_Qp End_R(V)=Σ_i d_i e_i².
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F1/p-local-invariant
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Let A/F_(p^a) be simple, with Frobenius π and center Q(π) of E=End⁰_k(A). For v|p put K=Q(π)_v, e_v=ord_v(p) and f_v its residue degree, with ord_v a uniformizer-normalized valuation. Then inv_v(E)=f_v ord_v(π)/a=[K:Q_p]ord_v(π)/ord_v(p^a) in Q/Z.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Simple F_q-isogeny classes correspond to conjugacy classes of q-Weil algebraic integers π. The dimension is determined by 2 dim A=[Q(π):Q] sqrt([End⁰(A):Q(π)]), with the division-algebra local invariants prescribed by π.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F3/isogeny-polynomial
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Two abelian varieties over F_q are F_q-isogenous exactly when their Frobenius characteristic polynomials agree.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-end-algebra
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: If A/F_p is simple and Q(Frob) has no real embedding, End⁰_Fp(A)=Q(Frob) is a CM field.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-orders
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: In the preceding simple F_p-isogeny class, every order R in Q(Frob) containing Frob and p/Frob occurs as End_Fp(A′) for some A′ in that class.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F3/marked-quasi-isogeny
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Isomorphism classes of pairs (A,f:A→A₀ a rational quasi-isogeny) correspond to X_p×X^p via covariant realization transport.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F3/rational-orbits
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: The underlying F_q-isomorphism classes in the isogeny class of A₀ are End⁰(A₀)^×\(X_p×X^p).
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-p-frobenius
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For A/F_p the linear Frobenius F on C(A)⊗Q_p, and hence its transpose on D^lin(A), is semisimple and has characteristic polynomial equal to the intrinsic degree-2dim(A) Frobenius polynomial P_A(T)∈Z[T] occurring on every V_ℓ(A), ℓ≠p.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-realization
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Fix A₀/F_p. Let M_ℓ be full π-stable Z_ℓ-lattices in V_ℓ(A₀) for ℓ≠p and M_p a full F,V-stable Z_p-lattice in D^lin(A₀), equal to the reference realization lattices T₀,ℓ at all but finitely many primes. There exist B/F_p and a rational quasi-isogeny f:B→A₀ with transported realization lattices f_ℓ(T_ℓB)=M_ℓ, including D^lin at p.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F3/prime-field-classification
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For A₀/F_p, the transport map is a bijection from isomorphism classes of marked pairs (B,f:B→A₀ a rational quasi-isogeny) to the finite-support lattice tuples of prime-field-lattice-realization. Here (B,f)≅(B′,f′) means an F_p-isomorphism u:B→B′ with f′u=f. Under this bijection Γ=End⁰_Fp(A₀)^× acts by postcomposition, and Γ-orbits are precisely underlying F_p-isomorphism classes in the isogeny class of A₀.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F4/adelic-stabilizers
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For A₀/F_p and the prime-field lattice space X, use Tate full faithfulness at all primes to identify G(Q_ℓ), G=End⁰_Fp(A₀)^×, with the linear Frobenius centralizer. Let D_* be L8’s unequal-root-occurrence discriminant product. There is a compact open K₀=∏H₀,ℓ of G(A_f) such that every M∈X has Stab(M)=∏S_M,ℓ contained in a conjugate K_M=a_M K₀a_M^(−1), with a_M∈G(A_f) supported at finitely many places, S_M,ℓ=H_M,ℓ almost everywhere, and [K_M:Stab(M)]≤D_*. Moreover #G(A_f)\X≤D_*².
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F4/prime-p-centralizer
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For A₀/F_p, F is Q_p-linear and V=pF^(−1); hence the simultaneous centralizer of F,V is the centralizer of F, and its orbits on F,V-stable lattices form a subset of its orbits on F-stable lattices.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F4/reduced-norm-class-comparison
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Let K₀=Q(√p), D₀/K₀ the quaternion algebra ramified at both real places and split at every finite place, and d≥2. With maximal finite compact U₀,d=∏_v GL_(2d)(O_(K₀,v)), reduced norm identifies GL_d(D₀)(K₀)\GL_d(D₀)(A_(K₀,fin))/U₀,d with the narrow ideal class group Cl⁺(K₀). For each CM field K_i, determinant identifies GL_(n_i)(K_i)\GL_(n_i)(A_(K_i,fin))/GL_(n_i)(Ohat_(K_i)) with Cl(K_i). Their product gives the mixed class set. The d=1 quaternion factor remains its own class set; d=0 omits it.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F4/ordered-root-discriminant
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: If K=Q(π), π is an integral p-Weil number of degree d, then |D_K|≤|disc minpoly(π)|≤(2√p)^(d(d−1)).
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F4/conditional-orbit-bound
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Let a group G_f with subgroup Γ act on a lattice space X, with at most D_*² G_f-orbits. Suppose h=#(Γ\G_f/K₀)<∞ for a fixed compact level K₀. For every orbit representative M assume Stab(M)=∏S_{M,ℓ}, contained in K_M=∏H_{M,ℓ}=a_M K₀ a_M⁻¹ with a_M∈G_f, equality S_{M,ℓ}=H_{M,ℓ} away from finitely many primes, and ∏[H_{M,ℓ}:S_{M,ℓ}]≤D_*. Then Γ\X is finite and #Γ\X≤D_*³h. If the relevant Weil-lattice tuple satisfies these assumptions and D_*≤(2√p)^{m(m−1)}, the resulting conditional bound is #Γ\X≤(2√p)^{3m(m−1)}h.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F4/fixed-level-class-bound
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For A₀/F_p of dimension g>0, put m=2g, take D_* and K₀ from prime-field-adelic-stabilizers, and suppose h=#(G(Q)\G(A_f)/K₀) is finite. Then the number of F_p-isomorphism classes in the isogeny class of A₀ is at most D_*³h≤(2√p)^{3m(m−1)}h. Class-set finiteness is imported from AA.3 with its exact group hypotheses; no numerical bound on h is included.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F5/polarization-line-bundle-descent
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For A over a finite field, every symmetric isogeny A→A∨ is φ_L for some line bundle over that field.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F5/ambiguous-unit-norms
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Let L/K be a cyclic extension of number fields of prime degree. There is an exact sequence 1 → Am_st(L/K) → Am(L/K) → (E_K ∩ N_(L/K)L^×)/N_(L/K)E_L → 1, where Am(L/K) ⊂ Cl(L) is the group of ambiguous ideal classes and Am_st(L/K) its subgroup of strongly ambiguous classes. In particular (E_K ∩ N L^×)/N E_L is a subquotient of Cl(L) and its order is at most h(L).
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F5/squarefree-polarization-bound
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For A/F_p of dimension g with no repeated simple isogeny factor and P_A coprime to X²−p, the source proves n_A≪p^(C g²) for some absolute C.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F5/nine-cm-split-density
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: The nine imaginary quadratic fields of class number one have independent square classes; outside their finite ramified-prime set, the primes splitting in at least one have natural density 1−2^(−9).
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F5/cm-elliptic-existence
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: If a prime p splits in an imaginary quadratic class-number-one field L, there exists E/F_p with End_Fp(E)=O_L, obtained from a norm-p algebraic integer and Waterhouse order realization.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F5/elliptic-pgroups
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Let p be an odd prime and E/F_p an elliptic curve. Then E(F_p) and E(F_(p²)) are not both p-groups. For p = 2 the statement is false exactly for the curves with trace a = ±1, for example y²+xy = x³+x²+1 (a = 1), with #E(F_2) = 2 and #E(F_4) = 8.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F0/point-count-isogeny
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For A/F_q, #A(F_(q^r))=det(1−Frob_q^r|V_ℓA), so point counts are invariant under F_q-isogeny and multiply on products.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F6/weil-polynomial-count
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For q≥2 and g≥1, the number of monic reciprocal integer polynomials of degree 2g with constant q^g and all roots of absolute value √q is at most (4g+1)^g q^(g(g+1)/4).
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F6/isogeny-class-asymptotic
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For fixed q, the number of dimension-g F_q-isogeny classes is at most exp((log q)g²/4+O_q(g log g)).
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F6/ordinary-isogeny-lower
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For every positive integer n and prime power q, the number #O(q,n) of isogeny classes of ordinary n-dimensional abelian varieties over F_q satisfies #O(q,n) > c_4 (c_5 n)^(−2 log 2/log q) (2^n/n!) (r(q) q^(n/2) − n) q^(n(n−1)/4), where c_4 = e^(−3/2), c_5 = 2+√2 and r(q) = φ(q)/q. Hence, with Lemma 2.1 corrected, the logarithm of the number of isogeny classes of g-dimensional abelian varieties over F_q is (1/4)g² log q (1+o(1)) as g→∞, for every fixed q.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F6/repaired-unpolarized-count
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Fix a prime p and let B(p,g) count isomorphism classes of g-dimensional abelian varieties over F_p. Then log B(p,g)=O_p(g²). The argument corrected in Lee arXiv:2002.04420v3 §3.1 gives B(p,g)≤2^(34g²)·p^((69/4)g²(1+o(1))) (Theorem 1.1). The printed 17/2 exponent is not established (E21). Lee states B(p,g)≤p^((45/4)g²(1+o(1))) in Theorems 1.4/3.4, but the cited v3 proof uses the false repeated-root estimate (11), recorded in E22; that sharper bound is not a verified target on this proof evidence.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F5/elliptic-power-polarizations
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Let p be a prime that splits in K = Q(√−d) for one of the nine imaginary quadratic fields of class number one (these primes have density 1−2^(−9)). Then there is an elliptic curve E/F_p with End(E) = O_K, and the number of isomorphism classes of principal polarizations on E^g is exp((1/2)g² log g + O_p(g²)). (Printed: exp(g² log g + O(g²)).)
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F6/repeated-factor-dominance
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: Let p be a prime satisfying the corrected conclusion of Lemma 5.11 (for instance, p splits in one of the nine imaginary quadratic fields of class number one). Among isomorphism classes of g-dimensional principally polarized abelian varieties over F_p, the proportion whose underlying abelian variety has no repeated F_p-simple isogeny factor and has Frobenius characteristic polynomial coprime to x²−p tends to 0 as g→∞.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:F6/power-sum-reconstruction
The actual relative sheaf/group/connection, analytic Betti bundle, Dieudonné, number-field or source-proof interface in this statement is not available as a verified native carrier. A replacement Prop field or synthetic carrier would obscure its hypotheses.
Statement: For a monic degree2g integer polynomial satisfying q-reciprocity in descending coefficient convention, its first g power sums determine the entire polynomial. Newton recurrence i·a_i=−∑_(j=1)^i a_(i−j)s_j determines a_i over Q, and reciprocity determines the remaining coefficients.
-/

/- Omitted AbelianSchemesAndArithmeticModuliPartII:P0/degree-two-baseline
No compiled Tau Ceti build at its pinned commit supplies the binary comparison import.
Statement: Under the native PiTensorProduct binary tensor equivalence, TSym²_R(M) is TauCeti.symmetricTensors R M, the eqLocus of TensorProduct.comm and identity. This compares invariant submodules; it does not identify the invariant lattice with the coinvariant SymmetricPower quotient integrally.
-/
