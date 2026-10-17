/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import TauCeti.Geometry.Toric.Algebraic.Fan.Basic
import TauCeti.Geometry.Toric.Algebraic.Ray.Primitive
import TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.Basic
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.Algebra.MonoidAlgebra.MapDomain
import Mathlib.Topology.ContinuousMap.ZeroAtInfty
import Mathlib.Topology.Category.TopCat.Limits.Basic
import Mathlib.Data.Fin.VecNotation
import Mathlib.Data.ZMod.Basic

/-!
# Analytic toric geometry, Part II: representative target signatures

This file is not the roadmap and is not exhaustive. The definitive document is
`AnalyticToricGeometryPartII.md`. These declarations record light definitions and theorem
signatures statable against the pinned Tau Ceti and Mathlib APIs.

Coordinates choose dual lattice bases. The ray vectors are supplied primitive generators on
Tau Ceti's fan carrier; no new fan or Weil-divisor carrier is defined. Character multiplication
is convolution in the native additive monoid algebra. The discrete c₀ carrier below describes
coefficients only: its pointwise ring instance is not the completed character product.

The reader specifies the toric scheme, sheaf, completed algebra, perfectoid, étale-cohomological
and Chow targets whose geometric carriers are unavailable at the pins. All hypotheses stay in
those targets; they are not replaced here by assertions about arbitrary spaces or maps.
-/

noncomputable section
open scoped BigOperators ZeroAtInfty
namespace TauCeti.Toric.Nonarchimedean

/-- A based integral lattice. -/
abbrev Lattice (n : ℕ) := Fin n → ℤ

/-- Its rational character coordinates. -/
abbrev RationalLattice (n : ℕ) := Fin n → ℚ

/-- Pairing in dual integral bases. -/
def pairing {n : ℕ} (u v : Lattice n) : ℤ := ∑ k, u k * v k

/-- Rational extension of the character pairing. -/
def rationalPairing {n : ℕ} (u : RationalLattice n) (v : Lattice n) : ℚ :=
  ∑ k, u k * (v k : ℚ)

/-- The two primitive rays of the projective-line fan. -/
def p1Rays : Fin 2 → Lattice 1 := ![fun _ => 1, fun _ => -1]

/-- The divisor `d D₋` on that fan. -/
def p1Divisor (d : ℤ) : Fin 2 → ℤ := ![0, d]

/-! ## Layer NT.0: invariant divisors and integral sections -/

/-- Extend ray coefficients into the native Weil carrier through the supplied ray-point map.
C0 supplies the geometric identification with the toric boundary. -/
def invariantDivisor {r : ℕ} {X : AlgebraicGeometry.Scheme}
    (rayPoints : Fin r → TauCeti.AlgebraicGeometry.CodimensionOnePoint X) :
    (Fin r →₀ ℤ) →+ TauCeti.AlgebraicGeometry.SchemeWeilDivisor X :=
  Finsupp.mapDomain.addMonoidHom rayPoints

/-- Distinct boundary points preserve integer multiplicities. -/
theorem invariantDivisor_injective {r : ℕ} {X : AlgebraicGeometry.Scheme}
    (rayPoints : Fin r → TauCeti.AlgebraicGeometry.CodimensionOnePoint X)
    (hi : Function.Injective rayPoints) : Function.Injective (invariantDivisor rayPoints) := by
  sorry

-- The character t has opposite orders at zero and infinity.
-- Packet test: invariantDivisor_p1 (the character-divisor coefficients).
example (u : ℤ) : pairing (fun _ => u) (p1Rays 0) = u ∧
    pairing (fun _ => u) (p1Rays 1) = -u := by sorry

-- An invariant divisor records multiplicity, rather than only its reduced support.
-- Packet test: invariantDivisor_multiplicity.
example {X : AlgebraicGeometry.Scheme}
    (rayPoints : Fin 1 → TauCeti.AlgebraicGeometry.CodimensionOnePoint X) :
    invariantDivisor rayPoints (Finsupp.single 0 2) ≠
      invariantDivisor rayPoints (Finsupp.single 0 1) := by sorry

/-- Character weights of `O(D)` use the bound `⟨u,vᵢ⟩ ≥ -aᵢ`. -/
def sectionWeights {n r : ℕ} (v : Fin r → Lattice n) (a : Fin r → ℤ) : Set (Lattice n) :=
  {u | ∀ i, -a i ≤ pairing u (v i)}

/-- Principal divisor translation has the negative section-weight sign. -/
theorem sectionWeights_principalShift {n r : ℕ} (v : Fin r → Lattice n)
    (a : Fin r → ℤ) (m u : Lattice n) :
    u ∈ sectionWeights v (fun i => a i + pairing m (v i)) ↔
      u + m ∈ sectionWeights v a := by sorry

