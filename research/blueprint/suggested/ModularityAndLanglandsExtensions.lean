import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Projective
import Mathlib.Algebra.Field.ZMod
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.GroupTheory.GroupAction.ConjAct
import Lean.Elab.Tactic.Omega

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. No admitted theorem is an implementation.

The mathematical contracts following the prototypes explicitly mark signatures omitted
under PROTOCOL §13. Their automorphic, Weil–Deligne, compatible-system or stable
∞-category supplier types do not yet have faithful callable interfaces at the pins.
Comments bearing a proposed declaration name are specifications, not declarations.
They must not be counted as elaborated theorems. There are no free supplier records
or opaque propositions standing in for the missing conditions.
-/

noncomputable section
open scoped BigOperators MatrixGroups

namespace TauCeti.LanglandsRegister

inductive Status where
  | known
  | conditional
  | conjectural
  deriving DecidableEq

/-- Registry assertions have names and actual propositions. This is bookkeeping,
not an abstraction of an automorphic object or a classification hypothesis. -/
structure NamedHypothesis where
  name : String
  assertion : Prop

def AllHypotheses (hs : List NamedHypothesis) : Prop :=
  ∀ h ∈ hs, h.assertion

/-- Every constructor records one assertion. Only `known` contains a proof without inputs. -/
inductive EndpointRecord (P : Prop) where
  | known (source locator : String) (producers : List String) (proof : P)
  | conditional (source locator : String) (producers : List String)
      (hypotheses : List NamedHypothesis) (proof : AllHypotheses hypotheses → P)
  | conjectural (source locator : String) (producers : List String)

namespace EndpointRecord
variable {P : Prop}

def status : EndpointRecord P → Status
  | .known .. => .known
  | .conditional .. => .conditional
  | .conjectural .. => .conjectural

def hypotheses : EndpointRecord P → List NamedHypothesis
  | .conditional _ _ _ hs _ => hs
  | _ => []

theorem holds_of_hypotheses (r : EndpointRecord P)
    (h : r.status = .conditional) (hh : AllHypotheses r.hypotheses) : P := by
  sorry

def upgrade (r : EndpointRecord P) (h : r.status = .conditional)
    (hh : AllHypotheses r.hypotheses) : EndpointRecord P :=
  match r with
  | .known s l ds hp => .known s l ds hp
  | .conditional s l ds hs hp => .known s l ds (hp hh)
  | .conjectural _ _ _ => False.elim (by cases h)

theorem known_holds (r : EndpointRecord P) (h : r.status = .known) : P := by
  sorry

-- Test: TauCeti.LanglandsRegister.EndpointRecord.arithmetic_known
example : (EndpointRecord.known "arithmetic" "2+2" []
    (by decide : (2 : ℕ) + 2 = 4)).status = .known ∧
    (EndpointRecord.known "arithmetic" "2+2" []
      (by decide : (2 : ℕ) + 2 = 4)).hypotheses = [] := by
  sorry

private def impossibleHypothesis : NamedHypothesis := ⟨"1=2", (1 : ℕ) = 2⟩

private def conditionalArithmetic : EndpointRecord ((3 : ℕ) = 4) :=
  .conditional "arithmetic" "from 1=2" [] [impossibleHypothesis] (by
    intro hh
    have h : (1 : ℕ) = 2 := hh impossibleHypothesis (by simp)
    omega)

-- Test: TauCeti.LanglandsRegister.EndpointRecord.arithmetic_conditional
example : conditionalArithmetic.status = .conditional ∧
    conditionalArithmetic.hypotheses.length = 1 := by
  sorry

-- Test: TauCeti.LanglandsRegister.EndpointRecord.arithmetic_conjectural
example : (EndpointRecord.conjectural (P := (3 : ℕ) = 4)
    "arithmetic" "3=4" []).status = .conjectural ∧ ¬ (3 : ℕ) = 4 := by
  sorry

-- Test: TauCeti.LanglandsRegister.EndpointRecord.unrelated_proof_not_upgrade
example : ¬ AllHypotheses conditionalArithmetic.hypotheses := by
  sorry

end EndpointRecord

-- Test: TauCeti.LanglandsRegister.empty_hypotheses
example {P : Prop} (hp : AllHypotheses [] → P) :
    let r := EndpointRecord.conditional "source" "locator" [] [] hp
    r.status = .conditional ∧
      (r.upgrade rfl (by simp [r, EndpointRecord.hypotheses, AllHypotheses])).status = .known := by
  sorry

/-- The four predicted weights are an explicit list, with repetitions retained. -/
def singularWeightHodgeList (k : ℕ) (r : ℤ) : List ℤ :=
  [0, r - 2, r + k - 1, k + 2 * r - 3]

theorem singularWeightHodgeList_length (k : ℕ) (r : ℤ) :
    (singularWeightHodgeList k r).length = 4 := by
  sorry

theorem singularWeightHodgeList_nodup_iff (k : ℕ) (r : ℤ) :
    (singularWeightHodgeList k r).Nodup ↔
      r ≠ 2 ∧ (k : ℤ) + r ≠ 1 ∧ (k : ℤ) + 2 * r ≠ 3 := by
  sorry

theorem singularWeightHodgeList_r_two (k : ℕ) :
    singularWeightHodgeList k 2 = [0, 0, (k : ℤ) + 1, (k : ℤ) + 1] := by
  sorry

-- Test: TauCeti.LanglandsRegister.hodgeList_k2_r1
example : singularWeightHodgeList 2 1 = [0, -1, 2, 1] ∧
    (singularWeightHodgeList 2 1).Nodup := by
  sorry

-- Test: TauCeti.LanglandsRegister.hodgeList_singular
example : ¬ (singularWeightHodgeList 3 2).Nodup := by
  sorry

-- Test: TauCeti.LanglandsRegister.hodgeList_degenerate
example : singularWeightHodgeList 0 2 = [0, 0, 1, 1] := by
  sorry

end TauCeti.LanglandsRegister

namespace TauCeti.SymmetricPower

/-- Weight-level definition. The automorphic supplier supplies `wt` as the actual weight of `π`. -/
def IsParallelWeight {ι : Type*} (wt : ι → Fin 2 → ℤ) : Prop :=
  ∀ τ σ, wt τ 0 - wt τ 1 = wt σ 0 - wt σ 1

def parallelWeight {ι : Type*} (wt : ι → Fin 2 → ℤ) (τ : ι) : ℤ :=
  wt τ 0 - wt τ 1 + 2

theorem IsParallelWeight.twist {ι : Type*} (wt : ι → Fin 2 → ℤ)
    (a : ι → ℤ) : IsParallelWeight (fun τ i => wt τ i + a τ) ↔
      IsParallelWeight wt := by
  sorry

theorem parallelWeight_independent {ι : Type*} {wt : ι → Fin 2 → ℤ}
    (h : IsParallelWeight wt) (τ σ : ι) : parallelWeight wt τ = parallelWeight wt σ := by
  sorry

-- Test: TauCeti.SymmetricPower.parallelWeight_Q
example (wt : Unit → Fin 2 → ℤ) : IsParallelWeight wt := by
  sorry

-- Test: TauCeti.SymmetricPower.parallelWeight_two
example : IsParallelWeight (fun (_ : Fin 2) (_ : Fin 2) => (0 : ℤ)) ∧
    parallelWeight (fun (_ : Fin 2) (_ : Fin 2) => (0 : ℤ)) 0 = 2 := by
  sorry

-- Test: TauCeti.SymmetricPower.nonParallel_hilbert
example : ¬ IsParallelWeight (fun (τ : Fin 2) (i : Fin 2) =>
    if i = 0 then if τ = 0 then (0 : ℤ) else 2 else 0) := by
  sorry

/-- A precise *finite coefficient field* instance of the NT II image hypothesis.
The ambient field `K` is the residual coefficient field; specialization uses F̄_p.
The same conjugation and same embedded finite field occur in both inclusions. -/
def ProjectiveImageSandwich {G k K : Type*} [Group G] [Field k] [Fintype k]
    [Field K] (p a n : ℕ) (ι : k →+* K) (ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K) : Prop :=
  Nat.Prime p ∧ 1 ≤ a ∧ 1 ≤ n ∧ Fintype.card k = p ^ a ∧
  Fintype.card k > max 5 (2 * n - 1) ∧
  ∃ c : PGL(2, K),
    ((Matrix.ProjGenLinGroup.map ι).comp
      (Matrix.ProjectiveSpecialLinearGroup.toPGL (n := Fin 2) (R := k))).range ≤
        ((MulAut.conj c).toMonoidHom.comp (Matrix.ProjGenLinGroup.mk.comp ρ)).range ∧
    ((MulAut.conj c).toMonoidHom.comp (Matrix.ProjGenLinGroup.mk.comp ρ)).range ≤
      (Matrix.ProjGenLinGroup.map (n := Fin 2) ι).range

theorem ProjectiveImageSandwich.bound {G k K : Type*} [Group G] [Field k]
    [Fintype k] [Field K] {p a n : ℕ} {ι : k →+* K} {ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K}
    (h : ProjectiveImageSandwich p a n ι ρ) : p ^ a > max 5 (2 * n - 1) := by
  sorry

theorem ProjectiveImageSandwich.mono {G k K : Type*} [Group G] [Field k]
    [Fintype k] [Field K] {p a m n : ℕ} {ι : k →+* K} {ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K}
    (h : ProjectiveImageSandwich p a n ι ρ) (hm : 1 ≤ m) (hmn : m ≤ n) :
    ProjectiveImageSandwich p a m ι ρ := by
  sorry

theorem ProjectiveImageSandwich.conjugation {G k K : Type*} [Group G] [Field k]
    [Fintype k] [Field K] {p a n : ℕ} {ι : k →+* K} {ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K}
    (d : Matrix.GeneralLinearGroup (Fin 2) K) :
    ProjectiveImageSandwich p a n ι ((MulAut.conj d).toMonoidHom.comp ρ) ↔
      ProjectiveImageSandwich p a n ι ρ := by
  sorry

-- Test: TauCeti.SymmetricPower.projectiveImage_F7_n3
local instance : Fact (Nat.Prime 7) := ⟨by decide⟩
local instance : Fact (Nat.Prime 5) := ⟨by decide⟩
example : ProjectiveImageSandwich 7 1 3 (RingHom.id (ZMod 7))
    (MonoidHom.id (Matrix.GeneralLinearGroup (Fin 2) (ZMod 7))) := by
  sorry

-- Test: TauCeti.SymmetricPower.projectiveImage_F5_excluded
example (ρ : Matrix.GeneralLinearGroup (Fin 2) (ZMod 5) →* Matrix.GeneralLinearGroup (Fin 2) (ZMod 5)) :
    ¬ ProjectiveImageSandwich 5 1 2 (RingHom.id (ZMod 5)) ρ := by
  sorry

-- Test: TauCeti.SymmetricPower.projectiveImage_a0_excluded
example {G k K : Type*} [Group G] [Field k] [Fintype k] [Field K]
    (p n : ℕ) (ι : k →+* K) (ρ : G →* Matrix.GeneralLinearGroup (Fin 2) K) :
    ¬ ProjectiveImageSandwich p 0 n ι ρ := by
  sorry

-- Test: TauCeti.SymmetricPower.projectiveImage_small_characteristic_bound
example : (2 : ℕ) ^ 3 > max 5 (2 * 4 - 1) ∧ 2 ≤ 4 := by
  sorry

end TauCeti.SymmetricPower

namespace TauCeti.LanglandsRegister
open Polynomial

/-- Consumer normalization wrapper for Mathlib's existing polynomial reverse. -/
def reciprocalEulerPolynomial {R : Type*} [Semiring R] (Q : R[X]) : R[X] :=
  Q.reverse

theorem reciprocalEulerPolynomial_coeff_zero {R : Type*} [Semiring R]
    (Q : R[X]) (h : Q.Monic) : (reciprocalEulerPolynomial Q).coeff 0 = 1 := by
  sorry

theorem reciprocalEulerPolynomial_eval {K : Type*} [Field K] (Q : K[X])
    (x : K) (hx : x ≠ 0) :
    (reciprocalEulerPolynomial Q).eval x * x⁻¹ ^ Q.natDegree = Q.eval x⁻¹ := by
  sorry

theorem reciprocalEulerPolynomial_matrix {K : Type*} [Field K]
    {n : ℕ} (A : Matrix.GeneralLinearGroup (Fin n) K) (x : K) :
    (reciprocalEulerPolynomial A.val.charpoly).eval x =
      (1 - x • A.val).det := by
  sorry

-- Test: TauCeti.LanglandsRegister.euler_trivial
example : reciprocalEulerPolynomial (X - 1 : ℚ[X]) = 1 - X := by
  sorry

-- Test: TauCeti.LanglandsRegister.euler_rank_zero
example : reciprocalEulerPolynomial (1 : ℚ[X]) = 1 := by
  sorry

-- Test: TauCeti.LanglandsRegister.euler_quadratic
example (a q : ℚ) : reciprocalEulerPolynomial (X ^ 2 - C a * X + C q) =
    1 - C a * X + C q * X ^ 2 := by
  sorry

-- Test: TauCeti.LanglandsRegister.euler_wrong_argument
example : (X - 1 : ℚ[X]).eval (1 / 2) ≠ (1 - X : ℚ[X]).eval (1 / 2) := by
  sorry

end TauCeti.LanglandsRegister

namespace TauCeti.Arthur

/-- The determinant constraint on a sign vector, written additively mod two. -/
def orthogonalSignKernel {ι : Type*} [Fintype ι] (dim : ι → ℕ) :
    AddSubgroup (ι → ZMod 2) where
  carrier := {s | ∑ i, (dim i : ZMod 2) * s i = 0}
  zero_mem' := by simp
  add_mem' := by
    intro a b ha hb
    simp only [Set.mem_ofPred_eq, Pi.add_apply, mul_add, Finset.sum_add_distrib] at *
    rw [ha, hb, add_zero]
  neg_mem' := by
    intro a ha
    simp only [Set.mem_ofPred_eq, Pi.neg_apply, mul_neg, Finset.sum_neg_distrib]
    rw [ha, neg_zero]

theorem orthogonalSignKernel_mem_iff {ι : Type*} [Fintype ι]
    (dim : ι → ℕ) (s : ι → ZMod 2) :
    s ∈ orthogonalSignKernel dim ↔ ∑ i, (dim i : ZMod 2) * s i = 0 := by
  sorry

theorem orthogonalSignKernel_even {ι : Type*} [Fintype ι]
    (dim : ι → ℕ) (h : ∀ i, Even (dim i)) : orthogonalSignKernel dim = ⊤ := by
  sorry

theorem orthogonalSignKernel_one_odd (d : ℕ) (h : Odd d) :
    orthogonalSignKernel (fun (_ : Fin 1) => d) = ⊥ := by
  sorry

-- Test: TauCeti.Arthur.signKernel_rank_three
example : orthogonalSignKernel (fun (_ : Fin 1) => 3) = ⊥ := by
  sorry

-- Test: TauCeti.Arthur.signKernel_empty
example : orthogonalSignKernel (fun (i : Fin 0) => i.elim0) = ⊤ := by
  sorry

-- Test: TauCeti.Arthur.signKernel_two_odd
example (s : Fin 2 → ZMod 2) :
    s ∈ orthogonalSignKernel (fun (_ : Fin 2) => 1) ↔ s 0 = s 1 := by
  sorry

end TauCeti.Arthur

/-!
# Mathematical declaration manifest

Every packet target, API name and test name occurs below. Status `omitted` means
there is no Lean declaration for that item; status `stated` points to the core above.
The full mathematical statement remains in the reader. These comments do not
introduce supplier stand-ins or claim that omitted statements elaborated.

C-GALOIS — AutomorphicGaloisRepresentationsPartII:AG2.2
Actual continuous representations of the absolute Galois group in finite coefficient fields and their algebraic closures; coefficient extension, restriction along actual number-field embeddings, integral lattices and semisimple residual reduction; Weil–Deligne realization of the same representation at each finite place. Realization π↦r_{π,ι} must commute with isomorphism, twists, duals and permitted base change, with the stated rec^T and Hodge–Tate identities. Complex conjugation, polarization multiplier and Hodge/sign data refer to that realization. Frobenius inversion is evaluation at inverse elements; a separate cohomological-duality dictionary is required before changing Hodge signs.

C-AUTOMORPHIC — AutomorphicFormsOnReductiveGroups:AF.1
Actual isomorphism classes of irreducible admissible local representations and global automorphic representations with a fixed field, reductive group and rank. Cuspidal, isobaric, regular algebraic, weight, local component, central character, twist and contragredient refer to those objects. Isobaric sums preserve multiplicities and their local parameters are direct sums. Local rec commutes with twists/duals and the all-place functorial-lift predicate uses the same components. The Langlands quotient over ℝ/ℂ and the archimedean Weil group have the specified LLC source scope; a rank label cannot supply these laws.

C-SYSTEM — PotentialModularityAndCompatibleSystems:R24.5
A system consists of one number field, coefficient field, rank and finite bad set; actual continuous semisimple r_λ; monic Q_v and Hodge multisets. For each λ, r_λ is unramified away from the bad set and residue characteristic and has Frobenius characteristic polynomial equal to Q_v through the specified coefficient embedding. Purity constrains the roots of those same Q_v under every complex embedding. Symmetric powers, tensors, duals, twists, restriction and direct sums are the operations on r_λ and determine the new Q_v, rank, Hodge multiset and pairing; a constituent decomposition is an actual isomorphism at every λ. Strict compatibility additionally supplies coherent ramified WD and real-sign data. The L-function is the Euler product of these Q_v, with the reciprocal conversion above, and its conductor/gamma/epsilon factors use those WD and real data. For a cohomological Dwork fibre, good-place comparison identifies only the global semisimplification. Match coefficient embeddings; require semisimplicity separately before transferring a maximal local monodromy block.

C-ARTIN — AnalyticNumberTheory:AN.4
The full Artin L-function is constructed from the same finite-image continuous complex representation: finite local factors are the determinants on inertia invariants, with the specified Frobenius, and infinity factors use its complex-conjugation eigenspaces. Strong Artin matching supplies local parameters and all these factors at every place; weak almost-everywhere matching supplies only a partial product. Twists, direct sums and automorphic comparisons commute with these constructions. Entireness excludes the trivial rank-one representation.

C-LOCAL-DEFORMATION — PotentialAutomorphyInfrastructure:PA.4
The component-connects relation compares lifts of the same local residual representation, determinant and Hodge type in the actual generic fibre of its deformation ring. Ordinary and potentially diagonalizable predicates apply to the same continuous local representation and filtration/crystalline module. BCGNT 3.2.1 must export the specialized connects ALT used twice in 6.2.3, preserving all seventeen auxiliary-system conditions and the subsequent cyclic untensoring/descent. PA.4 ordinary/Fontaine–Laffaille endpoints alone do not imply this, nor Caraiani–Newton 1.3 or CG18 5.16.

C-MODULI — PotentialModularityAndCompatibleSystems:R23.1
Moret–Bailly uses a smooth geometrically connected scheme over an actual number field; local open subsets of its base changes; and a returned point whose images lie in those opens under the returned field embeddings and completion isomorphisms. The extension has the stated Galois, disjointness and local properties. The twisted modular curve is descended from full level via the actual E[q] Galois cocycle, with Weil-pairing multiplier ε̄, and its points represent symplectic isomorphisms of the specified torsion modules.

C-ARTHUR — EndoscopicTransferAndUnitaryTraceComparison:ET.3
Actual admissible L/Arthur homomorphisms into the specified L-group; centralizers and component-group quotients derived from those homomorphisms; finite local packet multisets with retained repetitions; Whittaker/inner-twist pairings; global restricted products and multiplicities as natural numbers. Orthogonal parameters satisfy the determinant-one relation before quotienting by the centre. Refined endoscopic character identities and global multiplicity formulas refer to these packets. Unknown weighted/twisted orbital-integral and stabilization hypotheses must be stated by the constructive Part II, with its exact test-function normalizations and local scope. Until then their conditional classification signatures are omitted, not encoded as ArthurInputs. KMSW 2014 generic pure-inner scope and its two nongeneric local inputs are kept distinct. Mœglin–Renard membership uses the two explicit branches stated at its node, not a CaseI field.

C-COHERENT-GEOMETRY — AutomorphicFormsOnReductiveGroups:AF.4
The actual coherent cohomology eigensystem and attached GSp₄ Galois representation, with a number-field action on an actual abelian variety and its H¹ eigenspaces, are required for the two frontier predicates. The Hodge list is prototyped independently and does not prove the expected de Rham/crystalline claims. For Bianchi forms use actual Fourier coefficients, Hecke eigensystems and the Harder parabolic-cohomology comparison, not unrelated coefficient functions.

C-EQUIDISTRIBUTION — tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups
Compact-group characters and Haar probability are supplied by the existing CompactGroups roadmap, including its separate SU₂ symmetric-power classification and class-function completeness. Frobenius classes are the normalized semisimple classes of the same pure Galois realization. The norm is the actual number-field norm and multiplicity is bounded at each norm. The analytic criterion consumes Euler products of those classes with continuation and boundary nonvanishing for every nontrivial irreducible character; free classes/functions cannot supply equidistribution.

C-CATEGORICAL — ExcursionOperatorsAndSpectralAction:ES5
Stable ∞-categories D_lis(Bun_G,Λ), Perf and Ind Perf of the actual parameter stack, compact objects, bounded coherent objects with quasicompact and nilpotent singular support, the spectral action on the specified Whittaker sheaf and its canonical colimit extension/right adjoint. These are needed to state FS I.10.2. An ordinary category/functor or a semisimple parameter function is not a substitute. The existing ES5 parameter map supplies only the semisimple specialization. Zou’s torus theorem also needs the stable/condensed group-homology and character-gerbe constructions, as a specific extension of the geometrisation owner.

## ModularityAndLanglandsExtensions:ML.0/archimedean-langlands-conventions
Assigned layer: ModularityAndLanglandsExtensions:ML.0
Declaration: TauCeti.LanglandsRegister.recArch
Prototype status: omitted
Supplier contracts: C-AUTOMORPHIC
Art_ℝ : ℝ^× ↠ Gal(ℂ/ℝ) and Art_ℂ : ℂ^× ↠ Gal(ℂ/ℂ) are the unique continuous surjections. For K = ℝ (resp. ℂ), rec_K is Langlands' bijection (owner: AutomorphicFormsOnReductiveGroups AF.1/archimedean-llc-gln; this node fixes ACC+'s use of it and constructs ⊞ and BC on top) from irreducible admissible (Lie GL_n(ℝ) ⊗_ℝ ℂ, O(n))-modules (resp. (Lie GL_n(ℂ) ⊗_ℝ ℂ, U(n))-modules) to continuous semisimple n-dimensional representations of the Weil group W_K. For modules π_i of rank n_i, the isobaric sum π₁ ⊞ ⋯ ⊞ π_r is defined by rec_K(π₁ ⊞ ⋯ ⊞ π_r) = rec_K(π₁) ⊕ ⋯ ⊕ rec_K(π_r); for π a (Lie GL_n(ℝ) ⊗ ℂ, O(n))-module, BC_{ℂ/ℝ}(π) is the (Lie GL_n(ℂ) ⊗ ℂ, U(n))-module with rec_ℂ(BC_{ℂ/ℝ}(π)) = rec_ℝ(π)|_{W_ℂ}. ACC+ print the labels rec_ℝ and rec_ℂ interchanged (recorded as a source issue).
Hypothesis: n ≥ 1; modules are (𝔤, K)-modules in the sense of AutomorphicFormsOnReductiveGroups AF.1.
API [omitted] TauCeti.LanglandsRegister.recArch
  rec_K : irreducible admissible GL_n(K)-modules → semisimple n-dimensional W_K-representations, K = ℝ, ℂ.
API [omitted] TauCeti.LanglandsRegister.recArch_bijective
  rec_K is a bijection onto isomorphism classes.
API [omitted] TauCeti.LanglandsRegister.recArch_gl1
  For n=1 use local Weil reciprocity K^×≅W_K^ab; rec_K(χ) is χ transported to W_K^ab. The finite map to Gal(ℂ/K) does not define this for arbitrary χ.
API [omitted] TauCeti.LanglandsRegister.isobaricSum
  π₁ ⊞ π₂ with rec(π₁ ⊞ π₂) = rec(π₁) ⊕ rec(π₂).
API [omitted] TauCeti.LanglandsRegister.baseChangeCR
  BC_{ℂ/ℝ}(π) with rec_ℂ(BC_{ℂ/ℝ}(π)) = rec_ℝ(π)|_{W_ℂ}.
API [omitted] TauCeti.LanglandsRegister.recArch_twist
  rec_K(π ⊗ (χ ∘ det)) = rec_K(π) ⊗ rec_K(χ).
API [omitted] TauCeti.LanglandsRegister.recArch_dual
  rec_K(π^∨) = rec_K(π)^∨.
Test [omitted] TauCeti.LanglandsRegister.recArch_sign
  rec_ℝ(sgn) is the character of W_ℝ that is trivial on W_ℂ = ℂ^× and sends j to −1.
Test [omitted] TauCeti.LanglandsRegister.recArch_trivial_gl2
  rec_ℝ(1_{GL₂(ℝ)}) = |·|^{1/2} ⊕ |·|^{−1/2} (the trivial module is the Langlands quotient of the induced module from |·|^{1/2} ⊗ |·|^{−1/2}).
Test [omitted] TauCeti.LanglandsRegister.baseChange_gl1
  n = 1: BC_{ℂ/ℝ}(χ) = χ ∘ N_{ℂ/ℝ}.
Test [omitted] TauCeti.LanglandsRegister.discreteSeries_not_isobaric
  rec_ℝ(D_k) for a discrete series D_k (k ≥ 2) is irreducible of dimension 2, so D_k is not an isobaric sum of characters, while BC_{ℂ/ℝ}(D_k) is.
Source: acc-2023, §1.2 Notation, arXiv v2 p. 11 (Annals pp. 907–908)

## ModularityAndLanglandsExtensions:ML.0/blggt-normalization-register
Assigned layer: ModularityAndLanglandsExtensions:ML.0
Declaration: TauCeti.PotentialAutomorphy.normalizationRegister
Prototype status: omitted
Supplier contracts: C-GALOIS
Register of the conventions BLGGT (arXiv v4) fixes, against which every ML.2 statement is read. (1) A polarized automorphic representation of GL_n(𝔸_F) is a pair (π, χ) with χ : 𝔸_{F⁺}^×/(F⁺)^× → ℂ^× continuous, χ_v(−1) independent of v | ∞, and π^c ≅ π^∨ ⊗ (χ ∘ N_{F/F⁺} ∘ det), with χ_v(−1) = (−1)^{n+w} for v | ∞ when F is imaginary and π has pure weight a ∈ (ℤ^n)_w (the inherited AG2.0/E2 correction; the printed (−1)^n is its weight-zero special case); v4's "polarized" replaces v1's RAECSDC (F imaginary CM) and RAESDC (F totally real). (2) Weights a ∈ (ℤ^n)^{Hom(F,ℂ),+}: π has weight a if π_∞ has the infinitesimal character of Ξ_a^∨; then a ∈ (ℤ^n)_w for some w. (3) The Galois normalisation: (r_{l,ı}(π), ε_l^{1−n}r_{l,ı}(χ)) is totally odd polarized, HT_τ(r_{l,ı}(π)) = {a_{ıτ,1} + n − 1, …, a_{ıτ,n}}, and ıWD(r_{l,ı}(π)|_{G_{F_v}})^{F-ss} ≅ rec(π_v ⊗ |det|_v^{(1−n)/2}) for v ∤ l (and for v | l when π_v has Iwahori-fixed vectors). (4) HT_τ(ε_l) = {−1} and Art_K sends uniformisers to geometric Frobenius. (5) Being automorphic does not depend on ı (Clozel, Theorem 3.13).
Hypothesis: F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı : Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1) ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).
Source: blggt-2014-v4, §2.1, p. 32 (arXiv v4)
Source: blggt-2014-v4, §2.1, Theorem 2.1.1, pp. 33–34 (arXiv v4)

## ModularityAndLanglandsExtensions:ML.0/reciprocal-euler-polynomial
Assigned layer: ModularityAndLanglandsExtensions:ML.0
Declaration: TauCeti.LanglandsRegister.reciprocalEulerPolynomial
Prototype status: stated
Supplier contracts: none; concrete core above
For a polynomial Q over a semiring define reciprocalEulerPolynomial(Q) to be Mathlib’s reverse of Q. If Q is monic of degree n this has constant coefficient one and is T^n Q(T⁻¹). For an invertible n×n matrix A over a field, reversing its characteristic polynomial gives det(1−TA). At nonzero x, P(x)x^{−n}=Q(x⁻¹). Thus the unramified Euler denominator is P(q^{−s}), not Q(q^{−s}). This is the local normalization comparison; the compatible-system L-function remains owned by R24.5.
Hypothesis: Exactly the domains and hypotheses stated.
API [stated] TauCeti.LanglandsRegister.reciprocalEulerPolynomial
  Mathlib polynomial reverse, at the actual degree.
API [stated] TauCeti.LanglandsRegister.reciprocalEulerPolynomial_coeff_zero
  For monic Q the constant coefficient is one.
API [stated] TauCeti.LanglandsRegister.reciprocalEulerPolynomial_eval
  For x≠0 in a field, P(x)x^{−natDegree Q}=Q(x⁻¹).
API [stated] TauCeti.LanglandsRegister.reciprocalEulerPolynomial_matrix
  For A in GL_n, P_A(x)=det(1−xA).
Test [stated] TauCeti.LanglandsRegister.euler_trivial
  Q=X−1 gives P=1−X.
Test [stated] TauCeti.LanglandsRegister.euler_rank_zero
  Q=1 gives P=1.
Test [stated] TauCeti.LanglandsRegister.euler_quadratic
  Q=X²−aX+q gives P=1−aX+qX² over ℚ.
Test [stated] TauCeti.LanglandsRegister.euler_wrong_argument
  At x=1/2, Q=X−1 and P=1−X have unequal values.
Source: acc-2023, §7.1, pp. 197–198, arXiv v2

## ModularityAndLanglandsExtensions:ML.0/singular-weight-hodge-list
Assigned layer: ModularityAndLanglandsExtensions:ML.0
Declaration: TauCeti.LanglandsRegister.singularWeightHodgeList
Prototype status: stated
Supplier contracts: none; concrete core above
For k∈ℕ and r∈ℤ define H(k,r)=[0,r−2,r+k−1,k+2r−3] as a list, retaining repeated entries. It has four distinct entries exactly when r≠2, k+r≠1 and k+2r≠3. This is a consumer convention check, not a construction of a de Rham representation or proof of crystallinity.
Hypothesis: Exactly the domains and hypotheses stated.
API [stated] TauCeti.LanglandsRegister.singularWeightHodgeList
  The stated list, with four positions even when values coincide.
API [stated] TauCeti.LanglandsRegister.singularWeightHodgeList_length
  Its length equals four.
API [stated] TauCeti.LanglandsRegister.singularWeightHodgeList_nodup_iff
  No repeated entries iff the three exclusions hold, for k≥0.
API [stated] TauCeti.LanglandsRegister.singularWeightHodgeList_r_two
  H(k,2)=[0,0,k+1,k+1].
Test [stated] TauCeti.LanglandsRegister.hodgeList_k2_r1
  H(2,1)=[0,−1,2,1], with no repetition.
