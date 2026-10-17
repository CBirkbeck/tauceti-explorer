import Mathlib

/-!
# GL₂ Modularity Lifting: representative target signatures

The roadmap is README.md. This file records light definitions and representative theorem
signatures statable against the pinned APIs; it is not exhaustive. Arithmetic deformation
rings, automorphic representations, Hodge types and completed local Langlands objects are
specified in the README. Here matrices fix the determinant convention, `pStar` fixes the
quadratic-field sign, and concrete incidence sets fix Pan's seeded component reachability.
Spectrum maps are contravariant, and detection of an extension component means that its
minimal prime point actually belongs to the image of the spectrum map.
-/

namespace TauCetiRoadmap.GL2ModularityLifting

/-! ## Layer 1: Residual witnesses, minimal level and the Hecke map -/

/-! ## Layer 2: Auxiliary levels and arithmetic Taylor–Wiles systems -/

/-! ## Layer 3: Patching, finiteness and the generic comparison -/

/-! ## Layer 4: Ihara avoidance and support transfer -/

/-! ## Layer 5: Classical lifting at odd primes -/

/-! ## Layer 6: Dyadic patching and weight-two lifting -/

namespace Oddness

variable {R : Type*} [CommRing R]

/-- Oddness at a real involution is a characteristic-zero determinant condition.
Reduction modulo two does not detect it. -/
def matrixOdd (A : Matrix (Fin 2) (Fin 2) R) : Prop :=
  Matrix.det A = -1

/-- A scalar twist of square one preserves the determinant of a two-dimensional matrix. -/
theorem matrixOdd_scalar_twist (A : Matrix (Fin 2) (Fin 2) R) (u : R)
    (hu : u ^ 2 = 1) : matrixOdd (u • A) ↔ matrixOdd A := by
  sorry

/-- For a characteristic-zero field, an involution is odd exactly when its characteristic
polynomial has the two distinct roots 1 and -1. -/
theorem matrixOdd_involution_iff {E : Type*} [Field E] [CharZero E]
    (A : Matrix (Fin 2) (Fin 2) E) (hA : A * A = 1) :
    matrixOdd A ↔ Matrix.charpoly A = Polynomial.X ^ 2 - 1 := by
  sorry

example : matrixOdd (!![(1 : ℤ), 0; 0, -1]) := by
  sorry

example : ¬ matrixOdd (1 : Matrix (Fin 2) (Fin 2) ℤ) := by
  sorry

/-- The even and odd integral involutions have identical reductions modulo two. -/
example :
    (!![(1 : ℤ), 0; 0, -1]).map (Int.castRingHom (ZMod 2)) =
      (1 : Matrix (Fin 2) (Fin 2) (ZMod 2)) := by
  sorry

/-- Inverting Frobenius inverts both roots, including the constant coefficient. -/
example : Matrix.charpoly ((!![(2 : ℚ), 0; 0, 3])⁻¹) =
    Polynomial.X ^ 2 - Polynomial.C (5 / 6 : ℚ) * Polynomial.X +
      Polynomial.C (1 / 6 : ℚ) := by
  sorry

end Oddness

/-! ## Layer 7: Precise modern lifting propositions and normalisations -/

namespace StatementTable

/-- The signed prime used for the quadratic subfield of the p-th cyclotomic field.
The formula is total on natural numbers; the arithmetic interpretation requires odd primality. -/
def pStar (p : ℕ) : ℤ :=
  (-1 : ℤ) ^ ((p - 1) / 2) * (p : ℤ)

/-- The sign convention never changes the absolute value. -/
theorem pStar_natAbs (p : ℕ) : (pStar p).natAbs = p := by
  sorry

example : pStar 3 = -3 ∧ pStar 5 = 5 ∧ pStar 7 = -7 := by
  sorry

/-- Totality of the formula at two does not provide a quadratic subfield of Q(ζ₂). -/
example : pStar 2 = 2 := by
  sorry

end StatementTable

/-! ## Layer 8: Corrected multiplicities and odd-prime de Rham lifting -/

/-! ## Layer 9: Completed support and dyadic de Rham lifting -/

/-! ## Layer 10: Nice primes and residually reducible lifting -/

namespace Pan

variable {Point Component : Type*}

/-- Two component subsets are adjacent only through a point in the specified potentially
nice locus. Mere nonempty intersection is insufficient. -/
def panAdjacent (components : Component → Set Point) (nice : Set Point)
    (i j : Component) : Prop :=
  ∃ q, q ∈ nice ∧ q ∈ components i ∧ q ∈ components j

/-- A good component is reachable from a component containing a potentially nice seed point.
The reflexive case permits a one-component chain, while the existential seed remains required. -/
def panGoodComponent (components : Component → Set Point) (nice seeds : Set Point)
    (i : Component) : Prop :=
  ∃ j, (∃ q, q ∈ nice ∧ q ∈ seeds ∧ q ∈ components j) ∧
    Relation.ReflTransGen (panAdjacent components nice) j i

