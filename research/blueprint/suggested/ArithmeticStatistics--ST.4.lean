import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Data.Set.Card
import Mathlib.Data.Nat.Choose.Sum
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Squarefree.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Algebra.Order.LiminfLimsup

/-!
This file is not the roadmap and is not exhaustive. The accompanying roadmap
README is definitive. These suggested Lean forms help contributors and reviewers
converge on names and signatures; they do not claim an implementation.

The coefficient adapters below use the imported ST.0/ST.1 model conventions.
The four new definitions are concrete: local point admissibility, intersection
of local restrictions, the odd-component bound, and the rank-one sieve family.
No opaque arithmetic predicates or arbitrary count functions replace missing
geometric objects. The omission register names the geometric target signatures
that require the supplier interfaces recorded in the packet.
-/

noncomputable section
open scoped BigOperators
open Filter
set_option autoImplicit false
set_option linter.unusedVariables false

namespace ArithmeticSelmerRefinement

private instance primeFact (p : Nat.Primes) : Fact (p : ℕ).Prime := ⟨p.property⟩
private abbrev LocalCoeff (n : ℕ) (p : Nat.Primes) := Fin (n + 1) → ℤ_[(p : ℕ)]
private def binaryValue {K : Type*} [CommRing K] (n : ℕ)
    (a : Fin (n + 1) → K) (x y : K) : K :=
  ∑ i, a i * x ^ (n - i.val) * y ^ i.val
private def localPoint (n : ℕ) (p : Nat.Primes) (a : LocalCoeff n p) : Prop :=
  ∃ x y z : ℚ_[(p : ℕ)], (x ≠ 0 ∨ y ≠ 0) ∧
    z ^ 2 = binaryValue n (fun i => (a i : ℚ_[(p : ℕ)])) x y

-- refinement-admissibility. L is the collection of actual p-adic closures
-- supplied by the imported congruence-family interface. For closed L, allowing
-- singular point-bearing equations gives the same condition: perturb the
-- coefficients while retaining a point with nonzero z and nonzero discriminant.
def IsAdmissible (n : ℕ) (L : (p : Nat.Primes) → Set (LocalCoeff n p)) : Prop :=
  ∃ P : ℕ, ∀ p : Nat.Primes, P < (p : ℕ) → ∀ a,
    localPoint n p a → a ∈ L p

lemma admissible_threshold (n : ℕ) (L : (p : Nat.Primes) → Set (LocalCoeff n p))
    : IsAdmissible n L ↔
    ∃ P : ℕ, ∀ p : Nat.Primes, P < (p : ℕ) →
      {a | localPoint n p a} ⊆ L p := by
  sorry
lemma admissible_mono (n : ℕ) (L M : (p : Nat.Primes) → Set (LocalCoeff n p))
    (h : IsAdmissible n L) (hLM : ∀ p, L p ⊆ M p) : IsAdmissible n M := by
  sorry
lemma admissible_finite_change (n P : ℕ)
    (L M : (p : Nat.Primes) → Set (LocalCoeff n p))
    (h : IsAdmissible n L) (hLM : ∀ p : Nat.Primes, P < (p : ℕ) → L p = M p) :
    IsAdmissible n M := by
  sorry
lemma admissible_of_local_points (n : ℕ)
    (L : (p : Nat.Primes) → Set (LocalCoeff n p))
    (h : ∀ p, {a | localPoint n p a} ⊆ L p) : IsAdmissible n L := by
  sorry
-- ArithmeticSelmerRefinement.admissible_univ
example (n : ℕ) : IsAdmissible n (fun _ => Set.univ) := by sorry
-- ArithmeticSelmerRefinement.admissible_finite_exclusion
example (n P : ℕ) : IsAdmissible n
    (fun p => if (p : ℕ) ≤ P then ∅ else Set.univ) := by sorry
-- ArithmeticSelmerRefinement.admissible_empty_nonexample
example (n : ℕ) : ¬ IsAdmissible n (fun _ => ∅) := by sorry

-- refinement-restricted-selmer-set. In the geometric application S is Sel_2(J¹),
-- loc takes a cover to its local Pic¹/2J class, and I_v is the effective-divisor
-- image. These are supplied objects and maps, not invented arithmetic conditions.
def restrictedSelmerSet {A V : Type*} {Q : V → Type*} (S : Set A)
    (loc : (v : V) → A → Q v) (I : (v : V) → Set (Q v)) : Set A :=
  {s | s ∈ S ∧ ∀ v, loc v s ∈ I v}