Test [stated] TauCeti.LanglandsRegister.hodgeList_singular
  H(3,2) repeats entries.
Test [stated] TauCeti.LanglandsRegister.hodgeList_degenerate
  H(0,2)=[0,0,1,1].
Source: pilloni-2020, Remark 5.3.2, pp. 25–26, author manuscript

## ModularityAndLanglandsExtensions:ML.1/buzzard-taylor-hypotheses
Assigned layer: ModularityAndLanglandsExtensions:ML.1
Declaration: TauCeti.WeightOne.reduced_of_finitePoints
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-ARTIN
Let F be a number field, k a finite field of characteristic p, S a finite set of places not containing any v | p, and ρ̄ : G_{F,S} → GL₂(k) continuous and absolutely irreducible with universal deformation ring R. If the Galois representation of every Q̄_p-point of R has finite image and R has only finitely many Q̄_p-points, then R[1/p] is reduced. For F = ℚ and ρ̄ modular these hypotheses can often be deduced from Buzzard–Taylor and Buzzard (companion forms and analytic continuation of overconvergent weight-one forms), which is how Calegari–Geraghty's weight-one modularity results connect to the classical ones.
Hypothesis: Unramified-at-p deformation problem (S contains no place above p); ρ̄ absolutely irreducible.
Source: cg-2018, Lemma 4.14, §4.2, p. 52 (arXiv v2) = Invent. pp. 366–367; proof pp. 52–53 = Invent. pp. 367–368
Source: cg-2018, §4.2, remark after the proof of Lemma 4.14, p. 53 (arXiv v2) = Invent. p. 368

## ModularityAndLanglandsExtensions:ML.1/irregular-systems-weight-one
Assigned layer: ModularityAndLanglandsExtensions:ML.1
Declaration: TauCeti.WeightOne.weightOne_of_irregular
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-ARTIN
Let (ρ_ι) be a two-dimensional compatible system of representations of G_ℚ (E-rational, continuous, semisimple, finitely ramified ρ_ι : G_ℚ → GL₂(Q̄_ℓ) for every ℓ and ι : E ↪ Q̄_ℓ, with Weil–Deligne compatibility at q ∤ ℓ and crystalline at q | ℓ with Hodge–Tate weights (a, b) for ℓ ≫ 0) which is irregular (a = b), irreducible and odd. Then, up to twist, (ρ_ι) arises from a newform of weight one; in particular, after twisting to Hodge–Tate weights (0, 0), every ρ_ι has finite image.
Hypothesis: The compatible system in Khare–Wintenberger's sense (§5): weakly compatible, crystalline only for ℓ ≫ 0.
Source: kw-2009-I, Theorem 10.1(ii), §10.1, p. 20 (author copy results.pdf)
Source: kw-2009-I, Proof of Theorem 10.1(ii), p. 20 (author copy results.pdf)
Source: kw-2009-I, §5, p. 8 (author copy results.pdf)

## ModularityAndLanglandsExtensions:ML.1/non-solvable-residual-modularity
Assigned layer: ModularityAndLanglandsExtensions:ML.1
Declaration: TauCeti.WeightOne.mod5_nonsolvable_modular
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-ARTIN
Let E be totally real with 5 unramified, and ϱ̄:G_E→GL₂(F₅) totally odd with det ϱ̄=ε̄^{−1} and nonsolvable projective image. The residual representation is modular, by the elliptic-curve construction, solvable base change and descent used in BCGP Proposition 10.1.3. Applying Pilloni–Stroh Proposition 2.1.3 requires first twisting the determinant to ε̄ and passing to a solvable totally real extension where the projective image is PSL₂(F₅); it is not a direct application to PGL₂(F₅). Separately, Snowden Theorem 7.2.1 constructs finitely many weight-two lifts for a specified lifting problem exactly when that problem has local solutions at every designated place. It does not promise lifts of incompatible types or determinants.
Hypothesis: Residual modularity: E totally real, 5 unramified, det ϱ̄=ε̄^{−1}, total oddness and nonsolvable projective image.
Hypothesis: Lifting subclaim: Snowden assumptions (A1),(A2), an odd residual representation, a finite set Σ containing ramification and the places above 5, a finite-order ψ lifting det ϱ̄/ε̄, definite local types and inertial types, and a local weight-two lift of determinant ψε at every v∈Σ. The projective-PGL₂(F₅) exceptional case needs [E(ζ₅):E]=4. Assumption (A1) is absolute irreducibility after restriction to G_{E(ζ₅)}; (A2) is that degree-four condition in the projective-PGL₂(F₅) case.
Source: bcgp-2021, Proof of Proposition 10.1.3, p. 266 (arXiv v3)
Source: bcgp-2021, Proof of Proposition 10.1.3, p. 266 (arXiv v3)
Source: pilloni-stroh-2016, §2.1, Lemmas 2.1.1–2.1.2 and Proposition 2.1.3, pp. 9–10
Source: snowden-2009, §7.2, Theorem 7.2.1 and definition of a lifting problem, pp. 20–21; §3.1, (A1)–(A2), p. 6

## ModularityAndLanglandsExtensions:ML.2/acc-auxiliary-primes
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.acc_auxiliaryPrimes
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
In the proof of ACC+ Theorem 7.1.11 (F/F₀ Galois CM, F₀^avoid, 𝓛₀, strongly irreducible rank-2 very weakly compatible systems R_i with Hodge–Tate numbers {0, 1} and S_i ∩ 𝓛₀ = ∅, integers m_i > 0), one chooses a non-CM E/ℚ with good reduction above 𝓛₀, distinct primes l₁, l₂ and λ_i | l₂ with: (1) l₂ splits completely in each M_i; (2) the image of G_F on E[l₁] contains SL₂(F_{l₁}) and r̄_{i,λ_i}(G_F) ⊇ SL₂(F_{l₂}); (3) l₁, l₂ unramified in F; (4) E has good reduction above l₁, l₂; (5) l₁, l₂ under no prime of S_i; (6) l₁, l₂ > 2m_i + 3, together with (6′) l₁, l₂ > (m_i + 1)² and (7) r_{i,λ_i} crystalline with Hodge–Tate numbers {0, 1} above l₂ (both density-one conditions used in the rest of the proof: recorded as a source issue). Such primes exist since all conditions hold for a set of primes of density one except the first for l₂, which holds for a positive-density set.
Hypothesis: Data of ACC+ Theorem 7.1.11.
Source: acc-2023, §7.2.5, proof of Theorem 7.1.11, Assumption 7.2.6, arXiv v2 p. 208 (Annals p. 1103)

## ModularityAndLanglandsExtensions:ML.2/galois-ordinarity-from-automorphic
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.ordinary_of_iotaOrdinary
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
Let F be an imaginary CM field, ι : Q̄_p ≅ ℂ and π a cuspidal automorphic representation of GL_n(𝔸_F), regular algebraic of weight ιλ. If π is ι-ordinary at every v ∈ S_p and r̄_ι(π) is decomposed generic and irreducible, then r_ι(π)|_{G_{F_v}} is ordinary of weight λ for every v ∈ S_p: upper triangular with the diagonal characters determined by λ and the Hecke eigenvalues of the ordinary U_p-operators. Qian's Remark 4.4 uses it to recover Galois ordinarity of the automorphic Dwork realisation. The Remark 4.4 application is restricted to the irreducible, decomposed-generic residual branch of Theorem 1.4. It does not recover ordinarity for arbitrary semisimple residual input in Theorem 1.1.
Hypothesis: F imaginary CM; decomposed generic irreducible residual representation.
Source: acc-2023, ACC+ Corollary 5.5.2 from Theorem 5.5.1; Qian Remark 4.4, published p. 1274 (arXiv v1 final paragraph of §4)
Source: qian-thesis-2023, Remark 4.0.4, Ch. 4, p. 65 (thesis, PDF p. 72); ≈ published Remark 4.4, Invent. p. 1274

## ModularityAndLanglandsExtensions:ML.2/moret-bailly-galois-control
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.exists_point_galois_control
Prototype status: omitted
Supplier contracts: C-MODULI
Let K^{(avoid)}/K/K₀ be number fields with K^{(avoid)}/K and K/K₀ Galois, S a finite set of places of K₀, and for v ∈ S_K a finite Galois L′_v/K_v with L′_{σv} = σL′_v. Let T/K be smooth and geometrically connected with non-empty Gal(L′_v/K_v)-invariant open Ω_v ⊆ T(L′_v). Then there are a finite Galois L/K and P ∈ T(L) with L/K₀ Galois, L linearly disjoint from K^{(avoid)} over K, and L_w ≅ L′_v with P ∈ Ω_v for w | v ∈ S_K.
Hypothesis: Places and extensions as stated.
Source: blggt-2014-v4, §3.1, Proposition 3.1.1, p. 41 (arXiv v4)

## ModularityAndLanglandsExtensions:ML.2/p-r-switch
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.prSwitch
Prototype status: omitted
Supplier contracts: C-SYSTEM, C-LOCAL-DEFORMATION
BCGNT Proposition 6.2.3 is a sufficient-condition theorem: with the auxiliary systems and all conditions (1)–(17) below, Sym^{n−1}R is weakly automorphic of level prime to X₀. It does not assert an iff between residual automorphy at p and r of a single CM-tensored system.
Hypothesis: F imaginary CM, m≥2, n≥1, X₀ a finite set of finite places; R=(M,S,{Q_v},{r_λ},{H_τ}) very weakly compatible of rank 2. (1) H_τ={0,m}. (2) det r_λ=ε^{−m}. (3) R strongly irreducible. (4) X₀∩S=∅. (5) F/ℚ Galois containing an imaginary quadratic F₀. Fix M↪ℂ.
Hypothesis: (6) E/ℚ cyclic totally real of degree m, disjoint from F; L=EF and Ψ:𝔸_L^×→M^×. Choose τ₀:F₀↪ℂ and τ₁,…,τ_m:EF₀↪ℂ extending τ₀, with Ψ(α)=∏_{i=1}^m τ_i(N_{L/EF₀}α)^{m−i}cτ_i(N_{L/EF₀}α)^{i−1} on L^×. R_CM=Ind_{G_L}^{G_F}Ψ has H_CM,τ={0,…,m−1} and det r_CM,λ=ε^{−m(m−1)/2}. Its bad set is the places ramified in L or above ramification of Ψ.
Hypothesis: (7) Distinct primes p,r not dividing places of S and chosen coefficient places above them. (8) A weakly compatible rank-m R_aux, pure of weight m−1, bad set avoiding X₀∪{v|pr}, det=ε^{−m(m−1)/2}, HT={0,…,m−1}.
Hypothesis: (9) A weakly compatible rank-nm S_UA, pure of weight nm−1, bad set avoiding X₀∪{v|pr}, det=ε^{−nm(nm−1)/2}, HT={0,…,nm−1}, weakly automorphic of level prime to X₀∪{v|pr}. Put S_aux=Sym^{n−1}R⊗R_aux and S_CM=Sym^{n−1}R⊗R_CM.
Hypothesis: (10) L/F and Ψ unramified above X₀∪{v|pr}. (11) p>2nm+1 and [F(ζ_p):F]=p−1. (12) r>2nm+1, r splits completely in EF₀, [L(ζ_r):L]=r−1.
Hypothesis: (13) Up to conjugacy SL₂(F_p)≤r̄_p(G_F)≤GL₂(F_p), likewise at r. For m>2, r̄_aux,p has image GU_m(F_{p²}) and multiplier ε^{1−m}; for m=2 its image is GL₂(F_p). r̄_CM,r restricted to G_{F(ζ_r)} is irreducible. For m=2 the projective extensions cut out by r̄_p and r̄_aux,p over F(ζ_p) are disjoint.
Hypothesis: (14) s̄_UA,p≅s̄_aux,p and r̄_aux,r≅r̄_CM,r. (15) The p-adic places split as Σ_ord⊔Σ_ss; each F_v contains ℚ_{p²}, r̄_p|G_{F_v} and ρ̄_{2,m,0}|G_{F_v} are trivial. On Σ_ord, r_p is crystalline ordinary; on Σ_ss, r_p connects to ρ_{2,m,0}.
Hypothesis: (16) On Σ_ord, r̄_aux,p is trivial and r_aux,p,s_UA,p crystalline ordinary. On Σ_ss, r̄_aux,p is trivial, r_aux,p,s_UA,p crystalline, and they connect to ρ_{m,1,0},ρ_{nm,1,0} respectively. (17) At every v|r, r̄_aux,r≅r̄_CM,r is trivial and r_aux,r is crystalline ordinary. The connects relation and ρ_{a,b,c} are BCGNT Definitions 5.1.1 and the local deformation component relation, not unnamed propositions.
Source: bcgnt-2025, Proposition 6.2.3 and proof, §6.2, arXiv v3 pp. 61–63 (published pp. 54–57; arXiv pagination differs) — independently checked downloaded PDF p.62; published-copy pagination where applicable

## ModularityAndLanglandsExtensions:ML.2/patrikis-taylor-potential-automorphy
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.patrikisTaylor
Prototype status: omitted
Supplier contracts: C-SYSTEM
Let R be a weakly compatible system over ℚ, pure, regular and odd essentially self-dual, with its symplectic totally odd or orthogonal totally even multiplier itself a weakly compatible rank-one system. After enlarging the coefficient field, R decomposes as a direct sum of weakly compatible systems R_j, and over one finite Galois totally real extension each R_j is the compatible system of a regular algebraic cuspidal polarized automorphic representation. Thus R becomes isobarically automorphic. No irreducibility assumption is imposed; the sum need not be cuspidal. This is the ℚ-specialization of Patrikis–Taylor Theorem A and Theorem 2.1.
Hypothesis: Weak compatibility, purity, regularity, the stated pairing parity and a compatible multiplier. For the extension/avoidance version of Theorem 2.1, use its finite Galois CM F/F₀ and F^avoid/F data.
Source: fsy-2022, §5.3.2, Theorem 5.38 (Patrikis–Taylor, [44, Th. A]), arXiv v5 pp. 56–57
Source: patrikis-taylor-2015, Theorem A, p. 2; Theorem 2.1 and proof, pp. 12–13

## ModularityAndLanglandsExtensions:ML.2/potential-ordinary-automorphy
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.potential_ordinary_automorphy
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
Let F/F₀ be finite Galois of imaginary CM fields, I finite, and for i ∈ I: l_i odd with ζ_{l_i} ∉ F; µ_i totally odd de Rham (HT {w_i}); r̄_i : G_F → GL_{n_i}(F̄_{l_i}) irreducible with (r̄_i, µ̄_i) totally odd polarized, r̄_i|_{G_{F(ζ_{l_i})}} irreducible and l_i ≥ 2(d_i + 1); sets H_{i,τ} of n_i distinct integers with H_{i,τ∘c} = {w_i − h}; a finite Galois-stable S ⊇ primes above l_i and ramification; lifts ρ_{i,v} (v ∤ l_i) with ρ^c_{i,cv} ≅ µ_iρ^∨_{i,v}; and F^{(avoid)}. Then there are F′/F finite CM, Galois over F₀ and linearly disjoint from F^{(avoid)}, and regular algebraic cuspidal polarized (π_i, χ_i) over F′ with r̄_{l_i,ı_i}(π_i) ≅ r̄_i|_{G_{F′}}, r_{l_i,ı_i}(χ_i)ε^{1−n_i} = µ_i|_{G_{F′⁺}}, π_i unramified above l_i and outside S, ı_i-ordinary, HT_τ(r_{l_i,ı_i}(π_i)) = H_{i,τ|_F}, and r_{l_i,ı_i}(π_i)|_{G_{F′_u}} ∼ ρ_{i,v}|_{G_{F′_u}} for u | v ∈ S, u ∤ l_i.
Hypothesis: F/F₀ finite Galois of imaginary CM fields; n_i≥1; d_i is the largest dimension of an irreducible subrepresentation of r̄_i on the subgroup generated by all Sylow pro-l_i subgroups. All other data and hypotheses are those displayed in the statement, including the fixed ι_i for each i.
Source: blggt-2014-v4, §3.3, Proposition 3.3.1, pp. 47–48 (arXiv v4)

## ModularityAndLanglandsExtensions:ML.2/qian-auxiliary-prime
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.qian_auxiliaryPrime
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
Use Qian’s Theorem 1.1 data F, F^av, n≥2, l and the continuous semisimple residual representation r̄:G_F→GL_n(F_{l^s}). Fix a non-CM elliptic curve E₀/ℚ and write n=l^a m with l∤m. Let k′⊂F̄_l be generated by the m-th roots of all elements of F_{l^s}. Choose an odd N>100n+100 divisible by none of the prime factors of ln, none of the primes ramified in F^av or the residual fixed field, and none of the bad primes of E₀. Require F_{l²}k′⊂F_l(ζ_N); for n=2 require that field to have even degree d over F_l and F_{l²}k′ to lie in the residue field of ℚ(ζ_N)^+. If F_l(ζ_N)=F_{l^d} with d even, require N∤l^(d/2)+1. Let F^avoid be the ℚ-normal closure of F^av F̄^{ker r̄}(ζ_l). Then ℚ(ζ_N) and F^avoid are linearly disjoint over ℚ. There is a rational prime l′≡1 mod Nn with l′>2ln+5, unramified in F^avoid, for which E₀ has good ordinary reduction, r̄_{E₀,l′}(G_{F̃})=GL₂(F_{l′}) with F̃ the normal closure of F, and some σ∈G_F−G_{F(ζ_l′)} has scalar image. The congruence mod n and unramifiedness in F^avoid are the confirmed E7/E36 corrections.
Hypothesis: Theorem 1.1 data as displayed; the finite field k′ is distinct from every number-field extension denoted F′. The elliptic residual realization is cohomological H¹ in the pinned convention.
Source: qian-2023, Proposition 4.1 (first list), §4, p. 21, and first paragraph of its proof, p. 22 (arXiv v1); §4 opening (choice of E, N, F^avoid), p. 21; Invent. pp. 1268–1269 per routed locators

## ModularityAndLanglandsExtensions:ML.2/steinberg-ordinarity-lemma
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.steinbergOrdinary
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
At a place v|l of the chosen Dwork point require v(t)<0. Suppose V_{λ,t}^{ss}≅r_{l,ι}(π) for a regular algebraic cuspidal π and that the auxiliary-prime V_{λ′,t} is semisimple. The latter holds in the construction because its residual twist is an absolutely irreducible elliptic symmetric power. Match the coefficient embeddings. The monodromy of V_{λ′,t} at v is a single unipotent Jordan block of size n. Varma’s bound for its actual automorphic realization then forces π_v to be an unramified twist of Steinberg. The Hodge weights at τ are M(a_τ),…,M(a_τ)+n−1, so the constant automorphic weight is +λ_τ with λ_τ=M(a_τ). The central-character slope is +nλ_τ, and its j-th partial slope is +jλ_τ, giving ι-ordinarity by Geraghty. This proves ordinary automorphy of V_{λ,t}^{ss}; it does not assert semisimplicity of the original l-adic fibre.
Hypothesis: v(t)<0 at each relevant l-adic place; λ′ lies over an odd prime different from l and prime to N; V_{λ′,t} is semisimple; matched coefficient embeddings and the displayed semisimplified automorphic realization.
Source: qian-thesis-2023, Lemma 4.0.3 and its proof, Ch. 4, pp. 64–65 (thesis, PDF pp. 71–72); ≈ published Lemma 4.3, Invent. p. 1273
Source: qian-2023, Lemma 3.10(4) and its proof, pp. 20–21 (arXiv v1); the published Lemma 4.3 (Invent. p. 1273) is NOT in arXiv v1

## ModularityAndLanglandsExtensions:ML.2/twisted-modular-curve
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.TwistedModularCurve
Prototype status: omitted
Supplier contracts: C-MODULI
Let K be a number field, E/K an elliptic curve and q ≥ 3 a prime. X_E(q) is the smooth projective curve over K (the compactification of the fine moduli space Y_E(q) for q ≥ 3) parametrising pairs (A, φ) of an elliptic curve A with a symplectic isomorphism φ : A[q] ≅ E[q] (compatible with the Weil pairings); it is a twist of the modular curve X(q) by the Galois action on E[q], geometrically connected, and of genus 0 for q ≤ 5. Calegari–Geraghty only say that the auxiliary curve 'follows easily from Prop. 6.2 of [BLGHT11], now applied to twists of a modular curve'.
Hypothesis: q ≥ 3 prime (fine moduli); K a number field.
API [omitted] TauCeti.PotentialAutomorphy.TwistedModularCurve
  The curve X_E(q) over K.
API [omitted] TauCeti.PotentialAutomorphy.TwistedModularCurve.moduli
  For L/K, the non-cuspidal L-points of X_E(q) are the pairs (A/L, φ : A[q] ≅ E[q] symplectic) up to isomorphism (q ≥ 3).
API [omitted] TauCeti.PotentialAutomorphy.TwistedModularCurve.geometricallyConnected
  X_E(q) is geometrically connected.
API [omitted] TauCeti.PotentialAutomorphy.TwistedModularCurve.baseChange
  X_E(q) ×_K L = X_{E_L}(q).
API [omitted] TauCeti.PotentialAutomorphy.TwistedModularCurve.point_E
  (E, id) is a K-point.
Test [omitted] TauCeti.PotentialAutomorphy.TwistedModularCurve.genus_q3
  q = 3: X_E(3) has genus 0 (X(3) does), and it has the K-point (E, id), so X_E(3) ≅ ℙ¹_K.
Test [omitted] TauCeti.PotentialAutomorphy.TwistedModularCurve.trivial_twist
  If the Galois action on E[q] is trivial (E[q] ⊂ E(K) and μ_q ⊂ K), X_E(q) ≅ X(q)_K.
Test [omitted] TauCeti.PotentialAutomorphy.TwistedModularCurve.not_X0
  X_E(q) is not X₀(q) as a moduli problem: a point carries a full level-q structure identified with E[q], not a cyclic subgroup; already at q=7 the curves differ (genus of X(7) is 3, of X₀(7) is 0), while for q = 3, 5 both are ℙ¹_K.
Source: cg-2018, §10, general case, p. 97 (arXiv v2) = Invent. p. 429

## ModularityAndLanglandsExtensions:ML.3/accessible-regular-refinement
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.IsAccessibleRefinement
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
For a definite unitary group G_n over F⁺ and an automorphic π of G_n(𝔸_{F⁺}) with p-adic places S_p, an accessible refinement is a choice χ = (χ_v)_{v∈S_p} of smooth characters χ_v : T_n(F_ṽ) → Q̄_p^× occurring as subquotients of the normalised Jacquet module ι^{−1}r_{N_n}(π_v), equivalently with π_v ↪ i^{GL_n}_{B_n}ιχ_v. For n = 2 it is n-regular if (χ_{v,1}/χ_{v,2})^i ≠ 1 for 1 ≤ i ≤ n − 1 and every v ∈ S_p. For π on GL₂(𝔸_ℚ), π_l has an accessible refinement iff its Jacquet module is nonzero, iff π_l is not supercuspidal.
Hypothesis: G_n the definite unitary group of NT §1; T_n ⊂ B_n ⊂ GL_n diagonal torus and upper Borel.
API [omitted] TauCeti.SymmetricPower.IsAccessibleRefinement
  χ_v a subquotient of the normalised Jacquet module at each v ∈ S_p.
API [omitted] TauCeti.SymmetricPower.IsNRegular
  (χ_{v,1}/χ_{v,2})^i ≠ 1 for 1 ≤ i ≤ n − 1.
API [omitted] TauCeti.SymmetricPower.isAccessible_iff_not_supercuspidal
  An accessible refinement exists iff π_l is not supercuspidal.
API [omitted] TauCeti.SymmetricPower.isNRegular_mono
  n-regular ⇒ m-regular for m ≤ n.
Test [omitted] TauCeti.SymmetricPower.unramified_refinement
  π_l unramified with Satake parameters {α, β}: the two refinements are (α, β) and (β, α); n-regular iff (α/β)^i ≠ 1 for i < n.
Test [omitted] TauCeti.SymmetricPower.steinberg_refinement
  π_l a twist of Steinberg has exactly one accessible refinement.
Test [omitted] TauCeti.SymmetricPower.supercuspidal_none
  π_l supercuspidal has no accessible refinement (the hypothesis of NT I Theorem B).
Test [omitted] TauCeti.SymmetricPower.not_regular_example
  α/β = −1 is 2-regular but not 3-regular: (α/β)² = 1.
Import owner: LocalGlobalCompatibilityPartIIEigenvarietyCompanions
Source: newton-thorne-I, §2, p. 34, and Definition 2.23, p. 40 (arXiv v3)

## ModularityAndLanglandsExtensions:ML.3/buzzard-kilford-eigencurve
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.buzzardKilford
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
For p = 2 and N = 1, E₀ lies over the component W₀⁺ (χ(−1) = 1) of weight space, and w = χ_u(5) − 1 identifies W₀⁺ with {|w| < 1}. Over the annulus W₀(b) = {|8| < |w| < 1}, E₀(b) = κ^{−1}(W₀(b)) is a disjoint union ⊔_{i≥1}X_i of admissible opens with κ|_{X_i} an isomorphism onto W₀(b), and on X_i the slope is i·v₂(w).
Hypothesis: p = 2, tame level 1.
Import owner: SymmetricPowersByAnalyticContinuation
Source: newton-thorne-I, §3, Theorem 3.2, pp. 53–54 (arXiv v3)

## ModularityAndLanglandsExtensions:ML.3/eigenvariety-propagation
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.automorphic_of_same_component
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Let (π₀, χ₀), (π′₀, χ′₀) be refined points of the eigencurve E₀ (tame level N, prime p) with corresponding points z₀, z′₀. Suppose either (1) χ₀ is numerically non-critical and n-regular, (2) χ′₀ is n-regular, (3) the Zariski closures of r_{π₀,ι}(G_{ℚ_p}) and r_{π′₀,ι}(G_{ℚ_p}) contain SL₂, (4) Sym^{n−1}r_{π₀,ι} is automorphic; or (1ord) χ₀ is ordinary, (2ord) π₀, π′₀ are not CM, (3ord) Sym^{n−1}r_{π₀,ι} is automorphic. If z₀, z′₀ lie on a common irreducible component of E_{0,ℂ_p}, then Sym^{n−1}r_{π′₀,ι} is automorphic.
Hypothesis: π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.
Hypothesis: E₀ the Coleman–Mazur eigencurve and E_n the eigenvariety of a definite unitary group in n variables (PadicFamilies L2).
Import owner: SymmetricPowersByAnalyticContinuation
Source: newton-thorne-I, §2, Theorem 2.33, pp. 50–51 (arXiv v3)

## ModularityAndLanglandsExtensions:ML.3/l-function-equidistribution-criterion
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.equidistributed_of_lFunctions
Prototype status: omitted
Supplier contracts: C-EQUIDISTRIBUTION
Let K be a compact group with conjugacy-class space X, x_i ∈ X with norms N(x_i) ≥ 2, such that ∏(1 − N(x_i)^{−s})^{−1} converges for Re s > 1 and continues to a neighbourhood of Re s ≥ 1 with no zeros or poles except a simple pole at 1, and for each irreducible ρ, L(s, ρ) = ∏ det(1 − ρ(x_i)N(x_i)^{−s})^{−1} continues likewise with no zeros or poles on Re s ≥ 1 except possibly at 1. Then #{i : N(x_i) ≤ n} ~ n/log n, Σ_{N(x_i)≤n}χ(x_i) = c(χ)n/log n + o(n/log n) with −c(χ) the order of vanishing of L(s, ρ) at 1; if at most boundedly many x_i share a norm, the x_i are Haar-equidistributed iff c(χ) = 0 for every nontrivial irreducible χ (Peter–Weyl/Weyl criterion).
Hypothesis: K a compact group (a compact Lie group in the application); ρ irreducible continuous representations.
Source: kedlaya-ant-2025, §§24.1–24.3, Theorem 24.1, Theorem 24.2 and Conjecture 24.3, printed pp. 133–134

## ModularityAndLanglandsExtensions:ML.3/level-one-ping-pong
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.symPower_levelOne_propagate
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Fix n ≥ 2. If π₀ is an everywhere unramified cuspidal π of weight k ≥ 2 with Sym^{n−1}r_{π₀,ι} automorphic for some (equivalently any) p and ι, then Sym^{n−1}r_{π,ι} is automorphic for every everywhere unramified cuspidal π of weight ≥ 2.
Hypothesis: π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.
Import owner: SymmetricPowersByAnalyticContinuation
Source: newton-thorne-I, §3, Theorem 3.1, p. 53; Introduction pp. 3–4 (arXiv v3)

## ModularityAndLanglandsExtensions:ML.3/n-regular-congruences
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.exists_nRegular_congruence
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Let π be non-CM of weight k ≥ 2 with π_l non-supercuspidal for every l. Then there are a prime p > max(2(n + 1), (n − 1)k), ι, and π′ of weight k with r̄_{π,ι}(G_ℚ) ⊇ a conjugate of SL₂(F_p), π_p and π′_p unramified, r̄_{π,ι} ≅ r̄_{π′,ι}, and π′_l non-supercuspidal with all accessible refinements n-regular wherever π′_l is ramified.
Hypothesis: π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.
Import owner: SymmetricPowersByUnitaryLevelRaising
Source: newton-thorne-I, §8, Proposition 8.3, pp. 92–93 (arXiv v3)

## ModularityAndLanglandsExtensions:ML.3/one-level-one-symmetric-power
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.exists_levelOne_symPower
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
For every n ≥ 3 there is a cuspidal, everywhere unramified π of GL₂(𝔸_ℚ) of weight k ≥ 2 such that Sym^{n−1}r_{π,ι} is automorphic for every ι.
Hypothesis: π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.
Import owner: SymmetricPowersByUnitaryLevelRaising
Source: newton-thorne-I, §7, Theorem 7.6, p. 89; Introduction p. 4 (arXiv v3)

## ModularityAndLanglandsExtensions:ML.3/parallel-weight-and-clozel-purity
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.IsParallelWeight
Prototype status: partial
Supplier contracts: C-COHERENT-GEOMETRY, C-AUTOMORPHIC
Let F be a number field and π a regular algebraic representation of GL₂(𝔸_F) of weight λ = (λ_{τ,1} ≥ λ_{τ,2})_τ. π has parallel weight if λ_{τ,1} − λ_{τ,2} is independent of τ, equivalently if π has a regular algebraic twist of weight (m − 1, 0)_τ for some m ≥ 1; it has parallel weight k ≥ 2 if that twist has weight (k − 2, 0)_τ. Clozel's purity lemma: for F imaginary CM and π cuspidal regular algebraic on GL₂(𝔸_F), λ_{τ,1} + λ_{τc,2} = w is independent of τ, so π is of parallel weight when F is imaginary quadratic (BCGNT §1.6).
Hypothesis: F a number field (CM for the purity lemma); π regular algebraic.
API [stated] TauCeti.SymmetricPower.IsParallelWeight
  For an actual weight function λ:Hom(F,ℂ)→ℤ², the difference λ_{τ,1}−λ_{τ,2} is independent of τ. The Lean form is over any embedding-index type; attachment to π is supplied by AF.4.
API [stated] TauCeti.SymmetricPower.parallelWeight
  At an embedding τ define k=λ_{τ,1}−λ_{τ,2}+2. For dominant weights k≥2; under IsParallelWeight it is independent of the chosen embedding.
