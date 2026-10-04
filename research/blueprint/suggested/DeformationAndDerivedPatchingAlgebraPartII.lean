/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so contributors and reviewers can converge on names
and signatures. This is a PARTIAL checkpoint: the boundary register below lists the
supplier-dependent targets whose typed signatures have not yet been written. Elaborating
this file validates the concrete native portion only; it does not validate that register.
No arbitrary proposition or assumed-property fields replace the missing objects.
-/
import Mathlib.Algebra.Homology.LocalCohomology
import Mathlib.RingTheory.KrullDimension.Module
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.RingTheory.ReesAlgebra
import Mathlib.Algebra.Polynomial.Module.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.RingTheory.PowerSeries.Ideal

noncomputable section
open scoped BigOperators
universe u
namespace TauCeti.Kawasaki
variable (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M] [Module R M]
-- DeformationAndDerivedPatchingAlgebraPartII:K0/annihilator-product
noncomputable def annihilator_product (J : Ideal R) (d : ℕ) : Ideal R :=
  ∏ j ∈ Finset.range d, Module.annihilator R ((localCohomology J j).obj (ModuleCat.of R M))

-- DeformationAndDerivedPatchingAlgebraPartII:K0/annihilator-product-zero
lemma annihilator_product_zero (J : Ideal R) : annihilator_product R M J 0 = ⊤ := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K0/annihilator-product-succ
lemma annihilator_product_succ (J : Ideal R) (d : ℕ) :
 annihilator_product R M J (d+1) = annihilator_product R M J d * Module.annihilator R ((localCohomology J d).obj (ModuleCat.of R M)) := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K0/annihilator-product-le-factor
lemma annihilator_product_le_factor (J : Ideal R) {j d : ℕ} (h : j < d) :
 annihilator_product R M J d ≤ Module.annihilator R ((localCohomology J j).obj (ModuleCat.of R M)) := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K0/annihilator-product-eq-top-of-vanishing
lemma annihilator_product_eq_top_of_vanishing (J : Ideal R) (d : ℕ)
 (h : ∀ j, j < d → Subsingleton ((localCohomology J j).obj (ModuleCat.of R M))) :
 annihilator_product R M J d = ⊤ := by sorry

-- TauCeti.Kawasaki.ann_product_empty
example (J : Ideal R) : annihilator_product R M J 0 = ⊤ := by sorry

-- TauCeti.Kawasaki.ann_product_single
example (J : Ideal R) : annihilator_product R M J 1 = Module.annihilator R ((localCohomology J 0).obj (ModuleCat.of R M)) := by sorry

-- TauCeti.Kawasaki.ann_product_zero_module
example [Subsingleton M] (J : Ideal R) (d : ℕ) : annihilator_product R M J d = ⊤ := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K0/is-cm-secant
def is_cm_secant [IsNoetherianRing R] [IsLocalRing R] [Module.Finite R M] (rs : List R) : Prop :=
 (∀ r ∈ rs, r ∈ IsLocalRing.maximalIdeal R) ∧
 (∀ i : Fin rs.length,
   Module.supportDim R (M ⧸ (Ideal.ofList (rs.take (i.val+1)) • ⊤ : Submodule R M)) <
   Module.supportDim R (M ⧸ (Ideal.ofList (rs.take i.val) • ⊤ : Submodule R M))) ∧
 (∀ j : ℕ, (j : WithBot ℕ∞) < Module.supportDim R (M ⧸ (Ideal.ofList rs • ⊤ : Submodule R M)) →
   Subsingleton ((localCohomology (IsLocalRing.maximalIdeal R) j).obj
     (ModuleCat.of R (M ⧸ (Ideal.ofList rs • ⊤ : Submodule R M))))) ∧
 (∀ i : Fin rs.length, ∃ d : ℕ,
   Module.supportDim R (M ⧸ (Ideal.ofList (rs.take i.val) • ⊤ : Submodule R M)) = (d : WithBot ℕ∞) ∧
   rs[i] ∈ annihilator_product R (M ⧸ (Ideal.ofList (rs.take i.val) • ⊤ : Submodule R M)) (IsLocalRing.maximalIdeal R) d)