lemma restricted_mem {A V : Type*} {Q : V → Type*} (S : Set A)
    (loc : (v : V) → A → Q v) (I : (v : V) → Set (Q v)) (s : A) :
    s ∈ restrictedSelmerSet S loc I ↔ s ∈ S ∧ ∀ v, loc v s ∈ I v := by sorry
lemma restricted_subset {A V : Type*} {Q : V → Type*} (S : Set A)
    (loc : (v : V) → A → Q v) (I : (v : V) → Set (Q v)) :
    restrictedSelmerSet S loc I ⊆ S := by sorry
lemma restricted_finite {A V : Type*} {Q : V → Type*} (S : Set A)
    (loc : (v : V) → A → Q v) (I : (v : V) → Set (Q v)) (hS : S.Finite) :
    (restrictedSelmerSet S loc I).Finite := by sorry
lemma restricted_mono {A V : Type*} {Q : V → Type*} (S : Set A)
    (loc : (v : V) → A → Q v) (I J : (v : V) → Set (Q v))
    (hIJ : ∀ v, I v ⊆ J v) :
    restrictedSelmerSet S loc I ⊆ restrictedSelmerSet S loc J := by sorry
lemma restricted_card_le {A V : Type*} {Q : V → Type*} (S : Set A)
    (loc : (v : V) → A → Q v) (I : (v : V) → Set (Q v)) (hS : S.Finite) :
    (restrictedSelmerSet S loc I).ncard ≤ S.ncard := by sorry
lemma restricted_transport {A B V : Type*} {Q : V → Type*} (e : A ≃ B)
    (S : Set A) (loc : (v : V) → A → Q v) (I : (v : V) → Set (Q v)) :
    e '' restrictedSelmerSet S loc I =
      restrictedSelmerSet (e '' S) (fun v b => loc v (e.symm b)) I := by sorry
-- ArithmeticSelmerRefinement.restricted_one_place
example : restrictedSelmerSet (Set.univ : Set (Fin 3))
    (fun _ : Unit => id) (fun _ => {0, 2}) = {0, 2} := by sorry
-- ArithmeticSelmerRefinement.restricted_all_places
example : restrictedSelmerSet (Set.univ : Set (Fin 3))
    (fun _ : Bool => id) (fun b => if b then {0, 1} else {1, 2}) = {1} := by sorry
-- ArithmeticSelmerRefinement.restricted_no_places
example (S : Set ℕ) : restrictedSelmerSet (Q := fun _ : Empty => ℕ) S
    (fun v : Empty => Empty.elim v) (fun v : Empty => Empty.elim v) = S := by sorry
-- ArithmeticSelmerRefinement.restricted_empty_image
example (S : Set (Fin 3)) : restrictedSelmerSet S
    (fun _ : Unit => id) (fun _ => ∅) = ∅ := by sorry

-- refinement-odd-component-bound. Binomial terms beyond m are zero.
def oddComponentBound (m k : ℕ) : ℕ :=
  ∑ j ∈ (Finset.range (k + 1)).filter (fun j => Odd j), Nat.choose m j
lemma component_bound_mono (m k l : ℕ) (hkl : k ≤ l) :
    oddComponentBound m k ≤ oddComponentBound m l := by sorry
lemma component_bound_le (m k : ℕ) (hm : 0 < m) :
    oddComponentBound m k ≤ 2 ^ (m - 1) := by sorry
lemma component_bound_saturated (m k : ℕ) (hm : 0 < m) (h : m ≤ k) :
    oddComponentBound m k = 2 ^ (m - 1) := by sorry
lemma component_bound_strict (m k : ℕ) (hm : 0 < m) (hk : Odd k) (h : k < m - 1) :
    oddComponentBound m k < 2 ^ (m - 1) := by sorry
lemma component_bound_ratio_tendsto (k : ℕ) :
    Tendsto (fun m : ℕ => (oddComponentBound m k : ℝ) / 2 ^ (m - 1))
      atTop (nhds 0) := by sorry
-- ArithmeticSelmerRefinement.component_three_one
example : oddComponentBound 3 1 = 3 := by sorry
-- ArithmeticSelmerRefinement.component_five_three
example : oddComponentBound 5 3 = 15 := by sorry
-- ArithmeticSelmerRefinement.component_zero
example (m : ℕ) : oddComponentBound m 0 = 0 := by sorry
-- ArithmeticSelmerRefinement.component_saturation
example : oddComponentBound 3 9 = 4 := by sorry
-- ArithmeticSelmerRefinement.component_single
example (k : ℕ) (hk : 0 < k) : oddComponentBound 1 k = 1 := by sorry