API [stated] TauCeti.SymmetricPower.IsParallelWeight.twist
  Adding the same algebraic character weight a_τ to both coordinates at τ preserves the weight-difference predicate, in both directions.
API [omitted] TauCeti.SymmetricPower.clozel_purity
  F imaginary CM, π cuspidal regular algebraic on GL₂: λ_{τ,1} + λ_{τc,2} is independent of τ.
API [omitted] TauCeti.SymmetricPower.isParallelWeight_of_imagQuadratic
  F imaginary quadratic ⇒ every cuspidal regular algebraic π on GL₂ has parallel weight.
API [stated] TauCeti.SymmetricPower.parallelWeight_independent
  If the actual weight function is parallel, k computed at τ equals k computed at σ.
Test [stated] TauCeti.SymmetricPower.parallelWeight_Q
  On the one-element embedding-index type, every weight function has constant difference.
Test [stated] TauCeti.SymmetricPower.parallelWeight_two
  The weight function (0,0) on two embeddings is parallel and has k=2. The elliptic-curve comparison requires its actual attached weight, not a supplied equality assumption.
Test [stated] TauCeti.SymmetricPower.nonParallel_hilbert
  On two embeddings, weights (0,0) and (2,0), corresponding to Hilbert weights (2,4), fail the parallel predicate.
Source: bcgnt-2025, Definition 1.6.1 (Parallel Weight) and the following paragraph, §1.6 Notation, arXiv v3 p. 13 (= Definition 1.5.1, §1.5, published p. 11: arXiv numbering and pagination differ)

## ModularityAndLanglandsExtensions:ML.3/projective-image-sandwich
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.ProjectiveImageSandwich
Prototype status: stated
Supplier contracts: none; concrete core above
Let G be a group, k a finite field embedded by ι into a field K, and ρ:G→GL₂(K). ProjectiveImageSandwich(p,a,n,ι,ρ) means: p prime, a≥1, n≥1, #k=p^a>max(5,2n−1), and for one c∈PGL₂(K), the conjugate by c of the range of Pρ contains the embedded PSL₂(k) and is contained in the embedded PGL₂(k). Both embeddings use ι. Specialization to K=F̄_p gives exactly the residual-image hypothesis of NT II Theorem 2.1. The definition does not assert automorphy lifting or require p>n.
Hypothesis: Exactly the domains and hypotheses stated.
API [stated] TauCeti.SymmetricPower.ProjectiveImageSandwich
  The explicit conjunction and two subgroup inclusions.
API [stated] TauCeti.SymmetricPower.ProjectiveImageSandwich.bound
  The hypothesis gives p^a>max(5,2n−1).
API [stated] TauCeti.SymmetricPower.ProjectiveImageSandwich.mono
  For 1≤m≤n the same data satisfy the rank-m bound.
API [stated] TauCeti.SymmetricPower.ProjectiveImageSandwich.conjugation
  Conjugating the actual GL₂ representation preserves the condition.
Test [stated] TauCeti.SymmetricPower.projectiveImage_F7_n3
  The identity representation of GL₂(F₇) satisfies the condition with p=7,a=1,n=3.
Test [stated] TauCeti.SymmetricPower.projectiveImage_F5_excluded
  Over F₅ the strict bound fails for every representation when a=1.
Test [stated] TauCeti.SymmetricPower.projectiveImage_a0_excluded
  No data satisfy the condition with a=0.
Test [stated] TauCeti.SymmetricPower.projectiveImage_small_characteristic_bound
  p=2,a=3,n=4 passes the cardinality bound since 8>7, although p≤n. This tests the bound only, not an unspecified representation.
Source: newton-thorne-II, Theorem 2.1, pp. 5–6, arXiv v2

## ModularityAndLanglandsExtensions:ML.3/purity-from-symmetric-powers
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.purity_of_symPowers
Prototype status: omitted
Supplier contracts: C-SYSTEM
Let R be a very weakly compatible system of rank 2 of G_F with H_τ = {0, m} for all τ, and v₀ ∉ S a finite place. If for infinitely many n ≥ 1 there is a finite Galois F_n/F such that Sym^{n−1}R|_{F_n} is weakly automorphic of level prime to the places above v₀, then the roots α₁, α₂ of Q_{v₀}(X) satisfy |ια_i|² = q_{v₀}^m for every ι.
Hypothesis: As stated.
Source: bcgnt-2025, Lemma 6.1.3 and proof (Jacquet–Shalika bound [JS81, Cor. 2.5]), §6.1, arXiv v3 p. 58 (published p. 52; arXiv pagination differs)

## ModularityAndLanglandsExtensions:ML.3/steinberg-level-raising
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.exists_steinberg_levelRaising
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Let n ≥ 3, p ≡ 1 (mod 48·n!), q ≠ p, X₀ a finite set of places of K prime to 2pq and ω a de Rham character with ωω^c = ε³, unramified on X₀. Then there is a soluble CM F/K, X₀-split, and a RACSDC ι-ordinary Π on GL_n(𝔸_F) with r_{Π,ι} ≅ ω^{n−1}|_{G_F} ⊗ Sym^{n−1}r_{σ₀,ι}|_{G_F}, the same Hodge–Tate numbers, and Π_v an unramified twist of Steinberg at some v | q (Theorem 7.1; proved here for n odd, Proposition 7.4; for n even via Anastassiades–Thorne).
Hypothesis: σ₀ a theta series congruent to the chosen level-one form (NT I §7); K an imaginary quadratic field.
Import owner: SymmetricPowersByUnitaryLevelRaising
Source: newton-thorne-I, §7, Theorem 7.1, p. 82; §4 Theorem 4.1, p. 59; §6 Theorem 6.1, p. 75 (arXiv v3)

## ModularityAndLanglandsExtensions:ML.4/gan-takeda-llc-gsp4
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.recGT
Prototype status: omitted
Supplier contracts: C-ARTHUR, C-AUTOMORPHIC
Let K be a non-archimedean local field of characteristic 0. There is a surjective finite-to-one map rec_GT : π ↦ φ_π from irreducible smooth complex representations of GSp₄(K) to GSp₄(ℂ)-conjugacy classes of L-parameters WD_K → GSp₄(ℂ) such that: (i) π is essentially discrete series iff φ_π does not factor through a proper Levi subgroup; (ii) the fibre (L-packet) L_φ is parametrised by the characters of A_φ = π₀(Z(Im φ)/Z_{GSp₄}), which is trivial or ℤ/2ℤ, and when A_φ = ℤ/2ℤ exactly one member, the one indexed by the trivial character, is generic; (iii) the similitude character of φ_π is ω_π; (iv) φ_{π ⊗ (χ ∘ ν)} = φ_π ⊗ χ; (v) for π generic or non-supercuspidal and every irreducible σ of GL_r(K), the γ-, L- and ε-factors of π × σ (Shahidi) equal those of φ_π ⊗ φ_σ; (vi) the analogous identity of Plancherel measures for non-generic supercuspidal π; (vii) L_φ contains a generic representation iff the adjoint L-factor L(s, ad ∘ φ) is holomorphic at s = 1; (viii) the map is uniquely determined by (i), (iii), (v) and (vi) with r ≤ 2. BCGP normalise it so that rec_GT(π ⊗ (χ ∘ ν)) = rec_GT(π) ⊗ rec(χ) and ν ∘ rec_GT(π) = rec(ω_π), and the Roberts–Schmidt parameters of constituents of unramified principal series agree with it (Gan–Takeda 2011b, Proposition 13.1).
Hypothesis: K non-archimedean of characteristic 0 (BCGP use K/ℚ_l finite); complex coefficients (BCGP transport to Q̄_p through ı, ML.0/gsp4-galois-l-packet).
Source: bcgp-2021, §2.3, p. 18 (arXiv v3)
Source: bcgp-2021, Proof of Proposition 2.4.22, §2.4.21, p. 25 (arXiv v3)
Source: gan-takeda-2011, Main Theorem, parts (i)–(vii), pp. 1842–1843; discussion following it, p. 1843

## ModularityAndLanglandsExtensions:ML.4/orthogonal-sign-kernel
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.orthogonalSignKernel
Prototype status: stated
Supplier contracts: none; concrete core above
For a finite index set I and dimensions d_i∈ℕ define the additive subgroup of (ℤ/2)^I by Σ_i(d_i mod 2)s_i=0. Under s_i↦(−1)^{s_i} this is ∏_i sign_i^{d_i}=1, the determinant-one constraint on orthogonal summands. It is the pre-central-quotient sign group, not the whole Arthur component group. A single odd-dimensional summand gives the trivial group; all even dimensions impose no condition.
Hypothesis: Exactly the domains and hypotheses stated.
API [stated] TauCeti.Arthur.orthogonalSignKernel
  The actual additive subgroup cut out by the weighted mod-two sum.
API [stated] TauCeti.Arthur.orthogonalSignKernel_mem_iff
  Membership is exactly the weighted sum being zero.
API [stated] TauCeti.Arthur.orthogonalSignKernel_even
  If every d_i is even the subgroup is the full function group.
API [stated] TauCeti.Arthur.orthogonalSignKernel_one_odd
  For I a singleton and d odd the subgroup is zero.
Test [stated] TauCeti.Arthur.signKernel_rank_three
  For one dimension-three summand the kernel is zero.
Test [stated] TauCeti.Arthur.signKernel_empty
  The empty index set has the full (already trivial) sign group.
Test [stated] TauCeti.Arthur.signKernel_two_odd
  For two odd-dimensional summands membership is s₀=s₁.
Source: arthur-2013, §1.4, (1.4.4), pp. 30–31, 2011 manuscript

## ModularityAndLanglandsExtensions:ML.4/self-dual-cuspidal-type
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.IsSymplecticType
Prototype status: omitted
Supplier contracts: C-AUTOMORPHIC
Let π be a unitary cuspidal automorphic representation of GL_N(𝔸_F) with π ≅ π^∨, and S a finite set of places containing the archimedean places and those where π ramifies. π is of symplectic type if the partial exterior-square L-function L^S(s, π, ∧²) has a pole at s = 1, and of orthogonal type if L^S(s, π, Sym²) has a pole at s = 1. Exactly one of the two holds: L^S(s, π × π) = L^S(s, π, Sym²)·L^S(s, π, ∧²) has a simple pole at s = 1 because π ≅ π^∨, and neither factor vanishes at s = 1. Symplectic type forces N even and ω_π = 1. Arthur's Theorem 1.5.3 identifies the type with the dual group from which π is a twisted-endoscopic transfer: symplectic type exactly when π comes from a generic parameter of split SO_{N+1} (Ĝ = Sp_N(ℂ)), orthogonal type exactly when π comes from Sp_{N−1} (N odd) or from the quasi-split SO_N attached to ω_π (N even).
Hypothesis: F a number field; π a unitary cuspidal automorphic representation of GL_N(𝔸_F) with π ≅ π^∨.
Hypothesis: The type does not depend on S: the local factors at finitely many places are holomorphic and non-zero at s = 1.
API [omitted] TauCeti.Arthur.IsSymplecticType
  π is of symplectic type: L^S(s, π, ∧²) has a pole at s = 1.
API [omitted] TauCeti.Arthur.IsOrthogonalType
  π is of orthogonal type: L^S(s, π, Sym²) has a pole at s = 1.
API [omitted] TauCeti.Arthur.selfDual_type_dichotomy
  For π ≅ π^∨ cuspidal unitary: exactly one of IsSymplecticType π and IsOrthogonalType π holds.
API [omitted] TauCeti.Arthur.IsSymplecticType.even
  IsSymplecticType π implies N is even.
API [omitted] TauCeti.Arthur.IsSymplecticType.centralCharacter_eq_one
  IsSymplecticType π implies ω_π = 1.
API [omitted] TauCeti.Arthur.IsSymplecticType.independent_of_S
  The pole at s = 1 does not depend on the finite set S.
API [omitted] TauCeti.Arthur.selfDualType_iff_transfer
  Arthur Theorem 1.5.3: IsSymplecticType π iff π is the transfer of a simple generic parameter of split SO_{N+1}.
Test [omitted] TauCeti.Arthur.quadraticCharacter_orthogonal
  N = 1: a Hecke character χ with χ² = 1 is of orthogonal type (L^S(s, χ²) = ζ_F^S(s) has a pole; ∧² of a line is 0).
Test [omitted] TauCeti.Arthur.gl2_trivialCentral_symplectic
  N = 2: a cuspidal π with ω_π = 1 is of symplectic type, since ∧²π = ω_π and L^S(s, ω_π) = ζ_F^S(s).
Test [omitted] TauCeti.Arthur.ellipticCurve_symplectic
  The unitary cuspidal π_E of GL₂(𝔸_ℚ) attached to an elliptic curve E/ℚ (with or without CM) is of symplectic type.
Test [omitted] TauCeti.Arthur.cubicCharacter_noType
  A Hecke character χ of order 3 is not self-dual, and neither L^S(s, χ²) nor L^S(s, ∧²χ) = 1 has a pole.
Source: arthur-2013, §1.5, Theorem 1.5.3 and the paragraph before it, pp. 47–48 (2011 manuscript)

## ModularityAndLanglandsExtensions:ML.5/cyclic-base-change-gln
Assigned layer: ModularityAndLanglandsExtensions:ML.5
Declaration: TauCeti.Functoriality.solubleBaseChange
Prototype status: omitted
Supplier contracts: C-AUTOMORPHIC, C-GALOIS
(Arthur–Clozel) Let L/F be a cyclic extension of number fields of prime degree and π a cuspidal automorphic representation of GL_n(𝔸_F). There is an isobaric automorphic representation BC_{L/F}(π) of GL_n(𝔸_L) with rec(BC_{L/F}(π)_w) ≅ rec(π_v)|_{W_{L_w}} for every place w | v; it is cuspidal unless π ≅ π ⊗ η for a non-trivial character η of 𝔸_F^×/F^×N_{L/F}𝔸_L^×; and a cuspidal Π of GL_n(𝔸_L) with Π ≅ Π^σ for Gal(L/F) = ⟨σ⟩ is a base change. Iterating along a soluble Galois tower L/F: for π regular algebraic cuspidal with BC_{L/F}(π) cuspidal, BC_{L/F}(π) is regular algebraic; and (soluble descent) if r : G_F → GL_n(Q̄_p) is irreducible, r|_{G_L} is irreducible and automorphic for a soluble Galois L/F, then r is automorphic. For n = 2 the owner is GL2AutomorphicRepresentationsAndTransfer R17.4.
Hypothesis: L/F soluble Galois (cyclic of prime degree at each step) of number fields.
Hypothesis: The Galois automorphy-descent clause uses the CM/totally-real polarized setting and irreducibility of the restriction in PL.0/soluble-descent; it is not a theorem for arbitrary G_F with the restricted NT automorphy predicate.
Source: nt-2026, §1.2, p. 8 (arXiv:2212.03595v2)
Source: nt-2026, §3, end of proof of Theorem 3.2, p. 25 (arXiv:2212.03595v2)

## ModularityAndLanglandsExtensions:ML.0/blggt-version-register
Assigned layer: ModularityAndLanglandsExtensions:ML.0
Declaration: TauCeti.PotentialAutomorphy.versionRegister
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC
ML binds its BLGGT statements to arXiv v4 (9 December 2013), the version preceding Ann. of Math. 179 (2014), 501–609. PotentialModularityAndCompatibleSystems part R24.3 cites arXiv v1 (2010). Correspondence: v1 §2.2 (minimal lifting, Theorem 2.2.1) = v4 §2.3 (Theorem 2.3.1); v1 §2.3 (ordinary lifting, Theorem 2.3.1) = v4 §2.4 (Theorem 2.4.1, now also for totally real F); v4 §2.2 (Lemmas 2.2.1–2.2.4 on automorphy) is new; v1 §5.2 (Lemma 5.2.1, Proposition 5.2.2) = v4 §5.3 (Lemma 5.3.1, Proposition 5.3.2); v1 Lemma 5.2.3 = v4 Lemma 5.4.5; v1 §5.3 (Theorem 5.3.1, Corollaries 5.3.2–5.3.3, Proposition 5.3.4) = v4 §5.4 (Theorem 5.4.1 with Corollary 5.4.2, Corollary 5.4.3, Corollary 5.4.4, Proposition 5.4.6); v1 §5.4 (Theorems 5.4.1–5.4.3) = v4 §5.5 (Theorems 5.5.1–5.5.3); v4 §5.2 (rational compatible systems) is new. v4 renames RAECSDC/RAESDC to "polarized" and "essentially conjugate self-dual" to "polarized", and states the lifting theorems for polarized (r, µ) with the "potentially diagonalizably automorphic" hypothesis.
Hypothesis: Both versions read on the text layer; theorem statements compared side by side.
Source: blggt-2014-v4, title page and table of contents, p. 1 (arXiv v4)

## ModularityAndLanglandsExtensions:ML.0/compatible-system-archimedean-factors
Assigned layer: ModularityAndLanglandsExtensions:ML.0
Declaration: TauCeti.LanglandsRegister.completedL
Prototype status: omitted
Supplier contracts: C-SYSTEM
Comparison/import of PotentialModularityAndCompatibleSystems:R24.5/system-l-functions. For a pure weakly compatible rank-n system with monic characteristic polynomial Q_v(X)=det(X−Frob_v), put P_v(T)=T^n Q_v(T^{−1})=det(1−T Frob_v). Then L^S(R,s)=∏_{v∉S}P_v(q_v^{−s})^{−1}=∏_{v∉S}q_v^{ns}/Q_v(q_v^s), absolutely convergent for Re s>1+w/2. Full ramified and archimedean factors require a pure, regular, strictly compatible system (or separately specified coherent Weil–Deligne and real-sign data); they are not determined by a pure weak system alone. With such data, Γ_ℝ(s)=π^{−s/2}Γ(s/2), Γ_ℂ(s)=2(2π)^{−s}Γ(s), and Λ is the product of the full finite and infinite factors. For a real regular odd-rank system, the determinant-to-sign conversion must include the rank parity recorded in E16.
Hypothesis: Partial Euler product: weakly compatible, pure of weight w, monic degree-n Q_v, finite ramification set and actual number-field norm.
Hypothesis: Completed product: regular, pure, strictly compatible; real sign data compatible with the Hodge pairing. Arbitrary hodge and hodgeSign fields alone do not ensure this.
API [omitted] TauCeti.LanglandsRegister.partialL
  L^S(R,s)=∏ q_v^{ns}/Q_v(q_v^s), equivalently ∏ det(1−q_v^{−s}Frob_v)^{−1}, for Re s>1+w/2.
API [omitted] TauCeti.LanglandsRegister.archimedeanFactor
  L_v(R, s) for v | ∞ from the Hodge–Tate data and complex conjugation.
API [omitted] TauCeti.LanglandsRegister.completedL
  Import Λ(R,s) with all finite and archimedean factors for regular pure strictly compatible systems; do not infer bad factors from weak compatibility.
API [omitted] TauCeti.LanglandsRegister.partialL_converges
  Absolute convergence for Re s > 1 + w/2 (purity).
API [omitted] TauCeti.LanglandsRegister.archimedeanFactor_directSum
  L_v(R ⊕ R′, s) = L_v(R, s)·L_v(R′, s).
API [omitted] TauCeti.LanglandsRegister.archimedeanFactor_tate
  L_v(R(1), s) = L_v(R, s + 1) (twist by the cyclotomic character).
Test [omitted] TauCeti.LanglandsRegister.archFactor_trivial_Q
  R = the trivial character of G_ℚ: L_∞(R, s) = Γ_ℝ(s) and Λ(R, s) = π^{−s/2}Γ(s/2)ζ(s).
Test [omitted] TauCeti.LanglandsRegister.archFactor_ellipticCurve
  R = H¹ of an elliptic curve over ℚ: L_∞(R, s) = Γ_ℂ(s) = 2(2π)^{−s}Γ(s).
Test [omitted] TauCeti.LanglandsRegister.archFactor_sign_character
  The quadratic character of ℚ(i): L_∞ = Γ_ℝ(s + 1), not Γ_ℝ(s) — the sign of complex conjugation matters.
Test [omitted] TauCeti.LanglandsRegister.partialL_rank_zero
  The zero system has L^S = 1 and Λ = 1.
Source: acc-2023, §7.1, definition of purity and the paragraph after it, arXiv v2 pp. 197–198 (Annals p. 1092 per routed locator)

## ModularityAndLanglandsExtensions:ML.0/nt26-normalisation-bridge
Assigned layer: ModularityAndLanglandsExtensions:ML.0
Declaration: TauCeti.LanglandsRegister.ntBridge
Prototype status: omitted
Supplier contracts: C-GALOIS
Newton–Thorne §1.2 uses geometric Frobenius, HT(ε)={−1}, and Tate-normalized rec^T(π_v)=rec(π_v⊗|det|^{(1−n)/2}), agreeing with BLGGT. Replacing geometric by arithmetic Frobenius evaluates the same representation on inverse elements; it does not by itself dualize the representation or change its Hodge–Tate weights. If IHG.3/R19 independently supplies a dual/cohomological realization dictionary r_atlas(π)≅r_NT(π)^∨, then that dictionary gives HT(r_atlas)=−HT(r_NT). Its exact provenance remains to be established.
Hypothesis: Registry node; every ML.3 statement taken from Newton–Thorne is read in these conventions.
Source: nt-2026, §1.2 Notation, p. 8 (arXiv v2) (geometric-Frobenius Art_K, rec^T, r_{π,ι}, HT convention); Frob_v convention p. 7

## ModularityAndLanglandsExtensions:ML.2/acc-symplectic-potential-automorphy
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.acc_symplectic
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
Let F/F₀ be a finite Galois extension of totally real fields, 𝓘 finite, and for i ∈ 𝓘 let n_i be even, l_i odd primes, ı_i : Q̄_{l_i} ≅ ℂ, and r̄_i : G_F → GSp_{n_i}(F̄_{l_i}) with open kernel and multiplier ε̄_{l_i}^{1−n_i}, unramified above a finite set 𝓛 of primes unramified in F and ≠ l_i; let F^avoid/F be finite Galois. Then there are finite Galois F^suffices/F₀ and F₁^avoid/ℚ with F ⊂ F^suffices, F^suffices linearly disjoint from F^avoid F₁^avoid over F, F₁^avoid and F^avoid linearly disjoint over ℚ, F^suffices unramified above 𝓛, such that for every finite totally real F′/F^suffices linearly disjoint from F₁^avoid each r̄_i|_{G_{F′}} is ordinarily automorphic of weight 0 and level prime to 𝓛. It strengthens BLGGT Theorem 3.1.2 (PotentialAutomorphyInfrastructurePartII PL.5) by the extra disjointness F₁^avoid.
Hypothesis: As in the statement.
Source: acc-2023, §7.2.1, Proposition 7.2.3 and its parenthetical proof, arXiv v2 pp. 204–205 (Annals pp. 1099–1100)

## ModularityAndLanglandsExtensions:ML.2/cg18-odd-symmetric-powers
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.cg18_oddSymPowers
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
Assume Conjecture B. Let A/K be an elliptic curve over a number field with End_ℂ(A) = ℤ and r = Sym^{2n−1}ρ_{A,p}. (Special case) If there is a prime p, totally split in K, with p + 1 divisible by an integer N₂ > 2n + 1 prime to the conductor of A, ρ̄_{A,p} surjective, A with good reduction at all v | p and ρ̄_A|_{G_{ℚ_p}} ≅ Ind ω₂, then r is potentially modular: the Dwork family point (BLGHT II Proposition 6.2) links r̄ to an induced representation, and two applications of CG's Theorem 5.16 give modularity. (General case) An auxiliary elliptic curve A′ with A′[q] ≅ A[q] (a point of the twisted modular curve X_A(q), ML.2/twisted-modular-curve) satisfying the special-case hypothesis reduces the general case to it.
Hypothesis: Hypothesis: Conjecture B; the corrections N₂ > 2n + 1, the E216 relabelling and BLGHT II Proposition 6.2 as printed.
Source: cg-2018, §10, proof of Theorem 1.1, 'extra hypothesis' bullet, p. 97 (arXiv v2) = Invent. p. 428 [sub-item sec10-special-case]
Source: cg-2018, §10, general case, pp. 97–98 (arXiv v2) = Invent. p. 429 [sub-items sec10-general-case, sec10-auxiliary-curve-lemma]

## ModularityAndLanglandsExtensions:ML.2/pd-lifts-with-local-conditions
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.exists_pd_lift
Prototype status: omitted
Supplier contracts: C-LOCAL-DEFORMATION
In the setting of §4.3 (F imaginary CM with ζ_l ∉ F, S split containing places above l, µ algebraic unramified outside S with µ(c_v) = −1, r̄ : G_{F⁺} → G_n(F̄_l) unramified outside S with ν ∘ r̄ = µ̄, lifts ρ_v of r̄̆|_{G_{F_ṽ}} for v ∈ S), assume r̄̆|_{G_{F(ζ_l)}} irreducible, l ≥ 2(d + 1), and for v | l that ρ_v is potentially diagonalizable with n distinct τ-Hodge–Tate numbers. Then r̄ has a lift r : G_{F⁺} → G_n(O_{Q̄_l}) with ν ∘ r = µ, r̆|_{G_{F_ṽ}} ∼ ρ_v for v ∈ S, unramified outside S.
Hypothesis: F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı : Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1) ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).
Source: blggt-2014-v4, §4.3, Theorem 4.3.1, p. 55 (arXiv v4)

## ModularityAndLanglandsExtensions:ML.2/potential-automorphy-theorem
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.potential_automorphy
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
Let F/F₀ be finite Galois of imaginary CM fields, I finite, and for i ∈ I: n_i, d_i ≥ 1, l_i odd with l_i ≥ 2(d_i + 1) and ζ_{l_i} ∉ F, ı_i; (r_i, µ_i) a totally odd, regular algebraic, n_i-dimensional polarized l_i-adic representation of G_F with d_i the maximal dimension of an irreducible constituent of r̄_i restricted to the subgroup generated by the Sylow pro-l_i-subgroups; F^{(avoid)}/F finite Galois. Assume r_i is potentially diagonalizable at each prime of F above l_i and r̄_i|_{G_{F(ζ_{l_i})}} is irreducible. Then there are a finite CM F′/F, Galois over F₀ and linearly disjoint from F^{(avoid)} over F, and regular algebraic cuspidal polarized (π_i, χ_i) of GL_{n_i}(𝔸_{F′}), unramified above l_i, with (r_{l_i,ı_i}(π_i), r_{l_i,ı_i}(χ_i)ε_{l_i}^{1−n_i}) ≅ (r_i|_{G_{F′}}, µ_i|_{G_{(F′)⁺}}).
Hypothesis: F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı : Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1) ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).
Hypothesis: Read "each prime v of F above l_i" (the printed "of F⁺" is a misprint, ModularityAndLanglandsExtensions/E2).
Source: blggt-2014-v4, §4.5, Theorem 4.5.1 and proof, pp. 59–60 (arXiv v4)

