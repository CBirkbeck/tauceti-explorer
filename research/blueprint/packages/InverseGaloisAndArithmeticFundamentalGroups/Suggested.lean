import Mathlib
import TauCeti.GroupTheory.SpecificGroups.Braid
import TauCeti.FieldTheory.FunctionField.Place.RatFunc.Order

/-!
# Inverse Galois theory and arithmetic fundamental groups: representative target signatures

The mathematical roadmap is `README.md`. This file records the light definitions and the theorem
signatures that can be stated against the pinned Mathlib and Tau Ceti; it is not an exhaustive
list of the targets of any layer, and every statement here is a suggested form. Heavy objects of
the roadmap (Galois algebras of schemes beyond fields, local systems, the pro-étale fundamental
group, tame fundamental groups, Hurwitz stacks and admissible covers) are README targets only.

Design choices.
* Specialization of a polynomial `p(T, Y) ∈ K(T)[Y]` at `t ∈ K` evaluates each coefficient with
  Mathlib's `RatFunc.eval`; that evaluation is total, returns `0` at a pole, and is a ring map only
  on rational functions whose reduced denominator does not vanish at `t` (`regularSubring`). The
  ring laws of `specialize` therefore carry regularity hypotheses.
* Branch tuples are functions `Fin r → G`; their product is the ordered product `g₀ g₁ ⋯ g_{r-1}`
  with Mathlib's multiplication, which on permutations is composition from right to left. The
  positive Hurwitz move replaces `(a, b)` by `(a b a⁻¹, a)` and generates a left action of
  `TauCeti.BraidGroup r`.
* The universal marked extension `U(G, c)` is a Mathlib `PresentedGroup`; the Schur multiplier is
  Mathlib's `groupHomology.H2` of the trivial representation `ℤ`.
* A realization of a finite group `G` over `K` is a finite Galois extension with a group
  isomorphism `Gal(L/K) ≃* G`; regular realizations over `K(T)` ask `K` to be algebraically closed
  in the extension field. The inverse Galois problem is a named proposition and is never a
  hypothesis of a theorem.
-/

namespace TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups

set_option autoImplicit false

noncomputable section

open Polynomial

universe u

/-! ## Layer IG.0: Galois algebras, local systems and pro-étale fundamental groups -/

section GaloisAlgebra

variable (K : Type*) [Field K] (A : Type*) [CommRing A] [Algebra K A]
  (H : Type*) [Group H] [MulSemiringAction H A] [SMulCommClass H K A]

/-- The map `A ⊗_K A → ∏_{h ∈ H} A`, `a ⊗ b ↦ (a · h(b))_h`, whose bijectivity is the torsor
condition for an `H`-Galois algebra (Layer IG.0, *Finite Galois algebras and torsors*). -/
def galoisTensorMap : TensorProduct K A A →ₐ[K] (H → A) :=
  Algebra.TensorProduct.lift (Pi.constAlgHom K H A)
    (AlgHom.pi (fun h : H => MulSemiringAction.toAlgHom K A h))
    (fun _ _ => Commute.all _ _)

/-- `A` is an `H`-Galois algebra over `K`: a nonzero finite étale `K`-algebra on which `H` acts by
`K`-algebra automorphisms such that the Galois tensor map is bijective. Nonzero-ness is part of
the definition: the zero algebra satisfies the tensor condition but has an empty geometric
fibre. -/
def IsGaloisAlgebra : Prop :=
  Nontrivial A ∧ Module.Finite K A ∧ Algebra.Etale K A ∧
    Function.Bijective (galoisTensorMap K A H)

end GaloisAlgebra

/-- A separable quadratic extension with its nontrivial automorphism is a `C₂`-Galois algebra:
here `ℚ(i)` inside `ℂ`, acted on by its Galois group. -/
example :
    IsGaloisAlgebra ℚ (IntermediateField.adjoin ℚ {Complex.I} : IntermediateField ℚ ℂ)
      ((IntermediateField.adjoin ℚ {Complex.I} : IntermediateField ℚ ℂ) ≃ₐ[ℚ]
        (IntermediateField.adjoin ℚ {Complex.I} : IntermediateField ℚ ℂ)) := sorry

/-- A finite Galois field extension `L/K` is a `Gal(L/K)`-Galois algebra. -/
theorem isGaloisAlgebra_of_isGalois (K L : Type*) [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L] : IsGaloisAlgebra K L (L ≃ₐ[K] L) := sorry

/-! ## Layer IG.1: arithmetic fundamental groups, inertia and specialization

The objects of this layer (arithmetic and tame fundamental groups, inertia groups of covers,
specialization maps) are built on the étale fundamental group of a scheme, which is not available
at the pinned libraries; they are README targets only. -/

/-! ## Layer IG.2: Hilbert irreducibility and specialization -/

namespace RationalSpecialization

variable {K : Type*} [Field K]

/-- Rational functions regular at `t`: the valuation ring of Tau Ceti's finite place of `K(T)` at
the irreducible polynomial `T − t`. -/
def regularSubring (K : Type*) [Field K] (t : K) : Subring (RatFunc K) :=
  (TauCeti.Place.adicOfIrreducible (Polynomial.irreducible_X_sub_C t)).integers.toSubring