-- DeformationAndDerivedPatchingAlgebraPartII:K0/cm-sect-mem-maximal
lemma cm_sect_mem_maximal [IsNoetherianRing R] [IsLocalRing R] [Module.Finite R M] {rs : List R}
 (h : is_cm_secant R M rs) : ∀ r ∈ rs, r ∈ IsLocalRing.maximalIdeal R := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K0/cm-sect-dimension-drop
lemma cm_sect_dimension_drop [IsNoetherianRing R] [IsLocalRing R] [Module.Finite R M] {rs : List R}
 (h : is_cm_secant R M rs) (i : Fin rs.length) :
 Module.supportDim R (M ⧸ (Ideal.ofList (rs.take (i.val+1)) • ⊤ : Submodule R M)) <
 Module.supportDim R (M ⧸ (Ideal.ofList (rs.take i.val) • ⊤ : Submodule R M)) := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K0/cm-sect-terminal-vanishing
lemma cm_sect_terminal_vanishing [IsNoetherianRing R] [IsLocalRing R] [Module.Finite R M] {rs : List R}
 (h : is_cm_secant R M rs) (j : ℕ)
 (hj : (j : WithBot ℕ∞) < Module.supportDim R (M ⧸ (Ideal.ofList rs • ⊤ : Submodule R M))) :
 Subsingleton ((localCohomology (IsLocalRing.maximalIdeal R) j).obj
 (ModuleCat.of R (M ⧸ (Ideal.ofList rs • ⊤ : Submodule R M)))) := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K0/cm-sect-ann-membership
lemma cm_sect_ann_membership [IsNoetherianRing R] [IsLocalRing R] [Module.Finite R M] {rs : List R}
 (h : is_cm_secant R M rs) (i : Fin rs.length) : ∃ d : ℕ,
 Module.supportDim R (M ⧸ (Ideal.ofList (rs.take i.val) • ⊤ : Submodule R M)) = (d : WithBot ℕ∞) ∧
 rs[i] ∈ annihilator_product R (M ⧸ (Ideal.ofList (rs.take i.val) • ⊤ : Submodule R M)) (IsLocalRing.maximalIdeal R) d := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K0/cm-sect-empty-iff
lemma cm_sect_empty_iff [IsNoetherianRing R] [IsLocalRing R] [Module.Finite R M] :
 is_cm_secant R M [] ↔ ∀ j : ℕ, (j : WithBot ℕ∞) < Module.supportDim R M →
 Subsingleton ((localCohomology (IsLocalRing.maximalIdeal R) j).obj (ModuleCat.of R M)) := by sorry

-- TauCeti.Kawasaki.cm_sect_field_empty
example  : is_cm_secant ℚ ℚ [] := by sorry

-- TauCeti.Kawasaki.cm_sect_field_zero_not
example  : ¬ is_cm_secant ℚ ℚ [0] := by sorry

-- TauCeti.Kawasaki.cm_sect_zero_empty
example [IsNoetherianRing R] [IsLocalRing R] [Module.Finite R M] [Subsingleton M] : is_cm_secant R M [] := by sorry

-- TauCeti.Kawasaki.cm_sect_zero_nonempty_not
example [IsNoetherianRing R] [IsLocalRing R] [Module.Finite R M] [Subsingleton M] (r : R) (rs : List R) : ¬ is_cm_secant R M (r :: rs) := by sorry

-- TauCeti.Kawasaki.cm_sect_dvr_parameter
example  : is_cm_secant (PowerSeries ℚ) (PowerSeries ℚ) [PowerSeries.X] := by sorry