## ModularityAndLanglandsExtensions:ML.2/potential-automorphy-with-steinberg-place
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.withSteinbergPlace
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
Let F be totally real, p ≫_n 0, ρ̄ : Γ_F → GSp_{2n}(k) with similitude κ̄^{1−2n} and ρ̄|_{Γ_{F(ζ_p)}} absolutely GSp_{2n}-irreducible (ρ̄ may be GL_{2n}-reducible), and v₀ a place with ρ̄|_{Γ_{F_{v₀}}} = 1 and N(v₀) ≡ 1 mod p. Then there are a Galois totally real F′/F linearly disjoint from F(ρ̄, ζ_p) and a regular algebraic self-dual cuspidal Π_{F′} of GL_{2n}(𝔸_{F′}) with r̄_ι(Π_{F′}) ≅ ρ̄|_{Γ_{F′}} and Π_{F′,w} an unramified twist of Steinberg for every w | v₀: run BLGGT Theorem 3.1.2 with the additional Moret-Bailly condition v(t(P)) < 0 at the places above v₀.
Hypothesis: As stated; the GL_{2n}-constituents of ρ̄ are assumed self-dual and irreducible on Γ_{F(ζ_p)} (a gap in FKP's proof, recorded as a source issue); 'π_{v₀}' is printed for 'π_w, w | v₀' (E34).
Source: fkp-2022, §9, proof of Proposition 9.1, arXiv v5 p. 42
Source: fkp-2022, §9, proof of Proposition 9.1, arXiv v5 p. 42

## ModularityAndLanglandsExtensions:ML.3/bianchi-modular-forms
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.BianchiEigenform
Prototype status: omitted
Supplier contracts: C-COHERENT-GEOMETRY
Let F be imaginary quadratic. A cuspidal Bianchi modular eigenform of weight k ≥ 2 and level 𝔫 is a vector-valued function on GL₂(𝔸_F) generating a regular algebraic cuspidal automorphic representation π of parallel weight k (the infinitesimal character of π_∞ is that of (Sym^{k−2} ⊗ \overline{Sym^{k−2}})^∨), with Fourier expansion f((t z; 0 1)) = |t|_F Σ_{α ∈ F^×} c(αtδ_F, f) W(αt_∞) e_F(αz), coefficients c(I, f) vanishing unless I ⊂ O_F and normalised by c(O_F, f) = 1. Its Hecke eigenvalues also occur in the parabolic cohomology H_par ⊂ H¹(Γ₁(𝔫), Sym^{k−2}ℂ² ⊗ \overline{Sym^{k−2}ℂ²}) (Eichler–Shimura–Harder).
Hypothesis: F imaginary quadratic; k ≥ 2; 𝔫 a non-zero ideal.
API [omitted] TauCeti.SymmetricPower.BianchiEigenform
  A cuspidal Bianchi eigenform of weight k and level 𝔫.
API [omitted] TauCeti.SymmetricPower.BianchiEigenform.coeff
  The Fourier coefficient c(I, f).
API [omitted] TauCeti.SymmetricPower.BianchiEigenform.coeff_one
  c(O_F, f) = 1.
API [omitted] TauCeti.SymmetricPower.BianchiEigenform.coeff_eq_eigenvalue
  For 𝔭 ∤ 𝔫, c(𝔭, f) is the T_𝔭-eigenvalue.
API [omitted] TauCeti.SymmetricPower.BianchiEigenform.toAutRep
  The cuspidal automorphic representation of GL₂(𝔸_F) generated by f (parallel weight k).
Test [omitted] TauCeti.SymmetricPower.bianchi_weight2_elliptic
  A modular elliptic curve over F of conductor 𝔫 without CM by F gives a weight-2 Bianchi eigenform with c(𝔭, f) = N(𝔭) + 1 − #E(F_𝔭).
Test [omitted] TauCeti.SymmetricPower.bianchi_coeff_nonintegral
  c(I, f) = 0 for I ⊄ O_F.
Test [omitted] TauCeti.SymmetricPower.bianchi_not_holomorphic
  Bianchi forms are not holomorphic functions on a Hermitian domain: ℍ³ is not Hermitian, so there is no q-expansion in holomorphic exponentials; the expansion involves the Bessel-type Whittaker function W.
Source: bcgnt-2025, §1.3 Bianchi Modular Forms, arXiv v3 pp. 9–11 (published pp. 8–10; arXiv pagination differs)

## ModularityAndLanglandsExtensions:ML.3/functorial-lift
Assigned layer: ModularityAndLanglandsExtensions:ML.1
Declaration: TauCeti.Functoriality.IsFunctorialLift
Prototype status: omitted
Supplier contracts: C-AUTOMORPHIC
Let F be a number field, π a cuspidal automorphic representation of GL_n(𝔸_F) and R : GL_n → GL_N an algebraic representation. A functorial lift of π along R is an automorphic representation R(π) of GL_N(𝔸_F) (isobaric) such that for every place v the Langlands parameter of R(π)_v is R ∘ rec(π_v), where rec is the local Langlands correspondence for GL_n(F_v) (Harris–Taylor, Henniart at finite v; Langlands at infinite v). By strong multiplicity one for isobaric representations R(π) is unique if it exists. A weak lift asks the matching only at almost all v; CKPSS's 'functorial lift' from classical groups asks it at the archimedean places and at almost all unramified finite places.
Hypothesis: F a number field; π cuspidal on GL_n(𝔸_F); R algebraic.
API [omitted] TauCeti.Functoriality.IsFunctorialLift
  Π is a functorial lift of π along R: rec(Π_v) ≅ R ∘ rec(π_v) at every place.
API [omitted] TauCeti.Functoriality.IsWeakLift
  The same at almost all unramified places (Satake parameters).
API [omitted] TauCeti.Functoriality.IsFunctorialLift.unique
  Two functorial lifts of π along R are isomorphic (strong multiplicity one).
API [omitted] TauCeti.Functoriality.IsFunctorialLift.toWeak
  A functorial lift is a weak lift.
API [omitted] TauCeti.Functoriality.IsFunctorialLift.comp
  If Π is a lift of π along R, Π lies in the input domain of the second lift, and Π′ is a lift of Π along R′, then Π′ is a lift of π along R′∘R. For the cuspidal input definition this requires Π cuspidal; isobaric composition uses the supplied extension to that domain.
API [omitted] TauCeti.Functoriality.IsFunctorialLift.id
  π is its own lift along the identity.
API [omitted] TauCeti.Functoriality.IsFunctorialLift.lFunction
  L(s, R(π)) = L(s, π, R), the Langlands L-function of π along R.
Test [omitted] TauCeti.Functoriality.lift_det
  R = det on GL₂: the lift of π is the central character ω_π (a Hecke character), by local class field theory.
Test [omitted] TauCeti.Functoriality.lift_gl1
  n = 1, R = χ ↦ χ^k: the lift of a Hecke character χ is χ^k.
Test [omitted] TauCeti.Functoriality.lift_sym2_dihedral_not_cuspidal
  For π = AI_{K/F}(θ) dihedral, Sym²π exists but is not cuspidal: it is AI(θ²) ⊞ θ|_{𝔸_F^×} (whereas Ad(π) = AI(θ/θ^σ) ⊞ η_{K/F}).
Test [omitted] TauCeti.Functoriality.lift_std
  R = std: the lift of π is π itself, and IsFunctorialLift agrees with equality of rec at every place.
Source: newton-thorne-I, Introduction, 'Context', p. 1 (arXiv:1912.11261v3)

## ModularityAndLanglandsExtensions:ML.3/serre-equidistribution-criterion
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.serre_criterion
Prototype status: omitted
Supplier contracts: C-EQUIDISTRIBUTION
Let ST be a compact group and ([π_v])_{v ∉ S} conjugacy classes indexed by the finite places. For an irreducible representation ρ of ST put L^S(π, ρ, s) = ∏_{v ∉ S} det(1 − q_v^{−s}ρ([π_v]))^{−1}, absolutely convergent for Re s > 1. If for every non-trivial irreducible ρ, L^S(π, ρ, s) has meromorphic continuation to ℂ, holomorphic and non-vanishing on Re s = 1, then the [π_v] are equidistributed for the Haar probability measure of ST (Serre, Ch. I, Appendix). This is the general form of ML.3/l-function-equidistribution-criterion.
Hypothesis: ST compact; L-functions as stated.
Source: bcgnt-2025, Proof of Theorem 7.2.3, §7.2, arXiv v3 p. 70 (published p. 62; arXiv pagination differs)

## ModularityAndLanglandsExtensions:ML.3/symmetric-power-automorphy-lifting
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.symPower_lifting
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Newton–Thorne II Theorem 2.1. Let F be totally real, p a prime, n≥1, and π,π′ regular algebraic, cuspidal, non-CM representations of GL₂(𝔸_F), both of weight two and both nonordinary at every v|p. For a fixed ι:Q̄_p≅ℂ assume r̄_{π,ι}≅r̄_{π′,ι}, and that π_v is a twist of Steinberg exactly when π′_v is, for every finite v∤p. Suppose that for some a≥1, up to conjugacy, PSL₂(F_{p^a})≤P r̄_{π,ι}(G_F)≤PGL₂(F_{p^a}), with p^a>max(5,2n−1). If Sym^{n−1}r_{π′,ι} is automorphic, then Sym^{n−1}r_{π,ι} is automorphic. The bound concerns the finite-field cardinality, and applies also at p=2; it does not impose p>n or irreducibility of the residual symmetric power.
Hypothesis: All hypotheses in the statement, including weight two, non-CM and nonordinarity for BOTH π and π′. The projective image is a subgroup of PGL₂(F̄_p); the sandwich uses one embedded finite field and one conjugation.
Import owner: SymmetricPowerAutomorphyLifting
Source: newton-thorne-II, §2, Theorem 2.1 and proof, pp. 5–6 (arXiv v2)

## ModularityAndLanglandsExtensions:ML.4/global-arthur-parameter
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.GlobalParameter
Prototype status: omitted
Supplier contracts: C-ARTHUR
A discrete global Arthur parameter for G is a formal unordered sum ψ = μ₁ ⊠ ν_{b₁} ⊞ ⋯ ⊞ μ_r ⊠ ν_{b_r}, where μ_i is a unitary cuspidal automorphic representation of GL_{m_i}(𝔸_F) with μ_i ≅ μ_i^∨, ν_b is the b-dimensional irreducible representation of SL₂(ℂ), Σ m_i b_i = N, the pairs (μ_i, b_i) are pairwise distinct, every summand μ_i ⊠ ν_{b_i} has the parity of Ĝ (for Ĝ symplectic: μ_i of symplectic type with b_i odd or of orthogonal type with b_i even; for Ĝ orthogonal: μ_i of orthogonal type with b_i odd or of symplectic type with b_i even), and ∏_i ω_{μ_i}^{b_i} = η_G. Ψ_2(G) denotes the set of these (for G = SO_{2n} taken up to the outer automorphism, Ψ̃_2(G)). ψ is generic when every b_i = 1. Its global component group S_ψ is the sign group on the summands, restricted by ∏_i s_i^{m_i b_i}=1 when Ĝ is special orthogonal, then quotiented by the image of Z(Ĝ)^Γ; the determinant-one constraint can remove a generator before the central quotient, and Arthur attaches to ψ a sign character ε_ψ of S_ψ built from symplectic root numbers ε(1/2, μ_i × μ_j). At each place v, ψ localises to ψ_v : L_{F_v} × SL₂(ℂ) → ^LG through the local Langlands correspondence for the GL_{m_i}.
Hypothesis: F a number field, 𝔸_F its adèles; G a quasi-split symplectic or special orthogonal group over F (Sp_{2n}, split SO_{2n+1}, or quasi-split SO_{2n} attached to a quadratic character η_G), whose dual group Ĝ has a standard representation of dimension N (N = 2n + 1, 2n, 2n respectively).
API [omitted] TauCeti.Arthur.GlobalParameter
  The finite multiset of pairs (μ_i, b_i) with the dimension, distinctness, parity and central-character conditions.
API [omitted] TauCeti.Arthur.GlobalParameter.IsGeneric
  Every b_i equals 1.
API [omitted] TauCeti.Arthur.GlobalParameter.componentGroup
  Sign vectors on summands, with determinant-one kernel for orthogonal Ĝ, modulo Z(Ĝ)^Γ; not an unrestricted (ℤ/2)^r quotient.
API [omitted] TauCeti.Arthur.GlobalParameter.signCharacter
  Arthur's character ε_ψ : S_ψ → {±1}.
API [omitted] TauCeti.Arthur.GlobalParameter.localize
  ψ_v : L_{F_v} × SL₂(ℂ) → ^LG obtained from rec(μ_{i,v}) ⊗ ν_{b_i}.
API [omitted] TauCeti.Arthur.GlobalParameter.toIsobaric
  The isobaric automorphic representation ⊞_i Speh(μ_i, b_i) of GL_N(𝔸_F) attached to ψ.
API [omitted] TauCeti.Arthur.GlobalParameter.ofSelfDualCuspidal
  A unitary self-dual cuspidal μ of GL_N(𝔸_F) of the type of Ĝ (with ω_μ = η_G) is a simple generic parameter.
API [omitted] TauCeti.Arthur.GlobalParameter.signCharacter_generic_trivial_of_rootNumbers
  If every symplectic root number ε(1/2, μ_i × μ_j) occurring in ε_ψ equals 1 then ε_ψ = 1; in particular ε_ψ = 1 for generic ψ.
Test [omitted] TauCeti.Arthur.GlobalParameter.so3_trivial
  For G=SO₃≅PGL₂ (dual Sp₂), ψ=1⊠ν₂ is discrete and S_ψ=1. Identifying its automorphic packet is a separate classification application, not this definition test.
Test [omitted] TauCeti.Arthur.GlobalParameter.so3_generic_iff
  For G=SO₃, a unitary cuspidal μ on GL₂ gives the simple generic parameter μ⊠ν₁ iff ω_μ=1, with self-duality and exterior-square/Hecke comparison supplied.
Test [omitted] TauCeti.Arthur.GlobalParameter.sp0_empty
  N = 0 (G = SO₁, the trivial group): Ψ_2(G) consists of the empty sum only.
Test [omitted] TauCeti.Arthur.GlobalParameter.repeated_not_discrete
  μ ⊠ ν₁ ⊞ μ ⊠ ν₁ (a repeated summand) is not a discrete parameter: discrete parameters are multiplicity free.
Test [omitted] TauCeti.Arthur.GlobalParameter.wrongParity
  For G = SO₃, the summand χ ⊠ ν₁ ⊞ χ′ ⊠ ν₁ of two quadratic characters is not in Ψ_2(SO₃): each χ ⊠ ν₁ is orthogonal while Ĝ = SL₂ = Sp₂ is symplectic.
Test [omitted] TauCeti.Arthur.GlobalParameter.orthogonal_rank_three_component
  For dual Ĝ=SO₃ and a single dimension-3 orthogonal cuspidal summand with b=1, the determinant-one sign condition forces s=+1 and S_ψ is trivial; the unrestricted sign-group formula would give ℤ/2.
Source: arthur-2013, §1.4, (1.4.4), p. 30 (2011 manuscript)
Source: mok-2015, §2.3, p. 15 (arXiv v5)

## ModularityAndLanglandsExtensions:ML.4/gsp4-discrete-spectrum-types
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.GSp4.IsGeneralType
Prototype status: omitted
Supplier contracts: C-AUTOMORPHIC
An automorphic representation π of GSp₄(𝔸_F) is discrete if it occurs in the discrete spectrum of L² automorphic forms with central character ω_π (every cuspidal one is). A cuspidal Π of GL₄(𝔸_F) is of symplectic type with multiplier χ if L^S(s, Π, ∧² ⊗ χ^{−1}) has a pole at s = 1 for some (equivalently every) finite S; then Π ≅ Π^∨ ⊗ χ. A discrete π is of general type if there is a cuspidal Π of GL₄(𝔸_F) of symplectic type with multiplier ω_π such that, for every place v, the L-parameter of π_v (rec_GT(π_v) at finite v, the archimedean Langlands parameter at infinite v) composed with GSp₄(ℂ) ⊂ GL₄(ℂ) is rec(Π_v); Π is then the transfer of π. Arthur's classification divides the discrete spectrum into six families (a)–(f), (a) being general type and (b)–(f) the Yoshida, Soudry, Saito–Kurokawa, Howe–Piatetski-Shapiro and one-dimensional types (Gee–Taïbi Remark 6.1.4 list S_ψ = 1, ℤ/2ℤ, 1, ℤ/2ℤ, ℤ/2ℤ, 1 respectively, with ε_ψ non-trivial only in the Saito–Kurokawa case with ε(1/2, π ⊗ η^{−1}) = −1).
Hypothesis: F a totally real number field (BCGP work over totally real F; Calegari–Geraghty and Pilloni over ℚ); GSp₄ the split symplectic similitude group with similitude ν; π a discrete automorphic representation of GSp₄(𝔸_F) with central character ω_π.
API [omitted] TauCeti.Arthur.GSp4.IsDiscrete
  π occurs in L²_disc(GSp₄(F)\GSp₄(𝔸_F), ω_π).
API [omitted] TauCeti.Arthur.GSp4.IsSymplecticTypeWith
  Π cuspidal on GL₄ with L^S(s, Π, ∧² ⊗ χ^{−1}) having a pole at s = 1.
API [omitted] TauCeti.Arthur.GSp4.IsGeneralType
  π has a cuspidal transfer Π of symplectic type with multiplier ω_π.
API [omitted] TauCeti.Arthur.GSp4.transfer
  The transfer Π of a general-type π (unique by strong multiplicity one).
API [omitted] TauCeti.Arthur.GSp4.IsSymplecticTypeWith.selfDual
  IsSymplecticTypeWith Π χ ⇒ Π ≅ Π^∨ ⊗ χ.
API [omitted] TauCeti.Arthur.GSp4.ArthurType
  The six types (a)–(f) of a discrete π.
API [omitted] TauCeti.Arthur.GSp4.isGeneralType_iff_typeA
  IsGeneralType π ↔ ArthurType π = (a).
Test [omitted] TauCeti.Arthur.GSp4.yoshida_not_general
  A Yoshida lift (transfer μ₁ ⊞ μ₂ of two distinct weight-2 newforms with equal central characters) is discrete but not of general type.
Test [omitted] TauCeti.Arthur.GSp4.oneDimensional_typeF
  The one-dimensional representation χ ∘ ν of GSp₄(𝔸_F) is discrete, of type (f), with transfer χ|·|^{3/2} ⊞ χ|·|^{1/2} ⊞ χ|·|^{−1/2} ⊞ χ|·|^{−3/2}.
Test [omitted] TauCeti.Arthur.GSp4.sym3_symplectic
  For π cuspidal on GL₂ non-dihedral and non-tetrahedral, Sym³π (ML.3/kim-shahidi-sym3) is cuspidal on GL₄ of symplectic type with multiplier ω_π³.
Test [omitted] TauCeti.Arthur.GSp4.symplectic_iff_gl2
  For GL₂ (the analogue for GSp₂ = GL₂), every cuspidal Π is of symplectic type with multiplier ω_Π, since ∧²Π = ω_Π.
Source: bcgp-2021, §2.9, p. 38 (arXiv v3)
Source: bcgp-2021, §2.9, definition of general type, p. 38 (arXiv v3)
Source: gee-taibi-2019, Remark 6.1.4, p. 35 (arXiv v1)

## ModularityAndLanglandsExtensions:ML.0/compatible-system-automorphic-l-function-comparison
Assigned layer: ModularityAndLanglandsExtensions:ML.0
Declaration: TauCeti.LanglandsRegister.completedL_automorphic
Prototype status: omitted
Supplier contracts: C-GALOIS
Let π be regular algebraic cuspidal and let R_π be its attached compatible system. Unramified local–global compatibility implies L^S(R_π,s)=L^S(π,s+(1−n)/2) on a right half-plane, hence on any common meromorphic continuation. For equality at infinity in the ACC+ argument require R_π pure and the density-one generic-irreducibility hypothesis of ACC+ Theorem 7.1.1 (and its applicable field setting); matching Hodge weights alone does not supply real signs. Equality of full completed functions additionally requires compatibility at every ramified finite place and coherent epsilon factors. Under these named hypotheses Λ(R_π,s) inherits the corresponding shifted automorphic continuation and functional equation.
Hypothesis: π regular algebraic cuspidal; R_π attached through the appropriate AG2.2 realization and local–global compatibility.
Hypothesis: For the archimedean comparison via ACC+ Theorem 7.1.1: purity and its density-one generic-irreducibility condition. For the completed comparison: all finite Weil–Deligne and epsilon-factor compatibilities.
Source: acc-2023, §7.1, paragraph after the proof of Lemma 7.1.10 (before Theorem 7.1.11), arXiv v2 p. 200 (Annals p. 1095)

## ModularityAndLanglandsExtensions:ML.0/endpoint-status-register
Assigned layer: ModularityAndLanglandsExtensions:ML.0
Declaration: TauCeti.LanglandsRegister.EndpointRecord
Prototype status: stated
Supplier contracts: none; concrete core above
An endpoint record stores its proposition P, source/locator s, status tag σ∈{known,conditional,conjectural}, finite list H of named mathematical hypotheses, and producer references D. A known record contains a proof of P and no hypotheses; a conditional record contains a proof that all H imply P; a conjectural record records the assertion without a proof. These stored tags do not automatically compute dependency closure. Upgrading a conditional record requires proofs of every member of H. If H=[], its conditional proof establishes P outright, so an upgraded known record can be constructed, while its original tag remains conditional. Verification that all producer chains supply their asserted statements is a separate dependency-verification obligation.
Hypothesis: Registry data; it states no mathematics of its own.
API [stated] TauCeti.LanglandsRegister.EndpointRecord
  A record (P, source, status, hypotheses, producers).
API [stated] TauCeti.LanglandsRegister.Status
  The three statuses known, conditional and conjectural.
API [stated] TauCeti.LanglandsRegister.EndpointRecord.holds_of_hypotheses
  For a conditional record, (∀ h ∈ H, h) → P.
API [stated] TauCeti.LanglandsRegister.EndpointRecord.upgrade
  From a conditional record and proofs of all its hypotheses, a known record with the same statement.
API [stated] TauCeti.LanglandsRegister.EndpointRecord.known_holds
  A known record yields a proof of P.
Test [stated] TauCeti.LanglandsRegister.EndpointRecord.arithmetic_known
  A record of the concrete assertion 2+2=4 with its proof has tag known and an empty hypothesis list. NT II Theorem A is separately catalogued as known in the reader; this test does not construct its missing signature.
Test [stated] TauCeti.LanglandsRegister.EndpointRecord.arithmetic_conditional
  A conditional record of 3=4 with the explicit named hypothesis 1=2 retains the conditional tag and its single hypothesis. The implication is proved from that concrete hypothesis; there is no proof of the assertion alone.
Test [stated] TauCeti.LanglandsRegister.EndpointRecord.arithmetic_conjectural
  A conjectural record of 3=4 stores no proof. In particular, constructing the record is distinct from proving its assertion. The mathematical weight-(2,2) endpoint is separately catalogued as conjectural.
Test [stated] TauCeti.LanglandsRegister.EndpointRecord.unrelated_proof_not_upgrade
  A known record of 2=2 cannot satisfy the missing hypothesis 1=2 of a conditional record. The upgrade interface takes proofs of the actual listed assertions; an unrelated known record is not such an argument.
Test [stated] TauCeti.LanglandsRegister.empty_hypotheses
  For a conditional record with H = [], holds_of_hypotheses proves its assertion without inputs and upgrade can produce a known record; the original conditional tag need not equal known.
Source: cg-2018, Theorem 1.1(1), §1, p. 3 (arXiv v2) = Invent. p. 300; proof §10, pp. 96–98 (arXiv v2) = Invent. pp. 428–429

## ModularityAndLanglandsExtensions:ML.0/nt26-automorphy-predicate
Assigned layer: ModularityAndLanglandsExtensions:ML.0
Declaration: TauCeti.LanglandsRegister.IsAutomorphicNT
Prototype status: omitted
Supplier contracts: C-GALOIS
Let F be a totally real or CM number field and p a prime. A continuous representation ρ : G_F → GL_n(Q̄_p) is automorphic if there are a RAESDC or RAECSDC (regular algebraic, essentially (conjugate) self-dual, cuspidal) automorphic representation π of GL_n(𝔸_F) and an isomorphism ι : Q̄_p ≅ ℂ with ρ ≅ r_{π,ι}, normalised as in ML.0/nt26-normalisation-bridge. The definition forces ρ to be (conjugate-)self-dual up to twist and conjecturally irreducible; Newton–Thorne note that it is not the most general one could adopt.
Hypothesis: F totally real or CM; p prime; π RAESDC or RAECSDC, so that r_{π,ι} exists (AutomorphicGaloisRepresentationsPartII AG2.2).
API [omitted] TauCeti.LanglandsRegister.IsAutomorphicNT
  ρ≅r_{π,ι} for some regular algebraic essentially (conjugate) self-dual CUSPIDAL π and an isomorphism ι:Q̄_p≅ℂ. An isobaric sum does not qualify.
API [omitted] TauCeti.LanglandsRegister.IsAutomorphicNT.of_iso
  Invariant under isomorphism of ρ.
API [omitted] TauCeti.LanglandsRegister.IsAutomorphicNT.twist
  ρ automorphic and χ an algebraic Hecke character's Galois character ⇒ ρ ⊗ r_ι(χ) automorphic.
API [omitted] TauCeti.LanglandsRegister.IsAutomorphicNT.iff_blggt
  For an irreducible polarized pair (ρ,µ) with the actual compatible automorphic polarization character in the BLGGT convention: IsAutomorphicNT ρ iff the pair (ρ,µ) is BLGGT-automorphic. The multiplier/Hecke-character comparison is part of the supplier contract; irreducibility alone is not asserted to make an unspecified multiplier unique.
API [omitted] TauCeti.LanglandsRegister.IsAutomorphicNT.irreducible
  Conjectural consequence: the cuspidal realization is expected irreducible in general. No theorem asserting this is proposed; use proved rank-two irreducibility or the precise density/regularity results when applicable.
Test [omitted] TauCeti.LanglandsRegister.IsAutomorphicNT.ellipticCurve
  For E/ℚ, the cohomological realization H¹_et(E_{ℚ̄},Q̄_p) (the dual of the usual Tate module) is automorphic via its weight-two form, in the NT convention HT(ε_p)={−1}; the Tate-module duality is explicit.
Test [omitted] TauCeti.LanglandsRegister.IsAutomorphicNT.character
  n = 1: ρ is automorphic iff ρ = r_ι(χ) for an algebraic Hecke character χ (class field theory).
Test [omitted] TauCeti.LanglandsRegister.IsAutomorphicNT.reducible_not
  ρ = 1 ⊕ ε_p^{−1} is not automorphic in this sense: an isobaric sum is not cuspidal.
Test [omitted] TauCeti.LanglandsRegister.IsAutomorphicNT.weightOne_not
  The Galois representation of a weight-one newform is not automorphic in this sense: π is not regular algebraic.
Source: nt-2026, §2 ('Some comforting lemmas'), opening paragraph immediately before Lemma 2.1, p. 9 (arXiv v2)

## ModularityAndLanglandsExtensions:ML.2/change-of-weight-and-level
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.change_of_weight_and_level
Prototype status: omitted
Supplier contracts: C-LOCAL-DEFORMATION
Let F be imaginary CM, l > 2(n + 1) with ζ_l ∉ F and primes above l split over F⁺, S a finite split set of finite places of F⁺ containing those above l, µ algebraic, and r̄ : G_F → GL_n(F̄_l) with (r̄, µ̄) polarized, unramified outside S, ordinarily or potentially diagonalizably automorphic, and r̄|_{G_{F(ζ_l)}} irreducible. For v ∈ S let ρ_v be a lift of r̄|_{G_{F_ṽ}}, potentially diagonalizable with n distinct τ-Hodge–Tate numbers when v | l. Then there is a regular algebraic cuspidal polarized (π, χ) with r̄_{l,ı}(π) ≅ r̄, r_{l,ı}(χ)ε_l^{1−n} = µ, level potentially prime to l, unramified outside S, and ρ_v ∼ r_{l,ı}(π)|_{G_{F_ṽ}} for v ∈ S.
Hypothesis: F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı : Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1) ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).
Hypothesis: The statement is read with ρ_v a lift of r̄|_{G_{F_ṽ}}; see ModularityAndLanglandsExtensions/E3.
Source: blggt-2014-v4, §4.4, Theorem 4.4.1, pp. 58–59 (arXiv v4)

## ModularityAndLanglandsExtensions:ML.2/compatible-systems-potentially-automorphic
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.potential_automorphy_compatibleSystem
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
Let F/F₀ be finite Galois of CM (resp. totally real) fields and F^{(avoid)}/F finite Galois. If (ℛ_i, ℳ_i), i = 1, …, r, are totally odd, polarized weakly compatible systems of l-adic representations of G_F with each ℛ_i regular and irreducible, then there is a finite CM (resp. totally real) F′/F, linearly disjoint from F^{(avoid)} and Galois over F₀, such that each (ℛ_i|_{G_{F′}}, ℳ_i|_{G_{(F′)⁺}}) is automorphic. In particular (Corollary 5.4.2) a single such system becomes automorphic over a finite Galois CM (resp. totally real) F′/F.
Hypothesis: (ℛ, ℳ) a polarized weakly compatible system of G_F over M (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1 conventions.
Source: blggt-2014-v4, §5.4, Theorem 5.4.1, Corollary 5.4.2 and proof, p. 74 (arXiv v4)

## ModularityAndLanglandsExtensions:ML.2/constituents-potentially-automorphic
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.constituents_potentially_automorphic
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
Let F be CM and (ℛ, ℳ) a totally odd, polarized weakly compatible system with ℛ pure and extremely regular; write r_λ = r_{λ,1} ⊕ ⋯ ⊕ r_{λ,j_λ} into irreducibles. There is a set L of rational primes of Dirichlet density 1 such that for λ | l ∈ L there is a finite CM Galois F′/F with each (r_{λ,α}|_{G_{F′}}, µ_λ|_{G_{(F′)⁺}}) irreducible and automorphic.
Hypothesis: (ℛ, ℳ) a polarized weakly compatible system of G_F over M (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1 conventions.
Source: blggt-2014-v4, §5.4, Lemma 5.4.5 and Proposition 5.4.6, pp. 76–77 (arXiv v4)

## ModularityAndLanglandsExtensions:ML.2/potential-automorphy-mod-l
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.potential_automorphy_residual
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
In the situation of Theorem 4.5.1 but with r̄_i : G_F → GL_{n_i}(F̄_{l_i}) irreducible, (r̄_i, µ_i) polarized (µ_i totally odd de Rham), r̄_i|_{G_{F(ζ_{l_i})}} irreducible, S a Gal(F/F⁺)-stable finite set of primes containing those above l_i and the ramification, and lifts ρ_{i,v} (v ∈ S) with ρ^c_{i,cv} ≅ µ_iρ^∨_{i,v}, potentially diagonalizable with n_i distinct Hodge–Tate numbers when v | l_i: there are F′ (as in 4.5.1) and (π_i, χ_i) with r̄_{l_i,ı_i}(π_i) ≅ r̄_i|_{G_{F′}}, r_{l_i,ı_i}(χ_i)ε^{1−n_i} = µ_i|_{G_{F′⁺}}, level potentially prime to l_i, unramified outside S, and r_{l_i,ı_i}(π_i)|_{G_{F′_u}} ∼ ρ_{i,v}|_{G_{F′_u}} for u | v ∈ S.
Hypothesis: F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı : Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1) ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).
Hypothesis: Read ρ_{i,v}, n_i and ρ_{i,v}|_{G_{F′_u}} in (g) and (7) (misprints E2).
Source: blggt-2014-v4, §4.5, Corollary 4.5.3, pp. 60–61 (arXiv v4)

## ModularityAndLanglandsExtensions:ML.2/potential-automorphy-totally-real
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.potential_automorphy_totallyReal
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
Let F⁺ be totally real, l ≥ 2(n + 1), and (r, µ) a totally odd, regular algebraic, n-dimensional polarized l-adic representation of G_{F⁺}, potentially diagonalizable at each prime above l, with r̄|_{G_{F⁺(ζ_l)}} irreducible. Then there is a Galois totally real F^{+,′}/F⁺ such that (r|_{G_{F^{+,′}}}, µ|_{G_{F^{+,′}}}) is automorphic of level prime to l.
Hypothesis: F⁺ totally real.
Source: blggt-2014-v4, §4.5, Corollary 4.5.2, p. 60 (arXiv v4)

## ModularityAndLanglandsExtensions:ML.2/potential-weak-automorphy-symmetric-powers
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.weakAutomorphy_symPower
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
Let F be an imaginary CM field and R a strongly irreducible very weakly compatible system of rank 2 of G_F with H_τ = {0, m} (m ≥ 2) and det r_λ = ε^{−m}. Let v₀ ∉ S. Then for each n ≥ 1 there is a CM extension F_n/F, Galois over ℚ, such that Sym^{n−1}R|_{G_{F_n}} is weakly automorphic of level prime to the places above v₀. The proof uses a semistable elliptic curve A/ℚ, good ordinary at an auxiliary prime q > 2nm + 1 with surjective mod q image, and the automorphy of Sym^{nm−1} of A over a CM field F₆ (ACC+).
Hypothesis: As stated.
Source: bcgnt-2025, Theorem 6.2.4 and proof (incl. the elliptic curve A/ℚ and the automorphy of Sym^{nm−1}ρ_{A,q}|G_{F₆}), §6.2, arXiv v3 pp. 64–68 (published pp. 57–61; arXiv pagination differs)

## ModularityAndLanglandsExtensions:ML.3/acc-elliptic-symmetric-powers
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.SymmetricPower.acc_ellipticSymPowers
Prototype status: omitted
Supplier contracts: C-SYSTEM
Let 𝓜 be a finite set of positive integers, E/ℚ a non-CM elliptic curve, 𝓛 a finite set of primes of good reduction and F^avoid/ℚ finite. There are a finite Galois F₂^avoid/ℚ linearly disjoint from F^avoid and a finite totally real Galois F^suffices/ℚ unramified above 𝓛 and linearly disjoint from F^avoid F₂^avoid, such that for every finite totally real F′/F^suffices linearly disjoint from F₂^avoid and every m ∈ 𝓜 there is a regular algebraic cuspidal polarizable π of GL_{m+1}(𝔸_{F′}) of weight 0 with Sym^m r_{E,l}^∨|_{G_{F′}} ≅ r_{l,ı}(π) (unramified above 𝓛; the same compatible-system realization holds for every l and ι, without asserting ordinarity at all residual characteristics).
Hypothesis: As stated; corrections E103–E107 of the ACC+ extraction applied to the proof.
Source: acc-2023, §7.2.1, Corollary 7.2.4, arXiv v2 pp. 205–206 (Annals pp. 1100–1101); proof pp. 206–208 (Annals pp. 1101–1103)

## ModularityAndLanglandsExtensions:ML.3/gelbart-jacquet
Assigned layer: ModularityAndLanglandsExtensions:ML.1
Declaration: TauCeti.Functoriality.gelbartJacquet
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-ARTIN
Let π be a cuspidal automorphic representation of GL₂(𝔸_F), F a number field. Then Sym²π (equivalently Ad(π) = Sym²π ⊗ ω_π^{−1}) exists as an automorphic representation of GL₃(𝔸_F) in the sense of ML.3/functorial-lift, and Ad(π) is cuspidal iff π is not dihedral (not automorphically induced from a Hecke character of a quadratic extension).
Hypothesis: F a number field; π cuspidal on GL₂(𝔸_F).
Source: newton-thorne-I, Introduction, 'Context', p. 1 (arXiv:1912.11261v3)
Source: gelbart-jacquet-1978, §9, (9.3) Theorem, p. 534 (Ann. Sci. ÉNS 11)

