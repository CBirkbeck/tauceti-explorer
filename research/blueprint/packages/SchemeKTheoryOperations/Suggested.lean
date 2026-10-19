import Mathlib
import TauCeti.CategoryTheory.GrothendieckGroup.Triangulated
import TauCeti.Algebra.Category.ModuleCat.CartanMap

/-!
# K-theory of schemes, localisation and operations: representative target signatures

The roadmap is `README.md`. This file records light definitions and representative signatures
expressible against the pinned APIs; it is not exhaustive. In particular, it does not construct
perfect derived categories, K-theory spectra or higher operations. The cochain convention has
differential of degree one, and strict perfectness requires bounded terms, not just bounded
cohomology. The examples fix the cone sign using Tau Ceti's actual triangulated Grothendieck
group and distinguish the two projective-line basis coordinates.
-/

namespace TauCetiRoadmap.SchemeKTheoryOperations

open CategoryTheory CategoryTheory.Limits
open CategoryTheory.Pretriangulated

universe u v w

/-! ## Layer 1: Perfect complexes and their models -/

/-- A bounded complex of finite locally free sheaves, in the scheme convention of
Thomason–Trobaugh, Definition 2.2.2. The finite bound is on terms. -/
def IsStrictlyPerfect (X : AlgebraicGeometry.Scheme.{u})
    (E : CochainComplex X.Modules ℤ) : Prop :=
  (∃ a b : ℤ, a ≤ b ∧ ∀ i : ℤ, i < a ∨ b < i → IsZero (E.X i)) ∧
  ∀ i : ℤ, SheafOfModules.IsLocallyFree (E.X i) ∧
    SheafOfModules.IsFiniteType (E.X i)

/-- A single finite locally free sheaf is strictly perfect in any cohomological degree. -/
theorem isStrictlyPerfect_single (X : AlgebraicGeometry.Scheme.{u}) (M : X.Modules)
    [M.IsLocallyFree] [M.IsFiniteType] (n : ℤ) :
    IsStrictlyPerfect X ((HomologicalComplex.single X.Modules (ComplexShape.up ℤ) n).obj M) := by
  sorry

/-- Strict perfectness is unchanged by an isomorphism of complexes. -/
theorem isStrictlyPerfect_iff_of_iso (X : AlgebraicGeometry.Scheme.{u})
    {E F : CochainComplex X.Modules ℤ} (e : E ≅ F) :
    IsStrictlyPerfect X E ↔ IsStrictlyPerfect X F := by
  sorry

/-- A genuine term bound excludes a complex with nonzero terms in arbitrarily negative degrees. -/
example (X : AlgebraicGeometry.Scheme.{u}) (E : CochainComplex X.Modules ℤ)
    (h : ∀ a : ℤ, ∃ i : ℤ, i < a ∧ ¬ IsZero (E.X i)) :
    ¬ IsStrictlyPerfect X E := by
  sorry

/-- Finite locally free terms do not replace the finite term bound. -/
example (X : AlgebraicGeometry.Scheme.{u}) (E : CochainComplex X.Modules ℤ)
    (h : IsStrictlyPerfect X E) :
    ∃ a b : ℤ, a ≤ b ∧ ∀ i : ℤ, i < a ∨ b < i → IsZero (E.X i) := by
  exact h.1

/-- This example includes nontrivial line bundles; no global free-summand hypothesis appears. -/
example (X : AlgebraicGeometry.Scheme.{u}) (L : X.Modules)
    [L.IsLocallyFree] [L.IsFiniteType] :
    IsStrictlyPerfect X ((HomologicalComplex.single X.Modules (ComplexShape.up ℤ) (0 : ℤ)).obj L) := by
  sorry

/-! ## Layer 2: Scheme K-theory and functoriality -/

section ExistingGrothendieckGroup

variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C]
  [HasShift C ℤ] [∀ n : ℤ, (shiftFunctor C n).Additive]
  [Pretriangulated C] [EssentiallySmall.{w} C]

/-- The cone of `A ⟶ B` has Euler class `[B] - [A]`, using the existing carrier. -/
example {T : Triangle C} (hT : T ∈ distTriang C) :
    (TauCeti.TriangulatedK0.of T.obj₃ : TauCeti.TriangulatedK0 C) =
      TauCeti.TriangulatedK0.of T.obj₂ - TauCeti.TriangulatedK0.of T.obj₁ := by
  exact TauCeti.TriangulatedK0.of_eq_sub_of_distTriang hT

/-- A two-term map to zero fixes the negative sign of the cohomological shift. -/
example (A : C) :
    (TauCeti.TriangulatedK0.of (A⟦(1 : ℤ)⟧) : TauCeti.TriangulatedK0 C) =
      -TauCeti.TriangulatedK0.of A := by
  exact TauCeti.TriangulatedK0.of_shift_one A

end ExistingGrothendieckGroup

/-- The affine degree-zero comparison must use this existing Cartan homomorphism. -/
example (R : Type u) [Ring R] [IsSemisimpleRing R] :
    Function.Bijective (TauCeti.cartanMap R) := by
  exact TauCeti.cartanMap_bijective_of_isSemisimpleRing R

/-! ## Layer 3: Localisation, residues and Witt supports -/

/-- In the multiplicative divisor-value convention, a valuation product is a product of values.
Its additive conversion is the sum of orders used by the degree-one boundary. -/
example (R : Type u) [CommRing R] [IsDomain R] [IsNoetherianRing R] [Ring.KrullDimLE 1 R]
    (K : Type v) [Field K] [Algebra R K] [IsFractionRing R K] (x y : K) :
    Ring.ordFrac R (x * y) = Ring.ordFrac R x * Ring.ordFrac R y := by
  exact map_mul (Ring.ordFrac R) x y

