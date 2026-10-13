import Mathlib.Algebra.Module.Lattice
import Mathlib.RingTheory.ClassGroup.Basic
import Mathlib.RingTheory.DedekindDomain.AdicValuation
import Mathlib.RingTheory.DedekindDomain.Different
import Mathlib.LinearAlgebra.Determinant
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.LinearAlgebra.QuadraticForm.IsometryEquiv
import Mathlib.LinearAlgebra.SesquilinearForm.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.CliffordAlgebra.Even
import Mathlib.Algebra.Quaternion
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.NumberTheory.LegendreSymbol.JacobiSymbol
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.Trace.Defs
import Mathlib.RingTheory.Norm.Defs
import TauCeti.Algebra.Quaternion.NormForm
import TauCeti.LinearAlgebra.QuadraticForm.OrthogonalGroup
import TauCeti.LinearAlgebra.QuadraticForm.Representation
import TauCeti.LinearAlgebra.CliffordAlgebra.Spin.SpinorNorm.Basic
import TauCeti.LinearAlgebra.IntegralLattice.Basic
import TauCeti.LinearAlgebra.IntegralLattice.Discriminant.Group
import TauCeti.LinearAlgebra.IntegralLattice.Discriminant.Cardinality
import TauCeti.LinearAlgebra.IntegralLattice.Even
import TauCeti.LinearAlgebra.IntegralLattice.Unimodular
import TauCeti.NumberTheory.Multiquadratic.Quadratic.GenusCharacter.Basic

/-!
# GN.2 follow-up: suggested statements

The reader document is the complete roadmap, including all hypotheses, API, tests,
source locators and four open proof gaps. This file only suggests end statements
that use carriers available at the pinned libraries. It develops no theory.
Heavy constructions (Steinitz classes, Arf invariants, integral quadratic lattices
over Dedekind rings, signed hermitian Witt groups, local genus characters, ring
GSpin and adelic class sets) remain reader targets.

Lattices use `Submodule.IsLattice`; completion takes the span over the valuation
ring, and quadratic polar forms are never divided by two. Existing IntegralLattices
binary normal forms and Tau Ceti's genus-field construction are imported targets,
not constructions repeated here. Proofs below are intentionally `sorry`.
-/

noncomputable section

set_option linter.overlappingInstances false
set_option linter.unusedSectionVars false

open Module Polynomial
open scoped Pointwise TensorProduct Quaternion

namespace TauCeti.GeometryOfNumbersPlan

section Index

variable {R F V : Type*} [CommRing R] [IsDomain R] [Field F] [Algebra R F]
  [AddCommGroup V] [Module F V] [Module R V] [IsScalarTower R F V]

/-- GN.2/lattice-index-ideal: `[M : N]_R`, the `R`-span of the determinants of the
`F`-linear maps carrying `M` into `N`. -/
def latticeIndex (M N : Submodule R V) : Submodule R F :=
  Submodule.span R {d | ∃ δ : V →ₗ[F] V, (∀ x ∈ M, δ x ∈ N) ∧ LinearMap.det δ = d}

theorem latticeIndex_ne_bot [FiniteDimensional F V] [IsFractionRing R F]
    (M N : Submodule R V) [M.IsLattice F] [N.IsLattice F] :
    latticeIndex (F := F) M N ≠ ⊥ := by sorry

theorem latticeIndex_map [FiniteDimensional F V] (M N : Submodule R V) (α : V ≃ₗ[F] V) :
    latticeIndex (F := F) (M.map (α.toLinearMap.restrictScalars R)) N =
      Submodule.span R {(LinearMap.det (α : V →ₗ[F] V))⁻¹} * latticeIndex (F := F) M N := by sorry

theorem latticeIndex_of_basis {ι : Type*} [Fintype ι] [DecidableEq ι]
    (M N : Submodule R V) (b : Basis ι R M) (c : Basis ι R N) (bF : Basis ι F V)
    (hb : ∀ i, bF i = (b i : V)) :
    latticeIndex (F := F) M N =
      Submodule.span R {bF.det (fun i => (c i : V))} := by sorry

theorem latticeIndex_eq_top_iff [IsDedekindDomain R] [IsFractionRing R F] [FiniteDimensional F V]
    (M N : Submodule R V) [M.IsLattice F] [N.IsLattice F] (hNM : N ≤ M) :
    latticeIndex (F := F) M N = 1 ↔ M = N := by sorry

