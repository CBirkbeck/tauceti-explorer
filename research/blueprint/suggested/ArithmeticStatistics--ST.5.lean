import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.Topology.Algebra.Group.CompactOpen
import Mathlib.Topology.Instances.AddCircle.Real
import Mathlib.Data.ZMod.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Topology.Algebra.InfiniteSum.Basic
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import TauCeti.LinearAlgebra.FiniteBilinearModule.Quadratic

/-!
This file is not the roadmap and is not exhaustive. The reader document is definitive.
These suggested Lean forms help contributors and reviewers agree on names and signatures.
All proofs remain unimplemented. Native arithmetic statements requiring supplier interfaces
are explicitly listed at the end; no arbitrary propositions stand in for those interfaces.
The accepted parent supplies the existing group distributions and finite-field counting laws.
-/

noncomputable section
open scoped BigOperators Topology
open Filter

namespace ArithmeticStatistics.ST5

/-! Poonen–Rains, Definitions 2.13–2.14: the new locally compact refinement.
The ambient locally compact Hausdorff topological abelian group is a parameter.
The dual carries Mathlib's compact-open topology. -/
structure LCQuadraticData (V : Type*) [AddCommGroup V] [TopologicalSpace V]
    [IsTopologicalAddGroup V] [T2Space V] [LocallyCompactSpace V] where
  quadratic : QuadraticMap ℤ V (AddCircle (1 : ℝ))
  continuous_quadratic : Continuous quadratic
  adjoint : V ≃ₜ+ (V →ₜ+ AddCircle (1 : ℝ))
  adjoint_apply : ∀ x y, adjoint x y = QuadraticMap.polar quadratic x y

namespace LCQuadraticData
variable {V : Type*} [AddCommGroup V] [TopologicalSpace V]
  [IsTopologicalAddGroup V] [T2Space V] [LocallyCompactSpace V]

/-- The orthogonal subgroup is computed from the actual polar map. -/
def orthogonal (D : LCQuadraticData V) (W : AddSubgroup V) : AddSubgroup V where
  carrier := {x | ∀ y ∈ W, QuadraticMap.polar D.quadratic x y = 0}
  zero_mem' := by sorry
  add_mem' := by sorry
  neg_mem' := by sorry

lemma mem_orthogonal (D : LCQuadraticData V) (W : AddSubgroup V) (x : V) :
    x ∈ D.orthogonal W ↔ ∀ y ∈ W, QuadraticMap.polar D.quadratic x y = 0 := by sorry

lemma polar_formula (D : LCQuadraticData V) (x y : V) :
    D.adjoint x y = D.quadratic (x + y) - D.quadratic x - D.quadratic y := by sorry

lemma polar_self (D : LCQuadraticData V) (x : V) :
    D.adjoint x x = (2 : ℤ) • D.quadratic x := by sorry

lemma adjoint_bijective (D : LCQuadraticData V) : Function.Bijective D.adjoint := by sorry

lemma orthogonal_antitone (D : LCQuadraticData V) {W U : AddSubgroup V} (h : W ≤ U) :
    D.orthogonal U ≤ D.orthogonal W := by sorry

-- Test LCQuadraticData.test_zero: quadratic rather than an arbitrary continuous function.
example (D : LCQuadraticData V) : D.quadratic 0 = 0 := by sorry
-- Test LCQuadraticData.test_diagonal: quadratic homogeneity controls the dyadic case too.
example (D : LCQuadraticData V) (x : V) :
    QuadraticMap.polar D.quadratic x x = (2 : ℤ) • D.quadratic x := by sorry
-- Test LCQuadraticData.test_zero_form: injective self-duality rules out a zero positive-rank form.
example (D : LCQuadraticData V) (h : D.quadratic = 0) : Subsingleton V := by sorry
-- Test LCQuadraticData.test_surjective_dual: injectivity alone is not the definition.
example (D : LCQuadraticData V) (χ : V →ₜ+ AddCircle (1 : ℝ)) :
    ∃ x, D.adjoint x = χ := by sorry

/-- The distinguished subgroup is compact, open, quadratic-isotropic and self-orthogonal. -/
def IsWeaklyMetabolic (D : LCQuadraticData V) (W : AddSubgroup V) : Prop :=
  IsCompact (W : Set V) ∧ IsOpen (W : Set V) ∧
    (∀ x ∈ W, D.quadratic x = 0) ∧ D.orthogonal W = W

lemma weaklyMetabolic_iff (D : LCQuadraticData V) (W : AddSubgroup V) :
    D.IsWeaklyMetabolic W ↔ IsCompact (W : Set V) ∧ IsOpen (W : Set V) ∧
      (∀ x ∈ W, D.quadratic x = 0) ∧ D.orthogonal W = W := by sorry

lemma weaklyMetabolic_isotropic (D : LCQuadraticData V) (W : AddSubgroup V)
    (h : D.IsWeaklyMetabolic W) : ∀ x ∈ W, D.quadratic x = 0 := by sorry

lemma weaklyMetabolic_self_orthogonal (D : LCQuadraticData V) (W : AddSubgroup V)
    (h : D.IsWeaklyMetabolic W) : D.orthogonal W = W := by sorry

lemma weaklyMetabolic_intersection_open (D : LCQuadraticData V) (W U : AddSubgroup V)
    (hW : D.IsWeaklyMetabolic W) (hU : D.IsWeaklyMetabolic U) :
    IsOpen ((W ⊓ U : AddSubgroup V) : Set V) := by sorry

-- Test LCQuadraticData.test_top: a nonzero self-dual space is not its own isotropic subgroup.
example (D : LCQuadraticData V) (h : D.IsWeaklyMetabolic ⊤) : Subsingleton V := by sorry
-- Test LCQuadraticData.test_nonsingular: a single nonzero q-value prevents isotropy.
example (D : LCQuadraticData V) (W : AddSubgroup V) (x : V)
    (hx : x ∈ W) (hq : D.quadratic x ≠ 0) : ¬ D.IsWeaklyMetabolic W := by sorry
-- Test LCQuadraticData.test_finite: finite discrete case retains q-isotropy and self-annihilation.
example [Finite V] [DiscreteTopology V] (D : LCQuadraticData V) (W : AddSubgroup V) :
    D.IsWeaklyMetabolic W ↔ (∀ x ∈ W, D.quadratic x = 0) ∧ D.orthogonal W = W := by sorry

/-- Closed maximal quadratic-isotropic subgroups, before supplying the inverse-limit topology. -/
def MaximalIsotropics (D : LCQuadraticData V) :=
  {W : AddSubgroup V // IsClosed (W : Set V) ∧
    (∀ x ∈ W, D.quadratic x = 0) ∧ D.orthogonal W = W}