-- Packet test: sectionWeights_p1.
example (d u : ℤ) : (fun _ => u) ∈ sectionWeights p1Rays (p1Divisor d) ↔
    0 ≤ u ∧ u ≤ d := by sorry

-- Packet test: sectionWeights_negative.
example : sectionWeights p1Rays (p1Divisor (-1)) = ∅ := by sorry

/-- The coefficient submodule of finite monomial sections. Its global sheaf identification is
Scholze, Definition/Proposition 8.4, p. 304, as stated in the reader. -/
def divisorSections (A : Type*) [CommRing A] {n r : ℕ}
    (v : Fin r → Lattice n) (a : Fin r → ℤ) : Submodule A (AddMonoidAlgebra A (Lattice n)) :=
  { carrier := {f | ∀ u, f.coeff u ≠ 0 → u ∈ sectionWeights v a}
    zero_mem' := by sorry
    add_mem' := by sorry
    smul_mem' := by sorry }

/-- Convolution sends sections of `D` and `E` to sections of `D+E`. -/
theorem divisorSections_mul {A : Type*} [CommRing A] {n r : ℕ}
    (v : Fin r → Lattice n) (a b : Fin r → ℤ)
    (f : divisorSections A v a) (g : divisorSections A v b) :
    f.val * g.val ∈ divisorSections A v (a + b) := by sorry

-- Packet test: divisorSections_p1 (monomial membership).
example {A : Type*} [CommRing A] [Nontrivial A] (d : ℕ) (u : ℤ) :
    AddMonoidAlgebra.ofCoeff (Finsupp.single (fun _ : Fin 1 => u) (1 : A)) ∈
      divisorSections A p1Rays (p1Divisor d) ↔ 0 ≤ u ∧ u ≤ d := by sorry

-- Nilpotent coefficients survive; the coefficient ring need not be reduced.
-- Packet test: divisorSections_nilpotents.
example {A : Type*} [CommRing A] (ε : A) (hε : ε ≠ 0) (hnil : ε * ε = 0) :
    AddMonoidAlgebra.ofCoeff (Finsupp.single (0 : Lattice 1) ε) ∈
      divisorSections A p1Rays 0 := by sorry

/-! ## Layer NT.1: unit models and coefficient-linear powers -/

/-- The power map fixes coefficients and multiplies character exponents.
It is the native monoid-algebra map; it is not absolute Frobenius. -/
def toricPowerMap (A : Type*) [CommRing A] (n q : ℕ) :
    AddMonoidAlgebra A (Lattice n) →ₐ[A] AddMonoidAlgebra A (Lattice n) :=
  AddMonoidAlgebra.mapDomainAlgHom A A (nsmulAddMonoidHom q)

/-- Character formula for the coefficient-linear toric power. -/
theorem toricPowerMap_monomial {A : Type*} [CommRing A] (n q : ℕ) (u : Lattice n) (a : A) :
    toricPowerMap A n q (AddMonoidAlgebra.ofCoeff (Finsupp.single u a)) =
      AddMonoidAlgebra.ofCoeff (Finsupp.single (q • u) a) := by sorry

-- Packet test: toricPowerMap_identity.
example {A : Type*} [CommRing A] (n : ℕ) : toricPowerMap A n 1 = AlgHom.id A _ := by sorry

-- Packet test: toricPowerMap_coefficients.
example {A : Type*} [CommRing A] (n p : ℕ) (a : A) :
    toricPowerMap A n p (AddMonoidAlgebra.ofCoeff (Finsupp.single 0 a)) =
      AddMonoidAlgebra.ofCoeff (Finsupp.single 0 a) := by sorry

/-! ## Layer NT.2: perfected coefficient families and the divisor cone -/

/-- Coordinates in `ℤ[1/p]`, represented inside the native rational numbers. -/
def HasPDenominator (p : ℕ) (q : ℚ) : Prop :=
  ∃ m : ℕ, ∃ a : ℤ, q = (a : ℚ) / (p : ℚ) ^ m

/-- Perfected character weights with the same ray inequalities. -/
def perfectedWeights {n r : ℕ} (p : ℕ) (v : Fin r → Lattice n) (a : Fin r → ℚ) :=
  {u : RationalLattice n // (∀ k, HasPDenominator p (u k)) ∧
    ∀ i, -a i ≤ rationalPairing u (v i)}

instance {n r : ℕ} (p : ℕ) (v : Fin r → Lattice n) (a : Fin r → ℚ) :
    TopologicalSpace (perfectedWeights p v a) := ⊥

instance {n r : ℕ} (p : ℕ) (v : Fin r → Lattice n) (a : Fin r → ℚ) :
    DiscreteTopology (perfectedWeights p v a) := ⟨rfl⟩

/-- The native discrete c₀ coefficient carrier. Convolution and its sheaf identification are
separate targets; no pointwise ring structure is used for character multiplication. -/
abbrev perfectedDivisorSections (F : Type*) [NormedField F] {n r : ℕ}
    (p : ℕ) (v : Fin r → Lattice n) (a : Fin r → ℚ) := C₀(perfectedWeights p v a, F)

-- The complete projective-line fan has only the zero weight in degree zero.
-- Packet test: perfectedDivisorSections_zero (the weight set).
example (p : ℕ) (u : perfectedWeights p p1Rays 0) : u.val = 0 := by sorry

-- An infinite family of coefficient ones is not a c₀ section.
-- Packet test: perfectedDivisorSections_constantFamily.
example (p : ℕ) (hp : Nat.Prime p) (F : Type*) [NormedField F]
    (f : perfectedDivisorSections F p p1Rays ![0, 1]) : ¬ (∀ u, f u = 1) := by sorry

-- The finite-monomial control for the completed convolution API: disjoint supports multiply
-- to weight one. Their pointwise coefficient product at that weight would be zero.
-- Packet test: perfectedDivisorSections_convolution (finite-monomial control).
example {F : Type*} [Field F] :
    ((AddMonoidAlgebra.ofCoeff (Finsupp.single (0 : Lattice 1) (1 : F))) *
      AddMonoidAlgebra.ofCoeff (Finsupp.single (fun _ : Fin 1 => 1) 1)).coeff
        (fun _ => 1) = 1 ∧
    (Finsupp.single (0 : Lattice 1) (1 : F) (fun _ => 1)) *
      (Finsupp.single (fun _ : Fin 1 => 1) (1 : F) (fun _ => 1)) = 0 := by sorry

-- The grading control: degrees one and minus one multiply to degree zero.
-- Packet test: gradedDivisorAlgebra_convolution (finite-monomial control).
example {F : Type*} [Field F] :
    ((AddMonoidAlgebra.ofCoeff (Finsupp.single (1 : ℤ) (1 : F))) *
      AddMonoidAlgebra.ofCoeff (Finsupp.single (-1 : ℤ) 1)).coeff 0 = 1 := by sorry

/-- The real cone `C_D` includes the degree coordinate, with no positivity imposed on it. -/
def divisorCone {n r : ℕ} (v : Fin r → Lattice n) (a : Fin r → ℤ) :
    Set ((Fin n → ℝ) × ℝ) := {z | ∀ i, 0 ≤ (∑ k, z.1 k * (v i k : ℝ)) + z.2 * a i}

-- Packet test: divisorCone_p1 (real cone).
example (u j : ℝ) : ((fun _ => u), j) ∈ divisorCone p1Rays (p1Divisor 1) ↔
    0 ≤ u ∧ u ≤ j := by sorry

-- Packet test: divisorCone_zeroDivisor (real cone).
example (u j : ℝ) : ((fun _ => u), j) ∈ divisorCone p1Rays 0 ↔ u = 0 := by sorry

/-! ## Layer NT.3: projection from the topological power tower -/

/-- Compatible sequences in an actual topological power tower. -/
abbrev towerCarrier (X : TopCat) (φ : X ⟶ X) := {x : ℕ → X // ∀ n, φ (x (n+1)) = x n}

/-- Zeroth projection through a supplied homeomorphism to the tower.
The geometric homeomorphism of Scholze Theorem 8.5, p. 305, is a separate reader target. -/
def toricProjection {tiltedUnit finiteLevel : TopCat} {φ : finiteLevel ⟶ finiteLevel}
    (e : tiltedUnit ≃ₜ towerCarrier finiteLevel φ) : C(tiltedUnit, finiteLevel) :=
  ⟨fun x => (e x).val 0, by sorry⟩

/-- The inverse image is governed by every finite-level power equation. -/
theorem toricProjection_powerTower {X Xb : TopCat} {φ : X ⟶ X}
    (e : Xb ≃ₜ towerCarrier X φ) (S : Set X) (x : Xb) :
    toricProjection e x ∈ S ↔ ∀ n, (e x).val n ∈ {y | (φ^[n]) y ∈ S} := by sorry

-- Multiplicative sharp makes homogeneous coordinate scaling compatible.
-- Packet test: toricProjection_scaling.
example {F Fb : Type*} [Monoid F] [Monoid Fb] (sharp : Fb →* F) (scale x : Fb) :
    sharp (scale * x) = sharp scale * sharp x := by sorry

-- In mixed characteristic with residue two, [1:1:0] satisfies the tilted line equation
-- but its sharp coordinates do not satisfy the original one.
-- Packet test: toricProjection_line (coordinate check).
example {F Fb : Type*} [Field F] [CharZero F] [Field Fb] [CharP Fb 2]
    (sharp : Fb →*₀ F) :
    (1 : Fb) + 1 + 0 = 0 ∧ sharp 1 + sharp 1 + sharp 0 ≠ 0 := by sorry

-- Under the equal-characteristic ring identification, the additive line test agrees.
-- Packet test: toricProjection_line_equalCharacteristic (coordinate check).
example {F Fb : Type*} [Field F] [Field Fb] (sharp : Fb ≃+* F) (x y z : Fb) :
    sharp x + sharp y + sharp z = 0 ↔ x + y + z = 0 := by sorry

/-! ## Layer NT.4: prime-to-p cohomology comparisons -/

-- On the projective-line top cohomology, multiplication by p is invertible for ℓ ≠ p;
-- it need not be the identity. Here p=2 and ℓ=3 give an explicit coordinate check.
-- Packet acceptance check of toricPowerCohomology: the P¹ top-degree action.
example : Function.Bijective (fun x : ZMod 3 => (2 : ZMod 3) * x) ∧
    (2 : ZMod 3) * 1 ≠ 1 := by sorry

/-! ## Layer NT.5: section neighbourhoods and dense-field coefficients -/

/-- Compactness gives one bound inside an open neighbourhood when nested closed bounds
have intersection equal to the zero locus. For section domains these hypotheses are used in
constructible topology, as specified in the reader. -/
theorem toricSectionNeighbourhoods {X : TopCat} (zeroLocus : Set X)
    (sectionBound : ℕ → Set X) (U : Set X) (hU : IsOpen U) (hY : zeroLocus ⊆ U)
    (hcompact : IsCompact Uᶜ) (hclosed : ∀ n, IsClosed (sectionBound n))
    (hanti : Antitone sectionBound) (hzero : (⋂ n, sectionBound n) = zeroLocus) :
    ∃ n, zeroLocus ⊆ sectionBound n ∧ sectionBound n ⊆ U := by sorry

/-- A nonzero c₀ family admits nonzero finite-support approximation over a dense subfield.
This is the coefficient step of Scholze Proposition 8.7, p. 306; the homogeneous sharp estimate
and its geometric section-domain application remain in the reader. -/
theorem denseFieldSectionApproximation {F k : Type*} [NormedField F] [Field k] [Algebra k F]
    {n r : ℕ} (p : ℕ) (v : Fin r → Lattice n) (a : Fin r → ℚ)
    (hdense : DenseRange (algebraMap k F)) (f : perfectedDivisorSections F p v a)
    (hf : f ≠ 0) (ε : ℝ) (hε : 0 < ε) :
    ∃ g : perfectedWeights p v a →₀ k, g ≠ 0 ∧
      ∀ u, ‖f u - algebraMap k F (g u)‖ < ε := by sorry

/-! ## Layer NT.6: integral balancing weights -/

/-- The finite integral balancing kernel after choosing annihilator bases.
The native-fan extraction and operational Chow identification are specified in the reader
using Fulton–Sturmfels Theorem 2.1, p. 6. -/
def toricIntersectionWeights {rows cols : ℕ} (A : Fin rows → Fin cols → ℤ) :
    Submodule ℤ (Fin cols → ℤ) where
  carrier := {c | ∀ i, ∑ j, A i j * c j = 0}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

-- Maximal-cone degree-zero weights on the projective line agree across its wall.
-- Packet test: toricIntersectionWeights_p1.
example (c : Fin 2 → ℤ) : c ∈ toricIntersectionWeights ![![1, -1]] ↔ c 0 = c 1 := by
  sorry

-- The product fan requires both pairs of opposite-ray values to agree.
-- Packet test: toricIntersectionWeights_product.
example (c : Fin 4 → ℤ) :
    c ∈ toricIntersectionWeights ![![1, 0, -1, 0], ![0, 1, 0, -1]] ↔
      c 0 = c 2 ∧ c 1 = c 3 := by sorry

-- A single nonzero ray value violates balancing.
-- Packet test: toricIntersectionWeights_unbalanced.
example : ![1, 0, 0, 0] ∉
    toricIntersectionWeights ![![1, 0, -1, 0], ![0, 1, 0, -1]] := by sorry

end TauCeti.Toric.Nonarchimedean
