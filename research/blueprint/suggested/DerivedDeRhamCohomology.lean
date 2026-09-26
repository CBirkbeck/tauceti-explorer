/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. All proposed results remain unchecked.

The ordinary algebraic tranche uses the pinned Kähler and exterior-power types.
The seven inherited enhanced/derived nodes are documented at the end: no opaque
Prop-valued replacement is used for their missing coherent infrastructure.
-/
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.RingTheory.Kaehler.Polynomial
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.ExteriorAlgebra.Grading
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.Algebra.Homology.HomologicalComplex
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Data.ZMod.Basic
import TauCeti.RingTheory.Kaehler.MapSemilinear

open CategoryTheory ExteriorAlgebra
open scoped TensorProduct
noncomputable section
namespace TauCeti.DeRham
universe u
variable (A B : Type u) [CommRing A] [CommRing B] [Algebra A B]

-- Notation for existing carriers; these introduce no new mathematical objects.
abbrev Forms (n : ℕ) := exteriorPower B n (KaehlerDifferential A B)
abbrev Symbols (n : ℕ) := (B × (Fin n → B)) →₀ A
abbrev sym (n : ℕ) (c : B) (v : Fin n → B) : Symbols A B n :=
  Finsupp.single (c, v) 1
abbrev elementary (n : ℕ) (c : B) (v : Fin n → B) : Forms A B n :=
  c • exteriorPower.ιMulti B n (fun i => KaehlerDifferential.D A B (v i))
abbrev wedge {m n : ℕ} (x : Forms A B m) (y : Forms A B n) : Forms A B (m+n) :=
  ⟨x.val * y.val, SetLike.mul_mem_graded x.property y.property⟩
abbrev zeroForm (b : B) : Forms A B 0 :=
  (exteriorPower.zeroEquiv B (KaehlerDifferential A B)).symm b

-- The six displayed relation families, as an explicit set in the free A-module.
-- Only additive and A-scalar closure in the coefficient is imposed.
def relationSet (n : ℕ) : Set (Symbols A B n) :=
  {x | (∃ c e v, x = sym A B n (c+e) v - sym A B n c v - sym A B n e v) ∨
    (∃ (a : A) (c : B) (v : Fin n → B), x = sym A B n (a • c) v - a • sym A B n c v) ∨
    (∃ c v i b e, x = sym A B n c (Function.update v i (b+e)) -
      sym A B n c (Function.update v i b) - sym A B n c (Function.update v i e)) ∨
    (∃ c v i b e, x = sym A B n c (Function.update v i (b*e)) -
      sym A B n (c*b) (Function.update v i e) -
      sym A B n (c*e) (Function.update v i b)) ∨
    (∃ (c : B) (v : Fin n → B) (i : Fin n) (a : A), x = sym A B n c (Function.update v i (algebraMap A B a))) ∨
    (∃ c v i j, i ≠ j ∧ v i = v j ∧ x = sym A B n c v)}

-- DerivedDeRhamCohomology:DD.2/symbol-relations
def symbolRelations (n : ℕ) : Submodule A (Symbols A B n) := by sorry
lemma symbolRelations_eq_span (n : ℕ) : symbolRelations A B n = Submodule.span A (relationSet A B n) := by sorry
lemma symbolRelations_coeff_add (n : ℕ) (c e : B) (v : Fin n → B) : sym A B n (c+e) v - sym A B n c v - sym A B n e v ∈ symbolRelations A B n := by sorry
lemma symbolRelations_slot_mul (n : ℕ) (c x y : B) (v : Fin n → B) (i : Fin n) : sym A B n c (Function.update v i (x*y)) - sym A B n (c*x) (Function.update v i y) - sym A B n (c*y) (Function.update v i x) ∈ symbolRelations A B n := by sorry
-- test_relations_degree_zero: The degree-zero relation [0;()] belongs to R₀.
example  : sym A B 0 0 Fin.elim0 ∈ symbolRelations A B 0 := by sorry
-- test_relations_constant_slot: A differential slot filled with an element from A is zero in the quotient.
example (c : B) (a : A) : sym A B 1 c (fun _ => algebraMap A B a) ∈ symbolRelations A B 1 := by sorry
-- test_relations_diagonal_char_two: Over F₂, the diagonal degree-two symbol is itself a relation, not merely twice that symbol.
example (x : Polynomial (ZMod 2)) : sym (ZMod 2) (Polynomial (ZMod 2)) 2 1 (fun _ => x) ∈ symbolRelations (ZMod 2) (Polynomial (ZMod 2)) 2 := by sorry

