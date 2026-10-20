import Mathlib
import TauCeti.RingTheory.Valuation.Discrete.Order
import TauCeti.FieldTheory.FunctionField.Divisor.Eval
import TauCeti.FieldTheory.FunctionField.Place.RatFunc.Basic
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Transvection

/-!
# K2SymbolsBrauer: representative target signatures

This file is not the roadmap: `README.md` is, and it is definitive. The file records the
definitions and theorem signatures of the roadmap that can be stated against the pinned Mathlib
and Tau Ceti APIs, so that contributors and reviewers converge on names and signatures; it is not
exhaustive. Every theorem is proved by `sorry` unless a short proof is given.

The universal-extension and Steinberg carriers are consumed from StableHomotopyKTheory and
AlgebraicKTheory; their unavailable supplier declarations are README contracts. Commutators use
`⁅a, b⁆ = a * b * a⁻¹ * b⁻¹`. The integral Milnor quotients retain the diagonal symbol, and the
tame convention is `∂{u, π} = ū`. The finite matrix example checks the lifted bar-boundary sign;
it does not formalize the topological product comparison.
-/

namespace TauCetiRoadmap.K2SymbolsBrauer

open scoped TensorProduct commutatorElement WithZero

universe u

/-! ## Layer 1: the bar-boundary calibration -/

/-- The image of `[ba] - [ab]`, the boundary of a lifted oriented torus cycle, in the
relative one-chain quotient. It is the inverse of the positive commutator. -/
def torusLiftBoundary {G : Type*} [Group G] (a b : G) : G :=
  b * a * (a * b)⁻¹

/-- In the Heisenberg subgroup of `GL₃(𝔽₃)`, the boundary and positive commutator have different
central coordinates. Thus this example detects reversal of the calibration sign. -/
example :
    let a := TauCeti.transvectionUnit (show (0 : Fin 3) ≠ 1 by decide) (1 : ZMod 3)
    let b := TauCeti.transvectionUnit (show (1 : Fin 3) ≠ 2 by decide) (1 : ZMod 3)
    (((torusLiftBoundary a b : Matrix.GeneralLinearGroup (Fin 3) (ZMod 3)) : Matrix (Fin 3) (Fin 3) (ZMod 3)) 0 2) = 2 ∧
      (((⁅a, b⁆ : Matrix.GeneralLinearGroup (Fin 3) (ZMod 3)) : Matrix (Fin 3) (Fin 3) (ZMod 3)) 0 2) = 1 := by
  dsimp only
  simp only [torusLiftBoundary, commutatorElement_def, mul_inv_rev,
    TauCeti.transvectionUnit_inv, Matrix.GeneralLinearGroup.coe_mul,
    TauCeti.coe_transvectionUnit]
  decide

/-! ## Layer 5: Steinberg pairings and Milnor K-theory -/

section Milnor

variable (F : Type u) [Field F]

/-- A Steinberg pairing: bimultiplicative into an additive group and zero on complementary
units. -/
structure IsSteinbergPairing {A : Type*} [AddCommGroup A] (c : Fˣ → Fˣ → A) : Prop where
  mul_left : ∀ a b d : Fˣ, c (a * b) d = c a d + c b d
  mul_right : ∀ a b d : Fˣ, c a (b * d) = c a b + c a d
  steinberg : ∀ a b : Fˣ, (a : F) + b = 1 → c a b = 0

/-- The constant pairing `1` is not a Steinberg pairing: bilinearity at `(1, 1, 1)` would give
`1 = 2`. -/
example : ¬ IsSteinbergPairing F (fun _ _ => (1 : ℤ)) := by
  intro h
  have := h.mul_left 1 1 1
  norm_num at this

/-- The span of the tensors `a ⊗ b` with `a + b = 1`. -/
def steinbergRelations : Submodule ℤ (Additive Fˣ ⊗[ℤ] Additive Fˣ) :=
  Submodule.span ℤ {x | ∃ a b : Fˣ, (a : F) + b = 1 ∧ x = Additive.ofMul a ⊗ₜ Additive.ofMul b}

/-- The degree-two symbol group `(Fˣ ⊗ Fˣ) / ⟨a ⊗ b : a + b = 1⟩`, the universal target of
Steinberg pairings; it is `K₂ᴹ(F)`. -/
abbrev SymbolGroup : Type u := (Additive Fˣ ⊗[ℤ] Additive Fˣ) ⧸ steinbergRelations F

variable {F}

/-- The class `{a, b}` of `a ⊗ b`. -/
def symbol (a b : Fˣ) : SymbolGroup F :=
  Submodule.Quotient.mk (Additive.ofMul a ⊗ₜ Additive.ofMul b)