/-- Membership is decided by the reduced denominator (`TauCeti.Place.valuation_ofIrreducible_le_one_iff`
for `q = T − t`). -/
theorem mem_regularSubring (t : K) (f : RatFunc K) :
    f ∈ regularSubring K t ↔ f.denom.eval t ≠ 0 := sorry

-- The zero function is regular everywhere (`denom 0 = 1`).
example : (0 : RatFunc ℚ) ∈ regularSubring ℚ 0 := zero_mem _

theorem algebraMap_mem_regularSubring (t : K) (p : K[X]) :
    algebraMap K[X] (RatFunc K) p ∈ regularSubring K t := sorry

-- A removable singularity is regular: `(T² − 1)/(T − 1) = T + 1` at `t = 1`.
example : ((RatFunc.X ^ 2 - 1) / (RatFunc.X - 1) : RatFunc ℚ) ∈ regularSubring ℚ 1 := sorry

-- A genuine pole is not: `T⁻¹` at `t = 0`.
example : (RatFunc.X⁻¹ : RatFunc ℚ) ∉ regularSubring ℚ 0 := sorry

/-- Evaluation at `t` as a ring homomorphism on the regular subring. -/
def evalRegular (t : K) : regularSubring K t →+* K where
  toFun f := RatFunc.eval (RingHom.id K) t f.val
  map_zero' := sorry
  map_one' := sorry
  map_add' := sorry
  map_mul' := sorry

theorem evalRegular_polynomial (t : K) (p : K[X]) :
    evalRegular t ⟨algebraMap K[X] (RatFunc K) p, algebraMap_mem_regularSubring t p⟩ =
      p.eval t := sorry

theorem evalRegular_surjective (t : K) : Function.Surjective (evalRegular t) := sorry

/-- Coefficientwise specialization `p(T, Y) ↦ p(t, Y)`, total as a function. -/
def specialize (t : K) (p : (RatFunc K)[X]) : K[X] :=
  p.sum fun n c => monomial n (RatFunc.eval (RingHom.id K) t c)

theorem coeff_specialize (t : K) (p : (RatFunc K)[X]) (n : ℕ) :
    (specialize t p).coeff n = RatFunc.eval (RingHom.id K) t (p.coeff n) := sorry

theorem specialize_map_regular (t : K) (p : (regularSubring K t)[X]) :
    specialize t (p.map (regularSubring K t).subtype) = p.map (evalRegular t) := sorry

theorem specialize_add (t : K) (p q : (RatFunc K)[X])
    (hp : ∀ n, (p.coeff n).denom.eval t ≠ 0) (hq : ∀ n, (q.coeff n).denom.eval t ≠ 0) :
    specialize t (p + q) = specialize t p + specialize t q := sorry

theorem specialize_mul (t : K) (p q : (RatFunc K)[X])
    (hp : ∀ n, (p.coeff n).denom.eval t ≠ 0) (hq : ∀ n, (q.coeff n).denom.eval t ≠ 0) :
    specialize t (p * q) = specialize t p * specialize t q := sorry

-- `Y² − T` specializes at `t = 2` to `Y² − 2`.
example : specialize (2 : ℚ) (X ^ 2 - C RatFunc.X) = X ^ 2 - C 2 := sorry

-- Without regularity, multiplicativity fails: `T · T⁻¹ = 1` but evaluation at the pole gives `0`.
example : specialize (0 : ℚ) (C (RatFunc.X : RatFunc ℚ) * C RatFunc.X⁻¹) ≠
    specialize 0 (C RatFunc.X) * specialize 0 (C RatFunc.X⁻¹) := sorry

/-- Product, with repetitions, of the reduced denominators of the nonzero coefficients. -/
def denominatorProduct (p : (RatFunc K)[X]) : K[X] :=
  ∏ n ∈ p.support, (p.coeff n).denom

-- Repeated poles are counted: `T⁻¹ Y + T⁻¹` has denominator product `T²`.
example : denominatorProduct (C (RatFunc.X⁻¹ : RatFunc ℚ) * X + C RatFunc.X⁻¹) = X ^ 2 := sorry

theorem denominatorProduct_ne_zero (p : (RatFunc K)[X]) : denominatorProduct p ≠ 0 := sorry

theorem denominatorProduct_eval_ne_zero_iff (t : K) (p : (RatFunc K)[X]) :
    (denominatorProduct p).eval t ≠ 0 ↔ ∀ n, (p.coeff n).denom.eval t ≠ 0 := sorry

theorem natDegree_specialize (t : K) (p : (RatFunc K)[X])
    (h : RatFunc.eval (RingHom.id K) t p.leadingCoeff ≠ 0) :
    (specialize t p).natDegree = p.natDegree := sorry

/-- The guard: if `(denominatorProduct p · num(lc p))(t) ≠ 0`, every coefficient is regular at `t`
and the degree is preserved. -/
theorem specialization_guard (t : K) (p : (RatFunc K)[X])
    (h : (denominatorProduct p * p.leadingCoeff.num).eval t ≠ 0) :
    (∀ n, (p.coeff n).denom.eval t ≠ 0) ∧ (specialize t p).natDegree = p.natDegree := sorry

theorem finite_bad_specializations (p : (RatFunc K)[X]) (hp : p ≠ 0) :
    {t : K | ¬ ((∀ n, (p.coeff n).denom.eval t ≠ 0) ∧
      (specialize t p).natDegree = p.natDegree)}.Finite := sorry