/-! ## Layer 4: Descent and coniveau -/

/-- The support cofiber may add one cohomological degree even when the open has dimension zero. -/
example : max (0 : ℕ) (0 + 1) = 1 := by decide

/-! ## Layer 5: Projective bundles, Bass theory and blowups -/

/-- In the ordered basis `([O], [O(-1)])`, rank is the sum and Euler characteristic the first
coordinate. For a line bundle `O(m)`, these coordinates are `(m+1,-m)`. -/
example (m : ℤ) : (m + 1) + (-m) = 1 := by ring

/-- The negative tautological line has Euler characteristic zero and rank one. -/
example : ((-1 : ℤ) + 1, -(-1 : ℤ)) = (0, 1) := by norm_num

/-- The Cartier-divisor self-intersection factor for a trivial conormal line is zero. -/
example {R : Type u} [Ring R] (x : R) : (1 - 1) * x = 0 := by simp

/-! ## Layer 6: Products, lambda operations and Adams weights -/

/-- A square-zero extension product includes the scalar action on both sides. This computation
uses the actual square-zero extension ring, rather than the degree-adding higher K-product. -/
example {R : Type u} [CommRing R] (a b x y : R) :
    (TrivSqZeroExt.inl a + TrivSqZeroExt.inr x : TrivSqZeroExt R R) *
        (TrivSqZeroExt.inl b + TrivSqZeroExt.inr y) =
      TrivSqZeroExt.inl (a * b) + TrivSqZeroExt.inr (a * y + b * x) := by
  sorry

/-- In positive degree the second lambda operation has negative sign on a unit loop, whereas
the second Adams operation doubles it; the signs live in the abelian group. -/
example (G : Type u) [AddCommGroup G] (x : G) : (-2 : ℤ) • (-x) = (2 : ℤ) • x := by
  simp

/-- The conormal correction shifts a weight by its codimension, including codimension zero. -/
example {R : Type u} [CommMonoid R] (k : R) (i c : ℕ) :
    k ^ c * k ^ i = k ^ (i + c) := by
  rw [pow_add, mul_comm]

/-! ## Layer 7: Chern characters and Riemann–Roch -/

/-- The leading Chern-class coefficient is positive in codimension one. -/
example : (-1 : ℤ) ^ (1 - 1) * (Nat.factorial (1 - 1) : ℤ) = 1 := by norm_num

/-- In codimension two the same convention gives the negative cycle class. -/
example : (-1 : ℤ) ^ (2 - 1) * (Nat.factorial (2 - 1) : ℤ) = -1 := by norm_num

/-- On the projective line write `h² = 0`, `ch(O(n)) = 1 + n*h`, and
`Td(TP¹) = 1 + h`. The coefficient of `h` in their product is the Euler value `n+1`. -/
example (n : ℤ) :
    ((1 : TrivSqZeroExt ℚ ℚ) + TrivSqZeroExt.inr (n : ℚ)) *
        (1 + TrivSqZeroExt.inr (1 : ℚ)) =
      1 + TrivSqZeroExt.inr ((n : ℚ) + 1) := by
  ext <;> simp [add_comm]

/-- For a conormal line with class `1-h`, the second Bott class is `2-h`.
This fixes the conormal sign separately from the tangent Todd class. -/
example :
    (1 : TrivSqZeroExt ℚ ℚ) + (1 - TrivSqZeroExt.inr (1 : ℚ)) =
      2 - TrivSqZeroExt.inr (1 : ℚ) := by
  ring

/-- The inverse Bott correction for the projective line at index two is `(1+h)/2`.
Multiplying by `2-2h` gives one in the actual square-zero extension. -/
example :
    ((TrivSqZeroExt.inl (2 : ℚ) : TrivSqZeroExt ℚ ℚ) - TrivSqZeroExt.inr (2 : ℚ)) *
        (TrivSqZeroExt.inl (1 / 2 : ℚ) + TrivSqZeroExt.inr (1 / 2 : ℚ)) = 1 := by
  ext <;> norm_num

/-
The README definitions requiring new carriers are `IsPseudoCoherentAt`,
`HasTorAmplitude`, `PerfTorStratum`, `Scheme.K`, `Scheme.KB`,
`Scheme.G`, `PerfSupport`, `cohSupport`, `WittSupport.Perf`, `WittQuasiIsogeny`, `HasMayerVietoris`,
`kSheaf`, `codimFiltration`, `GerstenQuillen`, `PerfectScheme.vTopology`,
`MumfordRegular`, `laurentExtension`, `NK`, `NonUnitalLambdaAlgebra`,
`NonUnitalGammaFiltration`, `StableRepresentationRing`, `RepresentationRing`,
`simplicialSheafHypercohomology`, `IsKCoherent`, `bottClass`, and `schemeGammaFiltration`.

The README also specifies strict-model comparisons with the supplied perfect derived and enhanced categories,
resolution-property comparisons, scheme K/G spectra, supported and relative K-theory,
proper transfers, localisation, specialisation, Witt quasi-isogenies, the support tower,
Godement hypercohomology, Gersten complexes, projective and blowup equivalences, Bass comparison,
nonunital lambda-algebras, representation operations, K-coherence, Adams weights and their
finite-coefficient projectors, cannibalistic and twisted lambda operations, Chern characters,
homological Adams operations, Riemann–Roch and supported Chow comparisons. Their carriers and
construction theorems are targets there.
-/

end TauCetiRoadmap.SchemeKTheoryOperations