## ModularityAndLanglandsExtensions:ML.3/ramakrishnan-tensor-product
Assigned layer: ModularityAndLanglandsExtensions:ML.1
Declaration: TauCeti.Functoriality.ramakrishnan
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-ARTIN
For cuspidal π,π′ on GL₂(𝔸_F), Ramakrishnan Theorem M constructs an isobaric π⊠π′ on GL₄ with local Rankin–Selberg L- and epsilon-factors at all finite places and L-factors at infinity. If neither is dihedral, it is cuspidal iff π′ is not a Hecke-character twist of π. If π′=AI_{K/F}(μ) for quadratic K/F, it is cuspidal iff BC_K(π) is cuspidal and is not isomorphic to BC_K(π)⊗(μ∘θ)μ^{−1}, θ the nontrivial automorphism. This latter criterion is not replaced by a blanket exclusion of only both-dihedral pairs.
Hypothesis: F a number field; π₁, π₂ cuspidal on GL₂(𝔸_F).
Source: newton-thorne-II, Appendix A, proof of Theorem A.1, p. 28 (arXiv:2009.07180v2)
Source: ramakrishnan-2000, §3, Theorem M, p. 54 (Ann. of Math. 152; arXiv:math/0007203v1)

## ModularityAndLanglandsExtensions:ML.4/extended-langlands-parameter
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.ExtendedParameter
Prototype status: omitted
Supplier contracts: C-ARTHUR
Let F be a non-archimedean local field of characteristic 0 and G° a quasi-split classical group over F (symplectic, special orthogonal or unitary). A Langlands parameter is a Ĝ°-conjugacy class of admissible homomorphisms ϱ : W_F × SL₂(ℂ) → ^LG°; its component group S_ϱ = π₀(Cent_{Ĝ°}(ϱ)/Z(Ĝ°)^{Γ_F}) is an elementary abelian 2-group. An extended Langlands parameter is a pair (ϱ, χ_ϱ) with χ_ϱ a character of S_ϱ, and Lang(G°) is the set of extended parameters. The local Langlands correspondence of Arthur and Mok, normalised by a Whittaker datum, is a bijection LL : Irr(G°) → Lang(G°) (for even special orthogonal groups, up to the outer automorphism), under which the L-packet Π_ϱ is the fibre over ϱ.
Hypothesis: F non-archimedean of characteristic 0; G° quasi-split classical; a Whittaker datum fixed (it normalises χ_ϱ).
API [omitted] TauCeti.Arthur.ExtendedParameter
  A pair (ϱ, χ_ϱ) with χ_ϱ a character of S_ϱ.
API [omitted] TauCeti.Arthur.ExtendedParameter.parameter
  The underlying Langlands parameter ϱ.
API [omitted] TauCeti.Arthur.ExtendedParameter.character
  The character χ_ϱ of S_ϱ.
API [omitted] TauCeti.Arthur.componentGroup_elementaryAbelianTwo
  S_ϱ is an elementary abelian 2-group.
API [omitted] TauCeti.Arthur.lPacket_equiv_characters
  For G° quasi-split, LL restricts to a bijection Π_ϱ ≃ Ŝ_ϱ.
API [omitted] TauCeti.Arthur.ExtendedParameter.generic_iff
  For tempered ϱ, the generic member of Π_ϱ (for the fixed Whittaker datum) is the one with χ_ϱ = 1.
Test [omitted] TauCeti.Arthur.ExtendedParameter.sl2_klein_four
  G° = SL₂, p odd, ϱ with image the Klein four-group in SO₃(ℂ): S_ϱ ≅ (ℤ/2ℤ)², so |Π_ϱ| = 4.
Test [omitted] TauCeti.Arthur.ExtendedParameter.so2_split
  G° = split SO₂ ≅ GL₁: every S_ϱ is trivial and, with even orthogonal groups taken up to the outer automorphism, Lang(G°) ≅ Hom(F^×, ℂ^×)/(χ ∼ χ^{−1}) (local class field theory).
Test [omitted] TauCeti.Arthur.ExtendedParameter.sl2_size_two
  G° = SL₂: a parameter ϱ : W_F → SO₃(ℂ) ≅ PGL₂(ℂ) lifting to an irreducible dihedral Ind_{W_E}^{W_F} θ with θ/θ^c not quadratic has S_ϱ ≅ ℤ/2ℤ and an L-packet of size 2, not a singleton as for GL₂.
Test [omitted] TauCeti.Arthur.ExtendedParameter.unramified_trivial
  An unramified tempered ϱ of Sp_{2n} whose standard representation is a sum of distinct characters has S_ϱ = 1 and Π_ϱ is the unramified representation.
Source: kss-2021, §1.20, p. 8 (arXiv v3); p. 604 in the version of record

## ModularityAndLanglandsExtensions:ML.4/shahidi-exterior-square
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.exteriorSquare_nonvanishing
Prototype status: omitted
Supplier contracts: C-ARTHUR, C-AUTOMORPHIC
Let Π be unitary cuspidal on GL₄(𝔸_F) (or GL_{2n}) and ω unitary. At s=1, L^S(s,Π,∧²⊗ω) has either a simple pole or a finite nonzero limit; the pole is equivalent to symplectic type with multiplier ω^{−1}. For cyclic prime-degree F′/F with Π′=BC(Π) cuspidal, in the factorization over the unitary quotient characters ψ at most one factor L^S(s,Π,∧²⊗ωψ) has a pole at 1 and the others have nonzero limits there. This assertion is at s=1; it does not assert absence of poles at all other points of Re s=1.
Hypothesis: F a number field; Π unitary cuspidal on GL₄ or GL_{2n}; ω unitary; S contains the ramified places.
Hypothesis: The cyclic base-change consequence requires BC(Π) cuspidal. Two different pole-producing twists would give a prohibited nontrivial self-twist.
Source: bcgp-2021, Proof of Lemma 8.3.2, §8.3, p. 247 (arXiv v3)

## ModularityAndLanglandsExtensions:ML.5/ckpss-generic-transfer
Assigned layer: ModularityAndLanglandsExtensions:ML.5
Declaration: TauCeti.Functoriality.ckpss
Prototype status: omitted
Supplier contracts: C-AUTOMORPHIC, C-GALOIS
Let k be a number field, G_n = SO_{2n+1}, SO_{2n} (n ≥ 2) or Sp_{2n} split over k, and N = 2n, 2n, 2n + 1. Every globally generic cuspidal automorphic representation π of G_n(𝔸) has a functorial lift Π to GL_N(𝔸) (local lift at every archimedean place and at almost all unramified finite places). For G_n = SO_{2n+1}: Π = Π₁ ⊞ ⋯ ⊞ Π_d with Π_i pairwise non-isomorphic unitary self-dual cuspidal representations of GL_{N_i}(𝔸) such that L^T(s, Π_i, ∧²) has a pole at s = 1 (symplectic type), and conversely every such Π is the lift of some π; for Sp_{2n} (resp. SO_{2n}) the same holds with L^T(s, Π_i, Sym²) having a pole at s = 1 (orthogonal type) and trivial central character of the total lift Π (not necessarily of each Π_i) (CKPSS Theorems 7.1, 7.2, the image being Ginzburg–Rallis–Soudry's).
Hypothesis: k a number field; G_n split; π globally generic cuspidal (with respect to a fixed splitting).
Source: ckpss-2004, Theorem 1.1, §1, p. 169 (Publ. Math. IHÉS 99)
Source: ckpss-2004, Theorem 7.1, §7.1, p. 195 (Publ. Math. IHÉS 99)
Source: bcg-2025, Remark 2.5, §2, p. 8 (arXiv:2309.15944v3); journal p. 515
Source: ckpss-2004, Theorem 7.2, PDF p.34 (printed p.196)

## ModularityAndLanglandsExtensions:ML.0/arthur-dependency-gate
Assigned layer: ModularityAndLanglandsExtensions:ML.0
Declaration: TauCeti.LanglandsRegister.arthurGate
Prototype status: omitted
Supplier contracts: C-ARTHUR
Arthur's endoscopic classification for quasi-split symplectic and orthogonal groups (2013), and the results deduced from it — Mok's classification for quasi-split unitary groups, Kaletha–Mínguez–Shin–White for their inner forms, Gee–Taïbi's classification for GSp₄, Xu's packets and multiplicity formula for GSp_{2n}, Ishimoto's for non-split odd orthogonal groups — are recorded with status conditional. Arthur's book rests on his Hypothesis 3.2.1 (stabilisation of the twisted trace formula of GL(N) and SO(2n)) and on his announced references [A24]–[A27]. The stabilisation is Mœglin–Waldspurger's (2016), [A24] is settled there, and [A25]–[A27] are proved by Atobe–Gan–Ichino–Kaletha–Mínguez–Shin, so that the one remaining hypothesis is the twisted weighted fundamental lemma, which Mœglin–Waldspurger state as [MW, II.4.4] and which reduces to the weighted fundamental lemma for Lie algebras of non-split groups and its non-standard version (no written proof; the split case is Chaudouard–Laumon). Every endpoint using one of these classifications carries this hypothesis visibly; the register does not claim that the weighted fundamental lemma follows from the (proved) unweighted one.
Hypothesis: Registry; the hypothesis it names is carried by every consumer.
Source: bcgp-2021, §1.4.1 'The work of Arthur', p. 14 (arXiv v3)
Source: bcgp-2025, §1.6 'The work of Arthur', pp. 7–8 (arXiv v1)
Source: agikms-2024, Abstract, p. 1 (arXiv v3)
Source: arthur-2013, §3.2, Hypothesis 3.2.1, p. 137; Preface p. xvi (2011 manuscript)

## ModularityAndLanglandsExtensions:ML.0/expected-crystallinity-newton-above-hodge
Assigned layer: ModularityAndLanglandsExtensions:ML.0
Declaration: TauCeti.LanglandsRegister.ExpectedSingularWeightHodge
Prototype status: omitted
Supplier contracts: C-COHERENT-GEOMETRY
ExpectedSingularWeightHodge is the proposition: for a system of Hecke eigenvalues Θ occurring in the coherent cohomology H^i(S^tor_{K,Σ}, Ω^{(k,r)}), (k, r) ∈ ℤ_{≥0} × ℤ (or its cuspidal version), of the Siegel threefold, the attached semisimple ρ_{Θ,λ} : G_ℚ → GL₄(E_λ) is de Rham at p with Hodge–Tate weights (0, r − 2, r + k − 1, k + 2r − 3) (cyclotomic character of weight −1), crystalline at p if (N, p) = 1, with Newton polygon above the Hodge polygon. Status: conjectural in general; in cohomological weight (r ≠ 2, k + r ≠ 1, k + 2r ≠ 3) the Newton-above-Hodge statement is a consequence of V. Lafforgue's theorem.
Hypothesis: Frontier statement; status conjectural (cohomological weight: Newton above Hodge known).
API [omitted] TauCeti.LanglandsRegister.ExpectedSingularWeightHodge
  The proposition stated.
API [omitted] TauCeti.LanglandsRegister.ExpectedSingularWeightHodge.hodgeTate
  The expected Hodge–Tate weights are (0, r − 2, r + k − 1, k + 2r − 3).
API [omitted] TauCeti.LanglandsRegister.ExpectedSingularWeightHodge.cohomological
  For k ≥ 0 in cohomological weight the Hodge–Tate weights are pairwise distinct.
Test [omitted] TauCeti.LanglandsRegister.hodgeTate_k2_r1
  k = 2, r = 1 (a cohomological weight: r ≠ 2, k + r ≠ 1, k + 2r ≠ 3): the expected weights (0, −1, 2, 1) are distinct.
Test [omitted] TauCeti.LanglandsRegister.hodgeTate_singular
  r = 2: the weights (0, 0, k + 1, k + 1) repeat, so the weight is not cohomological.
Test [omitted] TauCeti.LanglandsRegister.hodgeTate_degenerate
  k = 0, r = 2: the weights are (0, 0, 1, 1), those of H¹ of an abelian surface.
Source: pilloni-2020, §5.3, Remark 5.3.2, p. 25 (author version)
Source: pilloni-2020, §5.3, Remark 5.3.2, p. 26 (author version)

## ModularityAndLanglandsExtensions:ML.0/gsp4-galois-l-packet
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.LanglandsRegister.GSp4.lPacketOf
Prototype status: omitted
Supplier contracts: C-GALOIS
Fix for every prime p an isomorphism ı : ℂ ≅ Q̄_p (it fixes square roots in Q̄_p of the positive rationals, the images of the positive real ones). Let K/ℚ_l be finite and ρ : G_K → GSp₄(Q̄_p) continuous with p ≠ l. L(ρ) is the set of isomorphism classes of irreducible smooth Q̄_p-representations π of GSp₄(K) with rec_{GT,p}(π ⊗ |ν|^{−3/2}) ≅ WD(ρ)^{F-ss}, where rec_{GT,p} is Gan–Takeda's correspondence (ML.4/gan-takeda-llc-gsp4 is its owner; it is registered here only through its use) conjugated by ı. For a Weil–Deligne representation (r, N), n((r, N)) is the rank of N; for π irreducible admissible of GL_n(K) (resp. GSp₄(K)), n(π) := n(rec(π)) (resp. n(rec_GT(π))). Boxer–Calegari–Gee–Pilloni use the ı-independence of L(ρ) only for unramified representations and for the rank of the monodromy of representations with Iwahori-fixed vectors.
Hypothesis: K/ℚ_l finite, p ≠ l; ı fixed; the twist |ν|^{−3/2} uses the square root of the residue cardinality q of K fixed by ı.
API [omitted] TauCeti.LanglandsRegister.GSp4.lPacketOf
  L(ρ) as a set of irreducible smooth Q̄_p-representations.
API [omitted] TauCeti.LanglandsRegister.GSp4.mem_lPacketOf
  π ∈ L(ρ) ↔ rec_{GT,p}(π ⊗ |ν|^{−3/2}) ≅ WD(ρ)^{F-ss}.
API [omitted] TauCeti.LanglandsRegister.GSp4.lPacketOf_twist
  L(ρ ⊗ χ) = L(ρ) ⊗ (χ ∘ Art ∘ ν) for a character χ.
API [omitted] TauCeti.LanglandsRegister.GSp4.lPacketOf_nonempty
  L(ρ) is non-empty and has 1 or 2 elements.
API [omitted] TauCeti.LanglandsRegister.monodromyRank
  n(π), the rank of the monodromy of rec(π) or rec_GT(π).
Test [omitted] TauCeti.LanglandsRegister.GSp4.lPacketOf_unramified
  For ρ unramified with ρ(Frob) of eigenvalues q^{3/2}·(α₁, α₂, α₃, α₄) (q the residue cardinality of K), L(ρ) is the unramified constituent of the principal series with Satake parameters (α_i).
Test [omitted] TauCeti.LanglandsRegister.monodromyRank_unramified
  For π unramified, n(π) = 0.
Test [omitted] TauCeti.LanglandsRegister.monodromyRank_steinberg
  For the Steinberg representation of GSp₄(K), n(π) = 3 (N regular nilpotent in GSp₄(ℂ)).
Test [omitted] TauCeti.LanglandsRegister.GSp4.lPacketOf_size_two
  For a tempered parameter with A_φ = ℤ/2ℤ, L(ρ) has two elements, exactly one of them generic: L(ρ) is not a singleton.
Source: bcgp-2021, Definition 2.3.1, §2.3 — independently checked downloaded PDF p.19; published-copy pagination where applicable
Source: bcgp-2021, Remark 2.3.2, §2.3, p. 19 (arXiv v3)
Source: bcgp-2021, §2.3, after Remark 2.3.3, p. 19 (arXiv v3)

## ModularityAndLanglandsExtensions:ML.1/imaginary-quadratic-elliptic-modularity
Assigned layer: ModularityAndLanglandsExtensions:ML.1
Declaration: TauCeti.WeightOne.ellipticCurve_modular_imagQuadratic
Prototype status: omitted
Supplier contracts: C-LOCAL-DEFORMATION
Let F be an imaginary quadratic field such that the Mordell–Weil group X₀(15)(F) is finite (for example F = ℚ(√−d), d = 1, 2, 3, 5). Then every elliptic curve E/F is modular: there is a cuspidal automorphic representation of GL₂(𝔸_F) of parallel weight 2 (or, when E has CM by a field embedding in F, an isobaric sum ψ ⊞ ψ^c of Hecke characters of F) whose L-function is L(E, s). More generally, if F is an imaginary CM field, Galois over ℚ with ζ₅ ∉ F, then 100% of Weierstrass equations over F, ordered by height, define modular elliptic curves.
Hypothesis: F imaginary quadratic with X₀(15)(F) finite (Theorem 1.1); F imaginary CM Galois over ℚ with ζ₅ ∉ F (Theorem 1.2).
Source: caraiani-newton-2023, §1, Theorem 1.1 (Corollary 7.1.2), p. 2 (arXiv:2301.10509v3)
Source: caraiani-newton-2023, §1, Theorem 1.2 (Corollary 6.1.2), p. 3 (arXiv:2301.10509v3)

## ModularityAndLanglandsExtensions:ML.1/strong-artin-conjecture
Assigned layer: ModularityAndLanglandsExtensions:ML.1
Declaration: TauCeti.WeightOne.IsAutomorphicArtin
Prototype status: omitted
Supplier contracts: C-ARTIN
For a continuous irreducible finite-image complex representation ρ:G_K→GL_n(ℂ), the strong Artin predicate requires a cuspidal π on GL_n(𝔸_K) with rec(π_v)≅ρ|_{W_{K_v}} at every place, including ramified and infinite ones, so full L- and epsilon-factors match. Godement–Jacquet then implies entireness for nontrivial ρ. Almost-everywhere matching is a separate weak Artin predicate: strong multiplicity one gives uniqueness of π, but does not repair missing bad Euler factors or imply entireness of the full Artin function.
Hypothesis: K a number field; ρ continuous, irreducible, n-dimensional over ℂ.
API [omitted] TauCeti.WeightOne.IsAutomorphicArtin
  ρ has a cuspidal π matching its local Weil parameter at every place (strong Artin), rather than merely outside a finite set.
API [omitted] TauCeti.WeightOne.IsAutomorphicArtin.lFunction_entire
  IsAutomorphicArtin ρ and ρ non-trivial ⇒ L(ρ, s) extends to an entire function.
API [omitted] TauCeti.WeightOne.IsAutomorphicArtin.of_iso
  Invariant under isomorphism of ρ.
API [omitted] TauCeti.WeightOne.IsAutomorphicArtin.twist
  IsAutomorphicArtin ρ ⇒ IsAutomorphicArtin (ρ ⊗ χ) for a finite-order character χ.
API [omitted] TauCeti.WeightOne.IsAutomorphicArtin.dim_one
  Every one-dimensional ρ is automorphic (class field theory).
API [omitted] TauCeti.WeightOne.IsAutomorphicArtin.unique
  The cuspidal π is unique (strong multiplicity one).
Test [omitted] TauCeti.WeightOne.artin_character
  For a finite-order Hecke character χ, its finite-image Galois character through global Artin reciprocity is automorphic with π=χ.
Test [omitted] TauCeti.WeightOne.artin_dihedral
  ρ = Ind_{G_L}^{G_ℚ} χ for L imaginary quadratic and χ ≠ χ^c is automorphic, with π the automorphic induction of χ (weight-one theta series).
Test [omitted] TauCeti.WeightOne.artin_reducible_not
  ρ = 1 ⊕ 1 is not irreducible: the matching representation 1 ⊞ 1 is isobaric, not cuspidal, and L(ρ, s) = ζ(s)² has a pole.
Test [omitted] TauCeti.WeightOne.artin_compat_deligneSerre
  For f a weight-one newform, the Deligne–Serre representation ρ_f (AutomorphicGaloisRepresentations R19.1) is automorphic with π = π_f.
Source: kw-2009-I, §10.2 — independently checked downloaded PDF p.20; published-copy pagination where applicable
Source: kw-2009-I, §10.2, PDF/printed p.20 (author copy results.pdf)

## ModularityAndLanglandsExtensions:ML.2/cg18-conditional-potential-modularity
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.cg18_potentialModularity
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
Assume Calegari–Geraghty's Conjecture B (the existence of Galois representations with the expected characteristic polynomials for the torsion Hecke algebras T^an_{Q,ψ} of the locally symmetric spaces of Res_{F/ℚ}PGL(n)). Let F be any number field and E/F an elliptic curve. Then E is potentially modular. Status: conditional (ML.0/endpoint-status-register); Conjecture B is imported from the proposed PotentialAutomorphyInfrastructure Part II and is not proved anywhere in the atlas.
Hypothesis: Hypothesis: Conjecture B (status conjectural). F arbitrary; E arbitrary.
Source: cg-2018, Theorem 1.1(1), §1, p. 3 (arXiv v2) = Invent. p. 300; proof §10, pp. 96–98 (arXiv v2) = Invent. pp. 428–429
Source: cg-2018, Theorem 1.1(1), §1, p. 3 (arXiv v2) = Invent. p. 300; proof §10, pp. 96–98 (arXiv v2) = Invent. pp. 428–429

## ModularityAndLanglandsExtensions:ML.2/compatible-system-l-function-continuation
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.lFunction_meromorphic
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
Under the hypotheses of Corollary 5.4.2: (1) for ı : M ↪ ℂ, L^S(ıℛ, s) converges uniformly absolutely on compact subsets of a right half plane and continues meromorphically to ℂ; (2) ℛ is strictly pure and Λ(ıℛ, s) = ε(ıℛ, s)Λ(ıℛ^∨, 1 − s); (3) if F is totally real, n is odd and v | ∞, then tr r_λ(c_v) = ±1 is independent of λ.
Hypothesis: (ℛ, ℳ) a polarized weakly compatible system of G_F over M (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1 conventions.
Source: blggt-2014-v4, §5.4, Corollary 5.4.3 and proof, pp. 74–75 (arXiv v4)

## ModularityAndLanglandsExtensions:ML.2/elliptic-symmetric-power-seed
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.ellipticSeed
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
In the situation of ML.2/qian-auxiliary-prime there are a finite Galois F_2^avoid/ℚ and a finite totally real Galois F^suff/ℚ unramified above the prime divisors of N, with F_2^avoid ∩ F^avoid = ℚ, F^suff ∩ F^avoid F_2^avoid = ℚ, ℚ̄^{ker r̄_{E,l′}} ⊂ F_2^avoid, F^avoid and F_2^avoid unramified above N, such that for every finite totally real F′/F^suff with F′ ∩ F_2^avoid = ℚ, Sym^{n−1} r_{E,l′}|_{G_{F′}} is automorphic.
Hypothesis: E/ℚ non-CM; l′ as in ML.2/qian-auxiliary-prime.
Source: qian-2023, Proposition 4.1 (second list and final assertion), §4, p. 21; proof p. 22 (arXiv v1); Invent. pp. 1269–1270 per routed locator

## ModularityAndLanglandsExtensions:ML.2/irreducibility-density-one
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.irreducible_density_one
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
Let F be CM and π a regular algebraic, polarizable, cuspidal automorphic representation of GL_n(𝔸_F) of extremely regular weight. Then there is a set L of rational primes of Dirichlet density 1 such that r_{l,ı}(π) is irreducible for every l ∈ L and ı : Q̄_l ≅ ℂ.
Hypothesis: F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı : Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1) ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).
Source: blggt-2014-v4, §5.5, Theorem 5.5.2 and proof, pp. 81–82 (arXiv v4)

## ModularityAndLanglandsExtensions:ML.2/part-of-compatible-system
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.exists_compatibleSystem
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
Let F be CM, l ≥ 2(n + 1) with ζ_l ∉ F, and (r, µ) an n-dimensional totally odd regular algebraic polarized l-adic representation of G_F, potentially diagonalizable above l with r̄|_{G_{F(ζ_l)}} irreducible. Then r is part of a strictly pure compatible system of l-adic representations of G_F.
Hypothesis: F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı : Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1) ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).
Source: blggt-2014-v4, §5.5, Theorem 5.5.1 and proof, pp. 79–81 (arXiv v4)

## ModularityAndLanglandsExtensions:ML.3/acc-purity-rank-two
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.acc_purity
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
ACC+ Corollary 7.1.13: for a CM field F and an irreducible rank-2 very weakly compatible system R with H_τ={0,1}, R is pure of weight 1. For every m≥0 the partial symmetric-power L-function has meromorphic continuation and the completed function with the stated degree≤m+1 bad factors satisfies a functional equation. If R is strongly irreducible and m>0, then L^S(ι Sym^m R,s) is holomorphic and nonzero for Re s≥1+m/2. The m=0 function has the Dedekind-zeta pole at s=1; it is not covered by nonvanishing/holomorphy. The non-CM elliptic-curve specialization supplies Sato–Tate with its compact-group criterion.
Hypothesis: F CM; R irreducible of rank 2 with Hodge–Tate numbers {0, 1}.
Source: acc-2023, §7.1, Corollary 7.1.13, arXiv v2 p. 201 (Annals p. 1096)
Source: acc-2023, §7.1, proof of Corollary 7.1.13, arXiv v2 p. 202 (Annals p. 1097)

## ModularityAndLanglandsExtensions:ML.3/bcgnt-potential-automorphy-det-cyclotomic
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.bcgnt_detCyclotomic
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Let F be an imaginary CM field and R a strongly irreducible very weakly compatible system of rank 2 of G_F with H_τ = {0, m} (m ≥ 1) and det r_λ = ε^{−m}. Then R is pure of weight m, and for each n ≥ 1 there is a finite CM extension F_n/F, Galois over ℚ, such that Sym^{n−1}R|_{G_{F_n}} is automorphic. For m = 1 the argument simplifies to ACC+ Corollary 7.1.12 (Remark 6.2.2). Here automorphic has BCGNT Definition 6.1.2(2): all finite v outside S are unramified and match the common characteristic polynomial. Matching at the bad places is a separate requirement.
Hypothesis: As stated.
Source: bcgnt-2025, Theorem 6.2.1 and proof, Remark 6.2.2, §6.2, arXiv v3 pp. 59–60 (published p. 53); ACC+ inputs also in the proof of Theorem 7.1.1, arXiv p. 69 (published p. 61)

## ModularityAndLanglandsExtensions:ML.3/kim-shahidi-sym3
Assigned layer: ModularityAndLanglandsExtensions:ML.1
Declaration: TauCeti.Functoriality.kimShahidi
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-ARTIN
Let F be a number field, π a cuspidal automorphic representation of GL₂(𝔸_F) and σ one of GL₃(𝔸_F). Then the functorial product π ⊠ σ exists as an automorphic representation of GL₆(𝔸_F), and Sym³π exists as an automorphic representation of GL₄(𝔸_F); Sym³π is cuspidal unless π is dihedral or tetrahedral (Ad(π) ≅ Ad(π) ⊗ χ for a cubic χ).
Hypothesis: F a number field; π cuspidal on GL₂(𝔸_F), σ cuspidal on GL₃(𝔸_F).
Source: newton-thorne-I, Introduction, 'Context', p. 1 (arXiv:1912.11261v3)
Source: kim-shahidi-2002, Introduction, Theorem A, p. 838 (= Theorem 5.1) (Ann. of Math. 155; arXiv:math/0409607v1)
Source: kim-shahidi-2002, Introduction, Theorem B, PDF pp.2–3 (printed pp.838–839)

## ModularityAndLanglandsExtensions:ML.3/symmetric-power-lift-over-number-fields
Assigned layer: ModularityAndLanglandsExtensions:ML.1
Declaration: TauCeti.SymmetricPower.SymPowerExists
Prototype status: omitted
Supplier contracts: C-AUTOMORPHIC
Let F be a number field, π a cuspidal automorphic representation of GL₂(𝔸_F) and n ≥ 1. Sym^{n−1}π exists if there is an automorphic representation Π of GL_n(𝔸_F) with rec_{F_v}(Π_v) ≅ Sym^{n−1} ∘ rec_{F_v}(π_v) for every place v (ML.3/functorial-lift with R = Sym^{n−1}). For F totally real and π regular algebraic (classical Hilbert, weights ≥ 2 of constant parity) and non-CM, Clozel–Thorne phrase it Galois-theoretically: there is a regular algebraic cuspidal Π with Sym^{n−1} r_l(π) ≅ r_l(Π) for every l; ML.3/one-prime-criterion shows the two agree. The historical ℚ spelling is its specialization, not a prerequisite.
Hypothesis: F a number field; π cuspidal on GL₂(𝔸_F).
API [omitted] TauCeti.SymmetricPower.SymPowerExists
  ∃ Π with rec(Π_v) ≅ Sym^{n−1} ∘ rec(π_v) at all v.
API [omitted] TauCeti.SymmetricPower.SymPowerExists.one
  n = 1: Sym⁰π is the trivial character.
API [omitted] TauCeti.SymmetricPower.SymPowerExists.two
  n = 2: Sym¹π = π.
API [omitted] TauCeti.SymmetricPower.SymPowerExists.iff_galois
  For π RAESDC non-CM over totally real F: SymPowerExists π n ↔ Sym^{n−1} r_{π,ι} automorphic for one (every) ι.
API [omitted] TauCeti.SymmetricPower.SymPowerExists.baseChange
  For soluble L/F, if Sym^{n−1}π exists and BC_{L/F}(π) remains cuspidal, then Sym^{n−1}BC_{L/F}(π) exists. When base change is noncuspidal, use the explicitly extended isobaric-domain predicate and its constituent operations, rather than applying the cuspidal-domain definition.
Test [omitted] TauCeti.SymmetricPower.symPowerExists_three
  n = 3: Sym²π exists for every cuspidal π (Gelbart–Jacquet), cuspidal iff π is not dihedral.
Test [omitted] TauCeti.SymmetricPower.symPowerExists_cm_not_cuspidal
  For π = AI(θ) dihedral, Sym²π exists but is not cuspidal; existence does not mean cuspidality.
Test [omitted] TauCeti.SymmetricPower.symPowerExists_Q
  For F = ℚ it agrees with ML.3/symmetric-power-lifting.
Source: ct-2017, §1 Introduction, manuscript p. 2

## ModularityAndLanglandsExtensions:ML.5/automorphic-induction-register
Assigned layer: ModularityAndLanglandsExtensions:ML.5
Declaration: TauCeti.Functoriality.knownTransfers
Prototype status: omitted
Supplier contracts: C-AUTOMORPHIC, C-GALOIS
Registers, with their owners and hypotheses, the transfers this roadmap's endpoints use but does not plan: automorphic induction AI_{L/F} from GL_m(𝔸_L) to GL_{md}(𝔸_F) for cyclic L/F of degree d (Arthur–Clozel; owner EndoscopicTransferAndUnitaryTraceComparison ET.7a) with the cuspidality criterion (AI(π) cuspidal iff π has full Galois orbit, i.e. π is not isomorphic to π^σ for any nonidentity σ∈Gal(L/F)); the rank-two monomial case and Langlands–Tunnell's soluble Artin modularity (owner GL2AutomorphicRepresentationsAndTransfer R17.5, by the accepted restructuring RS-21); GL₂ cyclic and soluble base change (owner R17.4, RS-21); and GL_n cyclic base change (ML.5/cyclic-base-change-gln, resting on ET.7a). No general functorial transfer is inferred from these cases.
Hypothesis: Registry node.
Source: arthur-2003, §4, Conjecture (Langlands [L1]) for G′ = {1}, p. 45 (Bull. AMS 40 (2003))

