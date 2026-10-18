import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.LinearAlgebra.TensorPower.Basic
import Mathlib.LinearAlgebra.Alternating.Basic
import Mathlib.RepresentationTheory.Invariants
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Basic
import Mathlib.Data.ZMod.Basic
import TauCeti.RepresentationTheory.Symmetric.TensorAction.Invariants

/-!
This file is not the roadmap and is not exhaustive. The companion README is
definitive. These statements suggest Lean forms so that contributors and
reviewers converge on names and signatures; they claim no implementation.

Layer GC.3 (symmetric local systems), follow-up of the accepted parent plan.
Only the algebra that the layer's cohomology computation rests on is stated
here, over carriers that exist at the pinned Mathlib and Tau Ceti:

* `koszulPermAction`, `koszulRepresentation`: the Koszul-signed permutation
  action of `Equiv.Perm (Fin d)` on `⨂[K]^d V`, the sign twist of Tau Ceti's
  `PiTensorProduct.reindexRepresentation`; it is the action on the degree-`d`
  part of the graded tensor power of a space concentrated in degree one;
* `antisymmetrization`, `exteriorProjection`: the maps between `⋀[K]^d V` and
  `⨂[K]^d V`, and the comparison of the Koszul-signed invariants with the
  exterior power when `d!` is invertible (`antisymmetrization.bijective`);
* `invariants_map_surjective`: invariants of a finite group are exact when its
  order is invertible (rational averaging);
* `groupCohomology_isZero_of_invertible`: rational acyclicity of a finite group;
* `prod_character_eq_comp_prod`, `prod_character_eq_one_of_prod_eq_one`,
  `prod_character_perm`: the tensor character on `A^m` factors through
  multiplication and is invariant under permuting the factors.

Geometric omission ledger (README targets; their carriers are absent at the
pins, and no stand-in type, predicate field or admitted data definition is
used for them):
* monodromySymmetricLocalSystem (GC.3/monodromy-symmetric-local-system):
  restrictDistinct, uniqueExtension, zero, one, monodromy, stalk,
  multiplicative; tests test_zero, test_one, test_constant, test_order_three,
  test_koszul_sign_obstructs, test_stabilizer_character.
* symmetricCoarseModel (GC.3/symmetric-coarse-model): stalk,
  restrictDistinct, zero, one, subsheaf; tests test_zero, test_one,
  test_kummer_stalks, test_not_lisse.
* The theorems GC.3/root-curve-character-dictionary,
  GC.3/rational-coarse-comparison, GC.3/symmetric-power-cohomology,
  GC.3/twisted-curve-cohomology and GC.3/pushforward-description-comparison.
They need étale sites, constructible and lisse `ℚ̄_ℓ`-sheaves and their
cohomology on schemes and on tame Deligne–Mumford stacks, and étale
fundamental groups of such stacks; none of these is at the pins.

The twelve parent GC.3 declarations (tame-local-systems, symmetricLocalSystem,
collision-kernel, middle-extension, collision-descent, cohomology-vanishing,
koszul-exterior, exterior-cohomology, multiplicity-free-product,
symmetric-multiplicativity, symmetric-associativity, symmetric-symmetry) are
imported by id and not redeclared; they have the same carrier obstruction.
-/

noncomputable section

open scoped TensorProduct

namespace TauCeti.RamifiedClassField

open Equiv

section Koszul

variable (K : Type*) [CommRing K] (V : Type*) [AddCommGroup V] [Module K V]

/-- The Koszul-signed permutation action on `⨂[K]^d V`: `σ` permutes the tensor
factors and multiplies by `sign σ`. It is the action of `S_d` on the degree-`d`
part of the graded tensor power of a graded module concentrated in degree one. -/
def koszulPermAction (d : ℕ) (σ : Perm (Fin d)) : (⨂[K]^d V) →ₗ[K] (⨂[K]^d V) :=
  ((Perm.sign σ : ℤ)) • PiTensorProduct.reindexRepresentation K V (Fin d) σ

namespace koszulPermAction

variable {K V}

theorem apply_tprod (d : ℕ) (σ : Perm (Fin d)) (v : Fin d → V) :
    koszulPermAction K V d σ (PiTensorProduct.tprod K v) =
      ((Perm.sign σ : ℤ)) • PiTensorProduct.tprod K (fun i => v (σ.symm i)) := by
  sorry

variable (K V)

theorem one (d : ℕ) : koszulPermAction K V d 1 = LinearMap.id := by
  sorry

theorem mul (d : ℕ) (σ τ : Perm (Fin d)) :
    koszulPermAction K V d (σ * τ) = koszulPermAction K V d σ ∘ₗ koszulPermAction K V d τ := by
  sorry

/-- The sign twist of Tau Ceti's unsigned permutation representation. -/
theorem eq_sign_smul_reindexRepresentation (d : ℕ) (σ : Perm (Fin d)) :
    koszulPermAction K V d σ =
      ((Perm.sign σ : ℤ)) • PiTensorProduct.reindexRepresentation K V (Fin d) σ := by
  sorry

