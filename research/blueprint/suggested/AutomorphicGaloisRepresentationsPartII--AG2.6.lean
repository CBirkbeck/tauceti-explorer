/-
Suggested Lean forms for “Galois representations attached to regular algebraic
 automorphic representations of GL_n”, stages AG2.6 and AG2.7.

This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/AutomorphicGaloisRepresentationsPartII--AG2.6.md is
 definitive. These statements suggest Lean forms so contributors and reviewers
 converge on names and signatures. All planned declarations remain unchecked.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. Only individual Mathlib modules are
 imported. No supplier's compatible-system carrier is redefined.

The executable local prototypes take the group, inertia subgroup and Frobenius
 as parameters. The missing local-field/continuity constructors are omitted;
 they are not arbitrary proposition fields. Eigenvalues are units in an actual
 algebraic closure, with multiplicity retained by Fin n. The register following
 the prototypes specifies every remaining definition, API, test and named theorem.
 Independent review: this prose register does not meet section 13; revision must
 add actual declaration/API/example signatures with unavailable conditions
 honestly omitted, as recorded in the review report and packet gaps.
 It names the missing supplier types precisely; its entries are mathematical
 signatures, not elaborated declarations. Full dependent signatures require
 those types. In particular no fake automorphic representation or Hecke algebra
 type is introduced just to manufacture a compiling theorem.
-/

import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Algebra.Field.ZMod
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

namespace TauCeti.AutomorphicGalois

open scoped BigOperators
open Polynomial

/-- The ACC+ ordered ratio condition on nonzero eigenvalues, with multiplicity. -/
def IsGenericEigenvalues {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) : Prop :=
  ∀ i j, i ≠ j → (α i : K) / (α j : K) ≠ q

/-- The Caraiani–Scholze stronger eigenvalue predicate. -/
def IsStrongGenericEigenvalues {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) : Prop :=
  IsGenericEigenvalues α q ∧ Function.Injective α