lemma maximalIsotropics_injective (D : LCQuadraticData V) :
    Function.Injective (fun Z : D.MaximalIsotropics => Z.val) := by sorry

lemma maximalIsotropics_closed (D : LCQuadraticData V) (Z : D.MaximalIsotropics) :
    IsClosed (Z.val : Set V) := by sorry

lemma maximalIsotropics_self_orthogonal (D : LCQuadraticData V) (Z : D.MaximalIsotropics) :
    D.orthogonal Z.val = Z.val := by sorry

-- Test LCQuadraticData.test_member: q, rather than only its polar form, must vanish.
example (D : LCQuadraticData V) (Z : D.MaximalIsotropics) (x : V) (hx : x ∈ Z.val) :
    D.quadratic x = 0 := by sorry
-- Test LCQuadraticData.test_ext: equality is equality of actual subgroups.
example (D : LCQuadraticData V) (Z Y : D.MaximalIsotropics) (h : Z.val = Y.val) : Z = Y := by sorry
-- Test LCQuadraticData.test_compact_open: the distinguished subgroup gives a point.
example (D : LCQuadraticData V) (W : AddSubgroup V)
    (h : D.IsWeaklyMetabolic W) : ∃ Z : D.MaximalIsotropics, Z.val = W := by sorry

end LCQuadraticData

/-! PR Conjecture 1.4: the finite collection of prime factors shares one parity.
Weights and ranks are indexed only by the selected factors, so the empty case is a singleton. -/
def parityCoupledWeight (k : ℕ) (w : Fin k → ℕ → ℝ) (d : Fin k → ℕ) : ℝ :=
  if k = 0 then 1 else
    if ∀ i j, d i % 2 = d j % 2 then
      (2 : ℝ) ^ (k - 1) * ∏ i, w i (d i)
    else 0

lemma parityCoupledWeight_empty (w : Fin 0 → ℕ → ℝ) (d : Fin 0 → ℕ) :
    parityCoupledWeight 0 w d = 1 := by sorry

lemma parityCoupledWeight_single (w : Fin 1 → ℕ → ℝ) (d : Fin 1 → ℕ) :
    parityCoupledWeight 1 w d = w 0 (d 0) := by sorry

lemma parityCoupledWeight_mixed {k : ℕ} (w : Fin k → ℕ → ℝ) (d : Fin k → ℕ)
    (i j : Fin k) (h : d i % 2 ≠ d j % 2) : parityCoupledWeight k w d = 0 := by sorry

lemma parityCoupledWeight_nonneg {k : ℕ} (w : Fin k → ℕ → ℝ) (d : Fin k → ℕ)
    (hw : ∀ i n, 0 ≤ w i n) : 0 ≤ parityCoupledWeight k w d := by sorry