## ModularityAndLanglandsExtensions:ML.5/functoriality-conjecture
Assigned layer: ModularityAndLanglandsExtensions:ML.5
Declaration: TauCeti.Functoriality.Functoriality
Prototype status: omitted
Supplier contracts: C-AUTOMORPHIC
Let F be a global field, G, G′ connected reductive groups over F with G quasi-split, and ρ : ᴸG′ → ᴸG an L-homomorphism (compatible with the projections to the Galois group). Functoriality(G′, G, ρ) is the proposition: for every automorphic representation π′ of G′(𝔸_F) there is an automorphic representation π of G(𝔸_F) with c_v(π) = ρ(c_v(π′)) (Satake parameters) for all places v outside a finite set where π and π′ are unramified. The refined form asks local compatibility through local Langlands at every place. The statement is a conjecture; this roadmap uses it only as a named hypothesis of conditional implications, and its known cases are the theorem nodes of ML.5.
Hypothesis: G quasi-split; ρ an L-homomorphism; frontier statement with status conjectural in ML.0/endpoint-status-register.
API [omitted] TauCeti.Functoriality.Functoriality
  The proposition Functoriality(G′, G, ρ).
API [omitted] TauCeti.Functoriality.Functoriality.comp
  Functoriality(G′, G, ρ) and Functoriality(G, G″, ρ′) imply Functoriality(G′, G″, ρ′ ∘ ρ) (weak form).
API [omitted] TauCeti.Functoriality.Functoriality.id
  Functoriality(G, G, id) holds.
API [omitted] TauCeti.Functoriality.Functoriality.of_gelbartJacquet
  Gelbart–Jacquet supplies the cuspidal GL₂ case of the Sym² weak functoriality assertion. Extension to noncuspidal isobaric GL₂ inputs uses the direct-sum/Hecke-character transfer and automorphic isobaric assembly; it is not an extra assertion of the cuspidal theorem.
API [omitted] TauCeti.Functoriality.Functoriality.sym
  General symmetric-power functoriality for arbitrary cuspidal GL₂ representations remains a frontier assertion. ML.3 proves the specified regular algebraic, Hilbert discrete-series and monomial/weight-one cases, rather than this unrestricted assertion.
Test [omitted] TauCeti.Functoriality.functoriality_trivialGroup
  G′ = {1}, G = GL₁: Functoriality is the statement that the trivial character is automorphic (true).
Test [omitted] TauCeti.Functoriality.functoriality_det
  G′ = GL_n, G = GL₁, ρ = det: Functoriality holds, the lift of π being ω_π.
Test [omitted] TauCeti.Functoriality.functoriality_reciprocity
  For G′={1}, the domain L-group is W_F (with the finite quotient Gal(E/F) through which r factors), and the L-homomorphism is w↦(r(w),w). Weak functoriality asks almost-everywhere Artin matching. All-place compatibility is the separate strong refinement.
Test [omitted] TauCeti.Functoriality.functoriality_not_from_parameters
  For GL₁ the proposed map (z,w)↦(z,1) on ℂ^××W_F fails the projection-to-W_F condition. A map on dual-group parameters alone cannot be accepted as the L-homomorphism input of Functoriality.
Source: arthur-2003, §4, Conjecture (Langlands [L1]), pp. 44–45 (Bull. AMS 40 (2003))

## ModularityAndLanglandsExtensions:ML.5/grs-descent
Assigned layer: ModularityAndLanglandsExtensions:ML.5
Declaration: TauCeti.Functoriality.grsDescent
Prototype status: omitted
Supplier contracts: C-AUTOMORPHIC, C-GALOIS
Let F be a number field and φ = τ₁ ⊞ ⋯ ⊞ τ_r a generic global parameter for the split group SO_{2n+1}: τ_i pairwise non-isomorphic unitary self-dual cuspidal representations of GL_{n_i}(𝔸_F) of symplectic type, Σ n_i = 2n. The automorphic descent (a Fourier–Jacobi or Bessel coefficient of the residual Eisenstein representation E_τ with parameter (τ₁, 2) ⊞ ⋯ ⊞ (τ_r, 2)) is a non-zero cuspidal globally generic automorphic representation π₀ of SO_{2n+1}(𝔸_F) whose functorial lift to GL_{2n} is τ₁ ⊞ ⋯ ⊞ τ_r; it is irreducible (Jiang–Soudry) and is the generic member of the global packet Π̃_φ. The analogous descents for the other quasi-split classical groups give non-zero cuspidal generic representations whose structure depends on the uniqueness of local Bessel models over Vogan packets.
Hypothesis: F a number field; φ generic for split SO_{2n+1}.
Source: jiang-zhang-2020, §1.1, p. 6 (arXiv v4); published p. 744
Source: jiang-zhang-2020, §7.2, p. 75 (arXiv v4); published p. 809

## ModularityAndLanglandsExtensions:ML.5/local-descent-mp2n
Assigned layer: ModularityAndLanglandsExtensions:ML.5
Declaration: TauCeti.Functoriality.localDescent_mp
Prototype status: omitted
Supplier contracts: C-AUTOMORPHIC, C-GALOIS
(Local descent) For F_v local and τ_v an irreducible square-integrable representation of GL_{2n}(F_v) with L(s, τ_v, ∧²) having a pole at s = 0, the descent π_v of τ_v to Mp_{2n}(F_v) relative to ψ_v (Ginzburg–Rallis–Soudry; Ichino–Lapid–Mao Theorem 3.1) is irreducible, genuine, ψ_v-generic and square-integrable. (Proposition A.1) Given a number field F, a non-empty finite set S of non-archimedean places, v₀ ∉ S non-archimedean and such τ_v for v ∈ S ∪ {v₀} with τ_{v₀} supercuspidal, there is an irreducible cuspidal T on GL_{2n}(𝔸_F) with T_v = τ_v there, T_v principal series at the other finite places outside S_∞, L(s, T, ∧²) having a pole at s = 1 and L(1/2, T) ≠ 0.
Hypothesis: As stated; Gan–Ichino's Proposition A.2 needs θ_{ψ_{v₀}}(π_{v₀}) supercuspidal (their extraction's E7).
Source: gan-ichino-2018, Appendix A, proof of Proposition A.1, pp. 29–30 (arXiv v3); published pp. 1001–1002
Source: gan-ichino-2018, Appendix A, proof of Proposition A.1, p. 30 (arXiv v3); published p. 1002

## ModularityAndLanglandsExtensions:ML.5/local-langlands-conjecture-general
Assigned layer: ModularityAndLanglandsExtensions:ML.5
Declaration: TauCeti.Functoriality.LocalLanglands
Prototype status: omitted
Supplier contracts: C-AUTOMORPHIC, C-GALOIS
LLC(G, F_v) is the proposition: for G quasi-split over a local field F_v there is a surjective finite-to-one map π ↦ φ_π from irreducible admissible smooth representations of G(F_v) in the nonarchimedean case, and irreducible admissible (𝔤,K)-modules in the archimedean case to Ĝ-conjugacy classes of L-parameters φ : L_{F_v} → ᴸG (L_{F_v} = W_{F_v} archimedean, W_{F_v} × SU(2) non-archimedean), compatible with central characters, twisting, parabolic induction and the L- and ε-factors wherever the relevant local-factor theory is supplied, bijective for GL_n. Known: archimedean F_v (Langlands); GL_n (Harris–Taylor, Henniart, Scholze); quasi-split classical groups (ML.4/local-arthur-packets, conditionally); GSp₄ (ML.4/gan-takeda-llc-gsp4).
Hypothesis: Frontier statement; status conjectural except in the listed cases.
Hypothesis: Known GL_n finite-place exports are for characteristic-zero local fields in ET.6. General residual/archimedean fields need their own stated source scope; the GSp₄ factor characterization distinguishes generic and nongeneric supercuspidal representations.
API [omitted] TauCeti.Functoriality.LocalLanglands
  The proposition LLC(G, F_v).
API [omitted] TauCeti.Functoriality.LocalLanglands.gl
  LLC for GL_n over characteristic-zero nonarchimedean local fields is the ET.6 export (Harris–Taylor, Henniart); other field scopes require their own separately checked export.
API [omitted] TauCeti.Functoriality.LocalLanglands.archimedean
  LLC(G, ℝ) holds (Langlands).
API [omitted] TauCeti.Functoriality.LocalLanglands.gsp4
  LLC for GSp₄ over characteristic-zero nonarchimedean local fields is Gan–Takeda’s correspondence with its exact generic, nongeneric and Plancherel characterization.
Test [omitted] TauCeti.Functoriality.llc_torus
  G = GL₁: LLC is local class field theory (Hom(F_v^×, ℂ^×) ≅ Hom(W_{F_v}, ℂ^×)).
Test [omitted] TauCeti.Functoriality.llc_sl2_not_injective
  For G = SL₂ the map is not injective: L-packets of size 2 and 4 occur (ML.4/extended-langlands-parameter).
Test [omitted] TauCeti.Functoriality.llc_gl2_unramified
  For GL₂ and an unramified principal series χ₁ × χ₂, φ = χ₁ ⊕ χ₂ through Art^{−1}.
Source: arthur-2003, §5, p. 47 (Bull. AMS 40 (2003))

## ModularityAndLanglandsExtensions:ML.0/regular-weight-serre-implies-abelian-surface-modularity
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.LanglandsRegister.abelianSurface_modular_of_serre
Prototype status: omitted
Supplier contracts: C-ARTHUR, C-AUTOMORPHIC
Suppose that for every prime p and every ρ̄ : G_ℚ → GSp₄(F̄_p) with multiplier ε̄^{−1}, absolutely irreducible, and with (ρ̄|_{G_{ℚ_p}})^{ss} a direct sum of characters, there is an ordinary cuspidal automorphic representation π of GSp₄/ℚ of regular weight, level prime to p and central character |·|² with ρ̄_{π,p} ≅ ρ̄. Then every abelian surface A/ℚ is modular. (Remark 10.4.2: the hypothesis may be weakened, e.g. to p sufficiently large.) This is a conditional endpoint: its hypothesis is a conjecture.
Hypothesis: Hypothesis: the regular-weight Serre statement above (status conjectural); the proof also uses Arthur's classification through BCGP's main theorems (ML.0/arthur-dependency-gate).
Source: bcgp-2025, Lemma 10.4.1, §10.4, p. 222 (arXiv v1)
Source: bcgp-2025, Remark 10.4.2, p. 222 (arXiv v1)