/-- Algebraic local prototype of ACC+ genericity. Supply actual local inertia
and Frobenius in the full signature. Coefficients are extended to the algebraic
closure, so this does not require Frobenius to split over the residue field. -/
def IsGeneric {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (frob : G) (q : k) : Prop :=
  (∀ g ∈ I, r g = 1) ∧
  ∃ α : Fin n → (AlgebraicClosure k)ˣ,
    ((((r frob).val).map (algebraMap k (AlgebraicClosure k))).charpoly =
      ∏ i, (X - C (α i : AlgebraicClosure k))) ∧
    IsGenericEigenvalues α (algebraMap k (AlgebraicClosure k) q)

/-- Algebraic local prototype of the stronger predicate over any local field. -/
def IsStrongGeneric {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (frob : G) (q : k) : Prop :=
  (∀ g ∈ I, r g = 1) ∧
  ∃ α : Fin n → (AlgebraicClosure k)ˣ,
    ((((r frob).val).map (algebraMap k (AlgebraicClosure k))).charpoly =
      ∏ i, (X - C (α i : AlgebraicClosure k))) ∧
    IsStrongGenericEigenvalues α (algebraMap k (AlgebraicClosure k) q)

lemma isGeneric_unramified {G k : Type*} [Group G] [Field k] {n : ℕ}
    {I : Subgroup G} {r : G →* Matrix.GeneralLinearGroup (Fin n) k}
    {frob : G} {q : k} (h : IsGeneric I r frob q) :
    ∀ g ∈ I, r g = 1 := h.1

/-- Two lifts with the same image give the same predicate. Killing inertia
 supplies this equality in the complete local signature. -/
lemma isGeneric_frobenius_independent {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (frob₁ frob₂ : G) (q : k) (h : r frob₁ = r frob₂) :
    IsGeneric I r frob₁ q ↔ IsGeneric I r frob₂ q := by
  unfold IsGeneric
  rw [h]

lemma isGenericEigenvalues_smul {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) (c : Kˣ) :
    IsGenericEigenvalues (fun i => c * α i) q ↔ IsGenericEigenvalues α q := by
  unfold IsGenericEigenvalues
  refine forall_congr' fun i => forall_congr' fun j => imp_congr_right fun _ => ?_
  simp only [Units.val_mul, mul_div_mul_left _ _ c.ne_zero]

lemma isGenericEigenvalues_reindex {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) (e : Fin n ≃ Fin n) :
    IsGenericEigenvalues (α ∘ e) q ↔ IsGenericEigenvalues α q :=
  sorry

lemma isGenericEigenvalues_inverse {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) :
    IsGenericEigenvalues (fun i => (α i)⁻¹) q ↔ IsGenericEigenvalues α q :=
  sorry

lemma strongGeneric_generic {G k : Type*} [Group G] [Field k] {n : ℕ}
    {I : Subgroup G} {r : G →* Matrix.GeneralLinearGroup (Fin n) k}
    {frob : G} {q : k} (h : IsStrongGeneric I r frob q) : IsGeneric I r frob q := by
  obtain ⟨hu, α, hc, hg, _⟩ := h
  exact ⟨hu, α, hc, hg⟩

/-- Distinct eigenvalues; a full representation signature also returns
squarefreeness of the split characteristic polynomial. -/
lemma strongGeneric_distinct {K : Type*} [Field K] {n : ℕ}
    {α : Fin n → Kˣ} {q : K} (h : IsStrongGenericEigenvalues α q) :
    Function.Injective α := h.2

/-- On a diagonal matrix the eigenvalue product is Mathlib's charpoly. -/
lemma isGeneric_matrix_diagonal {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) :
    (Matrix.diagonal (fun i => (α i : K))).charpoly = ∏ i, (X - C (α i : K)) :=
  Matrix.charpoly_diagonal _

/-- Algebraic part of the integral/residual polynomial comparison. The full
statement adds the stable lattice, good place and semisimplification. -/
lemma goodPolynomialReduction {O k : Type*} [CommRing O] [CommRing k] {n : ℕ}
    (A : Matrix (Fin n) (Fin n) O) (red : O →+* k) :
    (A.map red).charpoly = A.charpoly.map red := Matrix.charpoly_map A red

/-- Test TauCeti.AutomorphicGalois.isGeneric_repeated_eigenvalue. -/
example : IsGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 2 := by
  intro i j _
  simp
  decide

instance prime_five : Fact (Nat.Prime 5) := ⟨Nat.prime_five⟩
instance prime_seven : Fact (Nat.Prime 7) := ⟨by decide⟩

def twoModFive : (ZMod 5)ˣ := Units.mk0 2 (by decide)
def threeModSeven : (ZMod 7)ˣ := Units.mk0 3 (by decide)

/-- Test TauCeti.AutomorphicGalois.not_isGeneric_distinct_ratio_q. -/
example : ¬ IsGenericEigenvalues ![twoModFive, 1] (2 : ZMod 5) := by
  intro h
  exact h 0 1 (by decide) (by simp [twoModFive])

/-- Test TauCeti.AutomorphicGalois.isGeneric_rank_one. -/
example {K : Type*} [Field K] (a : Kˣ) (q : K) :
    IsGenericEigenvalues (fun _ : Fin 1 => a) q := by
  intro i j hij
  exact (hij (Subsingleton.elim i j)).elim

/-- Test TauCeti.AutomorphicGalois.not_isGeneric_repeated_q_one. -/
example : ¬ IsGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 1 := by
  intro h
  exact h 0 1 (by decide) (by simp)

/-- Test TauCeti.AutomorphicGalois.strongGeneric_not_repeated. -/
example : IsGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 2 ∧
    ¬ IsStrongGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 2 := by
  constructor
  · intro i j _
    simp
    decide
  · intro h
    have hh := h.2 (a₁ := 0) (a₂ := 1) rfl
    exact (by decide : (0 : Fin 2) ≠ 1) hh

/-- Test TauCeti.AutomorphicGalois.strongGeneric_distinct_nonratio. -/
example : IsStrongGenericEigenvalues ![1, threeModSeven] (2 : ZMod 7) :=
  sorry

/-- Test TauCeti.AutomorphicGalois.strongGeneric_rank_one. -/
example {K : Type*} [Field K] (a : Kˣ) (q : K) :
    IsStrongGenericEigenvalues (fun _ : Fin 1 => a) q := by
  constructor
  · intro i j hij
    exact (hij (Subsingleton.elim i j)).elim
  · intro i j _
    exact Subsingleton.elim i j

/-- Test TauCeti.AutomorphicGalois.strongGeneric_non_Qp: the arithmetic part
of q=4 for an unramified quadratic extension of Q_2. -/
example : (4 : ZMod 3) = 1 ∧
    ¬ IsStrongGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 4 := by
  constructor
  · decide
  · intro h
    have hh := h.2 (a₁ := 0) (a₂ := 1) rfl
    exact (by decide : (0 : Fin 2) ≠ 1) hh

/-- Test TauCeti.AutomorphicGalois.residualRep_diagonal_reduction and
TauCeti.AutomorphicGalois.residualExport_diagonal_mod3: their matrix parts. -/
example : (Matrix.diagonal ![(1 : ZMod 3), 2]).charpoly = X ^ 2 + C 2 :=
  sorry

/-- Test TauCeti.AutomorphicGalois.galoisType_charpoly_map. -/
example {O k : Type*} [CommRing O] [CommRing k] {n : ℕ}
    (A : Matrix (Fin n) (Fin n) O) (red : O →+* k) :
    (A.map red).charpoly = A.charpoly.map red := Matrix.charpoly_map A red

/-- Test TauCeti.AutomorphicGalois.galoisType_rank_one_polynomial: E3. -/
example (q T : ℤ) : (-1 : ℤ) ^ 1 * q ^ (1 * (1 - 1) / 2) * T = -T := by
  norm_num

/-- Test TauCeti.AutomorphicGalois.compatibleSystem_weight_k: Hodge recipe
arithmetic only; the supplier's Hodge multiset is not redefined here. -/
example (k : ℤ) : (k - 2) + ((2 - 1 - 0 : ℕ) : ℤ) = k - 1 := by
  norm_num
  ring

/-- The determinant Hodge sum, an acceptance check on the labelled recipe. -/
theorem sum_expectedHodgeTate {n : ℕ} (a : Fin n → ℤ) :
    ∑ i : Fin n, (a i + ((n - 1 - i : ℕ) : ℤ)) =
    ∑ i : Fin n, a i + ((n * (n - 1) / 2 : ℕ) : ℤ) :=
  sorry

/-- CG and Pilloni's Hodge recipes agree under this parameter substitution.
Equality of automorphic representations additionally needs ML.4. -/
example (a b : ℤ) :
    ![0, -(2 - b), -(1 - a), -(1 - a) - (2 - b)] = ![0, b - 2, a - 1, a + b - 3] := by
  ext i
  fin_cases i <;> simp
  ring

/-- CG's ordinary roots have different valuation exponents in the regular range. -/
example (a b : ℤ) (hab : b ≤ a) (hb : 3 ≤ b) :
    0 < b - 2 ∧ b - 2 < a - 1 ∧ a - 1 < a + b - 3 := by
  omega

end TauCeti.AutomorphicGalois




/-! ## Mathematical signature register

Full mathematical signatures below require the named supplier objects. They are
not elaborated declarations; each omission is covered by the supplier-type gap
in the packet. Executable algebraic prototypes above leave out the unavailable
local continuity and number-field-place constructors, and do not certify them.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/extremely-weakly-compatible-system
Signature Weak, very weak and extremely weak automorphic data:
Use the single arbitrary-rank carrier of R24.5:operations, with coefficient number field M, finite S, common good-prime P_v, continuous semisimple r_λ and labelled H_τ. Import its weak, very weak and extremely weak predicates without a second carrier. Weak implies very weak implies extremely weak. Extremely weak fixes only HT(det r_λ)=sum H_τ; very weak adds crystallinity and the full multiset at all coefficient-prime places for a density-one set of rational primes. No converse in rank greater than one is asserted.
Missing full-signature inputs: PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n, PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison
Signature TauCeti.AutomorphicGalois.geometricCoefficientPrimeComparison:
For the smooth proper PEL/Kuga–Sato realization supplied by AG2.1a, after the stated Schur projector, automorphic isotypic projector and Tate twist, apply D_cris and D_dR to the actual cohomological summand. The comparison maps are restrictions of geometric comparison and commute with the projectors and cup products. At good reduction the summand is crystalline; its filtered de Rham realization gives HT_τ={a_{τ,i}+n−i : 1≤i≤n}. At strictly semistable reduction use the filtered (φ,N) comparison, with the same projectors. The passage is through a geometric realization, not an assumption that an arbitrary attached representation has period dimensions n.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris, AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset, PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction, PadicHodgeTheory:R06.2/ddr-exact-strict-tensor, PadicHodgeTheory:R06.5.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent
Signature TauCeti.AutomorphicGalois.coefficientHodgeComparisonThroughDescent:
For a conjugate-self-dual cohomological cuspidal Π over a CM field, the Chenevier–Harris construction passes de Rham, the prescribed regular Hodge multiset, crystallinity at spherical places and semistability at Iwahori places through their bounded family and cyclic patching. Theorem 2.3 varies weights at one chosen coefficient-prime place v_0 and establishes admissibility at the other coefficient-prime places. Theorem 3.2.3 removes this exclusion by solvable base change and descent, arranging at least two coefficient-prime places. A convergent sequence of de Rham representations with unbounded Hodge weights is not the statement.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison, AutomorphicGaloisRepresentationsPartII:AG2.3, LocallyAnalyticDistributions:L4/fredholm-determinant, LocallyAnalyticDistributions:L4/finite-slope-summands, LocallyAnalyticDistributions:L4/completed-base-change, PadicHodgeTheory:R06.2/de-rham-base-change, PadicHodgeTheory:R06.2/crystalline-semistable-base-change, EndoscopicTransferAndUnitaryTraceComparison:ET.7a, PadicHodgeTheory:R06.2.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline
Signature TauCeti.AutomorphicGalois.polarizedCoefficientPrimeAdmissibility:
Let F be CM and (π,χ) regular algebraic cuspidal polarized of weight a. For every λ|ℓ and v|ℓ, r_{π,λ}|G_{F_v} is de Rham with HT_τ={a_{τ,i}+n−i}. If π_v is spherical it is crystalline; if π_v has Iwahori-fixed vectors it is semistable. In the Iwahori case BLGGT Theorem 2.1.1(4) gives full Frobenius-semisimple WD comparison with rec(π_v|det|^{(1−n)/2}). The full comparison for general π_v is the separate Caraiani theorem below.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent, AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset, AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation, PadicHodgeTheory:R06.3/weil-deligne-parameter.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand
Signature TauCeti.AutomorphicGalois.logCrystallineAutomorphicPurity:
In Caraiani’s two-boundary semistable PEL model and its Kuga–Sato projector, the Π-isotypic log-crystalline summand realizing the tensor-square representation is pure as a WD representation (Proposition 5.1). Use the two-index strata Y^(r,s) and Theorem 4.6’s generalized log-crystalline weight spectral sequence, with Frobenius, twists and the residue realization of N. Purity follows after proving the relevant projected stratum cohomology is concentrated on the required diagonal; neither semistability nor the existence of the spectral sequence alone implies purity.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison, CrystallineCohomology:CR.6, WeightsInEtaleCohomology:R34.6, AutomorphicGaloisRepresentationsPartII:AG2.1a.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime
Signature TauCeti.AutomorphicGalois.fullPolarizedCoefficientPrimeComparison:
For n≥2, a conjugate-self-dual cohomological cuspidal Π over CM F, any ℓ, ι and v|ℓ, WD(r_{Π,ℓ,ι}|G_{F_v})^{F-ss} ≅ ι⁻¹ rec(Π_v|det|^{(1−n)/2}) with monodromy. The algebraic-character twist of AG2.2 extends this to the stated polarized branch. The theorem has no Shin-regularity condition; it uses purity of the geometric summand, temperedness and the pure-parameter uniqueness theorem. Rank one is supplied by algebraic local class field theory.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline, AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand, AutomorphicGaloisRepresentationsPartII:AG2.2, AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness, AutomorphicGaloisRepresentationsPartII:AG2.5, EndoscopicTransferAndUnitaryTraceComparison:ET.7a.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison
Signature TauCeti.AutomorphicGalois.allCMCoefficientPrimeComparison:
A’Campo–Hevesi–Thorne–Whitmore v1, Theorem 1.2.1: for every CM F, n≥1, regular algebraic cuspidal π of highest weight a, ℓ, ι and v|ℓ, r_{π,ℓ,ι}|G_{F_v} is de Rham, has HT_τ={a_{ιτ,i}+n−i}, and WD(r_{π,ℓ,ι}|G_{F_v})^{ss} ≅ ι⁻¹ rec^T(π_v)^{ss}. Here rec^T(π_v)=rec(π_v|det|^{(1−n)/2}). No conjugate self-duality, residual irreducibility or decomposed genericity hypothesis is imposed. This is the July 2026 preprint theorem, with its precise input chain recorded below.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places, AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset, PadicHodgeTheory:R06.3/weil-deligne-parameter, AutomorphicGaloisRepresentationsPartII:AG2.4.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound
Signature TauCeti.AutomorphicGalois.nonselfdualCoefficientPrimeMonodromyBound:
Under the preceding theorem, WD(r_{π,ℓ,ι}|G_{F_v})^{F-ss} ≺ ι⁻¹rec^T(π_v). Equality of the semisimplified Weil representations comes from the preceding comparison theorem, not from the definition of the order. The order compares, for each irreducible Weil representation up to unramified twist, the sums of the largest Jordan-block sizes: every first-i sum on the left is ≤ the corresponding sum on the right. It is Varma’s order of §8.2, used in AHTW Definition 6.0.2. Full equality of N is not asserted for a general nonselfdual ramified π_v.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison, AutomorphicGaloisRepresentationsPartII:AG2.5/varma-semisimplified-comparison-and-monodromy-bound, AutomorphicGaloisRepresentationsPartII:AG2.5.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary
Signature TauCeti.AutomorphicGalois.allCMCrystallineIwahoriAdmissibility:
For arbitrary regular algebraic cuspidal π over a CM field, r_{π,λ}|G_{F_v} is crystalline when v|ℓ and π_v is spherical, and is semistable when π_v has Iwahori-fixed vectors. In the spherical case its crystalline Frobenius polynomial is the rec^T Satake polynomial. Proof: de Rham implies potentially semistable; ss compatibility gives trivial WD inertia for Iwahori π_v, and the monodromy bound against N=0 forces N=0 in the spherical case. Iwahori semistability does not establish full monodromy equality.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison, AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound, PadicHodgeTheory:R06.3/p-adic-monodromy-theorem, PadicHodgeTheory:R06.3/weil-deligne-descent.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/totally-real-polarized-coefficient-prime-descent
Signature TauCeti.AutomorphicGalois.totallyRealPolarizedCoefficientPrimeComparison:
For a regular algebraic essentially self-dual cuspidal π over a totally real F, the attached BLGGT representation has the stated labelled Hodge weights, is de Rham, is crystalline at spherical coefficient-prime places and semistable at Iwahori places. Full coefficient-prime WD comparison is obtained from the polarized CM theorem by choosing a quadratic CM extension split at the target finite place, retaining cuspidality, matching the base-changed Galois representation, and comparing that unchanged local completion. This also covers the totally-real members used by Newton–Thorne; no unrestricted nonpolarized totally-real assertion is added.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places, AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset, AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime, AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent, EndoscopicTransferAndUnitaryTraceComparison:ET.7a.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness
Signature TauCeti.AutomorphicGalois.coefficientEmbeddingIndependence:
Fix π, its coefficient field M_π, λ and the embedding M_π→Q̄_ℓ attached to λ. Any two continuous semisimple n-dimensional representations of G_F with the common good geometric Frobenius polynomials P_v for v outside a finite set are isomorphic over Q̄_ℓ. Thus r_{π,ℓ,ι} depends on ι only through its restriction to M_π, up to isomorphism. This determines an isomorphism class, not a preferred basis or unique intertwiner. Different λ are compared by the common M_π-polynomials, not by identifying their topological coefficient fields.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places, AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions, ArithmeticGaloisRepresentations:R01.5.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi
Signature TauCeti.AutomorphicGalois.compatibleSystem:
For a regular algebraic cuspidal π of GL_n(A_F), with F CM, or F totally real and π polarized, construct the instance R_π of the imported arbitrary-rank R24.5 carrier: M_π is the field fixed by σ∈Aut(C) preserving π^∞; S_π is the finite ramification set of π; P_v(X) is the common monic rec^T geometric Frobenius polynomial; r_λ is the attached continuous semisimple representation; H_τ={a_{τ,i}+n−i}. Populate weak compatibility using all-CM de Rham admissibility, or the totally-real polarized theorem, and crystallinity for v outside S_π above ℓ. Purity, polarization and all-place strict compatibility are separate branch predicates, not fields asserted for every π.
API signatures (the executable algebraic parts, when present, are above):
TauCeti.AutomorphicGalois.compatibleSystem : Map π to R_π in the supplier carrier.
TauCeti.AutomorphicGalois.compatibleSystem_member : The λ-member after embedding is r_{π,ℓ,ι}, up to isomorphism.
TauCeti.AutomorphicGalois.compatibleSystem_goodPolynomial : At v outside S_π, the common polynomial is P_v(X).
TauCeti.AutomorphicGalois.compatibleSystem_hodgeTate : The labelled multiset is {a_{τ,i}+n−i}, including multiplicities.
TauCeti.AutomorphicGalois.compatibleSystem_weak : R_π satisfies the R24.5 weak predicate, with explicit normalization conversion.
TauCeti.AutomorphicGalois.compatibleSystem_embedding : Two ι inducing the same λ on M_π give isomorphic members.
Test/example signatures:
Test TauCeti.AutomorphicGalois.compatibleSystem_rank_one : For an algebraic Hecke character ψ, this is its class-field-theoretic compatible system.
Test TauCeti.AutomorphicGalois.compatibleSystem_weight_k : At n=2, a=(k−2,0), the Hodge multiset is {k−1,0} and its sum is k−1.
Test TauCeti.AutomorphicGalois.compatibleSystem_R19 : On the exact classical/Hilbert overlap, applying the stated dual/twist dictionary identifies each λ-member with the R19 fixed-form member.
Test TauCeti.AutomorphicGalois.compatibleSystem_no_automatic_strictness : A weak instance with only good-place polynomials cannot supply an equality of monodromy at an unspecified bad place.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places, AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions, AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset, AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality, PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n, AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness, AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary, AutomorphicGaloisRepresentationsPartII:AG2.6/totally-real-polarized-coefficient-prime-descent.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/complex-and-local-coefficient-conjugation
Signature TauCeti.AutomorphicGalois.coefficientConjugation:
For RAESDC π over totally real F or RAECSDC π over CM F, σ∈Aut(C), r_{σπ,ι}≅r_{π,σ⁻¹ι}. If σ_ℓ∈Gal(Q̄_ℓ/Q_ℓ) and σ=ισ_ℓι⁻¹, then σ_ℓ(r_{π,ι})≅r_{π,ισ_ℓ⁻¹}≅r_{π,σ⁻¹ι}≅r_{σπ,ι}. Coefficient conjugation acts on matrix entries; the absolute Galois group G_F is unchanged. Twisted tensor products use the semilinear convention of NT footnote 4.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness, AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality, AutomorphicFormsOnReductiveGroups:AF.4.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/strong-coefficient-field
Signature TauCeti.AutomorphicGalois.IsStrongCoefficientField:
For Π regular cohomological cuspidal conjugate-self-dual (including Liu’s relevant specialization with archimedean principal series arg^{1−n},arg^{3−n},…,arg^{n−1}) and a number field E⊂C containing Q(Π), E is a strong coefficient field if for each finite λ of E there exists a continuous E_λ-linear ρ_{Π,λ} whose scalar extension to Q̄_ℓ is ρ_{Π,ι} for every ι inducing λ. Members are unique up to E_λ-conjugacy when descended by the semisimple realization theorem. This is a field of definition of the representations, stronger than the field of rationality of good polynomials. It includes a family of descended realizations, not canonical bases or canonical intertwiners. This generalizes Liu’s named definition beyond its relevant specialization, using the simultaneous realization condition justified by Chenevier–Harris Proposition 3.2.5; Liu’s conditional minimal-field assertion remains confined to his specialization and Hypothesis 3.2.10.
API signatures (the executable algebraic parts, when present, are above):
TauCeti.AutomorphicGalois.IsStrongCoefficientField : The preceding all-λ realization property.
TauCeti.AutomorphicGalois.strongCoefficientField_member : Choose an E_λ-realization with its scalar-extension isomorphism.
TauCeti.AutomorphicGalois.strongCoefficientField_baseChange : For E′/E finite, each λ′-member is E′_λ′⊗_{E_λ}ρ_{Π,λ}, with the identity and composition laws.
TauCeti.AutomorphicGalois.strongCoefficientField_unique : Descended semisimple members are unique up to conjugacy, not as based homomorphisms.
Test/example signatures:
Test TauCeti.AutomorphicGalois.strongCoefficientField_character : A rank-one character whose values lie in E has the expected E_λ-realizations.
Test TauCeti.AutomorphicGalois.strongCoefficientField_extension : Changing E to a finite extension gives exactly the supplier’s coefficient base-change operation at every λ′.
Test TauCeti.AutomorphicGalois.strongCoefficientField_not_rationality : The definition does not identify rational Frobenius traces with a canonical E_λ-model; a nontrivial Schur obstruction must be split.
Test TauCeti.AutomorphicGalois.strongCoefficientField_scalar_intertwiner : Nonzero scalar multiples of an intertwiner remain intertwiners, so uniqueness is of the isomorphism class.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness, AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality, ArithmeticGaloisRepresentations:R01.5.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/uniform-strong-realization-for-polarized-systems
Signature TauCeti.AutomorphicGalois.existsUniformStrongCoefficientField:
For a conjugate-self-dual cohomological cuspidal Π over CM F, there is one finite number field E⊂C which is a strong coefficient field for all λ. Chenevier–Harris Proposition 3.2.5 enlarges the coefficient field E_0 of good polynomials by roots of regular semisimple good Frobenius elements at two places of different residue characteristics. Each λ can use one place away from ℓ; a split regular Frobenius and E_0-valued traces split the semisimple descent obstruction. No assertion that the minimal rationality field itself is strong is included.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline, AutomorphicGaloisRepresentationsPartII:AG2.6/strong-coefficient-field, ArithmeticGaloisRepresentations:R01.5.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-compatible-system-strictly-pure
Signature TauCeti.AutomorphicGalois.polarizedSystemPurity:
For a regular algebraic polarized cuspidal (π,χ) with a_{τ,i}+a_{τc,n+1−i}=w, R_π is pure and BLGGT-strictly pure of weight W=w+n−1. Its polarization is r_λ^c≅r_λ^∨⊗μ_λ, μ_λ=ε_ℓ^{1−n}r_{χ,λ}; the χ-system has purity weight 2w. Total oddness uses μ_λ(c_v)=(−1)^{n−1+w}χ_v(−1), so the required sign is χ_v(−1)=(−1)^{n+w}. BLGGT strict purity describes pure common WD parameters away from the coefficient prime; all-place strict compatibility needs the separately proved coefficient-prime theorem, not a change of definition.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi, AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime, AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation, AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier, AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness, PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates, PotentialModularityAndCompatibleSystems:R24.5/polarized-system, PotentialModularityAndCompatibleSystems:R24.5/character-system.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/very-weak-compatibility-under-dgi
Signature TauCeti.AutomorphicGalois.veryWeakCompatibilityUnderDGI:
The constructed R_π is weakly compatible, hence very weakly compatible by the imported weakening map. This gives, in particular, the conclusions of ACC+ Lemmas 7.1.9–7.1.10. Lemma 7.1.9 originally assumes a density-one set of rational ℓ for which every residual member is absolutely irreducible and decomposed generic; Lemma 7.1.10 proves very weak compatibility in rank two through its constituent/image arguments. That Fontaine–Laffaille/degree-shifting proof is an arithmetic consumer in PA.1; it is not an input to the all-CM construction here. None of these statements gives residual irreducibility at every coefficient place.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi, PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-prime-branch-and-what-it-does-not-give
Signature Comparison strength at the coefficient prime:
The polarized branch has de Rham admissibility and full pure WD comparison at every coefficient-prime place. The all-CM nonselfdual branch has de Rham admissibility, full labelled Hodge weights, ss compatibility and the monodromy upper bound of AHTW v1; spherical crystallinity and Iwahori semistability follow from WD criteria. Full N equality for general nonselfdual ramified places is not supplied by these statements. Fontaine–Laffaille, ordinary lifting and residual-image conclusions retain their separate consumer hypotheses.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime, AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary, AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/rank-two-comparison-with-r19
Signature Rank-two comparison with R19:
For a fixed classical newform of weight k≥2 or regular cohomological Hilbert eigenform in the exact R19.3/5 overlap, identify the AG2 λ-member with the R19 member after converting geometric/arithmetic Frobenius and the stated Tate twist. For the standard weight-k classical normalization this is r_AG2≅r_R19^∨, giving geometric polynomial X²−a_qX+ψ(q)q^{k−1}, HT_AG2={0,k−1}, and det=r_ψ ε^{1−k} where r_ψ(Frob_q^geom)=ψ(q). For Hilbert (k_τ,w) use Skinner’s explicit half-integer normalization before dualizing; parity is part of its hypotheses. Import R19’s full Skinner coefficient-prime theorem, not Kisin’s conditional theorem as unconditional.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness, AutomorphicGaloisRepresentations:R19.3/fixed-eigenform-compatible-family, AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime, AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/tensor-automorphy-independent-of-coefficient-embedding
Signature TauCeti.AutomorphicGalois.tensorAutomorphyIndependentOfIota:
Let π_1 and σ be RAESDC over a totally real F. Suppose r_{π_1,ι}⊗r_{σ,ι} is irreducible and automorphic for one (ℓ,ι), in the RAESDC sense used by Newton–Thorne. Then r_{π_1,j}⊗r_{σ,j} is automorphic for every prime q and j:Q̄_q≅C. Match the automorphic realization’s good polynomial to the tensor-product polynomial using coefficient conjugation, then use semisimple uniqueness. This does not establish automorphy of an arbitrary tensor product; its initial automorphy and irreducibility are hypotheses.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/complex-and-local-coefficient-conjugation, AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness, PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/gsp4-crystalline-hodge-comparison
Signature TauCeti.AutomorphicGalois.gsp4CrystallineHodgeComparison:
In Calegari–Geraghty Proposition 6.8, for a cuspidal GSp4 eigenform f of good p-level and weight (a,b), a≥b≥3, the AG2.2 transferred r_f is crystalline at p with HT={0,b−2,a−1,W}, W=a+b−3. If f is also an eigenform for the Hecke operators at p, det(X−φ)=λ_f(Q_p(X)) in their monic convention. The eigenform-at-p condition specifies this polynomial; crystallinity in the proposition’s good-level setting does not depend on that additional condition.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.2, ModularityAndLanglandsExtensions:ML.4, AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/ordinary-gsp4-coefficient-prime-shape
Signature TauCeti.AutomorphicGalois.ordinaryGsp4CoefficientPrimeShape:
Under CG Proposition 6.8(4), assume f is a p-Hecke eigenform and ordinary: its T_{p,1} and Q_{p,2} eigenvalues are units. The roots α,β,γ,δ of λ_f(Q_p(X)) have valuations 0,b−2,a−1,W and are distinct. r_f|G_Qp has the upper-triangular diagonal unram(α), ε^{−(b−2)}unram(p^{−(b−2)}β), ε^{−(a−1)}unram(p^{−(a−1)}γ), ε^{−W}unram(p^{−W}δ). The parameters of the unramified characters are units. Distinctness follows from the four different valuations, not from ordinarity in an unspecified singular weight.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/gsp4-crystalline-hodge-comparison, PadicHodgeTheory:R06.4/ordinary-representation, PadicHodgeTheory:R06.4, ModularityAndLanglandsExtensions:ML.4.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.6/pilloni-gsp4-normalization-comparison
Signature Pilloni GSp₄ normalization comparison:
Pilloni Theorem 5.1.7.1 for cuspidal π with discrete-series π_∞ and parameter (λ_1,λ_2;−λ_1−λ_2+3) gives a de Rham representation with HT={0,−λ_2,−λ_1,−λ_1−λ_2}. At p outside the nonspherical set it is crystalline and det(1−Xφ)=Θ_π(Q_p(X)). Its geometric Frobenius and HT(ε)=−1 conventions require reciprocal conversion X^4Q_p(1/X) to the monic polynomial. The corrected similitude exponent is ε^{λ_1+λ_2}, as recorded in E27 of the paper extraction. Substitution λ_1=1−a, λ_2=2−b gives CG’s four Hodge numbers; identifying the automorphic representations also requires the ML.4 Harish–Chandra/Satake dictionary.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/gsp4-crystalline-hodge-comparison, AutomorphicGaloisRepresentationsPartII:AG2.2, ModularityAndLanglandsExtensions:ML.4.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/finite-p-adic-field-of-realization
Signature TauCeti.AutomorphicGalois.existsFinitePadicRealization:
For each continuous r_{π,ℓ,ι}:G_F→GL_n(Q̄_ℓ), there is a finite extension E/Q_ℓ over which its matrices are defined, after a change of basis if desired. Prove this before invoking a compact-local-field stable-lattice theorem. The compact image is covered by GL_n(E) for the countably many finite subextensions of Q̄_ℓ/Q_ℓ; Baire gives one such closed subgroup with open intersection, and finitely many coset representatives lie in a larger finite field. A uniform strong number field is available on the polarized branch, but is not needed for this local assertion.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi, ArithmeticGaloisRepresentations:R01.1.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi
Signature TauCeti.AutomorphicGalois.residualRep:
Choose a finite E/Q_ℓ realizing r_{π,λ}, an O_E-stable lattice L, and a basis of L. Define r̄_{π,λ} as the semisimplification of L/m_EL. Its isomorphism class over k̄_ℓ is independent of L, the basis and enlargement of E, for a fixed coefficient embedding λ. It descends to the finite field generated by the reductions of the common good polynomial coefficients. At good v away from ℓ it is unramified and has characteristic polynomial P_v reduced through λ. For F/F^+ CM in the totally odd polarized branch, the semisimple residual polarized representation admits the 𝒢_n-valued extension with multiplier ε̄^{1−n}r̄_χ supplied by the polarized representation API. An arbitrary lattice is not declared self-dual.
API signatures (the executable algebraic parts, when present, are above):
TauCeti.AutomorphicGalois.residualRep : The continuous semisimple residual member over its finite field of realization.
TauCeti.AutomorphicGalois.residualRep_indep_lattice : Two lattice reductions have isomorphic semisimplifications over k̄_ℓ.
TauCeti.AutomorphicGalois.residualRep_coeffExtension : Enlargement of E gives scalar extension of the same semisimple residual representation.
TauCeti.AutomorphicGalois.residualRep_goodPolynomial : At good v away from ℓ the polynomial is the coefficient reduction of P_v.
TauCeti.AutomorphicGalois.residualRep_extendGn : For F/F^+ CM, totally odd polarized residual members extend to 𝒢_n with the specified multiplier; the totally-real orthogonal/symplectic specialization is separate.
Test/example signatures:
Test TauCeti.AutomorphicGalois.residualRep_rank_one : For an integral character ψ, r̄ is its reduction and no semisimplification changes it.
Test TauCeti.AutomorphicGalois.residualRep_diagonal_reduction : Reduction of diag(1,2) modulo 3 has polynomial (X−1)(X−2), the reduction of the characteristic-zero polynomial.
Test TauCeti.AutomorphicGalois.residualRep_R19_dual : For the classical weight-k overlap at fixed λ, r̄_AG2≅r̄_R19^∨ under the same residue embedding.
Test TauCeti.AutomorphicGalois.residualRep_noncanonical_lattice : For the Z_5-action r(t)=[[1,5t],[0,1]], lattices with bases (e1,e2) and (5e1,e2) give identity and nontrivial unipotent reductions; both semisimplify to 1⊕1.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/finite-p-adic-field-of-realization, ArithmeticGaloisRepresentations:R01.1/continuity-descent-and-lattice-independence, ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent, AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation, GlobalGaloisDeformations:G7/polarized-deformation-problem.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/good-polynomial-reduction
Signature TauCeti.AutomorphicGalois.goodPolynomialReduction:
For a stable lattice realization A_v∈GL_n(O_E) of a good geometric Frobenius, Matrix.charpoly(A_v) has integral coefficients and maps under O_E→k_E to Matrix.charpoly(Ā_v); semisimplification leaves it unchanged. Thus the reduced polynomial is the reduction of ι⁻¹P_v. The constant term is a unit because A_v is invertible. This is ordinary characteristic-polynomial coefficient change, not a new determinant-law construction.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type
Signature TauCeti.AutomorphicGalois.IsGaloisType:
For the unramified integral Hecke algebra T^S over O, a maximal ideal m with finite residue field k_m is of Galois type if there exists a continuous semisimple r_m:G_{F,S}→GL_n(k_m) such that at every v outside S its good geometric Frobenius polynomial is Σ_{i=0}^n(−1)^i q_v^{i(i−1)/2}T_{v,i}X^{n−i} modulo m (T_{v,0}=1). Include the coefficient prime in S for this unramified quotient statement. r_m is considered up to isomorphism; the condition does not itself require absolute irreducibility.
API signatures (the executable algebraic parts, when present, are above):
TauCeti.AutomorphicGalois.IsGaloisType : Existence of the stated semisimple realization over k_m.
TauCeti.AutomorphicGalois.galoisType_rep : A chosen r_m together with the polynomial matching theorem.
TauCeti.AutomorphicGalois.galoisType_rep_unique : Any two semisimple realizations are isomorphic after a common residue-field extension.
TauCeti.AutomorphicGalois.galoisType_coeffExtension : The polynomial comparison commutes with the existing GL coefficient map.
Test/example signatures:
Test TauCeti.AutomorphicGalois.galoisType_rank_one_polynomial : For n=1 the constant term is −T_{v,1}.
Test TauCeti.AutomorphicGalois.galoisType_reducible : A Hecke eigencharacter with r_m=1⊕1 can be of Galois type.
Test TauCeti.AutomorphicGalois.galoisType_charpoly_map : Residue extension maps the matched polynomial exactly by Matrix.charpoly_map.
Test TauCeti.AutomorphicGalois.galoisType_not_nonEisenstein : The reducible example cannot certify non-Eisensteinness.
Missing full-signature inputs: IntegralHeckeAndGaloisDeterminants:IHG.3, AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions, ArithmeticGaloisRepresentations:R01.5.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/non-eisenstein-maximal-ideal
Signature TauCeti.AutomorphicGalois.IsNonEisenstein:
A maximal ideal m of T^S is non-Eisenstein if it is of Galois type and its semisimple realization r_m is absolutely irreducible. The condition is independent of the chosen realization by semisimple uniqueness. It is a global condition, separate from local ACC+ genericity and from enormousness of the image after restriction to G_{F(ζ_ℓ)}.
API signatures (the executable algebraic parts, when present, are above):
TauCeti.AutomorphicGalois.IsNonEisenstein : Galois type plus absolute irreducibility.
TauCeti.AutomorphicGalois.nonEisenstein_galoisType : Forget absolute irreducibility.
TauCeti.AutomorphicGalois.nonEisenstein_coeffExtension : Absolute irreducibility persists under any residue-field extension and is detected over k̄.
Test/example signatures:
Test TauCeti.AutomorphicGalois.nonEisenstein_rank_one : Every rank-one Galois-type realization is absolutely irreducible.
Test TauCeti.AutomorphicGalois.nonEisenstein_not_trivial_rank_two : The rank-two trivial representation cannot make its ideal non-Eisenstein.
Test TauCeti.AutomorphicGalois.nonEisenstein_absolute_not_relative : An irreducible k_m-representation that splits over k̄_m does not satisfy the definition.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence
Signature TauCeti.AutomorphicGalois.residualHeckeIdealIndependence:
Fix π, λ and an integral eigencharacter θ_π:T^S→O_E at that coefficient place. Then m_{π,λ}=ker(T^S→O_E→k_E) is of Galois type with realization r̄_{π,λ}. Its kernel is independent of stable lattice, basis and finite extension of E inducing the same λ: the eigencharacter is defined by the same integral Hecke eigenvalues and the residue-field extension is injective. It is non-Eisenstein exactly when r̄_{π,λ} is absolutely irreducible. Independence across distinct λ is not asserted.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi, AutomorphicGaloisRepresentationsPartII:AG2.7/good-polynomial-reduction, AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type, AutomorphicGaloisRepresentationsPartII:AG2.7/non-eisenstein-maximal-ideal, IntegralHeckeAndGaloisDeterminants:IHG.3.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/dual-and-character-twist-hecke-comparison
Signature TauCeti.AutomorphicGalois.dualAndTwistHeckeComparison:
For a Galois-type maximal ideal m of rank n, the contragredient Hecke ideal m^∨ is of Galois type with r_{m^∨}≅r_m^∨⊗ε̄^{1−n}. At good geometric Frobenius its eigenvalues are q_v^{n−1}/α_i. An integral unramified-at-v character ψ multiplies the eigenvalues by ψ(Frob_v), and its Hecke twist realizes r_m⊗ψ̄. In the rank-2n unitary Hecke algebra the reciprocal factor is q_v^{2n−1}. Residual nonratio conditions are transported only with their unramifiedness hypotheses.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type, IntegralHeckeAndGaloisDeterminants:IHG.3, AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character, PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes
Signature TauCeti.AutomorphicGalois.IsGeneric:
Let L/Q_p be any finite extension with residue cardinality q, ℓ≠p, k a finite field of characteristic ℓ, and r:G_L→GL_n(k) continuous. It is ACC+-generic at L if inertia acts trivially and, over k̄, the eigenvalues α_i∈k̄× of r(Frob_L^geom), listed with multiplicity, satisfy α_i/α_j≠q for every i≠j. Arithmetic instead of geometric Frobenius gives the same predicate because inversion reverses the ordered pair. Repeated eigenvalues are permitted when q≠1 in k; pairwise distinctness alone is insufficient. The local condition has no global irreducibility, adequacy or enormousness clause.
API signatures (the executable algebraic parts, when present, are above):
TauCeti.AutomorphicGalois.IsGenericEigenvalues : For a list α:Fin n→k×, require α_i/α_j≠q for i≠j; list multiplicities are retained.
TauCeti.AutomorphicGalois.IsGeneric : Trivial inertia together with the eigenvalue predicate over k̄.
TauCeti.AutomorphicGalois.isGeneric_unramified : A locally generic representation kills inertia.
TauCeti.AutomorphicGalois.isGeneric_frobenius_independent : For trivial inertia, changing the Frobenius lift preserves the matrix and predicate.
TauCeti.AutomorphicGalois.isGenericEigenvalues_smul : Multiplication of every α_i by the same nonzero scalar preserves the eigenvalue predicate.
TauCeti.AutomorphicGalois.isGenericEigenvalues_reindex : Reordering the list by a permutation leaves the predicate unchanged.
TauCeti.AutomorphicGalois.isGenericEigenvalues_inverse : Inverting every eigenvalue preserves the predicate by exchanging ordered pairs.
Test/example signatures:
Test TauCeti.AutomorphicGalois.isGeneric_repeated_eigenvalue : Over F_3 with q=2, the list (1,1) is generic.
Test TauCeti.AutomorphicGalois.not_isGeneric_distinct_ratio_q : Over F_5 with q=2, the distinct list (2,1) is not generic.
Test TauCeti.AutomorphicGalois.isGeneric_rank_one : Every one-term nonzero list is generic.
Test TauCeti.AutomorphicGalois.not_isGeneric_repeated_q_one : Over F_3 with q=1, (1,1) is not generic.
Test TauCeti.AutomorphicGalois.isGeneric_matrix_diagonal : The list condition on α agrees with the characteristic-polynomial factorization of the diagonal matrix diag(α).
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi, ArithmeticGaloisRepresentations:R01.1.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime
Signature TauCeti.AutomorphicGalois.IsDecomposedGenericPrime:
For a continuous residual r:G_F→GL_n(k), a rational prime p is a decomposed-generic prime if p≠ℓ, p is completely split in F, and r is unramified and ACC+-generic at every v|p. Complete splitting means e_v=f_v=1 at every v, so q_v=p. This is a property of the pair (r,p), distinct from local genericity at one arbitrary place and from existence of such a p.
API signatures (the executable algebraic parts, when present, are above):
TauCeti.AutomorphicGalois.IsDecomposedGenericPrime : The complete-splitting and all-v condition.
TauCeti.AutomorphicGalois.decomposedGenericPrime_local : For every v|p, obtain unramifiedness and the local predicate with q=p.
TauCeti.AutomorphicGalois.decomposedGenericPrime_coeffExtension : Any extension of the finite coefficient field preserves and reflects the condition.
Test/example signatures:
Test TauCeti.AutomorphicGalois.decomposedGenericPrime_Q : For F=Q there is exactly one place over p; the splitting clause is automatic.
Test TauCeti.AutomorphicGalois.decomposedGenericPrime_not_inert : An inert prime in a quadratic F is not decomposed generic even when the local ratio condition holds.
Test TauCeti.AutomorphicGalois.decomposedGenericPrime_not_ell : p=ℓ is excluded independently of eigenvalues.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes, ArithmeticGaloisRepresentations:R01.1.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity
Signature TauCeti.AutomorphicGalois.IsDecomposedGeneric:
A continuous residual representation r:G_F→GL_n(k) is decomposed generic if there exists a rational prime p which is decomposed generic for r. This existential condition is the ACC+ hypothesis used by the torsion-concentration and potential-automorphy consumers. It does not mean every split prime is generic, nor is it equivalent to global absolute irreducibility or enormousness.
API signatures (the executable algebraic parts, when present, are above):
TauCeti.AutomorphicGalois.IsDecomposedGeneric : There exists p satisfying IsDecomposedGenericPrime(r,p).
TauCeti.AutomorphicGalois.decomposedGeneric_witness : Extract the prime witness and all-v local conditions.
TauCeti.AutomorphicGalois.decomposedGeneric_coeffExtension : The existential condition is preserved and reflected by finite residue-field extension.
Test/example signatures:
Test TauCeti.AutomorphicGalois.decomposedGeneric_trivial_F3 : For F=Q, k=F_3, r=1⊕1, the prime p=2 is a witness.
Test TauCeti.AutomorphicGalois.decomposedGeneric_not_irreducible : The preceding decomposed-generic representation is reducible.
Test TauCeti.AutomorphicGalois.decomposedGeneric_not_every_prime : For the same r, p=7 has q=1 mod 3 and is not a witness, although p=2 is.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity
Signature TauCeti.AutomorphicGalois.IsStrongGeneric:
For any finite extension L/Q_p, ℓ≠p, define the Caraiani–Scholze Definition 1.9 specialization: r is unramified and α_i/α_j∉{1,q} for all i≠j over k̄. Equivalently its eigenvalues are pairwise distinct and ACC+-generic. The local field need not be Q_p. This stronger predicate has its own name and implies the ACC+ local predicate. Liu Appendix D’s displayed distinctness is unnecessary for its later noncompact concentration input, as its footnote 37 explicitly records; the stronger definition is not silently substituted for ACC+.
API signatures (the executable algebraic parts, when present, are above):
TauCeti.AutomorphicGalois.IsStrongGenericEigenvalues : IsGenericEigenvalues(α,q) and α injective, equivalently ratios avoid {1,q}.
TauCeti.AutomorphicGalois.IsStrongGeneric : Trivial inertia plus the stronger eigenvalue predicate over k̄.
TauCeti.AutomorphicGalois.strongGeneric_generic : Forget the ratio-1 exclusion.
TauCeti.AutomorphicGalois.strongGeneric_distinct : The Frobenius eigenvalues have no repeated roots.
TauCeti.AutomorphicGalois.strongGeneric_arbitrary_local_field : The definition uses q=|k_L| and specializes to Definition 1.9 for every finite L/Q_p.
Test/example signatures:
Test TauCeti.AutomorphicGalois.strongGeneric_not_repeated : Over F_3, q=2, (1,1) is ACC+-generic but not strong-generic.
Test TauCeti.AutomorphicGalois.strongGeneric_distinct_nonratio : Over F_7, q=2, (1,3) is strong-generic: the two ordered ratios are 3 and 5.
Test TauCeti.AutomorphicGalois.strongGeneric_rank_one : Every single nonzero eigenvalue is strong-generic.
Test TauCeti.AutomorphicGalois.strongGeneric_non_Qp : For an unramified quadratic L/Q_2 and ℓ=3, use q=4≡1; the ratio-1 clause remains explicit.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/infinitely-many-decomposed-generic-primes
Signature TauCeti.AutomorphicGalois.infinitelyManyDecomposedGenericPrimes:
If r:G_F→GL_n(k) is continuous and decomposed generic, there are infinitely many such rational primes, and witnesses can avoid any specified finite set. Let K be a normal closure of F, the field cut out by r and Q(ζ_ℓ). A witness determines a conjugacy class in Gal(K/Q) whose restriction fixes F, fixes the all-place eigenvalue ratios and fixes p mod ℓ. Chebotarev gives a positive Dirichlet-density set of primes with this class. Every such unramified prime is again a witness.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity, ArithmeticGaloisRepresentations:R01.5.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/genericity-transfer-and-projective-qualification
Signature TauCeti.AutomorphicGalois.genericityTransfer:
The eigenvalue nonratio predicate is invariant under permutation, nonzero scalar multiplication, inversion and coefficient-field extension. Local representation genericity is invariant under conjugacy, semisimplification of an already unramified representation, and unramified scalar twists. An arbitrary ramified scalar twist preserves the projective representation but can destroy local unramifiedness. The global existential decomposed-generic condition is invariant under finite residual-character twists: use infinitely many witnesses and avoid the finite ramification set of the character. Strong local genericity obeys the same rules with distinctness retained.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes, AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity, AutomorphicGaloisRepresentationsPartII:AG2.7/infinitely-many-decomposed-generic-primes.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/finite-exceptional-residual-genericity-for-relevant-pi
Signature TauCeti.AutomorphicGalois.residualGenericityOutsideFiniteSet:
For a relevant Π with a strong coefficient field E in Liu et al., choose the regular unramified place used in Chenevier–Harris’s argument, with distinct algebraic Satake roots α_i and α_i≠qα_j. After a finite extension of E containing these roots, exclude the finitely many coefficient places dividing denominators, roots, α_i−α_j or α_i−qα_j. Their reductions are distinct and nonratio. Liu Appendix D, Corollary D.1.4 then uses Chebotarev to obtain a place w split in F/F⁺ that is locally generic for the reduced Hecke eigencharacter outside this finite set. The cohomological concentration conclusion has its own F^+≠Q and level hypotheses and belongs to the Igusa/torsion consumer. This conclusion does not itself provide the completely split rational prime, generic at every v above it, required by the ACC+ global predicate; that stronger witness needs its separate Chebotarev hypotheses.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/uniform-strong-realization-for-polarized-systems, AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence, AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity, ArithmeticGaloisRepresentations:R01.5.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/good-prime-characteristic-zero-export
Signature TauCeti.AutomorphicGalois.GoodPrimeExport:
GoodPrimeExport(π) consists of the imported R_π carrier, its finite coefficient field and common S_π/P_v data, the chosen λ-member interfaces, and the proved good-Frobenius comparison maps. It forgets branch-specific admissibility/purity and contains no assertion of a full bad-place WD parameter. It is an interface wrapping the supplier carrier, not a new compatible-system definition.
API signatures (the executable algebraic parts, when present, are above):
TauCeti.AutomorphicGalois.GoodPrimeExport : Wrap R_π with its good comparison maps.
TauCeti.AutomorphicGalois.goodPrimeExport_member : Retrieve the λ-member and good Frobenius theorem.
TauCeti.AutomorphicGalois.goodPrimeExport_coeffChange : Use supplier coefficient change, with identity and composition laws.
Test/example signatures:
Test TauCeti.AutomorphicGalois.goodPrimeExport_character : At n=1 it is the algebraic-character good-prime package.
Test TauCeti.AutomorphicGalois.goodPrimeExport_polynomial : For a weight-k classical overlap its polynomial is X²−a_qX+ψ(q)q^{k−1}.
Test TauCeti.AutomorphicGalois.goodPrimeExport_not_fullWD : The package cannot supply N at a ramified place without branch evidence.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/nonselfdual-hodge-and-monodromy-bound-export
Signature TauCeti.AutomorphicGalois.NonselfdualComparisonExport:
NonselfdualComparisonExport(π) for an arbitrary regular algebraic cuspidal π over CM F wraps GoodPrimeExport with the AHTW de Rham comparison, full labelled Hodge multiset, ss WD comparison and F-ss monodromy upper bound at every v|ℓ. It also exposes spherical crystallinity and Iwahori semistability with the stated local hypotheses. It does not contain a polarization, purity theorem or full ramified N equality. The output is the strongest nonselfdual coefficient-prime interface supplied by AHTW v1, rather than the good-prime interface alone.
API signatures (the executable algebraic parts, when present, are above):
TauCeti.AutomorphicGalois.NonselfdualComparisonExport : Combine the AHTW coefficient-prime maps with the common carrier.
TauCeti.AutomorphicGalois.nonselfdualExport_goodPrime : Forget to GoodPrimeExport with the same members.
TauCeti.AutomorphicGalois.nonselfdualExport_hodge : Retrieve de Rham comparison and the labelled multiset at every v|ℓ.
TauCeti.AutomorphicGalois.nonselfdualExport_wdBound : Retrieve ss comparison and the F-ss monodromy upper bound, retaining their distinct strengths.
Test/example signatures:
Test TauCeti.AutomorphicGalois.nonselfdualExport_rank_one : For an algebraic character the Hodge multiset has one element and N=0.
Test TauCeti.AutomorphicGalois.nonselfdualExport_good_crystalline : At a spherical coefficient-prime place the upper bound N=0 and trivial inertia recover the crystalline supplier criterion.
Test TauCeti.AutomorphicGalois.nonselfdualExport_not_polarized_fullWD : The export supplies neither a polarized pairing nor full ramified WD equality from an ss comparison alone.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/good-prime-characteristic-zero-export, AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison, AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound, AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/polarized-hodge-and-wd-export
Signature TauCeti.AutomorphicGalois.PolarizedComparisonExport:
PolarizedComparisonExport(π,χ) wraps GoodPrimeExport with the actual polarization isomorphisms and multiplier, the corrected total-odd sign, the labelled Hodge comparison maps, and full F-ss WD comparison at all finite places, including coefficient-prime places. It supplies the proved pure/strict branch predicates. Forgetful maps return the good-prime package, the supplier’s polarized system and each local comparison; they do not insert residual enormousness or an ordinary refinement.
API signatures (the executable algebraic parts, when present, are above):
TauCeti.AutomorphicGalois.PolarizedComparisonExport : Combine the established polarized branch comparisons.
TauCeti.AutomorphicGalois.polarizedExport_goodPrime : Forget to GoodPrimeExport, preserving all good polynomials.
TauCeti.AutomorphicGalois.polarizedExport_local : Retrieve labelled Hodge and full WD comparison maps at a chosen finite place.
TauCeti.AutomorphicGalois.polarizedExport_supplier : Return precisely the R24.5 pure/polarized predicates with normalization conversion.
Test/example signatures:
Test TauCeti.AutomorphicGalois.polarizedExport_weight_k : For a weight-k base-change form it returns H={0,k−1}, W=k−1 and determinant ε^{1−k}r_ψ.
Test TauCeti.AutomorphicGalois.polarizedExport_forget : The forgotten good package has exactly the same λ-members and P_v.
Test TauCeti.AutomorphicGalois.polarizedExport_nonselfdual_rejected : AHTW ss comparison plus an N bound does not fulfill a full-WD comparison field.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/good-prime-characteristic-zero-export, AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime, AutomorphicGaloisRepresentationsPartII:AG2.6/totally-real-polarized-coefficient-prime-descent, AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-compatible-system-strictly-pure.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/unitary-discrete-parameter-export
Signature TauCeti.AutomorphicGalois.UnitaryDiscreteExport:
In the compact unitary setting of CS Corollary 5.5.5, export the semisimple representation r_{Π^S,ℓ}=⊕_{i=1}^2 r_i⊗ε_i attached to an endoscopic discrete parameter of ranks n_1+n_2=n, with each ε_i the algebraic character of |det|^{(n_i−n)/2}$(N_{F/𝒦}det)^{ε(n−n_i)}, and ε(m)≡m mod 2. The polynomial at every v over q∈Spl_{𝒦/Q} outside S∪{ℓ} is the explicit degree-n Hecke polynomial. Keep the constituent labels, algebraic twist maps, and the away-ℓ local comparison from Remark 5.5.6. This package need not be globally irreducible and carries no coefficient-prime comparison beyond what its constituents separately prove. Here F=F⁺·𝒦 with 𝒦 the imaginary quadratic field of CS §5.1; the printed F₀ in Corollary 5.5.5 is the already confirmed E11 misprint, not another splitting field.
API signatures (the executable algebraic parts, when present, are above):
TauCeti.AutomorphicGalois.UnitaryDiscreteExport : Build the labelled direct sum with explicit algebraic character twists.
TauCeti.AutomorphicGalois.unitaryDiscreteExport_constituent : Retrieve r_i, ε_i and its inclusion into the direct sum.
TauCeti.AutomorphicGalois.unitaryDiscreteExport_goodPolynomial : Its good polynomial is the product of the twisted constituent polynomials and the specialized degree-n Hecke polynomial.
Test/example signatures:
Test TauCeti.AutomorphicGalois.unitaryDiscreteExport_two_characters : For n_1=n_2=1, at good v with twisted values β_1,β_2 the polynomial is (X−β_1)(X−β_2).
Test TauCeti.AutomorphicGalois.unitaryDiscreteExport_rank_additivity : The direct-sum dimension is n_1+n_2, with neither twist changing dimension.
Test TauCeti.AutomorphicGalois.unitaryDiscreteExport_not_cuspidal_irreducibility : A two-character endoscopic sum cannot certify global irreducibility.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.2, AutomorphicGaloisRepresentationsPartII:AG2.5, AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character, EndoscopicTransferAndUnitaryTraceComparison:ET.7a, PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/lattice-residual-polynomial-export
Signature TauCeti.AutomorphicGalois.ResidualPolynomialExport:
ResidualPolynomialExport(π,λ) contains a finite p-adic realization E, an explicitly chosen stable O_E-lattice, its continuous integral realization, the semisimple residual member, the coefficient-reduction maps on every good P_v and the comparison isomorphisms under another lattice or coefficient extension. It exports m_{π,λ} and its Galois-type evidence; non-Eisensteinness and decomposed genericity are additional hypotheses or projections only when proved. The chosen lattice is retained as data and never named canonical.
API signatures (the executable algebraic parts, when present, are above):
TauCeti.AutomorphicGalois.ResidualPolynomialExport : Assemble finite realization, chosen lattice and reduction maps.
TauCeti.AutomorphicGalois.residualExport_compareLattice : Different chosen lattices give isomorphic semisimple residual members, not necessarily isomorphic reductions.
TauCeti.AutomorphicGalois.residualExport_maxIdeal : Retrieve m_{π,λ} with Galois-type evidence.
TauCeti.AutomorphicGalois.residualExport_charpoly : The integral/residual Frobenius square commutes by Matrix.charpoly_map.
Test/example signatures:
Test TauCeti.AutomorphicGalois.residualExport_rank_one : Reduction of an integral character is its residual character.
Test TauCeti.AutomorphicGalois.residualExport_diagonal_mod3 : The diagonal integral test reduces X²−3X+2 to X²+2 modulo 3.
Test TauCeti.AutomorphicGalois.residualExport_unipotent_lattices : The two Z_5-unipotent lattices have unequal reductions but equal semisimplifications; the package cannot identify the raw reductions.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi, AutomorphicGaloisRepresentationsPartII:AG2.7/good-polynomial-reduction, AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence.
-/

/-
AutomorphicGaloisRepresentationsPartII:AG2.7/rank-two-residual-comparison-with-r19
Signature Rank-two residual comparison with R19:
For the regular classical/Hilbert exact overlap, fixed λ and the characteristic-zero dual/twist normalization of AG2.6, semisimple reduction commutes with the identification of the AG2 and R19 λ-members. In the classical normalization r̄_AG2≅r̄_R19^∨; the geometric good polynomial is X²−ā_qX+ψ̄(q)q^{k−1}. The associated maximal Hecke ideals agree under the normalized Hecke algebra identification. R19’s explicit geometry and lattice calculations remain supplier tools; only the semisimple isomorphism class, not a preferred lattice, is compared.
Missing full-signature inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/rank-two-comparison-with-r19, AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi, AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence.
-/