-- TauCeti.Kawasaki.cm_sect_dvr_square
example  : is_cm_secant (PowerSeries ℚ) (PowerSeries ℚ) [PowerSeries.X^2] := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K1/is-d-sequence
def is_d_sequence (rs : List R) : Prop :=
 ∀ i : Fin rs.length, IsSMulRegular
   ↥(Ideal.ofList rs • (⊤ : Submodule R (M ⧸ (Ideal.ofList (rs.take i.val) • ⊤ : Submodule R M))) : Submodule R (M ⧸ (Ideal.ofList (rs.take i.val) • ⊤ : Submodule R M))) rs[i]

-- DeformationAndDerivedPatchingAlgebraPartII:K1/dseq-empty
lemma dseq_empty : is_d_sequence R M [] := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K1/dseq-zero-module
lemma dseq_zero_module [Subsingleton M] (rs : List R) : is_d_sequence R M rs := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K1/dseq-of-weakly-regular
lemma dseq_of_weakly_regular {rs : List R} (h : RingTheory.Sequence.IsWeaklyRegular M rs) : is_d_sequence R M rs := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K1/dseq-singleton-iff
lemma dseq_singleton_iff (r : R) : is_d_sequence R M [r] ↔ IsSMulRegular ↥(Ideal.ofList [r] • (⊤ : Submodule R M) : Submodule R M) r := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K1/dseq-linear-equiv
lemma dseq_linear_equiv {N : Type u} [AddCommGroup N] [Module R N] (e : M ≃ₗ[R] N) (rs : List R) : is_d_sequence R M rs ↔ is_d_sequence R N rs := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K1/dseq-colon-iff
lemma dseq_colon_iff (rs : List R) : is_d_sequence R M rs ↔
 ∀ (i j : Fin rs.length), i ≤ j → ∀ x : M ⧸ (Ideal.ofList (rs.take i.val) • ⊤ : Submodule R M),
 (rs[i] * rs[j]) • x = 0 ↔ rs[j] • x = 0 := by sorry

-- TauCeti.Kawasaki.dseq_empty_test
example  : is_d_sequence R M [] := by sorry

-- TauCeti.Kawasaki.dseq_zero_singleton
example  : is_d_sequence ℚ ℚ [0] ∧ ¬ RingTheory.Sequence.IsWeaklyRegular ℚ ([0] : List ℚ) := by sorry

-- TauCeti.Kawasaki.dseq_one_singleton
example  : is_d_sequence ℚ ℚ [1] ∧ ¬ RingTheory.Sequence.IsRegular ℚ ([1] : List ℚ) := by sorry

-- TauCeti.Kawasaki.dseq_order_forward
example  : is_d_sequence ℤ ℤ [2,0] := by sorry

-- TauCeti.Kawasaki.dseq_order_reverse_not
example  : ¬ is_d_sequence ℤ ℤ [0,2] := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K1/goto-yamagishi-colon
lemma goto_yamagishi_colon {rs : List R} (h : is_d_sequence R M rs)
 (i : Fin rs.length) (n : ℕ) (hn : 1 ≤ n) :
 (Submodule.comap (rs[i] • (LinearMap.id : M →ₗ[R] M))
    (Ideal.ofList (rs.take i.val) • ⊤ : Submodule R M)) ⊓ (Ideal.ofList rs ^ n • ⊤) =
 (Ideal.ofList (rs.take i.val) • ⊤ : Submodule R M) ⊓ (Ideal.ofList rs ^ n • ⊤) := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K1/goto-yamagishi-intersection
lemma goto_yamagishi_intersection {rs : List R} (h : is_d_sequence R M rs)
 (i : Fin rs.length) (n : ℕ) (hn : 1 ≤ n) :
 (Ideal.ofList (rs.take i.val) • ⊤ : Submodule R M) ⊓ (Ideal.ofList rs ^ n • ⊤) =
 ((Ideal.ofList (rs.take i.val) * Ideal.ofList rs ^ (n-1)) • ⊤ : Submodule R M) := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K2/prefix-product