lemma parityCoupledWeight_total {k : ℕ} (w : Fin k → ℕ → ℝ)
    (hw : ∀ i n, 0 ≤ w i n) (hs : ∀ i, Summable (w i))
    (he : ∀ i, (∑' n : ℕ, w i (2 * n)) = 1 / 2)
    (ho : ∀ i, (∑' n : ℕ, w i (2 * n + 1)) = 1 / 2) :
    Summable (parityCoupledWeight k w) ∧ ∑' d, parityCoupledWeight k w d = 1 := by sorry

-- Test parityCoupledWeight.test_two_equal: the coupling factor for two primes is two.
example (w : Fin 2 → ℕ → ℝ) :
    parityCoupledWeight 2 w (fun _ => 0) = 2 * w 0 0 * w 1 0 := by sorry
-- Test parityCoupledWeight.test_two_mixed: independent prime laws give the wrong support.
example (w : Fin 2 → ℕ → ℝ) :
    parityCoupledWeight 2 w (fun i => i.val) = 0 := by sorry
-- Test parityCoupledWeight.test_empty: n=1 has its unique trivial Selmer group.
example (w : Fin 0 → ℕ → ℝ) : parityCoupledWeight 0 w (fun i => Fin.elim0 i) = 1 := by sorry

/-! Wood Lemma 8.1: an explicit grid-separating analytic product.
There are m+1 coordinates; m=0 is the one-variable case. -/
def woodGridSeparator (m p : ℕ) (b : Fin (m + 1) → ℕ)
    (z : Fin (m + 1) → ℂ) : ℂ :=
  (∏' j : ℕ, (1 - z 0 / (p : ℂ) ^ (b 0 + 1 + j))) *
    ∏ i : Fin m,
      ∏ j ∈ Finset.Icc
        ((∑ k : Fin (m + 1) with k.val ≤ i.val + 1, b k) + 1)
        ((∑ k : Fin (m + 1) with k.val ≤ i.val, b k) + b i.castSucc),
        (1 - z i.succ / (p : ℂ) ^ j)

lemma woodGridSeparator_zero (m p : ℕ) (b : Fin (m + 1) → ℕ) :
    woodGridSeparator m p b 0 = 1 := by sorry

lemma woodGridSeparator_one_variable (p b : ℕ) (z : Fin 1 → ℂ) :
    woodGridSeparator 0 p (fun _ => b) z =
      ∏' j : ℕ, (1 - z 0 / (p : ℂ) ^ (b + 1 + j)) := by sorry

lemma woodGridSeparator_upper {m p : ℕ} (hp : p.Prime)
    (b f : Fin (m + 1) → ℕ) (hb : Antitone b) (hf : Antitone f)
    (hlex : ∃ i : Fin (m + 1), (∀ j, j < i → f j = b j) ∧ b i < f i) :
    woodGridSeparator m p b
      (fun i => (p : ℂ) ^ (∑ j : Fin (m + 1) with j ≤ i, f j)) = 0 := by sorry

lemma woodGridSeparator_diagonal {m p : ℕ} (hp : p.Prime)
    (b : Fin (m + 1) → ℕ) (hb : Antitone b) :
    woodGridSeparator m p b
      (fun i => (p : ℂ) ^ (∑ j : Fin (m + 1) with j ≤ i, b j)) ≠ 0 := by sorry

-- Test woodGridSeparator.test_origin: normalizes the coefficient at the origin.
example : woodGridSeparator 0 2 (fun _ => 0) 0 = 1 := by sorry
-- Test woodGridSeparator.test_upper: the first excluded lattice point is a zero.
example : woodGridSeparator 0 2 (fun _ => 0) (fun _ => 2) = 0 := by sorry
-- Test woodGridSeparator.test_diagonal: separating rather than vanishing on the entire grid.
example : woodGridSeparator 0 2 (fun _ => 0) (fun _ => 1) ≠ 0 := by sorry
-- Test woodGridSeparator.test_second_coordinate: finite polynomial factors matter.
example : woodGridSeparator 1 2 (fun i => if i.val = 0 then 2 else 0)
    (fun i => if i.val = 0 then 4 else 8) = 0 := by sorry

/-- The common-parity product has the product cardinality moment, including an empty index. -/
theorem joint_parity_moments (k m : ℕ) (hm : 0 < m)
    (p : Fin k → ℕ) (hp : ∀ i, 1 < p i) (w : Fin k → ℕ → ℝ)
    (hw : ∀ i n, 0 ≤ w i n)
    (hs : ∀ i (ε : Fin 2), Summable
      (fun n : ℕ => w i (2 * n + ε.val) * (p i : ℝ) ^ (m * (2 * n + ε.val))))
    (he : ∀ i (ε : Fin 2),
      (∑' n : ℕ, w i (2 * n + ε.val) * (p i : ℝ) ^ (m * (2 * n + ε.val))) =
        (1 / 2 : ℝ) * ∏ j ∈ Finset.Icc 1 m, ((p i : ℝ) ^ j + 1)) :
    Summable (fun d : Fin k → ℕ =>
      parityCoupledWeight k w d * ∏ i, (p i : ℝ) ^ (m * d i)) ∧
    (∑' d : Fin k → ℕ, parityCoupledWeight k w d *
      ∏ i, (p i : ℝ) ^ (m * d i)) =
        ∏ i, ∏ j ∈ Finset.Icc 1 m, ((p i : ℝ) ^ j + 1) := by sorry

/-- Wood's multivariate uniqueness theorem, on actual antitone profile functions.
The profile carrier is written inline so it does not duplicate the parent's partition carrier.
All moments are required to be summable; an unspecified value of a nonconvergent tsum is
not a finite-moment hypothesis. -/
theorem wood_grid_uniqueness (s : ℕ) (p m : Fin s → ℕ)
    (hp : ∀ j, (p j).Prime) (hpd : Function.Injective p) (hm : ∀ j, 0 < m j)
    (x y : (∀ j : Fin s, {v : Fin (m j) → ℕ // Antitone v}) → ℝ)
    (hx : ∀ μ, 0 ≤ x μ) (hy : ∀ μ, 0 ≤ y μ) (F : ℝ) (hF : 0 < F)
    (hsx : ∀ ell : (∀ j : Fin s, {v : Fin (m j) → ℕ // Antitone v}), Summable (fun μ => x μ *
      ∏ j, (p j : ℝ) ^ (∑ i, (ell j).val i * (μ j).val i)))
    (hsy : ∀ ell : (∀ j : Fin s, {v : Fin (m j) → ℕ // Antitone v}), Summable (fun μ => y μ *
      ∏ j, (p j : ℝ) ^ (∑ i, (ell j).val i * (μ j).val i)))
    (he : ∀ ell : (∀ j : Fin s, {v : Fin (m j) → ℕ // Antitone v}),
      (∑' μ, x μ * ∏ j, (p j : ℝ) ^ (∑ i, (ell j).val i * (μ j).val i)) =
      (∑' μ, y μ * ∏ j, (p j : ℝ) ^ (∑ i, (ell j).val i * (μ j).val i)))
    (hb : ∀ ell : (∀ j : Fin s, {v : Fin (m j) → ℕ // Antitone v}),
      (∑' μ, x μ * ∏ j, (p j : ℝ) ^ (∑ i, (ell j).val i * (μ j).val i)) ≤
      ∏ j, F ^ m j * (p j : ℝ) ^
        (∑ i, (ell j).val i * ((ell j).val i - 1) / 2)) : x = y := by sorry

-- Minor numerical steps stay in proof sketches, rather than becoming blueprint nodes.
example (r : ℕ) : (20 : ℝ) * r - 15 ≤ (5 : ℝ) ^ r := by sorry
example (a : ℕ) : (5 : ℝ) * 2 ^ a - 8 ≤ (4 : ℝ) ^ a - (2 : ℝ) ^ a := by sorry
example : (5501 / 10000 : ℝ) * (3 / 4) + (4499 / 10000) * (21 / 20) =
    88497 / 100000 := by sorry
example : (5501 / 10000 : ℝ) * (7 / 8) + (4499 / 10000) * (19 / 24) =
    100501 / 120000 := by sorry
example : (5501 / 10000 : ℝ) * (3 / 8) = 16503 / 80000 := by sorry

end ArithmeticStatistics.ST5

/-! Native omission catalogue

These are complete target propositions in original mathematical prose, not Lean
assertions. Each requires actual supplier carriers. No arbitrary proposition-valued
field or invented numerical model replaces an omitted arithmetic interface.
The reader and packet remain definitive. API and test labels below are planned;
they are not elaborated declarations or checked examples.


ArithmeticStatistics:ST.5/refinement-lc-finite-reductions
ArithmeticStatistics.ST5.lc_finite_reductions
For second-countable nondegenerate locally compact quadratic (V,q) with a weakly metabolic W, compact-open q-isotropic subgroups X form a countable directed system ordered by reverse inclusion. X⊥/X is a finite nondegenerate quadratic module. The reduction of Z∈I(V) is ((Z∩X⊥)+X)/X, a maximal isotropic subgroup; reductions compose. If a cofinal decreasing sequence X_j has intersection zero, I(V) is bijective to the inverse limit of these finite isotropic spaces.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Finite quadratic reductions, their transition maps, probability topology, or fppf/theta cohomology interfaces are not exported together at the pin; see G-lc-duality and G-fppf-theta.
Sources: pr Theorem 2.19(a)–(c) and proof, pp. 9–10

ArithmeticStatistics:ST.5/refinement-lc-canonical-measure
ArithmeticStatistics.ST5.lc_canonical_measure
Assume additionally that p is prime and pV=0. The inverse-limit topology on I(V) carries a unique Borel probability whose pushforward to every finite quadratic reduction is the uniform maximal-isotropic law. This measure is invariant under every continuous quadratic isometry of V. Second countability and the inverse-limit Borel structure are part of the assertion.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Finite quadratic reductions, their transition maps, probability topology, or fppf/theta cohomology interfaces are not exported together at the pin; see G-lc-duality and G-fppf-theta.
Sources: pr Theorem 2.19(d)–(e), pp. 9–10

ArithmeticStatistics:ST.5/refinement-lc-random-intersection
ArithmeticStatistics.ST5.lc_random_intersection
Under the preceding hypotheses a random Z∈I(V) is discrete almost surely and Z∩W is finite almost surely. If V has infinite F_p-dimension, dim_Fp(Z∩W) has exactly the parent Poonen–Rains law. A finite-dimensional V instead has the parent finite intersection law, not its infinite limit.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Finite quadratic reductions, their transition maps, probability topology, or fppf/theta cohomology interfaces are not exported together at the pin; see G-lc-duality and G-fppf-theta.
Sources: pr Theorem 2.19(f) and proof, pp. 10–11

ArithmeticStatistics:ST.5/refinement-lc-restricted-product
ArithmeticStatistics.ST5.lc_restricted_product
Let (V_i,q_i,W_i) be nondegenerate weakly metabolic locally compact quadratic modules. On the existing restricted-product group ∏′(V_i,W_i), q((v_i))=Σ_i q_i(v_i) is a finite sum for each point and defines nondegenerate locally compact quadratic data; ∏W_i is weakly metabolic. If I is countable and every V_i is second-countable, the restricted product is second-countable.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Finite quadratic reductions, their transition maps, probability topology, or fppf/theta cohomology interfaces are not exported together at the pin; see G-lc-duality and G-fppf-theta.
Sources: pr Examples 2.17–2.18 and proof, p. 9

ArithmeticStatistics:ST.5/refinement-sha-one-vanishing
ArithmeticStatistics.ST5.sha_one_vanishing
For a global field k, Sha¹(k,M)=ker(H¹(k,M)→∏_v H¹(k_v,M)). It vanishes for constant cyclic Z/n modules, permutation modules and their direct summands. For a finite F_p-module M it also vanishes when every Sylow p-subgroup of Aut(M) is cyclic. In particular Sha¹(k,E[p])=0 for elliptic E and p≠char(k); for an odd-degree hyperelliptic Jacobian with char(k)≠2, Sha¹(k,J[2])=0.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Finite quadratic reductions, their transition maps, probability topology, or fppf/theta cohomology interfaces are not exported together at the pin; see G-lc-duality and G-fppf-theta.
Sources: pr Proposition 3.3 and proof, pp. 13–14

ArithmeticStatistics:ST.5/refinement-selmer-quadratic-intersection
ArithmeticStatistics.ST5.selmer_quadratic_intersection
Let k be global, A/k abelian, and λ:A→Â a self-dual isogeny of odd degree or induced by a symmetric line bundle. The theta-group quadratic maps into local Brauer groups, followed by invariants in R/Z, make V=∏′_v H¹(k_v,A[λ]) a second-countable weakly metabolic locally compact quadratic module. The Kummer subgroup W=∏_v im(Â(k_v)/λA(k_v)) is compact-open maximal isotropic; the image Z of H¹(k,A[λ]) is maximal isotropic. Sel_λ(A)/Sha¹(k,A[λ])≅Z∩W. In characteristic dividing deg λ all cohomology is fppf. Sha¹ of the finite group scheme is not Sha(A).
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Finite quadratic reductions, their transition maps, probability topology, or fppf/theta cohomology interfaces are not exported together at the pin; see G-lc-duality and G-fppf-theta.
Sources: pr Theorem 4.13, Sections 4.1–4.3, pp. 14–21

ArithmeticStatistics:ST.5/refinement-squarefree-selmer-conjecture
ArithmeticStatistics.ST5.squarefree_selmer_conjecture
For squarefree n>1, minimal integral short Weierstrass models over Q ordered by H=max(4|A|³,27B²), the joint dimensions dim_Fp Sel_p(E), p|n, have the common-parity product law. Separately, every positive m-th cardinality moment of Sel_n tends to ∏_{p|n}∏_{j=1}^m(p^j+1). A limiting distribution alone does not establish these unbounded moments. For n=1 the group is trivial.
Hypotheses: This is a stated conjectural proposition, not an established arithmetic limit.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
API ArithmeticStatistics.ST5.squarefree_selmer_conjecture.distribution: Project the empirical joint-frequency assertion.
API ArithmeticStatistics.ST5.squarefree_selmer_conjecture.moments: Project each separately quantified cardinality-moment assertion.
API ArithmeticStatistics.ST5.squarefree_selmer_conjecture.average: The m=1 assertion recovers the parent σ(n) conjecture for squarefree n.
Test ArithmeticStatistics.ST5.squarefree_selmer_conjecture.test_one: n=1 has mass and every moment 1.
Test ArithmeticStatistics.ST5.squarefree_selmer_conjecture.test_two_primes: Mixed parity has limiting mass zero for n=pq.
Test ArithmeticStatistics.ST5.squarefree_selmer_conjecture.test_moment: n=6,m=1 predicts 12, while independent distribution convergence is insufficient to prove it.
Sources: pr Conjecture 1.4(a)–(b), p. 3

ArithmeticStatistics:ST.5/refinement-odd-degree-jacobian-conjecture
ArithmeticStatistics.ST5.odd_degree_jacobian_conjecture
Fix g≥1 over a global field of characteristic not 2. For separable coefficient models y²=f(x) of degree 2g+1 in the source coefficient-height family, the Jacobian Sel_p laws, squarefree composite coupling and moments are predicted to match the elliptic laws; the rank distribution is 0 and 1 with probabilities 1/2 each and average rank 1/2. For degree 2g+2 the same statements are proposed only for odd n. The height denominator counts models, not Jacobian isomorphism classes.
Hypotheses: This is a stated conjectural proposition, not an established arithmetic limit.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
API ArithmeticStatistics.ST5.odd_degree_jacobian_conjecture.law: Project the source-scoped Selmer-law assertion.
API ArithmeticStatistics.ST5.odd_degree_jacobian_conjecture.rank: Project the rank frequencies and separate average-rank assertion.
API ArithmeticStatistics.ST5.odd_degree_jacobian_conjecture.even_degree_odd_n: The even-degree version retains the restriction to odd n.
Test ArithmeticStatistics.ST5.odd_degree_jacobian_conjecture.test_even_degree: The degree-2g+2 assertion does not include n=2.
Test ArithmeticStatistics.ST5.odd_degree_jacobian_conjecture.test_n_one: The Selmer cardinality prediction at n=1 is 1.
Test ArithmeticStatistics.ST5.odd_degree_jacobian_conjecture.test_model_count: Isomorphic Jacobians from different coefficient models retain their model multiplicities.
Sources: pr Conjecture 1.7, p. 4

ArithmeticStatistics:ST.5/refinement-even-genus-two-selmer-conjecture
ArithmeticStatistics.ST5.even_genus_two_selmer_conjecture
For even g>0, separable models of degree 2g+2 in the source family over a global field of characteristic not 2 have predicted dim_F2 Sel_2(J)=1+X_PR. Consequently the predicted mean size is 6 and m-th cardinality moment is 2^m∏_{j=1}^m(2^j+1). This statement is conjectural and does not apply to odd genus.
Hypotheses: This is a stated conjectural proposition, not an established arithmetic limit.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
API ArithmeticStatistics.ST5.even_genus_two_selmer_conjecture.law: The rank law is the one-unit shift.
API ArithmeticStatistics.ST5.even_genus_two_selmer_conjecture.moments: Each m-th cardinality moment carries the factor 2^m.
API ArithmeticStatistics.ST5.even_genus_two_selmer_conjecture.average: The first moment is 6.
Test ArithmeticStatistics.ST5.even_genus_two_selmer_conjecture.test_mean: g=2 gives predicted mean6, not3.
Test ArithmeticStatistics.ST5.even_genus_two_selmer_conjecture.test_support: The shifted law has zero mass at dimension0.
Test ArithmeticStatistics.ST5.even_genus_two_selmer_conjecture.test_odd_genus: No assertion is obtained for g=1 from this proposition.
Sources: pr Conjecture 1.8, p. 4

ArithmeticStatistics:ST.5/refinement-smooth-cylinder-measure
ArithmeticStatistics.ST5.smooth_cylinder_measure
Let p be prime and X/Z_p smooth proper of pure relative dimension d, with X(F_p) nonempty. The requested Oesterlé–Serre measure has total mass #X(F_p)p^(−d); its probability normalization assigns red_e^(−1)(B) mass #B/#X(Z/p^e) for every subset B of the finite reduction. Smooth lifting supplies p^d points per fibre. For a general finite-type model the measure counts the reduction image of X(Z_p), not every nonliftable or nonreduced finite-level point.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native.
Sources: bklpr Proposition 2.1 and Corollary 2.2, pp. 5–6; Lemma 4.8, p. 14

ArithmeticStatistics:ST.5/refinement-ogr-smooth-projective
ArithmeticStatistics.ST5.ogr_smooth_projective
For n≥0 the subfunctor of Gr(n,2n) consisting of rank-n locally direct-summand subbundles on which q(x,y)=Σ_i x_i y_i vanishes is represented by a smooth projective Z-scheme OGr_n of relative dimension n(n−1)/2. This integral statement includes characteristic2 and requires quadratic vanishing, not merely alternating polar isotropy.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native.
Sources: bklpr Section 4.2 and Proposition 4.4, pp. 12–14

ArithmeticStatistics:ST.5/refinement-ogr-components
ArithmeticStatistics.ST5.ogr_components
For n>0, OGr_n is the disjoint union of two isomorphic Z-schemes with geometrically integral fibres, distinguished over every field by parity of dim(Z∩W) for the standard W. Two points Z,Z′ lie on the same component iff dim(Z∩Z′)≡n mod2. For n=0 there is one point, with an empty odd component.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native.
Sources: bklpr Proposition 4.5 and Remark 4.6, p. 14

ArithmeticStatistics:ST.5/refinement-ogr-prime-power-count
ArithmeticStatistics.ST5.ogr_prime_power_count
For prime p, e≥1 and n≥0, #OGr_n(Z/p^e)=p^(e n(n−1)/2)∏_{i=1}^n(1+p^(i−n)). This counts direct summands. At n=0 the count is1; at n=1 it is2 at every level, including p=2. It refines the parent count by giving its smooth-lifting proof contract.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native.
Sources: bklpr Lemma 4.8, p. 14

ArithmeticStatistics:ST.5/refinement-ogr-schubert-dimension
ArithmeticStatistics.ST5.ogr_schubert_dimension
For 0≤r≤n the locus S_(n,r)⊂OGr_n of points with dim(Z∩W)≥r and dim(Z∩W)≡r mod2 is closed and has relative dimension (n−r)(n+r−1)/2. Its exact-rank open stratum has this dimension. Fixed-rank random models use the intrinsic measure on S_(n,r); when r≥2 they cannot be defined by conditioning the ambient OGr law on a positive-probability rank-r event.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native.
Sources: bklpr Section 4.4 and Proposition 4.9, pp. 14–15; Section 5.1, p. 15

ArithmeticStatistics:ST.5/refinement-all-rank-delaunay
ArithmeticStatistics.ST5.all_rank_delaunay
For every prime p and r≥0 the intrinsic fixed-rank isotropic-intersection limit T_r equals the parent alternating cokernel law A_r; for a finite symplectic p-group G its mass is (#G)^(1−r)/#Sp(G) times ∏_{i≥r+1}(1−p^(1−2i)). This is the p-primary Delaunay model with corrected rank parameter r, and is a model theorem for all r. The unconditional arithmetic rank frequencies do not follow from it.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native.
Sources: bklpr Theorem 1.6(c), p. 3; Theorem 1.10, p. 4; Sections 3.6,5.4, pp. 7–11,17–19

ArithmeticStatistics:ST.5/refinement-positive-rank-all-primes
ArithmeticStatistics.ST5.positive_rank_all_primes
Fix r≥1 and independently choose T_p from A_(p,r) for every prime p. Then T=⊕_p T_p is finite almost surely and has the multiplicative Delaunay law with rank parameter r. The exceptional probability is 1−∏_{i≥r+1}(1−p^(1−2i))=O_r(p^(−1−2r)), so its sum over all primes is finite.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native.
Sources: bklpr Theorem 5.15 and proof, p. 21

ArithmeticStatistics:ST.5/refinement-rank-zero-all-primes-infinite
ArithmeticStatistics.ST5.rank_zero_all_primes_infinite
Independently choose T_p from A_(p,0) over all primes. The direct sum is infinite almost surely and assigns probability0 to each specified finite group. For any set P with Σ_{p∈P}1/p finite, ⊕_{p∈P}T_p is instead finite almost surely. The full-prime rank-zero model is not a probability on finite symplectic-group isomorphism classes.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native.
Sources: bklpr Paragraphs following Theorem 5.15, pp. 21–22; derived Borel–Cantelli formulation

ArithmeticStatistics:ST.5/refinement-symplectic-harmonic-weights
ArithmeticStatistics.ST5.symplectic_harmonic_weights
With w_G=#G/#Sp(G), for every N≥1, Σ_{#G=N²}w_G=N^(−1)∏_{p^j∥N}∏_{i=1}^j(1−p^(−2i))^(−1), which lies between1/N and2/N. Thus the bounded-order denominator diverges at least logarithmically, and weights in an order interval [L,N] have O(log(N/L)+1) total mass. The finite divisor product is reciprocal.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native.
Sources: bklpr Lemma 5.17 and Corollary 5.18, pp. 22–23

ArithmeticStatistics:ST.5/refinement-sparse-prime-weighted-limit
ArithmeticStatistics.ST5.sparse_prime_weighted_limit
Let P be primes with Σ_P1/p<∞ and let f on finite symplectic P-groups satisfy Σ_H|f(H)|w_H<∞. Extend f to every finite symplectic G by f(G)=f(G_P). Then lim_{N→∞}(Σ_{#G≤N}f(G_P)w_G)/(Σ_{#G≤N}w_G)=c_PΣ_Hf(H)w_H, where c_P=∏_{p∈P}∏_{i≥1}(1−p^(1−2i))>0. These are group-weight averages, not established elliptic-curve averages.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native.
Sources: bklpr Theorem 5.16 and proof, pp. 22–24

ArithmeticStatistics:ST.5/refinement-injection-moment-conjecture
ArithmeticStatistics.ST5.injection_moment_conjecture
Fix q=p^e with p prime and e≥1. For m≥0 define I_m(S)=#Inj((Z/q)^m,S) on the parent finite Z/q-module carrier. For minimal short Weierstrass curves over Q ordered by invariant height, the conjectural mean of I_m(Sel_q E) is q^(m(m+1)/2). For e>1 this is not a polynomial solely in #S. The parent random-model identity does not transfer to arithmetic without uniform integrability.
Hypotheses: This is a stated conjectural proposition, not an established arithmetic limit.
Omission: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native.
API ArithmeticStatistics.ST5.injection_moment_conjecture.moments: Each m has the specified limiting average.
API ArithmeticStatistics.ST5.injection_moment_conjecture.zero: I_0(S)=1.
API ArithmeticStatistics.ST5.injection_moment_conjecture.uniform_integrability: A bounded (m+1)-st cardinality moment plus empirical distribution convergence suffices for transfer of the m-th injection moment.
Test ArithmeticStatistics.ST5.injection_moment_conjecture.test_zero: m=0 predicts1.
Test ArithmeticStatistics.ST5.injection_moment_conjecture.test_first: m=1 predictsq.
Test ArithmeticStatistics.ST5.injection_moment_conjecture.test_exponent: For q=4, Z/4 has2 injections from Z/4, whereas (Z/2)^2 has0 despite equal cardinality.
Sources: bklpr Conjecture 5.11 and discussion, pp. 20–21

ArithmeticStatistics:ST.5/refinement-kummer-direct-summand
ArithmeticStatistics.ST5.kummer_direct_summand
For any field k, abelian variety A/k and n>0, the Kummer image of A(k)/nA(k) in H¹(k,A[n]) is a Z/n-module direct summand. Interpret cohomology as fppf when char(k)|n. This is an algebraic splitting; continuity of a complement is not asserted.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native.
Sources: bklpr Proposition 6.7 and proof, pp. 27–28

ArithmeticStatistics:ST.5/refinement-adelic-kummer-direct-summand
ArithmeticStatistics.ST5.adelic_kummer_direct_summand
For global k, A/k abelian and n>0 the adelic Kummer image is an algebraic direct summand of the restricted-product group H¹(A_k,A[n]). Choose complements C_v to each local Kummer image, using the good unramified integral reference subgroup outside finitely many places; the global complement is ⊕_v C_v. Replacing it by ∏_v C_v generally leaves the restricted product.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native.
Sources: bklpr Corollary 6.8 and proof, p. 28

ArithmeticStatistics:ST.5/refinement-global-image-splitting-conjecture
ArithmeticStatistics.ST5.global_image_splitting_conjecture
Fix a global field k and n≥1, with the source bounded-coefficient-height family of elliptic curves (long Weierstrass equations in characteristic2 or3). The image of H¹(k,E[n])→H¹(A_k,E[n]) is conjectured to be a Z/n-module direct summand for a density-one subset. The local Kummer splitting theorem does not prove this global-image assertion.
Hypotheses: This is a stated conjectural proposition, not an established arithmetic limit.
Omission: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native.
API ArithmeticStatistics.ST5.global_image_splitting_conjecture.density: The exceptional height-frequency tends to0.
API ArithmeticStatistics.ST5.global_image_splitting_conjecture.one: n=1 has trivial cohomology and splitting.
API ArithmeticStatistics.ST5.global_image_splitting_conjecture.family: The family uses the source height and characteristic-appropriate equations.
Test ArithmeticStatistics.ST5.global_image_splitting_conjecture.test_one: n=1 satisfies splitting for every model.
Test ArithmeticStatistics.ST5.global_image_splitting_conjecture.test_local_global: A local complement alone does not supply a complement to the global image.
Test ArithmeticStatistics.ST5.global_image_splitting_conjecture.test_char_two: In characteristic2 the denominator does not use short Weierstrass equations.
Sources: bklpr Conjecture 6.9, p. 28

ArithmeticStatistics:ST.5/refinement-trivial-action-global-splitting
ArithmeticStatistics.ST5.trivial_action_global_splitting
Let k be global, E/k elliptic, n≥1 prime to char(k), and suppose G_k acts trivially on E[n]. Then the image of H¹(k,E[n]) in H¹(A_k,E[n]) is an algebraic direct summand. This special thin family does not prove the density-one conjecture.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs actual scheme-valued OGr/Schubert points, symplectic finite-group classes, probability kernels or fppf cohomology carrier; see R-integral-grassmannian, G-ogr and G-native.
Sources: bklpr Lemma 6.10 and Lemma 6.11, p. 28

ArithmeticStatistics:ST.5/refinement-wood-coefficient-bound
ArithmeticStatistics.ST5.wood_coefficient_bound
Let p be prime and b∈N^(m+1) antitone. The separator H_b is entire and its Taylor coefficients a_d satisfy |a_d|≤E_b p^(−b₀d₀−d₀(d₀+1)/2) for one E_b>0; coefficients vanish unless Σ_{i=1}^m d_i≤b₀−b_m (hence≤b₀). The infinite-product head has coefficient c_n=(−1)^n p^(−b₀n)/∏_{j=1}^n(p^j−1). Absolute values are necessary for exchanging signed sums.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs a proved entire multivariate coefficient interface or the parent finite-group/partition realization and normalized group laws; see G-wood-analysis.
Sources: wood Lemma 8.1 and proof, pp. 28–29, strengthened absolute-value formulation used in Theorem 8.2

ArithmeticStatistics:ST.5/refinement-wood-subgroup-bound
ArithmeticStatistics.ST5.wood_subgroup_bound
There is an absolute F>0 such that for every prime p and finite abelian p-group G of partition type λ, Σ_{G₁≤G}|∧²G₁|≤F^(λ₁) p^(Σ_i λ′_i(λ′_i−1)/2), where λ′ is the conjugate partition and λ₁ is the exponent length. The trivial group contributes1. For finitely many primes the bound factors over primary parts.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs a proved entire multivariate coefficient interface or the parent finite-group/partition realization and normalized group laws; see G-wood-analysis.
Sources: wood Lemma 7.4 and proof, pp. 27–28

ArithmeticStatistics:ST.5/refinement-wood-bounded-moment-limit
ArithmeticStatistics.ST5.wood_bounded_moment_limit
Let a≥1 and A_a be finite abelian group classes of exponent dividing a. Let X_n be random finitely generated abelian groups and suppose E#Sur(X_n,G)→M_G for every G∈A_a, with 0≤M_G≤|∧²G|. For every H∈A_a, Pr(X_n/aX_n≅H) has a limit; these limiting masses sum to1 and have the moments M_G. A second sequence with the same moments has the same limiting quotient law. The theorem concerns X_n/aX_n, not an unproved full-group limit.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs a proved entire multivariate coefficient interface or the parent finite-group/partition realization and normalized group laws; see G-wood-analysis.
Sources: woodmat Theorem 3.1, pp. 9–10; proof inputs Wood Lemma 7.4, Theorems 8.2–8.3, pp. 27–32

ArithmeticStatistics:ST.5/refinement-balanced-three-rank-zero
ArithmeticStatistics.ST5.balanced_three_rank_zero
Let F be a positive-density large family of minimal integral elliptic curves over Q ordered by H=max(4|A|³,27B²). Suppose root signs have limiting proportions1/2 each. Then the lower density in F of trivial3-Selmer group, hence Mordell–Weil rank0, is at least1/4. The mean3-Selmer bound≤4 and density-zero rational3-torsion are used.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bs3 Theorem 41 and proof, pp. 21–22

ArithmeticStatistics:ST.5/refinement-balanced-three-rank-one
ArithmeticStatistics.ST5.balanced_three_rank_one
Under the preceding large-family/root-balance hypotheses, if Sha(E) is finite for every E∈F, the lower density of Mordell–Weil rank1 is at least5/12. A one-dimensional3-Selmer group has rank1 because the finite alternating Cassels–Tate pairing forces dim Sha[3] even. The Sha-finiteness hypothesis is retained.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bs3 Theorem 41 and proof, pp. 21–22

ArithmeticStatistics:ST.5/refinement-positive-three-ranks
ArithmeticStatistics.ST5.positive_three_ranks
Among all minimal elliptic curves over Q ordered by invariant height, a positive lower proportion has rank0. If all elliptic curves in the source family have finite Sha, a positive lower proportion has rank1. Produce a positive-density finite union of large families invariant under the height-preserving −1 twist with opposite root signs; root-number balance of the full elliptic family is not assumed.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bs3 Theorem 4, p. 1; Theorem 5, p. 2; Section 4.1, pp. 21–22

ArithmeticStatistics:ST.5/refinement-analytic-rank-zero-criterion
ArithmeticStatistics.ST5.analytic_rank_zero_criterion
Let E/Q have trivial3-Selmer group, good ordinary reduction at3, irreducible residual action on E[3], and a prime ℓ≠3 with ℓ∥N_E at which the residual representation is ramified. Then L(E,1)≠0. This exact special Skinner–Urban input moves to the present lower-tier plan; its Iwasawa main-conjecture proof remains the stated G-analytic gap.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bs3 Theorem 43, pp. 22–23 (source attribution to Skinner–Urban)

ArithmeticStatistics:ST.5/refinement-positive-analytic-rank-zero
ArithmeticStatistics.ST5.positive_analytic_rank_zero
A positive lower proportion of all height-ordered minimal elliptic curves over Q has both algebraic and analytic rank0. More precisely, in a positive-density large family with good ordinary3, 5∥Δ_E and balanced root signs, at least1/4 have analytic rank0, after deleting the density-zero reducible residual3-action subset.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bs3 Theorem 6, p. 2; Theorem 44 and proof, p. 23

ArithmeticStatistics:ST.5/refinement-positive-weak-bsd
ArithmeticStatistics.ST5.positive_weak_bsd
A positive lower proportion of the height-ordered full elliptic family satisfies rank E(Q)=ord_(s=1)L(E,s)=0. This is the rank assertion of BSD, with no leading-coefficient or regulator formula asserted.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bs3 Corollary 7, p. 2; final deduction, p. 23

ArithmeticStatistics:ST.5/refinement-two-selmer-nonlift
ArithmeticStatistics.ST5.two_selmer_nonlift
In the full minimal elliptic family over Q ordered by invariant height, liminf_X average(#Sel₂(E)−#im([2]:Sel₄(E)→Sel₂(E)))≥3/5. Since the limiting mean#Sel₂ is3, at least1/5 of all2-Selmer elements in aggregate fail to lift. This is not a1/5 lower proportion of curves.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bs4 Theorem 3, p. 1; final deduction, pp. 21–22

ArithmeticStatistics:ST.5/refinement-five-basic-bounds
ArithmeticStatistics.ST5.five_basic_bounds
In every large family F of minimal elliptic curves over Q ordered by invariant height, limsup average(dim_F5 Sel₅)≤21/20 and lower density(dim Sel₅≤1)≥19/24. These hold from mean#Sel₅=6, after controlling rational5-torsion; Mordell–Weil rank is bounded by the reduced Selmer dimension.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bs5 Proposition 38, p. 28

ArithmeticStatistics:ST.5/refinement-five-balanced-bounds
ArithmeticStatistics.ST5.five_balanced_bounds
If the large family F also has limiting root signs1/2 each, limsup average(dim Sel₅)≤3/4, lower density(dim Sel₅≤1)≥7/8, and lower density(dim Sel₅=0)≥3/8. Apply parity after removing the negligible torsion subset. All estimates use finite-height inequalities so independent limsups are not added.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bs5 Proposition 40 and proof, p. 29, with corrected limiting argument

ArithmeticStatistics:ST.5/refinement-five-root-balanced-family
ArithmeticStatistics.ST5.five_root_balanced_family
There is a finite union F of large congruence families, invariant under E↦E^(−1), on which root signs are opposite and whose height density in all minimal elliptic curves is greater than5501/10000. The local dyadic and3-adic tables, infinite good-prime exclusions and positive/negative discriminant archimedean masses are part of the construction; the two real signs do not each have weight1/2.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bs5 Theorem 6, pp. 4–5; Section 5, Propositions 35–37 and local tables, pp. 23–27

ArithmeticStatistics:ST.5/refinement-five-full-average-rank
ArithmeticStatistics.ST5.five_full_average_rank
In the full height-ordered minimal elliptic family, limsup average rank≤88497/100000<177/200=.885. The mixture uses the root-balanced subfamily with density≥.5501 and its complement; the5-Selmer average bound on the complement follows by finite-height subtraction from the full and subfamily means.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bs5 Theorem 3, p. 2; final deduction, pp. 29–30

ArithmeticStatistics:ST.5/refinement-five-full-low-rank
ArithmeticStatistics.ST5.five_full_low_rank
In the full height-ordered minimal elliptic family, lower density(rank E≤1)≥67/80=.8375. The stronger rational mixture lower bound is .5501·7/8+.4499·19/24=100501/120000. This is a statement about Mordell–Weil ranks bounded by Selmer dimensions, without a Sha-finiteness hypothesis.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bs5 Theorem 4, p. 2; final deduction, p. 30

ArithmeticStatistics:ST.5/refinement-five-full-rank-zero
ArithmeticStatistics.ST5.five_full_rank_zero
In the full height-ordered minimal elliptic family, lower density(rank E=0)≥1031/5000=.2062. The unrounded lower bound .5501·3/8=16503/80000 is obtained from the balanced subfamily alone. No proportion of Sha-finite curves is assumed.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bs5 Theorem 5, p. 2; final deduction, p. 30

ArithmeticStatistics:ST.5/refinement-jacobian-marked-average
ArithmeticStatistics.ST5.jacobian_marked_average
Count locally soluble curves z²=f(x,y), with f an irreducible integral binary quartic, up to the source twisted PGL₂(Q) action, ordered by invariant height of Jac(C). The limsup average#Sel₂(Jac C) is at most6. This denominator counts the quartic genus-one objects, not unweighted elliptic Jacobians or arbitrary coefficient vectors; it is a key input to the parent second-moment bound≤15.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bss Theorem 1.2, p. 2; monicization and proof assembly, Sections 3–7, pp. 13–47

ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average
ArithmeticStatistics.ST5.abelian_three_isogeny_average
Let F be a number field, φ:A→A′ a degree3 isogeny of abelian varieties, and Σ⊂F×/F×² nonempty and defined by finitely many local conditions. Count each squareclass once, ordered by H(s)=∏_{v_finite:v(s) odd}Nv. Then average_s∈Σ#Sel_(φ_s)(A_s)=1+average_Σ c(φ_s). At finite places the local average uses the pullback of normalized additive Haar measure on O_v, not uniform mass on squareclasses; archimedean factors use the finite representative-window convention of ST.2.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bklos Theorem 2.1, pp. 2–3; Sections 3–8, pp. 5–12

ArithmeticStatistics:ST.5/refinement-endomorphism-rank-bound
ArithmeticStatistics.ST5.endomorphism_rank_bound
Let ψ:A→A factor over F as a nonempty chain of degree3 isogenies φ_i. Assume additionally a constant c>0, independent of s, such that log₃#(A_s(F)/ψ_s A_s(F))≥c·rank_Z A_s(F) for every quadratic twist s. Then limsup average rank A_s(F)≤c^(−1)Σ_i(1+average c(φ_(i,s)))<∞. The source’s unrestricted ψ claim is retained as G-endomorphism, because its e/t index estimate is not justified for a general Z[ψ]-module.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bklos Theorem 2.2, p. 3; Section 9 proof, pp. 12–13, corrected conditional formulation

ArithmeticStatistics:ST.5/refinement-multiplication-three-rank-bound
ArithmeticStatistics.ST5.multiplication_three_rank_bound
If [3]:A→A factors over F as a chain of degree3 isogenies, the average rank of all quadratic twists A_s/F under H(s)=∏_{v(s) odd}Nv is bounded. In this case #A_s(F)/3A_s(F)≥3^(rank A_s(F)), so the preceding theorem applies with c=1. This conclusion needs no assumption that Z[ψ]-modules have uniform index e/t.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bklos Abstract, p. 1; Theorem 2.2 and Section 9, pp. 3,12–13, source-faithful multiplication-by-three specialization

ArithmeticStatistics:ST.5/refinement-finite-extension-rank-bound
ArithmeticStatistics.ST5.finite_extension_rank_bound
For every abelian A/F there is a finite extension L/F such that the average ranks of all twists of A_L over L are bounded in the L-squareclass height ordering. Take L making A[3] rational; a complete flag in A[3](L) factors multiplication by3 into degree3 isogenies. Neither a bound over the original F nor uniformity as L varies is asserted.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bklos Theorem 2.3 and preceding deduction, p. 3

ArithmeticStatistics:ST.5/refinement-elliptic-explicit-twist-rank
ArithmeticStatistics.ST5.elliptic_explicit_twist_rank
Let φ:E→E′ be a3-isogeny over a number field F and Σ a nonempty family defined by finitely many local conditions. In the unweighted squareclass height ordering, limsup average rank E_s(F)≤average_Σ(|t(s)|+3^(−|t(s)|)), with t(s)=ord₃c(φ_s). Only finitely many t-values occur; each stratum is a finite union of local rectangles.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bklos Theorem 2.4, pp. 3–4; Section 9.1, p. 13

ArithmeticStatistics:ST.5/refinement-signature-positive-twists
ArithmeticStatistics.ST5.signature_positive_twists
For a number field F and an elliptic curve E/F with a3-isogeny: if F is totally real, positive lower proportions of twists have rank0 and3-Selmer rank1; if F has at most one complex place and at least one real place, a positive lower proportion has3-Selmer rank1; if F is imaginary quadratic, a positive lower proportion has Mordell–Weil rank0 or1 in union. These statements use the squareclass height; the last does not give both proportions separately.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bklos Theorem 2.6(i)–(iii), pp. 4–5; Sections 10.3,10.4, pp. 16–18

ArithmeticStatistics:ST.5/refinement-complex-place-obstruction
ArithmeticStatistics.ST5.complex_place_obstruction
For every number field F with r₂ complex places, there exists an elliptic E/F with a3-isogeny such that dim_F3 Sel₃(E_s)≥r₂ for every quadratic twist s. Thus signature hypotheses in the positive-proportion theorem cannot simply be removed. This is an existence construction, not a typical-curve law.
Hypotheses: All parameter restrictions in the statement are hypotheses.
Omission: Needs the supplied arithmetic family, quotient height count, Selmer/Kummer maps, geometric Jacobian, or elliptic L-function carrier; see the node’s direct requests and G-native.
Sources: bklos Final assertion of Theorem 2.6, p. 4; Example 13.3 and Proposition 13.4, pp. 22–23
-/