/-- Over an infinite field one can avoid any finite set while keeping all coefficients regular
and all degrees, simultaneously for a finite family. -/
theorem exists_simultaneous_specialization [Infinite K] (s : Finset (RatFunc K)[X])
    (hs : ∀ p ∈ s, p ≠ 0) (a : Finset K) :
    ∃ t : K, t ∉ a ∧ ∀ p ∈ s,
      (∀ n, (p.coeff n).denom.eval t ≠ 0) ∧ (specialize t p).natDegree = p.natDegree := sorry

-- Over `𝔽₂` the infinite-field hypothesis is essential: `(T² − T) Y + 1` loses its degree at
-- both points of `𝔽₂`.
example : ∀ t : ZMod 2,
    (specialize t (C (RatFunc.X ^ 2 - RatFunc.X) * X + 1)).natDegree = 0 := sorry

end RationalSpecialization

open RationalSpecialization in
/-- `K` is Hilbertian: every finite family of irreducible separable polynomials of positive degree
in `K(T)[Y]` has a common specialization at some `t ∈ K` with regular coefficients, the same
degrees, and irreducible values (Layer IG.2, *Hilbert subsets and Hilbertian fields*, polynomial
form on the affine line). -/
def IsHilbertian (K : Type*) [Field K] : Prop :=
  ∀ s : Finset (RatFunc K)[X], (∀ p ∈ s, Irreducible p ∧ p.Separable ∧ 0 < p.natDegree) →
    ∃ t : K, ∀ p ∈ s, (∀ n, (p.coeff n).denom.eval t ≠ 0) ∧
      (specialize t p).natDegree = p.natDegree ∧ Irreducible (specialize t p)

/-- Hilbert's irreducibility theorem over number fields (Serre, *Topics in Galois Theory*,
§3.4). -/
theorem isHilbertian_of_numberField (K : Type*) [Field K] [NumberField K] : IsHilbertian K :=
  sorry

open RationalSpecialization in
/-- Hilbert subsets of a Hilbertian field are infinite: for each finite family there are
infinitely many good parameters. -/
theorem IsHilbertian.infinite_good {K : Type*} [Field K] (hK : IsHilbertian K)
    (s : Finset (RatFunc K)[X]) (hs : ∀ p ∈ s, Irreducible p ∧ p.Separable ∧ 0 < p.natDegree) :
    {t : K | ∀ p ∈ s, (∀ n, (p.coeff n).denom.eval t ≠ 0) ∧
      (specialize t p).natDegree = p.natDegree ∧ Irreducible (specialize t p)}.Infinite :=
  sorry

-- `ℂ` is not Hilbertian: `Y² − T` is irreducible over `ℂ(T)` but every specialization splits.
example : ¬ IsHilbertian ℂ := sorry

/-! ## Layer IG.3: branch cycles, rigidity, braid orbits and lifting invariants -/

/-- A branch tuple of length `r` in `G`. -/
abbrev BranchTuple (r : ℕ) (G : Type*) := Fin r → G

namespace BranchTuple

variable {G : Type*} [Group G] {r : ℕ}

/-- The ordered product `t 0 * t 1 * ⋯ * t (r - 1)`. -/
def product (t : BranchTuple r G) : G := (List.ofFn t).prod

/-- The subgroup generated by the entries. -/
def generated (t : BranchTuple r G) : Subgroup G := Subgroup.closure (Set.range t)

-- In `S₃`, `((0 1), (1 2), ((0 1)(1 2))⁻¹)` has product one and generates.
example : product ![Equiv.swap (0 : Fin 3) 1, Equiv.swap (1 : Fin 3) 2,
      (Equiv.swap (0 : Fin 3) 1 * Equiv.swap (1 : Fin 3) 2)⁻¹] = 1 ∧
    generated ![Equiv.swap (0 : Fin 3) 1, Equiv.swap (1 : Fin 3) 2,
      (Equiv.swap (0 : Fin 3) 1 * Equiv.swap (1 : Fin 3) 2)⁻¹] = ⊤ := sorry

-- Product one does not imply generation: `((0 1), (0 1))`.
example : product ![Equiv.swap (0 : Fin 3) 1, Equiv.swap (0 : Fin 3) 1] = 1 ∧
    generated ![Equiv.swap (0 : Fin 3) 1, Equiv.swap (0 : Fin 3) 1] ≠ ⊤ := sorry

end BranchTuple

namespace NielsenClass

variable {G : Type*} [Group G]

/-- Simultaneous conjugation of branch tuples. -/
def innerRelation (r : ℕ) (G : Type*) [Group G] : Setoid (BranchTuple r G) where
  r t t' := ∃ g : G, ∀ i, t' i = g * t i * g⁻¹
  iseqv := sorry

/-- Inner Nielsen classes: tuples up to simultaneous conjugation in `G`. -/
def inner (r : ℕ) (G : Type*) [Group G] : Type _ := Quotient (innerRelation r G)