def prefix_product (rs : List R) (s : ℕ) : Ideal R :=
 ∏ i ∈ Finset.range s, Ideal.ofList (rs.take (i+1))

-- DeformationAndDerivedPatchingAlgebraPartII:K2/prefix-product-zero
lemma prefix_product_zero (rs : List R) : prefix_product R rs 0 = ⊤ := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K2/prefix-product-succ
lemma prefix_product_succ (rs : List R) (s : ℕ) : prefix_product R rs (s+1) = prefix_product R rs s * Ideal.ofList (rs.take (s+1)) := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K2/prefix-product-one
lemma prefix_product_one (r : R) (rs : List R) : prefix_product R (r::rs) 1 = Ideal.ofList [r] := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K2/prefix-product-take
lemma prefix_product_take (rs : List R) (s : ℕ) : prefix_product R (rs.take s) s = prefix_product R rs s := by sorry

-- TauCeti.Kawasaki.prefix_product_empty_test
example (rs : List R) : prefix_product R rs 0 = ⊤ := by sorry

-- TauCeti.Kawasaki.prefix_product_two_test
example (a b : R) : prefix_product R [a,b] 2 = Ideal.ofList [a] * Ideal.ofList [a,b] := by sorry

-- TauCeti.Kawasaki.prefix_product_wrong_power
example  : prefix_product ℤ [2,3] 2 ≠ Ideal.ofList ([2,3] : List ℤ)^2 := by sorry

-- TauCeti.Kawasaki.prefix_product_zero_first
example (b : R) : prefix_product R [0,b] 2 = ⊥ := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K3/rees-module
def rees_module (I : Ideal R) : Submodule (reesAlgebra I) (PolynomialModule R M) where
 carrier := {p | ∀ n, p.coeff n ∈ (I^n • (⊤ : Submodule R M))}
 zero_mem' := by intro n; simp
 add_mem' := by
  intro p q hp hq n
  simpa using (I^n • (⊤ : Submodule R M)).add_mem (hp n) (hq n)
 smul_mem' := by
  intro f p hp n
  change ((f : Polynomial R) • p).coeff n ∈ (I^n • (⊤ : Submodule R M))
  rw [PolynomialModule.smul_apply]
  apply Submodule.sum_mem
  intro ij hij
  rw [← Finset.mem_antidiagonal.mp hij, pow_add, Submodule.mul_smul]
  exact Submodule.smul_mem_smul (f.property ij.1) (hp ij.2)

-- DeformationAndDerivedPatchingAlgebraPartII:K3/rees-module-mem
lemma rees_module_mem (I : Ideal R) (p : PolynomialModule R M) : p ∈ rees_module R M I ↔ ∀ n, p.coeff n ∈ (I^n • (⊤ : Submodule R M)) := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K3/rees-module-single
lemma rees_module_single (I : Ideal R) (n : ℕ) (m : M) : PolynomialModule.single R n m ∈ rees_module R M I ↔ m ∈ (I^n • (⊤ : Submodule R M)) := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K3/rees-module-unit
lemma rees_module_unit : rees_module R M ⊤ = ⊤ := by sorry

-- DeformationAndDerivedPatchingAlgebraPartII:K3/rees-module-zero-ideal
lemma rees_module_zero_ideal (p : PolynomialModule R M) : p ∈ rees_module R M ⊥ ↔ ∀ n, 0 < n → p.coeff n = 0 := by sorry

-- TauCeti.Kawasaki.rees_module_degree_zero
example (I : Ideal R) (m : M) : PolynomialModule.single R 0 m ∈ rees_module R M I := by sorry

-- TauCeti.Kawasaki.rees_module_zero_ideal_nonexample
example  : PolynomialModule.single ℤ 1 (1 : ℤ) ∉ rees_module ℤ ℤ ⊥ := by sorry

-- TauCeti.Kawasaki.rees_module_unit_test
example  : rees_module R M ⊤ = ⊤ := by sorry

-- TauCeti.Kawasaki.rees_module_torsion_test
example  : PolynomialModule.single ℤ 1 (1 : ZMod 2) ∉ rees_module ℤ (ZMod 2) (Ideal.ofList [2]) := by sorry

end TauCeti.Kawasaki

/-!
Supplier-dependent boundary register (not compiled signatures):

TauCeti.Kawasaki.cm_secant_owner_comparison
For finite M over Noetherian local R, the native expanded CM-secant condition agrees with Definition 3.1(ii) using the R03.3 secant and CM predicates. Zero M has empty support and vacuous local-cohomology vanishing; the comparison must use E4’s support-restricted CM convention. Every nonzero prefix quotient has finite natural support dimension.

TauCeti.Kawasaki.schenzel_torsion_bound
If r1,…,rs is a nonempty secant sequence for finite M over Noetherian local (R,m), then a_m(M,dim Supp M) kills the rs-torsion of M/(r1,…,r{s−1})M. No terminal-CM or dualizing-complex hypothesis is added.

TauCeti.Kawasaki.cm_secant_extend_parameters
Every CM-secant sequence for nonzero finite M over Noetherian local R extends to a CM-secant system of parameters. Choose regular parameters of the CM terminal quotient, whose low-degree annihilator product is the unit ideal.

TauCeti.Kawasaki.p_standard_reversal
For a system of parameters r1,…,rs of finite M, the list is CM-secant iff rs,…,r1 is a p-standard system of parameters of type s−1 in Kawasaki 2.6. This is an ordered reversal, not a claim of permutation invariance of CM-secant sequences.

TauCeti.Kawasaki.matlis_annihilator
For finite N over Noetherian local R and E the injective hull of the residue field, Ann_R N = Ann_R Hom_R(N,E).

TauCeti.Kawasaki.duality_annihilator
For finite M over Noetherian local R with a normalized dualizing complex ω, and every integer j, Ann_R H^j_m(M)=Ann_R H^{-j}(RHom_R(M,ω)). Negative local-cohomology degrees are zero. The normalization is essential.

TauCeti.Kawasaki.cm_locus_annihilator
For finite M with equidimensional support over Noetherian local R with normalized dualizing complex, V(a_m(M,dim Supp M)) is exactly the non-CM locus. The empty-support case gives the empty closed subset. Without equidimensionality this assertion is not made.

TauCeti.Kawasaki.nonequidimensional_defect
Without equidimensionality, under the hypotheses of Lemma 3.6, V(a_m(M,dim Supp M)) equals {p in Supp M : depth_{R_p} M_p + dim(R/p) < dim Supp M}. It contains every irreducible component of nonmaximal dimension.

TauCeti.Kawasaki.kawasaki_reversed_dseq
Let r1,…,rt be CM-secant for M and 0≤s≤t. Let a1,…,au∈m be secant for M/(r1,…,rs)M, and set M′=M/(a1,…,au)M. Then rs,…,r1 is a d-sequence for M′. The reversal and the ambient module quotient are essential.

TauCeti.Kawasaki.kawasaki_torsion
With r, s, auxiliary a and M′ as above, for s≥2 and m,n>0, the r_s^m-torsion of M′/I_{s−1}^nM′ equals its (r1,…,rs)-torsion. Powers and auxiliary secant hypotheses are retained.

TauCeti.Kawasaki.kawasaki_aux_regular
For a nonempty auxiliary secant list a1,…,au on M/(r1,…,rs)M, put M′=M/(a1,…,a{u−1})M. If a_u is regular on M′/(r1,…,rs)M′, then a_u is regular on M′ and on M′/I_s^nM′ for every n>0. The element is a_u, not r_u (E6).

TauCeti.Kawasaki.kawasaki_robustness
For a selected prefix of a CM-secant sequence, conditions (i),(ii),(iii) of Proposition 3.11 continue to hold after quotienting M by an auxiliary secant sequence on its terminal prefix quotient. This preserves the three conditions, not a blanket assertion that every prefix is CM-secant.

TauCeti.Kawasaki.module_blowup
For finite M over Noetherian R and ideal I, Bl_I(M) is the sheaf on Bl_I(R)=Proj(Rees_R(I)) associated to the graded Rees module ⊕I^nM. On the i-chart for i∈I, its module is the R_(i)-submodule of M[1/i] generated by the image of M, where R_(i)⊂R[1/i] is the imported blow-up chart. It is the image construction, not the full tensor product.

TauCeti.Kawasaki.module_blowup_unit (example still to type)
For I=R, Bl_I(R)=Spec R and Bl_I(M) is the ordinary affine sheaf associated to M.

TauCeti.Kawasaki.module_blowup_principal (example still to type)
For a principal ideal (r), Bl_(r)(M) is the sheaf of M/M⟨r^∞⟩ on the principal blowup scheme; do not assert M is unchanged when r is a zero divisor.

TauCeti.Kawasaki.module_blowup_zmod_two (example still to type)
For R=Z, I=(2), M=Z/2, the module blowing-up is zero on Bl_(2)(Z)=Spec Z, while the ordinary pullback of M is nonzero.

TauCeti.Kawasaki.module_blowup_chart
On the imported i-chart, sections are the submodule M_(i) of M[1/i] generated by M over R_(i).

TauCeti.Kawasaki.module_blowup_off_center
Restriction over Spec R minus V(I) is canonically the original sheaf of M.

TauCeti.Kawasaki.module_blowup_map
Every R-linear map M→N induces Bl_I(M)→Bl_I(N) by its actual maps on the Rees-module coefficients.

TauCeti.Kawasaki.module_blowup_map_id
The induced blowing-up map of the identity M→M is the identity sheaf morphism.

TauCeti.Kawasaki.module_blowup_map_comp
For R-linear maps f:M→N and g:N→P, the blowing-up map of g composed with f equals the composite of their sheaf maps.

TauCeti.Kawasaki.module_blowup_zero
Bl_I(0) is the zero sheaf on Bl_I(R).

TauCeti.Kawasaki.module_blowup_self
Bl_I(R), as a module blowing-up of R itself, is the structure sheaf of the blowup scheme.

TauCeti.Kawasaki.module_blowup_chart_surjection
The natural tensor pullback M⊗_R R_(i)→M_(i) is surjective, with kernel supported on the exceptional divisor.

TauCeti.Kawasaki.module_strict_transform
Under the identification of the imported scheme blowup, Bl_I(M) is canonically the Raynaud–Gruson strict transform: quotient of the pullback sheaf by sections supported on the exceptional divisor. On each chart this is the map to the image submodule in M[1/i].

TauCeti.Kawasaki.module_two_ideal
For ideals I,J in Noetherian R, over the imported scheme isomorphism Bl_IJ(R)≅Bl_I(Bl_J(R)), the corresponding module Bl_IJ(M) is canonically the iterated module blowing-up Bl_I(Bl_J(M)). The second centre is the pulled-back ideal, and the isomorphism is tracked on the actual charts.

TauCeti.Kawasaki.blowup_support
For finite M and A=R/Ann_R M, the support of Bl_I(M) is the closed blowup Bl_{IA}(Spec A) inside Bl_I(Spec R). This is the scheme-support comparison required before applying the Rees dimension argument.

TauCeti.Kawasaki.rees_dimension_bound
For a finite-dimensional Noetherian ring A and ideal J, dim A[Jt]≤dim A+1. Reduction to minimal primes and a finitely generated domain algebra of transcendence degree at most one gives the inequality. No equality is asserted for J=0.

TauCeti.Kawasaki.proj_prime_chain
For S=A[Jt], every chain of homogeneous primes corresponding to points of Proj S can be enlarged by the homogeneous prime (P_last∩A)⊕S_+. Hence dim Proj S≤dim S−1 whenever Proj S is nonempty; for empty Proj use dimension bottom.