## ModularityAndLanglandsExtensions:ML.0/weight-22-abelian-variety-conjecture
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.LanglandsRegister.WeightTwoTwoConjecture
Prototype status: omitted
Supplier contracts: C-COHERENT-GEOMETRY
WeightTwoTwoConjecture is the proposition: for every stable general-type cuspidal Siegel modular eigenform of genus 2 and weight (2, 2) over ℚ (in Calegari–Geraghty's normalisation) there are a totally real field E of degree n and an abelian variety M/ℚ of dimension 2n with E ↪ End_ℚ(M) ⊗ ℚ whose λ-adic Galois representations, restricted to the E-eigenspaces, are those of the eigenform. Status: conjectural; Calegari–Geraghty state it as a heuristic (§5.4) suggesting that residual representations of type U₃ at x with σ = (2, 2) admit no minimal lifts, and no proof uses it.
Hypothesis: The stable/general-type qualification excludes CAP and endoscopic systems with rank-one constituents. The source is a heuristic, not a theorem; the precise Galois/abelian comparison is this roadmap’s frontier specification.
API [omitted] TauCeti.LanglandsRegister.WeightTwoTwoConjecture
  The proposition stated.
API [omitted] TauCeti.LanglandsRegister.WeightTwoTwoConjecture.dim
  Under the conjecture, dim M = 2[E : ℚ].
API [omitted] TauCeti.LanglandsRegister.WeightTwoTwoConjecture.semistable_unipotent
  Under the conjecture, inertia at a semistable prime acts with (σ − 1)² = 0 (Grothendieck), so type U₃ cannot occur.
Test [omitted] TauCeti.LanglandsRegister.weight22_status
  A proposed eigenform realization must return an abelian variety of dimension 2[E:ℚ] and four-dimensional E_λ-eigenspaces, rather than a two-dimensional total Tate module.
Test [omitted] TauCeti.LanglandsRegister.weight22_E_eq_Q
  n = 1: the statement is that weight (2, 2) eigenforms with rational eigenvalues come from abelian surfaces over ℚ.
Test [omitted] TauCeti.LanglandsRegister.weight22_not_proved
  A minimal local lift with a size-three unipotent block, (σ−1)²≠0 persisting after finite extension, cannot be the H¹ of an abelian variety with semistable reduction: Grothendieck’s square-zero inertia condition fails.
Source: cg-2020, §5.4 'Torsion classes', publ. p. 831; quoted from arXiv v1 §5.4 p. 24 — independently checked downloaded PDF p.31; published-copy pagination where applicable

## ModularityAndLanglandsExtensions:ML.1/odd-artin-modularity-over-q
Assigned layer: ModularityAndLanglandsExtensions:ML.1
Declaration: TauCeti.WeightOne.oddArtin_modular_Q
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-ARTIN
Every continuous odd irreducible ρ : G_ℚ → GL₂(ℂ) arises from a newform of weight one, hence satisfies Langlands' conjecture (ML.1/strong-artin-conjecture) and Artin's conjecture. The soluble cases (projective image dihedral, A₄, S₄) are Langlands–Tunnell (owner GL2AutomorphicRepresentationsAndTransfer R17.5, RS-21); the new case, projective image A₅, is Khare–Wintenberger Corollary 10.2(ii), proved and exported by ClassicalSerreModularity R27.6/odd-artin-weight-one-modularity. This node registers the two owners and the consequence for the strong Artin conjecture; it does not reprove either, and it does not derive weight-one representations from weight-two Jacobians.
Hypothesis: ρ odd (det ρ(c) = −1), irreducible, over ℚ only. Even two-dimensional ρ (Maass forms) are not covered.
Source: kw-2009-I, Corollary 10.2(ii), §10.2, p. 21 (author copy results.pdf)
Source: kw-2009-I, §10.2, p. 21 (author copy results.pdf)
Source: cg-2020, Appendix §A.2 'Relation with special values of periods', publ. p. 883 (copy p. 83); appendix arXiv:1907.08694v1 §2 (not downloaded)

## ModularityAndLanglandsExtensions:ML.1/totally-real-odd-artin
Assigned layer: ModularityAndLanglandsExtensions:ML.1
Declaration: TauCeti.WeightOne.oddArtin_totallyReal
Prototype status: omitted
Supplier contracts: C-ARTIN
Let E be a totally real field and ϱ : G_E → GL₂(ℂ) a continuous irreducible totally odd representation (det ϱ(c) = −1 for every complex conjugation c), in particular one with projective image A₅. Then ϱ is automorphic: it arises from a Hilbert modular eigenform of parallel weight one (Pilloni–Stroh, Theorem 0.3), so ϱ satisfies Langlands' and Artin's conjectures. Boxer–Calegari–Gee–Pilloni apply it to a characteristic-zero totally odd lift with finite image (Tate) of a mod 3 representation ϱ̄₃ : G_E → GL₂(F₉) with projective image A₅ (printed G_F: recorded as a source issue).
Hypothesis: E totally real; ϱ:G_E→GL₂(ℂ) continuous, irreducible and of finite image; det ϱ(c_v)=−1 for every real place v. No unramified-at-p assumption is present in Pilloni–Stroh Theorem 0.3.
Source: bcgp-2021, Proof of Proposition 10.1.3, §10.1, p. 266 (arXiv v3)
Source: pilloni-stroh-2016, Theorem 0.3, §0, printed p. 2

## ModularityAndLanglandsExtensions:ML.2/compatible-system-from-potential-automorphy
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.compatibleSystem_of_potentiallyAutomorphic
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
Let F be totally real and ρ : Γ_F → GSp_{2n}(O′) geometric with Zariski-dense image such that ρ|_{Γ_{F′}} ≅ r_ι(Π_{F′}) for a RAESDC Π_{F′} of GL_{2n}(𝔸_{F′}), F′/F Galois totally real. Then ρ belongs to a strictly pure compatible system {ρ_{ι′}} of ℓ-adic representations of Γ_F indexed by primes ℓ and ι′ : ℂ ≅ Q̄_ℓ, each with Zariski-dense image in GSp_{2n}.
Hypothesis: As stated.
Source: fkp-2022, §9, proof of Proposition 9.1, arXiv v5 p. 43

## ModularityAndLanglandsExtensions:ML.2/decomposition-into-irreducible-systems
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.eq_sum_irreducible_systems
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
Let F be CM and ℛ a pure, extremely regular, totally odd, polarizable weakly compatible system of G_F. Then ℛ = ℛ_1 ⊕ ⋯ ⊕ ℛ_s with each ℛ_i an irreducible, strictly pure, totally odd, polarizable compatible system.
Hypothesis: (ℛ, ℳ) a polarized weakly compatible system of G_F over M (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1 conventions.
Source: blggt-2014-v4, §5.5, Theorem 5.5.3 and proof, p. 82 (arXiv v4)

## ModularityAndLanglandsExtensions:ML.2/dwork-fibre-automorphy-transport
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.dworkTransport
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
Let t∈F′ be the chosen Dwork point, with its fixed eigenprojector and realizations V_{λ,t}, V_{λ′,t}. The auxiliary-prime ordinary lifting theorem gives V_{λ′,t}≅r_{l′,ι′}(π) for a regular algebraic cuspidal π, after the Teichmüller character twist. At good places the eigenprojector gives a common Frobenius polynomial over ℚ(ζ_N), or its real subfield when n=2. Choose ι and ι′ to induce the same embedding of that coefficient field into ℂ, conjugating π if necessary. Then V_{λ,t}^{ss}≅r_{l,ι}(π). For the arbitrary semisimple residual input of Theorem 1.1, neither semisimplicity of V_{λ,t} nor ramified monodromy compatibility follows from this comparison. If its residual representation χ̄₁⊗r̄|G_{F′} is absolutely irreducible, as in Theorem 1.4, then V_{λ,t} is irreducible and the semisimplification may be removed.
Hypothesis: The Dwork point and auxiliary-prime lifting hypotheses of Qian §4; matched coefficient embeddings; the character twist is the actual Teichmüller lift used by the ordinary lifting output.
Source: qian-2023, §4, proof of Theorem 1.1, p. 24 (arXiv v1); Invent. pp. 1272–1273 per routed locator
Source: acc-2023, §6.1, Theorem 6.1.2, hypothesis (5), arXiv v2 p. 133 (Annals p. 1030)

## ModularityAndLanglandsExtensions:ML.2/multiple-product-l-functions
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.multipleProduct_meromorphic
Prototype status: omitted
Supplier contracts: C-GALOIS, C-SYSTEM, C-LOCAL-DEFORMATION
Let K ⊆ ℤ_{>0} be finite with the 2^{#K} partial sums of its elements distinct, and f_k (k ∈ K) non-CM newforms of weight k + 1 with automorphic π_k. Then there are a totally real Galois F/ℚ and a regular algebraic polarizable cuspidal Π on GL_{2^{#K}}(𝔸_F) with rec(Π_v|det|^{(1−2^{#K})/2}) = (⊗_k rec(π_{k,v|ℚ}|det|^{−1/2}))|_{W_{F_v}} for almost all v; in particular L(×_k π_k, s) continues meromorphically to ℂ.
Hypothesis: f_k non-CM; the partial-sum condition gives regularity of ⊗_k r_{k,λ}.
Source: blggt-2014-v4, §5.4, Corollary 5.4.4 and proof, pp. 75–76 (arXiv v4)

## ModularityAndLanglandsExtensions:ML.2/patrikis-taylor-l-function-consequences
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.patrikisTaylor_lFunction
Prototype status: omitted
Supplier contracts: C-SYSTEM
Let R = {r_ℓ} be a weakly compatible system of G_ℚ that is pure of weight w, regular and odd essentially self-dual. Then for distinct primes p, ℓ the Weil–Deligne representation WD_p(R) attached to r_ℓ is pure of weight w (Frobenius eigenvalues on gr_a of the monodromy filtration are p-Weil numbers of weight w + a), R is strictly compatible, and the completed L-function Λ(R, s) = L_∞(R, s) ∏_{p ∈ S} L(WD_p(R), s) L^S(R, s) has meromorphic continuation and satisfies Λ(R, s) = ε(R, s) Λ(R^∨, 1 − s).
Hypothesis: As in ML.2/patrikis-taylor-potential-automorphy.
Source: fsy-2022, §5.3.2, Corollary 5.39 ([44, Cor. 2.2 (ii)]), arXiv v5 p. 57
Source: fsy-2022, Remark 5.41, arXiv v5 p. 59
Source: patrikis-taylor-2015, Corollary 2.2, §2, p. 13

## ModularityAndLanglandsExtensions:ML.3/bcgnt-symmetric-powers-purity
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.bcgnt_theoremC
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Let F be a CM field and R a strongly irreducible very weakly compatible system of rank 2 of G_F with H_τ = {0, m}, m ≥ 1. Then R is pure of weight m and for each n ≥ 1 there is a finite CM F′/F, Galois over ℚ, with Sym^{n−1}R|_{G_{F′}} automorphic. If R is irreducible but not strongly irreducible, R is pure of weight m and each Sym^{n−1}R is a direct sum of automorphic compatible systems of dimension ≤ 2.
Hypothesis: F CM; R as stated.
Source: bcgnt-2025, Theorem 7.2.1 and proof, §7.2, arXiv v3 p. 69 (published pp. 61–62); Theorem C, §1, arXiv p. 4 (published p. 4)

## ModularityAndLanglandsExtensions:ML.3/cg18-conditional-sato-tate
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.cg18_satoTate
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Assume Calegari–Geraghty's Conjecture B. Let F be any number field and E/F a non-CM elliptic curve. Then the Sato–Tate conjecture holds for E. Status: conditional (ML.0/endpoint-status-register).
Hypothesis: Hypothesis: Conjecture B.
Source: cg-2018, Theorem 1.1(2), §1, p. 3 (arXiv v2) = Invent. p. 300; reduction in §10, p. 97 (arXiv v2) = Invent. p. 428

## ModularityAndLanglandsExtensions:ML.3/kim-sym4
Assigned layer: ModularityAndLanglandsExtensions:ML.1
Declaration: TauCeti.Functoriality.kim_exteriorSquare
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-ARTIN
Let F be a number field. (a) For Π cuspidal on GL₄(𝔸_F), ∧²Π exists as an automorphic representation of GL₆(𝔸_F) (Kim 2003, with local compatibility at the places over 2 and 3 completed by Henniart 2009, so that ∧²Π is a functorial lift in the sense of ML.3/functorial-lift at every place). (b) For π cuspidal on GL₂(𝔸_F), Sym⁴π exists as an automorphic representation of GL₅(𝔸_F) (Kim 2003), cuspidal unless π is dihedral, tetrahedral or octahedral (Kim–Shahidi).
Hypothesis: F a number field.
Source: bcgp-2021, Proof of Theorem 9.3.1, §9.3, p. 258 (arXiv v3)
Source: gee-taibi-2019, §1.1, p. 2 (arXiv v1)
Source: kim-2003, §1, Theorem A, p. 139 (= Theorem 5.3.1) (J. Amer. Math. Soc. 16)
Source: kim-2003, Introduction, Theorem B, PDF p.2 (printed p.140)

## ModularityAndLanglandsExtensions:ML.3/large-residual-image-density-one
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.largeImage
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Let E be an imaginary CM field and π a RACSDC automorphic representation of GL₂(𝔸_E) with Sym²π cuspidal. Then there is a set L of rational primes of Dirichlet density one such that for all l ∈ L and ι : Q̄_l ≅ ℂ, r̄_ι(π) is irreducible with image containing a conjugate of SL₂(F_l).
Hypothesis: E imaginary CM; π RACSDC with Sym²π cuspidal.
Source: ct-2017, §7, Lemma 7.5 and proof, manuscript p. 48

## ModularityAndLanglandsExtensions:ML.3/one-prime-criterion
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.onePrime
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Let F be totally real and π a non-CM RAESDC automorphic representation of GL₂(𝔸_F) (π ≇ π ⊗ (χ ∘ det) for every non-trivial Hecke character χ), and n ≥ 1. The following are equivalent: (1) there is a cuspidal Π of GL_n(𝔸_F) with rec(Π_v) ≅ Sym^{n−1} ∘ rec(π_v) for every place v; (2) for every prime p and ι : Q̄_p ≅ ℂ, Sym^{n−1} r_{π,ι} is automorphic; (3) for some p and ι, Sym^{n−1} r_{π,ι} is automorphic (ML.0/nt26-automorphy-predicate).
Hypothesis: F totally real; π non-CM RAESDC.
Source: nt-2026, Lemma 2.1, §2, p. 9; proof pp. 9–10 (arXiv v2)

## ModularityAndLanglandsExtensions:ML.3/sp-statement
Assigned layer: ModularityAndLanglandsExtensions:ML.1
Declaration: TauCeti.SymmetricPower.SP
Prototype status: omitted
Supplier contracts: C-AUTOMORPHIC
For n ≥ 1, SP_n is the proposition: for every totally real field F and every cuspidal regular algebraic automorphic representation π of GL₂(𝔸_F) without CM, the lift Sym^{n−1}π exists as a RAESDC automorphic representation of GL_n(𝔸_F), in any of the equivalent senses of ML.3/one-prime-criterion. (Every cuspidal regular algebraic π of GL₂ over a totally real field is RAESDC.) Newton–Thorne prove SP_n for all n (ML.3/all-regular-symmetric-powers).
Hypothesis: n ≥ 1.
API [omitted] TauCeti.SymmetricPower.SP
  The proposition SP_n.
API [omitted] TauCeti.SymmetricPower.SP.one
  SP 1 holds.
API [omitted] TauCeti.SymmetricPower.SP.two
  SP 2 holds.
API [omitted] TauCeti.SymmetricPower.SP.of_le_five
  SP n for n ≤ 5 (low-rank transfers).
API [omitted] TauCeti.SymmetricPower.SP.all
  SP n for all n (Newton–Thorne Theorem 6.4).
Test [omitted] TauCeti.SymmetricPower.SP_one
  SP 1: Sym⁰π is the trivial character, cuspidal on GL₁.
Test [omitted] TauCeti.SymmetricPower.SP_three
  SP 3 is Gelbart–Jacquet's theorem for non-CM π.
Test [omitted] TauCeti.SymmetricPower.SP_cm_excluded
  SP_n says nothing about CM π, whose symmetric powers (n ≥ 3) are not cuspidal.
Source: nt-2026, Conjecture B, §1 (Introduction), p. 3 (arXiv v2); restated after Theorem 3.2, p. 13

## ModularityAndLanglandsExtensions:ML.3/symmetric-power-lifting
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.SymPowerLift
Prototype status: omitted
Supplier contracts: C-AUTOMORPHIC
For π cuspidal on GL₂(𝔸_ℚ) and n ≥ 1, a symmetric power lifting Sym^{n−1}π is an automorphic representation Π of GL_n(𝔸_ℚ) with rec(Π_v) ≅ Sym^{n−1} ∘ rec(π_v) for every place v (local Langlands for GL₂ and GL_n). For π regular algebraic and non-CM, Sym^{n−1}π exists as a regular algebraic cuspidal representation iff Sym^{n−1}r_{π,ι} is automorphic in the sense of PotentialAutomorphyInfrastructurePartII:PL.0/automorphic-polarized-representation for one (equivalently every) p and ι : Q̄_p ≅ ℂ (strong multiplicity one, Chebotarev density and local–global compatibility); for CM π or weight-one π the lifting is isobaric and usually not cuspidal.
Hypothesis: π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 1.
API [omitted] TauCeti.SymmetricPower.SymPowerLift
  Π on GL_n(𝔸_ℚ) with rec(Π_v) ≅ Sym^{n−1} ∘ rec(π_v) at every v.
API [omitted] TauCeti.SymmetricPower.SymPowerLift.of_galois
  Sym^{n−1}r_{π,ι} automorphic ⇒ Sym^{n−1}π exists (regular algebraic, cuspidal for non-CM π).
API [omitted] TauCeti.SymmetricPower.SymPowerLift.unique
  Unique up to isomorphism (strong multiplicity one).
API [omitted] TauCeti.SymmetricPower.SymPowerLift.twist
  Sym^{n−1}(π ⊗ χ) = Sym^{n−1}π ⊗ χ^{n−1}.
API [omitted] TauCeti.SymmetricPower.SymPowerLift.lFunction
  L^S(Sym^{n−1}π, s) = L^S(Π, s) for S containing the archimedean places; for n ≥ 2 and Π cuspidal the finite L-function is entire (Godement–Jacquet).
Test [omitted] TauCeti.SymmetricPower.sym1
  n = 2: Sym¹π = π.
Test [omitted] TauCeti.SymmetricPower.gelbart_jacquet
  n = 3: Sym²π is the Gelbart–Jacquet lift (the adjoint lift twisted by the central character).
Test [omitted] TauCeti.SymmetricPower.cm_not_cuspidal
  π = automorphic induction of a Hecke character ψ of an imaginary quadratic K: Sym²π = Ind ψ² ⊞ ψ|_{𝔸_ℚ^×}, not cuspidal (the η_K factor belongs to Ad(π), not Sym²π).
Test [omitted] TauCeti.SymmetricPower.degenerate_n1
  n = 1: Sym⁰π is the trivial character.
Source: newton-thorne-I, Introduction, p. 1 (arXiv v3)

## ModularityAndLanglandsExtensions:ML.4/trace-formula-inputs-register
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.traceFormulaInputs
Prototype status: omitted
Supplier contracts: C-ARTHUR
Arthur's classification (ML.4/local-arthur-packets, ML.4/arthur-multiplicity-formula) and its unitary analogues (ML.4/mok-unitary-classification, ML.4/kmsw-inner-forms) rest on: (1) the invariant trace formula of G and the twisted trace formula of GL_N ⋊ θ (Arthur; owner AutomorphicSpectralTheory:AS.6 for the untwisted formula); (2) the stabilisation of the ordinary and of the twisted trace formula (Arthur; Mœglin–Waldspurger 2016); (3) the transfer of orbital integrals (Waldspurger) and the fundamental lemma (Ngô) with its twisted and weighted variants (Chaudouard–Laumon; the twisted weighted fundamental lemma); (4) the local intertwining relation (Arthur §2.4, proved by Arthur for quasi-split groups modulo [A25]–[A27] and by Atobe–Gan–Ichino–Kaletha–Mínguez–Shin in further cases). Each input is registered with its owner stage and its status: proved in print, announced, or open. No input is assumed proved because a related unitary or GL_N result is.
Hypothesis: The registry lists statements and owners; it proves nothing.
Source: bcgp-2021, §1.4.1, p. 14 (arXiv v3)

## ModularityAndLanglandsExtensions:ML.5/categorical-local-langlands-conjecture
Assigned layer: ModularityAndLanglandsExtensions:ML.5
Declaration: TauCeti.Functoriality.CategoricalLLC
Prototype status: omitted
Supplier contracts: C-CATEGORICAL
Fargues–Scholze Conjecture I.10.2. Let E be a nonarchimedean local field with residue characteristic p and cardinality q, ℓ≠p, and G quasi-split. Choose a Borel B, a generic character ψ:U(E)→O_L^× for an algebraic L/ℚ_ℓ, and √q∈O_L. If d=|π₀Z(G)|, put Λ=O_L[1/d]. Let W_ψ on the neutral stratum Bun_G^1 be the sheaf of c-Ind_{U(E)}^{G(E)}ψ. Extend the spectral action on W_ψ by colimits to Φ:Ind Perf^{qc}(Z¹(W_E,Ĝ)_Λ/Ĝ)→D_lis(Bun_G,Λ). Its canonical right adjoint is fully faithful on compact objects and induces the Perf(Z¹(W_E,Ĝ)_Λ/Ĝ)-linear equivalence D_lis(Bun_G,Λ)^ω≃D_coh,Nilp^{b,qc}(Z¹(W_E,Ĝ)_Λ/Ĝ). The target consists of bounded complexes with coherent cohomology, quasicompact support and nilpotent singular support. This is a conjecture about stable ∞-categories and a specified adjunction. The established semisimple parameter map does not supply it. The torus case is known in Zou Theorem 6.4.1 over ℤ_ℓ (ℓ≠p), using the canonical action on the unique Whittaker sheaf; Theorem 6.4.5 proves t-exactness and Remark 6.4.7 gives scalar extension. For tori the square-root choice is unnecessary. This known specialization does not settle the assertion for a general quasi-split group.
Hypothesis: Exactly the field, group, Whittaker, square-root and coefficient conditions in the statement. Inverting d is necessary for the spectral action constructed in the cited edition.
API [omitted] TauCeti.Functoriality.CategoricalLLC
  The canonical Whittaker spectral-action right adjoint induces the compact/coherent equivalence with the stated singular-support and coefficient conditions.
API [omitted] TauCeti.Functoriality.CategoricalLLC.implies_semisimple
  CatLLC is compatible with the semisimple parametrisation of Fargues–Scholze (part of the statement).
API [omitted] TauCeti.Functoriality.CategoricalLLC.torus
  Zou Theorem 6.4.1: for any E-torus T and ℓ≠p, the canonical Whittaker spectral-action functor identifies the bounded coherent quasicompact nilpotent-support side with compact D_lis(Bun_T,ℤ_ℓ). It is t-exact (6.4.5), extends by scalars (6.4.7), and needs no √q.
Test [omitted] TauCeti.Functoriality.catLLC_gl1
  For GL₁, Bun strata are indexed by ℤ. The canonical equivalence identifies a compact complex on a fixed degree stratum with a perfect complex on the corresponding character-gerbe weight piece; the parameter and Bernstein-center actions agree with local class field theory.
Test [omitted] TauCeti.Functoriality.catLLC_not_from_ss
  For GL₂, the Weil–Deligne data with r=|·|^{1/2}⊕|·|^{−1/2} and N=0 or N of rank one have the same semisimple Weil part and different monodromy. The categorical parameter/support interface must distinguish these points; the semisimple assignment alone cannot supply that distinction.
Test [omitted] TauCeti.Functoriality.catLLC_whittaker
  After Ind-completion or restriction to a connected component, the structure sheaf is sent to the Whittaker sheaf by Φ. Neither global sheaf is falsely required to have quasicompact support on all components.
Source: fargues-scholze-2021, §I.10, Conjecture I.10.2, p. 38 (arXiv:2102.13459v4)
Source: zou-2024, Theorems 6.4.1, 6.4.5 and Remark 6.4.7, pp. 25–27

## ModularityAndLanglandsExtensions:ML.5/global-langlands-reciprocity-conjecture
Assigned layer: ModularityAndLanglandsExtensions:ML.5
Declaration: TauCeti.Functoriality.Reciprocity
Prototype status: omitted
Supplier contracts: C-ARTIN
Reciprocity(F,n) is the strong Artin assertion: every continuous irreducible finite-image r:G_F→GL_n(ℂ) has a cuspidal π of GL_n(𝔸_F) whose local parameter at EVERY place matches r|_{W_{F_v}}. The weak assertion of almost-everywhere Satake matching is recorded separately and does not, by uniqueness alone, supply the bad factors. For nontrivial r the strong assertion implies entireness of its full Artin L-function; the trivial rank-one representation has the Dedekind-zeta pole. Its regular geometric ℓ-adic refinement is a separate frontier conjecture. Known cases used here: rank one through class field theory; the odd rank-two ℚ case through Langlands–Tunnell and Khare–Wintenberger; totally odd finite-image rank two over totally real fields through Pilloni–Stroh.
Hypothesis: Frontier statement; status conjectural in ML.0/endpoint-status-register.
API [omitted] TauCeti.Functoriality.Reciprocity
  The proposition Reciprocity(F, n).
API [omitted] TauCeti.Functoriality.Reciprocity.one
  Reciprocity(F, 1) holds (class field theory).
API [omitted] TauCeti.Functoriality.Reciprocity.of_functoriality
  The refined functoriality assertion for finite-image irreducible r, including all-place local compatibility and a cuspidal lift, implies the strong Reciprocity assertion. Weak matching alone is a distinct conclusion.
API [omitted] TauCeti.Functoriality.Reciprocity.implies_artin
  Strong Reciprocity for a NONTRIVIAL irreducible finite-image r implies entireness of the full Artin L-function by Godement–Jacquet. For r=1 the corresponding function is Dedekind zeta and has a pole.
Test [omitted] TauCeti.Functoriality.reciprocity_gl1
  n = 1: Reciprocity(F, 1) is Artin reciprocity.
Test [omitted] TauCeti.Functoriality.reciprocity_dihedral
  For K/ℚ quadratic and a finite-order character χ of G_K with χ≠χ^c, the irreducible Ind_{G_K}^{G_ℚ}χ corresponds to the cuspidal automorphic induction of the associated Hecke character.
Test [omitted] TauCeti.Functoriality.reciprocity_reducible_not_cuspidal
  For reducible r = χ₁ ⊕ χ₂ the matching π is the isobaric χ₁ ⊞ χ₂, not cuspidal: irreducibility is needed.
Source: arthur-2003, §4, Conjecture (Langlands [L1]) for G′ = {1}, p. 45 (Bull. AMS 40 (2003))

## ModularityAndLanglandsExtensions:ML.1/weight-one-separation-register
Assigned layer: ModularityAndLanglandsExtensions:ML.1
Declaration: TauCeti.WeightOne.scopeRegister
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-ARTIN
Registers the modularity endpoints of ML.1 with their scope: weight one over ℚ (ML.1/odd-artin-modularity-over-q, ML.1/irregular-systems-weight-one), weight one over totally real fields (ML.1/totally-real-odd-artin), residual modularity and prescribed weight-two lifts over totally real fields (ML.1/non-solvable-residual-modularity), and elliptic curves over imaginary quadratic and CM fields (ML.1/imaginary-quadratic-elliptic-modularity); and separates them from the weight-at-least-two GL₂/ℚ endpoints owned by ClassicalSerreModularity and EllipticCurveModularity. Weight-one representations are never derived from weight-two Jacobians, and no statement claims that all elliptic curves over arbitrary number fields are modular: over general F only potential modularity (ML.2) and Calegari–Geraghty's conditional statement (ML.2/cg18-conditional-potential-modularity) are registered.
Hypothesis: Registry node.
Source: kw-2009-I, §10.1, paragraph after Theorem 10.1, p. 20 (author copy results.pdf)

## ModularityAndLanglandsExtensions:ML.2/qian-residual-potential-automorphy
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.qian_residual
Prototype status: omitted
Supplier contracts: C-MODULI
Let F be a CM number field, F^av/F a finite extension, n ≥ 2, l a prime and r̄ : G_F → GL_n(F_{l^s}) a continuous semisimple representation. Then there is a finite CM Galois extension F′/F, linearly disjoint from F^av over F, such that r̄|_{G_{F′}} is ordinarily automorphic: it has a lift r ≅ r_{l,ι}(π) with π regular algebraic cuspidal on GL_n(𝔸_{F′}) and r|_{G_{F′_v}} potentially semistable and ordinary with regular Hodge–Tate weights for all v | l. No polarization, oddness or residual image hypothesis is imposed.
Hypothesis: F CM; r̄ semisimple, of any dimension n ≥ 2 and any residual characteristic l.
Source: qian-2023, Theorem 1.1, §1, p. 1 (arXiv v1); Invent. pp. 1239–1240 per routed locator; proof §4, pp. 21–24 (arXiv v1)

## ModularityAndLanglandsExtensions:ML.3/bianchi-ramanujan
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.bianchi_ramanujan
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Let F be an imaginary CM field and π a regular algebraic cuspidal automorphic representation of GL₂(𝔸_F) of parallel weight. Then π_v is essentially tempered at every finite place v. After the algebraic Hecke-character twist that makes the weight (k−2,0) at every embedding, with k≥2, its unramified rec^T Satake eigenvalues α_v,β_v have absolute value N(v)^((k−1)/2). In the untwisted statement write w=λ_{τ,1}+λ_{τc,2}; the eigenvalues of rec(π_v)(Frob_v), normalized by q_v^(−w/2), have absolute value one. Parallel weight determines the difference of the two λ-coordinates, not their sum before the twist.
Hypothesis: F imaginary CM; π cuspidal regular algebraic of parallel weight.
Source: bcgnt-2025, Theorem 7.1.1 and proof, §7.1, arXiv v3 pp. 68–69 (published p. 61); Theorem A, §1, arXiv p. 3 (published p. 3)

## ModularityAndLanglandsExtensions:ML.3/clozel-thorne-reductions
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.clozelThorne_reductions
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
(Newton–Thorne Proposition 6.1) Let F be totally real, π a non-CM RAESDC representation of GL₂(𝔸_F), p ≥ 5 prime and 0 < r < p. There are a soluble totally real E/F, ι : Q̄_p ≅ ℂ and a RAESDC π′ of GL₂(𝔸_E) of weight 0 with: Sym^{p+r−1}r_{π,ι} automorphic iff Sym^{p+r−1}r_{π′,ι} is; π′_v an unramified twist of Steinberg for v | p; det r_{π′,ι} = ε^{−1}; a place v₀ with q_{v₀} ≡ −1 mod p and π′_{v₀} tamely dihedral of order p; a place v₁ with q_{v₁} ≡ 1 mod p and π′_{v₁} Steinberg; and the potential-diagonalisability conditions. (Clozel–Thorne) Theorem 7.1 reduces the mixed-parity case to the RAESDC case, Lemma 7.4 twists π_E to a RACSDC representation over a CM extension, and Proposition 7.6 deduces symmetric powers over a CM field from those over its maximal totally real subfield (using an odd extension R̄ of r̄_ι(Π) ⊗ φ); and, for π with discrete series at infinity, 'not CM-induced' is equivalent to 'Sym²π cuspidal'.
Hypothesis: As in the cited statements; corrections recorded in the CT17 and NT26 extractions applied.
Source: nt-2026, Proposition 6.1, §6, pp. 45–46; proof pp. 46–49 (arXiv v2); also proof of Theorem 6.5, p. 50
Source: ct-2017, §7, Lemma 7.4, manuscript p. 47
Source: ct-2017, §7, Proposition 7.6 and proof, manuscript p. 49

## ModularityAndLanglandsExtensions:ML.3/cm-and-weight-one-symmetric-powers
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.symPower_CM_weightOne
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Let π be cuspidal on GL₂(𝔸_ℚ) with π_∞ a holomorphic limit of discrete series, or π the automorphic induction of a Hecke character of a quadratic field. Then Sym^nπ exists for every n ≥ 1 (usually not cuspidal).
Hypothesis: π as stated.
Source: newton-thorne-II, Appendix A, Theorem A.1, p. 27 (arXiv v2)

## ModularityAndLanglandsExtensions:ML.3/completed-symmetric-power-l-function
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.completedL
Prototype status: omitted
Supplier contracts: C-SYSTEM
For an elliptic curve E/ℚ and n ≥ 1, Λ(Sym^n E, s) = N_n^{s/2} γ_n(s) L(Sym^n E, s), where L(Sym^n E, s) = ∏_p L_p(Sym^n E, s) is the Euler product of the local factors of Sym^n of the Weil–Deligne representation at p (at all p, including the bad ones), N_n is the conductor of Sym^n, and γ_n(s) is the archimedean factor of Sym^n of the Hodge structure of E (a product of Γ_ℂ(s − j) and, for n even, a Γ_ℝ factor), as in Dummigan–Martin–Watkins (2009). Removing the nowhere-vanishing entire factor N_n^{s/2} does not affect entireness but changes the functional equation's normalisation.
Hypothesis: E/ℚ an elliptic curve; n ≥ 1.
API [omitted] TauCeti.SymmetricPower.completedL
  Λ(Sym^n E, s).
API [omitted] TauCeti.SymmetricPower.completedL_eq
  Λ(Sym^n E, s) = N_n^{s/2} γ_n(s) L(Sym^n E, s).
API [omitted] TauCeti.SymmetricPower.completedL_entire_iff
  Λ(Sym^n E, s) is entire iff N_n^{−s/2}Λ(Sym^n E, s) is (the conductor factor never vanishes).
API [omitted] TauCeti.SymmetricPower.completedL_eq_automorphic
  If Sym^nπ_E exists, Λ(Sym^n E, s) = Λ(Sym^nπ_E, s − n/2) (with the unitary normalisation shift).
Test [omitted] TauCeti.SymmetricPower.completedL_one
  n = 1: Λ(Sym¹E, s) = N^{s/2}·2(2π)^{−s}Γ(s)·L(E, s).
Test [omitted] TauCeti.SymmetricPower.completedL_zero
  n = 0: Λ(Sym⁰E, s) = π^{−s/2}Γ(s/2)ζ(s), not entire.
Test [omitted] TauCeti.SymmetricPower.completedL_gamma_two
  n = 2: γ₂(s) = Γ_ℝ(s)Γ_ℂ(s): Γ_ℂ(s) for the Hodge types (2,0), (0,2) and Γ_ℝ(s) for (1,1), on which complex conjugation acts by −1.
Test [omitted] TauCeti.SymmetricPower.completedL_partial_not
  The partial L-function without bad Euler factors is not Λ: its functional equation fails.
Source: newton-thorne-II, §1 Introduction, Corollary B, arXiv v2 p. 2 (Publ. IHÉS 134, p. 118)
Source: dmw-2009, §§2–3, PDF pp.4–7 (printed pp.1314–1317)
Source: martin-watkins-2006, §4.2, PDF p.7

## ModularityAndLanglandsExtensions:ML.3/level-one-symmetric-powers
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.symPower_levelOne
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
For every n ≥ 2 and every regular algebraic cuspidal automorphic representation π of GL₂(𝔸_ℚ) of level 1, Sym^{n−1}π exists as a regular algebraic cuspidal automorphic representation of GL_n(𝔸_ℚ).
Hypothesis: π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.
Hypothesis: π everywhere unramified.
Source: newton-thorne-I, Introduction, Theorem A, p. 2; §7, Theorem 7.7, p. 90 (arXiv v3)

## ModularityAndLanglandsExtensions:ML.3/low-rank-symmetric-powers
Assigned layer: ModularityAndLanglandsExtensions:ML.1
Declaration: TauCeti.Functoriality.sp_le_five
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-ARTIN
Let F be a totally real field and π a cuspidal regular algebraic automorphic representation of GL₂(𝔸_F) without CM. Then for 1 ≤ n ≤ 5 the lift Sym^{n−1}π exists as a regular algebraic essentially self-dual cuspidal automorphic representation of GL_n(𝔸_F): this is the statement SP_n of Newton–Thorne for n ≤ 5, the base case of their induction.
Hypothesis: F totally real; π regular algebraic cuspidal non-CM.
Source: nt-2026, Proof of Theorem 6.4, §6, p. 50 (arXiv:2212.03595v2)
Source: nt-2026, §1, p. 3 (arXiv:2212.03595v2)

## ModularityAndLanglandsExtensions:ML.4/local-arthur-packets
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.localPacket
Prototype status: omitted
Supplier contracts: C-ARTHUR
Let F be a local field of characteristic 0, G a quasi-split Sp_{2n}, SO_{2n+1} or SO_{2n} over F with a fixed Whittaker datum, and ψ : L_F × SL₂(ℂ) → ^LG a local Arthur parameter whose restriction to L_F is bounded. Then there are a finite multiset Π̃_ψ of irreducible unitary representations of G(F) (for SO_{2n}, orbits under the outer automorphism) and a map π ↦ ⟨·, π⟩ from Π̃_ψ to the characters of S_ψ such that: (a) the distribution f ↦ Σ_{π ∈ Π̃_ψ} ⟨s_ψ, π⟩ f_G(π) is stable and is the transfer of the twisted character of the representation of GL_N(F) ⋊ θ attached to ψ; (b) for every endoscopic datum (G′, s) through which ψ factors as ψ′, f′(ψ′) = Σ_{π ∈ Π̃_ψ} ⟨s_ψ x, π⟩ f_G(π) (the endoscopic character identities); (c) if ψ = φ is trivial on SL₂(ℂ) (a tempered L-parameter) then Π̃_φ is a set of tempered representations, π ↦ ⟨·, π⟩ is injective, and bijective onto Ŝ_φ when F is p-adic; the packets Π̃_φ for φ ∈ Φ̃_bdd(G) are disjoint and exhaust the tempered dual. Part (c) is the local Langlands correspondence for G.
Hypothesis: F local of characteristic 0; G quasi-split symplectic or special orthogonal over F with a fixed Whittaker datum.
Hypothesis: The statement is conditional as recorded in ModularityAndLanglandsExtensions:ML.0/arthur-dependency-gate: Arthur's proof uses the stabilisation of the twisted trace formula and results he announces in [A24]–[A27].
Source: arthur-2013, §1.5, Theorem 1.5.1 and the paragraph before it, pp. 41–42 (2011 manuscript)
Source: arthur-2013, §1.5, after Theorem 1.5.1, p. 42 (2011 manuscript)
Source: mok-2015, §2.5, Theorem 2.5.1 — independently checked downloaded PDF p.32; published-copy pagination where applicable

## ModularityAndLanglandsExtensions:ML.4/mok-unitary-classification
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.mok_multiplicity_formula
Prototype status: omitted
Supplier contracts: C-ARTHUR
Let E/F be a quadratic extension of number fields and G = U_{E/F}(N) the quasi-split unitary group. Global parameters are formal sums ψ = ⊞_i μ_i ⊠ ν_{b_i} with μ_i conjugate-self-dual unitary cuspidal representations of GL_{m_i}(𝔸_E), Σ m_i b_i = N, pairwise distinct, each μ_i ⊠ ν_{b_i} conjugate-self-dual of sign (−1)^{N−1} (through the standard base change embedding ξ_{χ₊}). Then (local) for every place v there are packets Π_{ψ_v} with characters ⟨·, π_v⟩ of S_{ψ_v} satisfying the endoscopic character identities, and the tempered packets give the local Langlands correspondence for U(N)(F_v); and (global) L²_disc(G(F)\G(𝔸_F)) ≅ ⊕_{ψ ∈ Ψ_2(G, ξ_{χ₊})} ⊕_{π ∈ Π_ψ(ε_ψ)} π, with Π_ψ(ε_ψ) a multiset retaining repetitions; for generic ψ, multiplicity one holds (Mok Remark 2.5.3). No multiplicity-one assertion is made here for every non-generic ψ.
Hypothesis: E/F a quadratic extension of number fields; G = U_{E/F}(N) quasi-split; Whittaker datum fixed.
Hypothesis: Conditional exactly as Arthur's book on which Mok's proof depends (ML.0/arthur-dependency-gate).
Source: mok-2015, §2.5, Theorem 2.5.2 and Remark 2.5.3, pp. 34–35 (arXiv v5)

## ModularityAndLanglandsExtensions:ML.4/symplectic-branch-status
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.symplecticBranchStatus
Prototype status: omitted
Supplier contracts: C-ARTHUR, C-AUTOMORPHIC
The symplectic branch of ML.4 (Gee–Taïbi's classification of the discrete spectrum of GSp₄, ML.4/gsp4-arthur-classification, and everything that uses it: ML.4/gl4-symplectic-descent, ML.4/non-general-type-reducible and the GSp₄ modularity theorems of Boxer–Calegari–Gee–Pilloni and Calegari–Geraghty) is conditional on Arthur's classification for Sp₄ and SO₅ with the inputs of ML.4/trace-formula-inputs-register. It is not made unconditional by the availability of Mok's or KMSW's unitary results. The verification task is: (i) list the statements of Arthur's book that rest on the announced references [A24]–[A27] and on the twisted weighted fundamental lemma; (ii) check, for each, whether a published proof now exists (Mœglin–Waldspurger for the stabilisation; Atobe–Gan–Ichino–Kaletha–Mínguez–Shin for the local intertwining relation); (iii) record the remaining hypotheses as explicit hypotheses of every GSp₄ endpoint.
Hypothesis: Status register; the hypotheses it lists are carried by the consumer nodes.
Source: bcgp-2021, §1.4.1, p. 14 (arXiv v3)

## ModularityAndLanglandsExtensions:ML.5/symmetric-power-functoriality-implies-ramanujan
Assigned layer: ModularityAndLanglandsExtensions:ML.5
Declaration: TauCeti.Functoriality.ramanujan_of_symPower
Prototype status: omitted
Supplier contracts: C-AUTOMORPHIC, C-GALOIS
Let π be a unitary cuspidal automorphic representation of GL₂(𝔸_F). If for every n ≥ 1 the lifts Symⁿπ and Symⁿπ^∨ have compatible unitary cuspidal realizations, or isobaric realizations all of whose cuspidal constituents are unitary (it suffices to have such realizations over finite extensions of F), then π_v is tempered at every place v where π is unramified (Ramanujan): from the Rankin–Selberg L-functions L(s, Symⁿπ × Symⁿπ^∨) and the Jacquet–Shalika bound |α| < q_v^{1/2} for the Satake parameters of unitary cuspidal representations of GL_{n+1} one gets |α_v|^n < q_v^{1/2} for all n, hence |α_v| = 1.
Hypothesis: π unitary cuspidal on GL₂. For unbounded positive n, Sym^nπ has a compatible unitary cuspidal realization, or an isobaric realization whose constituents are all unitary cuspidal; the potential version has such realizations over finite extensions. Arbitrary nonunitary isobaric automorphy alone is insufficient for the Satake bound.
Source: acc-2023, §1, paragraph after Theorem 1.0.2, p. 3 (arXiv:1812.09999v2)
Source: acc-2023, §1, paragraph after Theorem 1.0.2, p. 3 (arXiv:1812.09999v2)

## ModularityAndLanglandsExtensions:ML.2/qian-ordinary-potential-automorphy
Assigned layer: ModularityAndLanglandsExtensions:ML.2
Declaration: TauCeti.PotentialAutomorphy.qian_ordinary
Prototype status: omitted
Supplier contracts: C-LOCAL-DEFORMATION
Let F be a CM field, F^av/F finite, n ≥ 2, l > n a prime, ι : Q̄_l ≅ ℂ and r : G_F → GL_n(Q̄_l) continuous with (i) r unramified almost everywhere; (ii) r|_{G_{F_v}} potentially semistable and ordinary with regular Hodge–Tate weights for each v | l; (iii) r̄ absolutely irreducible and decomposed generic, with r̄(G_{F(ζ_l)}) enormous; (iv) some σ ∈ G_F − G_{F(ζ_l)} has r̄(σ) scalar. Then there is a finite CM Galois F′/F, linearly disjoint from F^av over F, such that r|_{G_{F′}} is ordinarily automorphic. The bound l > n comes from ACC+ Theorem 6.1.2(4) (printed without it: recorded as a source issue).
Hypothesis: As in the statement; F^av arbitrary.
Source: qian-2023, Theorem 1.4, §1, p. 2 (arXiv v1); Invent. p. 1241 per routed locator; proof: last paragraph of §4, p. 26 (arXiv v1)

## ModularityAndLanglandsExtensions:ML.3/all-regular-symmetric-powers
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.sp_all
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
SP_n holds for all n ≥ 2: for every totally real F and every non-CM cuspidal regular algebraic π of GL₂(𝔸_F), Sym^{n−1}π exists as a RAESDC automorphic representation of GL_n(𝔸_F), in each of the senses of ML.3/one-prime-criterion.
Hypothesis: F totally real; π non-CM, cuspidal, regular algebraic.
Source: nt-2026, Theorem 6.4 and its proof, §6, p. 50 (arXiv v2)

## ModularityAndLanglandsExtensions:ML.3/bianchi-fourier-ramanujan
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.bianchi_coeff_bound
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Let F be imaginary quadratic, f a cuspidal Bianchi eigenform of level 𝔫 and weight k normalised by c(O_F, f) = 1, and 𝔭 a prime ideal not dividing 𝔫. Then |c(𝔭, f)| ≤ 2N(𝔭)^{(k−1)/2}.
Hypothesis: As stated.
Source: bcgnt-2025, Theorem E, §1.3, arXiv v3 p. 10 (published p. 8; arXiv pagination differs)

## ModularityAndLanglandsExtensions:ML.3/bianchi-mass-equidistribution
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.bianchi_massEquidistribution
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Let F be imaginary quadratic of class number one and Γ = SL₂(O_F). For any sequence of level-one Bianchi eigenforms f of weight tending to ∞, the normalised measures μ_f on Γ\ℍ³ (Marshall) converge weakly to the normalised hyperbolic volume.
Hypothesis: F imaginary quadratic of class number one; level one.
Source: bcgnt-2025, Theorem G and proof, §1.3, arXiv v3 p. 11 (published p. 10; arXiv pagination differs)

## ModularityAndLanglandsExtensions:ML.3/non-supercuspidal-symmetric-powers
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.symPower_of_not_supercuspidal
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Let π be a non-CM regular algebraic cuspidal π of GL₂(𝔸_ℚ) such that π_l has nonzero Jacquet module for every prime l. Then for every n ≥ 3, Sym^{n−1}r_{π,ι} is automorphic, so Sym^{n−1}π exists. In particular (Corollary C) for a semistable elliptic curve E/ℚ and each n≥1 the completed Λ(Sym^nE, s) is entire.
Hypothesis: π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.
Source: newton-thorne-I, §8, Theorem 8.1, p. 91; Introduction, Theorem B and Corollary C, p. 2 (arXiv v3)

## ModularityAndLanglandsExtensions:ML.3/sato-tate-group
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.SatoTateGroup
Prototype status: omitted
Supplier contracts: C-EQUIDISTRIBUTION
Let F be imaginary CM and π a cuspidal regular algebraic representation of GL₂(𝔸_F) of weight λ, not CM, with λ_{τ,1} + λ_{τc,2} = w and ω_π = |·|^{−w}ψ, ψ unitary of type A₀. ST(π) = U₂(ℝ)_a := {g ∈ U₂(ℝ) : det(g)^a = 1} if ψ has finite order a, and ST(π) = U₂(ℝ) otherwise. It is a compact subgroup of GL₂(ℂ), and for π_v unramified and essentially tempered the conjugacy class of q_v^{−w/2} rec(π_v)(Frob_v) meets ST(π) in a unique ST(π)-conjugacy class [π_v] (Lemma 7.2.2).
Hypothesis: F imaginary CM; π non-CM cuspidal regular algebraic on GL₂.
API [omitted] TauCeti.SymmetricPower.SatoTateGroup
  ST(π) ⊂ GL₂(ℂ).
API [omitted] TauCeti.SymmetricPower.SatoTateGroup.isCompact
  ST(π) is compact.
API [omitted] TauCeti.SymmetricPower.SatoTateGroup.ofFiniteOrder
  ψ of finite order a ⇒ ST(π) = {g ∈ U₂(ℝ) : det(g)^a = 1}.
API [omitted] TauCeti.SymmetricPower.satoTateClass
  [π_v] ∈ ST(π)/conjugacy for π_v unramified and essentially tempered.
API [omitted] TauCeti.SymmetricPower.satoTateClass_unique
  The class [π_v] is unique (Lemma 7.2.2).
Test [omitted] TauCeti.SymmetricPower.SatoTateGroup.eq_SU2_of_elliptic
  For π of a non-CM elliptic curve over F, ψ = 1 and ST(π) = SU(2) = U₂(ℝ)₁.
Test [omitted] TauCeti.SymmetricPower.satoTate_infiniteOrder
  If ψ has infinite order, ST(π) = U₂(ℝ).
Test [omitted] TauCeti.SymmetricPower.satoTate_cm_excluded
  For a CM representation the non-CM Sato–Tate group formula does not apply: the identity component is toral, and the full group can be a torus or its normalizer depending on the field of definition of the endomorphisms.
Source: bcgnt-2025, Definition of ST(π) and Lemma 7.2.2 with proof, §7.2, arXiv v3 pp. 69–70 (published p. 62; arXiv pagination differs)

## ModularityAndLanglandsExtensions:ML.3/sym6-sym8
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.sym6_sym8
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Let F be totally real and (π, χ) a RAESDC automorphic representation of GL₂(𝔸_F) not automorphically induced from a quadratic CM extension. (1) If F ∩ ℚ(ζ₅) = ℚ, Sym⁶π exists as a cuspidal automorphic representation of GL₇(𝔸_F). (2) If F ∩ ℚ(ζ₇) = ℚ, Sym⁸π exists as a cuspidal automorphic representation of GL₉(𝔸_F). Theorem 6.1 is reduced to Theorem 6.2 (level raising for Sym^{n−1} of a Steinberg-at-q form) by reference to Clozel–Thorne II §6; the level-raising method is owned by the proposed Part II SymmetricPowersByUnitaryLevelRaising.
Hypothesis: F totally real with the stated disjointness; π RAESDC, not CM.
Source: ct-2017, §6, Theorem 6.1 (= Theorem 1.1), manuscript p. 44 (Theorem 1.1 on p. 2)

## ModularityAndLanglandsExtensions:ML.4/adams-johnson-packets
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.adamsJohnson_eq_arthurPacket
Prototype status: omitted
Supplier contracts: C-ARTHUR, C-AUTOMORPHIC
Let G be a quasi-split real symplectic, special orthogonal or unitary group and let ψ be an Adams–Johnson Arthur parameter in the sense of AJ87. AMR Theorem 1.1 identifies the Whittaker-normalized twisted transfer of its stable Adams–Johnson character with the twisted GL_N character of Std∘ψ; consequently its Arthur packet equals the Adams–Johnson packet of cohomologically induced modules A_𝔮(λ), with the multiplicity-one conclusion used by Chenevier–Taïbi. AMR §8.1 lists consequences of the AJ parameter conditions, including regular integral infinitesimal character, centralizer Levi and factorization through a unitary-character parameter with principal SL₂. It explicitly does not restate their full definition. Those consequences are not asserted sufficient here; the complete AJ condition is a named missing supplier definition, so its dependent signature is omitted.
Hypothesis: G is quasi-split over ℝ and ψ is an actual Adams–Johnson parameter. Its full defining conditions must be supplied by AF.1’s real-packet extension; regular integral infinitesimal character alone is insufficient.
Hypothesis: Global applications (Chenevier–Taïbi; Ichino–Prasanna) are conditional on ML.0/arthur-dependency-gate; Ichino–Prasanna use KMSW Theorem* 1.7.1 for non-generic parameters, which KMSW prove only for generic ones (recorded at the node).
Source: chenevier-taibi-2020, §5.2.1, p. 303 (published)
Source: ichino-prasanna-2023, §11.2, p. 70 (arXiv v2); published p. 81
Source: amr-2018, Theorem 1.1, §1, printed p. 3; Adams–Johnson parameter hypotheses in §8.1

## ModularityAndLanglandsExtensions:ML.4/arthur-multiplicity-formula
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.multiplicity_formula
Prototype status: omitted
Supplier contracts: C-ARTHUR
Let G be as in ML.4/global-arthur-parameter. Then L²_disc(G(F)\G(𝔸_F)) ≅ ⊕_{ψ ∈ Ψ̃_2(G)} ⊕_{π ∈ Π̃_ψ(ε_ψ)} m_ψ π, where Π̃_ψ = ⊗'_v Π̃_{ψ_v} is the global packet (π_v unramified with ⟨·, π_v⟩ = 1 for almost all v; the local components ψ_v lie in Ψ̃⁺_unit(G_v), not necessarily bounded since the Ramanujan conjecture is unknown, and their packets are defined from the bounded case by Arthur's (1.5.1)–(1.5.2)), Π̃_ψ(ε_ψ) is the set of π = ⊗π_v ∈ Π̃_ψ whose character ⟨·, π⟩ = ∏_v ⟨·, π_v⟩, restricted to S_ψ, equals ε_ψ, and m_ψ ∈ {1, 2} is Arthur's multiplicity (m_ψ = 2 exactly when N is even, Ĝ = SO(N, ℂ) and every N_i = m_i b_i is even; otherwise m_ψ = 1). In particular every discrete automorphic representation of G has a parameter ψ, its transfer to GL_N(𝔸_F) is the isobaric representation of ψ, and the summands with generic ψ are the discrete representations whose transfer is a sum of distinct self-dual cuspidals.
Hypothesis: F a number field, 𝔸_F its adèles; G a quasi-split symplectic or special orthogonal group over F (Sp_{2n}, split SO_{2n+1}, or quasi-split SO_{2n} attached to a quadratic character η_G), whose dual group Ĝ has a standard representation of dimension N (N = 2n + 1, 2n, 2n respectively).
Hypothesis: Conditional as recorded in ModularityAndLanglandsExtensions:ML.0/arthur-dependency-gate.
Source: arthur-2013, §1.5, Theorem 1.5.2 and (1.5.3)–(1.5.7), pp. 45–47 (2011 manuscript)

## ModularityAndLanglandsExtensions:ML.4/kmsw-inner-forms
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.kmsw_multiplicity_formula
Prototype status: omitted
Supplier contracts: C-ARTHUR
For an extended pure inner twist Ξ of U_{E/F}(N) and a bounded tempered local parameter φ, KMSW Theorem 1.6.1 gives finite packets with the pairing determined by Ξ and refined endoscopic character identities. At nonarchimedean places the packet maps bijectively to Irr(S_φ^♮,χ_Ξ). At real places this is a bijection only after taking the disjoint union over the specified pure inner forms; a fixed real form need not realize every character. For a global PURE inner twist and a generic discrete parameter ψ, the ψ-part of the discrete spectrum is the sum over Π_ψ(G,Ξ,ε_ψ). For nongeneric ψ or general inner twists, the version printed as Theorem* 1.7.1 uses the two explicitly stated inputs of Chapter 5: the local classification at each ψ_v (Hypothesis 3.6.3) and the local intertwining relation (Theorem* 2.6.2) at every place. This packet does not assert those inputs for the unproved cases.
Hypothesis: Quadratic extension E/F, fixed Whittaker datum on the quasi-split form and extended pure inner twist Ξ with its associated central character χ_Ξ.
Hypothesis: Proved global scope in the cited KMSW edition: generic parameter and pure inner twist, together with the registered Mok/Arthur external classification hypothesis. The more general statement is conditional on the actual local classification and local intertwining identities for each localization, not on a label kmswHypotheses.
Source: kmsw-2014, §1.6.1, Theorem* 1.6.1 and the sentence before it, p. 80 (arXiv v3)
Source: kmsw-2014, Theorem* 1.6.1(5), pp. 80–81; Theorem* 1.7.1 and discussion, p. 89; Chapter 5 and Theorem 5.0.5, pp. 205–206

## ModularityAndLanglandsExtensions:ML.4/moeglin-renard-packets
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.moeglinRenard_packet
Prototype status: omitted
Supplier contracts: C-ARTHUR
Let ψ=ψ_u⊕⊕_j(δ_{t_j}⊠R[a_j]) be an Arthur parameter of Sp_{2g}(ℝ), with ψ_u=⊕_i χ_i⊠R[a′_i], χ_i∈{1,sgn}, a′_i odd, one or three unipotent summands, t_j>0 and t_j+a_j odd. Put a(ψ_u)=max_i a′_i. For 0≤k≤g assume that the infinitesimal character is {k−1,…,k−g,−(k−1),…,−(k−g),0}. The scalar highest-weight module π_g(k) belongs to Π_ψ exactly in either of these cases: (i) dim ψ_u=1, 2k>g+1, and the closed intervals [(t_i−a_i+1)/2,(t_i+a_i−1)/2] are pairwise disjoint; (ii) ψ=(sgn^{(2g+1−a(ψ_u))/2}⊠R[a(ψ_u)])⊕ψ′, where ψ′ is a parameter for the compact even orthogonal group O(0,2g+1−a(ψ_u)), its packet contains a finite-dimensional E_{ψ′}, and the Howe lift of E_{ψ′} is π_g(k). In either case π_g(k) has multiplicity one. The refinement for k≥1 has a(ψ_u)=2(g−k)+1 or 2(g−k)+3 in the theta branch; the latter requires 2k≥g+2. The packet character is a separate assertion of Proposition 18.3, whose formula remains a requested export.
Hypothesis: The parameter decomposition and infinitesimal-character condition in the statement. Global uses carry the explicit external classification assumptions; the local criterion is not encoded by an arbitrary CaseI proposition.
Source: chenevier-taibi-2020, §5.2.2, pp. 303–305 (published)
Source: chenevier-taibi-2020, §5.2.2, case (H), p. 305 (published)
Source: moeglin-renard-2018, Theorem 7.1, §7, pp. 18–19; notation §1, pp. 1–3

## ModularityAndLanglandsExtensions:ML.4/vogan-packets-so-v
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.voganPacket_so
Prototype status: omitted
Supplier contracts: C-ARTHUR, C-AUTOMORPHIC
Let F be a local field of characteristic 0 and φ : L_F → Sp_{2n}(ℂ) an L-parameter. For each (2n+1)-dimensional quadratic space V over F with trivial discriminant there is a (possibly empty) L-packet Π_φ(SO(V)), and Irr SO(V) = ⊔_φ Π_φ(SO(V)); moreover there is a bijection ⊔_V Π_φ(SO(V)) ↔ Ŝ_φ, σ_η ↔ η, onto the characters of the component group S_φ of the centraliser of Im φ in Sp_{2n}(ℂ), where σ_η is a representation of SO(V) only if η(z_φ) = ε(V) (the normalised Hasse–Witt invariant), with equality of the two conditions for F non-archimedean or F = ℂ. σ ∈ Π_φ(SO(V)) is square-integrable iff φ is multiplicity-free and of good parity, and tempered iff φ is tempered.
Hypothesis: F local of characteristic 0; V of odd dimension 2n + 1 with trivial discriminant (SO(V⁺) split, SO(V⁻) its pure inner form).
Hypothesis: Conditional: the split case is Arthur's (ML.0/arthur-dependency-gate); the non-split case is Mœglin–Renard's, which assumes Arthur-type results for inner forms (proved for generic parameters by Ishimoto).
Source: gan-ichino-2018, §5.2, (5.3), p. 17 (arXiv v3); published p. 987
Source: gan-ichino-2018, §1.2, p. 4 (arXiv v3); published p. 969

## ModularityAndLanglandsExtensions:ML.4/xu-gsp2n-packets
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.xuPacket
Prototype status: omitted
Supplier contracts: C-ARTHUR, C-AUTOMORPHIC
Let F be a non-archimedean local field of characteristic 0 and φ♭ an L-parameter of Sp₆ whose L-packet Π_{φ♭} has trivial central character (for n = 3: φ♭ lifts to Spin₇(ℂ)). Let Π̃_{φ♭} be the set of irreducible representations of PGSp₆(F) whose restriction to Sp₆(F) has constituents in Π_{φ♭}, and Φ̃_{φ♭} the finite set of lifts φ of φ♭ to the dual group of PGSp₆, a homogeneous set under Hom(W_F, μ₂). Xu partitions Π̃_{φ♭} into packets Π̃^X_{φ♭} with: (a) the packets are the twists Π̃^X_{φ♭} ⊗ χ by quadratic characters χ of the similitude; (b) restriction to Sp₆ gives a bijection Π̃^X_{φ♭} → Π_{φ♭}/PGSp₆(F); (c) there is a natural bijection Π̃^X_{φ♭} ↔ Irr(S_φ/Z) for any lift φ ∈ Φ̃_{φ♭}; (d) with respect to (c) the packets satisfy the stability and endoscopic character identities; (e) the stabiliser of a member in Hom(F^×, μ₂) equals the stabiliser of φ in Hom(W_F, μ₂), so the packets and the lifts are non-canonically isomorphic homogeneous sets. Xu does not determine which lift φ is the parameter of which packet.
Hypothesis: F non-archimedean of characteristic 0; n=3 (PGSp₆/Sp₆), exactly the specialization read in Gan–Savin §7; classification remains conditional on its named Arthur inputs. A general n statement requires direct reading of Xu.
Source: gan-savin-2023-g2, §7, (7.1), p. 22 (published)
Source: gan-savin-2023-g2, §7 (a)–(b), p. 22 (published)
Source: gan-savin-2023-g2, §7 (e), p. 23 (published)

## ModularityAndLanglandsExtensions:ML.3/bianchi-parabolic-cohomology-ramanujan
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.bianchi_cohomology_bound
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Let F be imaginary quadratic, 𝔫 ≠ 0, k ≥ 2, and H_par ⊂ H¹(Γ₁(𝔫), Sym^{k−2}ℂ² ⊗ \overline{Sym^{k−2}ℂ²}) (or the sum over the components when h_F > 1). For a principal prime 𝔭 ∤ 𝔫 and an eigenvalue a_𝔭 of T_𝔭 on H_par, |a_𝔭| ≤ 2N(𝔭)^{(k−1)/2}.
Hypothesis: As stated.
Source: bcgnt-2025, Theorem F, §1.3, arXiv v3 p. 11 (published p. 9; arXiv pagination differs)

## ModularityAndLanglandsExtensions:ML.3/bianchi-sato-tate
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.bianchi_satoTate
Prototype status: omitted
Supplier contracts: C-EQUIDISTRIBUTION
Let F be an imaginary CM field and π a cuspidal regular algebraic representation of GL₂(𝔸_F) of parallel weight, not CM, with ω_π = |·|^{−w}ψ. Let S_π be the set of finite places where π is ramified (printed 'unramified': a source issue). Then the classes [π_v] ∈ ST(π), v ∉ S_π, are equidistributed for the Haar probability measure of ST(π).
Hypothesis: As stated.
Source: bcgnt-2025, Theorem 7.2.3, §7.2, arXiv v3 p. 70 (published p. 62); Theorem B, §1, arXiv p. 3 (published p. 3)

## ModularityAndLanglandsExtensions:ML.3/cm-field-symmetric-powers
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.cmField
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Let E be a CM field and π a RAECSDC automorphic representation of GL₂(𝔸_E) not automorphically induced from a quadratic extension. Then for every n ≥ 2 Sym^{n−1}π exists: there is a cuspidal Π_n of GL_n(𝔸_E) with rec(Π_{n,w}) ≅ Sym^{n−1} ∘ rec(π_w) for every place w.
Hypothesis: E CM; π RAECSDC, not dihedral.
Source: nt-2026, Theorem 6.5(2) and its proof, §6, p. 50 (arXiv v2)

## ModularityAndLanglandsExtensions:ML.3/hilbert-symmetric-powers
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.hilbert
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Let F be totally real and π a cuspidal automorphic representation of GL₂(𝔸_F) without CM such that π_∞ is essentially square-integrable (each π_v, v | ∞, a twist of a discrete series of weight k_v ≥ 2; the parity of k_v may vary). Then for every n ≥ 2 there is a cuspidal automorphic representation Π_n of GL_n(𝔸_F) with rec(Π_{n,v}) ≅ Sym^{n−1} ∘ rec(π_v) at every place v. These π are those of cuspidal non-CM Hilbert modular forms of weights k_v ≥ 2.
Hypothesis: F totally real; π non-CM with discrete-series archimedean components (mixed parity allowed).
Source: nt-2026, Theorem A, §1, p. 1 = Theorem 6.5(1), §6, p. 50 (arXiv v2)

## ModularityAndLanglandsExtensions:ML.3/non-cm-symmetric-powers
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.symPower_nonCM
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Let π be a regular algebraic, cuspidal, non-CM automorphic representation of GL₂(𝔸_ℚ). Then for every n ≥ 1, Sym^nπ exists as a regular algebraic cuspidal automorphic representation of GL_{n+1}(𝔸_ℚ). In particular (Corollary B), for every elliptic curve E/ℚ without CM and n ≥ 2, Λ(Sym^nE, s) is entire.
Hypothesis: π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.
Source: newton-thorne-II, Introduction, Theorem A and Corollary B, pp. 1–2; §3, Theorem 3.1, p. 20 (arXiv v2)

## ModularityAndLanglandsExtensions:ML.3/nt21-semistable-l-functions
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.semistable_entire
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Let E/ℚ be a semistable elliptic curve. Then for every n ≥ 2 the completed symmetric power L-function Λ(Sym^n E, s) (ML.3/completed-symmetric-power-l-function) admits an analytic continuation to ℂ.
Hypothesis: E/ℚ semistable (hence non-CM).
Source: newton-thorne-I, Introduction, Corollary C, arXiv v3 p. 2 (Publ. IHÉS 134, p. 2)

## ModularityAndLanglandsExtensions:ML.3/symmetric-powers-up-to-eight
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.upToEight
Prototype status: omitted
Supplier contracts: C-GALOIS, C-AUTOMORPHIC, C-SYSTEM
Let F be totally real, π cuspidal on GL₂(𝔸_F) with π_∞ essentially square-integrable, not induced from a quadratic CM extension. Then there is a cuspidal Π on GL_{r+1}(𝔸_F) with Sym^r rec(π_v) ≅ rec(Π_v) for all finite v in each case: (1) any F, 1 ≤ r ≤ 4; (2) F ∩ ℚ(ζ₅) = ℚ, r ∈ {5, 6}; (3) F ∩ ℚ(ζ₃₅) = ℚ, r = 7; (4) F ∩ ℚ(ζ₇) = ℚ, r = 8. Consequently (Corollary 1.3) L(s, Sym^n π) is entire with the expected functional equation for n ≤ 8 under the corresponding disjointness.
Hypothesis: As stated.
Source: ct-2017, §7, Corollary 7.2, manuscript pp. 46–47 (Corollaries 1.2, 1.3 on p. 2)

## ModularityAndLanglandsExtensions:ML.4/amf-nonsplit-so-v
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.multiplicity_formula_so_nonsplit
Prototype status: omitted
Supplier contracts: C-ARTHUR, C-AUTOMORPHIC
Let F be a number field and V a (2n+1)-dimensional quadratic space with trivial discriminant. The near-equivalence decomposition L²_disc(SO(V))=⊕_ΦL²_Φ(SO(V)) ranges over all elliptic A-parameters, including non-generic ones. For a generic elliptic Φ only, Gan–Ichino hypothesis (6.1) gives L²_Φ(SO(V))=⊕_ηm_ηΣ_η through its Vogan packets, where m_η=1 if Δ*η=1 and 0 otherwise. The decomposition and the generic multiplicity formula have different quantifier scopes. The split case follows from Arthur; the non-split generic result uses the stated external inner-form classification.
Hypothesis: F a number field; V odd-dimensional with trivial discriminant; Φ generic elliptic.
Hypothesis: For split SO(V) this is Arthur's Theorem 1.5.2; for non-split SO(V) Gan–Ichino assume it (their hypothesis (6.1) with the decomposition of §3.1), and Ishimoto proves it for generic parameters; conditional on ML.0/arthur-dependency-gate.
Source: gan-ichino-2018, §6.2, (6.1), p. 22 (arXiv v3); published p. 993
Source: gan-ichino-2018, §3.1, p. 10 (arXiv v3); published p. 977

## ModularityAndLanglandsExtensions:ML.4/generic-packets-standard-modules
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.genericPacket_standardModule
Prototype status: omitted
Supplier contracts: C-ARTHUR, C-AUTOMORPHIC
Let F be a local field of characteristic 0, G a classical group over F (quasi-split, or a pure inner form) and φ a generic L-parameter (its L-packet contains a generic member for some Whittaker datum of the quasi-split form). Then every member of the L-packet Π_φ(G) is an irreducible standard module, i.e. the full induced representation from the tempered data of its Langlands quotient is irreducible.
Hypothesis: F local of characteristic 0; G classical (symplectic, orthogonal or unitary, or a pure inner form); φ generic.
Hypothesis: Conditional through the packets used (ML.0/arthur-dependency-gate).
Source: jiang-zhang-2020, Appendix B, Proposition B.1 and proof, p. 85 (arXiv v4); published p. 818

## ModularityAndLanglandsExtensions:ML.4/gsp4-arthur-classification
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.GSp4.classification
Prototype status: omitted
Supplier contracts: C-ARTHUR, C-AUTOMORPHIC
Let F be a totally real number field. Every discrete automorphic representation π of GSp₄(𝔸_F) has a transfer π̃ to GL₄(𝔸_F) (its global parameter) of one of the six types (a)–(f) of ML.4/gsp4-discrete-spectrum-types, and the discrete spectrum is described by Arthur's multiplicity formula for GSp₄. In particular: (i) the transfer is compatible with rec_GT at every finite place; (ii) for a parameter ψ = π̃ ⊠ 1 of general type the global component group S_ψ is trivial, so for every choice of local packet members π′_v ∈ Π_{ψ_v} (π′_v unramified for almost all v) ⊗′_v π′_v is automorphic; (iii) such representations occur with multiplicity one; and for a general-type ψ the archimedean packet Π_{ψ_∞} is the L-packet of the archimedean parameter.
Hypothesis: F a totally real number field (BCGP work over totally real F; Calegari–Geraghty and Pilloni over ℚ); GSp₄ the split symplectic similitude group with similitude ν; π a discrete automorphic representation of GSp₄(𝔸_F) with central character ω_π.
Hypothesis: Conditional on ML.0/arthur-dependency-gate: Gee–Taïbi prove Arthur's 2004 announcement from Arthur 2013 for Sp₄ and SO₅, and the result is only as unconditional as Arthur 2013 and Mœglin–Waldspurger's stabilisation.
Hypothesis: The BCGP §2.9 statement used here has F totally real; a version over an arbitrary number field needs a separately checked Gee–Taïbi export.
Source: cg-2020, Proof of Theorem 7.11, §7.2, publ. p. 854; arXiv v1 p. 40
Source: cg-2020, Proof of Theorem 7.11, publ. p. 855 (copy p. 55)
Source: bcgp-2021, §2.9 'Arthur's classification', first paragraph — independently checked downloaded PDF p.38; published-copy pagination where applicable

## ModularityAndLanglandsExtensions:ML.4/packet-member-irreducibility
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.induced_irreducible_of_almostTempered
Prototype status: omitted
Supplier contracts: C-ARTHUR, C-AUTOMORPHIC
(Lemma 5.1) Let F be local of characteristic 0, φ = ϕ ⊕ ϕ^∨ ⊕ φ₀ an almost tempered symplectic parameter, V = H^k ⊕ V₀ (k = dim ϕ), Q ⊂ SO(V) the parabolic with Levi GL_k × SO(V₀) and τ ∈ Irr GL_k(F) attached to ϕ. Then Ind_Q^{SO(V)}(τ ⊗ σ₀) is irreducible for every σ₀ ∈ Π_{φ₀}(SO(V₀)). (Lemma 5.5) Let φ′ = φ ⊕ S_{2r−2n} with φ a 2n-dimensional almost tempered symplectic representation of L_F, 2n < r − 1, φ = ϕ ⊕ ϕ^∨ ⊕ φ₀, φ′₀ = φ₀ ⊕ S_{2r−2n}, Q′ ⊂ SO_{2r+1} with Levi GL_k × SO_{2r−2k+1}. Then Ind_{Q′}^{SO_{2r+1}}(τ ⊗ σ′₀) is irreducible for every irreducible subrepresentation σ′₀ of every member of the A-packet Π_{φ′₀}(SO_{2r−2k+1}).
Hypothesis: F local of characteristic 0; 'almost tempered' as in Gan–Ichino §5.2: ϕ with exponents in (−1/2, 1/2) after the tempered part is split off.
Hypothesis: In both lemmas φ=ϕ⊕ϕ^∨⊕φ₀ is the canonical bad/good decomposition: φ₀ consists of the symplectic irreducible summands and ϕ selects the non-symplectic dual pairs. An arbitrary choice of a symplectic subparameter φ₀ does not satisfy the source hypothesis.
Source: gan-ichino-2018, §5.2, Lemma 5.1 and proof, p. 18 (arXiv v3); published p. 987
Source: gan-ichino-2018, §5.4, Lemma 5.5 and proof, p. 20 (arXiv v3); published p. 990

## ModularityAndLanglandsExtensions:ML.4/xu-multiplicity-formula
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.xu_multiplicity_formula
Prototype status: omitted
Supplier contracts: C-ARTHUR, C-AUTOMORPHIC
Let F be a number field. Xu describes the tempered part of the discrete automorphic spectrum of PGSp_{2n} (as used: n = 3) by global packets Π̃^X_{Ψ♭} = ⊗_v Π̃^X_{Ψ♭_v} built from the local packets of ML.4/xu-gsp2n-packets, indexed by generic A-parameters Ψ♭ of Sp_{2n}, with an Arthur-type multiplicity formula. In particular, if Σ is a cuspidal automorphic representation of PGSp₆ whose restriction to Sp₆ has a generic A-parameter Ψ♭ with trivial global component group, every element of the global packet containing Σ is automorphic.
Hypothesis: F a number field; tempered part only; conditional through Arthur's classification (ML.0/arthur-dependency-gate).
Source: gan-savin-2023-g2, §7 (f), p. 23 (published)
Source: gan-savin-2023-g2, §12.8, proof of Theorem 12.7, pp. 39–40 (published)

## ModularityAndLanglandsExtensions:ML.3/sato-tate-elliptic-curves
Assigned layer: ModularityAndLanglandsExtensions:ML.3
Declaration: TauCeti.SymmetricPower.satoTate_elliptic
Prototype status: omitted
Supplier contracts: C-EQUIDISTRIBUTION
Let E/ℚ be an elliptic curve without complex multiplication, and for good p let α_p be the root of X² − a_pX + p with nonnegative imaginary part and θ_p = arg(α_p/√p) ∈ [0, π]. Then (θ_p) is equidistributed for (2/π)sin²θ dθ, the push-forward of Haar measure on SU(2).
Hypothesis: E/ℚ non-CM (End E = ℤ).
Source: kedlaya-ant-2025, §§24.4–24.5, Conjecture 24.4 and Theorems 24.5–24.6, printed pp. 134–135

## ModularityAndLanglandsExtensions:ML.4/gl4-symplectic-descent
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.GSp4.descent_of_symplecticType
Prototype status: omitted
Supplier contracts: C-ARTHUR, C-AUTOMORPHIC
Let F be totally real and Π a cuspidal automorphic representation of GL₄(𝔸_F) of symplectic type with multiplier χ. Then there is a discrete automorphic representation π of GSp₄(𝔸_F) with central character χ whose transfer is Π. More precisely, if for each place v π_v is any element of the L-packet corresponding to (rec_p(Π_v), χ_v), then π := ⊗′_v π_v is automorphic and occurs with multiplicity one in the discrete spectrum; if moreover Π is algebraic, π is cuspidal.
Hypothesis: F a totally real number field (BCGP work over totally real F; Calegari–Geraghty and Pilloni over ℚ); GSp₄ the split symplectic similitude group with similitude ν; π a discrete automorphic representation of GSp₄(𝔸_F) with central character ω_π.
Hypothesis: Π cuspidal of symplectic type with multiplier χ; conditional on ML.0/arthur-dependency-gate.
Source: bcgp-2021, Theorem 2.9.3, §2.9 — independently checked downloaded PDF p.39; published-copy pagination where applicable
Source: bcgp-2021, Proof of Theorem 2.9.3, PDF/printed p.39 (arXiv v3)

## ModularityAndLanglandsExtensions:ML.4/gsp4-archimedean-limit-packets
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.GSp4.limitPacket
Prototype status: omitted
Supplier contracts: C-ARTHUR, C-AUTOMORPHIC
Let λ = (λ₁, 0; c) with λ₁ < 0. The limits of discrete series of GSp₄(ℝ) with infinitesimal character λ attached to the two Weyl chambers positive for λ are π(λ)^h (containing the holomorphic and antiholomorphic limits of discrete series of Sp₄(ℝ)) and π(λ)^g (the generic one), and the archimedean L-packet containing π(λ)^h is {π(λ)^g, π(λ)^h} (Blasius–Harris–Ramakrishnan, Proposition 5.3.7). In Calegari–Geraghty's notation this is the packet {π(λ, C₀), π(λ, C₁)}, λ = (a − 1, 0; 4 − a), and for a global parameter ψ of general type the archimedean Arthur packet Π_{ψ_∞} is this L-packet.
Hypothesis: λ = (λ₁, 0; c) with λ₁ < 0 (Pilloni's Proposition 15.2.4.1 prints λ₁ > 0: recorded as a source issue).
Hypothesis: The identification of Π_{ψ_∞} with the L-packet uses Arthur's classification (ML.0/arthur-dependency-gate).
Source: pilloni-2020, §15.2.4, proof of Proposition 15.2.4.1, p. 109 (author version)
Source: cg-2020, Proof of Theorem 7.11, point (2), publ. p. 855; arXiv v1 p. 41

## ModularityAndLanglandsExtensions:ML.4/non-general-type-reducible
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.GSp4.reducible_of_not_generalType
Prototype status: omitted
Supplier contracts: C-ARTHUR, C-AUTOMORPHIC
Let F be totally real and π a discrete automorphic representation of GSp₄(𝔸_F) such that for each v | ∞, π_v has the infinitesimal character of the L-packet of φ_{(2; k_v−1, l_v−2)} with k_v ≡ l_v (mod 2) and k_v ≥ l_v ≥ 2. If π is not of general type, there is a compatible system of reducible Galois representations ρ_{π,p} : G_F → GSp₄(Q̄_p) with WD(ρ_{π,p}|_{G_{F_v}})^{ss} ≅ rec_{GT,p}(π_v ⊗ |ν|^{−3/2})^{ss} for all but finitely many v. Pilloni (§5.1.7) records the same for F = ℚ and discrete-series π_∞: in types (b)–(f), ρ_{π,λ} is a sum of representations attached to GL₁ and regular algebraic GL₂ forms. For general type, irreducibility of ρ_{π,p} is only expected (BCGP Remark 2.9.2).
Hypothesis: F a totally real number field (BCGP work over totally real F; Calegari–Geraghty and Pilloni over ℚ); GSp₄ the split symplectic similitude group with similitude ν; π a discrete automorphic representation of GSp₄(𝔸_F) with central character ω_π.
Hypothesis: The archimedean condition of the lemma; conditional on ML.0/arthur-dependency-gate.
Source: bcgp-2021, Lemma 2.9.1, §2.9, p. 38 (arXiv v3)
Source: pilloni-2020, §5.1.7, paragraph after Remark 5.1.7.1, p. 23 (author version 17 June 2019)

## ModularityAndLanglandsExtensions:ML.4/unitary-descent-of-gl4-transfer
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.GSp4.symplectic_of_unitaryDescent
Prototype status: omitted
Supplier contracts: C-ARTHUR, C-AUTOMORPHIC
Calegari–Geraghty Lemma6.9 concludes that the Galois realization of a general-type cuspidal Siegel eigenform has the requisite symplectic pairing, hence its absolutely irreducible residual realization has a symplectic pairing. In making the unitary-descent argument explicit, do not infer conjugate self-duality of BC_K(π) merely from essential self-duality π≅π^∨⊗ω. One must supply the algebraic normalization/twist giving the correct conjugate-self-dual unitary parameter, a CM restriction preserving absolute irreducibility, the exact descent theorem, and transport of the Bellaïche–Chenevier pairing back through these operations. Those inputs are still a blueprint proof gap; E10 is rejected as an established error of the source.
Hypothesis: f of general type; K imaginary quadratic with r_f|_{G_K} absolutely irreducible.
Hypothesis: Conditional on ML.0/arthur-dependency-gate (the transfer and Mok's descent).
Source: cg-2020, Proof of Lemma 6.9, §6.2, publ. p. 840 (copy p. 40); arXiv v1 p. 30

## ModularityAndLanglandsExtensions:ML.4/gsp4-gl4-archimedean-transfer
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.GSp4.transfer_infinitesimalCharacter
Prototype status: omitted
Supplier contracts: C-ARTHUR, C-AUTOMORPHIC
Let µ = (a, b; c) be a dominant weight, w = −(a + b + 2c), and π = π^∞ ⊗ π_∞ a discrete automorphic representation of GSp₄(𝔸_ℚ) contributing to the coherent cohomology H^i(X, W_µ)_(2). Then (1) π_∞ has infinitesimal character χ_{(a−1, b−2; −w)}; (2) the transfer π̃_∞ of π_∞ to GL₄(ℝ) (the archimedean parameter composed with the spin embedding GSp₄(ℂ) ⊂ GL₄(ℂ)) has infinitesimal character χ_τ with τ = ((a+b−3−w)/2, (a−b+1−w)/2, (−a+b−1−w)/2, (−a−b+3−w)/2); (3) if π_∞ is tempered it is the (limit of) discrete series π((a−1, b−2; −w), C_i) for a chamber C_i.
Hypothesis: F = ℚ; Calegari–Geraghty's normalisation of weights and of coherent cohomology (§5.3).
Source: cg-2020, Theorem 5.6(2), §5.3, publ. p. 829; quoted from arXiv v1 p. 22 — independently checked downloaded PDF p.29; published-copy pagination where applicable
Source: cg-2020, Proof of Theorem 5.6, publ. p. 829 (copy p. 29)

## ModularityAndLanglandsExtensions:ML.4/limit-discrete-series-packet-types
Assigned layer: ModularityAndLanglandsExtensions:ML.4
Declaration: TauCeti.Arthur.GSp4.generalType_of_limitDiscreteSeries
Prototype status: omitted
Supplier contracts: C-ARTHUR, C-AUTOMORPHIC
Let π = π_f ⊗ π(λ)^h be a discrete automorphic representation of GSp₄(𝔸_ℚ) with λ = (λ₁, 0; c), λ₁ < 0. Then its global Arthur packet is of general, Yoshida or Saito–Kurokawa type (Schmidt 2018, §§1.1–1.2, compared with the archimedean parameters of π(λ)^h in Schmidt 2017). If moreover the Hecke eigensystem of π_f is congruent to a non-Eisenstein maximal ideal (residual Galois representation irreducible), the packet is of general type, and then π_f ⊗ π(λ)^h is automorphic iff π_f ⊗ π(λ)^g is, both with multiplicity one (Pilloni, Proposition 15.2.4.1).
Hypothesis: F = ℚ; λ₁ < 0; conditional on ML.0/arthur-dependency-gate.
Source: pilloni-2020, §15.2.4, proof of Proposition 15.2.4.1, p. 109 (author version)
Source: pilloni-2020, §15.2.4, proof of Proposition 15.2.4.1, p. 109 (author version)

-/