/-- The Steinberg relation in the symbol group. -/
example (a b : Fˣ) (h : (a : F) + b = 1) : symbol a b = 0 :=
  (Submodule.Quotient.mk_eq_zero _).2 (Submodule.subset_span ⟨a, b, h, rfl⟩)

/-- Skew-symmetry `{a, b} = -{b, a}` and `{a, a} = {a, -1}` (Weibel, III.6.1; Matsumoto,
Proposition 5.7). -/
theorem symbol_swap (a b : Fˣ) : symbol a b = -symbol b a := by
  sorry

theorem symbol_self (a : Fˣ) : symbol a a = symbol a (-1) := by
  sorry

/-- `{-1, -1}` is nonzero over `ℝ`: the sign pairing detects it, so the symbol group is not an
exterior square. -/
theorem symbol_neg_one_neg_one_real : symbol (-1 : ℝˣ) (-1) ≠ 0 := by
  sorry

/-- The degree-two symbol group of a finite field vanishes (Weibel, III.6.1.1). -/
theorem subsingleton_symbolGroup_of_finite [Finite F] : Subsingleton (SymbolGroup F) := by
  sorry

/-- Every Steinberg pairing factors uniquely through the symbol group. -/
theorem existsUnique_lift_of_isSteinbergPairing {A : Type*} [AddCommGroup A] {c : Fˣ → Fˣ → A}
    (hc : IsSteinbergPairing F c) :
    ∃! f : SymbolGroup F →+ A, ∀ a b, f (symbol a b) = c a b := by
  sorry

variable (F)

/-- The relation generating the Steinberg ideal of the tensor algebra. -/
def milnorRel : TensorAlgebra ℤ (Additive Fˣ) → TensorAlgebra ℤ (Additive Fˣ) → Prop :=
  fun x y => ∃ a b : Fˣ, (a : F) + b = 1 ∧
    x = TensorAlgebra.ι ℤ (Additive.ofMul a) * TensorAlgebra.ι ℤ (Additive.ofMul b) ∧ y = 0

/-- Milnor K-theory `K_*ᴹ(F)`, the quotient of the tensor algebra of `Additive Fˣ` over `ℤ` by
the two-sided ideal generated by the Steinberg products (Weibel, III.7.1). -/
abbrev MilnorK : Type u := RingQuot (milnorRel F)

variable {F}

/-- The degree-one class of a unit. -/
def MilnorK.ofUnit (a : Fˣ) : MilnorK F :=
  RingQuot.mkRingHom (milnorRel F) (TensorAlgebra.ι ℤ (Additive.ofMul a))

/-- The Milnor symbol `{a₁, …, aₙ}`, the ordered product of degree-one classes. -/
def MilnorK.symbol (l : List Fˣ) : MilnorK F :=
  (l.map MilnorK.ofUnit).prod

/-- Consecutive complementary entries kill a Milnor symbol. -/
example (a b : Fˣ) (h : (a : F) + b = 1) : MilnorK.symbol [a, b] = 0 := by
  simp only [MilnorK.symbol, List.map_cons, List.map_nil, List.prod_cons, List.prod_nil,
    mul_one, MilnorK.ofUnit]
  rw [← map_mul, RingQuot.mkRingHom_rel (r := milnorRel F) ⟨a, b, h, rfl, rfl⟩, map_zero]

/-- A permutation of the entries multiplies a Milnor symbol by its sign. -/
theorem MilnorK.symbol_perm (l : List Fˣ) (σ : Equiv.Perm (Fin l.length)) :
    MilnorK.symbol (List.ofFn fun i => l.get (σ i)) =
      ((Equiv.Perm.sign σ : ℤˣ) : ℤ) • MilnorK.symbol l := by
  sorry

/-- For a finite field the Milnor symbols with at least two entries vanish (Weibel,
III.7.2(a)). -/
theorem MilnorK.symbol_eq_zero_of_finite [Finite F] (l : List Fˣ) (hl : 2 ≤ l.length) :
    MilnorK.symbol l = 0 := by
  sorry

end Milnor

/-! ## Layer 9: tame symbols and Milnor residues -/

section Tame

variable {F : Type*} [Field F]

open Valuation in
/-- The unit part of the tame symbol, `(-1)^{v(f)v(g)} f^{v(g)} g^{-v(f)}`, whose residue is
`∂_v{f, g}`; it is a unit of the valuation ring. -/
noncomputable def tameUnit (v : Valuation F ℤᵐ⁰) (f g : Fˣ) : Fˣ :=
  (-1) ^ (ord v (f : F) * ord v (g : F)) * f ^ ord v (g : F) * g ^ (-ord v (f : F))

