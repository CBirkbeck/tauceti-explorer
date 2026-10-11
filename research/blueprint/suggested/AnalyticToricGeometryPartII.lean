/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import TauCeti.Geometry.Toric.Algebraic.Fan.Basic
import TauCeti.Geometry.Toric.Algebraic.Ray.Primitive
import TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.Basic
import TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.Principal
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic
import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.Algebra.MonoidAlgebra.MapDomain
import Mathlib.Topology.ContinuousMap.ZeroAtInfty
import Mathlib.Topology.Category.TopCat.Limits.Basic
import Mathlib.CategoryTheory.GlueData
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.Data.Fin.VecNotation
import Mathlib.Data.ZMod.Basic
import Mathlib.Topology.MetricSpace.Ultra.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These signatures suggest Lean forms so that contributors and reviewers converge on names and
interfaces. No implementation is claimed.

Coordinate signatures choose bases of N and M; `v` is the supplied list of distinct primitive
ray vectors. The native `TauCeti.Toric.Fan` and `primitiveGenerator` are imported, never replaced.
Generic-ring XΣ and the monoid-chart diagrams are inputs from C0, not new toric-scheme definitions.

PINNED-TYPE BOUNDARY: the pinned library has Spa and finite fans, but no global AdicSpace,
PerfectoidSpace, tilting operator or the supplier toric scheme family. Consequently:
* `unitToricSpace` and `perfectoidToricSpace` prototype the underlying TopCat gluing of the
  already constructed chart diagrams. Their adic structures, coefficient-field base change and
  chart identifications are omitted, not encoded by proposition-valued placeholder fields.
* `cartierIntegralModel` prototypes its character frame data. The sheaf on XΣ,K° and completion
  are supplied by C0/R2 and are not reconstructed here.
* `perfectedDivisorSections` and `gradedDivisorAlgebra` use the native discrete c₀ coefficient
  carrier. Multiplication is convolution via named operations, NEVER its pointwise ring instance.
  The P2 perfectoid ring, plus ring and tilt conditions await that supplier.
* global comparison signatures take the underlying spaces, sites, cohomology modules and
  algebraic zero-locus operations as supplier parameters. Their identification with the named
  toric objects and the hypotheses requiring the unavailable geometric carriers are omitted.
  Each such omission is called out next to the signature and in the handoff ledger.
The concrete ray inequalities, divisor coefficients, convolution support and c₀ tests are fully
stated. Abstract supplier parameters describe a signature shape, not an arbitrary-space theorem.
-/

noncomputable section
open CategoryTheory
open scoped BigOperators ZeroAtInfty
namespace TauCeti.Toric.Nonarchimedean

abbrev Lattice (n : ℕ) := Fin n → ℤ
abbrev RationalLattice (n : ℕ) := Fin n → ℚ

def pairing {n : ℕ} (u v : Lattice n) : ℤ := ∑ k, u k * v k

def rationalPairing {n : ℕ} (u : RationalLattice n) (v : Lattice n) : ℚ :=
  ∑ k, u k * (v k : ℚ)

def p1Rays : Fin 2 → Lattice 1 := ![fun _ => 1, fun _ => -1]
def p1Divisor (d : ℤ) : Fin 2 → ℤ := ![0, d]

/- NT.0: native Weil carrier; the geometric ray-point identification is a C0 input. -/
def invariantDivisor {r : ℕ} {X : AlgebraicGeometry.Scheme}
    (rayPoints : Fin r → TauCeti.AlgebraicGeometry.CodimensionOnePoint X) :
    (Fin r →₀ ℤ) →+ TauCeti.AlgebraicGeometry.SchemeWeilDivisor X :=
  Finsupp.mapDomain.addMonoidHom rayPoints

lemma invariantDivisor_coeff {r : ℕ} {X : AlgebraicGeometry.Scheme}
    (rayPoints : Fin r → TauCeti.AlgebraicGeometry.CodimensionOnePoint X)
    (hi : Function.Injective rayPoints) (a : Fin r →₀ ℤ) (i : Fin r) :
    invariantDivisor rayPoints a (rayPoints i) = a i := by sorry

lemma invariantDivisor_injective {r : ℕ} {X : AlgebraicGeometry.Scheme}
    (rayPoints : Fin r → TauCeti.AlgebraicGeometry.CodimensionOnePoint X)
    (hi : Function.Injective rayPoints) : Function.Injective (invariantDivisor rayPoints) := by
  sorry

/-- Coefficient portion; identification with the scheme's principal divisor awaits C0. -/
lemma invariantDivisor_principal {n r : ℕ} {X : AlgebraicGeometry.Scheme}
    (rayPoints : Fin r → TauCeti.AlgebraicGeometry.CodimensionOnePoint X)
    (hi : Function.Injective rayPoints) (v : Fin r → Lattice n) (u : Lattice n) (i : Fin r) :
    invariantDivisor rayPoints (Finsupp.ofSupportFinite (fun j => pairing u (v j))
      (Set.toFinite _)) (rayPoints i) = pairing u (v i) := by sorry

-- Test invariantDivisor_p1: signs of the character divisor, before the geometric identification.
example (u : ℤ) : pairing (fun _ => u) (p1Rays 0) = u ∧
    pairing (fun _ => u) (p1Rays 1) = -u := by sorry

-- Test invariantDivisor_torus: a rayless fan has zero coefficient group.
example (a : Fin 0 →₀ ℤ) : a = 0 := by sorry

