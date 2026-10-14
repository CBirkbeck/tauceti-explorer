/-
This file is not the roadmap and is not exhaustive. The roadmap document
(research/blueprint/readmes/GL2AutomorphicRepresentationsAndTransfer--R17.5.md) and its
packet are definitive. The statements below suggest Lean forms so that contributors and
reviewers can converge on names and signatures; proofs by `sorry` claim no implementation.

Layer R17.5 of GL₂ automorphic representations and transfer, follow-up part: matching at
every place for solvable Artin representations, and characteristic-zero lifts of residual
representations with solvable image through Brauer characters and the Fong–Swan theorem.
Pins: Mathlib 082e2d3, Tau Ceti f790474. Only Mathlib carriers are used.

The automorphic statements of this part (stability and the local converse theorem for GL₂,
the twisted Artin functional equation, the all-place upgrade and its tetrahedral and
octahedral cases, and the two residual-modularity applications) need smooth representations
of GL₂ over a local field with their L- and ε-factors, Weil groups, Artin L-functions,
cuspidal automorphic representations and weight-one newforms with their Galois
representations. None of these carriers exists at the pins, so those declarations are
omitted here and listed at the end of the file; the README states them.

Some nodes are stated here in a narrower form than in the README: Fong–Swan in its character
form for solvable groups (the README covers p-solvable groups and the lattice form), and the
recognition theorem in its part (b) for a simple module; part (c) is the API lemma
`brauerCharacter_reduction`, and part (a) (dual bases with projective covers) stays in the README.
-/
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.Kronecker
import Mathlib.LinearAlgebra.Matrix.Block
import Mathlib.RingTheory.RootsOfUnity.Basic
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.GroupTheory.Solvable
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.Analysis.Complex.Basic
import Mathlib.NumberTheory.NumberField.AdeleRing
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.RingTheory.DedekindDomain.AdicValuation
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.Data.ZMod.Basic

set_option linter.unusedSectionVars false
set_option linter.unusedVariables false

namespace TauCeti.GL2Transfer

open Matrix Polynomial

/-! ### Matrix representations as `Representation`s -/

section MatrixRep

variable {Γ k : Type*} [Group Γ] [Field k]

/-- The `k`-linear representation of `Γ` on `ι → k` attached to a matrix representation. -/
abbrev matrixRep {ι : Type*} [Fintype ι] [DecidableEq ι] (r : Γ →* GL ι k) :
    Representation k Γ (ι → k) :=
  (Units.coeHom (Module.End k (ι → k))).comp
    (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp r)

end MatrixRep

/-! ### R17.5/brauer-character -/

section BrauerCharacter

variable {Γ k : Type*} [Group Γ] [Field k]

open Classical in
/-- The Brauer character of a matrix representation `r` over `k`, for an identification
`τ : μ_m(k) ≃ μ_m(ℂ)`: the sum, over the roots of the characteristic polynomial of `r g`
counted with multiplicity, of their `τ`-lifts. For a `p`-regular element `g` of a finite group,
with `k` algebraically closed of characteristic `p` and `m` divisible by the orders of the
`p`-regular elements, every root is an `m`-th root of unity and this is Webb's `φ_r(g)`;
a root that is not an `m`-th root of unity would contribute `0`. It is not a lift of the trace
of `r g`. -/
noncomputable def brauerCharacter (m : ℕ) [NeZero m] (τ : rootsOfUnity m k ≃* rootsOfUnity m ℂ)
    {ι : Type*} [Fintype ι] [DecidableEq ι] (r : Γ →* GL ι k) (g : Γ) : ℂ :=
  (((r g).val.charpoly.roots).map fun x =>
    if h : x ^ m = 1 then (((τ (rootsOfUnity.mkOfPowEq x h)) : ℂˣ) : ℂ) else 0).sum