variable {K V}

/-- A transposition acts by minus the ordinary flip: the Koszul sign. -/
theorem swap_tprod (v w : V) :
    koszulPermAction K V 2 (swap 0 1) (PiTensorProduct.tprod K ![v, w]) =
      -PiTensorProduct.tprod K ![w, v] := by
  sorry

/-- Naturality in linear maps; a Frobenius acting linearly is a special case. -/
theorem naturality {W : Type*} [AddCommGroup W] [Module K W] (f : V →ₗ[K] W) (d : ℕ)
    (σ : Perm (Fin d)) :
    PiTensorProduct.map (fun _ : Fin d => f) ∘ₗ koszulPermAction K V d σ =
      koszulPermAction K W d σ ∘ₗ PiTensorProduct.map (fun _ : Fin d => f) := by
  sorry

end koszulPermAction

/-- The Koszul-signed permutation representation of `S_d` on `⨂[K]^d V`. -/
def koszulRepresentation (d : ℕ) : Representation K (Perm (Fin d)) (⨂[K]^d V) where
  toFun := koszulPermAction K V d
  map_one' := koszulPermAction.one K V d
  map_mul' := koszulPermAction.mul K V d

/-- The antisymmetrization map `v₁ ∧ ⋯ ∧ v_d ↦ ∑_σ sign σ · v_{σ 1} ⊗ ⋯ ⊗ v_{σ d}`. -/
def antisymmetrization (d : ℕ) : ⋀[K]^d V →ₗ[K] ⨂[K]^d V :=
  exteriorPower.alternatingMapLinearEquiv
    (MultilinearMap.alternatization
      (PiTensorProduct.tprod K : MultilinearMap K (fun _ : Fin d => V) (⨂[K]^d V)))

/-- The quotient map `v₁ ⊗ ⋯ ⊗ v_d ↦ v₁ ∧ ⋯ ∧ v_d`. -/
def exteriorProjection (d : ℕ) : ⨂[K]^d V →ₗ[K] ⋀[K]^d V :=
  PiTensorProduct.lift (exteriorPower.ιMulti K d).toMultilinearMap

namespace antisymmetrization

variable {K V}

theorem apply_ιMulti (d : ℕ) (v : Fin d → V) :
    antisymmetrization K V d (exteriorPower.ιMulti K d v) =
      ∑ σ : Perm (Fin d), ((Perm.sign σ : ℤ)) • PiTensorProduct.tprod K (fun i => v (σ i)) := by
  sorry

variable (K V)

/-- Projecting back multiplies by `d!`. -/
theorem exteriorProjection_comp (d : ℕ) :
    exteriorProjection K V d ∘ₗ antisymmetrization K V d = (d.factorial : K) • LinearMap.id := by
  sorry

theorem mem_invariants (d : ℕ) (x : ⋀[K]^d V) :
    antisymmetrization K V d x ∈ (koszulRepresentation K V d).invariants := by
  sorry

theorem naturality {W : Type*} [AddCommGroup W] [Module K W] (f : V →ₗ[K] W) (d : ℕ) :
    antisymmetrization K W d ∘ₗ exteriorPower.map d f =
      PiTensorProduct.map (fun _ : Fin d => f) ∘ₗ antisymmetrization K V d := by
  sorry

/-- With `d!` invertible, antisymmetrization is a bijection onto the Koszul-signed
invariants: the graded `S_d`-invariants of a degree-one space are its exterior power. -/
theorem bijective (d : ℕ) [Invertible (d.factorial : K)] :
    Function.Bijective
      ((antisymmetrization K V d).codRestrict (koszulRepresentation K V d).invariants
        (mem_invariants K V d)) := by
  sorry

end antisymmetrization

-- koszulRepresentation.test_degree_zero: `S_0` is trivial, so every element of
-- `⨂[K]^0 V ≃ K` is invariant.
example : (koszulRepresentation K V 0).invariants = ⊤ := by
  sorry

-- koszulRepresentation.test_degree_one: `S_1` is trivial, so the invariants are all of
-- `⨂[K]^1 V ≃ V`.
example : (koszulRepresentation K V 1).invariants = ⊤ := by
  sorry

-- koszulRepresentation.test_line_square: with `2` invertible a line has no Koszul-signed
-- invariants in degree two; the unsigned action would have the whole line `K ⊗ K`.
example [Invertible (2 : K)] : (koszulRepresentation K K 2).invariants = ⊥ := by
  sorry

-- koszulRepresentation.test_pure_square: the unsigned permutation action fixes `x ⊗ x`; the
-- Koszul-signed action fixes it only when it vanishes, once `2` is invertible.
example [Invertible (2 : K)] (x : V) :
    PiTensorProduct.tprod K (fun _ : Fin 2 => x) ∈
        (PiTensorProduct.reindexRepresentation K V (Fin 2)).invariants ∧
      (PiTensorProduct.tprod K (fun _ : Fin 2 => x) ∈ (koszulRepresentation K V 2).invariants ↔
        PiTensorProduct.tprod K (fun _ : Fin 2 => x) = 0) := by
  sorry