theorem latticeIndex_trans [IsDedekindDomain R] [IsFractionRing R F] [FiniteDimensional F V]
    (M N P : Submodule R V) [M.IsLattice F] [N.IsLattice F] [P.IsLattice F] :
    latticeIndex (F := F) M P = latticeIndex (F := F) M N * latticeIndex (F := F) N P := by sorry

/-- Test `latticeIndex_self`: `[M : M]_R = R` for a full Dedekind lattice. -/
example [IsDedekindDomain R] [IsFractionRing R F] [FiniteDimensional F V]
    (M : Submodule R V) [M.IsLattice F] : latticeIndex (F := F) M M = 1 := by sorry

/-- Test `latticeIndex_smul`: `[M : rM]_R = r^n R`. -/
example [IsDedekindDomain R] [IsFractionRing R F] [FiniteDimensional F V]
    (M : Submodule R V) [M.IsLattice F] (r : R) (hr : r ≠ 0) :
    latticeIndex (F := F) M (r • M) =
      Submodule.span R {(algebraMap R F r) ^ finrank F V} := by sorry

end Index

/-- Test `latticeIndex_int_example`: `[ℤ² : ℤ ⊕ 2ℤ]_ℤ = 2ℤ`. -/
example : latticeIndex (R := ℤ) (F := ℚ) (V := Fin 2 → ℚ)
    (Submodule.span ℤ (Set.range (Pi.single · (1 : ℚ))))
    (Submodule.span ℤ {Pi.single 0 (1 : ℚ), Pi.single 1 (2 : ℚ)}) =
      Submodule.span ℤ {(2 : ℚ)} := by sorry

section Steinitz

variable {R F V : Type*} [CommRing R] [IsDomain R] [IsDedekindDomain R] [Field F] [Algebra R F]
  [IsFractionRing R F] [AddCommGroup V] [Module F V] [Module R V] [IsScalarTower R F V]
  [FiniteDimensional F V]

/-- GN.2/lattice-pseudobasis: every lattice is `𝔞₁x₁ ⊕ ⋯ ⊕ 𝔞ₙxₙ` with `xᵢ` an `F`-basis and
nonzero fractional ideals `𝔞ᵢ` (the coefficient ideals). -/
theorem _root_.Submodule.IsLattice.exists_pseudobasis (M : Submodule R V) [M.IsLattice F] :
    ∃ (x : Basis (Fin (finrank F V)) F V) (𝔞 : Fin (finrank F V) → Submodule R F),
      (∀ i, 𝔞 i ≠ ⊥) ∧ (∀ i, (𝔞 i).FG) ∧
      M = ⨆ i, (𝔞 i).map ((LinearMap.toSpanSingleton F V (x i)).restrictScalars R) := by sorry

end Steinitz

/-- Test `steinitzClass_int`: over `ℤ` every lattice is free (class group trivial). -/
example (V : Type*) [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]
    (M : Submodule ℤ V) [M.IsLattice ℚ] : Module.Free ℤ M := by sorry

section Completion

variable {K : Type*} [Field K] [NumberField K] {V : Type*} [AddCommGroup V] [Module K V]
  [Module (NumberField.RingOfIntegers K) V] [IsScalarTower (NumberField.RingOfIntegers K) K V]

open IsDedekindDomain NumberField

/-- GN.2/lattice-completion: the `𝒪_v`-span of the image of `L` in `K_v ⊗[K] V`. -/
def latticeCompletion (v : HeightOneSpectrum (𝓞 K)) (L : Submodule (𝓞 K) V) :
    Submodule (v.adicCompletionIntegers K) (v.adicCompletion K ⊗[K] V) :=
  Submodule.span (v.adicCompletionIntegers K) ((fun x : V => (1 : v.adicCompletion K) ⊗ₜ[K] x) '' L)

/-- GN.2/lattice-local-global-dictionary, injectivity: a lattice is determined by its
completions at all finite places. -/
theorem latticeCompletion_injective [FiniteDimensional K V] (L M : Submodule (𝓞 K) V) [L.IsLattice K] [M.IsLattice K]
    (h : ∀ v : HeightOneSpectrum (𝓞 K), latticeCompletion v L = latticeCompletion v M) :
    L = M := by sorry