/-- Conjugation by the normaliser of a chosen permutation representation `ρ : G →* S_d`. -/
def absoluteRelation {r d : ℕ} (ρ : G →* Equiv.Perm (Fin d)) : Setoid (BranchTuple r G) where
  r t t' := ∃ s ∈ Subgroup.normalizer (ρ.range : Set (Equiv.Perm (Fin d))),
    ∀ i, ρ (t' i) = s * ρ (t i) * s⁻¹
  iseqv := sorry

/-- Absolute Nielsen classes for a specified faithful permutation representation. -/
def absolute {r d : ℕ} (ρ : G →* Equiv.Perm (Fin d)) : Type _ :=
  Quotient (absoluteRelation (r := r) ρ)

theorem inner_preserves {r : ℕ} (t t' : BranchTuple r G) (h : (innerRelation r G) t t') :
    (BranchTuple.product t = 1 ↔ BranchTuple.product t' = 1) ∧
      (BranchTuple.generated t = ⊤ ↔ BranchTuple.generated t' = ⊤) := sorry

end NielsenClass

namespace HurwitzMove

variable {G : Type*} [Group G] {r : ℕ}

/-- The positive Hurwitz move at position `i`: `(a, b) ↦ (a b a⁻¹, a)`. -/
def apply (i : Fin (r - 1)) (t : BranchTuple r G) : BranchTuple r G :=
  Function.update (Function.update t (TauCeti.BraidGroup.strand i)
      (t (TauCeti.BraidGroup.strand i) * t (TauCeti.BraidGroup.strandSucc i) *
        (t (TauCeti.BraidGroup.strand i))⁻¹))
    (TauCeti.BraidGroup.strandSucc i) (t (TauCeti.BraidGroup.strand i))

/-- The inverse move `(a, b) ↦ (b, b⁻¹ a b)`. -/
def inverse (i : Fin (r - 1)) (t : BranchTuple r G) : BranchTuple r G :=
  Function.update (Function.update t (TauCeti.BraidGroup.strand i)
      (t (TauCeti.BraidGroup.strandSucc i)))
    (TauCeti.BraidGroup.strandSucc i)
    ((t (TauCeti.BraidGroup.strandSucc i))⁻¹ * t (TauCeti.BraidGroup.strand i) *
      t (TauCeti.BraidGroup.strandSucc i))

/-- The move as a permutation of tuples. -/
def equiv (i : Fin (r - 1)) : Equiv.Perm (BranchTuple r G) where
  toFun := apply i
  invFun := inverse i
  left_inv := sorry
  right_inv := sorry

-- `((0 1), (1 2)) ↦ ((0 2), (0 1))`: the move is not the plain swap.
example : apply (r := 2) 0 ![Equiv.swap (0 : Fin 3) 1, Equiv.swap (1 : Fin 3) 2] =
    ![Equiv.swap (0 : Fin 3) 2, Equiv.swap (0 : Fin 3) 1] := sorry

end HurwitzMove

namespace HurwitzAction

variable {G : Type*} [Group G]

/-- The Hurwitz action of the braid group on branch tuples, through the presentation of
`TauCeti.BraidGroup`. -/
def action (r : ℕ) (G : Type*) [Group G] :
    TauCeti.BraidGroup r →* Equiv.Perm (BranchTuple r G) :=
  TauCeti.BraidGroup.lift (fun i => HurwitzMove.equiv i) (fun _ => sorry) (fun _ => sorry)

theorem action_sigma {r : ℕ} (i : Fin (r - 1)) :
    action r G (TauCeti.BraidGroup.sigma i) = HurwitzMove.equiv i := by
  simp [action]

theorem product_action {r : ℕ} (b : TauCeti.BraidGroup r) (t : BranchTuple r G) :
    BranchTuple.product (action r G b t) = BranchTuple.product t := sorry

theorem generated_action {r : ℕ} (b : TauCeti.BraidGroup r) (t : BranchTuple r G) :
    BranchTuple.generated (action r G b t) = BranchTuple.generated t := sorry

end HurwitzAction

/-- Surjective homomorphisms from the free group of rank `r`. -/
abbrev SurjectiveFreeHom (r : ℕ) (G : Type*) [Group G] :=
  {φ : FreeGroup (Fin r) →* G // Function.Surjective φ}

namespace ExteriorEpi

variable {G : Type*} [Group G]

/-- Equality up to conjugation in the target. -/
def relation (r : ℕ) (G : Type*) [Group G] : Setoid (SurjectiveFreeHom r G) where
  r φ ψ := ∃ g : G, ∀ x, ψ.val x = g * φ.val x * g⁻¹
  iseqv := sorry

/-- Generating tuples are surjections from the free group. -/
def ofTuple (r : ℕ) (G : Type*) [Group G] :
    {t : BranchTuple r G // BranchTuple.generated t = ⊤} ≃ SurjectiveFreeHom r G where
  toFun t := ⟨FreeGroup.lift t.val, sorry⟩
  invFun φ := ⟨fun i => φ.val (FreeGroup.of i), sorry⟩
  left_inv := sorry
  right_inv := sorry

end ExteriorEpi

/-- Exterior epimorphisms `F_r ↠ G` modulo `Inn(G)`. -/
abbrev ExteriorEpi (r : ℕ) (G : Type*) [Group G] := Quotient (ExteriorEpi.relation r G)

/-- Equality up to an automorphism of the target. -/
def TSystem.relation (r : ℕ) (G : Type*) [Group G] : Setoid (SurjectiveFreeHom r G) where
  r φ ψ := ∃ α : MulAut G, ∀ x, ψ.val x = α (φ.val x)
  iseqv := sorry

/-- `T_r`-systems: surjections `F_r ↠ G` modulo `Aut(G)`. -/
abbrev TSystem (r : ℕ) (G : Type*) [Group G] := Quotient (TSystem.relation r G)

/-- The quotient of exterior epimorphisms onto `T`-systems. -/
def TSystem.quotient (r : ℕ) (G : Type*) [Group G] : ExteriorEpi r G → TSystem r G :=
  Quotient.map' id fun φ ψ h => by
    obtain ⟨g, hg⟩ := h
    exact ⟨MulAut.conj g, fun x => by simpa [MulAut.conj_apply] using hg x⟩

/-- `d(G)` is Mathlib's `Group.rank`: a surjection `F_r ↠ G` exists exactly when `r ≥ d(G)`. -/
theorem nonempty_surjectiveFreeHom_iff (G : Type*) [Group G] [Group.FG G] (r : ℕ) :
    Nonempty (SurjectiveFreeHom r G) ↔ Group.rank G ≤ r := sorry

-- `d(C₂ × C₂) = 2`, and there is no exterior epimorphism from `F₁`.
example : Group.rank (Multiplicative (ZMod 2) × Multiplicative (ZMod 2)) = 2 ∧
    IsEmpty (ExteriorEpi 1 (Multiplicative (ZMod 2) × Multiplicative (ZMod 2))) := sorry

/-- Chen's transitivity conjecture, a named open statement: for every finite `G` and
`r ≥ d(G) + 1`, any two surjections `F_r ↠ G` differ by an automorphism of `F_r` and conjugation
in `G`. No theorem of the roadmap assumes it. -/
def ChenTransitivity : Prop :=
  ∀ (G : Type) [Group G] [Finite G] (r : ℕ), Group.rank G + 1 ≤ r →
    ∀ φ ψ : SurjectiveFreeHom r G, ∃ (α : MulAut (FreeGroup (Fin r))) (g : G),
      ∀ x, ψ.val x = g * φ.val (α x) * g⁻¹

section Rigidity

variable {G : Type*} [Group G]

/-- A conjugacy class is rational if it is stable under every power prime to `|G|`. -/
def IsRationalClass (C : ConjClasses G) : Prop :=
  ∀ m : ℕ, Nat.Coprime m (Nat.card G) → ∀ x ∈ C.carrier, x ^ m ∈ C.carrier

/-- A tuple of classes is rigid if the generating product-one tuples with entries in the classes
form exactly one orbit under simultaneous conjugation. -/
def IsRigid {r : ℕ} (C : Fin r → ConjClasses G) : Prop :=
  (∃ t : BranchTuple r G, (∀ i, t i ∈ (C i).carrier) ∧ BranchTuple.product t = 1 ∧
      BranchTuple.generated t = ⊤) ∧
    ∀ t t' : BranchTuple r G,
      (∀ i, t i ∈ (C i).carrier) → BranchTuple.product t = 1 → BranchTuple.generated t = ⊤ →
      (∀ i, t' i ∈ (C i).carrier) → BranchTuple.product t' = 1 →
      BranchTuple.generated t' = ⊤ → ∃ g : G, ∀ i, t' i = g * t i * g⁻¹

end Rigidity

/-- `G` is the Galois group of a regular extension of `K(T)`: a finite Galois extension `L` of
`K(T)` with group `G` in which `K` is algebraically closed. -/
def HasRegularRealization (K : Type u) [Field K] (G : Type*) [Group G] : Prop :=
  ∃ (L : Type u) (_ : Field L) (_ : Algebra (RatFunc K) L) (_ : Algebra K L)
    (_ : IsScalarTower K (RatFunc K) L),
    FiniteDimensional (RatFunc K) L ∧ IsGalois (RatFunc K) L ∧
      Nonempty ((L ≃ₐ[RatFunc K] L) ≃* G) ∧
      ∀ x : L, IsAlgebraic K x → x ∈ Set.range (algebraMap K L)

/-- Rational rigidity (Serre, *Topics in Galois Theory*, Theorem 8.1.1): a centreless finite group
with a rigid tuple of nontrivial rational classes is the Galois group of a regular extension of
`K(T)` for every field `K` of characteristic zero. -/
theorem hasRegularRealization_of_rigid (K : Type u) [Field K] [CharZero K] (G : Type*) [Group G]
    [Finite G] (hZ : Subgroup.center G = ⊥) {r : ℕ} (C : Fin r → ConjClasses G)
    (hrat : ∀ i, IsRationalClass (C i)) (hne : ∀ i, C i ≠ ConjClasses.mk 1) (hrig : IsRigid C) :
    HasRegularRealization K G := sorry

-- The classes (transposition, transposition, 3-cycle) of `S₃` are rigid.
example : IsRigid ![ConjClasses.mk (Equiv.swap (0 : Fin 3) 1),
    ConjClasses.mk (Equiv.swap (0 : Fin 3) 1),
    ConjClasses.mk (Equiv.swap (0 : Fin 3) 1 * Equiv.swap (1 : Fin 3) 2)] := sorry

namespace ReducedSchur

variable {G : Type} [Group G]

/-- The Schur multiplier `M(G) = H₂(G, ℤ)`. -/
abbrev SchurMultiplier (G : Type) [Group G] :=
  groupHomology.H2 (Rep.trivial ℤ G ℤ)

/-- The oriented commuting-pair cycle `[x | y] − [y | x]`. -/
def commutingCycle (x y : G) (h : Commute x y) :
    groupHomology.cycles₂ (Rep.trivial ℤ G ℤ) :=
  ⟨Finsupp.single (x, y) 1 - Finsupp.single (y, x) 1, sorry⟩

/-- The homological commutator `⟨x, y⟩ ∈ M(G)` of commuting elements. -/
def homologicalCommutator (x y : G) (h : Commute x y) : SchurMultiplier G :=
  groupHomology.H2π (Rep.trivial ℤ G ℤ) (commutingCycle x y h)

/-- The Schur relations `Q_c`: the subgroup generated by `⟨x, y⟩` with `x ∈ c` and `y` commuting
with `x`. -/
def schurRelations (c : Set G) : AddSubgroup (SchurMultiplier G) :=
  AddSubgroup.closure
    {z | ∃ x ∈ c, ∃ (y : G) (h : Commute x y), z = homologicalCommutator x y h}

/-- The reduced Schur multiplier `M(G, c) = M(G) / Q_c`. -/
abbrev reducedMultiplier (c : Set G) := SchurMultiplier G ⧸ schurRelations c

theorem schurRelations_empty : schurRelations (∅ : Set G) = ⊥ := sorry

/-- The relations `[x][y][x]⁻¹ = [x y x⁻¹]` of the universal marked extension. -/
def universalRelations (c : Set G) (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) :
    Set (FreeGroup c) :=
  {w | ∃ x y : c, w = FreeGroup.of x * FreeGroup.of y * (FreeGroup.of x)⁻¹ *
    (FreeGroup.of ⟨x.1 * y.1 * x.1⁻¹, hc x.1 y.1 y.2⟩)⁻¹}

/-- The universal marked central extension `U(G, c)`. -/
abbrev universalMarked (c : Set G) (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) :=
  PresentedGroup (universalRelations c hc)

/-- The projection `U(G, c) → G`, `[x] ↦ x`. -/
def universalProjection (c : Set G) (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) :
    universalMarked c hc →* G :=
  PresentedGroup.toGroup (f := fun x : c => x.1) sorry

/-- The conjugacy classes meeting `c`, the index set `D = c/G` of the class degree. -/
def classSet (c : Set G) : Set (ConjClasses G) := ConjClasses.mk '' c

/-- The image in `G^{ab}` of a conjugacy class. -/
def classAbelianization (d : ConjClasses G) : Abelianization G :=
  Quotient.liftOn' d (fun x => Abelianization.of x) (fun _ _ h => by
    obtain ⟨u, rfl⟩ := isConj_iff.mp h
    simp)

/-- The class degree map `δ : ℤ^D → G^{ab}`, `e_d ↦` the image of a representative of `d`. -/
def classDegree (c : Set G) : (classSet c →₀ ℤ) →+ Additive (Abelianization G) :=
  Finsupp.liftAddHom fun d => zmultiplesHom _ (Additive.ofMul (classAbelianization d.1))

-- For `G = C₂` and `c` its nontrivial element, `δ(e_c)` is the nontrivial element of `G^{ab}`.
example : classDegree ({Multiplicative.ofAdd (1 : ZMod 2)} : Set (Multiplicative (ZMod 2)))
    (Finsupp.single ⟨ConjClasses.mk (Multiplicative.ofAdd (1 : ZMod 2)), ⟨_, rfl, rfl⟩⟩ 1) ≠ 0 :=
  sorry

/-- The kernel `K(G, c)` of the universal marked extension. -/
def universalKernel (c : Set G) (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) :
    Subgroup (universalMarked c hc) :=
  (universalProjection c hc).ker

theorem universalProjection_surjective (c : Set G) (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c)
    (hgen : Subgroup.closure c = ⊤) : Function.Surjective (universalProjection c hc) := sorry

theorem universalKernel_le_center (c : Set G) (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) :
    universalKernel c hc ≤ Subgroup.center (universalMarked c hc) := sorry

/-- The twist `X⟨−1⟩ = Map_B(T, X)` of a `B`-set by a `B`-torsor `T`. -/
abbrev cyclotomicTwist (B T X : Type*) [Group B] [MulAction B T] [MulAction B X] :=
  T →[B] X

/-- For a simply transitive `T`, evaluation at a point identifies the twist with `X`. -/
theorem cyclotomicTwist_eval_bijective (B T X : Type*) [Group B] [MulAction B T] [MulAction B X]
    (hT : ∀ t₁ t₂ : T, ∃! b : B, b • t₁ = t₂) (t₀ : T) :
    Function.Bijective (fun f : cyclotomicTwist B T X => f t₀) := sorry

end ReducedSchur

/-- The lifting invariant of a branch tuple: the ordered product of the marked generators in
`U(G, c)`. -/
def LiftingInvariant.tuple {G : Type} [Group G] (c : Set G)
    (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) {r : ℕ} (t : Fin r → c) :
    ReducedSchur.universalMarked c hc :=
  (List.ofFn fun i => PresentedGroup.of (t i)).prod

/-! ## Layer IG.4: embedding problems, Shafarevich's theorem and unramified Γ-groups -/

/-- The Fitting subgroup: the subgroup generated by all nilpotent normal subgroups. -/
def fittingSubgroup (G : Type*) [Group G] : Subgroup G :=
  sSup {N : Subgroup G | N.Normal ∧ Group.IsNilpotent N}

namespace fittingSubgroup

theorem normal (G : Type*) [Group G] : (fittingSubgroup G).Normal := sorry

theorem isNilpotent (G : Type*) [Group G] [Finite G] : Group.IsNilpotent (fittingSubgroup G) :=
  sorry

theorem le_of_normal_of_isNilpotent {G : Type*} [Group G] (N : Subgroup G) [N.Normal]
    [Group.IsNilpotent N] : N ≤ fittingSubgroup G := sorry

/-- For a nontrivial finite solvable group, `Φ(G) < F(G)` (Huppert, as used by Schmidt and
Wingberg). -/
theorem frattini_lt (G : Type*) [Group G] [Finite G] [Nontrivial G] [Group.IsSolvable G] :
    frattini G < fittingSubgroup G := sorry

/-- The Fitting subgroup of a nontrivial finite solvable group has a proper supplement. -/
theorem exists_proper_supplement (G : Type*) [Group G] [Finite G] [Nontrivial G]
    [Group.IsSolvable G] : ∃ U : Subgroup G, U < ⊤ ∧ fittingSubgroup G ⊔ U = ⊤ := sorry

end fittingSubgroup

-- An abelian group is its own Fitting subgroup.
example (G : Type*) [CommGroup G] [Finite G] : fittingSubgroup G = ⊤ := sorry

-- `F(S₃) = A₃` has order three and is supplemented by a transposition.
example : Nat.card (fittingSubgroup (Equiv.Perm (Fin 3))) = 3 := sorry

-- `S₅` has trivial Fitting and Frattini subgroups.
example : fittingSubgroup (Equiv.Perm (Fin 5)) = ⊥ ∧ frattini (Equiv.Perm (Fin 5)) = ⊥ := sorry

/-- Shafarevich's theorem: every finite solvable group is a Galois group over every number
field. -/
theorem shafarevich (K : Type u) [Field K] [NumberField K] (G : Type*) [Group G] [Finite G]
    [Group.IsSolvable G] :
    ∃ (L : Type u) (_ : Field L) (_ : Algebra K L),
      FiniteDimensional K L ∧ IsGalois K L ∧ Nonempty ((L ≃ₐ[K] L) ≃* G) := sorry

/-! ## Layer IG.5: configuration spaces and Hurwitz moduli -/

/-- Ordered configurations of `n` distinct points of `X`. -/
abbrev OrderedConfiguration (X : Type*) (n : ℕ) := {f : Fin n → X // Function.Injective f}

/-- Unordered configurations: `n`-element subsets. -/
abbrev UnorderedConfiguration (X : Type*) (n : ℕ) := {s : Finset X // s.card = n}

/-- Forgetting the order of an ordered configuration. -/
def OrderedConfiguration.forget {X : Type*} [DecidableEq X] {n : ℕ}
    (f : OrderedConfiguration X n) : UnorderedConfiguration X n :=
  ⟨Finset.univ.image f.val, sorry⟩

-- `n` points of a set with fewer than `n` elements have no configuration.
example : IsEmpty (OrderedConfiguration (Fin 2) 3) := sorry

/-- The lifted affine coordinate group: triples `(a, b, d)` with `d² = aⁿ`, acting by
`x ↦ a x + b` on the line and by `y ↦ d y` on the hyperelliptic coordinate. -/
structure LiftedAffineGroup (n : ℕ) (R : Type*) [CommRing R] where
  /-- The multiplier of the affine coordinate. -/
  a : Rˣ
  /-- The translation of the affine coordinate. -/
  b : R
  /-- The scalar on the square-root coordinate. -/
  d : Rˣ
  square_eq : d ^ 2 = a ^ n

namespace LiftedAffineGroup

/-- Composition of lifted affine maps. -/
def mul {n : ℕ} {R : Type*} [CommRing R] (g h : LiftedAffineGroup n R) :
    LiftedAffineGroup n R where
  a := g.a * h.a
  b := (g.a : R) * h.b + g.b
  d := g.d * h.d
  square_eq := by rw [mul_pow, mul_pow, g.square_eq, h.square_eq]

/-- For odd `n`, `(a, b, d) ↦ (d / a^{(n-1)/2}, b)` identifies the group with `Rˣ × R`. -/
theorem nonempty_equiv_of_odd {n : ℕ} (hn : Odd n) (R : Type*) [CommRing R] :
    Nonempty (LiftedAffineGroup n R ≃ Rˣ × R) := sorry

-- For even `n` the fibre over `(a, b)` contains both square roots: `(1, 0, ±1)` for `n = 2`.
example : (⟨1, 0, 1, by simp⟩ : LiftedAffineGroup 2 ℚ) ≠ ⟨1, 0, -1, by simp⟩ := by
  intro h
  have := congrArg (fun g : LiftedAffineGroup 2 ℚ => (g.d : ℚ)) h
  norm_num at this

end LiftedAffineGroup

/-! ## Layer IG.6: realizations and the inverse Galois problem -/

/-- A realization of `G` by a finite Galois extension `L/K`. -/
structure FieldRealization (K L G : Type*) [Field K] [Field L] [Algebra K L] [Group G] where
  finiteDimensional : FiniteDimensional K L
  isGalois : IsGalois K L
  groupEquiv : (L ≃ₐ[K] L) ≃* G

/-- A realization of `G` by the splitting field of a separable polynomial. -/
structure PolynomialRealization {K : Type*} [Field K] (f : K[X]) (G : Type*) [Group G] where
  separable : f.Separable
  groupEquiv : f.Gal ≃* G

namespace FieldRealization

theorem degree {K L G : Type*} [Field K] [Field L] [Algebra K L] [Group G]
    (c : FieldRealization K L G) : Module.finrank K L = Nat.card G := sorry

/-- Transport of a realization along a `K`-isomorphism of fields. -/
def transport {K L L' G : Type*} [Field K] [Field L] [Field L'] [Algebra K L] [Algebra K L']
    [Group G] (c : FieldRealization K L G) (e : L ≃ₐ[K] L') : FieldRealization K L' G where
  finiteDimensional := sorry
  isGalois := sorry
  groupEquiv := (AlgEquiv.autCongr e).symm.trans c.groupEquiv

end FieldRealization

/-- The splitting field of a polynomial realization is a field realization. -/
def PolynomialRealization.toField {K G : Type*} [Field K] [Group G] {f : K[X]}
    (c : PolynomialRealization f G) : FieldRealization K f.SplittingField G where
  finiteDimensional := inferInstance
  isGalois := IsGalois.of_separable_splitting_field c.separable
  groupEquiv := c.groupEquiv

-- The trivial group is realized by `K` itself.
example (K : Type*) [Field K] : Nonempty (FieldRealization K K PUnit) := sorry

-- `(X² − 2)(X² − 3)` realizes `C₂ × C₂` over `ℚ`; reducible polynomials are allowed.
example : Nonempty (PolynomialRealization ((X ^ 2 - C 2) * (X ^ 2 - C 3) : ℚ[X])
    (Multiplicative (ZMod 2) × Multiplicative (ZMod 2))) := sorry

/-- The splitting field `ℚ(2^{1/4}, i)` of `X⁴ − 2` inside `ℂ`. -/
def dihedralEightField : IntermediateField ℚ ℂ :=
  IntermediateField.adjoin ℚ {((Real.sqrt (Real.sqrt 2) : ℝ) : ℂ), Complex.I}

/-- `X⁴ − 2` realizes the dihedral group of order eight over `ℚ`. -/
theorem dihedral_realization :
    Nonempty (PolynomialRealization (X ^ 4 - C 2 : ℚ[X]) (DihedralGroup 4)) := sorry

-- The splitting field has degree eight.
example : Module.finrank ℚ dihedralEightField = 8 := sorry

/-- The inverse Galois problem over `ℚ`, a named open statement. -/
def InverseGaloisProblem : Prop :=
  ∀ (G : Type) [Group G] [Finite G],
    ∃ (L : Type) (_ : Field L) (_ : Algebra ℚ L),
      FiniteDimensional ℚ L ∧ IsGalois ℚ L ∧ Nonempty ((L ≃ₐ[ℚ] L) ≃* G)

/-- The regular inverse Galois problem over `ℚ(T)`, a named open statement. -/
def RegularInverseGaloisProblem : Prop :=
  ∀ (G : Type) [Group G] [Finite G], HasRegularRealization ℚ G

/-- A regular realization over `ℚ(T)` gives a realization over `ℚ`, by Hilbert irreducibility. -/
theorem realization_of_hasRegularRealization (G : Type) [Group G] [Finite G]
    (h : HasRegularRealization ℚ G) :
    ∃ (L : Type) (_ : Field L) (_ : Algebra ℚ L),
      FiniteDimensional ℚ L ∧ IsGalois ℚ L ∧ Nonempty ((L ≃ₐ[ℚ] L) ≃* G) := sorry

theorem inverseGaloisProblem_of_regular (h : RegularInverseGaloisProblem) :
    InverseGaloisProblem := fun G _ _ => realization_of_hasRegularRealization G (h G)

/-
Not stated in this file, because the objects they concern are not available at the pinned
libraries; the README states each of them in full:
Layer IG.0: `LatticeScheme`, `AdicLocalSystem`, `IsogenyLocalSystem`, `RationalLocalSystem`,
`IsNoohiGroup`, `InfiniteGaloisCategory`, `ProetaleFundamentalGroup`, and the identification of the
fundamental groups of a field and of `𝔾_m`.
Layer IG.1: the arithmetic exact sequence, `SchemeInertia`, `TameFundamentalGroup`,
`PrimeToFundamentalGroup`, `TameTangentialFiber`, the specialization theorems,
`IsArithmeticRepresentation`, and the homogeneous-space fundamental group.
Layer IG.2: Hilbert subsets of varieties, `ThinSet`, full-group specialization of regular covers,
local conditions, norm pullbacks, Frattini detection for profinite groups, the integral thin-set
count and normal subgroups of absolute Galois groups.
Layer IG.3: `ArtinNeighborhood`, `BranchCover`, `CoverDescent`, the braid-orbit monoid, the
reduced Schur cover and the marked fibre product, the unit action, and stable classification.
Layer IG.4: proper embedding problems with local prescriptions, Galois localization kernels,
finite Poitou–Tate, Grunwald–Wang, free operator shrinking, unramified `Γ`-groups and Property E.
Layer IG.5: topological and arithmetic Hurwitz spaces, tame and admissible `G`-covers, the
cohomological comparisons, component invariants and patching.
Layer IG.6: specialization of realizations, generic-polynomial universality.
-/

end

end TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups
