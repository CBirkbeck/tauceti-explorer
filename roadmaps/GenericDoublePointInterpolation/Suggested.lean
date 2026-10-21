/-
This file suggests names and Lean signatures for contributors. It is not the
roadmap and is not exhaustive: README.md is the definitive specification.
Definitions, API lemmas and examples here are admitted with sorry; elaboration
checks their types and does not establish the mathematical results.

The projective-section, residual/trace and finite-flat incidence statements use
the owning geometry roadmaps specified in README.md. Their signatures are
omitted here until those native interfaces can express the full hypotheses.
No substitute geometric carrier or assertion-valued placeholder is introduced.
-/
import Mathlib.RingTheory.MvPolynomial.Basic
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.Combinatorics.Nullstellensatz
import Mathlib.Data.Sym.Card
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.RingTheory.Spectrum.Prime.Topology
import Mathlib.Analysis.InnerProductSpace.Subspace
import Mathlib.Data.ZMod.Basic
import Mathlib.AlgebraicGeometry.AffineSpace

set_option maxHeartbeats 800000
set_option linter.unusedVariables false
universe u
namespace GenericDoublePointInterpolation

noncomputable abbrev Bounded (k : Type u) [CommRing k] (r d : ℕ) :=
  MvPolynomial.restrictTotalDegree (Fin r) k d