-- DerivedDeRhamCohomology:DD.2/symbol-map
def symbolMap (n : ℕ) : Symbols A B n →ₗ[A] Forms A B n := by sorry
lemma symbolMap_smul (n : ℕ) (a : A) (s : Symbols A B n) : symbolMap A B n (a • s) = a • symbolMap A B n s := by sorry
lemma symbolMap_single (n : ℕ) (c : B) (v : Fin n → B) : symbolMap A B n (sym A B n c v) = elementary A B n c v := by sorry
lemma symbolMap_add (n : ℕ) (x y : Symbols A B n) : symbolMap A B n (x+y) = symbolMap A B n x + symbolMap A B n y := by sorry
-- test_symbolMap_zero_degree: Evaluation in weight zero agrees with the existing zeroEquiv.
example (c : B) : (exteriorPower.zeroEquiv B (KaehlerDifferential A B)) (symbolMap A B 0 (sym A B 0 c Fin.elim0)) = c := by sorry
-- test_symbolMap_one_degree: Evaluation in weight one agrees with c times the universal derivation.
example (c x : B) : (exteriorPower.oneEquiv B (KaehlerDifferential A B)) (symbolMap A B 1 (sym A B 1 c (fun _ => x))) = c • KaehlerDifferential.D A B x := by sorry
-- test_symbolMap_repeated: The image of [c;x,x] is zero in every characteristic.
example (c x : B) : symbolMap A B 2 (sym A B 2 c (fun _ => x)) = 0 := by sorry

-- DerivedDeRhamCohomology:DD.2/symbol-map-surjective
lemma symbolMap_surjective (n : ℕ) : Function.Surjective (symbolMap A B n) := by sorry

-- DerivedDeRhamCohomology:DD.2/symbol-relations-kernel
lemma symbolRelations_ker (n : ℕ) : LinearMap.ker (symbolMap A B n) = symbolRelations A B n := by sorry

-- DerivedDeRhamCohomology:DD.2/free-symbol-differential
def freeDifferential (n : ℕ) : Symbols A B n →ₗ[A] Forms A B (n+1) := by sorry
lemma freeDifferential_smul (n : ℕ) (a : A) (s : Symbols A B n) : freeDifferential A B n (a • s) = a • freeDifferential A B n s := by sorry
lemma freeDifferential_add (n : ℕ) (s t : Symbols A B n) : freeDifferential A B n (s+t) = freeDifferential A B n s + freeDifferential A B n t := by sorry
lemma freeDifferential_single (n : ℕ) (c : B) (v : Fin n → B) : freeDifferential A B n (sym A B n c v) = exteriorPower.ιMulti B (n+1) (Fin.cons (KaehlerDifferential.D A B c) (fun i => KaehlerDifferential.D A B (v i))) := by sorry
-- test_freeDifferential_unit: Symbols with coefficient one have zero differential.
example (n : ℕ) (v : Fin n → B) : freeDifferential A B n (sym A B n 1 v) = 0 := by sorry
-- test_freeDifferential_zero_degree: In weight zero the free differential agrees with D after oneEquiv.
example (c : B) : (exteriorPower.oneEquiv B (KaehlerDifferential A B)) (freeDifferential A B 0 (sym A B 0 c Fin.elim0)) = KaehlerDifferential.D A B c := by sorry
-- test_freeDifferential_diagonal: δ₁([x;x])=Dx∧Dx=0.
example (x : B) : freeDifferential A B 1 (sym A B 1 x (fun _ => x)) = 0 := by sorry

-- DerivedDeRhamCohomology:DD.2/free-differential-relations
lemma freeDifferential_relations (n : ℕ) : symbolRelations A B n ≤ LinearMap.ker (freeDifferential A B n) := by sorry

-- DerivedDeRhamCohomology:DD.2/ordinary-differential
def d (n : ℕ) : Forms A B n →ₗ[A] Forms A B (n+1) := by sorry
-- test_d_two_variables: the sign and nonzero value in Z[X,Y].
example :
    let B := MvPolynomial (Fin 2) ℤ
    let x : B := MvPolynomial.X 0
    let y : B := MvPolynomial.X 1
    let dx := KaehlerDifferential.D ℤ B x
    let dy := KaehlerDifferential.D ℤ B y
    d ℤ B 1 (elementary ℤ B 1 x (fun _ => y)) =
      exteriorPower.ιMulti B 2 (Fin.cons dx (fun _ => dy)) ∧
      exteriorPower.ιMulti B 2 (Fin.cons dx (fun _ => dy)) ≠ 0 := by sorry
lemma d_add (n : ℕ) (x y : Forms A B n) : d A B n (x+y) = d A B n x + d A B n y := by sorry
lemma d_base_smul (n : ℕ) (a : A) (x : Forms A B n) : d A B n (a • x) = a • d A B n x := by sorry
lemma d_zero_degree (b : B) : (exteriorPower.oneEquiv B (KaehlerDifferential A B)) (d A B 0 (zeroForm A B b)) = KaehlerDifferential.D A B b := by sorry
-- test_d_base_constant: The differential of the image of a base-ring constant is zero.
example (a : A) : d A B 0 (zeroForm A B (algebraMap A B a)) = 0 := by sorry
-- test_d_polynomial_X: The differential of X in Z[X] over Z is nonzero, so the zero operator fails.
example  : d ℤ (Polynomial ℤ) 0 (zeroForm ℤ (Polynomial ℤ) Polynomial.X) ≠ 0 := by sorry
-- test_d_polynomial_X_char_two: The differential of X in F₂[X] over F₂ is still nonzero.
example  : d (ZMod 2) (Polynomial (ZMod 2)) 0 (zeroForm (ZMod 2) (Polynomial (ZMod 2)) Polynomial.X) ≠ 0 := by sorry

-- DerivedDeRhamCohomology:DD.2/differential-generator-formula
lemma d_elementary (n : ℕ) (c : B) (v : Fin n → B) : d A B n (elementary A B n c v) = exteriorPower.ιMulti B (n+1) (Fin.cons (KaehlerDifferential.D A B c) (fun i => KaehlerDifferential.D A B (v i))) := by sorry

-- DerivedDeRhamCohomology:DD.2/differential-uniqueness
lemma d_unique (n : ℕ) (f : Forms A B n →ₗ[A] Forms A B (n+1)) (h : ∀ c v, f (elementary A B n c v) = exteriorPower.ιMulti B (n+1) (Fin.cons (KaehlerDifferential.D A B c) (fun i => KaehlerDifferential.D A B (v i)))) : f = d A B n := by sorry

-- DerivedDeRhamCohomology:DD.2/differential-square-zero
lemma d_squared (n : ℕ) : (d A B (n+1)).comp (d A B n) = 0 := by sorry

-- DerivedDeRhamCohomology:DD.2/differential-graded-leibniz
lemma d_leibniz (m n : ℕ) (x : Forms A B m) (y : Forms A B n) :
    (d A B (m+n) (wedge A B x y)).val =
      (d A B m x).val * y.val + (-1 : B)^m • (x.val * (d A B n y).val) := by sorry

-- DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex
def complex : CochainComplex (ModuleCat A) ℕ :=
  CochainComplex.of (fun n => ModuleCat.of A (Forms A B n))
    (fun n => ModuleCat.ofHom (d A B n)) (by intro n; sorry)
lemma complex_X (n : ℕ) : (complex A B).X n = ModuleCat.of A (Forms A B n) := by sorry
lemma complex_d_apply (n : ℕ) (x : Forms A B n) : (complex A B).d n (n+1) x = d A B n x := by sorry
lemma complex_d_nonadjacent (i j : ℕ) (h : i+1 ≠ j) : (complex A B).d i j = 0 := by sorry
-- test_complex_degree_zero: The first arrow agrees with the universal derivation after the existing degree-one equivalence.
example (b : B) : (exteriorPower.oneEquiv B (KaehlerDifferential A B)) ((complex A B).d 0 1 (zeroForm A B b)) = KaehlerDifferential.D A B b := by sorry
-- test_complex_two_steps: The first two arrows compose to zero on each b.
example (b : B) : (complex A B).d 1 2 ((complex A B).d 0 1 (zeroForm A B b)) = 0 := by sorry
-- test_complex_base_ring: Over A→A the first differential is zero.
example  : (complex A A).d 0 1 = 0 := by sorry