/-- GN.2/lattice-local-global-dictionary, almost-everywhere agreement. -/
theorem latticeCompletion_eventually_eq [FiniteDimensional K V] (L M : Submodule (𝓞 K) V) [L.IsLattice K] [M.IsLattice K] :
    Set.Finite {v : HeightOneSpectrum (𝓞 K) | latticeCompletion v L ≠ latticeCompletion v M} := by
  sorry

end Completion


/-! ## Orders: light predicates on the existing subalgebra carrier -/

/-- The underlying submodule of an order is a full lattice. -/
def IsAlgebraOrder {R F B : Type*} [CommRing R] [Field F] [Algebra R F]
    [Ring B] [Algebra F B] [Algebra R B] [IsScalarTower R F B]
    (O : Subalgebra R B) : Prop := O.toSubmodule.IsLattice F

/-- Maximality among full orders, rather than among arbitrary subalgebras. -/
def IsMaximalAlgebraOrder {R F B : Type*} [CommRing R] [Field F] [Algebra R F]
    [Ring B] [Algebra F B] [Algebra R B] [IsScalarTower R F B]
    (O : Subalgebra R B) : Prop :=
  ∀ O' : Subalgebra R B, IsAlgebraOrder (F := F) O' → O ≤ O' → O' = O

section Quaternion

variable {F : Type*} [Field F]

/-- The reduced trace `x + x̄` of a quaternion. -/
def quatTrd {c₁ c₂ c₃ : F} (x : ℍ[F,c₁,c₂,c₃]) : F := (x + star x).re

/-- The alternating trilinear form `m(α₁,α₂,α₃) = trd((α₁α₂ − α₂α₁)α₃)`. -/
def quatTriple {c₁ c₂ c₃ : F} (x y z : ℍ[F,c₁,c₂,c₃]) : F := quatTrd ((x * y - y * x) * z)

variable {R : Type*} [CommRing R] [Algebra R F] {a b : F}

/-- GN.2/quaternion-order-discriminant: `disc(O)`, spanned by `det(trd(αᵢαⱼ))`. -/
def QuaternionOrder.disc (O : Subalgebra R ℍ[F,a,b]) : Submodule R F :=
  Submodule.span R {d | ∃ α : Fin 4 → ℍ[F,a,b], (∀ i, α i ∈ O) ∧
    Matrix.det (Matrix.of fun i j => quatTrd (α i * α j)) = d}

/-- GN.2/quaternion-order-discriminant: `discrd(O)`, spanned by `m(α₁,α₂,α₃)`. -/
def QuaternionOrder.discrd (O : Subalgebra R ℍ[F,a,b]) : Submodule R F :=
  Submodule.span R {d | ∃ x y z : ℍ[F,a,b], x ∈ O ∧ y ∈ O ∧
    z ∈ O ∧ quatTriple x y z = d}

theorem QuaternionOrder.disc_eq_discrd_sq [IsDomain R] [IsDedekindDomain R] [IsFractionRing R F]
    (O : Subalgebra R ℍ[F,a,b]) (hO : IsAlgebraOrder (F := F) O)
    [Invertible (2 : F)] (ha : a ≠ 0) (hb : b ≠ 0) :
    QuaternionOrder.disc O = QuaternionOrder.discrd O ^ 2 := by sorry