/-- Pan's length-one chain still has a potentially nice point in the ordinary closure. -/
theorem panGoodComponent_seed (components : Component → Set Point) (nice seeds : Set Point)
    (i : Component) (q : Point) (hn : q ∈ nice) (hs : q ∈ seeds)
    (hc : q ∈ components i) : panGoodComponent components nice seeds i := by
  sorry

/-- Adjoining one potentially nice intersection propagates goodness. -/
theorem panGoodComponent_step (components : Component → Set Point) (nice seeds : Set Point)
    (i j : Component) (hi : panGoodComponent components nice seeds i)
    (hij : panAdjacent components nice i j) : panGoodComponent components nice seeds j := by
  sorry

/-- Enlarging both permitted point loci preserves the seeded reachability predicate. -/
theorem panGoodComponent_mono (components : Component → Set Point)
    (nice nice' seeds seeds' : Set Point) (hn : nice ⊆ nice') (hs : seeds ⊆ seeds')
    (i : Component) (hi : panGoodComponent components nice seeds i) :
    panGoodComponent components nice' seeds' i := by
  sorry

example : panAdjacent (fun _ : Unit => ({0} : Set ℕ)) {0} () () := by
  sorry

example : ¬ panAdjacent (fun b : Bool => if b then ({0, 1} : Set ℕ) else {1, 2})
    {0} true false := by
  sorry

example : panGoodComponent (fun _ : Unit => ({0} : Set ℕ)) {0} {0} () := by
  sorry

example (components : Component → Set Point) (nice : Set Point) (i : Component) :
    ¬ panGoodComponent components nice ∅ i := by
  sorry

section ExtensionComponents

variable {A B C : Type*} [CommRing A] [CommRing B] [CommRing C]

/-- Minimal prime points of the source that occur in the image of the contravariant
spectrum map. The arithmetic instance uses the trace map into an extension deformation ring. -/
def panExtensionComponents (f : A →+* B) : Set (PrimeSpectrum A) :=
  {P | P.asIdeal ∈ minimalPrimes A ∧ P ∈ Set.range (PrimeSpectrum.comap f)}

/-- Detection requires an actual prime over the minimal prime in question. -/
theorem panExtensionComponents_mem_iff (f : A →+* B) (P : PrimeSpectrum A) :
    P ∈ panExtensionComponents f ↔
      P.asIdeal ∈ minimalPrimes A ∧ ∃ Q : PrimeSpectrum B, PrimeSpectrum.comap f Q = P := by
  sorry

/-- Every detected component contains the kernel of the trace map. -/
theorem panExtensionComponents_kernel_le (f : A →+* B) (P : PrimeSpectrum A)
    (hP : P ∈ panExtensionComponents f) : RingHom.ker f ≤ P.asIdeal := by
  sorry

/-- Passing through a further extension ring can only discard detected source components. -/
theorem panExtensionComponents_comp_subset (f : A →+* B) (g : B →+* C) :
    panExtensionComponents (g.comp f) ⊆ panExtensionComponents f := by
  sorry

example : panExtensionComponents (RingHom.id A) =
    {P : PrimeSpectrum A | P.asIdeal ∈ minimalPrimes A} := by
  sorry

example [Subsingleton B] (f : A →+* B) : panExtensionComponents f = ∅ := by
  sorry

end ExtensionComponents
end Pan

/-! ## Layer 11: The ordinary branch at three -/

/-! ## Layer 12: Directed congruence and polynomial-family transfer -/

/-!
The remaining definitions are specified in README.md: `ResidualModularAlpha`,
`ResidualModularBeta`, `MinimalLevelData`, `heckeAlgebra`, `heckeModule`, `defToHecke`,
`framedHecke`, `framedHeckeModule`, `defToHeckeFramed`, `auxLevel`, `auxDelta`, `auxHecke`,
`auxMaxIdeal`, `defToAuxHecke`, `twModule`, `PatchingDatum`, `avoidancePair`,
`StronglyResiduallyModular`, `bcdtHeckeModule`, `DyadicPatchingDatum`, `determinantOne`,
`dyadicPatchedRing`, `dyadicPatchedModule`, `dyadicTorusAction`, `OddPrimeLifting`,
`DyadicLifting`, `ResiduallyReducibleLifting`, `OrdinaryThreeLifting`, `patchedWeightFiltration`,
`LocalTypeLattice`, `GL2BlockData`, `checkV`, `ArithmeticGL2PatchedModule`,
`DyadicTypedCompletedModule`, `PanCompletedHeckeData`, `PanNicePrime`,
`PanPotentiallyNicePrime`, and the explicit indexed Frobenius-polynomial families.
Their arithmetic carriers require the corresponding roadmap constructions before theorem
signatures can be given here.
-/

end TauCetiRoadmap.GL2ModularityLifting