open Valuation in
/-- The normalisation `∂{u, π} = ū`. -/
example (v : Valuation F ℤᵐ⁰) (u π : Fˣ) (hu : ord v (u : F) = 0) (hπ : ord v (π : F) = 1) :
    tameUnit v u π = u := by
  simp [tameUnit, hu, hπ]

open Valuation in
/-- At the zero place of `k(t)` in characteristic zero (in particular `ℚ(t)`), the two orders
of `(2,t)` give `2` and `1/2`. This tests the normalization away from 2-torsion. -/
example (k : Type*) [Field k] [CharZero k] :
    let P := TauCeti.Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))
    let u := Units.map (algebraMap k (RatFunc k)).toMonoidHom (Units.mk0 (2 : k) (by norm_num))
    let t := Units.mk0 (RatFunc.X : RatFunc k) RatFunc.X_ne_zero
    (tameUnit P.valuation u t : RatFunc k) = 2 ∧
      (tameUnit P.valuation t u : RatFunc k) = 1 / 2 ∧
      (tameUnit P.valuation u t : RatFunc k) ≠ (tameUnit P.valuation t u : RatFunc k) := by
  dsimp only
  let P := TauCeti.Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))
  have hu : ord P.valuation ((algebraMap k (RatFunc k)).toMonoidHom (2 : k)) = 0 :=
    P.ord_algebraMap 2
  have ht : ord P.valuation (RatFunc.X : RatFunc k) = 1 := by
    apply P.isUniformizer_iff_ord_eq_one.mp
    simpa only [P, RatFunc.algebraMap_X] using
      (TauCeti.Place.isUniformizer_adicOfIrreducible (Polynomial.irreducible_X (R := k)))
  dsimp only [P] at hu ht
  simp only [tameUnit, Units.val_mul, Units.val_zpow_eq_zpow_val,
    Units.coe_map, Units.val_mk0]
  rw [hu, ht]
  norm_num [map_ofNat]

/-- The tame unit lies in the unit group of the valuation ring. -/
theorem tameUnit_mem_unitGroup (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) (f g : Fˣ) :
    tameUnit v f g ∈ v.valuationSubring.unitGroup := by
  sorry

/-- Bimultiplicativity of the tame unit. -/
theorem tameUnit_mul_left (v : Valuation F ℤᵐ⁰) (f f' g : Fˣ) :
    tameUnit v (f * f') g = tameUnit v f g * tameUnit v f' g := by
  sorry

/-- **The Steinberg relation for the tame symbol** (Weibel, Lemma III.6.3): if `f + g = 1` the
tame unit is a principal unit, so its residue is `1`. -/
theorem tameUnit_steinberg (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) (f g : Fˣ)
    (h : (f : F) + g = 1) : v ((tameUnit v f g : F) - 1) < 1 := by
  sorry

end Tame

/-! ## Layer 10: rational function fields, Milnor norms and reciprocity -/

section Reciprocity

variable {k F : Type*} [Field k] [Field F] [Algebra k F]

/-- **Weil reciprocity for disjoint supports**, the degree-two disjoint case of Suslin's
reciprocity law for any function field of one variable: `f(div g) = g(div f)`. -/
theorem weil_reciprocity_of_disjoint (hF : TauCeti.IsFunctionField k F) (f g : Fˣ)
    (h : Disjoint (TauCeti.Divisor.principal hF f).support
      (TauCeti.Divisor.principal hF g).support) :
    TauCeti.Divisor.eval (TauCeti.Divisor.principal hF g) f =
      TauCeti.Divisor.eval (TauCeti.Divisor.principal hF f) g := by
  sorry

end Reciprocity

end TauCetiRoadmap.K2SymbolsBrauer

/-
The README specifies the remaining carriers and milestones: the calibrated Hopf and Hurewicz
comparisons; faithful row/column maps and normalized finite-rank sections; star products, Weyl
and diagonal words, commuting-unit and finite-rank symbols, monomial and unipotent subgroups;
the native quotient grading, real detector and Milnor-to-Quillen ring map; unit parts, residue
and specialization maps, Serre's residue algebra, Bass–Tate filtrations and transfers; complete
valuation extensions and component lattices, Kato norms and integral reciprocity; total residues,
localization and Quillen-transfer comparisons; unramified groups, tame kernels, auxiliary integer
word models and the integer/rational computations; Dennis–Stein symbols, threefold stability,
absolute and guarded relative presentation groups, double-ring relative Steinberg groups, their
fibre comparison, differential symbols, square-zero quotients and dual-number/dyadic detectors;
twist trivializations, Brauer and cyclic symbols, local invariant and Tate comparison maps, and
the product-normalized finite étale Chern comparison.
-/