private def delta (A B : ℤ) : ℤ := -4 * A ^ 3 - 27 * B ^ 2
private def pointsAtFive (A B : ℤ) : ℕ :=
  1 + Nat.card {xy : ZMod 5 × ZMod 5 //
    xy.2 ^ 2 = xy.1 ^ 3 + (A : ZMod 5) * xy.1 + (B : ZMod 5)}
private def curveHeight (A B : ℤ) : ℝ := max (4 * |(A : ℝ)| ^ 3) (27 * (B : ℝ) ^ 2)
-- refinement-rank-one-family. Concrete equivalent tests for the local conditions
-- of Bhargava--Skinner §2, not a redefinition of good/ordinary reduction.
def RankOneFamily : Set (ℤ × ℤ) := {ab |
  let A := ab.1; let B := ab.2
  (8 ∣ A ∧ ¬ 16 ∣ A) ∧ (16 ∣ B ∧ ¬ 32 ∣ B) ∧
  ∃ d : ℤ, delta A B = 256 * d ∧ 0 < d ∧ Odd d ∧ Squarefree d ∧
    Int.gcd (delta A B) 195 = 1 ∧ (∃ u : ℤ, delta A B % 39 = u ^ 2 % 39) ∧
    7 ∣ d ∧ (¬ ∃ u : ZMod 7, u ^ 2 = (864 * B : ℤ)) ∧
    pointsAtFive A B % 5 ≠ 1}
lemma rankOne_delta (A B : ℤ) (h : (A, B) ∈ RankOneFamily) :
    ∃ d : ℤ, delta A B = 256 * d ∧ 0 < d ∧ Odd d ∧ Squarefree d := by sorry
lemma rankOne_good_discriminant (A B : ℤ) (h : (A, B) ∈ RankOneFamily) :
    delta A B ≠ 0 ∧ Int.gcd (delta A B) 195 = 1 := by sorry
lemma rankOne_ordinary_test (A B : ℤ) (h : (A, B) ∈ RankOneFamily) :
    pointsAtFive A B % 5 ≠ 1 := by sorry
lemma rankOne_twist_disjoint (A B : ℤ) (h : (A, B) ∈ RankOneFamily) :
    ((-39 : ℤ) ^ 2 * A, (-39 : ℤ) ^ 3 * B) ∉ RankOneFamily := by sorry
lemma rankOne_twist_height (A B : ℤ) :
    curveHeight ((-39 : ℤ) ^ 2 * A) ((-39 : ℤ) ^ 3 * B) =
      (39 : ℝ) ^ 6 * curveHeight A B := by sorry
-- ArithmeticSelmerRefinement.rankOne_example
example : (-136, 16) ∈ RankOneFamily := by sorry
-- ArithmeticSelmerRefinement.rankOne_wrong_seven
example : (-136, -16) ∉ RankOneFamily := by sorry
-- ArithmeticSelmerRefinement.rankOne_wrong_sign
example : (136, 16) ∉ RankOneFamily := by sorry
-- ArithmeticSelmerRefinement.rankOne_wrong_two
example : (-16, 16) ∉ RankOneFamily := by sorry

-- ArithmeticSelmerRefinement.rankOne_wrong_ordinary
example : (-1000, 1136) ∉ RankOneFamily := by sorry

-- Imported ST.1 coefficient convention: x³,x²y,x²z,xy²,xyz,xz²,y³,y²z,yz²,z³.
private def ternaryValue (c : Fin 10 → ℤ) (x : Fin 3 → ℚ) : ℚ :=
  c 0 * x 0 ^ 3 + c 1 * x 0 ^ 2 * x 1 + c 2 * x 0 ^ 2 * x 2 +
  c 3 * x 0 * x 1 ^ 2 + c 4 * x 0 * x 1 * x 2 + c 5 * x 0 * x 2 ^ 2 +
  c 6 * x 1 ^ 3 + c 7 * x 1 ^ 2 * x 2 + c 8 * x 1 * x 2 ^ 2 + c 9 * x 2 ^ 3
private lemma ternary_box_finite (T : ℕ) :
    {c : Fin 10 → ℤ | ∀ i, |c i| ≤ (T : ℤ)}.Finite := by sorry
-- refinement-positive-plane-cubic-solubility: actual coefficient-box denominator.
-- Plane-cubic Theorem 2 p.3, proof pp.11–13; the multiset-to-vector
-- proof uses the fixed multiplicity bound recorded in the packet.
theorem positive_plane_cubic_solubility :
    0 < liminf (fun T : ℕ =>
      ({c : Fin 10 → ℤ | (∀ i, |c i| ≤ (T : ℤ)) ∧
        ∃ x : Fin 3 → ℚ, x ≠ 0 ∧ ternaryValue c x = 0}.ncard : ℝ) /
      (((2 * T + 1) ^ 10 : ℕ) : ℝ)) atTop := by sorry