variable (p : ℕ) [Fact p.Prime] [CharP k p] [IsAlgClosed k]
variable (m : ℕ) [NeZero m] (hmp : Nat.Coprime m p)
variable (τ : rootsOfUnity m k ≃* rootsOfUnity m ℂ)
variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- Evaluation from a factorisation of the characteristic polynomial into `m`-th roots of
unity. -/
theorem brauerCharacter_spectrum (r : Γ →* GL ι k) (g : Γ) (a : ι → rootsOfUnity m k)
    (ha : (r g).val.charpoly = ∏ i, (X - C (((a i : kˣ)) : k))) :
    brauerCharacter m τ r g = ∑ i, (((τ (a i)) : ℂˣ) : ℂ) := by
  sorry

/-- The value at the identity is the dimension, as a complex number. -/
@[simp] theorem brauerCharacter_one (r : Γ →* GL ι k) :
    brauerCharacter m τ r 1 = Fintype.card ι := by
  sorry

/-- The Brauer character is a class function. -/
theorem brauerCharacter_conjugate (r : Γ →* GL ι k) (x g : Γ) :
    brauerCharacter m τ r (x * g * x⁻¹) = brauerCharacter m τ r g := by
  sorry

/-- Equivalent representations have the same Brauer character. -/
theorem brauerCharacter_conj_equiv (r r' : Γ →* GL ι k) (P : GL ι k)
    (h : ∀ g, r' g = P * r g * P⁻¹) :
    brauerCharacter m τ r' = brauerCharacter m τ r := by
  sorry

/-- At a `p`-regular element the value at the inverse is the complex conjugate. -/
theorem brauerCharacter_inv [Finite Γ]
    (hΓ : ∀ g : Γ, Nat.Coprime (orderOf g) p → orderOf g ∣ m)
    (r : Γ →* GL ι k) (g : Γ) (hg : Nat.Coprime (orderOf g) p) :
    brauerCharacter m τ r g⁻¹ = starRingEnd ℂ (brauerCharacter m τ r g) := by
  sorry

/-- Tensor products: the Brauer character of a Kronecker-product representation is the
product of the Brauer characters, at `p`-regular elements. -/
theorem brauerCharacter_tensor [Finite Γ]
    (hΓ : ∀ g : Γ, Nat.Coprime (orderOf g) p → orderOf g ∣ m)
    {ι' : Type*} [Fintype ι'] [DecidableEq ι']
    (r : Γ →* GL ι k) (r' : Γ →* GL ι' k) (t : Γ →* GL (ι × ι') k)
    (ht : ∀ g, (t g).val = kroneckerMap (· * ·) (r g).val (r' g).val)
    (g : Γ) (hg : Nat.Coprime (orderOf g) p) :
    brauerCharacter m τ t g = brauerCharacter m τ r g * brauerCharacter m τ r' g := by
  sorry

/-- Additivity for block upper-triangular representations; hence the Brauer character depends
only on composition factors. -/
theorem brauerCharacter_blockTriangular {ι' : Type*} [Fintype ι'] [DecidableEq ι']
    (r₁ : Γ →* GL ι k) (r₂ : Γ →* GL ι' k) (r : Γ →* GL (ι ⊕ ι') k)
    (B : Γ → Matrix ι ι' k)
    (hr : ∀ g, (r g).val = fromBlocks (r₁ g).val (B g) 0 (r₂ g).val) (g : Γ) :
    brauerCharacter m τ r g = brauerCharacter m τ r₁ g + brauerCharacter m τ r₂ g := by
  sorry

/-- Reduction of an integral representation: if the eigenvalues of `ρ g` are `m`-th roots of
unity in `R`, and `τ` is compatible with reduction `f` and an embedding `σ`, the Brauer character
of the reduction is the ordinary character. -/
theorem brauerCharacter_reduction {R : Type*} [CommRing R] [IsDomain R]
    (f : R →+* k) (σ : R →+* ℂ)
    (hτ : ∀ ζ : rootsOfUnity m R,
      (((τ (restrictRootsOfUnity f m ζ)) : ℂˣ) : ℂ) = σ ((ζ : Rˣ) : R))
    (ρ : Γ →* GL ι R) (g : Γ)
    (hsplit : ∃ a : ι → rootsOfUnity m R,
      (ρ g).val.charpoly = ∏ i, (X - C (((a i : Rˣ)) : R))) :
    brauerCharacter m τ ((Matrix.GeneralLinearGroup.map f).comp ρ) g =
      σ (Matrix.trace (ρ g).val) := by
  sorry

/-- Extension of scalars along an embedding of algebraically closed fields, with a compatible
identification of roots of unity, does not change the Brauer character. -/
theorem brauerCharacter_mapField {k' : Type*} [Field k'] [IsAlgClosed k'] (e : k →+* k')
    (τ' : rootsOfUnity m k' ≃* rootsOfUnity m ℂ)
    (hτ' : ∀ ζ : rootsOfUnity m k, τ' (restrictRootsOfUnity e m ζ) = τ ζ)
    (r : Γ →* GL ι k) (g : Γ) :
    brauerCharacter m τ' ((Matrix.GeneralLinearGroup.map e).comp r) g =
      brauerCharacter m τ r g := by
  sorry

-- TauCeti.GL2Transfer.brauerCharacter_rank_one_test:
-- a one-dimensional root of unity is lifted to its `τ`-image.
example (r : Γ →* GL (Fin 1) k) (g : Γ) (a : rootsOfUnity m k)
    (ha : (r g).val.charpoly = X - C (((a : kˣ)) : k)) :
    brauerCharacter m τ r g = (((τ a) : ℂˣ) : ℂ) := by
  sorry

-- TauCeti.GL2Transfer.brauerCharacter_cube_root_test:
-- eigenvalues `a, a²` with `τ a` a primitive cube root give `-1`, whatever the trace in `k`.
example (r : Γ →* GL (Fin 2) k) (g : Γ) (a : rootsOfUnity m k)
    (ha : (r g).val.charpoly =
      (X - C (((a : kˣ)) : k)) * (X - C ((((a ^ 2 : rootsOfUnity m k)) : kˣ) : k)))
    (hτ : IsPrimitiveRoot (((τ a) : ℂˣ) : ℂ) 3) :
    brauerCharacter m τ r g = -1 := by
  sorry

-- TauCeti.GL2Transfer.brauerCharacter_identity_rank_p_test:
-- the trivial representation of rank `p` has value `p ≠ 0` at the identity.
example : brauerCharacter m τ (1 : Γ →* GL (Fin p) k) 1 = (p : ℂ) ∧ (p : ℂ) ≠ 0 := by
  refine ⟨?_, Nat.cast_ne_zero.mpr (Nat.Prime.ne_zero Fact.out)⟩
  rw [brauerCharacter_one]
  simp

-- TauCeti.GL2Transfer.brauerCharacter_sign_reduction_test:
-- the reduction modulo 3 of the integral sign character has Brauer character `-1`.
example (hk : CharP k 3) (τ₂ : rootsOfUnity 2 k ≃* rootsOfUnity 2 ℂ)
    (ρ : Γ →* GL (Fin 1) ℤ) (g : Γ) (hg : (ρ g).val = !![-1]) :
    brauerCharacter 2 τ₂ ((Matrix.GeneralLinearGroup.map (Int.castRingHom k)).comp ρ) g = -1 := by
  sorry

end BrauerCharacter

/-! ### R17.5/brauer-character-recognition and R17.5/fong-swan -/

section Recognition

variable {Γ k : Type*} [Group Γ] [Finite Γ] [Field k]
variable (p : ℕ) [Fact p.Prime] [CharP k p] [IsAlgClosed k]
variable (m : ℕ) [NeZero m] (hmp : Nat.Coprime m p)
variable (hΓ : ∀ g : Γ, Nat.Coprime (orderOf g) p → orderOf g ∣ m)
variable (τ : rootsOfUnity m k ≃* rootsOfUnity m ℂ)

-- Without these two hypotheses on `m` the Brauer character loses information (for `m = 1` it only
-- counts the eigenvalue `1`), and both statements below would be false.
include hmp hΓ

/-- A representation whose Brauer character equals that of an irreducible representation is
isomorphic to it (Webb, Corollary 10.2.3(3)). -/
theorem brauerCharacter_recognition {n : ℕ} (r r' : Γ →* GL (Fin n) k)
    (hr : (matrixRep r).IsIrreducible)
    (h : ∀ g : Γ, Nat.Coprime (orderOf g) p → brauerCharacter m τ r' g = brauerCharacter m τ r g) :
    ∃ P : GL (Fin n) k, ∀ g, r' g = P * r g * P⁻¹ := by
  sorry

/-- The Fong–Swan theorem, character form: an irreducible representation of a finite solvable
group in characteristic `p` has an irreducible complex lift whose character equals its Brauer
character on `p`-regular elements. -/
theorem fong_swan [Group.IsSolvable Γ] {n : ℕ} (r : Γ →* GL (Fin n) k)
    (hr : (matrixRep r).IsIrreducible) :
    ∃ ρ : Γ →* GL (Fin n) ℂ, (matrixRep ρ).IsIrreducible ∧
      ∀ g : Γ, Nat.Coprime (orderOf g) p →
        brauerCharacter m τ r g = Matrix.trace (ρ g).val := by
  sorry

end Recognition

/-! ### R17.5/solvable-integral-lift -/

open IsDedekindDomain NumberField

/-- Integral lift of an irreducible representation of a finite solvable group, with the actual
residual representation (not only its semisimplification) and the same kernel. -/
theorem solvable_finite_image_integral_lift
    (Γ : Type*) [Group Γ] [Finite Γ] [Group.IsSolvable Γ]
    (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p] [IsAlgClosed k]
    (n : ℕ) (r : Γ →* GL (Fin n) k) (hirr : (matrixRep r).IsIrreducible) :
    ∃ (E : Type) (_ : Field E) (_ : NumberField E) (v : HeightOneSpectrum (𝓞 E)),
      letI : v.asIdeal.IsPrime := v.isPrime
      ∃ (f : Localization.AtPrime v.asIdeal →+* k)
        (ρ : Γ →* GL (Fin n) (Localization.AtPrime v.asIdeal)) (P : GL (Fin n) k),
        RingHom.ker f = IsLocalRing.maximalIdeal (Localization.AtPrime v.asIdeal) ∧
        ρ.ker = r.ker ∧
        ∀ g : Γ, r g = P * Matrix.GeneralLinearGroup.map f (ρ g) * P⁻¹ := by
  sorry

/-! ### R17.5/involution-oddness-under-reduction -/

section Oddness

/-- Reduction at odd residue characteristic detects the sign of an involution. -/
theorem involution_det_eq_neg_one_of_reduction
    {R k : Type*} [CommRing R] [NoZeroDivisors R] [Field k]
    (f : R →+* k) (h2 : (2 : k) ≠ 0)
    (A : GL (Fin 2) R) (hA : A ^ 2 = 1)
    (hred : Matrix.GeneralLinearGroup.det (Matrix.GeneralLinearGroup.map f A) = (-1 : kˣ)) :
    Matrix.GeneralLinearGroup.det A = (-1 : Rˣ) := by
  have hsq : (Matrix.GeneralLinearGroup.det A : R) ^ 2 = 1 := by
    have h := congrArg (fun B => (Matrix.GeneralLinearGroup.det B : R)) hA
    simpa using h
  rcases sq_eq_one_iff.mp hsq with hpos | hneg
  · have hmap : f (Matrix.GeneralLinearGroup.det A : R) = (-1 : k) := by
      have h := congrArg (fun u : kˣ => (u : k)) hred
      simpa only [Matrix.GeneralLinearGroup.map_det, Units.coe_map, MonoidHom.coe_coe,
        Units.val_neg, Units.val_one] using h
    rw [hpos, map_one] at hmap
    have hzero : (2 : k) = 0 := by
      calc
        (2 : k) = 1 + 1 := by norm_num
        _ = -1 + 1 := congrArg (fun x : k => x + 1) hmap
        _ = 0 := by simp
    exact False.elim (h2 hzero)
  · exact Units.ext hneg

/-- The same comparison when only a residual representation conjugate to the reduction is
known. -/
theorem involution_det_eq_neg_one_of_residual_conjugacy
    {R k : Type*} [CommRing R] [NoZeroDivisors R] [Field k]
    (f : R →+* k) (h2 : (2 : k) ≠ 0)
    (A : GL (Fin 2) R) (hA : A ^ 2 = 1)
    (B P : GL (Fin 2) k)
    (hcomp : B = P * Matrix.GeneralLinearGroup.map f A * P⁻¹)
    (hodd : Matrix.GeneralLinearGroup.det B = (-1 : kˣ)) :
    Matrix.GeneralLinearGroup.det A = (-1 : Rˣ) := by
  apply involution_det_eq_neg_one_of_reduction f h2 A hA
  have hdet : Matrix.GeneralLinearGroup.det B =
      Matrix.GeneralLinearGroup.det (Matrix.GeneralLinearGroup.map f A) := by
    simp [hcomp, mul_assoc]
  exact hdet.symm.trans hodd

/-- Oddness of a lift at an involution `c`, from oddness of the residual representation. -/
theorem involution_odd_of_residual_conjugacy
    {G R k : Type*} [Group G] [CommRing R] [NoZeroDivisors R] [Field k]
    (f : R →+* k) (h2 : (2 : k) ≠ 0)
    (ρ : G →* GL (Fin 2) R) (rbar : G →* GL (Fin 2) k) (P : GL (Fin 2) k)
    (hcomp : ∀ g, rbar g = P * Matrix.GeneralLinearGroup.map f (ρ g) * P⁻¹)
    (c : G) (hc : c ^ 2 = 1)
    (hodd : Matrix.GeneralLinearGroup.det (rbar c) = (-1 : kˣ)) :
    Matrix.GeneralLinearGroup.det (ρ c) = (-1 : Rˣ) :=
  involution_det_eq_neg_one_of_residual_conjugacy f h2 (ρ c)
    (by rw [← map_pow, hc, map_one]) (rbar c) P (hcomp c) hodd

private def mixedSignInvolution : GL (Fin 2) ℤ where
  val := !![1, 0; 0, -1]
  inv := !![1, 0; 0, -1]
  val_inv := by
    ext i j
    fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_succ]
  inv_val := by
    ext i j
    fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_succ]

local instance : Fact (Nat.Prime 3) := ⟨by decide⟩

-- diag(1, -1) reduced modulo 3 is odd, and its integral determinant is -1.
example : Matrix.GeneralLinearGroup.det mixedSignInvolution = (-1 : ℤˣ) := by
  apply involution_det_eq_neg_one_of_reduction (Int.castRingHom (ZMod 3)) (by decide)
  · apply Units.ext
    rw [pow_two]
    change mixedSignInvolution.val * mixedSignInvolution.val = (1 : Matrix (Fin 2) (Fin 2) ℤ)
    exact mixedSignInvolution.val_inv
  · rw [Matrix.GeneralLinearGroup.map_det]
    apply Units.ext
    norm_num [mixedSignInvolution, Matrix.GeneralLinearGroup.det, Matrix.det_fin_two]

-- A scalar involution -I has determinant +1 in rank two: it is never odd.
example : Matrix.GeneralLinearGroup.det
    (Matrix.GeneralLinearGroup.map (Int.castRingHom (ZMod 3))
      (Matrix.GeneralLinearGroup.scalar (Fin 2) (-1 : ℤˣ))) = 1 := by
  rw [Matrix.GeneralLinearGroup.map_det, Matrix.GeneralLinearGroup.det_scalar]
  norm_num

-- Modulo 2 the identity has residual determinant -1 = 1 but is not odd.
example : (1 : GL (Fin 2) ℤ) ^ 2 = 1 ∧
    Matrix.GeneralLinearGroup.det
      (Matrix.GeneralLinearGroup.map (Int.castRingHom (ZMod 2)) (1 : GL (Fin 2) ℤ)) =
        (-1 : (ZMod 2)ˣ) ∧
    Matrix.GeneralLinearGroup.det (1 : GL (Fin 2) ℤ) ≠ (-1 : ℤˣ) := by
  constructor
  · simp
  constructor
  · simp only [map_one]
    apply Units.ext
    norm_num
  · simp only [map_one]
    intro h
    have hval := congrArg (fun u : ℤˣ => (u : ℤ)) h
    norm_num at hval

end Oddness

/-! ### R17.5/odd-solvable-residual-lift -/

/-- A continuous residual representation of `G_F` with solvable image has a characteristic-zero
lift over the localisation of a number field at a prime above `p`, with the same kernel and the
residual representation itself as reduction; for `p ≠ 2` the lift is odd at every involution at
which the residual representation is odd. -/
theorem odd_solvable_residual_lift (F : Type*) [Field F] [NumberField F]
    (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p] [IsAlgClosed k] (n : ℕ)
    (rbar : Field.absoluteGaloisGroup F →* GL (Fin n) k)
    (hopen : IsOpen (rbar.ker : Set (Field.absoluteGaloisGroup F)))
    (hsolv : Group.IsSolvable rbar.range)
    (hirr : (matrixRep rbar).IsIrreducible) :
    ∃ (E : Type) (_ : Field E) (_ : NumberField E) (v : HeightOneSpectrum (𝓞 E)),
      letI : v.asIdeal.IsPrime := v.isPrime
      ∃ (f : Localization.AtPrime v.asIdeal →+* k)
        (ρ : Field.absoluteGaloisGroup F →* GL (Fin n) (Localization.AtPrime v.asIdeal))
        (P : GL (Fin n) k),
        RingHom.ker f = IsLocalRing.maximalIdeal (Localization.AtPrime v.asIdeal) ∧
        ρ.ker = rbar.ker ∧
        (∀ g, rbar g = P * Matrix.GeneralLinearGroup.map f (ρ g) * P⁻¹) ∧
        (p ≠ 2 → ∀ c, c ^ 2 = 1 → Matrix.GeneralLinearGroup.det (rbar c) = -1 →
          Matrix.GeneralLinearGroup.det (ρ c) = -1) := by
  sorry

/-! ### R17.5/isolating-twist-character (Jacquet–Langlands, Lemma 12.5) -/

section IsolatingTwist

variable {K : Type*} [Field K] [NumberField K]

/-- A quasi-character of the idele class group with prescribed component at `v₀` and
component at each other `v ∈ S` nontrivial on the principal units of level `m v`. -/
theorem isolating_twist_character (S : Finset (HeightOneSpectrum (𝓞 K)))
    (v₀ : HeightOneSpectrum (𝓞 K)) (hv₀ : v₀ ∈ S)
    (χ₀ : ContinuousMonoidHom (v₀.adicCompletion K)ˣ ℂˣ)
    (m : HeightOneSpectrum (𝓞 K) → ℕ) :
    ∃ ω : ContinuousMonoidHom (IdeleClassGroup (𝓞 K) K) ℂˣ,
      ω.toMonoidHom.comp (IdeleClassGroup.ofAdicCompletion (𝓞 K) K v₀) = χ₀.toMonoidHom ∧
      ∀ v ∈ S, v ≠ v₀ → ∃ u : (v.adicCompletion K)ˣ,
        Valued.v ((u : v.adicCompletion K) - 1) ≤
            ((Multiplicative.ofAdd (-(m v : ℤ)) : Multiplicative ℤ) : WithZero (Multiplicative ℤ)) ∧
          ω (IdeleClassGroup.ofAdicCompletion (𝓞 K) K v u) ≠ 1 := by
  sorry

end IsolatingTwist

/-
Omitted declarations (README targets whose carriers are not at the pins):
TauCeti.GL2Transfer.gl2_twist_stability, TauCeti.GL2Transfer.gl2_local_converse
  (irreducible smooth representations of GL₂(F) with Jacquet–Langlands L-, ε- and γ-factors);
TauCeti.GL2Transfer.artin_twisted_functional_equation
  (global Weil group, Artin L-functions and Langlands–Deligne local constants);
TauCeti.GL2Transfer.artin_all_place_upgrade, TauCeti.GL2Transfer.tetrahedral_artin_all_places,
TauCeti.GL2Transfer.octahedral_artin_all_places
  (cuspidal automorphic representations of GL₂(𝔸_F), local Langlands parameters, base change);
TauCeti.GL2Transfer.solvable_residual_modularity, TauCeti.GL2Transfer.q_solvable_residual_weight_one
  (the above together with weight-one newforms and their Galois representations).
-/

end TauCeti.GL2Transfer