theorem QuaternionOrder.eq_of_le_of_disc_eq [IsDomain R] [IsDedekindDomain R] [IsFractionRing R F]
    (O O' : Subalgebra R ℍ[F,a,b]) (h : O ≤ O')
    (hO : IsAlgebraOrder (F := F) O) (hO' : IsAlgebraOrder (F := F) O')
    [Invertible (2 : F)] (ha : a ≠ 0) (hb : b ≠ 0)
    (hd : QuaternionOrder.disc O = QuaternionOrder.disc O') :
    O = O' := by sorry

/-- GN.2/maximal-quaternion-order-criterion (local split case): over a DVR, an order of
`M₂`-type is maximal iff its discriminant is the unit ideal. -/
theorem QuaternionOrder.isMaximal_iff_disc_eq_top [IsDomain R] [IsDiscreteValuationRing R]
    [IsFractionRing R F] (hsplit : ∃ x : ℍ[F,a,b], x ≠ 0 ∧ QuaternionAlgebra.normForm a 0 b x = 0)
    (O : Subalgebra R ℍ[F,a,b]) (hO : IsAlgebraOrder (F := F) O)
    [Invertible (2 : F)] (ha : a ≠ 0) (hb : b ≠ 0) :
    IsMaximalAlgebraOrder (F := F) O ↔ QuaternionOrder.disc O = 1 := by sorry

end Quaternion

/-- GN.2/hasse-schilling-norm-theorem: the reduced norms of units of `(a, b | F)` are the
nonzero elements positive at the real places where both `a` and `b` are negative. -/
theorem QuaternionAlgebra.range_nrd_eq {F : Type*} [Field F] [NumberField F] (a b : F)
    (ha : a ≠ 0) (hb : b ≠ 0) (c : F) :
    c ∈ Set.range (fun x : (ℍ[F,a,b])ˣ => QuaternionAlgebra.normForm a 0 b (x : ℍ[F,a,b])) ↔
      c ≠ 0 ∧ ∀ σ : F →+* ℝ, σ a < 0 → σ b < 0 → 0 < σ c := by sorry

/-- Check: `3 = nrd(1 + i + j)` in Hamilton's quaternions over `ℚ`. -/
example : QuaternionAlgebra.normForm (-1 : ℚ) 0 (-1)
    (⟨1, 1, 1, 0⟩ : ℍ[ℚ,-1,-1]) = 3 := by sorry

section FiniteField

variable {K : Type*} [Field K] [Fintype K]

/-- GN.2/finite-field-quadratic-classification (a): every form in three variables over a
finite field is isotropic. -/
theorem QuadraticForm.finiteField_isotropic (Q : QuadraticForm K (Fin 3 → K)) :
    ∃ v ≠ 0, Q v = 0 := by sorry

/-- GN.2/finite-field-quadratic-classification (a): nondegenerate forms of dimension at least
two represent every nonzero element (odd characteristic). -/
theorem QuadraticForm.finiteField_represents {n : ℕ} (hn : 2 ≤ n) (hK : ringChar K ≠ 2)
    (Q : QuadraticForm K (Fin n → K)) (hQ : (QuadraticMap.polarBilin Q).Nondegenerate)
    (c : K) (hc : c ≠ 0) : QuadraticMap.Represents Q c := by sorry

/-- GN.2/finite-field-quadratic-classification (b): diagonal forms over a finite field of odd
characteristic are classified by their discriminant. -/
theorem QuadraticForm.finiteField_classification {n : ℕ} (hK : ringChar K ≠ 2)
    (u v : Fin n → Kˣ) :
    (QuadraticMap.weightedSumSquares K (fun i => (u i : K))).Equivalent
        (QuadraticMap.weightedSumSquares K (fun i => (v i : K))) ↔
      IsSquare ((∏ i, (u i : K)) * ∏ i, (v i : K)) := by sorry

end FiniteField

/-! ## Unit representation over a general henselian DVR

The ℤ_p specialization is already a current IntegralLattices target. This is
its remaining extension to a general henselian DVR with finite odd residue field.
-/

theorem unimodular_represents_unit {R : Type*} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] [HenselianLocalRing R]
    [Fintype (IsLocalRing.ResidueField R)]
    (hR : ringChar (IsLocalRing.ResidueField R) ≠ 2) {n : ℕ} (hn : 2 ≤ n)
    (Q : QuadraticForm R (Fin n → R))
    (hQ : IsUnit (LinearMap.BilinForm.toMatrix (Pi.basisFun R (Fin n))
      (QuadraticMap.polarBilin Q)).det)
    (t : R) (ht : IsUnit t) :
    ∃ v : Fin n → R, (∃ i, IsUnit (v i)) ∧ Q v = t := by sorry

section Isometry

variable {k : Type*} [Field k] {V : Type*} [AddCommGroup V] [Module k V] [FiniteDimensional k V]

/-- GN.2/isometry-eigenspace-decomposition (c), the Cayley discriminant: an isometry without
eigenvalues `±1` forces even dimension and `det b ≡ g(1)g(−1)` modulo squares. -/
theorem discr_eq_charpoly_one_mul_neg_one (hk : ringChar k ≠ 2) {ι : Type*} [Fintype ι]
    [DecidableEq ι] (bV : Basis ι k V) (B : LinearMap.BilinForm k V) (hB : B.IsSymm)
    (hBn : B.Nondegenerate) (φ : V ≃ₗ[k] V) (hφ : ∀ x y, B (φ x) (φ y) = B x y)
    (h1 : (LinearMap.charpoly (φ : V →ₗ[k] V)).eval 1 ≠ 0)
    (h2 : (LinearMap.charpoly (φ : V →ₗ[k] V)).eval (-1) ≠ 0) :
    Even (finrank k V) ∧ IsSquare ((LinearMap.BilinForm.toMatrix bV B).det *
      ((LinearMap.charpoly (φ : V →ₗ[k] V)).eval 1 *
        (LinearMap.charpoly (φ : V →ₗ[k] V)).eval (-1))) := by sorry