variable {A B}
variable {C E : Type u} [CommRing C] [CommRing E] [Algebra A C] [Algebra A E]

-- DerivedDeRhamCohomology:DD.2/forms-pullback
def pullback (f : B →ₐ[A] C) (n : ℕ) : Forms A B n →ₛₗ[f.toRingHom] Forms A C n := by sorry
lemma pullback_add (f : B →ₐ[A] C) (n : ℕ) (x y : Forms A B n) : pullback f n (x+y) = pullback f n x + pullback f n y := by sorry
lemma pullback_smul (f : B →ₐ[A] C) (n : ℕ) (b : B) (x : Forms A B n) : pullback f n (b • x) = f b • pullback f n x := by sorry
lemma pullback_base_smul (f : B →ₐ[A] C) (n : ℕ) (a : A) (x : Forms A B n) : pullback f n (a • x) = a • pullback f n x := by sorry
-- test_pullback_zero_degree: Degree-zero pullback agrees with f under the existing zero equivalence.
example (f : B →ₐ[A] C) (b : B) : pullback f 0 (zeroForm A B b) = zeroForm A C (f b) := by sorry
-- test_pullback_one_degree: Degree-one pullback agrees with the pinned Kaehler mapSemilinear.
example (f : B →ₐ[A] C) (x : Forms A B 1) : (exteriorPower.oneEquiv C (KaehlerDifferential A C)) (pullback f 1 x) = KaehlerDifferential.mapSemilinear f ((exteriorPower.oneEquiv B (KaehlerDifferential A B)) x) := by sorry
-- test_pullback_identity_two: The identity fixes an arbitrary degree-two form.
example (x : Forms A B 2) : pullback (AlgHom.id A B) 2 x = x := by sorry

-- DerivedDeRhamCohomology:DD.2/pullback-differential
lemma pullback_d (f : B →ₐ[A] C) (n : ℕ) (x : Forms A B n) : pullback f (n+1) (d A B n x) = d A C n (pullback f n x) := by sorry

-- DerivedDeRhamCohomology:DD.2/pullback-wedge
lemma pullback_wedge (f : B →ₐ[A] C) (m n : ℕ) (x : Forms A B m) (y : Forms A B n) : pullback f (m+n) (wedge A B x y) = wedge A C (pullback f m x) (pullback f n y) := by sorry

-- DerivedDeRhamCohomology:DD.2/pullback-identity
lemma pullback_id (n : ℕ) (x : Forms A B n) : pullback (AlgHom.id A B) n x = x := by sorry

-- DerivedDeRhamCohomology:DD.2/pullback-composition
lemma pullback_comp (f : B →ₐ[A] C) (g : C →ₐ[A] E) (n : ℕ) (x : Forms A B n) : pullback (g.comp f) n x = pullback g n (pullback f n x) := by sorry

-- DerivedDeRhamCohomology:DD.2/ordinary-complex-map
def complexMap (f : B →ₐ[A] C) : complex A B ⟶ complex A C := by sorry
lemma complexMap_apply (f : B →ₐ[A] C) (n : ℕ) (x : Forms A B n) : (complexMap f).f n x = pullback f n x := by sorry
lemma complexMap_id : complexMap (AlgHom.id A B) = 𝟙 (complex A B) := by sorry
lemma complexMap_comp (f : B →ₐ[A] C) (g : C →ₐ[A] E) : complexMap (g.comp f) = complexMap f ≫ complexMap g := by sorry
-- test_complexMap_constant: In degree zero, the complex map takes b to f(b).
example (f : B →ₐ[A] C) (b : B) : (complexMap f).f 0 (zeroForm A B b) = zeroForm A C (f b) := by sorry
-- test_complexMap_identity: The identity map of B induces the identity in degree one.
example (x : Forms A B 1) : (complexMap (AlgHom.id A B)).f 1 x = x := by sorry
-- test_complexMap_d: The degree-one image of db is d(fb).
example (f : B →ₐ[A] C) (b : B) : (complexMap f).f 1 (d A B 0 (zeroForm A B b)) = d A C 0 (zeroForm A C (f b)) := by sorry

-- DerivedDeRhamCohomology:DD.2/pullback-elementary
lemma pullback_elementary (f : B →ₐ[A] C) (n : ℕ) (c : B) (v : Fin n → B) : pullback f n (elementary A B n c v) = elementary A C n (f c) (fun i => f (v i)) := by sorry