TauCeti.Kawasaki.blowup_support_dimension
For finite M over Noetherian local R, dim Supp Bl_I(M)≤dim Supp M, including the zero-module empty-support case. Apply the Rees bound to A=R/Ann M and the projective prime-chain bound to the support blowup.

TauCeti.Kawasaki.regular_terminal_quotient
Assume the weaker hypothesis of Theorem 3.14: every initial prefix satisfies Proposition 3.11(i)–(iii), and the final quotient is CM. If its dimension is positive, choose r′∈m regular on it. Then r′ is regular on M and on M/I_s^nM for every s and n>0, and Bl_{I_s}(M)/r′ equals Bl_{I_s}(M/r′M) under the imported scheme base-change identification.

TauCeti.Kawasaki.principal_stage
In Theorem 3.14’s dimension-zero-terminal reduction, the s=0 stage has unit ideal and is the original module, and the s=1 stage has Bl_(r1)(M)=M/M⟨r1^∞⟩ with r1 regular on this quotient. These are the base cases for the depth induction.

TauCeti.Kawasaki.two_generator_chart
For s≥2, at a point of the previous prefix-product blowing-up choose a generator r_i of the previous prefix ideal. It is regular on the local chart ring R′ and module M′. For {a,b}={i,s}, the current chart module at a closed point is (M′⊗R′[T])/(r_bT−r_a), divided by r_b-power torsion and localized at (m′,f), where f is a monic lift of the residual closed-point polynomial.

TauCeti.Kawasaki.claim_annihilation
In the inductive setup of Theorem 3.14, with local previous-stage chart (R′,M′), r_i and r_s both kill H^1_{(r_i,r_s)}(R′,M′).

TauCeti.Kawasaki.claim_vanishing
In the same setup, H^j_{m′}(R′,H^{j′}_{(r_i,r_s)}(R′,M′))=0 for j<s−2 and every j′. In a natural-degree formulation, only j′=1,2 remain: degree zero vanishes by regularity of r_i and degrees above two vanish by the two-generator Čech model.

TauCeti.Kawasaki.chart_polynomial_annihilation
After polynomial flat base change in the two-generator chart setup, multiplication by the actual relation r_bT−r_a is zero on H^1_{(r_a,r_b)}(R′[T],M′⊗R′[T]). This is E8’s corrected relation used in the preceding exact sequence, even though the printed swapped relation also kills the module.

TauCeti.Kawasaki.chart_depth_induction
With the weaker hypotheses and a zero-dimensional terminal quotient, for every 0≤s≤t, Bl_{I_s}(M) has depth at least s at its support points over the closed point. Together with the support-dimension bound and the source’s localization reduction, this proves the needed CM assertion.

TauCeti.Kawasaki.weaker_hypothesis_cm_blowup
Let finite M over Noetherian local (R,m) and an ordered list r1,…,rt∈m have CM terminal quotient. Suppose every initial subsequence satisfies all three conditions of Proposition 3.11, with their auxiliary secant quantifiers, reversed d-sequence and corrected last auxiliary element. Then Bl_{I_t}(M) is CM on Bl_{I_t}(R), where I_t is the product of successive prefix ideals.

TauCeti.Kawasaki.kawasaki_cm_blowup
For a finite module M over a Noetherian local ring (R,m) and CM-secant r1,…,rt∈m, set I=product_{i=1}^t(r1,…,ri). Then Bl_I(M) is a Cohen–Macaulay module on Bl_I(R). This includes the empty sequence, when M itself is CM and I=1; zero M gives the zero sheaf.

TauCeti.Kawasaki.arbitrary_blowup_nonexample
There exists a Noetherian local Cohen–Macaulay ring whose blowing-up at its maximal ideal is not Cohen–Macaulay. The statement is the warning cited at the start of §3; a concrete ring, charts and failing depth witness from HIO88 14.11 are not yet supplied.

The packet gaps and per-stage remaining lists give the exact source and carrier obligations.
-/