-- koszulRepresentation.test_char_two: in characteristic two the sign is trivial, so a line
-- keeps a nonzero invariant in degree two although its exterior square is zero.
example : (koszulRepresentation (ZMod 2) (ZMod 2) 2).invariants = ⊤ ∧
    Module.finrank (ZMod 2) (⋀[ZMod 2]^2 (ZMod 2)) = 0 := by
  sorry

-- alternating-invariants-exterior: over a field of characteristic zero the invariants of
-- `Lⁿ` have dimension `n.choose d`, which vanishes for `d > n`.
example (L : Type*) [Field L] [CharZero L] (n d : ℕ) :
    Module.finrank L (koszulRepresentation L (Fin n → L) d).invariants = n.choose d := by
  sorry

-- antisymmetrization.test_degree_two: `α₂(v ∧ w) = v ⊗ w − w ⊗ v`.
example (v w : V) :
    antisymmetrization K V 2 (exteriorPower.ιMulti K 2 ![v, w]) =
      PiTensorProduct.tprod K ![v, w] - PiTensorProduct.tprod K ![w, v] := by
  sorry

-- antisymmetrization.test_degree_zero: in degree zero `α₀` is the identification
-- `⋀⁰V ≃ K ≃ ⨂⁰V`.
example (x : ⋀[K]^0 V) :
    PiTensorProduct.isEmptyEquiv (Fin 0) (antisymmetrization K V 0 x) =
      exteriorPower.zeroEquiv K V x := by
  sorry

-- antisymmetrization.test_projection_factor: projecting back multiplies by `3! = 6`; a
-- definition normalized by `1/d!` would give the identity.
example : exteriorProjection K V 3 ∘ₗ antisymmetrization K V 3 = (6 : K) • LinearMap.id := by
  sorry

-- antisymmetrization.test_char_two: over `ZMod 2`, `α₂ = 0` on `⋀²(ZMod 2) = 0`, yet the
-- Koszul-signed invariants of `(ZMod 2)^{⊗2}` are nonzero.
example : antisymmetrization (ZMod 2) (ZMod 2) 2 = 0 ∧
    (koszulRepresentation (ZMod 2) (ZMod 2) 2).invariants ≠ ⊥ := by
  sorry

end Koszul

section Averaging

variable {K G V W : Type*} [CommRing K] [Group G] [Fintype G]
  [AddCommGroup V] [Module K V] [AddCommGroup W] [Module K W]

/-- Invariants are exact when `|G|` is invertible: an equivariant surjection is
surjective on invariants, by averaging a preimage. -/
theorem invariants_map_surjective [Invertible (Fintype.card G : K)]
    {ρ : Representation K G V} {τ : Representation K G W} (f : V →ₗ[K] W)
    (hf : ∀ g, f ∘ₗ ρ g = τ g ∘ₗ f) (hs : Function.Surjective f) :
    ∀ w ∈ τ.invariants, ∃ v ∈ ρ.invariants, f v = w := by
  sorry

end Averaging

/-- Rational acyclicity: a finite group whose order is invertible in the
coefficients has no cohomology in positive degree. -/
theorem groupCohomology_isZero_of_invertible {k G : Type} [CommRing k] [Group G] [Fintype G]
    [Invertible (Fintype.card G : k)] (A : Rep k G) (n : ℕ) :
    CategoryTheory.Limits.IsZero (groupCohomology A (n + 1)) := by
  sorry

section TensorCharacter

variable {A M : Type*} [CommGroup A] [CommMonoid M]

/-- The tensor character `(a_i) ↦ ∏ χ(a_i)` on `A^m` is `χ` of the product. -/
theorem prod_character_eq_comp_prod (χ : A →* M) {m : ℕ} (a : Fin m → A) :
    ∏ i, χ (a i) = χ (∏ i, a i) := by
  sorry

/-- Hence it is trivial on the kernel of multiplication `A^m → A`. -/
theorem prod_character_eq_one_of_prod_eq_one (χ : A →* M) {m : ℕ} (a : Fin m → A)
    (h : ∏ i, a i = 1) : ∏ i, χ (a i) = 1 := by
  sorry

/-- Permuting the factors does not change the tensor character: there is no sign
on a tensor power of a degree-zero line. -/
theorem prod_character_perm (χ : A →* M) {m : ℕ} (a : Fin m → A) (σ : Perm (Fin m)) :
    ∏ i, χ (a (σ i)) = ∏ i, χ (a i) := by
  sorry

-- tensor-character-kernel: for `A = ℤˣ ≃ μ₂` and the sign character, `(−1, −1)` lies in
-- the kernel of multiplication and the tensor character is trivial on it.
example : ∏ i : Fin 2, (MonoidHom.id ℤˣ) (![-1, -1] i) = 1 := by
  sorry

end TensorCharacter

end TauCeti.RamifiedClassField