-- Test invariantDivisor_multiplicity: multiplicity is retained.
example {X : AlgebraicGeometry.Scheme}
    (rayPoints : Fin 1 → TauCeti.AlgebraicGeometry.CodimensionOnePoint X) :
    invariantDivisor rayPoints (Finsupp.single 0 2) ≠
      invariantDivisor rayPoints (Finsupp.single 0 1) := by sorry

def sectionWeights {n r : ℕ} (v : Fin r → Lattice n) (a : Fin r → ℤ) : Set (Lattice n) :=
  {u | ∀ i, -a i ≤ pairing u (v i)}

lemma mem_sectionWeights {n r : ℕ} (v : Fin r → Lattice n) (a : Fin r → ℤ)
    (u : Lattice n) : u ∈ sectionWeights v a ↔ ∀ i, 0 ≤ pairing u (v i) + a i := by sorry

lemma sectionWeights_principalShift {n r : ℕ} (v : Fin r → Lattice n)
    (a : Fin r → ℤ) (m u : Lattice n) :
    u ∈ sectionWeights v (fun i => a i + pairing m (v i)) ↔
      u + m ∈ sectionWeights v a := by sorry

lemma sectionWeights_add {n r : ℕ} (v : Fin r → Lattice n) (a b : Fin r → ℤ)
    (u w : Lattice n) (hu : u ∈ sectionWeights v a) (hw : w ∈ sectionWeights v b) :
    u + w ∈ sectionWeights v (a + b) := by sorry

-- Test sectionWeights_p1.
example (d u : ℤ) : (fun _ => u) ∈ sectionWeights p1Rays (p1Divisor d) ↔
    0 ≤ u ∧ u ≤ d := by sorry
-- Test sectionWeights_negative.
example : sectionWeights p1Rays (p1Divisor (-1)) = ∅ := by sorry
-- Test sectionWeights_torus.
example (n : ℕ) (v : Fin 0 → Lattice n) : sectionWeights v 0 = Set.univ := by sorry

/-- Algebraic sections; the global sheaf comparison is stated in the reader. -/
def divisorSections (A : Type*) [CommRing A] {n r : ℕ}
    (v : Fin r → Lattice n) (a : Fin r → ℤ) : Submodule A (AddMonoidAlgebra A (Lattice n)) :=
  { carrier := {f | ∀ u, f.coeff u ≠ 0 → u ∈ sectionWeights v a}
    zero_mem' := by sorry
    add_mem' := by sorry
    smul_mem' := by sorry }

def divisorSections_monomial {A : Type*} [CommRing A] {n r : ℕ}
    (v : Fin r → Lattice n) (a : Fin r → ℤ) (u : sectionWeights v a) :
    divisorSections A v a := ⟨AddMonoidAlgebra.ofCoeff (Finsupp.single u.val 1), by sorry⟩

lemma divisorSections_coeff {A : Type*} [CommRing A] {n r : ℕ}
    (v : Fin r → Lattice n) (a : Fin r → ℤ) (f g : divisorSections A v a) :
    f = g ↔ ∀ u, f.val.coeff u = g.val.coeff u := by sorry

/-- The coefficient portion of tensor base change; no arbitrary flatness assumption is needed. -/
def divisorSections_baseChange {A B : Type*} [CommRing A] [CommRing B] {n r : ℕ}
    (v : Fin r → Lattice n) (a : Fin r → ℤ) (φ : A →+* B)
    (f : divisorSections A v a) : divisorSections B v a :=
  ⟨AddMonoidAlgebra.ofCoeff (f.val.coeff.mapRange φ φ.map_zero), by sorry⟩

lemma divisorSections_mul {A : Type*} [CommRing A] {n r : ℕ}
    (v : Fin r → Lattice n) (a b : Fin r → ℤ)
    (f : divisorSections A v a) (g : divisorSections A v b) :
    f.val * g.val ∈ divisorSections A v (a + b) := by sorry

-- Test divisorSections_p1: the basis is exactly 0,...,d.
example {A : Type*} [CommRing A] [Nontrivial A] (d : ℕ) (u : ℤ) :
    AddMonoidAlgebra.ofCoeff (Finsupp.single (fun _ : Fin 1 => u) (1 : A)) ∈
      divisorSections A p1Rays (p1Divisor d) ↔ 0 ≤ u ∧ u ≤ d := by sorry
-- Test divisorSections_nilpotents: no reducedness of the coefficient ring is imposed.
example {A : Type*} [CommRing A] (ε : A) (hε : ε ≠ 0) (hnil : ε * ε = 0) :
    AddMonoidAlgebra.ofCoeff (Finsupp.single (0 : Lattice 1) ε) ∈
      divisorSections A p1Rays 0 := by sorry
-- Test divisorSections_zeroRing.
example {A : Type*} [CommRing A] [Subsingleton A] {n r : ℕ}
    (v : Fin r → Lattice n) (a : Fin r → ℤ) (f : divisorSections A v a) : f = 0 := by sorry

/-- Native linear equivalence for the toric invariant representative theorem. -/
theorem invariantDivisorRepresentative {r : ℕ} {X : AlgebraicGeometry.Scheme}
    [AlgebraicGeometry.IsIntegral X] [AlgebraicGeometry.IsNoetherian X]
    (rayPoints : Fin r → TauCeti.AlgebraicGeometry.CodimensionOnePoint X)
    (E : TauCeti.AlgebraicGeometry.SchemeWeilDivisor X) :
    ∃ a : Fin r →₀ ℤ,
      (TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.ofScheme X).LinearlyEquivalent
        E (invariantDivisor rayPoints a) := by
  -- Omitted: X is C0's normal toric scheme over a field for the given native fan, and
  -- rayPoints lists its distinct invariant codimension-one boundary points.
  sorry

/-- Character frames of the integral model. Its global invertible sheaf awaits C0/R2. -/
def cartierIntegralModel {n r c : ℕ} (v : Fin r → Lattice n) (a : Fin r → ℤ)
    (rays : Fin c → Set (Fin r))
    (h : ∀ j, ∃ m : Lattice n, ∀ i ∈ rays j, pairing m (v i) = -a i) :
    Fin c → Lattice n := fun j => Classical.choose (h j)

lemma cartierIntegralModel_generator {n r c : ℕ} (v : Fin r → Lattice n) (a : Fin r → ℤ)
    (rays : Fin c → Set (Fin r))
    (h : ∀ j, ∃ m : Lattice n, ∀ i ∈ rays j, pairing m (v i) = -a i)
    (j : Fin c) (i : Fin r) (hi : i ∈ rays j) :
    pairing (cartierIntegralModel v a rays h j) (v i) = -a i := by sorry

lemma cartierIntegralModel_transition {n : ℕ} (m : Fin 3 → Lattice n) :
    (m 0 - m 1) + (m 1 - m 2) = m 0 - m 2 := by sorry

/-- Frame weights are independent of coefficients; the sheaf base-change isomorphism is omitted. -/
lemma cartierIntegralModel_baseChange {n r c : ℕ} (v : Fin r → Lattice n)
    (a : Fin r → ℤ) (rays : Fin c → Set (Fin r))
    (h h' : ∀ j, ∃ m : Lattice n, ∀ i ∈ rays j, pairing m (v i) = -a i)
    (j : Fin c) (i : Fin r) (hi : i ∈ rays j) :
    pairing (cartierIntegralModel v a rays h j - cartierIntegralModel v a rays h' j) (v i) = 0 :=
  by sorry

/-- A unit bounded together with its inverse has valuation one, including higher-rank values. -/
lemma cartierIntegralModel_unitNorm {Γ : Type*} [LinearOrderedCommGroupWithZero Γ]
    (u uinv : Γ) (hmul : u * uinv = 1) (hu : u ≤ 1) (hui : uinv ≤ 1) : u = 1 := by sorry

-- Test cartierIntegralModel_p1: m_plus=0, m_minus=d and transition weight -d.
example (d : ℤ) : pairing (0 : Lattice 1) (p1Rays 0) = 0 ∧
    pairing (fun _ => d) (p1Rays 1) = -d ∧ (0 : ℤ) - d = -d := by sorry
-- Test cartierIntegralModel_zero.
example {n r : ℕ} (v : Fin r → Lattice n) (i : Fin r) : pairing 0 (v i) = 0 := by sorry
-- Test cartierIntegralModel_rescale: the section and radius scale together.
example {F : Type*} [NormedField F] (c f : F) (ε : ℝ) (hc : c ≠ 0) :
    ‖c * f‖ ≤ ‖c‖ * ε ↔ ‖f‖ ≤ ε := by sorry

/-- Kernel of the invariant-divisor class map on the native linear-equivalence carrier. -/
theorem invariantDivisorClassRelations {n r : ℕ} {X : AlgebraicGeometry.Scheme}
    [AlgebraicGeometry.IsIntegral X] [AlgebraicGeometry.IsNoetherian X]
    (rayPoints : Fin r → TauCeti.AlgebraicGeometry.CodimensionOnePoint X)
    (v : Fin r → Lattice n) (a : Fin r →₀ ℤ) :
    (TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.ofScheme X).LinearlyEquivalent
      (invariantDivisor rayPoints a) 0 ↔ ∃ u : Lattice n, ∀ i, a i = pairing u (v i) := by
  -- Omitted: X is the C0 normal field toric scheme and these are its primitive rays/boundary
  -- points. The general integer presentation, coefficient-field identification and free
  -- cokernel for complete regular fans are described in the definitive reader.
  sorry

/- NT.1: D is the R2 toric unit-chart diagram. Adic data are omitted at this pin. -/
def unitToricSpace (D : GlueData TopCat) : TopCat := D.glued

def unitToricSpace_chart (D : GlueData TopCat) (j : D.J) : D.U j ⟶ unitToricSpace D := D.ι j

lemma unitToricSpace_face (D : GlueData TopCat) (i j : D.J) :
    D.t i j ≫ D.f j i ≫ unitToricSpace_chart D j = D.f i j ≫ unitToricSpace_chart D i := by
  sorry

/-- Comparison-isomorphism shape; completed field-base-change data are unavailable. -/
def unitToricSpace_baseChange (D D' : GlueData TopCat) (baseChanged : TopCat) :
    unitToricSpace D' ≅ baseChanged := by
  -- Omitted: baseChanged is the valued-field base change of unitToricSpace D,
  -- and D' is its base-changed monoid diagram. D is deliberately retained as input.
  let _ := D
  sorry

-- Test unitToricSpace_disc: the full fixture diagram/one-variable Tate algebra is omitted.
example (D : GlueData TopCat) (disc : TopCat) : unitToricSpace D ≅ disc := by sorry
-- Test unitToricSpace_unitTorus: the native Spa condition for t and t^{-1} integral.
example {A : Type*} [CommRing A] [TopologicalSpace A] (Aplus : Subring A)
    (t : Aˣ) (ht : (t : A) ∈ Aplus) (hti : ((t⁻¹ : Aˣ) : A) ∈ Aplus)
    (x : TauCeti.ValuationSpectrum.spa Aplus) :
    x.val.toValuativeRel.vle (t : A) 1 ∧
      x.val.toValuativeRel.vle ((t⁻¹ : Aˣ) : A) 1 := by sorry
-- Test unitToricSpace_p1: its complete fan/analytic fixture identification is omitted.
example (D : GlueData TopCat) (projectiveLine : TopCat) :
    unitToricSpace D ≅ projectiveLine := by sorry

/-- Underlying homeomorphism for complete Σ; toric model/analytic identifications are omitted. -/
def toricAnalytificationComparison (unit analytic : TopCat) : unit ≃ₜ analytic := by sorry

/-- Coefficient-linear power map on the native character algebra. -/
def toricPowerMap (A : Type*) [CommRing A] (n q : ℕ) :
    AddMonoidAlgebra A (Lattice n) →ₐ[A] AddMonoidAlgebra A (Lattice n) := by sorry

lemma toricPowerMap_monomial {A : Type*} [CommRing A] (n q : ℕ) (u : Lattice n) (a : A) :
    toricPowerMap A n q (AddMonoidAlgebra.ofCoeff (Finsupp.single u a)) =
      AddMonoidAlgebra.ofCoeff (Finsupp.single (q • u) a) := by sorry

lemma toricPowerMap_comp {A : Type*} [CommRing A] (n q s : ℕ) :
    (toricPowerMap A n q).comp (toricPowerMap A n s) = toricPowerMap A n (q * s) ∧
      toricPowerMap A n 1 = AlgHom.id A _ := by sorry

/-- Coordinate portion of φ_q*D=qD; the Cartier-divisor pullback carrier is omitted. -/
lemma toricPowerMap_divisor {n r : ℕ} (v : Fin r → Lattice n) (a : Fin r → ℤ)
    (u : Lattice n) (q : ℕ) (hu : u ∈ sectionWeights v a) :
    q • u ∈ sectionWeights v (q • a) := by sorry

-- Test toricPowerMap_p1: zero/infinity preservation is omitted; the affine formula is complete.
example {A : Type*} [CommRing A] (p : ℕ) :
    toricPowerMap A 1 p (AddMonoidAlgebra.ofCoeff (Finsupp.single (fun _ => 1) (1 : A))) =
      AddMonoidAlgebra.ofCoeff (Finsupp.single (fun _ => (p : ℤ)) 1) := by sorry
-- Test toricPowerMap_identity.
example {A : Type*} [CommRing A] (n : ℕ) : toricPowerMap A n 1 = AlgHom.id A _ := by sorry
-- Test toricPowerMap_coefficients: arbitrary coefficients are fixed.
example {A : Type*} [CommRing A] (n p : ℕ) (a : A) :
    toricPowerMap A n p (AddMonoidAlgebra.ofCoeff (Finsupp.single 0 a)) =
      AddMonoidAlgebra.ofCoeff (Finsupp.single 0 a) := by sorry

/- NT.2: c₀ carriers and coordinate cones. The generic perfected-cone ring is a P2 input. -/
def HasPDenominator (p : ℕ) (q : ℚ) : Prop :=
  ∃ m : ℕ, ∃ a : ℤ, q = (a : ℚ) / (p : ℚ) ^ m

def perfectedWeights {n r : ℕ} (p : ℕ) (v : Fin r → Lattice n) (a : Fin r → ℚ) :=
  {u : RationalLattice n // (∀ k, HasPDenominator p (u k)) ∧
    ∀ i, -a i ≤ rationalPairing u (v i)}

instance {n r : ℕ} (p : ℕ) (v : Fin r → Lattice n) (a : Fin r → ℚ) :
    TopologicalSpace (perfectedWeights p v a) := ⊥

instance {n r : ℕ} (p : ℕ) (v : Fin r → Lattice n) (a : Fin r → ℚ) :
    DiscreteTopology (perfectedWeights p v a) := ⟨rfl⟩

def perfectoidToricSpace (D : GlueData TopCat) : TopCat := D.glued

def perfectoidToricSpace_chart (D : GlueData TopCat) (j : D.J) :
    D.U j ⟶ perfectoidToricSpace D := D.ι j

/-- The compatible projection cone; its monomial formula requires the absent P2 chart rings. -/
def perfectoidToricSpace_projection (D : GlueData TopCat) (finiteLevel : TopCat) (n : ℕ) :
    perfectoidToricSpace D ⟶ finiteLevel := by sorry

/-- Base-change isomorphism shape; field extension and completed tensor input are omitted. -/
def perfectoidToricSpace_baseChange (D D' : GlueData TopCat) (baseChanged : TopCat) :
    perfectoidToricSpace D' ≅ baseChanged := by
  let _ := D
  sorry

-- Test perfectoidToricSpace_disc: fixture identification awaits the P2 perfected disc ring.
example (D : GlueData TopCat) (perfectedDisc : TopCat) :
    perfectoidToricSpace D ≅ perfectedDisc := by sorry
-- Test perfectoidToricSpace_torus: the weight carrier must include negative exponents.
example (p : ℕ) (hp : Nat.Prime p) (n : ℕ) :
    HasPDenominator p ((-1 : ℚ) / (p : ℚ)^n) := by sorry
-- Test perfectoidToricSpace_rankZero: the fixture diagram is omitted.
example (D : GlueData TopCat) (basePoint : TopCat) :
    perfectoidToricSpace D ≅ basePoint := by sorry

abbrev perfectedDivisorSections (F : Type*) [NormedField F] {n r : ℕ}
    (p : ℕ) (v : Fin r → Lattice n) (a : Fin r → ℚ) := C₀(perfectedWeights p v a, F)

lemma perfectedDivisorSections_coeff {F : Type*} [NormedField F] {n r : ℕ}
    (p : ℕ) (v : Fin r → Lattice n) (a : Fin r → ℚ)
    (f g : perfectedDivisorSections F p v a) : f = g ↔ ∀ u, f u = g u := by sorry

lemma perfectedDivisorSections_dense {F : Type*} [NormedField F] {n r : ℕ}
    (p : ℕ) (v : Fin r → Lattice n) (a : Fin r → ℚ)
    (f : perfectedDivisorSections F p v a) (ε : ℝ) (hε : 0 < ε) :
    ∃ g : perfectedWeights p v a →₀ F, ∀ u, ‖f u - g u‖ < ε := by sorry

/-- Bounded convolution, not the pointwise product instance of the native coefficient carrier. -/
def perfectedDivisorSections_mul {F : Type*} [NormedField F] [CompleteSpace F]
    [IsUltrametricDist F]
    {n r : ℕ} (p : ℕ) (v : Fin r → Lattice n) (a b : Fin r → ℚ)
    (f : perfectedDivisorSections F p v a) (g : perfectedDivisorSections F p v b) :
    perfectedDivisorSections F p v (a + b) := by sorry

/-- The weight portion of finite-support p-power descent; algebraic sheaf comparison is omitted. -/
lemma perfectedDivisorSections_descent {n r : ℕ} (p : ℕ) (v : Fin r → Lattice n)
    (a : Fin r → ℤ) (s : Finset (RationalLattice n))
    (hs : ∀ u ∈ s, (∀ k, HasPDenominator p (u k)) ∧
      ∀ i, -(a i : ℚ) ≤ rationalPairing u (v i)) :
    ∃ N : ℕ, ∀ u ∈ s, ∃ w : Lattice n,
      (∀ k, (w k : ℚ) = (p : ℚ)^N * u k) ∧
      w ∈ sectionWeights v ((p^N) • a) := by sorry

-- Test perfectedDivisorSections_p1.
example (p : ℕ) (hp : Nat.Prime p) (n : ℕ) :
    HasPDenominator p ((1 : ℚ) / (p : ℚ)^n) ∧
      0 ≤ (1 : ℚ) / (p : ℚ)^n ∧ (1 : ℚ) / (p : ℚ)^n ≤ 1 := by sorry
-- Test perfectedDivisorSections_zero: the complete P1 fan has only weight zero.
example (p : ℕ) (u : perfectedWeights p p1Rays 0) : u.val = 0 := by sorry
-- Test perfectedDivisorSections_constantFamily: infinitely many coefficient ones violate c0.
example (p : ℕ) (hp : Nat.Prime p) (F : Type*) [NormedField F]
    (f : perfectedDivisorSections F p p1Rays ![0, 1]) : ¬ (∀ u, f u = 1) := by sorry

/-- Real cone C_D; the perfected lattice intersection is separately represented below. -/
def divisorCone {n r : ℕ} (v : Fin r → Lattice n) (a : Fin r → ℤ) :
    Set ((Fin n → ℝ) × ℝ) := {z | ∀ i, 0 ≤ (∑ k, z.1 k * (v i k : ℝ)) + z.2 * a i}

lemma divisorCone_grade {n r : ℕ} (v : Fin r → Lattice n) (a : Fin r → ℤ)
    (u : Fin n → ℝ) (j : ℝ) :
    (u, j) ∈ divisorCone v a ↔ ∀ i, -(j * a i) ≤ ∑ k, u k * (v i k : ℝ) := by sorry

lemma divisorCone_add {n r : ℕ} (v : Fin r → Lattice n) (a : Fin r → ℤ)
    (z w : (Fin n → ℝ) × ℝ) (hz : z ∈ divisorCone v a) (hw : w ∈ divisorCone v a) :
    z + w ∈ divisorCone v a := by sorry

lemma divisorCone_principal {n r : ℕ} (v : Fin r → Lattice n) (a : Fin r → ℤ)
    (m : Lattice n) (u : Fin n → ℝ) (j : ℝ) :
    (u, j) ∈ divisorCone v a ↔
      ((fun k => u k - j * m k), j) ∈ divisorCone v (fun i => a i + pairing m (v i)) := by sorry

-- Test divisorCone_p1.
example (u j : ℝ) : ((fun _ => u), j) ∈ divisorCone p1Rays (p1Divisor 1) ↔
    0 ≤ u ∧ u ≤ j := by sorry
-- Test divisorCone_zeroDivisor.
example (u j : ℝ) : ((fun _ => u), j) ∈ divisorCone p1Rays 0 ↔ u = 0 := by sorry
-- Test divisorCone_incompleteDegreeZero.
example : ((fun _ : Fin 1 => (1 : ℝ)), 0) ∈
    divisorCone (fun _ : Fin 1 => fun _ => 1) 0 := by sorry

def perfectedConeWeights {n r : ℕ} (p : ℕ) (v : Fin r → Lattice n) (a : Fin r → ℤ) :=
  {z : RationalLattice n × ℚ // (∀ k, HasPDenominator p (z.1 k)) ∧
    HasPDenominator p z.2 ∧ ∀ i, 0 ≤ rationalPairing z.1 (v i) + z.2 * a i}
instance {n r : ℕ} (p : ℕ) (v : Fin r → Lattice n) (a : Fin r → ℤ) :
    TopologicalSpace (perfectedConeWeights p v a) := ⊥
instance {n r : ℕ} (p : ℕ) (v : Fin r → Lattice n) (a : Fin r → ℤ) :
    DiscreteTopology (perfectedConeWeights p v a) := ⟨rfl⟩

/-- Coefficient carrier of R_D. Its P2 convolution ring structure and tilt are omitted. -/
abbrev gradedDivisorAlgebra (F : Type*) [NormedField F] {n r : ℕ}
    (p : ℕ) (v : Fin r → Lattice n) (a : Fin r → ℤ) := C₀(perfectedConeWeights p v a, F)

lemma gradedDivisorAlgebra_homogeneous {F : Type*} [NormedField F] {n r : ℕ}
    (p : ℕ) (v : Fin r → Lattice n) (a : Fin r → ℤ)
    (f : gradedDivisorAlgebra F p v a) (j : ℚ) :
    (∀ z, z.val.2 ≠ j → f z = 0) ↔ (∀ z, f z ≠ 0 → z.val.2 = j) := by sorry

/-- Fibre identification with perfected section weights (the Banach isometry is omitted). -/
lemma gradedDivisorAlgebra_section {n r : ℕ} (p : ℕ) (v : Fin r → Lattice n)
    (a : Fin r → ℤ) (j : ℚ) (hj : HasPDenominator p j) (u : RationalLattice n) :
    (∃ h, (⟨(u, j), h⟩ : perfectedConeWeights p v a).val.2 = j) ↔
      (∀ k, HasPDenominator p (u k)) ∧ ∀ i, -(j * a i) ≤ rationalPairing u (v i) := by sorry

/-- Ring-equivalence shape with supplier rings, not coefficientwise sharp. -/
def gradedDivisorAlgebra_tilt (tiltedR coneR : Type*) [CommRing tiltedR] [CommRing coneR] :
    tiltedR ≃+* coneR := by
  -- Omitted: tiltedR is the P2 tilt of R_D and coneR is the cone algebra over F♭.
  sorry

/-- Weight portion for the complete P1 fixture; general completeness is a native Fan predicate. -/
lemma gradedDivisorAlgebra_degreeZero (p : ℕ) (a : Fin 2 → ℤ)
    (z : perfectedConeWeights p p1Rays a) (hj : z.val.2 = 0) : z.val.1 = 0 := by sorry

-- Test gradedDivisorAlgebra_p1: the perfected positive-orthant change of exponents.
example (u j : ℚ) : 0 ≤ u ∧ u ≤ j ↔ 0 ≤ u ∧ 0 ≤ j - u := by sorry
-- Test gradedDivisorAlgebra_zeroDivisor: all positive and negative degrees occur.
example (p : ℕ) (hp : Nat.Prime p) (j : ℤ) :
    ∃ z : perfectedConeWeights p p1Rays 0, z.val = (0, (j : ℚ)) := by sorry
-- Test gradedDivisorAlgebra_product: an infinite coefficient-one degree family is not c0.
example (p : ℕ) (hp : Nat.Prime p) (F : Type*) [NormedField F]
    (f : gradedDivisorAlgebra F p p1Rays 0) : ¬ (∀ z, f z = 1) := by sorry

/- NT.3: supplier spaces and sites. Omitted conditions are geometric identifications only. -/
abbrev towerCarrier (X : TopCat) (φ : X ⟶ X) := {x : ℕ → X // ∀ n, φ (x (n+1)) = x n}

def toricTiltingComparison (tiltedPerfectoid perfectoidOverTilt : TopCat) :
    tiltedPerfectoid ≅ perfectoidOverTilt := by sorry

/-- Topological component of the tilde-limit. Dense chart functions await the P2 chart rings. -/
def toricTildeLimit (perfectoid finiteLevel : TopCat) (φ : finiteLevel ⟶ finiteLevel) :
    perfectoid ≃ₜ towerCarrier finiteLevel φ := by sorry

def toricTopologicalLimit (tiltedUnit finiteLevel : TopCat) (φ : finiteLevel ⟶ finiteLevel) :
    tiltedUnit ≃ₜ towerCarrier finiteLevel φ := by sorry

/-- This construction uses an actual homeomorphism input and omits no topological condition. -/
def toricProjection {tiltedUnit finiteLevel : TopCat} {φ : finiteLevel ⟶ finiteLevel}
    (e : tiltedUnit ≃ₜ towerCarrier finiteLevel φ) : C(tiltedUnit, finiteLevel) :=
  ⟨fun x => (e x).val 0, by sorry⟩

/-- Affine coordinate formula; homogeneous projective quotient is omitted. -/
lemma toricProjection_coordinates {tiltedUnit finiteLevel : TopCat}
    {φ : finiteLevel ⟶ finiteLevel} (e : tiltedUnit ≃ₜ towerCarrier finiteLevel φ)
    {F Fb : Type*} [MulOneClass F] [MulOneClass Fb]
    (sharp : Fb →* F) (t : tiltedUnit → Fb) (tK : finiteLevel → F) (x : tiltedUnit) :
    tK (toricProjection e x) = sharp (t x) := by
  -- Omitted: t and tK are the corresponding toric affine character coordinates, and e is
  -- the sharp-tower homeomorphism. This formula is not asserted for arbitrary coordinates.
  sorry

lemma toricProjection_power {tiltedUnit finiteLevel : TopCat}
    {φ : finiteLevel ⟶ finiteLevel} (e : tiltedUnit ≃ₜ towerCarrier finiteLevel φ)
    (φb : tiltedUnit ⟶ tiltedUnit)
    (he : ∀ x n, (e (φb x)).val n = φ ((e x).val n)) (x : tiltedUnit) :
    toricProjection e (φb x) = φ (toricProjection e x) := by sorry

/-- The stratum correspondence shape; the named toric strata are supplier inputs. -/
lemma toricProjection_strata {tiltedUnit finiteLevel : TopCat}
    {φ : finiteLevel ⟶ finiteLevel} (e : tiltedUnit ≃ₜ towerCarrier finiteLevel φ)
    (stratum : Set finiteLevel) (tiltedStratum : Set tiltedUnit) :
    toricProjection e ⁻¹' stratum = tiltedStratum := by sorry

lemma toricProjection_preimage {tiltedUnit finiteLevel : TopCat}
    {φ : finiteLevel ⟶ finiteLevel} (e : tiltedUnit ≃ₜ towerCarrier finiteLevel φ)
    (U : Set finiteLevel) (hU : IsOpen U) : IsOpen (toricProjection e ⁻¹' U) := by sorry

-- Test toricProjection_p1: zero/infinity coordinates; toric fixture identification is omitted.
example {F Fb : Type*} [MonoidWithZero F] [MonoidWithZero Fb] (sharp : Fb →*₀ F) :
    sharp 0 = 0 ∧ sharp 1 = 1 := by sorry
-- Test toricProjection_scaling: the multiplicative coordinate calculation is fully typed.
example {F Fb : Type*} [Monoid F] [Monoid Fb] (sharp : Fb →* F) (scale x : Fb) :
    sharp (scale * x) = sharp scale * sharp x := by sorry
-- Test toricProjection_line: actual inverse-image tower condition; nonalgebraicity is omitted.
example {X Xb : TopCat} {φ : X ⟶ X} (e : Xb ≃ₜ towerCarrier X φ) (line : Set X) (x : Xb) :
    toricProjection e x ∈ line ↔ ∀ n, (e x).val n ∈ {y | (φ^[n]) y ∈ line} := by sorry

/-- Supply the small étale sites and the finite-stage colimit site from A1/P7. -/
def toricEtaleComparison (Ctilt Climit : Type*) [Category Ctilt] [Category Climit]
    (Jtilt : GrothendieckTopology Ctilt) (Jlimit : GrothendieckTopology Climit) :
    Sheaf Jtilt (Type) ≌ Sheaf Jlimit (Type) := by sorry

/-- Inverse-image functor shape; site construction, left exactness and adjunction await A1/P7. -/
def toricOpenTopos (CU CV : Type*) [Category CU] [Category CV]
    (JU : GrothendieckTopology CU) (JV : GrothendieckTopology CV) :
    Sheaf JU (Type) ⥤ Sheaf JV (Type) := by sorry

/-- Full-analytic A1 fixture comes from P1 minus infinity, not the unit-disc fan. -/
def affineLineSharpComparison (affineTilt affineK : TopCat) (power : affineK ⟶ affineK) :
    affineTilt ≃ₜ towerCarrier affineK power := by sorry

/- NT.4: cohomology modules are H0 supplier values, not new cohomology definitions. -/
theorem toricPowerCohomology {H : Type*} [AddCommGroup H] (ℓ m : ℕ)
    [Module (ZMod (ℓ^m)) H] (p : ℕ) (hp : Nat.Prime p) (hℓ : Nat.Prime ℓ)
    (hne : ℓ ≠ p) (hm : 1 ≤ m) (powerPullback : H →ₗ[ZMod (ℓ^m)] H) :
    Function.Bijective powerPullback := by
  -- Omitted: H=H^i(XΣ,K^an,Z/ℓ^m), complete regular Σ, K algebraically closed perfectoid,
  -- i≥0, and powerPullback=φ_p*. Prime and coefficient-exponent hypotheses are present.
  sorry

theorem toricProjectionCohomology {H Hb : Type*} [AddCommGroup H] [AddCommGroup Hb]
    (ℓ m : ℕ) [Module (ZMod (ℓ^m)) H] [Module (ZMod (ℓ^m)) Hb]
    (p : ℕ) (hp : Nat.Prime p) (hℓ : Nat.Prime ℓ) (hne : ℓ ≠ p) (hm : 1 ≤ m)
    (projectionPullback : H →ₗ[ZMod (ℓ^m)] Hb) : Function.Bijective projectionPullback := by
  -- Same omitted geometry/coefficient hypotheses as toricPowerCohomology;
  -- Hb is the tilted cohomology and projectionPullback is induced by the geometric morphism.
  sorry

/- NT.5–6: genuine coefficient approximation plus supplier geometric zero-locus shapes. -/
theorem toricSectionNeighbourhoods {X : TopCat} (zeroLocus : Set X)
    (sectionBound : ℕ → Set X) (U : Set X) (hU : IsOpen U) (hY : zeroLocus ⊆ U)
    (hcompact : IsCompact Uᶜ) (hclosed : ∀ n, IsClosed (sectionBound n))
    (hanti : Antitone sectionBound) (hzero : (⋂ n, sectionBound n) = zeroLocus) :
    ∃ n, zeroLocus ⊆ sectionBound n ∧ sectionBound n ⊆ U := by
  -- X here carries the constructible topology, not the analytic topology. All topological
  -- compactness/closedness/cofinality hypotheses are present. Omitted: identification with the
  -- proper smooth toric analytification and the finite-family R2 section domains
  -- ∩ᵢ{|fᵢ|≤|ϖ|^n}; continuity of valuations supplies hzero.
  sorry

/-- Finite-support dense-field coefficient step. The homogeneous sharp estimate is imported P2. -/
theorem denseFieldSectionApproximation {F k : Type*} [NormedField F] [Field k] [Algebra k F]
    {n r : ℕ} (p : ℕ) (v : Fin r → Lattice n) (a : Fin r → ℚ)
    (hdense : DenseRange (algebraMap k F)) (f : perfectedDivisorSections F p v a)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ g : perfectedWeights p v a →₀ k, ∀ u, ‖f u - algebraMap k F (g u)‖ < ε := by sorry

/-- Zero-locus operation and geometric coordinates are supplied by C0/R1. -/
theorem toricHypersurfaceApproximation {X Xb : TopCat} (π : C(Xb, X))
    (k : Type*) [Field k] (n : ℕ) (zero : (Lattice n →₀ k) → Set Xb)
    (U : Set X) (hU : IsOpen U) :
    ∃ h : Lattice n →₀ k, h ≠ 0 ∧ zero h ⊆ π ⁻¹' U := by
  -- Omitted: K perfectoid; X and Xb are the complete regular toric analytifications;
  -- U contains a nonempty Cartier hypersurface Y; k is dense in K♭; h is a section of
  -- O(p^N D) for the invariant representative D, and zero is its algebraic zero-locus map.
  -- Its divisor degree and coefficient-ring descent are specified in the reader.
  sorry

/- NT.6: actual finite balancing kernel. The rows are obtained from the native fan by
choosing annihilator bases; that extraction and the SF5 Chow carrier are omitted. -/
def toricIntersectionWeights {rows cols : ℕ} (A : Fin rows → Fin cols → ℤ) :
    Submodule ℤ (Fin cols → ℤ) where
  carrier := {c | ∀ i, ∑ j, A i j * c j = 0}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

lemma toricIntersectionWeights_mem {rows cols : ℕ} (A : Fin rows → Fin cols → ℤ)
    (c : Fin cols → ℤ) : c ∈ toricIntersectionWeights A ↔
      ∀ i, ∑ j, A i j * c j = 0 := by sorry

lemma toricIntersectionWeights_ext {rows cols : ℕ} (A : Fin rows → Fin cols → ℤ)
    (c d : toricIntersectionWeights A) : c = d ↔ ∀ j, c.val j = d.val j := by sorry

-- Test toricIntersectionWeights_p1: the maximal-cone weights agree across the wall.
example (c : Fin 2 → ℤ) : c ∈ toricIntersectionWeights ![![1, -1]] ↔ c 0 = c 1 := by
  sorry
-- Test toricIntersectionWeights_product: opposite-ray values agree on P1×P1.
example (c : Fin 4 → ℤ) :
    c ∈ toricIntersectionWeights ![![1, 0, -1, 0], ![0, 1, 0, -1]] ↔
      c 0 = c 2 ∧ c 1 = c 3 := by sorry
-- Test toricIntersectionWeights_unbalanced.
example : ![1, 0, 0, 0] ∉
    toricIntersectionWeights ![![1, 0, -1, 0], ![0, 1, 0, -1]] := by sorry

/-- Integer fan-displacement formula. SF5 Chow evaluation and fan index extraction are omitted. -/
theorem toricFanDisplacementProduct {left right out : ℕ}
    (indices : Fin out → Fin left → Fin right → ℤ)
    (c : Fin left → ℤ) (d : Fin right → ℤ) (chowProductWeight : Fin out → ℤ) :
    ∀ γ, chowProductWeight γ = ∑ σ, ∑ τ, indices γ σ τ * c σ * d τ := by
  -- Omitted: c,d are balanced weights of the given codimensions on a complete native fan;
  -- chowProductWeight evaluates their operational Chow product; indices are the generic
  -- fan-displacement lattice indices on contributing pairs and zero on other pairs.
  sorry

/-- Positive toric degree, once SF5 supplies the intersection and degree operations. -/
theorem toricIntersectionDegree (n c : ℕ) (degree : ℤ) : 0 < degree := by
  -- Omitted: degree=deg(H^(n-c)·D1···Dc) on smooth projective XΣ, with H ample and
  -- the initial nonempty proper Cartier intersection of codimension c. n,c retain the shape.
  let _ := n
  let _ := c
  sorry

/-- Subvarieties, analytification, dimension and k-descent are supplier inputs. -/
theorem toricCompleteIntersectionApproximation {X Xb : TopCat} (π : C(Xb, X))
    (Subvariety : Type*) (analyticSupport : Subvariety → Set Xb)
    (dimension : Subvariety → ℕ) (U : Set X) (hU : IsOpen U) (d : ℕ) :
    ∃ Z, analyticSupport Z ⊆ π ⁻¹' U ∧ dimension Z = d := by
  -- Omitted: Σ smooth projective, K perfectoid, nonempty Y of dimension d cut out by
  -- codimension-many Cartier hypersurfaces, U⊃Y^an, and Subvariety the reduced closed
  -- subvarieties defined over the given dense subfield k⊂K♭. No irreducibility assumption.
  sorry

end TauCeti.Toric.Nonarchimedean