/-!
Explicit target-signature omission register (G-native).

Every target below is stated in mathematics in the definitive README/packet.
The named supplier objects/maps are unavailable at the pin, so no assumed
Prop fields or arbitrary counting functions are used to imitate a signature.
The native signatures are required remaining work after the supplier exports.

ArithmeticStatistics:ST.4/refinement-degree-one-arithmetic-comparison
Proposed declaration: ArithmeticSelmerRefinement.degree_one_arithmetic_comparison
For a smooth hyperelliptic C/Q of genus g≥1 with a Q-rational degree-two hyperelliptic divisor class d represented by a divisor, and actual degree-one divisors over every completion, every rational Picard-scheme point descends to an actual line bundle/divisor. Thus J¹(Q)≠∅ iff C has a point over some finite odd-degree extension iff index(C)=1; otherwise index(C)=2. Here index is the positive generator of the degree subgroup of rational divisors, not the minimum degree of a closed point.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-generic-weierstrass-class
Proposed declaration: ArithmeticSelmerRefinement.generic_weierstrass_class
In the coefficient-height genus-g model family, outside a density-zero exceptional set, the finite J[2]-torsor W[2]={P∈J¹:2P=d}, the fibre of the canonical map J¹→J² over the hyperelliptic class d, defines a nonzero class in H¹(Q,J[2]), and J(Q)[2]=0. On the subfamily with everywhere locally soluble actual Div¹, W[2] belongs to Sel₂(J). These conclusions hold relatively in every such sieve-controlled congruence subfamily of positive lower density.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-pencil-local-global-weight
Proposed declaration: ArithmeticSelmerRefinement.pencil_local_global_weight
For G=SL_(2g+2)/μ₂ acting on pairs of symmetric matrices, define w(v) as the reciprocal of the imported finite rational-orbit weight when v is locally soluble and its invariant belongs to F, and zero otherwise. The global weight is the product of its integral-local counterparts, is locally constant off the discriminant locus, and equals one at sufficiently large odd primes with p²∤Disc(f). The group is the central quotient as an algebraic group; rational points cannot be replaced by SL_n(Q)/{±1}.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-pencil-selmer-weighted-count
Proposed declaration: ArithmeticSelmerRefinement.pencil_selmer_weighted_count
For F with locally soluble actual Div¹ and coefficients in 16Z, the sum of #Sel₂(J¹_f) over H(f)<X is at most the sum of the weighted integral-orbit counts N_w over the real soluble components, plus o(X^(n+1)), after generic rational stabilizers are separated. The left side itself equals the unweighted rational locally soluble orbit count represented integrally. An individual rational class with integral representatives v_i satisfies Σ_i w(v_i)/#Stab_Z(v_i)=1/#Stab_Q(v). One may use Σ_i w(v_i)=1 only when the rational stabilizer is trivial.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-hyperelliptic-local-mass-ratio
Proposed declaration: ArithmeticSelmerRefinement.hyperelliptic_local_mass_ratio
For an abelian variety J/Q_v of dimension g and a nonempty J-torsor T(Q_v), the finite torsor quotient T(Q_v)/2J(Q_v) has the same cardinality as J(Q_v)/2J(Q_v). For the hyperelliptic Jacobian this gives ρ_v=#(J¹(Q_v)/2J(Q_v))/#J[2](Q_v): ρ_∞=2^(−g), ρ_2=2^g and ρ_p=1 for odd p. Thus Π_vρ_v=1. The quotient numerator is not the number of rational points, and an empty local torsor is excluded.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-pencil-measure-comparison
Proposed declaration: ArithmeticSelmerRefinement.pencil_measure_comparison
Fix integral invariant top forms dτ on G and dμ on coefficient A^(n+1), with μ_∞ Euclidean and μ_p(Z_p^(n+1))=1. A single nonzero rational orbit-Jacobian constant 𝒥 satisfies c_(m,r)X^(n+1)=|𝒥|_∞τ_∞(G(Z)\G(R)) μ_∞({f∈I(m):H(f)<X})/#J[2](R), and ∫w_p(v)dv=|𝒥|_pτ_p(G(Z_p))μ_p(F_p)ρ_p. Sum over the soluble real orbit components r, whose count is #(J¹(R)/2J(R)). All factors use the same algebraic-group differential; independently normalized Haar volumes cannot be substituted.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-tamagawa-central-quotient
Proposed declaration: ArithmeticSelmerRefinement.tamagawa_central_quotient
For every even n≥4, the split Q-group G=SL_n/μ₂ has Tamagawa number two, for the adelic measure attached to an integral invariant top differential and the matching convergence convention. G(Q) is the group-scheme quotient’s rational points, not the naive quotient of SL_n(Q) by its rational centre. The rational Jacobian constant in the orbit integral changes no Tamagawa value.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-hyperelliptic-weighted-upper-bound
Proposed declaration: ArithmeticSelmerRefinement.hyperelliptic_weighted_upper_bound
Let n=2g+2, g≥1, and F be a positive-mass sieve-controlled congruence family contained in the everywhere actual-Div¹-soluble locus, with all coefficients in 16Z. For each non-negative-definite real root stratum I(m), let its allowed part be F_∞∩I(m); use the full strata when no extra real restriction is imposed. Assuming the corresponding real-region count, the Selmer numerator is at most 2 Σ_m μ_∞({f∈F_∞∩I(m):H(f)<X}) Π_p μ_p(F_p)+o_F(X^(n+1)). Here F_∞ is a union of these strata; more general real restrictions require the matching counting extension. The same allowed real mass occurs in the coefficient denominator. The value τ(SL_n/μ₂)=2 has the explicit general-formula supplier gap. The infinite-weight count gives an upper bound without a matching lower bound.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-hyperelliptic-average-two
Proposed declaration: ArithmeticSelmerRefinement.hyperelliptic_average_two
For each g≥1, coefficient-height ordering of all smooth integral degree-(2g+2) binary models whose actual Div¹ is soluble over every completion has limsup average #Sel₂(J¹)≤2. The same holds in positive-mass congruence families for which excluded p-adic coefficients, at every sufficiently large p, reduce into a fixed codimension-at-least-two coefficient subscheme. In particular it holds for the full locally C-soluble and locally Div¹-soluble families and admissible positive-mass families restricted to local Div¹. Existence of an average equal to two is not asserted. The full printed reduction-only Definition 39 extension requires the saturation repair recorded as a gap.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-real-effective-divisor-image
Proposed declaration: ArithmeticSelmerRefinement.real_effective_divisor_image
Let C/R be a smooth genus-g hyperelliptic curve with 2m real branch points and m>0. Its m real components give #J(R)/2J(R)=2^(m−1). For k>0 odd, the image of actual effective degree-k R-divisors in J¹(R)/2J(R), after translation by ((k−1)/2)d, has cardinal at most S_m(k). Conjugate nonreal pairs have trivial class modulo 2J(R), and 2P−d∈2J(R) for real P. The m=0 cases require their own soluble real components and are only bounded by the full local quotient.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-order-k-strict-average
Proposed declaration: ArithmeticSelmerRefinement.order_k_strict_average
For k>0 odd and k<g, the limsup average cardinality of the order-k two-Selmer set over the full coefficient-height family of locally soluble genus-g hyperelliptic models is strictly below two. The same conclusion applies to positive-mass sieve-controlled finite-prime congruence subfamilies that retain positive measure of the fully split real stratum. No conclusion is made for a family whose real restrictions delete that stratum.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-order-k-vanishing-average
Proposed declaration: ArithmeticSelmerRefinement.order_k_vanishing_average
For fixed k>0 odd, let A_(g,k) be the limsup coefficient-height average of the order-k two-Selmer set over either the full locally C-soluble or the full locally actual-Div¹-soluble genus-g model family. Then A_(g,k)→0 as g→∞. Height tends to infinity first, separately for each g. The statement is not a uniform joint estimate in height and genus and does not apply to arbitrary genus-dependent real subfamilies.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-small-odd-degree-points-disappear
Proposed declaration: ArithmeticSelmerRefinement.small_odd_degree_points_disappear
For every fixed positive integer m, the lower density, among all smooth genus-g coefficient-height hyperelliptic models, of curves with no point over any odd-degree extension of degree≤m tends to one as g→∞. Height tends to infinity first. All extensions are included, not only Galois extensions or rational points.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-selmer-regulator-parity
Proposed declaration: ArithmeticSelmerRefinement.selmer_regulator_parity
Let A/K be principally polarized, F/K finite Galois with group G, p prime, and Θ=Σ_i n_i H_i a Brauer relation (Σ_i n_i Ind_(H_i)^G 1=0). For each self-dual irreducible Q_p-representation ρ let m_ρ be its multiplicity in the rational Pontryagin dual X_p(A/F) of Sel_(p∞). Put S_Θ={ρ:ord_p C(Θ,ρ) odd}. Then Σ_(ρ∈S_Θ)m_ρ≡ord_p Π_i( c̃_(A/F^Hi)·#Sha_(A/F^Hi)^[p])^(n_i) mod 2. Here c̃=Π_(finite v)c_v|ω/ω_v^Néron|_v for a fixed global invariant top differential; Sha^[p] is the finite p-primary part of Sha modulo its maximal divisible subgroup. No finiteness of all Sha is assumed and the p=2 factor may not be dropped.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-biquadratic-parity-formula
Proposed declaration: ArithmeticSelmerRefinement.biquadratic_parity_formula
For every principally polarized A/K and biquadratic F=K(√α,√β), the sum of the four 2∞-Selmer coranks of A,A^α,A^β,A^(αβ) over K is congruent modulo two to ord₂[c̃_(K√α)c̃_(K√β)c̃_(K√αβ)/(c̃_F c̃_K²)] plus ord₂[#Sha^[2]_(K√α)#Sha^[2]_(K√β)#Sha^[2]_(K√αβ)/(#Sha^[2]_F (#Sha^[2]_K)²)]. All A subscripts in the local products refer to the same base-changed A. The coranks of twists come from the four character multiplicities, not from a presumed equality with Mordell–Weil ranks.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-four-twist-local-parity
Proposed declaration: ArithmeticSelmerRefinement.four_twist_local_parity
Let F=K(√α,√β) be biquadratic and let p₀ have a unique prime above it. Let C/K be a smooth curve with Jacobian J. Require C(K_p₀)≠∅ and split semistable reduction of J of toric rank one at p₀. At every other finite prime with a unique prime above it, require C(K_p)≠∅ and good reduction of J. The sum of the four 2∞-Selmer coranks is odd. If all four twists of C also have local points at every prime with a unique prime above it, the sum of the four finite 2-Selmer dimensions is odd. At other places decomposition groups are cyclic and their Brauer local products cancel.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-mod-eight-parity-family
Proposed declaration: ArithmeticSelmerRefinement.mod_eight_parity_family
For squarefree f(x)=Σ_(i=0)^n a_ix^i over Q, n≥3 and n∈{2g+1,2g+2}, suppose a₂≡1 mod8, a_(2g+1)≡4 mod8 and all other a_i≡0 mod8. Among the four curves y²=f,−f,2f,−2f, at least one Jacobian has even and at least one has odd 2∞-Selmer corank. This proposition alone is not a finite-2-Selmer parity assertion.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-odd-residue-field-models
Proposed declaration: ArithmeticSelmerRefinement.odd_residue_field_models
Let K/Q_p be finite with p odd, residue field F_q, and let C:y²=f(x) be a smooth hyperelliptic curve with integral coefficients and degree n≥3, hence genus ⌊(n−1)/2⌋. Reduction may drop degree in (iii), but (i) and (ii) retain degree n. (i) If f̄ is squarefree of degree n and has an F_q-root, J has good reduction and every quadratic twist of C has a K-point. (ii) If f̄=(x−a)²h, h squarefree of degree n−2, h(a) a nonzero square, and h has an F_q-root, J is split semistable of toric rank one and every quadratic twist has a K-point. (iii) If f̄ is not a scalar multiple of a square and q>4n², then C(K)≠∅. In (ii) the root of h is automatically different from a and simple. In (iii) the factorisation f̄=l h² does not require l,h coprime.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-full-family-corank-parities
Proposed declaration: ArithmeticSelmerRefinement.full_family_corank_parities
For every degree n≥3, in the full coefficient-height family of smooth hyperelliptic equations y²=f(x) of degree n over Q, both even and odd 2∞-Selmer corank occur with lower density at least 2^(−4n−4). Assuming finiteness of the Jacobians’ 2-primary Sha groups, the same bound holds for Mordell–Weil rank parity. Without that assumption this remains a Selmer-corank statement.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-admissible-family-selmer-parities
Proposed declaration: ArithmeticSelmerRefinement.admissible_family_selmer_parities
For each fixed genus and each positive-density admissible congruence family over Q with the coefficient-height convention, both even and odd finite 2-Selmer dimension, and both even and odd 2∞-Selmer corank, occur with positive lower density. The number-field form uses integral coefficient models over O_K, a fixed integral basis and coefficient-coordinate maximum height; its denominator, finite congruence density and twist-height comparison require the number-field supplier contract listed here. This is not claimed for every printed large family.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-positive-empty-selmer-set
Proposed declaration: ArithmeticSelmerRefinement.positive_empty_selmer_set
For every g≥1, in any positive-density admissible coefficient-height congruence family restricted to everywhere actual-Div¹-soluble models, a positive lower proportion have Sel₂(J¹)=∅. More precisely, if the even finite 2-Selmer-dimension subfamily has lower density δ>0, the empty-set subfamily has lower density at least δ/2 after the generic exceptions are removed.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-positive-index-two
Proposed declaration: ArithmeticSelmerRefinement.positive_index_two
For each g≥1, a positive lower proportion of locally C-soluble genus-g coefficient-height models over Q have no point over any finite odd-degree extension; equivalently J¹(Q)=∅ and index(C)=2. The same holds in the positive-density admissible families of the preceding target, with actual Div¹-solubility locally in place of local C-points.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-positive-nontrivial-sha-two
Proposed declaration: ArithmeticSelmerRefinement.positive_nontrivial_sha_two
For a positive lower proportion in each family of the index-two target, Sha(J/Q)[2] is nontrivial. The image of W[2] is the nontrivial locally trivial J¹-torsor. No conjectural finiteness of Sha is used.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-degree-one-points-empty-or-infinite
Proposed declaration: ArithmeticSelmerRefinement.degree_one_points_empty_or_infinite
For density one of locally actual-Div¹-soluble genus-g coefficient-height models, J¹(Q) is either empty or infinite. If it is nonempty, the nonzero W[2] lies in J(Q)/2J(Q), while J(Q)[2]=0; the finitely generated group J(Q) consequently has positive Mordell–Weil rank.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-corrected-two-prime-criterion
Proposed declaration: ArithmeticSelmerRefinement.corrected_two_prime_criterion
Let g≥1 and F be a positive-density sieve-controlled congruence family of degree n=2g+2 models with locally soluble actual Div¹. Suppose odd distinct primes p,q are each quadratic nonresidues modulo the other. On a positive lower proportion of f, require f,pf,qf,pqf∈F, all four curves to have points over Q_p and Q_q, J_f split semistable of toric rank one at p and good at q. If two has a unique prime above it in Q(√p,√q), also require good reduction of J_f at two and Q₂-points on all four curves. Then a positive lower proportion of F have empty Sel₂(J¹), no odd-degree point and index two. The printed Theorem 44 omits the dyadic requirement; the unrestricted printed-family version remains subject to the coefficient-saturation gap.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-rank-one-selmer-criterion
Proposed declaration: ArithmeticSelmerRefinement.rank_one_selmer_criterion
Let E/Q have squarefree conductor with at least two odd prime factors, p≥5 a prime of good ordinary reduction, and irreducible E[p]. If Sel_p(E)≅F_p and its restriction to E(Q_p)/pE(Q_p) is not contained in the image of E(Q_p)[p], then both algebraic and analytic rank of E are one. This is the statistical application of the exact Skinner converse, not an assumption of finite Sha or a use of its converse direction.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-twisted-rank-one-selmer-criterion
Proposed declaration: ArithmeticSelmerRefinement.twisted_rank_one_selmer_criterion
Let E/Q have squarefree conductor N with at least two odd prime factors, p≥5 good ordinary, and E[p] irreducible. Let K/Q be imaginary quadratic of odd discriminant D, with 2 and p split and gcd(D,N)=1. Require E[p] ramified at an odd prime q inert in K, Sel_p(E)=0, Sel_p(E^D)≅F_p, and restriction of Sel_p(E^D) not contained in the local p-torsion image. Then E^D has algebraic and analytic rank one. E^D itself need not have squarefree conductor.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-rank-one-family-properties
Proposed declaration: ArithmeticSelmerRefinement.rank_one_family_properties
F has asymptotic count c_F X^(5/6)+o(X^(5/6)), c_F>0, in the minimal-short-pair height. Every E∈F is semistable of odd squarefree conductor d, with at least two odd factors; E[5] is irreducible and ramified at every factor of d. For D=−39, 2 and 5 split in Q(√D), seven is inert, and E,E^D have opposite root numbers. The twist short pair is minimal and H(E^D)=39⁶H(E); the original and twisted families are disjoint as isomorphism classes.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-local-five-quotient-comparison
Proposed declaration: ArithmeticSelmerRefinement.local_five_quotient_comparison
For E/Q_5 of good ordinary reduction, a sufficiently small open coefficient disc W identifies the finite groups E′(Q_5)/5E′(Q_5) with E(Q_5)/5E(Q_5) and identifies their actual rational-five-torsion images. In the quinary covering representation the soluble G(Q_5)-orbits admit corresponding disjoint compact open integral labels over W. Under the covering-to-Kummer map these labels agree with the point-group identifications. A bijection of sets that fails to preserve the torsion image is insufficient.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-five-selmer-local-equidistribution
Proposed declaration: ArithmeticSelmerRefinement.five_selmer_local_equidistribution
Let F be a large positive-density family of elliptic curves contained in a sufficiently small five-adic disc W as above, with the actual local group Q and its torsion image identified throughout W. For each q∈Q, the number of pairs (E,s), H(E)<X, s∈Sel₅(E)\{0}, res(s)=q, divided by #F_(H<X), tends to 5/#Q. More generally a subset I⊆Q gives average 5#I/#Q. This weights curves by the number of nonidentity elements; it does not say each individual Selmer group maps uniformly.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-rank-one-torsion-image-bound
Proposed declaration: ArithmeticSelmerRefinement.rank_one_torsion_image_bound
Use F, D=−39, p=5, height cut H(E)<X, and write N_i for Selmer dimension i, N_even,N_odd for the parity counts, and B_1 for dimension-one curves whose entire restricted Selmer line lies in the local rational-torsion image. Superscript D counts the twists using the original E-height cutoff. Then B_1≤N/(p−1)−(N_even−N_0)−(p+1)(N_odd−N_1)+o(X^(5/6)), and B_1^D≤N/(p−1)−(N_odd−N_0^D)−(p+1)(N_even−N_1^D)+o(X^(5/6)). The formula applies here because #Q=p#E(Q_p)[p] and both local torsion images are transported correctly.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-rank-one-saturated-count
Proposed declaration: ArithmeticSelmerRefinement.rank_one_saturated_count
Let N_sat count E∈F_(H<X) satisfying the Q criterion and N_sat^D those satisfying the imaginary-twist criterion. These are disjoint subsets of the original F, because the first has odd finite five-Selmer dimension and the second has dimension zero. Then N_sat+N_sat^D≥(1−2/(p−1))N+o(X^(5/6)) with p=5, so their sum is at least N/2+o(X^(5/6)). This does not count every twist by its own height at this step.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-positive-simultaneous-rank-one
Proposed declaration: ArithmeticSelmerRefinement.positive_simultaneous_rank_one
Among all Q-isomorphism classes of elliptic curves ordered by the unique minimal-short-pair height H=max(4|A|³,27B²), the lower density with rank_ZE(Q)=ord_(s=1)L(E,s)=1 is positive. If #F_(H<X)~c_F X^(5/6) and #E_(H<X)~c_E X^(5/6), the proof gives lower bound c_F/(2c_E·39^5). The lower limits of both average ranks are consequently positive; their limits are not asserted to exist.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-soluble-generic-three-selmer-elements
Proposed declaration: ArithmeticSelmerRefinement.soluble_generic_three_selmer_elements
Among height-ordered elliptic curves, the number of pairs (E,s) with s a nonidentity Kummer image in Sel₃(E), H(E)<X, is at least cX^(5/6) for some c>0. Each rank-one E supplies at least two such classes of exact order three; their associated smooth plane cubics have a rational projective point and no rational flex. The positive proportion relative to all nonidentity Sel₃ elements also follows from average #Sel₃=4.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-plane-cubic-height-and-orbit-transfer
Proposed declaration: ArithmeticSelmerRefinement.plane_cubic_height_and_orbit_transfer
For integral ternary cubics use G=PGL₃ acting by (γ·f)(x)=det(γ)^(−1)f(xγ); scalar matrices act trivially. A(v),B(v) are normalized so the Jacobian is y²=x³+Ax+B and H_AB=max(|A|³,B²), homogeneous of degree twelve in v. Over Q, soluble rational G-orbits at fixed invariants correspond to E(Q)/3E(Q) and have stabilizer E(Q)[3]. Every everywhere locally soluble Sel₃ class at integral invariants admits an integral representative, and one can choose distinct G(Z)-orbits for distinct classes. Generic means nonsingular with no Q-flex. SL₃(Z)-orbits give the same integral action image; PGL₃(Q)-orbits must not be replaced by SL₃(Q)-orbits.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.

ArithmeticStatistics:ST.4/refinement-soluble-ternary-fundamental-count
Proposed declaration: ArithmeticSelmerRefinement.soluble_ternary_fundamental_count
For the integral ternary-cubic representation and H_AB invariant height, take a finite-volume real fundamental region F₁ with compatible orbit and stabilizer multiplicities. Require a fixed finite bound M≥1 on the multiplicity of each coefficient vector, with M=1 for a set of representatives; boundary choices must satisfy the same convention. Its dilate F_t=tF₁ corresponds to H_AB<t^12. Weighted generic integral points satisfy N_gen(F_t)=c₁t^10+o(t^10), c₁>0, and weighted generic points with a rational projective zero have count at least c₃t^10+o(t^10), c₃>0. The total, soluble and bounded-intersection counts use this one convention. Passing from a multiset count to distinct coefficient vectors divides a lower bound by at most M.
Omitted: Native supplier carriers, maps or normalized arithmetic counts are not exported at the pin; see G-native and the node’s direct supplier requests.
-/
end ArithmeticSelmerRefinement