-- DerivedDeRhamCohomology:DD.3/frobenius-linear-differential
lemma d_frobenius_smul (p : ℕ) [Fact p.Prime] [CharP A p] [CharP B p]
        (n : ℕ) (b : B) (x : Forms A B n) :
        d A B n (b^p • x) = b^p • d A B n x := by sorry

end TauCeti.DeRham

/-
The following are REQUIRED INHERITED CONTINUATION TARGETS.
They are not Lean declarations and are not counted as elaborated signatures.
The enhanced/animated/filtered infrastructure gap is recorded in the packet.

DerivedDeRhamCohomology:DD.2/polynomial-resolution-derham
TauCeti.DerivedDeRham.ofPolynomialResolution
For a ring map A→B (or a map of simplicial commutative rings) define dR_(B/A)=|Ω*_(P•/A)|∈D(Mod_A), the direct-sum totalization along antidiagonals of the simplicial cochain complex n↦Ω*_(P_n/A), where P•→B is the canonical free A-algebra resolution. It carries an E∞-algebra structure and a decreasing, separated, exhaustive, multiplicative Hodge filtration Fil_H. The source asserts ('One can show', p.5, line 248, citing [Ill72, §VIII.2.1.1]) that any free resolution may be used, hence dR_(−/A) commutes with filtered colimits; that assertion is not proved in the inspected range. This node does not identify dR_(B/A) with the ordinary de Rham complex of every smooth algebra: see the characteristic-zero-completion-boundary node.
TauCeti.DerivedDeRham.map: A morphism of A-algebras induces a map of the coherent Hodge-filtered derived de Rham objects, with identity and composition coherences.
TauCeti.DerivedDeRham.resolutionEquiv: Two free simplicial resolutions of B give equivalent Hodge-filtered multiplicative objects; the comparison respects the augmentation and is coherent in maps of resolutions.
TauCeti.DerivedDeRham.hodgeFiltration: The value Fil_H^i is the realization of the subcomplex of polynomial forms of degrees at least i, with decreasing transition maps and multiplication Fil_H^i⊗Fil_H^j→Fil_H^(i+j).
TauCeti.DerivedDeRham.test_identity_algebra: For A→A, dR_(A/A) is A concentrated in degree zero.
TauCeti.DerivedDeRham.test_hodge_zero_quotient: For an ordinary A-algebra B, the degree-zero Hodge quotient gr_H^0 dR_(B/A) is B in degree zero.
TauCeti.DerivedDeRham.test_rational_laurent_boundary: For Q→Q[t,t⁻¹], uncompleted dR is Q, whereas ordinary degree-one de Rham cohomology is Q·dt/t. The unrestricted uncompleted smooth comparison fails.

DerivedDeRhamCohomology:DD.3/conjugate-filtration
TauCeti.DerivedDeRham.conjugateFiltration
Construct a functorial increasing filtration Fil^conj_i dR_(B/A), bounded below at i=0, separated and exhaustive, with gr^conj_i represented by the realization of n↦H^i(Ω*_(P_n/A))[-i]. The associated conjugate spectral sequence converges in the source sense. Its exhaustive realization property concerns the uncompleted direct-sum object; no completed or global strong-convergence claim is implicit.
TauCeti.DerivedDeRham.conjugateAt: The ith stage is |τ≤i Ω•_(P•/A)|, with the canonical maps from truncation.
TauCeti.DerivedDeRham.conjugateInclusion: The map from stage i to stage j for i≤j is induced by cohomological truncation; the maps compose and are natural in A→B.
TauCeti.DerivedDeRham.conjugateColimit: The filtered homotopy colimit over i≥0 of these stages is dR_(B/A). This is an uncompleted exhaustiveness assertion.
TauCeti.DerivedDeRham.test_conjugate_identity: For A→A, stage zero is A and every successive positive graded piece is zero.
TauCeti.DerivedDeRham.test_conjugate_weight_zero: The zeroth graded piece is |H⁰(Ω•_(P•/A))|, with no cohomological shift.
TauCeti.DerivedDeRham.test_conjugate_rational: For Q→Q[t], every positive conjugate graded piece vanishes and stage zero is Q.