/-- GN.2/zassenhaus-spinor-norm, the case without eigenvalues `±1`: `θ(γ) = [g(−1)]`. -/
theorem spinorNorm_eq_zassenhaus [Invertible (2 : k)] (Q : QuadraticForm k V) (hQ : Q.Nondegenerate)
    (γ : TauCeti.QuadraticMap.specialOrthogonalGroup Q)
    (h1 : (LinearMap.charpoly ((γ : V ≃ₗ[k] V) : V →ₗ[k] V)).eval 1 ≠ 0)
    (h2 : (LinearMap.charpoly ((γ : V ≃ₗ[k] V) : V →ₗ[k] V)).eval (-1) ≠ 0) :
    CliffordAlgebra.spinorNorm Q hQ γ =
      TauCeti.squareClassHom (Units.mk0 _ h2) := by sorry

end Isometry

/-- GN.2/model-ring-positive-involution: the ring `∏ᵢ M_{nᵢ}(𝒪_{Lᵢ})`. -/
abbrev ModelRing {k : ℕ} (L : Fin k → Type*) [∀ i, Field (L i)] [∀ i, NumberField (L i)]
    (n : Fin k → ℕ) : Type _ :=
  ∀ i, Matrix (Fin (n i)) (Fin (n i)) (NumberField.RingOfIntegers (L i))

/-! ## §2.16 Stable lattices: monogenic orders -/

/-- GN.2/local-monogenic-order: `R = ℤ_ℓ[x]/(f)`. -/
abbrev MonogenicOrder (ℓ : ℕ) [Fact ℓ.Prime] (f : ℤ_[ℓ][X]) : Type _ := AdjoinRoot f

/-- GN.2/zarhin-explicit-plane: the Gram matrix of `v = (0,1,1)`, `w = (k,1,0)` in `Λ_{2d}`. -/
example (d k : ℤ) :
    let G : Matrix (Fin 3) (Fin 3) ℤ := !![2 * d, 0, 0; 0, 0, 1; 0, 1, 0]
    let v : Fin 3 → ℤ := ![0, 1, 1]
    let w : Fin 3 → ℤ := ![k, 1, 0]
    (v ⬝ᵥ G.mulVec v, v ⬝ᵥ G.mulVec w, w ⬝ᵥ G.mulVec w) = (2, 1, 2 * d * k ^ 2) := by sorry

