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
# Geometry of numbers, Layer GN.2 follow-up: suggested Lean forms

This file is not the roadmap and is not exhaustive: the roadmap document
`research/blueprint/readmes/GeometryOfNumbersAndQuadraticArithmetic--GN.2.md` is definitive.
The statements below suggest Lean forms so that contributors and reviewers converge on names
and signatures. Every proof is `sorry`.

Conventions. Lattices over a domain `R` with fraction field `F` are Mathlib's
`Submodule.IsLattice F`; no basis is stored. Quadratic maps are primary and their polar form
`q (x + y) - q x - q y` is never divided by two. Sesquilinear forms are conjugate-linear in the
first variable (Mathlib's `M →ₗ⋆[R] M →ₗ[R] R`). Names follow the packet's API items; items
whose carriers are not available at the pins are listed at the end of the file.
-/

noncomputable section

set_option linter.overlappingInstances false
set_option linter.unusedSectionVars false

open Module Polynomial
open scoped Pointwise TensorProduct Quaternion

namespace TauCeti.GeometryOfNumbersPlan

/-! ## §2.10 Lattices over a Dedekind domain -/

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

theorem latticeIndex_ne_bot_self [FiniteDimensional F V] (M : Submodule R V) :
    (1 : F) ∈ latticeIndex (F := F) M M :=
  Submodule.subset_span ⟨LinearMap.id, fun _ hx => hx, LinearMap.det_id⟩

/-- Test `latticeIndex_self`: `[M : M]_R` contains `1`, and it equals `R`. -/
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

/-- GN.2/lattice-steinitz-class: the class of the product of the coefficient ideals of any
pseudobasis. -/
def _root_.Submodule.IsLattice.steinitzClass (M : Submodule R V) [M.IsLattice F] : ClassGroup R :=
  sorry

theorem _root_.Submodule.IsLattice.free_iff_steinitzClass_eq_one (M : Submodule R V)
    [M.IsLattice F] (hV : 0 < finrank F V) :
    Module.Free R M ↔ Submodule.IsLattice.steinitzClass (F := F) M = 1 := by sorry

theorem _root_.Submodule.IsLattice.steinitzClass_eq_of_linearEquiv {W : Type*} [AddCommGroup W]
    [Module F W] [Module R W] [IsScalarTower R F W] [FiniteDimensional F W]
    (M : Submodule R V) (N : Submodule R W) [M.IsLattice F] [N.IsLattice F] (e : M ≃ₗ[R] N) :
    Submodule.IsLattice.steinitzClass (F := F) M = Submodule.IsLattice.steinitzClass (F := F) N := by
  sorry

theorem _root_.Submodule.IsLattice.steinitzClass_smul (M : Submodule R V) [M.IsLattice F]
    (c : F) (hc : c ≠ 0) [(M.map ((c • LinearMap.id : V →ₗ[F] V).restrictScalars R)).IsLattice F] :
    Submodule.IsLattice.steinitzClass (F := F) (M.map ((c • LinearMap.id : V →ₗ[F] V).restrictScalars R)) =
      Submodule.IsLattice.steinitzClass (F := F) M := by sorry

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
    Submodule (v.adicCompletion K) (v.adicCompletion K ⊗[K] V) :=
  Submodule.span (v.adicCompletion K) ((fun x : V => (1 : v.adicCompletion K) ⊗ₜ[K] x) '' L)

theorem latticeCompletion_mono (v : HeightOneSpectrum (𝓞 K)) {L M : Submodule (𝓞 K) V}
    (h : L ≤ M) : latticeCompletion v L ≤ latticeCompletion v M :=
  Submodule.span_mono (Set.image_mono h)

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


/-! ## §2.11 Quaternion orders and reduced norms -/

/-- GN.2/quaternion-order: an `R`-order in a finite-dimensional `F`-algebra `B`, an
`R`-subalgebra whose underlying submodule is a full lattice. -/
structure AlgebraOrder (R F B : Type*) [CommRing R] [Field F] [Algebra R F] [Ring B]
    [Algebra F B] [Algebra R B] [IsScalarTower R F B] where
  /-- The underlying subalgebra. -/
  toSubalgebra : Subalgebra R B
  /-- The underlying submodule is a full lattice. -/
  isLattice : (Subalgebra.toSubmodule toSubalgebra).IsLattice F

namespace AlgebraOrder

variable {R F B : Type*} [CommRing R] [Field F] [Algebra R F] [Ring B] [Algebra F B]
  [Algebra R B] [IsScalarTower R F B]

/-- Maximality among `R`-orders. -/
def IsMaximal (O : AlgebraOrder R F B) : Prop :=
  ∀ O' : AlgebraOrder R F B, O.toSubalgebra ≤ O'.toSubalgebra → O'.toSubalgebra = O.toSubalgebra

theorem isIntegral [IsDomain R] (O : AlgebraOrder R F B) {x : B} (hx : x ∈ O.toSubalgebra) :
    IsIntegral R x := by sorry

end AlgebraOrder

section Quaternion

variable {F : Type*} [Field F]

/-- The reduced trace `x + x̄` of a quaternion. -/
def quatTrd {c₁ c₂ c₃ : F} (x : ℍ[F,c₁,c₂,c₃]) : F := (x + star x).re

/-- The alternating trilinear form `m(α₁,α₂,α₃) = trd((α₁α₂ − α₂α₁)α₃)`. -/
def quatTriple {c₁ c₂ c₃ : F} (x y z : ℍ[F,c₁,c₂,c₃]) : F := quatTrd ((x * y - y * x) * z)

variable {R : Type*} [CommRing R] [Algebra R F] {a b : F}

/-- GN.2/quaternion-order-discriminant: `disc(O)`, spanned by `det(trd(αᵢαⱼ))`. -/
def QuaternionOrder.disc (O : AlgebraOrder R F ℍ[F,a,b]) : Submodule R F :=
  Submodule.span R {d | ∃ α : Fin 4 → ℍ[F,a,b], (∀ i, α i ∈ O.toSubalgebra) ∧
    Matrix.det (Matrix.of fun i j => quatTrd (α i * α j)) = d}

/-- GN.2/quaternion-order-discriminant: `discrd(O)`, spanned by `m(α₁,α₂,α₃)`. -/
def QuaternionOrder.discrd (O : AlgebraOrder R F ℍ[F,a,b]) : Submodule R F :=
  Submodule.span R {d | ∃ x y z : ℍ[F,a,b], x ∈ O.toSubalgebra ∧ y ∈ O.toSubalgebra ∧
    z ∈ O.toSubalgebra ∧ quatTriple x y z = d}

theorem QuaternionOrder.disc_eq_discrd_sq [IsDomain R] [IsDedekindDomain R] [IsFractionRing R F]
    (O : AlgebraOrder R F ℍ[F,a,b]) :
    QuaternionOrder.disc O = QuaternionOrder.discrd O ^ 2 := by sorry

theorem QuaternionOrder.eq_of_le_of_disc_eq [IsDomain R] [IsDedekindDomain R] [IsFractionRing R F]
    (O O' : AlgebraOrder R F ℍ[F,a,b]) (h : O.toSubalgebra ≤ O'.toSubalgebra)
    (hd : QuaternionOrder.disc O = QuaternionOrder.disc O') :
    O.toSubalgebra = O'.toSubalgebra := by sorry

/-- GN.2/maximal-quaternion-order-criterion (local split case): over a DVR, an order of
`M₂`-type is maximal iff its discriminant is the unit ideal. -/
theorem QuaternionOrder.isMaximal_iff_disc_eq_top [IsDomain R] [IsDiscreteValuationRing R]
    [IsFractionRing R F] (hsplit : ∃ x : ℍ[F,a,b], x ≠ 0 ∧ QuaternionAlgebra.normForm a 0 b x = 0)
    (O : AlgebraOrder R F ℍ[F,a,b]) :
    O.IsMaximal ↔ QuaternionOrder.disc O = 1 := by sorry

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

/-! ## §2.12 Quadratic forms over finite fields -/

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

section Arf

variable (K : Type*) [Field K] [CharP K 2]

/-- The Artin–Schreier map `x ↦ x² + x`, additive in characteristic 2. -/
def artinSchreier : K →+ K := (frobenius K 2).toAddMonoidHom + AddMonoidHom.id K

/-- The target `K/℘(K)` of the Arf invariant. -/
abbrev ArfGroup : Type _ := K ⧸ (artinSchreier K).range

variable {K} {V : Type*} [AddCommGroup V] [Module K V] [FiniteDimensional K V]

/-- GN.2/arf-invariant: `Σ q(eᵢ)q(fᵢ)` modulo `℘(K)` for a symplectic basis of the polar form
of a nonsingular even-dimensional form. -/
def QuadraticForm.arf (Q : QuadraticForm K V) : ArfGroup K := sorry

theorem QuadraticForm.arf_eq_of_symplecticBasis (Q : QuadraticForm K V) {m : ℕ}
    (e f : Fin m → V) (he : ∀ i j, QuadraticMap.polarBilin Q (e i) (f j) = if i = j then 1 else 0)
    (hee : ∀ i j, QuadraticMap.polarBilin Q (e i) (e j) = 0)
    (hff : ∀ i j, QuadraticMap.polarBilin Q (f i) (f j) = 0)
    (hspan : Submodule.span K (Set.range e ∪ Set.range f) = ⊤) :
    QuadraticForm.arf Q = QuotientAddGroup.mk (∑ i, Q (e i) * Q (f i)) := by sorry

theorem QuadraticForm.arf_isometry {W : Type*} [AddCommGroup W] [Module K W]
    [FiniteDimensional K W] (Q : QuadraticForm K V) (Q' : QuadraticForm K W)
    (h : Q.Equivalent Q') : QuadraticForm.arf Q = QuadraticForm.arf Q' := by sorry

end Arf

/-- Test `arf_F2_anisotropic`: over `𝔽₂`, `x² + xy + y²` has nonzero Arf invariant. -/
example : QuadraticForm.arf (K := ZMod 2)
    ((QuadraticMap.proj (R := ZMod 2) (n := Fin 2) 0 0) +
      (QuadraticMap.proj (R := ZMod 2) (n := Fin 2) 0 1) +
      (QuadraticMap.proj (R := ZMod 2) (n := Fin 2) 1 1)) ≠ 0 := by sorry

/-! ## §2.13 Binary forms: genus characters -/

/-- An integral binary quadratic form `ax² + bxy + cy²`. -/
structure BinaryForm where
  /-- Coefficient of `x²`. -/
  a : ℤ
  /-- Coefficient of `xy`. -/
  b : ℤ
  /-- Coefficient of `y²`. -/
  c : ℤ

namespace BinaryForm

/-- Evaluation. -/
def eval (Q : BinaryForm) (x y : ℤ) : ℤ := Q.a * x ^ 2 + Q.b * x * y + Q.c * y ^ 2

/-- The discriminant `b² − 4ac`. -/
def disc (Q : BinaryForm) : ℤ := Q.b ^ 2 - 4 * Q.a * Q.c

/-- The negative form. -/
def neg (Q : BinaryForm) : BinaryForm := ⟨-Q.a, -Q.b, -Q.c⟩

/-- Substitution by an integer matrix: `(Q ∘ g)(x, y) = Q(g₀₀x + g₀₁y, g₁₀x + g₁₁y)`. -/
def comp (Q : BinaryForm) (g : Matrix (Fin 2) (Fin 2) ℤ) : BinaryForm :=
  ⟨Q.eval (g 0 0) (g 1 0),
    2 * Q.a * g 0 0 * g 0 1 + Q.b * (g 0 0 * g 1 1 + g 0 1 * g 1 0) + 2 * Q.c * g 1 0 * g 1 1,
    Q.eval (g 0 1) (g 1 1)⟩

open Classical in
/-- GN.2/binary-form-genus-character: `χ_d(Q) = (d/m)` for any value `m` of `Q` coprime to
`d = ∏ s`, and `0` if no such value exists (exactly when `gcd(a, b, c, d) > 1`). -/
def genusChar (s : Finset ℤ) (Q : BinaryForm) : ℤ :=
  if h : ∃ m : ℤ, (∃ x y, Q.eval x y = m) ∧ IsCoprime m (∏ P ∈ s, P) then
    TauCeti.Multiquadratic.genusCharFun s h.choose
  else 0

theorem genusChar_of_represents {s : Finset ℤ}
    (hs : ∀ P ∈ s, TauCeti.Multiquadratic.IsPrimeDiscriminant P) (Q : BinaryForm)
    (hD : (∏ P ∈ s, P) ∣ Q.disc) {m x y : ℤ} (hm : Q.eval x y = m)
    (hcop : IsCoprime m (∏ P ∈ s, P)) :
    genusChar s Q = TauCeti.Multiquadratic.genusCharFun s m := by sorry

theorem genusChar_eq_zero_iff {s : Finset ℤ}
    (hs : ∀ P ∈ s, TauCeti.Multiquadratic.IsPrimeDiscriminant P) (Q : BinaryForm) :
    genusChar s Q = 0 ↔ ¬ IsCoprime (Int.gcd (Int.gcd Q.a Q.b) Q.c : ℤ) (∏ P ∈ s, P) := by sorry

theorem genusChar_mem (s : Finset ℤ) (Q : BinaryForm) :
    genusChar s Q = -1 ∨ genusChar s Q = 0 ∨ genusChar s Q = 1 := by sorry

theorem genusChar_one (Q : BinaryForm) : genusChar ∅ Q = 1 := by sorry

/-- GN.2/binary-form-genus-character-invariance (b): invariance under `GL₂(ℤ)`. -/
theorem genusChar_comp {s : Finset ℤ}
    (hs : ∀ P ∈ s, TauCeti.Multiquadratic.IsPrimeDiscriminant P) (Q : BinaryForm)
    (hD : (∏ P ∈ s, P) ∣ Q.disc) (g : Matrix (Fin 2) (Fin 2) ℤ) (hg : IsUnit g.det) :
    genusChar s (Q.comp g) = genusChar s Q := by sorry

/-- GN.2/binary-form-genus-character-invariance (c): `χ_d(−Q) = sgn(d)·χ_d(Q)`. -/
theorem genusChar_neg {s : Finset ℤ}
    (hs : ∀ P ∈ s, TauCeti.Multiquadratic.IsPrimeDiscriminant P) (Q : BinaryForm)
    (hD : (∏ P ∈ s, P) ∣ Q.disc) :
    genusChar s Q.neg = Int.sign (∏ P ∈ s, P) * genusChar s Q := by sorry

end BinaryForm

/-- Test `genusChar_sum_two_squares`: `χ_{−4}(x² + y²) = 1`. -/
example : BinaryForm.genusChar {-4} ⟨1, 0, 1⟩ = 1 := by sorry

/-- Test `genusChar_nonprincipal`: `χ_5([2,1,2]) = −1` and `χ_5([1,1,4]) = 1`. -/
example : BinaryForm.genusChar {5} ⟨2, 1, 2⟩ = -1 ∧ BinaryForm.genusChar {5} ⟨1, 1, 4⟩ = 1 := by
  sorry

/-- Test `genusChar_imprimitive_zero`: `χ_{−3}([3,3,3]) = 0`. -/
example : BinaryForm.genusChar {-3} ⟨3, 3, 3⟩ = 0 := by sorry

/-- Test `genusChar_not_legendre_of_coeff`: `χ_5([5,5,2]) = −1`. -/
example : BinaryForm.genusChar {5} ⟨5, 5, 2⟩ = -1 := by sorry

/-- GN.2/binary-local-normal-form (a): at an odd prime a primitive binary form is
`ℤ_p`-equivalent to `ux² + Ay²` with `u` a unit. -/
theorem BinaryForm.exists_localNormalForm (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (Q : BinaryForm)
    (hprim : Int.gcd (Int.gcd Q.a Q.b) Q.c = 1) :
    ∃ (g : Matrix (Fin 2) (Fin 2) ℤ_[p]) (u A : ℤ_[p]), IsUnit g.det ∧ IsUnit u ∧
      ∀ x y : ℤ_[p], (Q.a : ℤ_[p]) * (g 0 0 * x + g 0 1 * y) ^ 2 +
        Q.b * (g 0 0 * x + g 0 1 * y) * (g 1 0 * x + g 1 1 * y) +
        Q.c * (g 1 0 * x + g 1 1 * y) ^ 2 = u * x ^ 2 + A * y ^ 2 := by sorry


/-! ## §2.14 Local integral classification and spinor norms -/

/-- GN.2/odd-unimodular-unit-representation: a unimodular quadratic `ℤ_p`-lattice of rank at
least two, `p` odd, represents every unit by a primitive vector. -/
theorem unimodular_represents_unit (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) {n : ℕ} (hn : 2 ≤ n)
    (Q : QuadraticForm ℤ_[p] (Fin n → ℤ_[p]))
    (hQ : IsUnit (LinearMap.BilinForm.toMatrix (Pi.basisFun ℤ_[p] (Fin n))
      (QuadraticMap.polarBilin Q)).det)
    (t : ℤ_[p]) (ht : IsUnit t) : ∃ v : Fin n → ℤ_[p], (∃ i, IsUnit (v i)) ∧ Q v = t := by sorry

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

/-! ## §2.15 Hermitian forms -/

/-- GN.2/signed-hermitian-space: an `ε`-hermitian space, sesquilinear (conjugate-linear in the
first variable) with `h w v = ε · star (h v w)` and nondegenerate. -/
structure SignedHermitianSpace (E V : Type*) [Field E] [StarRing E] [AddCommGroup V]
    [Module E V] where
  /-- The sign `ε = ±1`. -/
  ε : ℤˣ
  /-- The form. -/
  form : V →ₗ⋆[E] V →ₗ[E] E
  /-- `ε`-hermitian symmetry. -/
  symm : ∀ v w, form w v = (ε : E) * star (form v w)
  /-- Nondegeneracy. -/
  nondeg : ∀ v, (∀ w, form v w = 0) → v = 0

namespace SignedHermitianSpace

variable {E V : Type*} [Field E] [StarRing E] [AddCommGroup V] [Module E V]

/-- The unitary group `U(V, h)`: the linear automorphisms preserving `h`. -/
def unitaryGroup (H : SignedHermitianSpace E V) : Subgroup (V ≃ₗ[E] V) where
  carrier := {g | ∀ v w, H.form (g v) (g w) = H.form v w}
  one_mem' := fun _ _ => rfl
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- The adjoint anti-involution, `h (a v) w = h v (adjoint a w)`. -/
def adjoint [FiniteDimensional E V] (H : SignedHermitianSpace E V) (a : Module.End E V) :
    Module.End E V := sorry

theorem adjoint_unique [FiniteDimensional E V] (H : SignedHermitianSpace E V)
    (a b : Module.End E V) (h : ∀ v w, H.form (a v) w = H.form v (b w)) :
    b = H.adjoint a := by sorry

theorem mem_unitaryGroup_iff [FiniteDimensional E V] (H : SignedHermitianSpace E V)
    (g : V ≃ₗ[E] V) :
    g ∈ H.unitaryGroup ↔ H.adjoint (g : Module.End E V) * (g : Module.End E V) = 1 := by sorry

end SignedHermitianSpace

/-- GN.2/hermitian-trace-form: the `F`-quadratic form `v ↦ h(v, v)` of a hermitian space over a
quadratic extension `E/F` (the value lies in `F`). -/
def HermitianSpace.traceForm {F E V : Type*} [Field F] [Field E] [StarRing E] [Algebra F E]
    [AddCommGroup V] [Module E V] [Module F V] [IsScalarTower F E V]
    (H : SignedHermitianSpace E V) : QuadraticForm F V := sorry

theorem HermitianSpace.traceForm_apply {F E V : Type*} [Field F] [Field E] [StarRing E]
    [Algebra F E] [AddCommGroup V] [Module E V] [Module F V] [IsScalarTower F E V]
    (H : SignedHermitianSpace E V) (hε : H.ε = 1) (v : V) :
    algebraMap F E (HermitianSpace.traceForm (F := F) H v) = H.form v v := by sorry

/-- GN.2/model-ring-positive-involution: the ring `∏ᵢ M_{nᵢ}(𝒪_{Lᵢ})`. -/
abbrev ModelRing {k : ℕ} (L : Fin k → Type*) [∀ i, Field (L i)] [∀ i, NumberField (L i)]
    (n : Fin k → ℕ) : Type _ :=
  ∀ i, Matrix (Fin (n i)) (Fin (n i)) (NumberField.RingOfIntegers (L i))

/-! ## §2.16 Stable lattices: monogenic orders -/

/-- GN.2/local-monogenic-order: `R = ℤ_ℓ[x]/(f)`. -/
abbrev MonogenicOrder (ℓ : ℕ) [Fact ℓ.Prime] (f : ℤ_[ℓ][X]) : Type _ := AdjoinRoot f

/-! ## §2.18 Lattices with Frobenius and Zarhin's trick -/

/-- GN.2/lambda-2d-lattice: `Λ_{2d} = ⟨2d⟩ ⊕ U` as a Tau Ceti integral lattice. -/
def lambda2d (d : ℕ) : TauCeti.IntegralLattice (Fin 3 → ℚ) :=
  TauCeti.IntegralLattice.ofGramMatrix (Pi.basisFun ℚ (Fin 3))
    !![2 * (d : ℤ), 0, 0; 0, 0, 1; 0, 1, 0] (by sorry)

/-- Test `lambda2d_card_disc`: the discriminant group of `Λ_{2d}` has order `2d`. -/
example (d : ℕ) (hd : 0 < d) : Nat.card (TauCeti.IntegralLattice.DiscriminantGroup (lambda2d d)) = 2 * d := by
  sorry

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

/-! ## §2.19 Trace-unimodular lattices and ternary forms -/

section TraceLattice

variable {F : Type*} [Field F] [NumberField F] {V : Type*} [AddCommGroup V] [Module F V]
  [Module (NumberField.RingOfIntegers F) V] [IsScalarTower (NumberField.RingOfIntegers F) F V]

/-- GN.2/trace-unimodular-lattice: `Q(L) ⊆ 𝔡⁻¹`, written through traces. -/
def TraceLattice.IsEven (Q : QuadraticForm F V) (L : Submodule (NumberField.RingOfIntegers F) V) :
    Prop :=
  ∀ x ∈ L, ∀ a : NumberField.RingOfIntegers F, ∃ z : ℤ, Algebra.trace ℚ F ((a : F) * Q x) = z

/-- The trace dual `L′ = {y : (y, L) ⊆ 𝔡⁻¹}`, for the polar form. -/
def TraceLattice.traceDual (Q : QuadraticForm F V) (L : Submodule (NumberField.RingOfIntegers F) V) :
    Submodule (NumberField.RingOfIntegers F) V where
  carrier := {y | ∀ x ∈ L, ∀ a : NumberField.RingOfIntegers F,
    ∃ z : ℤ, Algebra.trace ℚ F ((a : F) * QuadraticMap.polar Q y x) = z}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

/-- `L′ = L`. -/
def TraceLattice.IsZUnimodular (Q : QuadraticForm F V)
    (L : Submodule (NumberField.RingOfIntegers F) V) : Prop :=
  TraceLattice.traceDual Q L = L

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



/-! ## Further API items statable at the pins -/

theorem latticeIndex_int (M N : Submodule ℤ (Fin 2 → ℚ)) (hNM : N ≤ M) :
    latticeIndex (F := ℚ) M N =
      Submodule.span ℤ {((N.toAddSubgroup.relIndex M.toAddSubgroup : ℕ) : ℚ)} := by sorry

theorem BinaryForm.genusChar_smul {s : Finset ℤ}
    (hs : ∀ P ∈ s, TauCeti.Multiquadratic.IsPrimeDiscriminant P) (Q : BinaryForm) (n : ℤ)
    (hn : n ≠ 0) :
    BinaryForm.genusChar s ⟨n * Q.a, n * Q.b, n * Q.c⟩ =
      TauCeti.Multiquadratic.genusCharFun s n * BinaryForm.genusChar s Q := by sorry

/-- GN.2/exponent-two-genus-theory: an imaginary quadratic class group of exponent at most two
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

theorem QuaternionOrder.star_mem {R F : Type*} [CommRing R] [IsDomain R] [IsIntegrallyClosed R]
    [Field F] [Algebra R F] [IsFractionRing R F] {a b : F} (O : AlgebraOrder R F ℍ[F,a,b])
    {x : ℍ[F,a,b]} (hx : x ∈ O.toSubalgebra) : star x ∈ O.toSubalgebra := by sorry

theorem QuaternionOrder.trd_mem {R F : Type*} [CommRing R] [IsDomain R] [IsIntegrallyClosed R]
    [Field F] [Algebra R F] [IsFractionRing R F] {a b : F} (O : AlgebraOrder R F ℍ[F,a,b])
    {x : ℍ[F,a,b]} (hx : x ∈ O.toSubalgebra) :
    quatTrd x ∈ Set.range (algebraMap R F) ∧
      QuaternionAlgebra.normForm a 0 b x ∈ Set.range (algebraMap R F) := by sorry

theorem QuadraticForm.arf_hyperbolic (K : Type*) [Field K] [CharP K 2] :
    QuadraticForm.arf (QuadraticMap.proj (R := K) (n := Fin 2) 0 1) = 0 := by sorry

/-- Test `arf_xy`: the Arf invariant of `xy` vanishes over `𝔽₂`. -/
example : QuadraticForm.arf (QuadraticMap.proj (R := ZMod 2) (n := Fin 2) 0 1) = 0 := by sorry

theorem lambda2d_even (d : ℕ) : (lambda2d d).IsEven := by sorry

/-- Test `lambda2d_not_unimodular`: `Λ_{2d}` is not unimodular for `d ≥ 1`. -/
example (d : ℕ) (hd : 0 < d) : ¬ (lambda2d d).IsUnimodular := by sorry

/-- Test `lambda2_disc`: for `d = 1` the discriminant group has order `2`. -/
example : Nat.card (TauCeti.IntegralLattice.DiscriminantGroup (lambda2d 1)) = 2 := by sorry

end TauCeti.GeometryOfNumbersPlan

/-!
## Statements not typed in this file

The following packet names (API items, unit tests and theorem names) are specified in the roadmap
document and have no Lean signature in this file. Most of them need carriers that the pinned
Mathlib and Tau Ceti do not have: Hilbert symbols and local-field classification
(QuadraticFormInvariants Layer 6), the base packet’s hermitian lattices with their duals and
invariants (§2.7) and integral quadratic lattices over a Dedekind domain (§2.2), adelic unitary and
orthogonal groups (AdelicAlgebraicGroups AA.1), GSpin over rings, signed hermitian Witt groups and
their transfer (§2.9), projective quadric surfaces, and the classification of hermitian spaces over
number fields. The others are statable with the declarations above and are left to the document to
keep this file short. Each name keeps the meaning its node gives it.

* `lattice-steinitz-class`: `Submodule.IsLattice.steinitzClass_eq_of_pseudobasis`, `Submodule.IsLattice.steinitzClass_prod`, `Submodule.IsLattice.steinitzClass_fractionalIdeal`, `steinitzClass_sqrt_neg_five`, `steinitzClass_sqrt_neg_five_sq`, `steinitzClass_not_rank`
* `lattice-completion`: `IntegralQuadraticLattice.completion`, `IntegralQuadraticLattice.completion_eq_range_tensor`, `IntegralQuadraticLattice.completion_isLattice`, `IntegralQuadraticLattice.completion_inf_eq_localize`, `IntegralQuadraticLattice.completion_localize`, `IntegralQuadraticLattice.completion_mono`, `IntegralQuadraticLattice.completion_sup`, `IntegralQuadraticLattice.completion_smul`, `IntegralQuadraticLattice.completion_integral`, `completion_int_two`, `completion_two_int_at_three`, `completion_ne_of_ne_at`, `completion_zero_dim`
* `lattice-local-global-dictionary`: `IntegralQuadraticLattice.localGlobalEquiv`
* `lattice-index-ideal`: `latticeIndex_localize`, `latticeIndex_not_card`
* `lattice-discriminant-ideal`: `IntegralQuadraticLattice.discrIdeal`, `IntegralQuadraticLattice.dual`, `IntegralQuadraticLattice.discrIdeal_of_pseudobasis`, `IntegralQuadraticLattice.discrIdeal_index`, `IntegralQuadraticLattice.IsUnimodular`, `IntegralQuadraticLattice.isUnimodular_iff_discrIdeal`, `IntegralQuadraticLattice.discrIdeal_localize`, `IntegralQuadraticLattice.discrIdeal_int`, `discrIdeal_sq_int`, `discrIdeal_hyperbolic`, `discrIdeal_scale`, `discrIdeal_zero_dim`
* `local-genus-character`: `localGenusChar`, `localGenusChar_of_not_dvd`, `localGenusChar_of_dvd`, `localGenusChar_conj`, `genusChar_eq_prod_localGenusChar`, `localGenusChar_minus_three`, `localGenusChar_unit_prime`, `localGenusChar_det_sign`, `localGenusChar_not_on_nonintegral`
* `signed-hermitian-space`: `SignedHermitianSpace.adjoint_comp`, `SignedHermitianSpace.det`, `SignedHermitianSpace.det_orthogonalSum`, `SignedHermitianSpace.unitaryGroupCongr`, `SignedHermitianSpace.unitaryGroup_smul`, `SignedHermitianSpace.unitaryGroup_trivialExt`, `signedHermitian_hyperbolic_det`, `signedHermitian_zero_dim`, `unitaryGroup_iso_not_isometric`, `unitaryGroup_symplectic`
* `quadratic-norm-squares`: `normGroup_eq_sq_inf_of_neg_one_sq`
* `equivariant-linear-form`: `SelfDualExtension`, `SelfDualExtension.stdForm`, `SelfDualExtension.stdForm_equivariant`, `SelfDualExtension.exists_unique_eq_stdForm_mul`, `SelfDualExtension.equivariant_iff`, `stdForm_trivial`, `stdForm_quadratic`, `stdForm_mul_beta_not_equivariant`
* `signed-witt-parity`: `SignedWitt.anisotropicDimParity`, `SignedWitt.even`, `SignedWitt.odd`, `SignedWitt.index_even`, `SignedWitt.maximal`, `SignedWitt.maximal_mem_even`, `SignedWitt.twist_fixed_iff`, `signedWitt_unitary_card_even`, `signedWitt_symplectic`, `signedWitt_hyperbolic_even`, `signedWitt_parity_not_dim`
* `skodlerack-stevens-maximal-transfer`: `SignedWitt.transfer_maximal`
* `signed-transfer-determinant`: `signedHermitianTransfer_det`
* `standard-transfer-values`: `stdTransfer_one`
* `hermitian-trace-form`: `HermitianSpace.traceForm_polar`, `HermitianSpace.traceForm_diag`, `HermitianSpace.isometry_iff_traceForm`, `HermitianSpace.traceForm_linearFirst`, `traceForm_complex_line`, `traceForm_zero`, `traceForm_scale_nonnorm`
* `hermitian-space-classification`: `HermitianSpace.isometric_iff_locallyIsometric`
* `unramified-hermitian-lattice-diagonalization`: `HermitianLattice.exists_orthogonal_basis_unramified`
* `local-unimodular-hermitian-classification`: `HermitianLattice.unimodular_isometric`
* `hermitian-norm-ideal`: `HermitianLattice.scale`, `HermitianLattice.normIdeal`, `HermitianLattice.normIdeal_le_scale`, `HermitianLattice.normIdeal_eq_of_trace_surjective`, `HermitianLattice.normIdeal_map`, `normIdeal_unit`, `normIdeal_dyadic_hyperbolic`, `normIdeal_zero`
* `hermitian-genus`: `HermitianLattice.genus`, `HermitianLattice.classSet`, `HermitianLattice.classSetEquivDoubleCoset`, `HermitianLattice.genus_eq_of_unimodular`, `hermitianGenus_self`, `hermitianGenus_gaussian`, `hermitianGenus_not_class`
* `unit-norm-label`: `unitNormLabel`, `unitNormLabel.form`, `unitNormLabel.form_det`, `unitNormLabel.form_posDef`, `unitNormLabel.form_rep_indep`, `unitNormLabel_gaussian`, `unitNormLabel_one`, `unitNormLabel_not_space_det`
* `free-unimodular-gram-orbits`: `freeUnimodular_gramOrbitEquiv`
* `free-projective-hermitian-comparison`: `freeUnimodular_subset_projective`
* `model-ring-positive-involution`: `ModelRing.posUnits`, `ModelRing.orbitCount`, `ModelRing.orbitCount_prod`, `ModelRing.orbit_equiv_lattices`, `ModelRing.quaternionic`, `modelRing_gaussian_one`, `modelRing_repeated`, `modelRing_not_hermitian_only`
* `local-monogenic-order`: `MonogenicOrder.saturation`, `MonogenicOrder.traceDual_eq`, `MonogenicOrder.index_traceDual`, `MonogenicOrder.conductor_mul_different`, `monogenic_maximal`, `monogenic_index_two`, `monogenic_nonfree`
* `normalized-lattice-sandwich`: `MonogenicOrder.exists_sandwich`
* `stable-lattice-flag-fiber`: `stableLattice_flagFiber_orbit`
* `finite-dvr-determinant-index`: `card_quotient_map_eq_pow_det`
* `isotypic-stabilizer-congruence-bound`: `congruenceKernel_le_stabilizer`
* `good-prime-lattice-orbit`: `goodPrime_lattice_unique_orbit`
* `quaternion-order`: `AlgebraOrder.localize`, `algebraOrder_matrix`, `algebraOrder_lipschitz_not_maximal`, `algebraOrder_field`, `algebraOrder_not_lattice`
* `quaternion-order-discriminant`: `QuaternionOrder.discrd_index`, `QuaternionOrder.discrd_localize`, `discrd_matrix`, `discrd_hurwitz`, `discrd_lattice_not_order`, `discrd_not_disc`
* `maximal-quaternion-order-criterion`: `QuaternionOrder.isMaximal_iff_discrd`
* `arf-invariant`: `QuadraticForm.arf_orthogonalSum`, `arf_F4_split`
* `quadric-surface-classification`: `quadricSurface_orbits`
* `regular-quadratic-module-spinor-norm`: `spinorNorm_integral_mem_units`
* `integral-isometry-charpoly-constraint`: `abs_eval_neg_one_isSquare_of_forall_integral`
* `dyadic-unimodular-spinor-image`: `spinorNorm_range_unimodular`
* `trace-unimodular-lattice`: `TraceLattice.traceDual_eq`, `TraceLattice.discriminantModule`, `TraceLattice.adelicTranslate`, `TraceLattice.zunimodular_int`, `traceLattice_E8`, `traceLattice_zero`, `traceLattice_not_OF_unimodular`
* `lambda-2d-lattice`: `lambda2d_rank`, `lambda2d_discriminantGroup`
* `primitive-embedding-congruence-transport`: `primitiveEmbedding_lambda_transport`
* `zarhin-explicit-plane`: `lambda2d_explicitPlane`
* `isotropic-quotient-discriminant`: `disc_eq_sq_mul_disc_isotropicQuotient`
* `compatible-system-norm-selection`: `exists_primitive_norm_of_compatibleSystem`
* `frobenius-eigenlattice-discriminant-bound`: `disc_eigenlattice_le`
* `witt-group-signature-splitting`: `wittGroup_signature_split`
-/