abbrev Monomials (r d : ℕ) :=
  {a : Fin r →₀ ℕ // a.sum (fun _ e => e) ≤ d}
abbrev JetRows (n r : ℕ) := Fin n × Option (Fin r)
abbrev JetCoordinates (k : Type u) (n r : ℕ) := Fin n → Option (Fin r) → k

-- Finite-index adapter for native basis representation; proof remains admitted.
noncomputable instance monomialsFintype (r d : ℕ) : Fintype (Monomials r d) := by
  sorry
theorem monomialCount (r d : ℕ) : Fintype.card (Monomials r d) = Nat.choose (r+d) d := by
  sorry

section Ring
variable {k : Type u} [CommRing k] {r n : ℕ}

noncomputable def coefficientCoordinates (d : ℕ) :
    Bounded k r d ≃ₗ[k] (Monomials r d → k) := by
  sorry
theorem coefficientCoordinates_apply (d : ℕ) (f : Bounded k r d) (a : Monomials r d) :
    coefficientCoordinates d f a = f.val.coeff a.val := by
  sorry
theorem coefficientCoordinates_symm (d : ℕ) (a : Monomials r d → k) :
    ((coefficientCoordinates d).symm a).val =
      ∑ x : Monomials r d, MvPolynomial.monomial x.val (a x) := by
  sorry
theorem coefficientCoordinates_ext (d : ℕ) (f g : Bounded k r d) :
    f = g ↔ coefficientCoordinates d f = coefficientCoordinates d g := by
  sorry
example : Fintype.card (Monomials 2 2) = 6 := by
  sorry
example : Fintype.card (Monomials r 0) = 1 := by
  sorry
example (f : Bounded k 1 3) (h : f.val = MvPolynomial.C 2 +
    MvPolynomial.C 3 * MvPolynomial.X (0 : Fin 1)^2) :
    f.val.coeff (Finsupp.single (0 : Fin 1) 2) = 3 := by
  sorry

noncomputable def fixedHomogenization (d : ℕ) :
    Bounded k r d ≃ₗ[k] MvPolynomial.homogeneousSubmodule (Option (Fin r)) k d := by
  sorry
theorem fixedHomogenization_monomial (d : ℕ) (a : Monomials r d)
    (f : Bounded k r d) (hf : f.val = MvPolynomial.monomial a.val 1) :
    (fixedHomogenization d f).val = MvPolynomial.X none ^ (d-a.val.sum (fun _ e => e)) *
      MvPolynomial.rename some (MvPolynomial.monomial a.val 1) := by
  sorry
theorem fixedHomogenization_dehomogenize (d : ℕ) (f : Bounded k r d) :
    MvPolynomial.aeval (fun i : Option (Fin r) =>
      match i with | none => 1 | some j => MvPolynomial.X j)
        (fixedHomogenization d f).val = f.val := by
  sorry
theorem fixedHomogenization_mul (d e : ℕ) (f : Bounded k r d) (g : Bounded k r e)
    (h : Bounded k r (d+e)) (hh : h.val = f.val*g.val) :
    (fixedHomogenization (d+e) h).val =
      (fixedHomogenization d f).val * (fixedHomogenization e g).val := by
  sorry
-- homogenize_quadratic
example (f : Bounded k 1 2) (hf : f.val = 1+MvPolynomial.X (0 : Fin 1)) :
    (fixedHomogenization 2 f).val = MvPolynomial.X none ^ 2 +
      MvPolynomial.X none * MvPolynomial.X (some (0 : Fin 1)) := by
  sorry
-- homogenize_constant
example (a : k) (f : Bounded k r 0) (hf : f.val = MvPolynomial.C a) :
    (fixedHomogenization 0 f).val = MvPolynomial.C a := by
  sorry
-- dehomogenize_native
example (f : MvPolynomial.homogeneousSubmodule (Option (Fin 1)) k 2)
    (hf : f.val = MvPolynomial.X none * MvPolynomial.X (some (0 : Fin 1))) :
    ((fixedHomogenization 2).symm f).val = MvPolynomial.X (0 : Fin 1) := by
  sorry

noncomputable def jetAlgebra (P : Fin r → k) :
    MvPolynomial (Fin r) k →ₐ[k] TrivSqZeroExt k (Fin r → k) := by
  sorry
theorem jetAlgebra_fst (P : Fin r → k) (f : MvPolynomial (Fin r) k) :
    (jetAlgebra P f).fst = MvPolynomial.eval P f := by
  sorry
theorem jetAlgebra_snd (P : Fin r → k) (f : MvPolynomial (Fin r) k) (j : Fin r) :
    (jetAlgebra P f).snd j = MvPolynomial.eval P (MvPolynomial.pderiv j f) := by
  sorry
theorem jetAlgebra_X (P : Fin r → k) (j : Fin r) :
    jetAlgebra P (MvPolynomial.X j) =
      TrivSqZeroExt.inl (P j) + TrivSqZeroExt.inr (Pi.single j 1) := by
  sorry
-- jet_variable (scalar/infinitesimal computation)
example : (jetAlgebra (0 : Fin 1 → k) (MvPolynomial.X (0 : Fin 1))).snd 0 = 1 := by
  sorry
-- jet_constant
example (P : Fin r → k) (a : k) : jetAlgebra P (MvPolynomial.C a) = TrivSqZeroExt.inl a := by
  sorry
-- jet_square
example : jetAlgebra (0 : Fin 1 → k) (MvPolynomial.X (0 : Fin 1)^2) = 0 := by
  sorry

noncomputable def doubleIdeal (P : Fin n → Fin r → k) : Ideal (MvPolynomial (Fin r) k) := by
  sorry
theorem doubleIdeal_def (P : Fin n → Fin r → k) :
    doubleIdeal P = (⨅ i, RingHom.ker (MvPolynomial.eval (P i)))^2 := by
  sorry
theorem doubleIdeal_reindex (P : Fin n → Fin r → k) (e : Equiv.Perm (Fin n)) :
    doubleIdeal (P ∘ e) = doubleIdeal P := by
  sorry
-- empty_double
example : doubleIdeal (fun _ : Fin 0 => (0 : Fin r → k)) = ⊤ := by
  sorry
-- double_origin (membership)
example : MvPolynomial.X (0 : Fin 1)^2 ∈
    doubleIdeal (fun _ : Fin 1 => (0 : Fin 1 → k)) := by
  sorry
-- double_origin (nonmembership)
example [Nontrivial k] : MvPolynomial.X (0 : Fin 1) ∉
    doubleIdeal (fun _ : Fin 1 => (0 : Fin 1 → k)) := by
  sorry

noncomputable def firstJetMap (P : Fin n → Fin r → k) (d : ℕ) :
    Bounded k r d →ₗ[k] JetCoordinates k n r := by
  sorry
theorem firstJetMap_value (P : Fin n → Fin r → k) (d : ℕ) (f : Bounded k r d) (i : Fin n) :
    firstJetMap P d f i none = MvPolynomial.eval (P i) f.val := by
  sorry
theorem firstJetMap_partial (P : Fin n → Fin r → k) (d : ℕ) (f : Bounded k r d)
    (i : Fin n) (j : Fin r) :
    firstJetMap P d f i (some j) = MvPolynomial.eval (P i) (MvPolynomial.pderiv j f.val) := by
  sorry
theorem firstJetMap_monomial (P : Fin n → Fin r → k) (d : ℕ) (a : Monomials r d)
    (f : Bounded k r d) (hf : f.val = MvPolynomial.monomial a.val 1) (i : Fin n) (j : Fin r) :
    firstJetMap P d f i (some j) = (a.val j : k) *
      MvPolynomial.eval (P i) (MvPolynomial.monomial (a.val-Finsupp.single j 1) 1) := by
  sorry
-- linear_origin_jets (one generator)
example (f : Bounded k 2 1) (hf : f.val = MvPolynomial.X (0 : Fin 2)) :
    firstJetMap (fun _ : Fin 1 => (0 : Fin 2 → k)) 1 f 0 (some 0) = 1 := by
  sorry
-- constant_jets (derivative projection)
example (P : Fin n → Fin r → k) (a : k) (f : Bounded k r 0)
    (hf : f.val = MvPolynomial.C a) (i : Fin n) (j : Fin r) :
    firstJetMap P 0 f i (some j) = 0 := by
  sorry
-- native_derivative
example (f : Bounded k 1 2) (hf : f.val = MvPolynomial.X (0 : Fin 1)^2) :
    firstJetMap (fun _ : Fin 1 => (fun _ : Fin 1 => (3 : k))) 2 f 0 none = 9 ∧
    firstJetMap (fun _ : Fin 1 => (fun _ : Fin 1 => (3 : k))) 2 f 0 (some 0) = 6 := by
  sorry

noncomputable def valueMap (P : Fin n → Fin r → k) (d : ℕ) :
    Bounded k r d →ₗ[k] (Fin n → k) := by
  sorry
theorem valueMap_apply (P : Fin n → Fin r → k) (d : ℕ) (f : Bounded k r d) (i : Fin n) :
    valueMap P d f i = MvPolynomial.eval (P i) f.val := by
  sorry
theorem valueMap_eq_jetProjection (P : Fin n → Fin r → k) (d : ℕ) (f : Bounded k r d) :
    valueMap P d f = fun i => firstJetMap P d f i none := by
  sorry
theorem mem_valueKernel (P : Fin n → Fin r → k) (d : ℕ) (f : Bounded k r d) :
    f ∈ LinearMap.ker (valueMap P d) ↔ ∀ i, MvPolynomial.eval (P i) f.val = 0 := by
  sorry
-- values_linear (second coordinate)
example (f : Bounded k 1 1) (hf : f.val = MvPolynomial.X (0 : Fin 1)) :
    valueMap (fun i : Fin 2 => fun _ : Fin 1 => (i.val : k)) 1 f 1 = 1 := by
  sorry
-- empty_values
example (d : ℕ) : LinearMap.ker (valueMap (fun _ : Fin 0 => (0 : Fin r → k)) d) = ⊤ := by
  sorry
-- values_not_gradients
example (f : Bounded k 1 1) (hf : f.val = MvPolynomial.X (0 : Fin 1)) :
    valueMap (fun _ : Fin 1 => (0 : Fin 1 → k)) 1 f = 0 ∧
    firstJetMap (fun _ : Fin 1 => (0 : Fin 1 → k)) 1 f 0 (some 0) = 1 := by
  sorry

noncomputable def derivativeOnKernel (P : Fin n → Fin r → k) (d : ℕ) :
    LinearMap.ker (valueMap P d) →ₗ[k] (Fin n → Fin r → k) := by
  sorry
theorem derivativeOnKernel_apply (P : Fin n → Fin r → k) (d : ℕ)
    (f : LinearMap.ker (valueMap P d)) (i : Fin n) (j : Fin r) :
    derivativeOnKernel P d f i j = MvPolynomial.eval (P i) (MvPolynomial.pderiv j f.val.val) := by
  sorry
theorem derivativeOnKernel_eq_jet (P : Fin n → Fin r → k) (d : ℕ)
    (f : LinearMap.ker (valueMap P d)) :
    derivativeOnKernel P d f = fun i j => firstJetMap P d f.val i (some j) := by
  sorry
theorem derivativeOnKernel_reindex (P : Fin n → Fin r → k) (d : ℕ) (e : Equiv.Perm (Fin n))
    (f : LinearMap.ker (valueMap P d)) (g : LinearMap.ker (valueMap (P ∘ e) d))
    (hfg : f.val = g.val) : derivativeOnKernel (P ∘ e) d g = fun i j => derivativeOnKernel P d f (e i) j := by
  sorry
-- simple_zero_derivative
example (f : LinearMap.ker (valueMap (fun _ : Fin 1 => (0 : Fin 1 → k)) 1))
    (hf : f.val.val = MvPolynomial.X (0 : Fin 1)) :
    derivativeOnKernel (fun _ : Fin 1 => (0 : Fin 1 → k)) 1 f 0 0 = 1 := by
  sorry
-- constant_kernel
example [Nontrivial k] : LinearMap.ker (valueMap (fun _ : Fin 1 => (0 : Fin r → k)) 0) = ⊥ := by
  sorry
-- square_zero_gradient (gradient projection)
example (f : LinearMap.ker (valueMap (fun _ : Fin 1 => (0 : Fin 1 → k)) 2))
    (hf : f.val.val = MvPolynomial.X (0 : Fin 1)^2) :
    derivativeOnKernel (fun _ : Fin 1 => (0 : Fin 1 → k)) 2 f = 0 := by
  sorry

noncomputable def firstJetMatrix (P : Fin n → Fin r → k) (d : ℕ) :
    Matrix (JetRows n r) (Monomials r d) k := by
  sorry
theorem firstJetMatrix_value (P : Fin n → Fin r → k) (d : ℕ) (i : Fin n) (a : Monomials r d) :
    firstJetMatrix P d (i,none) a = MvPolynomial.eval (P i) (MvPolynomial.monomial a.val 1) := by
  sorry
theorem firstJetMatrix_partial (P : Fin n → Fin r → k) (d : ℕ) (i : Fin n)
    (j : Fin r) (a : Monomials r d) :
    firstJetMatrix P d (i,some j) a = (a.val j : k) *
      MvPolynomial.eval (P i) (MvPolynomial.monomial (a.val-Finsupp.single j 1) 1) := by
  sorry
theorem firstJetMatrix_mulVec (P : Fin n → Fin r → k) (d : ℕ) (f : Bounded k r d) :
    (firstJetMatrix P d).mulVec (coefficientCoordinates d f) =
      fun z : JetRows n r => firstJetMap P d f z.1 z.2 := by
  sorry
-- matrix_shape
example : Fintype.card (JetRows 2 2) = 6 ∧ Fintype.card (Monomials 2 2) = 6 := by
  sorry
-- matrix_constants (derivative projection)
example (P : Fin 1 → Fin 1 → k) (a : Monomials 1 0) : firstJetMatrix P 0 (0,some 0) a = 0 := by
  sorry
-- matrix_linear_origin (one entry)
example (a : Monomials 1 1) (ha : a.val = Finsupp.single 0 1) :
    firstJetMatrix (fun _ : Fin 1 => (0 : Fin 1 → k)) 1 (0,some 0) a = 1 := by
  sorry
end Ring

section Field
variable {k : Type u} [Field k] {r n : ℕ}
theorem boundedFinrank (r d : ℕ) : Module.finrank k (Bounded k r d) = Nat.choose (r+d) d := by
  sorry
theorem jetAlgebra_surjective (P : Fin r → k) : Function.Surjective (jetAlgebra P) := by
  sorry
theorem jetKernel (P : Fin r → k) : RingHom.ker (jetAlgebra P).toRingHom =
    (RingHom.ker (MvPolynomial.eval P))^2 := by
  sorry
theorem doubleIdeal_distinct (P : Fin n → Fin r → k) (hP : Function.Injective P) :
    doubleIdeal P = ⨅ i, (RingHom.ker (MvPolynomial.eval (P i)))^2 := by
  sorry
noncomputable def doubleQuotient (P : Fin n → Fin r → k) (hP : Function.Injective P) :
    (MvPolynomial (Fin r) k ⧸ doubleIdeal P) ≃ₐ[k]
      (Fin n → TrivSqZeroExt k (Fin r → k)) := by
  sorry
theorem doubleQuotient_mk (P : Fin n → Fin r → k) (hP : Function.Injective P)
    (f : MvPolynomial (Fin r) k) :
    doubleQuotient P hP (Ideal.Quotient.mk _ f) = fun i => jetAlgebra (P i) f := by
  sorry
theorem doubleQuotient_mul (P : Fin n → Fin r → k) (hP : Function.Injective P)
    (x y : MvPolynomial (Fin r) k ⧸ doubleIdeal P) :
    doubleQuotient P hP (x*y) = doubleQuotient P hP x * doubleQuotient P hP y := by
  sorry
theorem doubleQuotient_reindex (P : Fin n → Fin r → k) (hP : Function.Injective P)
    (e : Equiv.Perm (Fin n)) (f : MvPolynomial (Fin r) k) :
    doubleQuotient (P ∘ e) (hP.comp e.injective) (Ideal.Quotient.mk _ f) =
      fun i => doubleQuotient P hP (Ideal.Quotient.mk _ f) (e i) := by
  sorry
-- one_point_length (dimension)
example : Module.finrank k (MvPolynomial (Fin 2) k ⧸ doubleIdeal (fun _ : Fin 1 => (0 : Fin 2 → k))) = 3 := by
  sorry
-- empty_quotient
example : Module.finrank k (MvPolynomial (Fin r) k ⧸ doubleIdeal (fun _ : Fin 0 => (0 : Fin r → k))) = 0 := by
  sorry
-- nonreduced_product (nonzero class)
example : MvPolynomial.X (0 : Fin 1) * (MvPolynomial.X (0 : Fin 1)-1) ∉
    doubleIdeal (fun i : Fin 2 => fun _ : Fin 1 => (i.val : k)) := by
  sorry
theorem doubleLength (P : Fin n → Fin r → k) (hP : Function.Injective P) :
    Module.finrank k (MvPolynomial (Fin r) k ⧸ doubleIdeal P) = n*(r+1) := by
  sorry
theorem jetKernelSplit (P : Fin n → Fin r → k) (d : ℕ) : Function.Surjective (firstJetMap P d) ↔
    Function.Surjective (valueMap P d) ∧ Function.Surjective (derivativeOnKernel P d) := by
  sorry
theorem jetRank (P : Fin n → Fin r → k) (d : ℕ) :
    Function.Surjective (firstJetMap P d) ↔ (firstJetMatrix P d).rank = n*(r+1) := by
  sorry
def WellPoised (P : Fin n → Fin r → k) (d : ℕ) : Prop :=
  Function.Surjective (firstJetMap P d)
theorem wellPoised_iff_surjective (P : Fin n → Fin r → k) (d : ℕ) :
    WellPoised P d ↔ Function.Surjective (firstJetMap P d) := by
  sorry
theorem wellPoised_reindex (P : Fin n → Fin r → k) (d : ℕ) (e : Equiv.Perm (Fin n)) :
    WellPoised (P ∘ e) d ↔ WellPoised P d := by
  sorry
theorem wellPoised_degree_mono (P : Fin n → Fin r → k) {d e : ℕ} (h : d≤e) :
    WellPoised P d → WellPoised P e := by
  sorry
-- wellPoised_one_linear
example (P : Fin 1 → Fin r → k) : WellPoised P 1 := by
  sorry
-- wellPoised_constants_fail
example (P : Fin 1 → Fin 1 → k) : ¬WellPoised P 0 := by
  sorry
-- wellPoised_collinear_fail
example : ¬WellPoised (fun i : Fin 7 => fun j : Fin 2 => if j.val=0 then (i.val : ℚ) else 0) 5 := by
  sorry
theorem univariateHermite (P : Fin n → Fin 1 → k) (hP : Function.Injective P)
    (d : ℕ) (hd : 2*n≤d+1) : Function.Surjective (firstJetMap P d) := by
  sorry
end Field

noncomputable def coefficientGram {r : ℕ} (d : ℕ) :
    Bounded ℝ r d →ₗ[ℝ] Bounded ℝ r d →ₗ[ℝ] ℝ := by
  sorry
theorem coefficientGram_apply {r : ℕ} (d : ℕ) (f g : Bounded ℝ r d) :
    coefficientGram d f g = ∑ a : Monomials r d,
      f.val.coeff a.val * g.val.coeff a.val := by
  sorry
theorem coefficientGram_positive {r : ℕ} (d : ℕ) (f : Bounded ℝ r d) (hf : f≠0) :
    0<coefficientGram d f f := by
  sorry
-- orthonormal_xy
example (f g : Bounded ℝ 2 2) (hf : f.val=MvPolynomial.X (0 : Fin 2))
    (hg : g.val=MvPolynomial.X (1 : Fin 2)) : coefficientGram 2 f g = 0 ∧ coefficientGram 2 f f = 1 := by
  sorry
-- gram_constants
example (a b : ℝ) (f g : Bounded ℝ 1 0) (hf : f.val=MvPolynomial.C a) (hg : g.val=MvPolynomial.C b) :
    coefficientGram 0 f g = a*b := by
  sorry
-- integral_coordinates (bilinear value)
example (f : Bounded ℝ 1 1) (hf : f.val=2+MvPolynomial.X (0 : Fin 1)) : coefficientGram 1 f f = 5 := by
  sorry

noncomputable def universalJetMatrix (r n d : ℕ) :
    Matrix (JetRows n r) (Monomials r d) (MvPolynomial (Fin n × Fin r) ℤ) := by
  sorry
theorem universalJetMatrix_value (r n d : ℕ) (i : Fin n) (a : Monomials r d) :
    universalJetMatrix r n d (i,none) a =
      MvPolynomial.rename (fun j => (i,j)) (MvPolynomial.monomial a.val (1 : ℤ)) := by
  sorry
theorem universalJetMatrix_partial (r n d : ℕ) (i : Fin n) (j : Fin r) (a : Monomials r d) :
    universalJetMatrix r n d (i,some j) a =
      MvPolynomial.C (a.val j : ℤ) * MvPolynomial.rename (fun j => (i,j))
        (MvPolynomial.monomial (a.val-Finsupp.single j 1) (1 : ℤ)) := by
  sorry
theorem universalJetMatrix_eval {k : Type u} [Field k] (r n d : ℕ) (P : Fin n → Fin r → k) :
    (universalJetMatrix r n d).map (MvPolynomial.aeval (fun z : Fin n×Fin r => P z.1 z.2)) =
      firstJetMatrix P d := by
  sorry
-- universal_one_linear (derivative entry)
example (a : Monomials 1 1) (ha : a.val=Finsupp.single 0 1) :
    universalJetMatrix 1 1 1 (0,some 0) a = 1 := by
  sorry
-- universal_zero_degree
example (a : Monomials 1 0) : universalJetMatrix 1 1 0 (0,some 0) a = 0 := by
  sorry
-- universal_integer_eval (derivative entry)
example (a : Monomials 1 2) (ha : a.val=Finsupp.single 0 2) :
    MvPolynomial.eval (fun _ : Fin 1×Fin 1 => (3 : ℤ)) (universalJetMatrix 1 1 2 (0,some 0) a) = 6 := by
  sorry

-- Pointwise polynomial consequence of the native principal-open certificate.
theorem genericAffineMinor {k : Type u} [Field k] [IsAlgClosed k] [CharZero k]
    (r n d : ℕ) (hr : 1≤r) (hn : 1≤n) (hd : 5≤d) (hsize : n*(r+1)≤Nat.choose (r+d) d) :
    ∃ (Δ : MvPolynomial (Fin n×Fin r) k),
      (∃ P : Fin n → Fin r → k, MvPolynomial.eval (fun z => P z.1 z.2) Δ≠0) ∧
      ∀ P : Fin n → Fin r → k, MvPolynomial.eval (fun z => P z.1 z.2) Δ≠0 →
        Function.Injective P ∧ Function.Surjective (firstJetMap P d) := by
  sorry
theorem integerGridSpecialization {k : Type u} [Field k] [IsAlgClosed k] [CharZero k]
    (r n d : ℕ) (hr : 1≤r) (hn : 1≤n) (hd : 5≤d) (hsize : n*(r+1)≤Nat.choose (r+d) d) :
    ∃ P : Fin n → Fin r → ℤ,
      (∀ i j, 0≤P i j ∧ P i j≤(n*(r+1)*d : ℕ)) ∧
      Function.Injective P ∧ Function.Surjective (firstJetMap (fun i j => (P i j : k)) d) := by
  sorry


/-! Exact native algebraic extensions of the interfaces above. -/
section NativeRingTests
variable {k : Type u} [CommRing k] {r : ℕ}

-- coefficient-coordinates / six_not_nine: total degree, rather than degree in each variable.
example : (Fintype.card (Monomials 2 2) = 6) ∧
    ¬ (Fintype.card (Monomials 2 2) = 9) := by
  sorry
-- coefficient-coordinates / constants
example (a : k) (f : Bounded k r 0) (hf : f.val = MvPolynomial.C a)
    (b : Monomials r 0) : coefficientCoordinates 0 f b = a := by
  sorry
-- coefficient-coordinates / native_coefficient: the entire coefficient tuple.
example (f : Bounded k 1 3)
    (hf : f.val = MvPolynomial.C 2 + MvPolynomial.C 3 * MvPolynomial.X (0 : Fin 1)^2) :
    ∀ a : Monomials 1 3, coefficientCoordinates 3 f a =
      if a.val 0 = 0 then 2 else if a.val 0 = 2 then 3 else 0 := by
  sorry
-- jet-algebra / jet_variable: both parts of the first jet.
example : jetAlgebra (0 : Fin 1 → k) (MvPolynomial.X (0 : Fin 1)) =
    TrivSqZeroExt.inr (Pi.single (0 : Fin 1) 1) := by
  sorry
-- first-jet-map / linear_origin_jets: 1,x,y give the complete identity in jet coordinates.
example (f : Bounded k 2 1) (a b c : k)
    (hf : f.val = MvPolynomial.C a + MvPolynomial.C b * MvPolynomial.X (0 : Fin 2) +
      MvPolynomial.C c * MvPolynomial.X (1 : Fin 2)) :
    firstJetMap (fun _ : Fin 1 => (0 : Fin 2 → k)) 1 f 0 none = a ∧
    firstJetMap (fun _ : Fin 1 => (0 : Fin 2 → k)) 1 f 0 (some 0) = b ∧
    firstJetMap (fun _ : Fin 1 => (0 : Fin 2 → k)) 1 f 0 (some 1) = c := by
  sorry
-- first-jet-map / constant_jets: includes the retained value.
example (a : k) (f : Bounded k r 0) (hf : f.val = MvPolynomial.C a)
    (P : Fin 1 → Fin r → k) : firstJetMap P 0 f 0 none = a ∧
    ∀ j : Fin r, firstJetMap P 0 f 0 (some j) = 0 := by
  sorry
-- value-map / values_linear: both evaluations of x.
example (f : Bounded k 1 1) (hf : f.val = MvPolynomial.X (0 : Fin 1)) :
    valueMap (fun i : Fin 2 => fun _ : Fin 1 => (i.val : k)) 1 f 0 = 0 ∧
    valueMap (fun i : Fin 2 => fun _ : Fin 1 => (i.val : k)) 1 f 1 = 1 := by
  sorry
-- jet-matrix / matrix_linear_origin: all four entries, in columns 1,x.
example (a b : Monomials 1 1) (ha : a.val = 0) (hb : b.val = Finsupp.single 0 1) :
    firstJetMatrix (fun _ : Fin 1 => (0 : Fin 1 → k)) 1 (0,none) a = 1 ∧
    firstJetMatrix (fun _ : Fin 1 => (0 : Fin 1 → k)) 1 (0,none) b = 0 ∧
    firstJetMatrix (fun _ : Fin 1 => (0 : Fin 1 → k)) 1 (0,some 0) a = 0 ∧
    firstJetMatrix (fun _ : Fin 1 => (0 : Fin 1 → k)) 1 (0,some 0) b = 1 := by
  sorry
-- jet-matrix / matrix_constants: the whole column, including its value.
example (P : Fin 1 → Fin r → k) (a : Monomials r 0) :
    firstJetMatrix P 0 (0,none) a = 1 ∧
    ∀ j : Fin r, firstJetMatrix P 0 (0,some j) a = 0 := by
  sorry
end NativeRingTests

section NativeFieldExtensions
variable {k : Type u} [Field k] {r n : ℕ}

theorem pointComaximal (P Q : Fin r → k) (hPQ : P ≠ Q) :
    IsCoprime (RingHom.ker (MvPolynomial.eval P)) (RingHom.ker (MvPolynomial.eval Q)) ∧
    IsCoprime ((RingHom.ker (MvPolynomial.eval P))^2)
      ((RingHom.ker (MvPolynomial.eval Q))^2) := by
  sorry
-- double-ideal / double_origin: the actual ideal, including its generator.
example : doubleIdeal (fun _ : Fin 1 => (0 : Fin 1 → k)) =
    Ideal.span {MvPolynomial.X (0 : Fin 1)^2} := by
  sorry
-- double-ideal / double_vs_triple: order one infinitesimals versus a length-three thickening.
example : MvPolynomial.X (0 : Fin 1)^2 ∈
    doubleIdeal (fun _ : Fin 1 => (0 : Fin 1 → k)) ∧
    (MvPolynomial.X (0 : Fin 1) : MvPolynomial (Fin 1) k)^2 ∉
      Ideal.span {MvPolynomial.X (0 : Fin 1)^3} := by
  sorry
-- double-quotient / nonreduced_product: the class is nonzero with square zero.
example : let I := doubleIdeal (fun i : Fin 2 => fun _ : Fin 1 => (i.val : k))
    let z := Ideal.Quotient.mk I (MvPolynomial.X (0 : Fin 1) * (MvPolynomial.X (0 : Fin 1)-1))
    z ≠ 0 ∧ z^2 = 0 := by
  sorry
-- double-quotient / one_point_length: 1,x-P_x,y-P_y give the scalar and both infinitesimals.
example (P : Fin 1 → Fin 2 → k) (a b c : k) (f : MvPolynomial (Fin 2) k)
    (hf : f = MvPolynomial.C a + MvPolynomial.C b * (MvPolynomial.X (0 : Fin 2) -
      MvPolynomial.C (P 0 0)) + MvPolynomial.C c * (MvPolynomial.X (1 : Fin 2) -
      MvPolynomial.C (P 0 1))) :
    doubleQuotient P (by intro i j _; exact Subsingleton.elim i j)
      (Ideal.Quotient.mk _ f) 0 =
      TrivSqZeroExt.inl a + TrivSqZeroExt.inr (fun j : Fin 2 => if j = 0 then b else c) := by
  sorry
-- derivative-on-kernel / square_zero_gradient: the polynomial is nonzero in the domain.
example (f : LinearMap.ker (valueMap (fun _ : Fin 1 => (0 : Fin 1 → k)) 2))
    (hf : f.val.val = MvPolynomial.X (0 : Fin 1)^2) :
    f ≠ 0 ∧ derivativeOnKernel (fun _ : Fin 1 => (0 : Fin 1 → k)) 2 f = 0 := by
  sorry
-- first-jet-map / constant_jets: a nonzero derivative cannot be interpolated by constants.
example (P : Fin 1 → Fin 1 → k) : ¬ Function.Surjective (firstJetMap P 0) := by
  sorry

theorem univariateHermiteRank (P : Fin n → Fin 1 → k) (hP : Function.Injective P)
    (d : ℕ) : (firstJetMatrix P d).rank = min (d+1) (2*n) := by
  sorry

theorem collinearBoundary :
    (firstJetMatrix (fun i : Fin 7 => fun j : Fin 2 =>
      if j.val = 0 then (i.val : ℚ) else 0) 5).rank = 11 := by
  sorry
end NativeFieldExtensions

/-! The coefficient norm lives on the native bounded submodule. -/
noncomputable abbrev coefficientEuclideanCoordinates {r : ℕ} (d : ℕ) :
    Bounded ℝ r d ≃ₗ[ℝ] EuclideanSpace ℝ (Monomials r d) :=
  (coefficientCoordinates d).trans (WithLp.linearEquiv 2 ℝ (Monomials r d → ℝ)).symm

noncomputable instance boundedNormedAddCommGroup (r d : ℕ) :
    NormedAddCommGroup (Bounded ℝ r d) :=
  NormedAddCommGroup.induced _ _ (coefficientEuclideanCoordinates d).toLinearMap.toAddMonoidHom
    (coefficientEuclideanCoordinates d).injective

noncomputable instance boundedInnerProductSpace (r d : ℕ) :
    InnerProductSpace ℝ (Bounded ℝ r d) :=
  InnerProductSpace.induced (coefficientEuclideanCoordinates d).toLinearMap

theorem coefficientCoordinates_isometry {r : ℕ} (d : ℕ) :
    Isometry (coefficientEuclideanCoordinates (r := r) d) := by
  sorry

theorem coefficientGram_inner {r : ℕ} (d : ℕ) (f g : Bounded ℝ r d) :
    inner ℝ f g = coefficientGram d f g := by
  sorry
theorem integralCoordinateLattice {r : ℕ} (d : ℕ) :
    Set.range (fun a : Monomials r d → ℤ =>
      (coefficientCoordinates (k := ℝ) d).symm (fun i => (a i : ℝ))) =
    {f : Bounded ℝ r d | ∀ a : Monomials r d, ∃ z : ℤ,
      coefficientCoordinates d f a = (z : ℝ)} := by
  sorry

-- coefficient-gram / integral_coordinates: integer coefficients and the transported norm.
example (f : Bounded ℝ 1 1) (hf : f.val = 2 + MvPolynomial.X (0 : Fin 1)) :
    (∀ a : Monomials 1 1, ∃ z : ℤ, coefficientCoordinates 1 f a = (z : ℝ)) ∧
    ‖f‖^2 = 5 := by
  sorry

/-! Homogeneous derivative certificates use native matrices and forms. -/
theorem modularRankLift {k : Type u} [Field k] [CharZero k] {a b t : ℕ}
    (M : Matrix (Fin a) (Fin b) ℤ) (rows : Fin t ↪ Fin a) (cols : Fin t ↪ Fin b)
    (hdet : ((M.submatrix rows cols).map (Int.castRingHom (ZMod 101))).det ≠ 0) :
    t ≤ (M.map (Int.castRingHom k)).rank := by
  sorry

theorem homogeneousEuler {k : Type u} [CommRing k] (r d : ℕ)
    (f : MvPolynomial.homogeneousSubmodule (Fin (r+1)) k d) :
    ∑ j : Fin (r+1), MvPolynomial.X j * MvPolynomial.pderiv j f.val =
      MvPolynomial.C (d : k) * f.val := by
  sorry

theorem homogeneousPartials_imply_value {k : Type u} [Field k] [CharZero k]
    (r d : ℕ) (hd : d ≠ 0) (f : MvPolynomial.homogeneousSubmodule (Fin (r+1)) k d)
    (P : Fin (r+1) → k) (hpartials : ∀ j, MvPolynomial.eval P (MvPolynomial.pderiv j f.val) = 0) :
    MvPolynomial.eval P f.val = 0 := by
  sorry

/-! Integer division statements precede the geometric differential-Horace theorem.
No natural subtraction is used for q-u-e or a negative division quotient. -/
theorem numericalTraceBound (r d q : ℕ) (u : ℤ) (e : ℕ)
    (hr : 2 ≤ r) (hd : 4 ≤ d) (hq : q ≤ (Nat.choose (r+d) d + r) / (r+1))
    (he : e < r)
    (hdiv : (r : ℤ)*u + (e : ℤ) = (q : ℤ)*(r+1) - (Nat.choose (r+(d-1)) (d-1) : ℤ)) :
    (r : ℤ)*e + u ≤ (Nat.choose ((r-1)+(d-1)) (d-1) : ℤ) := by
  sorry

theorem numericalResidualBound (r d q : ℕ) (u : ℤ) (e : ℕ)
    (hr : 2 ≤ r) (hd : 4 ≤ d) (hq : q ≤ (Nat.choose (r+d) d + r) / (r+1))
    (he : e < r)
    (hdiv : (r : ℤ)*u + (e : ℤ) = (q : ℤ)*(r+1) - (Nat.choose (r+(d-1)) (d-1) : ℤ)) :
    (Nat.choose (r+(d-2)) (d-2) : ℤ) ≤ ((q : ℤ)-u-e)*(r+1) := by
  sorry

theorem numericalQuarticBound (r q : ℕ) (u : ℤ) (e : ℕ)
    (hr : 10 ≤ r) (hq : q ≤ (Nat.choose (r+4) 4 + r) / (r+1))
    (he : e < r)
    (hdiv : (r : ℤ)*u + (e : ℤ) = (q : ℤ)*(r+1) - (Nat.choose (r+3) 3 : ℤ)) :
    (r : ℤ)+1 ≤ (q : ℤ)-u-e := by
  sorry

theorem criticalDivision (r d q : ℕ) (u : ℤ) (e : ℕ)
    (hr : 2 ≤ r) (hd : 4 ≤ d)
    (hqlo : Nat.choose (r+d) d / (r+1) ≤ q)
    (hqhi : q ≤ (Nat.choose (r+d) d + r) / (r+1)) (he : e < r)
    (hdiv : (r : ℤ)*u + (e : ℤ) = (q : ℤ)*(r+1) - (Nat.choose (r+(d-1)) (d-1) : ℤ)) :
    0 ≤ u ∧ u ≤ (q : ℤ) ∧ 0 ≤ (q : ℤ)-u-e := by
  sorry

theorem planeNumerics (d ℓ : ℕ) (hdegree : 2*ℓ ≤ d)
    (hcount : Nat.choose (2+d) d / 3 ≤ ℓ*(ℓ+3)/2) : d ≤ 4 ∨ d = 6 := by
  sorry

theorem cubicRemainderArithmetic (r : ℕ) :
    Nat.choose (r+3) 3 - (r+1)*((r+3)*(r+2)/6) =
      if r % 3 = 2 then (r+1)/3 else 0 := by
  sorry

theorem exceptionScheduler (r d q u e : ℕ) (hr : 3 ≤ r) (hd : 5 ≤ d)
    (hqlo : Nat.choose (r+d) d / (r+1) ≤ q)
    (hqhi : q ≤ (Nat.choose (r+d) d + r) / (r+1))
    (he : e < r) (hu : u+e ≤ q)
    (hdiv : (r : ℤ)*u + (e : ℤ) = (q : ℤ)*(r+1) - (Nat.choose (r+(d-1)) (d-1) : ℤ)) :
    ∀ t ∈ [(r-1,d,u), (r,d-1,q-u), (r,d-2,q-u-e)],
      ¬ (t.2.1 = 2 ∧ 2 ≤ t.2.2 ∧ t.2.2 ≤ t.1) ∧
      t ≠ (2,4,5) ∧ t ≠ (3,4,9) ∧ t ≠ (4,3,7) ∧ t ≠ (4,4,14) := by
  sorry

/-! The selected determinant is an abbreviation for the native square submatrix determinant. -/
noncomputable abbrev selectedMinor {r n : ℕ} (d : ℕ)
    (cols : JetRows n r ↪ Monomials r d) : MvPolynomial (Fin n × Fin r) ℤ :=
  ((universalJetMatrix r n d).submatrix id cols).det

-- universal-jet-matrix / universal_one_linear: every entry in the 2 by 2 matrix.
example (a b : Monomials 1 1) (ha : a.val = 0) (hb : b.val = Finsupp.single 0 1) :
    universalJetMatrix 1 1 1 (0,none) a = 1 ∧
    universalJetMatrix 1 1 1 (0,none) b = MvPolynomial.X (0,0) ∧
    universalJetMatrix 1 1 1 (0,some 0) a = 0 ∧
    universalJetMatrix 1 1 1 (0,some 0) b = 1 := by
  sorry
example (cols : JetRows 1 1 ↪ Monomials 1 1)
    (h0 : (cols (0,none)).val = 0) (h1 : (cols (0,some 0)).val = Finsupp.single 0 1) :
    selectedMinor 1 cols = 1 := by
  sorry
-- universal-jet-matrix / universal_integer_eval: both value and derivative of x squared.
example (a : Monomials 1 2) (ha : a.val = Finsupp.single 0 2) :
    MvPolynomial.eval (fun _ : Fin 1 × Fin 1 => (3 : ℤ))
      (universalJetMatrix 1 1 2 (0,none) a) = 9 ∧
    MvPolynomial.eval (fun _ : Fin 1 × Fin 1 => (3 : ℤ))
      (universalJetMatrix 1 1 2 (0,some 0) a) = 6 := by
  sorry

theorem selectedMinor_eval {k : Type u} [Field k] {r n : ℕ} (d : ℕ)
    (cols : JetRows n r ↪ Monomials r d) (P : Fin n → Fin r → k) :
    MvPolynomial.aeval (fun z : Fin n × Fin r => P z.1 z.2) (selectedMinor d cols) =
      ((firstJetMatrix P d).submatrix id cols).det := by
  sorry

theorem maximalMinor {k : Type u} [Field k] [IsAlgClosed k] [CharZero k]
    (r n d : ℕ) (hr : 1 ≤ r) (hn : 1 ≤ n) (hd : 5 ≤ d)
    (hsize : n*(r+1) ≤ Nat.choose (r+d) d) :
    ∃ cols : JetRows n r ↪ Monomials r d, selectedMinor d cols ≠ 0 ∧
      ∃ P : Fin n → Fin r → k, Function.Injective P ∧
        MvPolynomial.aeval (fun z : Fin n × Fin r => P z.1 z.2) (selectedMinor d cols) ≠ 0 := by
  sorry

theorem minorTotalDegree {r n : ℕ} (d : ℕ) (cols : JetRows n r ↪ Monomials r d) :
    (selectedMinor d cols).totalDegree ≤ n*(r+1)*d := by
  sorry

theorem minorCoordinateDegree {r n : ℕ} (d : ℕ)
    (cols : JetRows n r ↪ Monomials r d) (z : Fin n × Fin r) :
    (selectedMinor d cols).degreeOf z ≤ n*(r+1)*d := by
  sorry

-- A tuple is sent to its native evaluation kernel in PrimeSpectrum.
noncomputable abbrev evaluationPrime {k : Type u} [Field k] {r n : ℕ}
    (P : Fin n → Fin r → k) : PrimeSpectrum (MvPolynomial (Fin n × Fin r) k) :=
  ⟨RingHom.ker (MvPolynomial.eval (fun z : Fin n × Fin r => P z.1 z.2)), by sorry⟩

theorem evaluationPrime_asIdeal {k : Type u} [Field k] {r n : ℕ}
    (P : Fin n → Fin r → k) : (evaluationPrime P).asIdeal =
      RingHom.ker (MvPolynomial.eval (fun z : Fin n × Fin r => P z.1 z.2)) := by
  sorry

-- Reuse the native affine scheme and its existing polynomial-spectrum isomorphism.
open CategoryTheory AlgebraicGeometry

noncomputable abbrev parameterScheme (k : Type u) [CommRing k] (n r : ℕ) : Scheme.{u} :=
  Spec (CommRingCat.of (MvPolynomial (Fin n × Fin r) k))

noncomputable def evaluationSchemePoint {k : Type u} [Field k] {n r : ℕ}
    (P : Fin n → Fin r → k) : Spec (CommRingCat.of k) ⟶ parameterScheme k n r :=
  Spec.map (CommRingCat.ofHom (MvPolynomial.eval (fun z : Fin n × Fin r => P z.1 z.2)))

theorem evaluationSchemePoint_over {k : Type u} [Field k] {n r : ℕ}
    (P : Fin n → Fin r → k) :
    evaluationSchemePoint P ≫ Spec.algebraMap k (MvPolynomial (Fin n × Fin r) k) =
      𝟙 (Spec (CommRingCat.of k)) := by
  sorry

theorem evaluationSchemePoint_image {k : Type u} [Field k] {n r : ℕ}
    (P : Fin n → Fin r → k) (x : Spec (CommRingCat.of k)) :
    evaluationSchemePoint P x = evaluationPrime P := by
  sorry

theorem principalOpen_membership {k : Type u} [Field k] {r n : ℕ} (d : ℕ)
    (cols : JetRows n r ↪ Monomials r d) (P : Fin n → Fin r → k) :
    evaluationPrime P ∈ PrimeSpectrum.basicOpen
      (MvPolynomial.map (Int.castRingHom k) (selectedMinor d cols)) ↔
    MvPolynomial.aeval (fun z : Fin n × Fin r => P z.1 z.2) (selectedMinor d cols) ≠ 0 := by
  sorry

theorem principalOpen_wellPoised {k : Type u} [Field k] {r n : ℕ} (d : ℕ)
    (cols : JetRows n r ↪ Monomials r d) (P : Fin n → Fin r → k)
    (hP : evaluationPrime P ∈ PrimeSpectrum.basicOpen
      (MvPolynomial.map (Int.castRingHom k) (selectedMinor d cols))) :
    Function.Injective P ∧ WellPoised P d := by
  sorry

theorem genericAffinePrincipalOpen {k : Type u} [Field k] [IsAlgClosed k] [CharZero k]
    (r n d : ℕ) (hr : 1 ≤ r) (hn : 1 ≤ n) (hd : 5 ≤ d)
    (hsize : n*(r+1) ≤ Nat.choose (r+d) d) :
    ∃ cols : JetRows n r ↪ Monomials r d,
      IsOpen ((PrimeSpectrum.basicOpen (MvPolynomial.map (Int.castRingHom k)
        (selectedMinor d cols))) : Set (PrimeSpectrum (MvPolynomial (Fin n × Fin r) k))) ∧
      (∃ P : Fin n → Fin r → k, evaluationPrime P ∈ PrimeSpectrum.basicOpen
        (MvPolynomial.map (Int.castRingHom k) (selectedMinor d cols))) ∧
      ∀ P : Fin n → Fin r → k, evaluationPrime P ∈ PrimeSpectrum.basicOpen
        (MvPolynomial.map (Int.castRingHom k) (selectedMinor d cols)) →
        Function.Injective P ∧ WellPoised P d := by
  sorry

theorem integerGridForMinor {k : Type u} [Field k] [CharZero k] {r n : ℕ}
    (d : ℕ) (cols : JetRows n r ↪ Monomials r d) (hΔ : selectedMinor d cols ≠ 0) :
    ∃ P : Fin n → Fin r → ℤ,
      (∀ i j, 0 ≤ P i j ∧ P i j ≤ (n*(r+1)*d : ℕ)) ∧
      MvPolynomial.eval (fun z : Fin n × Fin r => P z.1 z.2) (selectedMinor d cols) ≠ 0 ∧
      Function.Injective P ∧ WellPoised (fun i j => (P i j : k)) d := by
  sorry

theorem parameterPullback {k : Type u} [Field k] [CharZero k]
    {S : Type*} [Fintype S] {r n : ℕ} (d : ℕ)
    (cols : JetRows n r ↪ Monomials r d) (θ : Fin n × Fin r → MvPolynomial S ℤ)
    (B : S → ℕ) (hΔ : MvPolynomial.aeval θ (selectedMinor d cols) ≠ 0)
    (hB : ∀ s, (MvPolynomial.aeval θ (selectedMinor d cols)).degreeOf s ≤ B s) :
    ∃ u : S → ℤ, (∀ s, 0 ≤ u s ∧ u s ≤ (B s : ℤ)) ∧
      MvPolynomial.eval u (MvPolynomial.aeval θ (selectedMinor d cols)) ≠ 0 ∧
      Function.Injective (fun i : Fin n => fun j : Fin r => MvPolynomial.eval u (θ (i,j))) ∧
      WellPoised (fun i : Fin n => fun j : Fin r => (MvPolynomial.eval u (θ (i,j)) : k)) d := by
  sorry

/-! Omitted geometric signatures (the full mathematical contracts are in README.md):
GI.0: sections-comparison;
GI.1: projective-jet-comparison and the scheme interpretation of double-length;
GI.2: restriction-rank (its API and three tests), disjoint rank, residual/trace,
Castelnuovo, ordinary Horace, subscheme independence, both curvilinear criteria,
finite-flat rank openness and proper curvilinear limits;
GI.3: native Veronese/secant/contact geometry, plane induction (the numerical
reduction has a native signature above), codimension-three
cubic systems and their remainder families, the actual finite base witnesses;
GI.4: differential-Horace linear systems and moving-support construction (its
API and three tests), mixed tangent/transverse bounds, the two contradiction
branches, quartic induction and the generic projective locus (the pure integer
exception scheduler has a native signature above);
GI.5: the projective-chart section/restriction comparison.
The native affine Scheme and its k-valued evaluation morphism above express the affine polynomial consequence;
they do not replace the projective section or moving-family interfaces. No omitted hypothesis is encoded by an unconstrained Prop field. -/
end GenericDoublePointInterpolation