/-- GN.2/prime-power-square-lift (a): squares modulo an odd prime lift to every prime power. -/
theorem isSquare_mod_pow_of_isSquare_mod (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (a : ℤ)
    (ha : ¬ (p : ℤ) ∣ a) (hsq : IsSquare (a : ZMod p)) (m : ℕ) :
    IsSquare (a : ZMod (p ^ m)) := by sorry

/-- GN.2/prime-power-square-lift (c): finitely many nonzero integers are simultaneously nonzero
squares modulo infinitely many primes. -/
theorem infinite_primes_forall_isSquare (xs : Finset ℤ) (h0 : (0 : ℤ) ∉ xs) :
    {ℓ : ℕ | ℓ.Prime ∧ ∀ x ∈ xs, IsSquare (x : ZMod ℓ) ∧ (x : ZMod ℓ) ≠ 0}.Infinite := by sorry

section TraceLattice

variable {F : Type*} [Field F] [NumberField F] {V : Type*} [AddCommGroup V] [Module F V]
  [Module (NumberField.RingOfIntegers F) V] [IsScalarTower (NumberField.RingOfIntegers F) F V]

/-- GN.2/trace-unimodular-lattice: `Q(L) ⊆ 𝔡⁻¹`, written through traces. -/
def TraceLattice.IsEven (Q : QuadraticForm F V) (L : Submodule (NumberField.RingOfIntegers F) V) :
    Prop :=
  ∀ x ∈ L, ∀ a : NumberField.RingOfIntegers F, ∃ z : ℤ, Algebra.trace ℚ F ((a : F) * Q x) = z

/-- Self-duality for the trace pairing, expressed without constructing a new submodule. -/
def TraceLattice.IsZUnimodular (Q : QuadraticForm F V)
    (L : Submodule (NumberField.RingOfIntegers F) V) : Prop :=
  ∀ y : V, (∀ x ∈ L, ∀ a : NumberField.RingOfIntegers F,
    ∃ z : ℤ, Algebra.trace ℚ F ((a : F) * QuadraticMap.polar Q y x) = z) ↔ y ∈ L

end TraceLattice

/-- GN.2/trace-unimodular-existence: for every sign pattern at the real places there is a
definite even `ℤ`-unimodular `𝒪_F`-lattice of rank `8`. -/
theorem TraceLattice.exists_zunimodular_definite {F : Type*} [Field F] [NumberField F]
    (sgn : (F →+* ℝ) → Bool) :
    ∃ (Q : QuadraticForm F (Fin 8 → F))
      (L : Submodule (NumberField.RingOfIntegers F) (Fin 8 → F)),
      L.IsLattice F ∧ TraceLattice.IsEven Q L ∧ TraceLattice.IsZUnimodular Q L ∧
      ∀ σ : F →+* ℝ, ∀ v : Fin 8 → F, v ≠ 0 →
        (if sgn σ then 0 < σ (Q v) else σ (Q v) < 0) := by sorry

/-- GN.2/ternary-unit-half-discriminant-classification: an integral ternary form whose polar
Gram determinant is `−2` (half-discriminant `4 det A = −1`) is equivalent to `y² − xz`. -/
theorem ternary_halfDisc_unit_equiv_split (Q : QuadraticForm ℤ (Fin 3 → ℤ))
    (hQ : (LinearMap.BilinForm.toMatrix (Pi.basisFun ℤ (Fin 3)) (QuadraticMap.polarBilin Q)).det
      = -2) :
    Q.Equivalent ((QuadraticMap.proj (R := ℤ) (n := Fin 3) 1 1) -
      (QuadraticMap.proj (R := ℤ) (n := Fin 3) 0 2)) := by sorry



/-- The other sign: polar determinant `2` gives `xz − y²`. -/
theorem ternary_halfDisc_unit_equiv_split_neg (Q : QuadraticForm ℤ (Fin 3 → ℤ))
    (hQ : (LinearMap.BilinForm.toMatrix (Pi.basisFun ℤ (Fin 3))
      (QuadraticMap.polarBilin Q)).det = 2) :
    Q.Equivalent ((QuadraticMap.proj (R := ℤ) (n := Fin 3) 0 2) -
      (QuadraticMap.proj (R := ℤ) (n := Fin 3) 1 1)) := by sorry

/-- The integer index formula requires both submodules to be full lattices. -/
theorem latticeIndex_int (M N : Submodule ℤ (Fin 2 → ℚ))
    [M.IsLattice ℚ] [N.IsLattice ℚ] (hNM : N ≤ M) :
    latticeIndex (F := ℚ) M N =
      Submodule.span ℤ {((N.toAddSubgroup.relIndex M.toAddSubgroup : ℕ) : ℚ)} := by sorry

/-- GN.2/exponent-two-genus-theory: using the existing candidate genus field and degree theorem, an imaginary quadratic class group of exponent at most two
has order `2^{s−1}`, `s` the number of prime discriminants of the field. -/
theorem exponentTwo_genusTheory {K : Type*} [Field K] [NumberField K]
    {θ : NumberField.RingOfIntegers K} {d : ℤ} {s : Finset ℤ}
    (hs : ∀ P ∈ s, TauCeti.Multiquadratic.IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s, TauCeti.Multiquadratic.IsEvenPrimeDiscriminant P →
      TauCeti.Multiquadratic.IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = TauCeti.Multiquadratic.fundamentalDiscriminant d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d) (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
    (hsf : Squarefree d) (hd : d < 0)
    (hexp : ∀ c : ClassGroup (NumberField.RingOfIntegers K), c ^ 2 = 1) :
    Nat.card (ClassGroup (NumberField.RingOfIntegers K)) = 2 ^ (s.card - 1) := by sorry

end TauCeti.GeometryOfNumbersPlan