DerivedDeRhamCohomology:DD.2/derived-base-change-kunneth
TauCeti.DerivedDeRham.baseChangeKunneth
There are natural equivalences dR_(B⊗^L_A C/A)≃dR_(B/A)⊗^L_A dR_(C/A) and dR_(B/A)⊗^L_A C≃dR_(B⊗^L_A C/C). All tensor products, including the algebra pushout, are derived.

DerivedDeRhamCohomology:DD.3/derived-frobenius-twist
TauCeti.DerivedDeRham.frobeniusTwist
For A→B of F_p-algebras define B^(1)=B⊗^L_(A,Frob_A) A, together with the relative Frobenius B^(1)→B. The derived de Rham complex and its conjugate filtration are naturally B^(1)-linear.
TauCeti.DerivedDeRham.relativeFrobenius: The canonical map B⊗^L_(A,Frob_A)A→B is induced at polynomial level by b⊗a↦bᵖf(a).
TauCeti.DerivedDeRham.twistMap: A map B→C of A-algebras induces B^(1)→C^(1) and a commuting square with the two relative Frobenius maps.
TauCeti.DerivedDeRham.twistUnderived: If Tor_i^A(B,Frob_*A)=0 for all i>0, the derived twist agrees with the ordinary tensor-product twist, compatibly with relative Frobenius.
TauCeti.DerivedDeRham.test_twist_base: For B=A, B^(1)=A⊗^L_(A,Frob_A)A is canonically A and the relative Frobenius is the identity under this identification.
TauCeti.DerivedDeRham.test_twist_polynomial: For B=F_p[t] over F_p, the derived twist is the ordinary polynomial algebra and relative Frobenius sends its coordinate t to tᵖ.
TauCeti.DerivedDeRham.test_twist_no_underived_shortcut: Let A=F_p[ε]/ε² and B=F_p. For p≥2, Tor₁^A(B,Frob_*A) is nonzero (indeed isomorphic to Frob_*A as an A-module with ε acting by zero); therefore B^(1) has positive homotopy and cannot be replaced by its ordinary tensor product.

DerivedDeRhamCohomology:DD.3/polynomial-cartier-map
TauCeti.DerivedDeRham.polynomialCartier
For a free (polynomial) algebra F over an F_p-algebra A, construct the canonical isomorphism of F^(1)-modules C^{-1}:∧^k L_(F^(1)/A)≃H^k(Ω*_(F/A)) for every k, extending to a graded F^(1)-algebra isomorphism ⊕_k ∧^k L_(F^(1)/A)[−k]→⊕_k H^k(Ω*_(F/A))[−k] (for polynomial F^(1), ∧^k L_(F^(1)/A)=Ω^k_(F^(1)/A)). In one variable, applying the source recipe with the lift t↦t^p gives dt↦[t^{p−1}dt] in degree one; that formula is a consequence of the recipe and is not displayed in the source.

DerivedDeRhamCohomology:DD.3/derived-cartier-graded-pieces
TauCeti.DerivedDeRham.conjugateGradedCartier
For every map A→B of F_p-algebras, gr^conj_i dR_(B/A)≃L∧^i L_(B^(1)/A)[−i], naturally as B^(1)-modules. The exterior power and Frobenius twist are derived.

DerivedDeRhamCohomology:DD.2/characteristic-zero-completion-boundary
TauCeti.DerivedDeRham.rationalCollapse
For a map of Q-algebras A→B the direct-sum (uncompleted) derived de Rham complex satisfies dR_(B/A)≃A (Corollary 2.5). Hence the uncompleted theory cannot be identified with ordinary de Rham cohomology of smooth Q-algebras: for B=Q[t,t^{−1}] over Q the ordinary de Rham complex has the nonzero class dt/t in degree one while dR_(B/Q)≃Q (the source states exactly this example in Remark 3.12, p.8). Remark 2.6 identifies the Hodge-completed complex (product totalisation) as the variant whose Hodge-to-de Rham spectral sequence converges and which 'specialises to classical de Rham cohomology for smooth maps'; that completed comparison is asserted there, not proved in the inspected range. Hodge completion and p-adic completion are distinct operations. In characteristic p the uncompleted smooth comparison dR_(B/A)≃Ω*_(B/A) for smooth maps of Z/p^n-algebras is a separate theorem (Corollary 3.10, p.8; statement and proof read in review R2, imported inputs unread), not a consequence of this node.

No Prop-valued stand-in or assumed comparison replaces these constructions.
-/
