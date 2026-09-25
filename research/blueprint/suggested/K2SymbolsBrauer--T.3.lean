import Mathlib.Algebra.DirectSum.Basic
import Mathlib.Algebra.DualNumber
import Mathlib.Algebra.Field.ZMod
import Mathlib.Algebra.Group.Commutator
import Mathlib.Algebra.Module.Presentation.Basic
import Mathlib.Algebra.TrivSqZeroExt.Ideal
import Mathlib.Analysis.Complex.Basic
import Mathlib.Data.Finsupp.Basic
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.Normal.Defs
import Mathlib.GroupTheory.FreeAbelianGroup
import Mathlib.GroupTheory.PresentedGroup
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.PiTensorProduct.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.NumberTheory.Cyclotomic.PrimitiveRoots
import Mathlib.NumberTheory.LocalField.Basic
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.Padics.HeightOneSpectrum
import Mathlib.NumberTheory.Padics.LocalField
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.RingTheory.DedekindDomain.AdicValuation
import Mathlib.RingTheory.DedekindDomain.SInteger
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Jacobson.Ideal
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.RingTheory.Norm.Defs
import Mathlib.RingTheory.RootsOfUnity.EnoughRootsOfUnity
import Mathlib.RingTheory.Valuation.ValuationSubring
import TauCeti.FieldTheory.FunctionField.Divisor.Eval
import TauCeti.FieldTheory.FunctionField.Divisor.Principal
import TauCeti.FieldTheory.FunctionField.Place.RatFunc.Basic
import TauCeti.FieldTheory.FunctionField.Place.Residue
import TauCeti.FieldTheory.GaloisCohomology.Kummer
import TauCeti.RepresentationTheory.Homological.ContCohomology.Cup.Product
import TauCeti.RingTheory.DedekindDomain.AdicValuation.ValuativeRel
import TauCeti.RingTheory.Valuation.Discrete.Order

/-!
# Suggested Lean forms for `K2SymbolsBrauer--T.3` (stages T.3, T.4, T.5, T.6, T.7)

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/K2SymbolsBrauer--T.3.md` is definitive. The statements below suggest
Lean forms so that contributors and reviewers converge on names and signatures; they claim no
implementation, and `implementationStatus` stays `"unchecked"` for every node.

Pinned commits: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

Compiled with `lean` against the pinned commits; the only warnings are uses of sorry. Mathlib came
from a project pinned to `082e2d3`, and the Tau Ceti modules imported below were compiled from the
`f790474` sources and placed first on `LEAN_PATH`.

## Pinned conventions

* **The tame symbol** is the roadmap's
  `∂_v{f, g} = (-1)^{v(f) v(g)} · (f^{v(g)} / g^{v(f)})‾`, so `∂{u, π} = ū` and `∂{π, u} = ū⁻¹`
  (`TauCeti.TameSymbol.tameSymbol_unit_uniformizer`, `tameSymbol_uniformizer_unit`).
* **The K-book's tame symbol** (Lemma III.6.3) is its inverse: at the `5`-adic valuation of `ℚ`,
  `tameSymbol 5 2 = 3` whereas the K-book's is `2` (`tameSymbol_kbook`, test
  `tameSymbol_not_kbook`).
* **The higher residue** has `Π` on the right: `d_t(x) = λ_t(x) + ∂_v(x) · Π`,
  `∂{u₁, …, u_{n-1}, π} = {ū₁, …, ū_{n-1}}`; in degree two it is the roadmap's tame symbol.
  Theorem III.7.3's residue is `∂^{Wb} = (-1)^{n-1} ∂` on `K^M_n(F)` (`milnorResidue_kbook`).
* **The transfer** is normalised by `-∂_∞ = Σ_p N_p ∘ ∂_p` on `K^M_{n+1} F(t)`
  (`TauCeti.MilnorK.residueInfty_eq_neg_sum_transfer`).
* Left modules throughout; local reciprocity, where it enters (`normResidueSymbol`), carries the
  arithmetic-Frobenius normalisation of ClassFieldTheory Layer 6, variable order `x ↦ (x, -)_F`.

## Library declarations imported and reused

* Tau Ceti: `Valuation.ord` (`TauCeti/RingTheory/Valuation/Discrete/Order.lean`),
  `TauCeti.Place` with `Place.integers`, `Place.mem_integers_iff`, `Place.ord`,
  `Place.ResidueField`, `Place.residueUnit`; `Place.adicOfIrreducible`,
  `Place.adicOfIrreducibleResidueFieldEquiv`, `Place.infty`, `Place.inftyResidueFieldEquiv`;
  `TauCeti.IsFunctionField`, `TauCeti.Divisor.principal`, `TauCeti.Divisor.eval`;
  `TauCeti.KummerCoeff`, `TauCeti.UnitsCoeff`, `TauCeti.kummerCoeffIncl`,
  `TauCeti.kummerCoeffIncl_equivariant`, `TauCeti.kummerMap`, `TauCeti.AbsoluteGaloisGroup`;
  `TauCeti.ContCohomology.H2`, `explicitCup11`, `explicitCoeff2`; the `IsNonarchimedeanLocalField`
  instance on `HeightOneSpectrum.adicCompletion`
  (`TauCeti/RingTheory/DedekindDomain/AdicValuation/ValuativeRel.lean`).
* Mathlib: `Valuation.valuationSubring`, `ValuationSubring.unitGroup`,
  `ValuationSubring.unitGroupToResidueFieldUnits`, `ValuationSubring.principalUnitGroup`,
  `IsLocalRing.ResidueField` and `ResidueField.map`, `Rat.padicValuation`,
  `Rat.surjective_padicValuation`, `Padic.mulValuation`, `IsDedekindDomain.HeightOneSpectrum`
  with `valuation` and `valuation_surjective`, `Set.integer`, `NumberField.RingOfIntegers`,
  `NumberField.InfinitePlace.embedding_of_isReal`, `IntermediateField.adjoinRootEquivAdjoin`,
  `minpoly`, `Algebra.norm`, `RatFunc`, `PiTensorProduct`, `PresentedGroup`, `FreeAbelianGroup`,
  `Module.Relations`, `Module.Presentation`, `TrivSqZeroExt` with `kerIdeal`, `DualNumber`,
  `KaehlerDifferential`, `Ideal.jacobson`, `IsNonarchimedeanLocalField`, `rootsOfUnity`,
  `HasEnoughRootsOfUnity`, `IsPrimitiveRoot.zmodEquivZPowers`, `IsPrimitiveRoot.zpowers_eq`,
  `restrictRootsOfUnity`, `ZMod`.

## Stand-ins, helpers and omissions

The carriers the companion part `K2SymbolsBrauer--T.1` owns — Milnor K-theory, the stable
Steinberg group, `K₂` and the Steinberg symbols — are in neither pinned library, so the prelude
defines them honestly (the Milnor K-groups as a quotient of tensor powers, the Steinberg group by
its presentation, `K₂` as the kernel of the action on column vectors), each documented as a
stand-in for the companion node it replaces. Operations whose construction is the companion's work
(the graded product, restriction, Matsumoto's isomorphism) are `def`s with `sorry` bodies over
these real carriers. A statement needing a carrier that neither exists nor can honestly be
defined here is left out, and a comment `<name>: not stated here; needs … (supplier: …)` records it
in place, so that every packet name appears in this file.
-/

noncomputable section

open scoped TensorProduct commutatorElement WithZero Polynomial IntermediateField DirectSum

universe u v w

/-! ## Prelude: honest local stand-ins for the companion part

The companion part `K2SymbolsBrauer--T.1` owns Milnor K-theory, the Steinberg group, `K₂` and
the Steinberg symbols. None of them is in either pinned library, so each is defined here, honestly,
as a stand-in for the companion node it replaces. Only the carriers and the symbol maps are
constructions; operations whose construction is the companion's work (the graded product,
restriction along a field map, the degree-zero and degree-one identifications) are `def`s with
`sorry` bodies over the real carriers. -/

namespace TauCeti.MilnorK

variable (F : Type u) [Field F]

/-- Stand-in for `K2SymbolsBrauer:T.2/milnor-k-theory` (the relations): the `ℤ`-span of the pure
tensors `l(x₁) ⊗ ⋯ ⊗ l(xₙ)` of `(Fˣ)^{⊗n}` having two entries `xᵢ + xⱼ = 1` (`i ≠ j`). With
graded commutativity this is the span of the consecutive Steinberg tensors. -/
def milnorRel (n : ℕ) : Submodule ℤ (⨂[ℤ] _ : Fin n, Additive Fˣ) :=
  Submodule.span ℤ {z | ∃ (x : Fin n → Fˣ) (i j : Fin n), i ≠ j ∧ (x i : F) + x j = 1 ∧
    z = ⨂ₜ[ℤ] k, Additive.ofMul (x k)}

/-- Stand-in for `K2SymbolsBrauer:T.2/milnor-k-theory` (`milnorK`): the Milnor K-group
`K^M_n(F) = (Fˣ)^{⊗n} / ⟨Steinberg tensors⟩`, written additively. -/
def milnorK (n : ℕ) : Type u := (⨂[ℤ] _ : Fin n, Additive Fˣ) ⧸ milnorRel F n

instance (n : ℕ) : AddCommGroup (milnorK F n) :=
  inferInstanceAs (AddCommGroup (_ ⧸ milnorRel F n))

namespace milnorK

variable {F}

/-- Stand-in for `milnorK.symbol` of `K2SymbolsBrauer:T.2/milnor-k-theory`: the symbol
`{x₁, …, xₙ}`, the class of `l(x₁) ⊗ ⋯ ⊗ l(xₙ)`. -/
def symbol {n : ℕ} (x : Fin n → Fˣ) : milnorK F n :=
  Submodule.Quotient.mk (⨂ₜ[ℤ] k, Additive.ofMul (x k))

/-- The empty symbol, the generator `1` of `K^M_0(F) = ℤ`. -/
def one : milnorK F 0 := symbol ![]

/-- Stand-in for the graded product of `K2SymbolsBrauer:T.2/milnor-k-theory`:
`K^M_i(F) × K^M_j(F) → K^M_{i+j}(F)`, `{x} · {y} = {x, y}` (concatenation). -/
def mul {i j : ℕ} : milnorK F i →+ milnorK F j →+ milnorK F (i + j) := sorry

/-- Stand-in for `milnorK.map` of `K2SymbolsBrauer:T.2/milnor-k-theory`: restriction along a
field homomorphism, `{x₁, …, xₙ} ↦ {f x₁, …, f xₙ}`. -/
def map {E : Type v} [Field E] (f : F →+* E) (n : ℕ) : milnorK F n →+ milnorK E n := sorry

/-- Transport along an equality of degrees (a real definition). -/
def cast {m n : ℕ} (h : m = n) : milnorK F m ≃+ milnorK F n := by
  subst h
  exact AddEquiv.refl _

/-- Stand-in for `milnorK.zero` of `K2SymbolsBrauer:T.2/milnor-k-theory`: `K^M_0(F) ≃ ℤ`,
`one ↦ 1`. -/
def zeroEquiv : milnorK F 0 ≃+ ℤ := sorry

/-- Stand-in for `milnorK.one` of `K2SymbolsBrauer:T.2/milnor-k-theory`: `K^M_1(F) ≃ Fˣ`
(written additively), `{x} ↦ x`. -/
def oneEquiv : milnorK F 1 ≃+ Additive Fˣ := sorry

end milnorK

end TauCeti.MilnorK

namespace TauCeti.Steinberg

variable (R : Type u) [Ring R]

/-- The generators `x_ij(r)` of the stable Steinberg group: a pair of distinct indices and a ring
element (stand-in for the generators of `K2SymbolsBrauer:T.1/steinberg-group-finite-rank`). -/
structure Gen where
  /-- The row index. -/
  i : ℕ
  /-- The column index. -/
  j : ℕ
  /-- The indices are distinct; this is data of the generator, never a forgotten side condition. -/
  ne : i ≠ j
  /-- The ring element. -/
  r : R

/-- The Steinberg relations, each with its index hypotheses: additivity, the commutator of
disjoint generators, and `[x_ij(r), x_jl(s)] = x_il(rs)` for `i ≠ l`. -/
def rels : Set (FreeGroup (Gen R)) :=
  {z | ∃ (i j : ℕ) (hij : i ≠ j) (r s : R), z = FreeGroup.of (⟨i, j, hij, r⟩ : Gen R) *
      FreeGroup.of (⟨i, j, hij, s⟩ : Gen R) * (FreeGroup.of (⟨i, j, hij, r + s⟩ : Gen R))⁻¹} ∪
  {z | ∃ (i j k l : ℕ) (hij : i ≠ j) (hkl : k ≠ l) (r s : R), j ≠ k ∧ i ≠ l ∧
      z = ⁅FreeGroup.of (⟨i, j, hij, r⟩ : Gen R), FreeGroup.of (⟨k, l, hkl, s⟩ : Gen R)⁆} ∪
  {z | ∃ (i j l : ℕ) (hij : i ≠ j) (hjl : j ≠ l) (hil : i ≠ l) (r s : R),
      z = ⁅FreeGroup.of (⟨i, j, hij, r⟩ : Gen R), FreeGroup.of (⟨j, l, hjl, s⟩ : Gen R)⁆ *
        (FreeGroup.of (⟨i, l, hil, r * s⟩ : Gen R))⁻¹}

/-- Stand-in for `StableSteinberg` of `K2SymbolsBrauer:T.1/stabilisation`: the stable Steinberg
group `St(R)`, presented on the generators `x_ij(r)`, `i ≠ j ∈ ℕ`. The colimit of the tower
`St_n(R) → St_{n+1}(R)` is presented by the union of the presentations, which is this one. -/
def StableSteinberg : Type u := PresentedGroup (rels R)

instance : Group (StableSteinberg R) := inferInstanceAs (Group (PresentedGroup (rels R)))

namespace StableSteinberg

variable {R}

/-- The generator `x_ij(r)`. -/
def x {i j : ℕ} (hij : i ≠ j) (r : R) : StableSteinberg R := PresentedGroup.of ⟨i, j, hij, r⟩

/-- `w_ij(u) = x_ij(u) x_ji(-u⁻¹) x_ij(u)` (exposed as the first request of the packet asks). -/
def w {i j : ℕ} (hij : i ≠ j) (u : Rˣ) : StableSteinberg R :=
  x hij (u : R) * x hij.symm (-((u⁻¹ : Rˣ) : R)) * x hij (u : R)

/-- `h_ij(u) = w_ij(u) w_ij(-1)`, whose image in `E(R)` is `diag(u, u⁻¹)` at `(i, j)`. -/
def h {i j : ℕ} (hij : i ≠ j) (u : Rˣ) : StableSteinberg R := w hij u * w hij (-1)

/-- The elementary transvection `e_ij(r)` acting on column vectors `R^{(ℕ)}`:
`v ↦ v + eᵢ · r vⱼ`. The action of `GL(R)` on `R^{(ℕ)}` is faithful, so the kernel of `St(R)`
acting through these is the kernel of `St(R) → E(R) ⊆ GL(R)`. -/
def elemPerm {i j : ℕ} (hij : i ≠ j) (r : R) : Equiv.Perm (ℕ →₀ R) where
  toFun c := c + Finsupp.single i (r * c j)
  invFun c := c - Finsupp.single i (r * c j)
  left_inv c := by simp [hij]
  right_inv c := by simp [hij]

variable (R)

/-- Stand-in for `StableSteinberg.phi` of `K2SymbolsBrauer:T.1/stabilisation`: the map onto the
elementary group `E(R)`, realised through its faithful action on `R^{(ℕ)}`. The data is the
presentation's universal property; the relation check is the companion node
`K2SymbolsBrauer:T.1/elementary-matrices-satisfy`. -/
def phi : StableSteinberg R →* Equiv.Perm (ℕ →₀ R) :=
  PresentedGroup.toGroup (f := fun g : Gen R => elemPerm g.ne g.r) (by sorry)

variable {R}

/-- Stand-in for `StableSteinberg.map` of `K2SymbolsBrauer:T.1/stabilisation`:
`x_ij(r) ↦ x_ij(f r)`. -/
def map {S : Type v} [Ring S] (f : R →+* S) : StableSteinberg R →* StableSteinberg S :=
  PresentedGroup.toGroup (f := fun g : Gen R => x g.ne (f g.r)) (by sorry)

end StableSteinberg

/-- Stand-in for `K2` of `K2SymbolsBrauer:T.1/k2-definition`: `K₂(R) = ker(St(R) → E(R))`. -/
def K2 : Subgroup (StableSteinberg R) := (StableSteinberg.phi R).ker

/-- `K₂(R)` is central, hence abelian (`K2SymbolsBrauer:T.1/k2-is-centre`); the group law is the
subgroup's. -/
instance : CommGroup (K2 R) := { (inferInstance : Group (K2 R)) with mul_comm := sorry }

variable {R} in
/-- Stand-in for `K2.map` of `K2SymbolsBrauer:T.1/k2-definition`. -/
def K2.map {S : Type v} [Ring S] (f : R →+* S) : K2 R →* K2 S where
  toFun g := ⟨StableSteinberg.map f g, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

end TauCeti.Steinberg

namespace TauCeti.MilnorK

open TauCeti.Steinberg

/-- Stand-in for `steinbergSymbol` of `K2SymbolsBrauer:T.2/steinberg-symbol`: for commuting units,
`{u, v} = [h_12(u), h_13(v)] ∈ K₂(R)` (indices `0, 1, 2` here). -/
def steinbergSymbol {R : Type u} [Ring R] (u v : Rˣ) (huv : Commute (u : R) v) : K2 R :=
  ⟨⁅StableSteinberg.h (i := 0) (j := 1) (by decide) u,
    StableSteinberg.h (i := 0) (j := 2) (by decide) v⁆, by sorry⟩

/-- Stand-in for `K2SymbolsBrauer:T.2/matsumoto`: Matsumoto's isomorphism
`K^M_2(F) ≃ K₂(F)`, `{a, b} ↦ steinbergSymbol a b`, for a field. -/
def matsumotoEquiv (F : Type u) [Field F] : milnorK F 2 ≃+ Additive (K2 F) := sorry

end TauCeti.MilnorK

/-! ## `K2SymbolsBrauer:T.3:symbols` — the tame symbol

Convention (pinned): `∂_v{f, g} = (-1)^{v(f) v(g)} · (f^{v(g)} / g^{v(f)})‾`, so `∂{u, π} = ū` and
`∂{π, u} = ū⁻¹`. The K-book's tame symbol (Lemma III.6.3) is its inverse. -/

namespace TauCeti.TameSymbol

open TauCeti.MilnorK TauCeti.Steinberg


variable {F : Type u} [Field F]

/-- The residue field `k_v` of a `ℤᵐ⁰`-valued valuation `v` (of its valuation subring). -/
abbrev ResidueField (v : Valuation F ℤᵐ⁰) : Type u := IsLocalRing.ResidueField v.valuationSubring

/-- The residue `ū ∈ k_vˣ` of an element of the unit group of the valuation ring
(`ValuationSubring.unitGroupToResidueFieldUnits`). -/
abbrev res (v : Valuation F ℤᵐ⁰) (u : v.valuationSubring.unitGroup) : (ResidueField v)ˣ :=
  v.valuationSubring.unitGroupToResidueFieldUnits u

/-- `f^{ord g} g^{-ord f}` has order zero, so lies in the unit group of the valuation ring. -/
theorem zpow_ord_mul_zpow_neg_ord_mem_unitGroup (v : Valuation F ℤᵐ⁰) (f g : Fˣ) :
    f ^ v.ord (g : F) * g ^ (-v.ord (f : F)) ∈ v.valuationSubring.unitGroup := by
  sorry

/-- **The tame symbol** (`K2SymbolsBrauer:T.3/tame-symbol`). For a surjective `v : F → ℤᵐ⁰`,
`tameSymbol v hv f g = (-1)^{ord f · ord g} · ū_f^{ord g} · ū_g^{-ord f} ∈ k_vˣ`, the unit parts
`f = t^{ord f} u_f` being taken against a uniformiser `t` fixed by choice
(`Valuation.exists_isUniformizer_of_surjective`, `Valuation.exists_eq_zpow_mul_unit_of_surjective`).
The residue map is applied only to units of the valuation ring. -/
def tameSymbol (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) (f g : Fˣ) :
    (ResidueField v)ˣ :=
  sorry

variable (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v)

/-- The uniformiser-free form (`K2SymbolsBrauer:T.3/tame-symbol-uniformizer-independence`):
`∂_v{f, g} = (-1)^{ord f · ord g} · res(f^{ord g} g^{-ord f})`. -/
theorem tameSymbol_eq_residue (f g : Fˣ) :
    tameSymbol v hv f g = (-1) ^ (v.ord (f : F) * v.ord (g : F)) *
      res v ⟨_, zpow_ord_mul_zpow_neg_ord_mem_unitGroup v f g⟩ := by
  sorry

/-- The convention-pinning value `∂_v{u, t} = ū`. -/
@[simp]
theorem tameSymbol_unit_uniformizer (u : v.valuationSubring.unitGroup) (t : Fˣ)
    (ht : v.ord (t : F) = 1) : tameSymbol v hv u t = res v u := by
  sorry

/-- The convention-pinning value `∂_v{t, u} = ū⁻¹`. -/
@[simp]
theorem tameSymbol_uniformizer_unit (u : v.valuationSubring.unitGroup) (t : Fˣ)
    (ht : v.ord (t : F) = 1) : tameSymbol v hv t u = (res v u)⁻¹ := by
  sorry

@[simp]
theorem tameSymbol_of_ord_eq_zero (f g : Fˣ) (hf : v.ord (f : F) = 0) (hg : v.ord (g : F) = 0) :
    tameSymbol v hv f g = 1 := by
  sorry

theorem tameSymbol_swap (f g : Fˣ) : tameSymbol v hv g f = (tameSymbol v hv f g)⁻¹ := by
  sorry

theorem tameSymbol_self (f : Fˣ) : tameSymbol v hv f f = (-1) ^ v.ord (f : F) := by
  sorry

theorem tameSymbol_neg_self (f : Fˣ) : tameSymbol v hv f (-f) = 1 := by
  sorry

/-- The K-book's tame symbol of Lemma III.6.3, `∂_v({r, s}) = (-1)^{v(r)v(s)} (s^{v(r)}/r^{v(s)})‾`,
is `tameSymbol v s r`, the **inverse** of `tameSymbol v r s`. -/
theorem tameSymbol_kbook (r s : Fˣ) :
    (-1) ^ (v.ord (r : F) * v.ord (s : F)) *
        res v ⟨_, zpow_ord_mul_zpow_neg_ord_mem_unitGroup v s r⟩ = (tameSymbol v hv r s)⁻¹ := by
  sorry

/-- The DVR form: for an irreducible `ϖ` of the valuation ring `R = 𝒪_v` (a DVR,
`Valuation.valuationSubring_isDiscreteValuationRing_of_surjective`) and
`f = u_f ϖ^{n_f}`, `g = u_g ϖ^{n_g}` (`IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible`),
`∂_v{f, g} = (-1)^{n_f n_g} ū_f^{n_g} ū_g^{-n_f}`. -/
theorem tameSymbol_dvr (ϖ : v.valuationSubring) (hϖ : Irreducible ϖ) (f g : Fˣ) (nf ng : ℤ)
    (uf ug : v.valuationSubringˣ)
    (hf : (f : F) = ((uf : v.valuationSubring) : F) * (ϖ : F) ^ nf)
    (hg : (g : F) = ((ug : v.valuationSubring) : F) * (ϖ : F) ^ ng) :
    tameSymbol v hv f g = (-1) ^ (nf * ng) *
      Units.map (IsLocalRing.residue v.valuationSubring).toMonoidHom uf ^ ng *
      Units.map (IsLocalRing.residue v.valuationSubring).toMonoidHom ug ^ (-nf) := by
  sorry

/-- Residue fields of equal valuation subrings (a real definition). -/
def residueFieldCongr {A B : ValuationSubring F} (h : A = B) :
    IsLocalRing.ResidueField A ≃+* IsLocalRing.ResidueField B := by
  subst h
  exact RingEquiv.refl _

/-- The valuation ring of a Tau Ceti place is the valuation subring of its valuation
(`TauCeti.Place.integers` is not an exposed definition, so this is stated rather than unfolded). -/
theorem valuationSubring_eq_integers {k : Type v} [Field k] [Algebra k F] (P : Place k F) :
    P.valuation.valuationSubring = P.integers := by
  ext x
  rw [Valuation.mem_valuationSubring_iff, Place.mem_integers_iff]

/-- At a place `P` of a function field, with `t` a uniformiser and `P.ord f = 0`,
`∂_P{f, t} = f(P)`, Tau Ceti's `TauCeti.Place.residueUnit`. -/
theorem tameSymbol_place {k : Type v} [Field k] [Algebra k F] (P : Place k F) (f t : Fˣ)
    (hf : P.ord (f : F) = 0) (ht : P.ord (t : F) = 1) :
    Units.map (residueFieldCongr (valuationSubring_eq_integers P)).toRingHom.toMonoidHom
      (tameSymbol P.valuation P.valuation_surjective f t) = P.residueUnit f hf := by
  sorry

/-- `K2SymbolsBrauer:T.3/tame-symbol-uniformizer-independence`: for **any** uniformiser `t` and
the unit parts `f = t^{ord f} u_f`, `g = t^{ord g} u_g` against it,
`∂_v{f, g} = (-1)^{ord f ord g} ū_f^{ord g} ū_g^{-ord f}`; the left side involves no uniformiser.
On `ℚ` at `5`, `t = 5` and `t = 10` both give `∂{10, 5} = 3`. -/
theorem tameSymbol_uniformizer_independence (t : Fˣ) (ht : v.ord (t : F) = 1) (f g : Fˣ)
    (uf ug : v.valuationSubring.unitGroup) (hf : f = t ^ v.ord (f : F) * uf)
    (hg : g = t ^ v.ord (g : F) * ug) :
    tameSymbol v hv f g =
      (-1) ^ (v.ord (f : F) * v.ord (g : F)) * res v uf ^ v.ord (g : F) *
        res v ug ^ (-v.ord (f : F)) := by
  sorry

/-- `K2SymbolsBrauer:T.3/tame-symbol-steinberg`: bimultiplicativity in the first entry. -/
theorem tameSymbol_mul_left (f f' g : Fˣ) :
    tameSymbol v hv (f * f') g = tameSymbol v hv f g * tameSymbol v hv f' g := by
  sorry

/-- `K2SymbolsBrauer:T.3/tame-symbol-steinberg`: bimultiplicativity in the second entry. -/
theorem tameSymbol_mul_right (f g g' : Fˣ) :
    tameSymbol v hv f (g * g') = tameSymbol v hv f g * tameSymbol v hv f g' := by
  sorry

/-- `K2SymbolsBrauer:T.3/tame-symbol-steinberg`: the Steinberg relation `∂_v{r, 1 - r} = 1` for
`r ≠ 0, 1`, by the source's four exhaustive cases. -/
theorem tameSymbol_steinberg (r : Fˣ) (hr : (r : F) ≠ 1) :
    tameSymbol v hv r (Units.mk0 (1 - (r : F)) (sub_ne_zero.mpr hr.symm)) = 1 := by
  sorry

section Extension

variable {E : Type v} [Field E] [Algebra F E]

/-- The inclusion of valuation rings `𝒪_v → 𝒪_w` for `w` over `v`, i.e.
`ord_w (r) = e · ord_v (r)` on `F` (a real definition; the membership is the order condition). -/
def valuationSubringMap (w : Valuation E ℤᵐ⁰) (e : ℕ)
    (hvw : ∀ r : F, w.ord (algebraMap F E r) = e * v.ord r) :
    v.valuationSubring →+* w.valuationSubring :=
  ((algebraMap F E).comp v.valuationSubring.subtype).codRestrict w.valuationSubring
    (fun _ => by sorry)

/-- The residue field extension `k_v → k_w` for `w` over `v` (a real definition). -/
def residueFieldMap (w : Valuation E ℤᵐ⁰) (e : ℕ)
    (hvw : ∀ r : F, w.ord (algebraMap F E r) = e * v.ord r) :
    ResidueField v →+* ResidueField w :=
  haveI : IsLocalHom (valuationSubringMap v w e hvw) := by sorry
  IsLocalRing.ResidueField.map (valuationSubringMap v w e hvw)

/-- `K2SymbolsBrauer:T.3/ramification-formula`: for a finite extension `E/F` and `w` over `v`
with ramification index `e ≥ 1`, `∂_w{r₁, r₂} = (∂_v{r₁, r₂})^e` in `k_wˣ` for `r₁, r₂ ∈ Fˣ`.
(With all `e_i = 1` the diagonal `k_vˣ → ∏ k_{w_i}ˣ` carries `∂_v` to `(∂_{w_i})_i`.) -/
theorem ramification_formula [FiniteDimensional F E] (w : Valuation E ℤᵐ⁰)
    (hw : Function.Surjective w) (e : ℕ) (he : 0 < e)
    (hvw : ∀ r : F, w.ord (algebraMap F E r) = e * v.ord r) (r₁ r₂ : Fˣ) :
    tameSymbol w hw (Units.map (algebraMap F E).toMonoidHom r₁)
        (Units.map (algebraMap F E).toMonoidHom r₂) =
      Units.map (residueFieldMap v w e hvw).toMonoidHom (tameSymbol v hv r₁ r₂) ^ e := by
  sorry

end Extension

/-! ### `K2SymbolsBrauer:T.3/tame-symbol-hom` -/

/-- **The tame symbol on `K^M_2(F)`** (`K2SymbolsBrauer:T.3/tame-symbol-hom`):
`K^M_2(F) →+ Additive k_vˣ`, `{f, g} ↦ tameSymbol v f g`. -/
def tameSymbolHom (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) :
    milnorK F 2 →+ Additive (ResidueField v)ˣ :=
  sorry

@[simp]
theorem tameSymbolHom_symbol (f g : Fˣ) :
    tameSymbolHom v hv (milnorK.symbol ![f, g]) = Additive.ofMul (tameSymbol v hv f g) := by
  sorry

theorem tameSymbolHom_surjective : Function.Surjective (tameSymbolHom v hv) := by
  sorry

/-- The tame symbol on Steinberg's `K₂(F)`, through Matsumoto's isomorphism
(`K2SymbolsBrauer:T.2/matsumoto`). -/
def tameSymbolHomK2 (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) :
    K2 F →* (ResidueField v)ˣ :=
  sorry

/-- `tameSymbolHomK2` has the same value on Steinberg symbols. -/
theorem tameSymbolHomK2_steinbergSymbol (f g : Fˣ) :
    tameSymbolHomK2 v hv (steinbergSymbol f g (Commute.all _ _)) = tameSymbol v hv f g := by
  sorry

@[simp]
theorem tameSymbolHom_symbol_units (u u' : v.valuationSubring.unitGroup) :
    tameSymbolHom v hv (milnorK.symbol ![(u : Fˣ), (u' : Fˣ)]) = 0 := by
  sorry

/-- The K-book's `∂_v` (Lemma III.6.3) is `-tameSymbolHom v` in additive notation: on a symbol
its value `(-1)^{v(f)v(g)} (g^{v(f)}/f^{v(g)})‾` is minus `tameSymbolHom v {f, g}`. -/
theorem tameSymbolHom_kbook (f g : Fˣ) :
    Additive.ofMul ((-1) ^ (v.ord (f : F) * v.ord (g : F)) *
        res v ⟨_, zpow_ord_mul_zpow_neg_ord_mem_unitGroup v g f⟩) =
      -tameSymbolHom v hv (milnorK.symbol ![f, g]) := by
  sorry

/-! ### Unit tests: the tame symbol at the `5`-adic valuation of `ℚ`

`k_{v₅}` is `𝔽₅`; each test is stated through a ring homomorphism `φ : k_{v₅} →+* ZMod 5`
(there is exactly one), so the values are read in `ZMod 5`. -/

section Tests

variable [Fact (Nat.Prime 5)]

/-- A nonzero rational as a unit (test notation). -/
local notation "⟪" q "⟫" => Units.mk0 (q : ℚ) (by norm_num)

-- test tameSymbol_rat_five (computation)
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5) :
    φ (tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪2⟫ ⟪5⟫) = 2 ∧
      φ (tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪5⟫ ⟪2⟫) = 3 := by
  sorry

-- test tameSymbol_rat_five_sign (computation)
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5) :
    φ (tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪5⟫ ⟪5⟫) = 4 ∧
      φ (tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪10⟫ ⟪5⟫) = 3 := by
  sorry

-- test tameSymbol_units (degenerate)
example :
    tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪2⟫ ⟪3⟫ = 1 ∧
      ∀ f : ℚˣ, tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) f 1 = 1 := by
  sorry

-- test tameSymbol_not_kbook (non-example)
/- `tameSymbol 5 2 = 3`, while the K-book's formula at `(r, s) = (5, 2)` gives `2`. -/
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5) :
    φ (tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪5⟫ ⟪2⟫) = 3 ∧
      φ ((-1) ^ ((Rat.padicValuation 5).ord 5 * (Rat.padicValuation 5).ord 2) *
        res (Rat.padicValuation 5)
          ⟨_, zpow_ord_mul_zpow_neg_ord_mem_unitGroup (Rat.padicValuation 5) ⟪2⟫ ⟪5⟫⟩ :
            (ResidueField (Rat.padicValuation 5))ˣ) = 2 := by
  sorry

-- test tameSymbolHom_rat_five (computation)
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5) :
    φ ↑(Additive.toMul (tameSymbolHom (Rat.padicValuation 5) (Rat.surjective_padicValuation 5)
        (milnorK.symbol ![⟪5⟫, ⟪2⟫]))) = 3 ∧
      φ ↑(Additive.toMul (tameSymbolHom (Rat.padicValuation 5) (Rat.surjective_padicValuation 5)
        (milnorK.symbol ![⟪2⟫, ⟪5⟫]))) = 2 := by
  sorry

-- test tameSymbolHom_units (degenerate)
example : tameSymbolHom (Rat.padicValuation 5) (Rat.surjective_padicValuation 5)
    (milnorK.symbol ![⟪2⟫, ⟪3⟫]) = 0 := by
  sorry

-- test tameSymbolHom_generates (characterisation)
example : Subgroup.zpowers (Additive.toMul (tameSymbolHom (Rat.padicValuation 5)
    (Rat.surjective_padicValuation 5) (milnorK.symbol ![⟪2⟫, ⟪5⟫]))) = ⊤ := by
  sorry

-- test tameSymbolHom_needs_sign (non-example)
/- `{1/5, 4/5}` is a Steinberg element, so it is `0` in `K^M_2(ℚ)` and the signed symbol kills
it; the unsigned formula `res((1/5)^{v(4/5)} (4/5)^{-v(1/5)})` gives `4 ≠ 1`. -/
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5) :
    milnorK.symbol ![⟪1 / 5⟫, ⟪4 / 5⟫] = 0 ∧
      φ (res (Rat.padicValuation 5)
        ⟨_, zpow_ord_mul_zpow_neg_ord_mem_unitGroup (Rat.padicValuation 5) ⟪1 / 5⟫ ⟪4 / 5⟫⟩ :
          (ResidueField (Rat.padicValuation 5))ˣ) = 4 := by
  sorry

-- test tameSymbolHom_self (compatibility)
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5) :
    milnorK.symbol ![⟪5⟫, ⟪5⟫] = milnorK.symbol ![⟪5⟫, -1] ∧
      φ ↑(Additive.toMul (tameSymbolHom (Rat.padicValuation 5) (Rat.surjective_padicValuation 5)
        (milnorK.symbol ![⟪5⟫, ⟪5⟫]))) = 4 := by
  sorry

end Tests

-- test tameSymbol_ratFunc (compatibility)
/- At the place `t - b` of `k(t)`, `∂{a, t - b} = a` for `a ∈ kˣ` (read in `k` through the residue
field of the place); the K-book's Weil reciprocity (6.5.3) uses the inverse `a⁻¹`. -/
example {k : Type u} [Field k] (b : k) (a : kˣ) :
    residueFieldCongr (valuationSubring_eq_integers
        (Place.adicOfIrreducible (Polynomial.irreducible_X_sub_C b)))
      (tameSymbol (Place.adicOfIrreducible (Polynomial.irreducible_X_sub_C b)).valuation
        (Place.adicOfIrreducible (Polynomial.irreducible_X_sub_C b)).valuation_surjective
        (Units.map (algebraMap k (RatFunc k)).toMonoidHom a)
        (Units.mk0 (algebraMap (Polynomial k) (RatFunc k) (Polynomial.X - Polynomial.C b))
          (RatFunc.algebraMap_ne_zero (Polynomial.X_sub_C_ne_zero b))) : _) =
      algebraMap k (Place.adicOfIrreducible (Polynomial.irreducible_X_sub_C b)).ResidueField a := by
  sorry

end TauCeti.TameSymbol

/-! ## `K2SymbolsBrauer:T.3:localization-comparison` — Serre's algebra, higher residues

Convention (pinned): `d_t(x) = λ_t(x) + ∂_v(x)·Π` with **Π on the right**, so
`∂_v{u₁, …, u_{n-1}, π} = {ū₁, …, ū_{n-1}}`, degree two is the roadmap's tame symbol, and
Theorem III.7.3's residue (Π on the left, `∂^{Wb}{π, u₂, …} = {ū₂, …}`) is
`∂^{Wb} = (-1)^{n-1} ∂` on `K^M_n(F)`. -/

namespace TauCeti.MilnorK

variable (k : Type u) [Field k]

/-- **Serre's algebra** `L(k)` (`K2SymbolsBrauer:T.3/serre-residue-algebra`), degreewise:
`L(k)_0 = K^M_0(k)` and `L(k)_{n+1} = K^M_{n+1}(k) × K^M_n(k)`, the second factor written `b·Π`.
The graded multiplication is `serreAlgebra.mul`, pinned by `serreAlgebra.mul_def`. -/
def serreAlgebra : ℕ → Type u
  | 0 => milnorK k 0
  | n + 1 => milnorK k (n + 1) × milnorK k n

instance serreAlgebra.instAddCommGroup : (n : ℕ) → AddCommGroup (serreAlgebra k n)
  | 0 => inferInstanceAs (AddCommGroup (milnorK k 0))
  | n + 1 => inferInstanceAs (AddCommGroup (milnorK k (n + 1) × milnorK k n))

namespace serreAlgebra

variable {k}

/-- `L(k)_{n+1} ≃ K^M_{n+1}(k) ⊕ K^M_n(k)`: the source's direct sum is part of the construction. -/
def decompose (n : ℕ) : serreAlgebra k (n + 1) ≃+ milnorK k (n + 1) × milnorK k n :=
  AddEquiv.refl _

/-- The indeterminate `Π = (0, 1) ∈ L(k)_1`. -/
def «Π» : serreAlgebra k 1 := (decompose 0).symm (0, milnorK.one)

/-- The graded ring embedding `K^M_*(k) → L(k)`, `a ↦ (a, 0)`. -/
def of : (n : ℕ) → milnorK k n →+ serreAlgebra k n
  | 0 => AddMonoidHom.id _
  | n + 1 => (decompose n).symm.toAddMonoidHom.comp (AddMonoidHom.inl _ _)

/-- The graded multiplication of `L(k)` (data of `serreAlgebra`; its formula is `mul_def`). -/
def mul {i j : ℕ} : serreAlgebra k i →+ serreAlgebra k j →+ serreAlgebra k (i + j) := sorry

/-- Transport along an equality of degrees (a real definition). -/
def cast {m n : ℕ} (h : m = n) : serreAlgebra k m ≃+ serreAlgebra k n := by
  subst h
  exact AddEquiv.refl _

/-- `(a + bΠ)(c + dΠ) = ac + (ad + (-1)^{|c|} bc + (-1)^{|d|} bd{-1})Π`, in degrees
`|a| = i + 1`, `|c| = j + 1`. -/
theorem mul_def {i j : ℕ} (a : milnorK k (i + 1)) (b : milnorK k i) (c : milnorK k (j + 1))
    (d : milnorK k j) :
    decompose (i + 1 + j) (mul ((decompose i).symm (a, b)) ((decompose j).symm (c, d))) =
      (milnorK.mul a c, milnorK.mul a d + (-1 : ℤ) ^ (j + 1) • milnorK.cast (by omega)
          (milnorK.mul b c) +
        (-1 : ℤ) ^ j • milnorK.cast (by omega) (milnorK.mul (milnorK.mul b d) (milnorK.symbol ![-1]))) := by
  sorry

/-- `Π · Π = {-1} · Π`. -/
@[simp]
theorem «Π_mul_Π» : mul «Π» «Π» = mul (of 1 (milnorK.symbol ![(-1 : kˣ)])) (k := k) «Π» := by
  sorry

/-- `Π · x = (-1)^{|x|} x · Π` for `x ∈ K^M_n(k)`. -/
theorem «Π_mul» {n : ℕ} (x : milnorK k n) :
    mul «Π» (of n x) = (-1 : ℤ) ^ n • cast (by omega) (mul (of n x) «Π») := by
  sorry

/-- `L(k)` is graded-commutative: `x y = (-1)^{|x||y|} y x`. -/
theorem gradedComm {i j : ℕ} (x : serreAlgebra k i) (y : serreAlgebra k j) :
    mul x y = (-1 : ℤ) ^ (i * j) • cast (by omega) (mul y x) := by
  sorry

/-- The λ-part `a + bΠ ↦ a`. -/
def lambdaHom : (n : ℕ) → serreAlgebra k n →+ milnorK k n
  | 0 => AddMonoidHom.id _
  | n + 1 => (AddMonoidHom.fst _ _).comp (decompose n).toAddMonoidHom

/-- The ρ-part `a + bΠ ↦ a + b{-1}`. -/
def rhoHom : (n : ℕ) → serreAlgebra k n →+ milnorK k n
  | 0 => AddMonoidHom.id _
  | n + 1 => ((AddMonoidHom.fst _ _) +
      ((milnorK.mul (i := n) (j := 1)).flip (milnorK.symbol ![-1])).comp (AddMonoidHom.snd _ _)).comp
        (decompose n).toAddMonoidHom

/-- `lambdaHom` is a graded ring homomorphism. -/
theorem lambdaHom_mul {i j : ℕ} (x : serreAlgebra k i) (y : serreAlgebra k j) :
    lambdaHom (i + j) (mul x y) = milnorK.mul (lambdaHom i x) (lambdaHom j y) := by
  sorry

/-- `rhoHom` is a graded ring homomorphism. -/
theorem rhoHom_mul {i j : ℕ} (x : serreAlgebra k i) (y : serreAlgebra k j) :
    rhoHom (i + j) (mul x y) = milnorK.mul (rhoHom i x) (rhoHom j y) := by
  sorry

/-- On `K^M_{n+1}(k) × K^M_n(k)`: `(a, b) ↦ (a - b{c}, b)`. -/
def shiftAux (c : kˣ) (n : ℕ) : milnorK k (n + 1) × milnorK k n ≃+ milnorK k (n + 1) × milnorK k n
    where
  toFun p := (p.1 - milnorK.mul p.2 (milnorK.symbol ![c]), p.2)
  invFun p := (p.1 + milnorK.mul p.2 (milnorK.symbol ![c]), p.2)
  left_inv p := by simp
  right_inv p := by simp
  map_add' p q := by sorry

/-- For `c ∈ kˣ`, the automorphism with `Π ↦ Π - {c}` over `K^M_*(k)`:
`a + bΠ ↦ (a - b{c}) + bΠ`. -/
def shift (c : kˣ) : (n : ℕ) → serreAlgebra k n ≃+ serreAlgebra k n
  | 0 => AddEquiv.refl _
  | n + 1 => ((decompose n).trans (shiftAux c n)).trans (decompose n).symm

/-- `shift c` is multiplicative. -/
theorem shift_mul (c : kˣ) {i j : ℕ} (x : serreAlgebra k i) (y : serreAlgebra k j) :
    shift c (i + j) (mul x y) = mul (shift c i x) (shift c j y) := by
  sorry

/-- `shift c ∘ shift c' = shift (c c')`. -/
theorem shift_trans (c c' : kˣ) (n : ℕ) : (shift c n).trans (shift c' n) = shift (c * c') n := by
  sorry

/-- A field homomorphism `k → k'` induces `L(k) → L(k')` fixing `Π`. -/
def map {k' : Type v} [Field k'] (f : k →+* k') :
    (n : ℕ) → serreAlgebra k n →+ serreAlgebra k' n
  | 0 => milnorK.map f 0
  | n + 1 => (decompose n).symm.toAddMonoidHom.comp
      (((milnorK.map f (n + 1)).prodMap (milnorK.map f n)).comp (decompose n).toAddMonoidHom)

theorem map_id (n : ℕ) : map (RingHom.id k) n = AddMonoidHom.id _ := by
  sorry

theorem map_comp {k' : Type v} {k'' : Type w} [Field k'] [Field k''] (f : k →+* k')
    (g : k' →+* k'') (n : ℕ) : map (g.comp f) n = (map g n).comp (map f n) := by
  sorry

theorem «map_Π» {k' : Type v} [Field k'] (f : k →+* k') : map f 1 «Π» = «Π» := by
  sorry

end serreAlgebra

section SerreTests

variable [Fact (Nat.Prime 5)]

-- test serreAlgebra_pi_sq_F5 (computation)
example : serreAlgebra.mul serreAlgebra.«Π» serreAlgebra.«Π» =
      serreAlgebra.mul (serreAlgebra.of 1 (milnorK.symbol ![ZMod.unitOfCoprime 4 (by norm_num : Nat.Coprime 4 5)]))
        serreAlgebra.«Π» ∧
    milnorK.symbol ![ZMod.unitOfCoprime 4 (by norm_num : Nat.Coprime 4 5)] ≠ 0 := by
  sorry

-- test serreAlgebra_pi_sq_char_two (degenerate)
example {k : Type u} [Field k] [CharP k 2] :
    serreAlgebra.mul (serreAlgebra.«Π» (k := k)) serreAlgebra.«Π» = 0 := by
  sorry

-- test serreAlgebra_anticomm_F5 (characterisation)
example : serreAlgebra.mul serreAlgebra.«Π»
      (serreAlgebra.of 1 (milnorK.symbol ![ZMod.unitOfCoprime 2 (by norm_num : Nat.Coprime 2 5)])) =
      serreAlgebra.mul (serreAlgebra.of 1 (milnorK.symbol ![ZMod.unitOfCoprime 3 (by norm_num : Nat.Coprime 3 5)]))
        serreAlgebra.«Π» ∧
    serreAlgebra.mul serreAlgebra.«Π»
      (serreAlgebra.of 1 (milnorK.symbol ![ZMod.unitOfCoprime 2 (by norm_num : Nat.Coprime 2 5)])) ≠
      serreAlgebra.mul (serreAlgebra.of 1 (milnorK.symbol ![ZMod.unitOfCoprime 2 (by norm_num : Nat.Coprime 2 5)]))
        serreAlgebra.«Π» := by
  sorry

-- test serreAlgebra_lambda (compatibility)
example {k : Type u} [Field k] :
    (∀ (n : ℕ) (x : milnorK k n), serreAlgebra.lambdaHom n (serreAlgebra.of n x) = x) ∧
      serreAlgebra.lambdaHom 1 (serreAlgebra.«Π» (k := k)) = 0 := by
  sorry

-- test serreAlgebra_not_square_zero (non-example)
/- `d(5) d(-5) = Π·({-1} + Π) = 0` in `L(𝔽₅)`, as `{5, -5} = 0` requires; with `Π² = 0` only the
term `Π·{-1}` would survive, and it is nonzero. -/
example : serreAlgebra.mul serreAlgebra.«Π»
      (serreAlgebra.of 1 (milnorK.symbol ![(-1 : (ZMod 5)ˣ)]) + serreAlgebra.«Π») = 0 ∧
    serreAlgebra.mul serreAlgebra.«Π» (serreAlgebra.of 1 (milnorK.symbol ![(-1 : (ZMod 5)ˣ)])) ≠
      0 := by
  sorry

end SerreTests

end TauCeti.MilnorK

namespace TauCeti.TameSymbol

open TauCeti.MilnorK TauCeti.Steinberg


variable {F : Type u} [Field F]

/-- The unit part `u_f = f · t^{-ord f}` of `f` against a uniformiser `t` (a real definition;
the membership in the unit group is `ord u_f = 0`). -/
def unitPart (v : Valuation F ℤᵐ⁰) (t : Fˣ) (ht : v.ord (t : F) = 1) (f : Fˣ) :
    v.valuationSubring.unitGroup :=
  ⟨f * t ^ (-v.ord (f : F)), by sorry⟩

/-- Serre's map on `Fˣ` (`K2SymbolsBrauer:T.3/serre-map-steinberg`), a real definition:
`d_t(u · t^i) = {ū} + i · Π ∈ L(k)_1`. -/
def serreMapOne (v : Valuation F ℤᵐ⁰) (t : Fˣ) (ht : v.ord (t : F) = 1) (f : Fˣ) :
    serreAlgebra (ResidueField v) 1 :=
  (serreAlgebra.decompose 0).symm
    (milnorK.symbol ![res v (unitPart v t ht f)], v.ord (f : F) • milnorK.one)

/-- **Serre's map** `d_t : K^M_*(F) → L(k)` (`K2SymbolsBrauer:T.3/higher-milnor-residues`), the
graded ring homomorphism with `d_t{f} = {ū_f} + ord(f) · Π` (`serreMap_symbol`, `serreMap_mul`). -/
def serreMap (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) (t : Fˣ)
    (ht : v.ord (t : F) = 1) (n : ℕ) : milnorK F n →+ serreAlgebra (ResidueField v) n :=
  sorry

/-- **The higher residue** `∂_v : K^M_{n+1}(F) → K^M_n(k)`, the `Π`-coefficient of `d_t` with Π on
the right; it does not depend on `t` (`milnorResidue_indep`). -/
def milnorResidue (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) (n : ℕ) :
    milnorK F (n + 1) →+ milnorK (ResidueField v) n :=
  sorry

/-- **The specialisation** `λ_t : K^M_n(F) → K^M_n(k)`, the `Π`-free part of `d_t`; it depends on
`t` (`K2SymbolsBrauer:T.3/specialisation-change-of-uniformiser`). -/
def milnorSpecialisation (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) (t : Fˣ)
    (ht : v.ord (t : F) = 1) (n : ℕ) : milnorK F n →+ milnorK (ResidueField v) n :=
  sorry

variable (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) (t : Fˣ) (ht : v.ord (t : F) = 1)

/-- `d_t` in degree one is Serre's map on `Fˣ`. -/
theorem serreMap_symbol (f : Fˣ) : serreMap v hv t ht 1 (milnorK.symbol ![f]) = serreMapOne v t ht f := by
  sorry

/-- `d_t` is multiplicative. -/
theorem serreMap_mul {i j : ℕ} (x : milnorK F i) (y : milnorK F j) :
    serreMap v hv t ht (i + j) (milnorK.mul x y) =
      serreAlgebra.mul (serreMap v hv t ht i x) (serreMap v hv t ht j y) := by
  sorry

@[simp]
theorem milnorResidue_symbol_units_uniformizer {n : ℕ} (u : Fin n → v.valuationSubring.unitGroup) :
    milnorResidue v hv n (milnorK.symbol (Fin.snoc (α := fun _ => Fˣ) (fun i => (u i : Fˣ)) t)) =
      milnorK.symbol fun i => res v (u i) := by
  sorry

@[simp]
theorem milnorResidue_symbol_units {n : ℕ} (u : Fin (n + 1) → v.valuationSubring.unitGroup) :
    milnorResidue v hv n (milnorK.symbol fun i => (u i : Fˣ)) = 0 := by
  sorry

@[simp]
theorem milnorSpecialisation_symbol {n : ℕ} (u : Fin n → v.valuationSubring.unitGroup)
    (e : Fin n → ℤ) :
    milnorSpecialisation v hv t ht n (milnorK.symbol fun i => (u i : Fˣ) * t ^ e i) =
      milnorK.symbol fun i => res v (u i) := by
  sorry

/-- `λ_t` is a graded ring homomorphism. -/
theorem milnorSpecialisation_mul {i j : ℕ} (x : milnorK F i) (y : milnorK F j) :
    milnorSpecialisation v hv t ht (i + j) (milnorK.mul x y) =
      milnorK.mul (milnorSpecialisation v hv t ht i x) (milnorSpecialisation v hv t ht j y) := by
  sorry

/-- In degree one `∂_v{f} = ord_v f`. -/
theorem milnorResidue_one (f : Fˣ) :
    milnorResidue v hv 0 (milnorK.symbol ![f]) = v.ord (f : F) • milnorK.one := by
  sorry

/-- In degree two `∂_v = tameSymbolHom v`, with no inversion. -/
theorem milnorResidue_two (x : milnorK F 2) :
    milnorK.oneEquiv (milnorResidue v hv 1 x) = tameSymbolHom v hv x := by
  sorry

/-- Theorem III.7.3's residue reads the coefficient with Π on the left,
`∂^{Wb}{t, u₂, …, u_{n+1}} = {ū₂, …, ū_{n+1}}`; the roadmap's residue gives `(-1)^n` times that,
i.e. `∂^{Wb} = (-1)^n ∂_v` on `K^M_{n+1}(F)` (both vanish on symbols of units). -/
theorem milnorResidue_kbook {n : ℕ} (u : Fin n → v.valuationSubring.unitGroup) :
    milnorResidue v hv n (milnorK.symbol (Fin.cons (α := fun _ => Fˣ) t fun i => (u i : Fˣ))) =
      (-1 : ℤ) ^ n • milnorK.symbol fun i => res v (u i) := by
  sorry

theorem milnorResidue_surjective (n : ℕ) : Function.Surjective (milnorResidue v hv n) := by
  sorry

theorem milnorSpecialisation_surjective (n : ℕ) :
    Function.Surjective (milnorSpecialisation v hv t ht n) := by
  sorry

/-- `∂_v` is the Π-coefficient of `d_t` for **every** uniformiser `t`. -/
theorem milnorResidue_indep {n : ℕ} (x : milnorK F (n + 1)) :
    milnorResidue v hv n x = (serreAlgebra.decompose n (serreMap v hv t ht (n + 1) x)).2 := by
  sorry

/-- `K2SymbolsBrauer:T.3/milnor-residue-product-formula` (Ex. III.7.10 as printed, which holds in
this normalisation): for `x ∈ K^M_{i+1}(F)`, `y ∈ K^M_{j+1}(F)`,
`∂(x y) = λ_t(x) ∂(y) + (-1)^{j+1} ∂(x) ρ_t(y)`, with `ρ_t = rhoHom ∘ d_t`,
`ρ_t{u t^m} = {(-1)^m ū}`. -/
theorem milnorResidue_product_formula {i j : ℕ} (x : milnorK F (i + 1)) (y : milnorK F (j + 1)) :
    milnorResidue v hv (i + 1 + j) (milnorK.mul x y) =
      milnorK.mul (milnorSpecialisation v hv t ht (i + 1) x) (milnorResidue v hv j y) +
        (-1 : ℤ) ^ (j + 1) • milnorK.cast (by omega)
          (milnorK.mul (milnorResidue v hv i x)
            (serreAlgebra.rhoHom (j + 1) (serreMap v hv t ht (j + 1) y))) := by
  sorry

/-- The product formula (`K2SymbolsBrauer:T.3/milnor-residue-product-formula`). -/
theorem milnorResidue_mul {i j : ℕ} (x : milnorK F (i + 1)) (y : milnorK F (j + 1)) :
    milnorResidue v hv (i + 1 + j) (milnorK.mul x y) =
      milnorK.mul (milnorSpecialisation v hv t ht (i + 1) x) (milnorResidue v hv j y) +
        (-1 : ℤ) ^ (j + 1) • milnorK.cast (by omega)
          (milnorK.mul (milnorResidue v hv i x)
            (serreAlgebra.rhoHom (j + 1) (serreMap v hv t ht (j + 1) y))) :=
  milnorResidue_product_formula v hv t ht x y

/-- `K2SymbolsBrauer:T.3/milnor-residue-product-formula`, the module form: `∂_v(x y) = x̄ ∂_v(y)`
when `x` is a symbol of units, so `∂_v` is left linear over the image of `K^M_*(R^×)`. -/
theorem milnorResidue_product_formula_units {i j : ℕ} (u : Fin (i + 1) → v.valuationSubring.unitGroup)
    (y : milnorK F (j + 1)) :
    milnorResidue v hv (i + 1 + j) (milnorK.mul (milnorK.symbol fun l => (u l : Fˣ)) y) =
      milnorK.mul (milnorK.symbol fun l => res v (u l)) (milnorResidue v hv j y) := by
  sorry

/-- `K2SymbolsBrauer:T.3/serre-map-steinberg`: `d_t` is a homomorphism on `Fˣ`. -/
theorem serreMapOne_mul (f g : Fˣ) :
    serreMapOne v t ht (f * g) = serreMapOne v t ht f + serreMapOne v t ht g := by
  sorry

/-- `K2SymbolsBrauer:T.3/serre-map-steinberg`: `d_t(r) d_t(1 - r) = 0` in `L(k)_2` for
`r ≠ 0, 1` (the last case reduces to `d(x) d(-x) = 0`, which needs `Π² = {-1}Π`). -/
theorem serre_map_steinberg (r : Fˣ) (hr : (r : F) ≠ 1) :
    serreAlgebra.mul (serreMapOne v t ht r)
      (serreMapOne v t ht (Units.mk0 (1 - (r : F)) (sub_ne_zero.mpr hr.symm))) = 0 := by
  sorry

/-- `K2SymbolsBrauer:T.3/serre-map-kernel` (Ex. III.7.2): the kernel of
`d_t : K^M_{n+1}(F) → L(k)_{n+1}` is `U¹ · K^M_n(F)`, generated by the `y · {a}` with
`a ∈ U¹ = 1 + 𝔪` (equivalently the `{a} · y`, by graded commutativity). -/
theorem serre_map_kernel (n : ℕ) :
    (serreMap v hv t ht (n + 1)).ker = AddSubgroup.closure {z | ∃ (a : Fˣ) (y : milnorK F n),
      a ∈ v.valuationSubring.principalUnitGroup ∧ z = milnorK.mul y (milnorK.symbol ![a])} := by
  sorry

/-- `K2SymbolsBrauer:T.3/specialisation-change-of-uniformiser` (Ex. III.7.1 as corrected by the
errata): for `t' = c t`, `∂_v` is unchanged and `λ_{t'}(x) = λ_t(x) - ∂_v(x) · {c̄}`. -/
theorem specialisation_change_of_uniformiser (c : v.valuationSubring.unitGroup)
    (ht' : v.ord (((c : Fˣ) * t : Fˣ) : F) = 1) {n : ℕ} (x : milnorK F (n + 1)) :
    (serreAlgebra.decompose n (serreMap v hv ((c : Fˣ) * t) ht' (n + 1) x)).2 =
        (serreAlgebra.decompose n (serreMap v hv t ht (n + 1) x)).2 ∧
      milnorSpecialisation v hv ((c : Fˣ) * t) ht' (n + 1) x =
        milnorSpecialisation v hv t ht (n + 1) x -
          milnorK.mul (milnorResidue v hv n x) (milnorK.symbol ![res v c]) := by
  sorry

/-- `K2SymbolsBrauer:T.3/higher-ramification-formula` (Ex. III.7.8): for `w` over `v` with
ramification index `e`, `∂_w(res_{E/F} x) = e · res_{k_w/k_v}(∂_v x)`. -/
theorem higher_ramification_formula {E : Type v} [Field E] [Algebra F E] [FiniteDimensional F E]
    (w : Valuation E ℤᵐ⁰) (hw : Function.Surjective w) (e : ℕ) (he : 0 < e)
    (hvw : ∀ r : F, w.ord (algebraMap F E r) = e * v.ord r) {n : ℕ} (x : milnorK F (n + 1)) :
    milnorResidue w hw n (milnorK.map (algebraMap F E) (n + 1) x) =
      e • milnorK.map (residueFieldMap v w e hvw) n (milnorResidue v hv n x) := by
  sorry

/-- `K2SymbolsBrauer:T.3/rigidity`: for `F` complete for `v` and `q` prime to `char k`,
`(λ_t, ∂_v) : K^M_{n+1}(F)/q → K^M_{n+1}(k)/q ⊕ K^M_n(k)/q` is bijective (stated as injectivity
and surjectivity modulo `q`). -/
theorem rigidity [IsAdicComplete (IsLocalRing.maximalIdeal v.valuationSubring) v.valuationSubring]
    (q : ℕ) (hq : 0 < q) (hqk : (q : ResidueField v) ≠ 0) (n : ℕ) :
    (∀ x : milnorK F (n + 1), (∃ y, ((milnorSpecialisation v hv t ht (n + 1)).prod
        (milnorResidue v hv n)) x = q • y) → ∃ z, x = q • z) ∧
      ∀ y : milnorK (ResidueField v) (n + 1) × milnorK (ResidueField v) n,
        ∃ x z, ((milnorSpecialisation v hv t ht (n + 1)).prod (milnorResidue v hv n)) x =
          y + q • z := by
  sorry

end TauCeti.TameSymbol

namespace TauCeti.TameSymbol

open TauCeti.MilnorK


variable {F : Type u} [Field F]

/-- `K2SymbolsBrauer:T.3/finite-support`: for a family of discrete valuations in which each
`f ∈ Fˣ` has nonzero order at finitely many members (the places of a function field,
`TauCeti.Place.finite_setOf_ord_ne_zero`; the height-one primes of a Dedekind domain), each
`x ∈ K^M_{n+1}(F)` has nonzero residue at finitely many members. -/
theorem finite_support {I : Type v} (v : I → Valuation F ℤᵐ⁰) (hv : ∀ i, Function.Surjective (v i))
    (hfin : ∀ f : Fˣ, {i | (v i).ord (f : F) ≠ 0}.Finite) (n : ℕ) (x : milnorK F (n + 1)) :
    {i | milnorResidue (v i) (hv i) n x ≠ 0}.Finite := by
  sorry

/-- `K2SymbolsBrauer:T.3/finite-support` in degree two: `∂_v{f, g} = 1` outside the union of the
supports of `f` and `g`. -/
theorem finite_support_tameSymbol {I : Type v} (v : I → Valuation F ℤᵐ⁰)
    (hv : ∀ i, Function.Surjective (v i)) (f g : Fˣ) :
    {i | tameSymbol (v i) (hv i) f g ≠ 1} ⊆
      {i | (v i).ord (f : F) ≠ 0} ∪ {i | (v i).ord (g : F) ≠ 0} := by
  sorry

/- `K2SymbolsBrauer:T.3/localization-boundary`: not stated here; needs the boundary
`∂ : K₂(F) → K₁(k)` of the localisation sequence of a DVR with its `K_*(R)`-module structure
(supplier: GeneralAlgebraicKTheory:K.3 and GeneralAlgebraicKTheory:K.7). The comparison it
records: with the K-book's right-linear normalisation `∂{f, g} = tameSymbol v g f`
(the inverse of this roadmap's), with the left-linear one `∂{f, g} = tameSymbol v f g`. -/

/-! ### Unit tests for the higher residues -/

section ResidueTests

variable [Fact (Nat.Prime 5)]

local notation "⟪" q "⟫" => Units.mk0 (q : ℚ) (by norm_num)

-- test milnorResidue_degree_one (computation)
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5)
    (h5 : (Rat.padicValuation 5).ord ((⟪5⟫ : ℚˣ) : ℚ) = 1) :
    milnorK.zeroEquiv (milnorResidue (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) 0
        (milnorK.symbol ![⟪50⟫])) = 2 ∧
      φ ↑(Additive.toMul (milnorK.oneEquiv (milnorSpecialisation (Rat.padicValuation 5)
        (Rat.surjective_padicValuation 5) ⟪5⟫ h5 1 (milnorK.symbol ![⟪50⟫])))) = 2 := by
  sorry

-- test milnorResidue_degree_two (compatibility)
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5) :
    φ ↑(Additive.toMul (milnorK.oneEquiv (milnorResidue (Rat.padicValuation 5)
        (Rat.surjective_padicValuation 5) 1 (milnorK.symbol ![⟪5⟫, ⟪2⟫])))) = 3 ∧
      φ (tameSymbol (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) ⟪5⟫ ⟪2⟫) = 3 ∧
      φ ↑(Additive.toMul (milnorK.oneEquiv (milnorResidue (Rat.padicValuation 5)
        (Rat.surjective_padicValuation 5) 1 (milnorK.symbol ![⟪2⟫, ⟪5⟫])))) = 2 := by
  sorry

-- test milnorSpecialisation_depends_on_uniformizer (characterisation)
example (φ : ResidueField (Rat.padicValuation 5) →+* ZMod 5)
    (h5 : (Rat.padicValuation 5).ord ((⟪5⟫ : ℚˣ) : ℚ) = 1)
    (h10 : (Rat.padicValuation 5).ord ((⟪10⟫ : ℚˣ) : ℚ) = 1) :
    φ ↑(Additive.toMul (milnorK.oneEquiv (milnorSpecialisation (Rat.padicValuation 5)
        (Rat.surjective_padicValuation 5) ⟪5⟫ h5 1 (milnorK.symbol ![⟪5⟫])))) = 1 ∧
      φ ↑(Additive.toMul (milnorK.oneEquiv (milnorSpecialisation (Rat.padicValuation 5)
        (Rat.surjective_padicValuation 5) ⟪10⟫ h10 1 (milnorK.symbol ![⟪5⟫])))) = 3 ∧
      milnorResidue (Rat.padicValuation 5) (Rat.surjective_padicValuation 5) 0
        (milnorK.symbol ![⟪5⟫]) = milnorK.one := by
  sorry

-- test milnorResidue_needs_serre_relation (non-example)
/- `{5, -5} = 0` in `K^M_2(ℚ)`; in `L(k_{v₅})`, `d(5) d(-5) = Π·({-1} + Π) = 0`, whereas with
`Π² = 0` the value would be `Π·{-1} = {-1}Π ≠ 0`. -/
example : milnorK.symbol ![⟪5⟫, -⟪5⟫] = 0 ∧
    serreAlgebra.mul serreAlgebra.«Π»
      (serreAlgebra.of 1 (milnorK.symbol ![(-1 : (ResidueField (Rat.padicValuation 5))ˣ)]) +
        serreAlgebra.«Π») = 0 ∧
    serreAlgebra.mul serreAlgebra.«Π»
      (serreAlgebra.of 1 (milnorK.symbol ![(-1 : (ResidueField (Rat.padicValuation 5))ˣ)])) ≠ 0 := by
  sorry

end ResidueTests

section RatFuncTests

/-- The constants of `ℚ(t)` in the residue field of the place `P` (a real definition). -/
def placeConst {k : Type u} [Field k] (P : Place k (RatFunc k)) : k →+* ResidueField P.valuation :=
  (residueFieldCongr (valuationSubring_eq_integers P)).symm.toRingHom.comp
    (algebraMap k P.ResidueField)

/-- A constant of `k(t)` as a unit (a real definition). -/
def constUnit {k : Type u} [Field k] (c : kˣ) : (RatFunc k)ˣ :=
  Units.map (algebraMap k (RatFunc k)).toMonoidHom c

/-- The variable `t` of `k(t)` as a unit. -/
def varUnit (k : Type u) [Field k] : (RatFunc k)ˣ := Units.mk0 RatFunc.X RatFunc.X_ne_zero

-- test milnorResidue_degree_three_position (computation)
/- At the `t`-adic place of `k(t)`: `∂{t, c, d} = {c, d}` and `∂{c, t, d} = -{c, d}`; for
`k = ℚ`, `c = 5`, `d = 2` these differ in `K^M_2(ℚ)` (the tame symbol at `5` sends them to `3`
and `2`), which is the third conjunct. -/
example {k : Type u} [Field k] (c d : kˣ) :
    milnorResidue (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation
        (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation_surjective 2
        (milnorK.symbol ![varUnit k, constUnit c, constUnit d]) =
      milnorK.map (placeConst (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k)))) 2
        (milnorK.symbol ![c, d]) ∧
    milnorResidue (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation
        (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation_surjective 2
        (milnorK.symbol ![constUnit c, varUnit k, constUnit d]) =
      -milnorK.map (placeConst (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k)))) 2
        (milnorK.symbol ![c, d]) ∧
    milnorK.symbol ![Units.mk0 (5 : ℚ) (by norm_num), Units.mk0 (2 : ℚ) (by norm_num)] ≠
      -milnorK.symbol ![Units.mk0 (5 : ℚ) (by norm_num), Units.mk0 (2 : ℚ) (by norm_num)] := by
  sorry

-- test milnorResidue_units (degenerate)
/- Symbols of units have zero residue; at the `t`-adic place of `k(t)` (for `k = ℚ` in the
source) `∂_t` vanishes on the image of `K^M_*(k)` and `λ_t` restricts to the identity there. -/
example {k : Type u} [Field k]
    (ht : (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation.ord
      ((varUnit k : (RatFunc k)ˣ) : RatFunc k) = 1) :
    (∀ (n : ℕ) (u : Fin (n + 1) →
        (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation.valuationSubring.unitGroup),
      milnorResidue (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation
        (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation_surjective n
        (milnorK.symbol fun i => (u i : (RatFunc k)ˣ)) = 0) ∧
    (∀ (n : ℕ) (x : milnorK k (n + 1)),
      milnorResidue (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation
        (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation_surjective n
        (milnorK.map (algebraMap k (RatFunc k)) (n + 1) x) = 0) ∧
    ∀ (n : ℕ) (x : milnorK k n),
      milnorSpecialisation (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation
        (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k))).valuation_surjective
        (varUnit k) ht n (milnorK.map (algebraMap k (RatFunc k)) n x) =
      milnorK.map (placeConst (Place.adicOfIrreducible (Polynomial.irreducible_X (R := k)))) n x := by
  sorry

end RatFuncTests

end TauCeti.TameSymbol

/-! ## `K2SymbolsBrauer:T.4` — the Bass–Tate sequence, Milnor transfers and Weil reciprocity

Convention (pinned): the transfer is normalised by `-∂_∞ = Σ_p N_p ∘ ∂_p` on `K^M_{n+1} F(t)`,
the residues being those of `T.3/higher-milnor-residues` (Π on the right). -/

namespace TauCeti.MilnorK

open TauCeti.TameSymbol


variable {F : Type u} [Field F]

/-- The monic irreducible polynomials of `F[t]`: the finite places of `F(t)`. -/
abbrev MonicIrreducible (F : Type u) [Field F] := {q : F[X] // q.Monic ∧ Irreducible q}

/-- The valuation of the finite place of `q`, Tau Ceti's `TauCeti.Place.adicOfIrreducible`. -/
abbrev placeVal (q : MonicIrreducible F) : Valuation (RatFunc F) ℤᵐ⁰ :=
  (Place.adicOfIrreducible q.2.2).valuation

/-- The residue `∂_q : K^M_{n+1} F(t) → K^M_n(k_q)` at the finite place `q`. -/
def residueAt (q : MonicIrreducible F) (n : ℕ) :
    milnorK (RatFunc F) (n + 1) →+ milnorK (TameSymbol.ResidueField (placeVal q)) n :=
  milnorResidue (placeVal q) (Place.adicOfIrreducible q.2.2).valuation_surjective n

/-- The residue field at infinity is `F` (`TauCeti.Place.inftyResidueFieldEquiv`, read in the
valuation subring; a real definition). -/
def inftyResidueEquiv (F : Type u) [Field F] :
    TameSymbol.ResidueField (Place.infty F).valuation ≃+* F :=
  (residueFieldCongr (valuationSubring_eq_integers (Place.infty F))).trans
    (Place.inftyResidueFieldEquiv F).symm.toRingEquiv

/-- The residue `∂_∞ : K^M_{n+1} F(t) → K^M_n(F)` at the place at infinity. -/
def residueInfty (n : ℕ) : milnorK (RatFunc F) (n + 1) →+ milnorK F n :=
  (milnorK.map (inftyResidueEquiv F).toRingHom n).comp
    (milnorResidue (Place.infty F).valuation (Place.infty F).valuation_surjective n)

/-- The transfer `N_q : K^M_n(k_q) → K^M_n(F)` of the residue field of the finite place `q`: the
unique homomorphisms with `-∂_∞ = Σ_q N_q ∘ ∂_q` (`residueInfty_eq_neg_sum_transfer`), which exist
because the residue sum is onto with kernel `K^M_{n+1}(F)` (`bass_tate_sequence`). -/
def placeTransfer (q : MonicIrreducible F) (n : ℕ) :
    milnorK (TameSymbol.ResidueField (placeVal q)) n →+ milnorK F n :=
  sorry

/-- `F⟮a⟯ ≃ F[t]/(π) ≃ k_π` for `π` the minimal polynomial of `a` (a real definition). -/
def simpleResidueEquiv {E : Type v} [Field E] [Algebra F E] (a : E) (ha : IsIntegral F a) :
    TameSymbol.ResidueField (placeVal ⟨minpoly F a, minpoly.monic ha, minpoly.irreducible ha⟩)
      ≃+* F⟮a⟯ :=
  (residueFieldCongr (valuationSubring_eq_integers
      (Place.adicOfIrreducible (minpoly.irreducible ha)))).trans
    ((Place.adicOfIrreducibleResidueFieldEquiv (minpoly.irreducible ha)).symm.toRingEquiv.trans
      (IntermediateField.adjoinRootEquivAdjoin F ha).toRingEquiv)

/-- **The simple transfer** `N_{a/F} : K^M_n(F⟮a⟯) → K^M_n(F)`
(`K2SymbolsBrauer:T.4/simple-transfer`, Definition III.7.5): `N_π` transported to `F⟮a⟯` by
`F⟮a⟯ ≃ F[t]/(π)`, `π` the minimal polynomial of `a`. Independence of `a` is Kato's theorem
(`milnor_transfer_transitivity_simple`), not part of the definition. -/
def milnorTransferSimple (F : Type u) [Field F] {E : Type v} [Field E] [Algebra F E] (a : E)
    (ha : IsIntegral F a) (n : ℕ) : milnorK F⟮a⟯ n →+ milnorK F n :=
  (placeTransfer ⟨minpoly F a, minpoly.monic ha, minpoly.irreducible ha⟩ n).comp
    (milnorK.map (simpleResidueEquiv a ha).symm.toRingHom n)

variable {E : Type v} [Field E] [Algebra F E] (a : E) (ha : IsIntegral F a)

/-- `K2SymbolsBrauer:T.4/transfer-low-degrees` (Exercise III.7.5): in degree one `N_{a/F}` is the
field norm `Algebra.norm F`. For `ℚ(∛2)/ℚ`, the factor `π(0) = -2` and the sign `(-1)^{de} = -1`
give `N(∛2) = 2`. -/
theorem transfer_low_degrees (x : (F⟮a⟯)ˣ) :
    milnorTransferSimple F a ha 1 (milnorK.symbol ![x]) =
      milnorK.symbol ![Units.map (Algebra.norm F : F⟮a⟯ →* F) x] := by
  sorry

/-- `K2SymbolsBrauer:T.4/milnor-projection-formula`: `N_{a/F}(res(x) · y) = x · N_{a/F}(y)`. -/
theorem milnor_projection_formula {i j : ℕ} (x : milnorK F i) (y : milnorK F⟮a⟯ j) :
    milnorTransferSimple F a ha (i + j) (milnorK.mul (milnorK.map (algebraMap F F⟮a⟯) i x) y) =
      milnorK.mul x (milnorTransferSimple F a ha j y) := by
  sorry

/-- `K2SymbolsBrauer:T.4/restriction-transfer-degree`: `N_{a/F} ∘ res = [F⟮a⟯ : F]`. -/
theorem restriction_transfer_degree {n : ℕ} (x : milnorK F n) :
    milnorTransferSimple F a ha n (milnorK.map (algebraMap F F⟮a⟯) n x) =
      Module.finrank F F⟮a⟯ • x := by
  sorry

/-- `K2SymbolsBrauer:T.4/restriction-transfer-degree`: the kernel of `res_{F⟮a⟯/F}` is killed by
`[F⟮a⟯ : F]`. -/
theorem restriction_transfer_degree_ker {n : ℕ} (x : milnorK F n)
    (hx : milnorK.map (algebraMap F F⟮a⟯) n x = 0) : Module.finrank F F⟮a⟯ • x = 0 := by
  sorry

/-- The defining property: if `∂_π(y)` corresponds to `x` and `∂_p(y) = 0` for `p ≠ π`, then
`N_{a/F}(x) = -∂_∞(y)`. -/
theorem milnorTransferSimple_eq_neg_residueInfty {n : ℕ} (y : milnorK (RatFunc F) (n + 1))
    (x : milnorK F⟮a⟯ n)
    (hx : milnorK.map (simpleResidueEquiv a ha).toRingHom n
      (residueAt ⟨minpoly F a, minpoly.monic ha, minpoly.irreducible ha⟩ n y) = x)
    (hy : ∀ p : MonicIrreducible F, p.1 ≠ minpoly F a → residueAt p n y = 0) :
    milnorTransferSimple F a ha n x = -residueInfty n y := by
  sorry

/-- Weil's formula III.7.5.1: `-∂_∞(y) = Σ_p N_p(∂_p y)`, a finite sum. -/
theorem residueInfty_eq_neg_sum_transfer {n : ℕ} (y : milnorK (RatFunc F) (n + 1)) :
    -residueInfty n y = ∑ᶠ p : MonicIrreducible F, placeTransfer p n (residueAt p n y) := by
  sorry

@[simp]
theorem milnorTransferSimple_degree_zero (m : milnorK F⟮a⟯ 0) :
    milnorK.zeroEquiv (milnorTransferSimple F a ha 0 m) =
      (Module.finrank F F⟮a⟯ : ℤ) * milnorK.zeroEquiv m := by
  sorry

/-- If `a ∈ F` then `N_{a/F}` is the identity (read through `F ≃ F⟮a⟯`). -/
@[simp]
theorem milnorTransferSimple_of_mem (c : F)
    (hc : IsIntegral F (algebraMap F E c)) {n : ℕ} (x : milnorK F n) :
    milnorTransferSimple F (algebraMap F E c) hc n
      (milnorK.map (algebraMap F F⟮algebraMap F E c⟯) n x) = x := by
  sorry

/-- The projection formula (`K2SymbolsBrauer:T.4/milnor-projection-formula`). -/
theorem milnorTransferSimple_mul_restrict {i j : ℕ} (x : milnorK F i) (y : milnorK F⟮a⟯ j) :
    milnorTransferSimple F a ha (i + j) (milnorK.mul (milnorK.map (algebraMap F F⟮a⟯) i x) y) =
      milnorK.mul x (milnorTransferSimple F a ha j y) :=
  milnor_projection_formula a ha x y

/-- The degree formula (`K2SymbolsBrauer:T.4/restriction-transfer-degree`). -/
theorem milnorTransferSimple_restrict {n : ℕ} (x : milnorK F n) :
    milnorTransferSimple F a ha n (milnorK.map (algebraMap F F⟮a⟯) n x) =
      Module.finrank F F⟮a⟯ • x :=
  restriction_transfer_degree a ha x

/-- In degree one `N_{a/F}` is `Algebra.norm F` (`K2SymbolsBrauer:T.4/transfer-low-degrees`). -/
theorem milnorTransferSimple_one_eq_norm (x : (F⟮a⟯)ˣ) :
    milnorTransferSimple F a ha 1 (milnorK.symbol ![x]) =
      milnorK.symbol ![Units.map (Algebra.norm F : F⟮a⟯ →* F) x] :=
  transfer_low_degrees a ha x

/-- `N_{a/F}` is the same with Theorem III.7.3's residues `∂^{Wb} = (-1)^n ∂` on `K^M_{n+1}`:
every residue in the defining identity changes by the same sign. -/
theorem milnorTransferSimple_kbook {n : ℕ} (y : milnorK (RatFunc F) (n + 1)) (x : milnorK F⟮a⟯ n)
    (hx : milnorK.map (simpleResidueEquiv a ha).toRingHom n
      ((-1 : ℤ) ^ n • residueAt ⟨minpoly F a, minpoly.monic ha, minpoly.irreducible ha⟩ n y) = x)
    (hy : ∀ p : MonicIrreducible F, p.1 ≠ minpoly F a → (-1 : ℤ) ^ n • residueAt p n y = 0) :
    milnorTransferSimple F a ha n x = -((-1 : ℤ) ^ n • residueInfty n y) := by
  sorry

/-- The minimal polynomial `π` of `a` as a unit of `F(t)`. -/
def minpolyUnit (F : Type u) [Field F] {E : Type v} [Field E] [Algebra F E] (a : E)
    (ha : IsIntegral F a) : (RatFunc F)ˣ :=
  Units.mk0 (algebraMap F[X] (RatFunc F) (minpoly F a)) (RatFunc.algebraMap_ne_zero (minpoly.ne_zero ha))

-- test milnorTransferSimple_degree_zero_eq (computation)
/- `N_{a/F}(1) = d`, from `y = π`: `∂_π(π) = 1` and `∂_∞(π) = -d`. -/
example : milnorK.zeroEquiv (milnorTransferSimple F a ha 0 milnorK.one) = Module.finrank F F⟮a⟯ ∧
    residueAt ⟨minpoly F a, minpoly.monic ha, minpoly.irreducible ha⟩ 0
      (milnorK.symbol ![minpolyUnit F a ha]) = milnorK.one ∧
    milnorK.zeroEquiv (residueInfty 0 (milnorK.symbol ![minpolyUnit F a ha])) =
      -(Module.finrank F F⟮a⟯ : ℤ) := by
  sorry

-- test milnorTransferSimple_of_mem_eq_id (degenerate)
/- If `a ∈ F` (`π = t - a`), `N_{a/F} = id`. In this roadmap's normalisation (Π on the right) the
witness is `y = {x, t - a}`, with `∂_{t-a}(y) = x` and `∂_∞(y) = -x`; the packet's
`y = {t - a, x}` has residues `(-1)^n x` and `-(-1)^n x` (`{t - a, x} = (-1)^n {x, t - a}`). -/
example (c : F) (n : ℕ) (x : milnorK F n) :
    residueAt ⟨Polynomial.X - Polynomial.C c, Polynomial.monic_X_sub_C c,
        Polynomial.irreducible_X_sub_C c⟩ n
      (milnorK.mul (milnorK.map (algebraMap F (RatFunc F)) n x)
        (milnorK.symbol ![Units.mk0 (algebraMap F[X] (RatFunc F) (Polynomial.X - Polynomial.C c))
          (RatFunc.algebraMap_ne_zero (Polynomial.X_sub_C_ne_zero c))])) =
      milnorK.map (placeConst (Place.adicOfIrreducible (Polynomial.irreducible_X_sub_C c))) n x ∧
    residueInfty n (milnorK.mul (milnorK.map (algebraMap F (RatFunc F)) n x)
        (milnorK.symbol ![Units.mk0 (algebraMap F[X] (RatFunc F) (Polynomial.X - Polynomial.C c))
          (RatFunc.algebraMap_ne_zero (Polynomial.X_sub_C_ne_zero c))])) = -x := by
  sorry

-- test milnorTransferSimple_one_eq_algebraNorm (compatibility)
/- For `ℚ(i)/ℚ`, `N(1 + i) = 2`, read in `ℂ ⊇ ℚ⟮i⟯`. -/
example (hI : IsIntegral ℚ Complex.I)
    (h : (1 + IntermediateField.AdjoinSimple.gen ℚ Complex.I : ℚ⟮Complex.I⟯) ≠ 0) :
    milnorTransferSimple ℚ Complex.I hI 1 (milnorK.symbol ![Units.mk0 _ h]) =
      milnorK.symbol ![Units.mk0 (2 : ℚ) (by norm_num)] := by
  sorry

-- test milnorTransferSimple_sign (non-example)
/- The sign is forced: `∂_∞(π) = -[F⟮a⟯ : F]` while `N_{a/F}(1) = [F⟮a⟯ : F]`, so the maps defined
by `+∂_∞ = Σ N_p ∂_p` would give `N_{a/F}(1) = -[F⟮a⟯ : F]`. -/
example (hd : Module.finrank F F⟮a⟯ ≠ 0) :
    milnorK.zeroEquiv (residueInfty 0 (milnorK.symbol ![minpolyUnit F a ha])) ≠
      milnorK.zeroEquiv (milnorTransferSimple F a ha 0 milnorK.one) := by
  sorry

-- test milnorTransferSimple_projection_linear (characterisation)
/- `N_{a/F}{c, a - d} = {c, N(a - d)}` for `c ∈ Fˣ`, `d ∈ F`. -/
example (c : Fˣ) (d : F)
    (h : (IntermediateField.AdjoinSimple.gen F a - algebraMap F F⟮a⟯ d : F⟮a⟯) ≠ 0) :
    milnorTransferSimple F a ha 2
        (milnorK.symbol ![Units.map (algebraMap F F⟮a⟯).toMonoidHom c, Units.mk0 _ h]) =
      milnorK.symbol ![c, Units.map (Algebra.norm F : F⟮a⟯ →* F) (Units.mk0 _ h)] := by
  sorry

end TauCeti.MilnorK

namespace TauCeti.MilnorK

open TauCeti.TameSymbol


variable {F : Type u} [Field F]

/-- The Milnor norm `N_{E/F} : K^M_n(E) → K^M_n(F)` of a finite extension, the composite of simple
transfers along any generating tower, well defined by Kato's theorem
(`K2SymbolsBrauer:T.4/milnor-transfer-transitivity`). -/
def milnorNorm (F : Type u) [Field F] (E : Type v) [Field E] [Algebra F E] (n : ℕ) :
    milnorK E n →+ milnorK F n :=
  sorry

/-- The Milnor norm along a field homomorphism `K → L` (a real definition from `milnorNorm`). -/
def milnorNormOf {K : Type u} {L : Type v} [Field K] [Field L] (f : K →+* L) (n : ℕ) :
    milnorK L n →+ milnorK K n :=
  letI := f.toAlgebra
  milnorNorm K L n

/-- `K2SymbolsBrauer:T.4/milnor-transfer-transitivity` (Kato): `N_{E/F} = N_{K/F} ∘ N_{E/K}` for
every intermediate field. -/
theorem milnor_transfer_transitivity {K : Type v} {E : Type w} [Field K] [Field E] [Algebra F K]
    [Algebra K E] [Algebra F E] [IsScalarTower F K E] [FiniteDimensional F K]
    [FiniteDimensional K E] (n : ℕ) :
    milnorNorm F E n = (milnorNorm F K n).comp (milnorNorm K E n) := by
  sorry

/-- `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`: for a simple extension `N_{F⟮a⟯/F} = N_{a/F}`
for **every** generator `a` (not part of the definition of the simple transfer). -/
theorem milnor_transfer_transitivity_simple {E : Type v} [Field E] [Algebra F E] (a : E)
    (ha : IsIntegral F a) (n : ℕ) : milnorNorm F F⟮a⟯ n = milnorTransferSimple F a ha n := by
  sorry

/-- `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`: in degree zero `N_{E/F}` is multiplication
by `[E : F]`. -/
theorem milnor_transfer_transitivity_degree_zero {E : Type v} [Field E] [Algebra F E]
    [FiniteDimensional F E] (m : milnorK E 0) :
    milnorK.zeroEquiv (milnorNorm F E 0 m) = (Module.finrank F E : ℤ) * milnorK.zeroEquiv m := by
  sorry

/-- `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`: in degree one `N_{E/F}` is
`Algebra.norm F`, whose transitivity is the pinned `Algebra.norm_norm`. -/
theorem milnor_transfer_transitivity_degree_one {E : Type v} [Field E] [Algebra F E]
    [FiniteDimensional F E] (x : Eˣ) :
    milnorNorm F E 1 (milnorK.symbol ![x]) =
      milnorK.symbol ![Units.map (Algebra.norm F : E →* F) x] := by
  sorry

/-- `K2SymbolsBrauer:T.4/milnor-projection-formula` for the Milnor norm of a finite extension. -/
theorem milnor_projection_formula_milnorNorm {E : Type v} [Field E] [Algebra F E]
    [FiniteDimensional F E] {i j : ℕ} (x : milnorK F i) (y : milnorK E j) :
    milnorNorm F E (i + j) (milnorK.mul (milnorK.map (algebraMap F E) i x) y) =
      milnorK.mul x (milnorNorm F E j y) := by
  sorry

/-- `K2SymbolsBrauer:T.4/restriction-transfer-degree` for the Milnor norm, degrees multiplying
along a tower. -/
theorem restriction_transfer_degree_milnorNorm {E : Type v} [Field E] [Algebra F E]
    [FiniteDimensional F E] {n : ℕ} (x : milnorK F n) :
    milnorNorm F E n (milnorK.map (algebraMap F E) n x) = Module.finrank F E • x := by
  sorry

/-- `x⁻¹` as a unit of `F(t)`: the uniformiser at infinity (`TauCeti.Place.isUniformizer_infty`). -/
def inftyUniformizer (F : Type u) [Field F] : (RatFunc F)ˣ :=
  Units.mk0 (RatFunc.X⁻¹) (inv_ne_zero RatFunc.X_ne_zero)

theorem ord_infty_X_inv (F : Type u) [Field F] :
    (Place.infty F).valuation.ord ((inftyUniformizer F : (RatFunc F)ˣ) : RatFunc F) = 1 := by
  sorry

/-- The leading coefficient `lead(f)` of a nonzero rational function (the denominator is monic,
so it is the leading coefficient of the numerator). -/
def leadUnit (f : (RatFunc F)ˣ) : Fˣ :=
  Units.mk0 (f : RatFunc F).num.leadingCoeff (by simp [RatFunc.num_ne_zero f.ne_zero])

/-- `K2SymbolsBrauer:T.4/leading-coefficient-splitting` (Example III.7.3.2): the specialisation at
infinity with respect to `t⁻¹` is `{f₁, …, fₙ} ↦ {lead f₁, …, lead fₙ}`, it is the identity on the
image of `K^M_n(F)`, and `∂_∞` vanishes there. -/
theorem leading_coefficient_splitting (n : ℕ) (f : Fin n → (RatFunc F)ˣ) :
    milnorSpecialisation (Place.infty F).valuation (Place.infty F).valuation_surjective
        (inftyUniformizer F) (ord_infty_X_inv F) n (milnorK.symbol f) =
      milnorK.map (placeConst (Place.infty F)) n (milnorK.symbol fun i => leadUnit (f i)) ∧
    (∀ x : milnorK F n, milnorSpecialisation (Place.infty F).valuation
        (Place.infty F).valuation_surjective (inftyUniformizer F) (ord_infty_X_inv F) n
        (milnorK.map (algebraMap F (RatFunc F)) n x) = milnorK.map (placeConst (Place.infty F)) n x) ∧
    ∀ x : milnorK F (n + 1), residueInfty n (milnorK.map (algebraMap F (RatFunc F)) (n + 1) x) = 0 := by
  sorry

/-- `K2SymbolsBrauer:T.4/bass-tate-sequence` (Theorem III.7.4): for `n ≥ 0`,
`0 → K^M_{n+1}(F) → K^M_{n+1} F(t) → ⊕_π K^M_n(F[t]/π) → 0` is exact — injectivity, exactness in
the middle, surjectivity onto finitely supported families — and is split by the specialisation
at infinity. The place at infinity is not a component of the residue map. -/
theorem bass_tate_sequence (n : ℕ) :
    Function.Injective (milnorK.map (algebraMap F (RatFunc F)) (n + 1)) ∧
    (∀ x : milnorK (RatFunc F) (n + 1), (∀ q : MonicIrreducible F, residueAt q n x = 0) ↔
      x ∈ (milnorK.map (algebraMap F (RatFunc F)) (n + 1)).range) ∧
    (∀ y : Π₀ q : MonicIrreducible F, milnorK (TameSymbol.ResidueField (placeVal q)) n,
      ∃ x, ∀ q, residueAt q n x = y q) ∧
    ∀ x : milnorK F (n + 1), milnorSpecialisation (Place.infty F).valuation
      (Place.infty F).valuation_surjective (inftyUniformizer F) (ord_infty_X_inv F) (n + 1)
      (milnorK.map (algebraMap F (RatFunc F)) (n + 1) x) =
        milnorK.map (placeConst (Place.infty F)) (n + 1) x := by
  sorry

/-- A nonzero polynomial as a unit of `F(t)`. -/
def polyUnit (p : F[X]) (hp : p ≠ 0) : (RatFunc F)ˣ :=
  Units.mk0 (algebraMap F[X] (RatFunc F) p) (RatFunc.algebraMap_ne_zero hp)

/-- `L_d ⊆ K^M_n F(t)`: generated by symbols whose entries are nonzero polynomials of degree
`≤ d`; `L_0` is the image of `K^M_n(F)`. -/
def degreeFiltration (F : Type u) [Field F] (n d : ℕ) : AddSubgroup (milnorK (RatFunc F) n) :=
  AddSubgroup.closure {z | ∃ (p : Fin n → F[X]) (hp : ∀ i, p i ≠ 0), (∀ i, (p i).natDegree ≤ d) ∧
    z = milnorK.symbol fun i => polyUnit (p i) (hp i)}

/-- `K2SymbolsBrauer:T.4/degree-reduction` (i) (Exercise III.6.2, corrected): for monic
`e₁ ≠ e₂` of the same degree and `h = e₁ - e₂`,
`{e₁, e₂} = {h, e₂} - {h, e₁} + {e₁, -1}`. -/
theorem degree_reduction (e₁ e₂ : F[X]) (h₁ : e₁.Monic) (h₂ : e₂.Monic)
    (hdeg : e₁.natDegree = e₂.natDegree) (hne : e₁ ≠ e₂) :
    milnorK.symbol ![polyUnit e₁ h₁.ne_zero, polyUnit e₂ h₂.ne_zero] =
      milnorK.symbol ![polyUnit (e₁ - e₂) (sub_ne_zero.mpr hne), polyUnit e₂ h₂.ne_zero] -
        milnorK.symbol ![polyUnit (e₁ - e₂) (sub_ne_zero.mpr hne), polyUnit e₁ h₁.ne_zero] +
        milnorK.symbol ![polyUnit e₁ h₁.ne_zero, -1] := by
  sorry

/-- `K2SymbolsBrauer:T.4/degree-reduction` (ii): `L_d` is generated by `L_{d-1}` and the symbols
`{π, a₂, …, a_{n+1}}` with `π` monic irreducible of degree `d` and `deg aᵢ < d`. -/
theorem degree_reduction_generation (n d : ℕ) (hd : 1 ≤ d) :
    degreeFiltration F (n + 1) d = degreeFiltration F (n + 1) (d - 1) ⊔
      AddSubgroup.closure {z | ∃ (π : MonicIrreducible F) (a : Fin n → F[X]) (ha : ∀ i, a i ≠ 0),
        π.1.natDegree = d ∧ (∀ i, (a i).natDegree < d) ∧
        z = milnorK.symbol (Fin.cons (α := fun _ => (RatFunc F)ˣ) (polyUnit π.1 π.2.2.ne_zero)
          fun i => polyUnit (a i) (ha i))} := by
  sorry

/-- `L_d / L_{d-1}`. -/
abbrev degreeQuotient (F : Type u) [Field F] (n d : ℕ) : Type u :=
  degreeFiltration F n d ⧸ (degreeFiltration F n (d - 1)).addSubgroupOf (degreeFiltration F n d)

/-- `K2SymbolsBrauer:T.4/residue-section` (Lemma III.7.4.1): for `π` monic irreducible of degree
`d`, there is a unique `h_π : K^M_n(F[t]/π) → L_d / L_{d-1}` with
`h_π{ā₁, …, āₙ} = [{a₁, …, aₙ, π}]`, the `aᵢ` being the representatives of degree `< d`. The
source puts `π` first; with `π` last, `h_π` is a section of this roadmap's residue `∂_π`. -/
theorem residue_section (π : F[X]) [Fact (Irreducible π)] (hπ : π.Monic) (n : ℕ) :
    ∃! h : milnorK (AdjoinRoot π) n →+ degreeQuotient F (n + 1) π.natDegree,
      ∀ (a : Fin n → F[X]) (ha : ∀ i, a i ≠ 0) (_ : ∀ i, (a i).natDegree < π.natDegree)
        (ha' : ∀ i, AdjoinRoot.mk π (a i) ≠ 0),
        h (milnorK.symbol fun i => Units.mk0 _ (ha' i)) =
          QuotientAddGroup.mk ⟨milnorK.symbol (Fin.snoc (α := fun _ => (RatFunc F)ˣ)
            (fun i => polyUnit (a i) (ha i)) (polyUnit π hπ.ne_zero)), by sorry⟩ := by
  sorry

/-- `K2SymbolsBrauer:T.4/filtration-quotients` (Lemma III.7.4.2), in this roadmap's normalisation:
for `deg π = d`, `∂_π` vanishes on `L_{d-1}`, `∂_π{a₁, …, aₙ, π} = {ā₁, …, āₙ}` (Π on the right),
`∂_{π'}` kills `{a₁, …, aₙ, π}` for `π' ≠ π` of degree `d`, and the residues give
`⊕_{deg π = d} K^M_n(k_π) ≃ L_d / L_{d-1}`. -/
theorem filtration_quotients (n d : ℕ) (hd : 1 ≤ d) :
    (∀ q : MonicIrreducible F, q.1.natDegree = d →
      ∀ x ∈ degreeFiltration F (n + 1) (d - 1), residueAt q n x = 0) ∧
    (∀ q : MonicIrreducible F, q.1.natDegree = d → ∀ (a : Fin n → F[X]) (ha : ∀ i, a i ≠ 0)
      (hu : ∀ i, polyUnit (a i) (ha i) ∈ (placeVal q).valuationSubring.unitGroup),
      (∀ i, (a i).natDegree < d) →
      residueAt q n (milnorK.symbol (Fin.snoc (α := fun _ => (RatFunc F)ˣ)
        (fun i => polyUnit (a i) (ha i)) (polyUnit q.1 q.2.2.ne_zero))) =
        milnorK.symbol fun i => res (placeVal q) ⟨_, hu i⟩) ∧
    (∀ q q' : MonicIrreducible F, q.1.natDegree = d → q'.1.natDegree = d → q ≠ q' →
      ∀ (a : Fin n → F[X]) (ha : ∀ i, a i ≠ 0), (∀ i, (a i).natDegree < d) →
      residueAt q' n (milnorK.symbol (Fin.snoc (α := fun _ => (RatFunc F)ˣ)
        (fun i => polyUnit (a i) (ha i)) (polyUnit q.1 q.2.2.ne_zero))) = 0) ∧
    Nonempty ((⨁ q : {q : MonicIrreducible F // q.1.natDegree = d},
      milnorK (TameSymbol.ResidueField (placeVal q.1)) n) ≃+ degreeQuotient F (n + 1) d) := by
  sorry

/-- `K2SymbolsBrauer:T.4/projective-line-reciprocity` (III.7.5.1): `Σ_v N_v ∂_v(x) = 0` over all
places of `F(t)`, with `N_∞ = id`; the sum is finite. -/
theorem projective_line_reciprocity (n : ℕ) (x : milnorK (RatFunc F) (n + 1)) :
    {q : MonicIrreducible F | residueAt q n x ≠ 0}.Finite ∧
      ∑ᶠ q : MonicIrreducible F, placeTransfer q n (residueAt q n x) + residueInfty n x = 0 := by
  sorry

/-- `K2SymbolsBrauer:T.4/prime-to-p-closure` (Kato's trick): a prime-to-`p` closure `F'` exists,
and the kernel of `K^M_n(F) → K^M_n(F')` is killed by integers prime to `p`. -/
theorem prime_to_p_closure (p : ℕ) [Fact p.Prime] :
    ∃ F' : IntermediateField F (AlgebraicClosure F),
      (∀ x ∈ F', ∃ K : IntermediateField F (AlgebraicClosure F), FiniteDimensional F K ∧
        ¬ p ∣ Module.finrank F K ∧ x ∈ K ∧ K ≤ F') ∧
      (∀ (L : Type u) [Field L] [Algebra F' L] [FiniteDimensional F' L],
        ∃ k : ℕ, Module.finrank F' L = p ^ k) ∧
      ∀ (n : ℕ) (x : milnorK F n), milnorK.map (algebraMap F F') n x = 0 →
        ∃ m : ℕ, ¬ p ∣ m ∧ m • x = 0 := by
  sorry

/-- `K2SymbolsBrauer:T.4/transfer-base-change` (Exercise III.7.7, for any `F'/F`): if
`π = ∏ πᵢ^{eᵢ}` over `F'` with `πᵢ` the minimal polynomial of `bᵢ`, and `σᵢ : F⟮a⟯ → F'⟮bᵢ⟯` sends
`a ↦ bᵢ`, then `res ∘ N_{a/F} = Σᵢ eᵢ · N_{bᵢ/F'} ∘ σᵢ`. -/
theorem transfer_base_change {E : Type v} [Field E] [Algebra F E] (a : E) (ha : IsIntegral F a)
    {F' L : Type w} [Field F'] [Field L] [Algebra F F'] [Algebra F' L] {r : ℕ} (b : Fin r → L)
    (hb : ∀ i, IsIntegral F' (b i)) (e : Fin r → ℕ)
    (hfac : (minpoly F a).map (algebraMap F F') = ∏ i, minpoly F' (b i) ^ e i)
    (hdistinct : Function.Injective fun i => minpoly F' (b i))
    (σ : ∀ i, F⟮a⟯ →+* F'⟮b i⟯)
    (hσ : ∀ i, σ i (IntermediateField.AdjoinSimple.gen F a) =
      IntermediateField.AdjoinSimple.gen F' (b i))
    (hσF : ∀ i c, σ i (algebraMap F F⟮a⟯ c) = algebraMap F' F'⟮b i⟯ (algebraMap F F' c))
    (n : ℕ) (x : milnorK F⟮a⟯ n) :
    milnorK.map (algebraMap F F') n (milnorTransferSimple F a ha n x) =
      ∑ i, e i • milnorTransferSimple F' (b i) (hb i) n (milnorK.map (σ i) n x) := by
  sorry

/-- `K2SymbolsBrauer:T.4/p-closed-generation` (Exercise III.7.6): if every finite extension of `F`
has `p`-power degree and `[E : F] = p`, then `K^M_{n+1}(E)` is generated by the
`{y, x₂, …, x_{n+1}}` with `y ∈ Eˣ`, `xᵢ ∈ Fˣ`. -/
theorem p_closed_generation (p : ℕ) [Fact p.Prime]
    (hF : ∀ (L : Type u) [Field L] [Algebra F L] [FiniteDimensional F L],
      ∃ k : ℕ, Module.finrank F L = p ^ k)
    {E : Type u} [Field E] [Algebra F E] [FiniteDimensional F E] (hE : Module.finrank F E = p)
    (n : ℕ) :
    AddSubgroup.closure {z | ∃ (y : Eˣ) (x : Fin n → Fˣ),
      z = milnorK.symbol (Fin.cons (α := fun _ => Eˣ) y
        fun i => Units.map (algebraMap F E).toMonoidHom (x i))} = ⊤ := by
  sorry

/-- `K2SymbolsBrauer:T.4/kato-prime-degree` (Lemma III.7.6.2): for `E/F` normal of prime degree and
`E = F(a) = F(b)`, `N_{a/F} = N_{b/F}`. -/
theorem kato_prime_degree {E : Type v} [Field E] [Algebra F E] [FiniteDimensional F E] [Normal F E]
    (hp : (Module.finrank F E).Prime) (a b : E) (ha : IsIntegral F a) (hb : IsIntegral F b)
    (htop : F⟮a⟯ = ⊤) (hab : F⟮a⟯ = F⟮b⟯) (n : ℕ) :
    milnorTransferSimple F a ha n = (milnorTransferSimple F b hb n).comp
      (milnorK.map (IntermediateField.equivOfEq hab).toRingEquiv.toRingHom n) := by
  sorry

/-- The residue degree `f(w | v) = [k_w : k_v]` (a real definition). -/
def residueDegree {E : Type v} [Field E] [Algebra F E] (v : Valuation F ℤᵐ⁰)
    (w : Valuation E ℤᵐ⁰) (e : ℕ) (hvw : ∀ r : F, w.ord (algebraMap F E r) = e * v.ord r) : ℕ :=
  letI := (residueFieldMap v w e hvw).toAlgebra
  Module.finrank (TameSymbol.ResidueField v) (TameSymbol.ResidueField w)

/-- `K2SymbolsBrauer:T.4/kato-complete-residue` (Corollary III.7.6.3): for `F` complete for `v` and
`E/F` normal of prime degree with the unique extension `w`, `∂_v ∘ N_{E/F} = N_{k_w/k_v} ∘ ∂_w`. -/
theorem kato_complete_residue {E : Type v} [Field E] [Algebra F E] [FiniteDimensional F E]
    [Normal F E] (hp : (Module.finrank F E).Prime) (v : Valuation F ℤᵐ⁰)
    (hv : Function.Surjective v)
    [IsAdicComplete (IsLocalRing.maximalIdeal v.valuationSubring) v.valuationSubring]
    (w : Valuation E ℤᵐ⁰) (hw : Function.Surjective w) (e : ℕ)
    (hvw : ∀ r : F, w.ord (algebraMap F E r) = e * v.ord r)
    (hunique : ∀ (w' : Valuation E ℤᵐ⁰) (e' : ℕ), Function.Surjective w' →
      (∀ r : F, w'.ord (algebraMap F E r) = e' * v.ord r) → w' = w)
    (n : ℕ) (x : milnorK E (n + 1)) :
    milnorResidue v hv n (milnorNorm F E (n + 1) x) =
      milnorNormOf (residueFieldMap v w e hvw) n (milnorResidue w hw n x) := by
  sorry

/-- `K2SymbolsBrauer:T.3/transfer-and-norm-residue` (reparented to T.4): for a finite extension
`E/F` and `v` on `F` whose valuation ring has a finite integral closure in `E`
(`Σ_w e_w f_w = [E : F]`), `∂_v ∘ N_{E/F} = Σ_{w | v} N_{k_w/k_v} ∘ ∂_w`. Ramification indices do
not enter; without the finiteness hypothesis the degree-one case fails. -/
theorem transfer_and_norm_residue {E : Type v} [Field E] [Algebra F E] [FiniteDimensional F E]
    (v : Valuation F ℤᵐ⁰) (hv : Function.Surjective v) (W : Finset (Valuation E ℤᵐ⁰))
    (e : Valuation E ℤᵐ⁰ → ℕ) (hsurj : ∀ w ∈ W, Function.Surjective w)
    (hvw : ∀ w ∈ W, ∀ r : F, w.ord (algebraMap F E r) = e w * v.ord r)
    (hall : ∀ (w : Valuation E ℤᵐ⁰) (e' : ℕ), Function.Surjective w → 0 < e' →
      (∀ r : F, w.ord (algebraMap F E r) = e' * v.ord r) → w ∈ W)
    (hfin : ∑ w ∈ W.attach, e w.1 * residueDegree v w.1 (e w.1) (hvw w.1 w.2) =
      Module.finrank F E)
    (n : ℕ) (x : milnorK E (n + 1)) :
    milnorResidue v hv n (milnorNorm F E (n + 1) x) =
      ∑ w ∈ W.attach, milnorNormOf (residueFieldMap v w.1 (e w.1) (hvw w.1 w.2)) n
        (milnorResidue w.1 (hsurj w.1 w.2) n x) := by
  sorry

/-- `K2SymbolsBrauer:T.4/constant-extension-residue` (Exercise III.7.9): for `E/F` normal of prime
degree and a place `v` of `F(t)` trivial on `F`, `∂_v ∘ N_{E(t)/F(t)} = Σ_{w | v} N ∘ ∂_w`; the
algebra `F(t) → E(t)` is required to be the constant extension. -/
theorem constant_extension_residue {E : Type u} [Field E] [Algebra F E] [FiniteDimensional F E]
    [Normal F E] (hp : (Module.finrank F E).Prime) [Algebra (RatFunc F) (RatFunc E)]
    [FiniteDimensional (RatFunc F) (RatFunc E)]
    (hC : ∀ c : F, algebraMap (RatFunc F) (RatFunc E) (algebraMap F (RatFunc F) c) =
      algebraMap E (RatFunc E) (algebraMap F E c))
    (hX : algebraMap (RatFunc F) (RatFunc E) RatFunc.X = RatFunc.X)
    (v : Valuation (RatFunc F) ℤᵐ⁰) (hv : Function.Surjective v) [v.IsTrivialOn F]
    (W : Finset (Valuation (RatFunc E) ℤᵐ⁰)) (e : Valuation (RatFunc E) ℤᵐ⁰ → ℕ)
    (hsurj : ∀ w ∈ W, Function.Surjective w)
    (hvw : ∀ w ∈ W, ∀ r, w.ord (algebraMap (RatFunc F) (RatFunc E) r) = e w * v.ord r)
    (hall : ∀ (w : Valuation (RatFunc E) ℤᵐ⁰) (e' : ℕ), Function.Surjective w → 0 < e' →
      (∀ r, w.ord (algebraMap (RatFunc F) (RatFunc E) r) = e' * v.ord r) → w ∈ W)
    (n : ℕ) (x : milnorK (RatFunc E) (n + 1)) :
    milnorResidue v hv n (milnorNorm (RatFunc F) (RatFunc E) (n + 1) x) =
      ∑ w ∈ W.attach, milnorNormOf (residueFieldMap v w.1 (e w.1) (hvw w.1 w.2)) n
        (milnorResidue w.1 (hsurj w.1 w.2) n x) := by
  sorry

/-- `K2SymbolsBrauer:T.4/kato-commuting-square` (Proposition III.7.6.4, with the errata's
`N_{a/E}`): for `E/F` normal of prime degree, `F' = F(a)`, `E' = E(a)`,
`N_{E/F} ∘ N_{a/E} = N_{a/F} ∘ N_{E'/F'}`. -/
theorem kato_commuting_square {E : Type v} [Field E] [Algebra F E] [FiniteDimensional F E]
    [Normal F E] (hp : (Module.finrank F E).Prime) {L : Type w} [Field L] [Algebra F L]
    [Algebra E L] [IsScalarTower F E L] (a : L) (haF : IsIntegral F a) (haE : IsIntegral E a)
    (ι : F⟮a⟯ →+* E⟮a⟯) (hι : ∀ x : F⟮a⟯, ((ι x : E⟮a⟯) : L) = x) (n : ℕ) :
    (milnorNorm F E n).comp (milnorTransferSimple E a haE n) =
      (milnorTransferSimple F a haF n).comp (milnorNormOf ι n) := by
  sorry

end TauCeti.MilnorK

namespace TauCeti.TameSymbol

open TauCeti.MilnorK


/-- The residue `∂_P` at a place `P` of `K/k`, landing in `K^M_n(P.ResidueField)` (a real
definition). -/
def placeResidue {k : Type u} {K : Type v} [Field k] [Field K] [Algebra k K] (P : Place k K)
    (n : ℕ) : milnorK K (n + 1) →+ milnorK P.ResidueField n :=
  (milnorK.map (residueFieldCongr (valuationSubring_eq_integers P)).toRingHom n).comp
    (milnorResidue P.valuation P.valuation_surjective n)

/-- The tame symbol at a place `P`, in `P.ResidueFieldˣ` (a real definition). -/
def placeTame {k : Type u} {K : Type v} [Field k] [Field K] [Algebra k K] (P : Place k K)
    (f g : Kˣ) : P.ResidueFieldˣ :=
  Units.map (residueFieldCongr (valuationSubring_eq_integers P)).toRingHom.toMonoidHom
    (tameSymbol P.valuation P.valuation_surjective f g)

/-- `K2SymbolsBrauer:T.4/projective-line-reciprocity` in degree two: `∏_v N_{k(v)/F} ∂_v{f, g} = 1`
over all places of `F(t)` (either normalisation). -/
theorem projective_line_reciprocity_tameSymbol {F : Type u} [Field F] (f g : (RatFunc F)ˣ) :
    ∏ᶠ P : Place F (RatFunc F), Units.map (Algebra.norm F : P.ResidueField →* F) (placeTame P f g) =
      1 := by
  sorry

/-- `K2SymbolsBrauer:T.4/weil-reciprocity`: for a function field `K/F` of one variable and
`x ∈ K^M_{n+1}(K)`, `∂_P x = 0` at almost every place and `Σ_P N_{k(P)/F} ∂_P(x) = 0`. -/
theorem weil_reciprocity {F : Type u} {K : Type v} [Field F] [Field K] [Algebra F K]
    (hK : IsFunctionField F K) (n : ℕ) (x : milnorK K (n + 1)) :
    {P : Place F K | placeResidue P n x ≠ 0}.Finite ∧
      ∑ᶠ P : Place F K, milnorNorm F P.ResidueField n (placeResidue P n x) = 0 := by
  sorry

/-- `K2SymbolsBrauer:T.4/weil-reciprocity-symbol-form`, over the places of `K/F`:
`∂_P{f, g} = 1` for almost all `P` and `∏_P N_{k(P)/F}(∂_P{f, g}) = 1`. -/
theorem weil_reciprocity_symbol_form {F : Type u} {K : Type v} [Field F] [Field K] [Algebra F K]
    (hK : IsFunctionField F K) (f g : Kˣ) :
    {P : Place F K | placeTame P f g ≠ 1}.Finite ∧
      ∏ᶠ P : Place F K, Units.map (Algebra.norm F : P.ResidueField →* F) (placeTame P f g) = 1 := by
  sorry

/-- `K2SymbolsBrauer:T.4/weil-reciprocity-symbol-form`, disjoint supports: `f(div g) = g(div f)`
for Tau Ceti's evaluation of a function on a divisor. -/
theorem weil_reciprocity_symbol_form_eval {F : Type u} {K : Type v} [Field F] [Field K]
    [Algebra F K] (hK : IsFunctionField F K) (f g : Kˣ)
    (hfg : Disjoint (Divisor.principal hK f).support (Divisor.principal hK g).support) :
    Divisor.eval (Divisor.principal hK g) f = Divisor.eval (Divisor.principal hK f) g := by
  sorry

/- `K2SymbolsBrauer:T.4/weil-reciprocity-symbol-form`, the product over the closed points `X^{(1)}`
of a proper regular curve: not stated here; needs the closed-point/place dictionary with
`Scheme.ord` and `κ(x) ≃ₐ[F] k(P_x)` (supplier: AlgebraicCurves Layer 12, 12A–12B).
`K2SymbolsBrauer:T.4/valuation-comparison`: not stated here; needs the same dictionary
(supplier: AlgebraicCurves Layer 12, 12A–12B). -/

end TauCeti.TameSymbol

/-! ## `K2SymbolsBrauer:T.5` — tame kernels, `K₂(ℤ)` and `K₂(ℚ)` -/

namespace TauCeti.TameSymbol

open TauCeti.MilnorK TauCeti.Steinberg IsDedekindDomain NumberField

variable {F : Type u} [Field F]

/-- **The unramified subgroup** (`K2SymbolsBrauer:T.5/unramified-subgroup`) of a family of
discrete valuations: `⨅ i, ker ∂_{v i} ⊆ K₂(F)` (a real definition; it uses no localisation
theorem). -/
def unramifiedSubgroup {I : Type v} (v : I → Valuation F ℤᵐ⁰)
    (hv : ∀ i, Function.Surjective (v i)) : Subgroup (K2 F) :=
  ⨅ i, (tameSymbolHomK2 (v i) (hv i)).ker

/-- The subgroup unramified outside `S ⊆ I`: `⨅ i ∉ S, ker ∂_{v i}` (a real definition). -/
def unramifiedOutside {I : Type v} (v : I → Valuation F ℤᵐ⁰)
    (hv : ∀ i, Function.Surjective (v i)) (S : Set I) : Subgroup (K2 F) :=
  ⨅ i ∉ S, (tameSymbolHomK2 (v i) (hv i)).ker

section Unramified

variable {I : Type v} (v : I → Valuation F ℤᵐ⁰) (hv : ∀ i, Function.Surjective (v i))

theorem mem_unramifiedSubgroup_iff (x : K2 F) :
    x ∈ unramifiedSubgroup v hv ↔ ∀ i, tameSymbolHomK2 (v i) (hv i) x = 1 := by
  sorry

theorem unramifiedOutside_empty : unramifiedOutside v hv ∅ = unramifiedSubgroup v hv := by
  sorry

theorem unramifiedOutside_mono {S T : Set I} (h : S ⊆ T) :
    unramifiedOutside v hv S ≤ unramifiedOutside v hv T := by
  sorry

/-- The residue sum `K₂(F) → ⨁ᵢ k(vᵢ)ˣ`, `x ↦ (∂_{vᵢ} x)ᵢ`, for a family with finite support. -/
def residueSum (hfin : ∀ x : K2 F, {i | tameSymbolHomK2 (v i) (hv i) x ≠ 1}.Finite) :
    K2 F →* Multiplicative (Π₀ i, Additive (ResidueField (v i))ˣ) :=
  sorry

theorem unramifiedSubgroup_eq_ker_residueSum
    (hfin : ∀ x : K2 F, {i | tameSymbolHomK2 (v i) (hv i) x ≠ 1}.Finite) :
    unramifiedSubgroup v hv = (residueSum v hv hfin).ker := by
  sorry

@[simp]
theorem symbol_mem_unramifiedSubgroup (a b : Fˣ) (ha : ∀ i, (v i).ord (a : F) = 0)
    (hb : ∀ i, (v i).ord (b : F) = 0) :
    steinbergSymbol a b (Commute.all _ _) ∈ unramifiedSubgroup v hv := by
  sorry

/-- Restriction along a finite extension carrying each `w_j` over some `v_i` maps the unramified
subgroup into the unramified subgroup. -/
theorem unramifiedSubgroup_map_le {E : Type v} [Field E] [Algebra F E] [FiniteDimensional F E]
    {J : Type v} (w : J → Valuation E ℤᵐ⁰) (hw : ∀ j, Function.Surjective (w j))
    (hcarry : ∀ j, ∃ i, ∃ e : ℕ, 0 < e ∧ ∀ r : F, (w j).ord (algebraMap F E r) = e * (v i).ord r) :
    (unramifiedSubgroup v hv).map (K2.map (algebraMap F E)) ≤ unramifiedSubgroup w hw := by
  sorry

end Unramified

/-- The finite places of a Dedekind domain `R` with fraction field `F` (Mathlib's
`HeightOneSpectrum.valuation`). -/
abbrev primeFamily (R : Type v) [CommRing R] [IsDedekindDomain R] (F : Type u) [Field F]
    [Algebra R F] [IsFractionRing R F] : HeightOneSpectrum R → Valuation F ℤᵐ⁰ :=
  fun p => p.valuation F

theorem range_K2_le_unramifiedSubgroup (R : Type u) [CommRing R] [IsDedekindDomain R]
    [Algebra R F] [IsFractionRing R F] :
    (K2.map (algebraMap R F)).range ≤
      unramifiedSubgroup (primeFamily R F) (fun p => p.valuation_surjective F) := by
  sorry

/-- The transfer `K₂(E) → K₂(F)` of a finite extension, through Matsumoto's isomorphism. -/
def k2Transfer (F : Type u) [Field F] (E : Type u) [Field E] [Algebra F E] : K2 E →* K2 F :=
  MonoidHom.toAdditive.symm ((matsumotoEquiv F).toAddMonoidHom.comp
    ((milnorNorm F E 2).comp (matsumotoEquiv E).symm.toAddMonoidHom))

/-- The transfer of a finite extension of number fields maps the unramified subgroup of `E` into
that of `F`. -/
theorem transfer_mem_unramifiedSubgroup (E : Type u) [Field E] [NumberField F] [NumberField E]
    [Algebra F E] (x : K2 E)
    (hx : x ∈ unramifiedSubgroup (primeFamily (𝓞 E) E) (fun p => p.valuation_surjective E)) :
    k2Transfer F E x ∈ unramifiedSubgroup (primeFamily (𝓞 F) F) (fun p => p.valuation_surjective F) := by
  sorry

/-- For `I = HeightOneSpectrum R`, `k(v_𝔭)` is `R ⧸ 𝔭`. -/
theorem unramifiedSubgroup_heightOneSpectrum (R : Type u) [CommRing R] [IsDedekindDomain R]
    [Algebra R F] [IsFractionRing R F] (p : HeightOneSpectrum R) :
    Nonempty (ResidueField (p.valuation F) ≃+* R ⧸ p.asIdeal) := by
  sorry

/-- The `p`-adic valuation of `ℚ` at a prime `p`. -/
def primeVal (p : Nat.Primes) : Valuation ℚ ℤᵐ⁰ := @Rat.padicValuation p.1 ⟨p.2⟩

theorem primeVal_surjective (p : Nat.Primes) : Function.Surjective (primeVal p) :=
  @Rat.surjective_padicValuation p.1 ⟨p.2⟩

/-- `r` as a unit of `ℚ`. -/
local notation "⟪" q "⟫" => Units.mk0 (q : ℚ) (by norm_num)

-- test neg_one_neg_one_mem (computation)
example : steinbergSymbol (-1 : ℚˣ) (-1) (Commute.all _ _) ∈
    unramifiedSubgroup primeVal primeVal_surjective := by
  sorry

-- test neg_one_p_not_mem (non-example)
example (p : Nat.Primes) (hp : p.1 ≠ 2) :
    steinbergSymbol (-1 : ℚˣ) (Units.mk0 (p.1 : ℚ) (by exact_mod_cast p.2.ne_zero))
      (Commute.all _ _) ∉ unramifiedSubgroup primeVal primeVal_surjective ∧
    tameSymbol (primeVal p) (primeVal_surjective p) (-1)
      (Units.mk0 (p.1 : ℚ) (by exact_mod_cast p.2.ne_zero)) = -1 := by
  sorry

-- test three_three_not_mem (non-example)
example : steinbergSymbol ⟪3⟫ ⟪3⟫ (Commute.all _ _) ∉
      unramifiedSubgroup primeVal primeVal_surjective ∧
    tameSymbol (primeVal ⟨3, Nat.prime_three⟩) (primeVal_surjective _) ⟪3⟫ ⟪3⟫ = -1 := by
  sorry

-- test two_neg_one_mem (degenerate)
example : steinbergSymbol ⟪2⟫ (-1) (Commute.all _ _) = 1 ∧
    tameSymbol (primeVal ⟨2, Nat.prime_two⟩) (primeVal_surjective _) ⟪2⟫ (-1) = 1 := by
  sorry

-- test empty_family (degenerate)
example {I : Type v} (v : I → Valuation F ℤᵐ⁰) (hv : ∀ i, Function.Surjective (v i)) :
    unramifiedSubgroup (F := F) (Empty.elim : Empty → Valuation F ℤᵐ⁰) (fun e => e.elim) = ⊤ ∧
      unramifiedOutside v hv Set.univ = ⊤ := by
  sorry

-- test mem_iff_residueSum_rat (characterisation)
example (hfin : ∀ x : K2 ℚ, {p | tameSymbolHomK2 (primeVal p) (primeVal_surjective p) x ≠ 1}.Finite)
    (x : K2 ℚ) :
    x ∈ unramifiedSubgroup primeVal primeVal_surjective ↔
      residueSum primeVal primeVal_surjective hfin x = 1 := by
  sorry

-- test heightOneSpectrum_int (compatibility)
example (v : HeightOneSpectrum ℤ) (p : ℕ) [Fact p.Prime] (hv : v.asIdeal = Ideal.span {(p : ℤ)}) :
    v.valuation ℚ = Rat.padicValuation p ∧ Nonempty (ℤ ⧸ v.asIdeal ≃+* ZMod p) := by
  sorry

/-- `K2SymbolsBrauer:T.5/tame-kernel-sequence` (imported from ArithmeticKTheory N.2's localisation
sequence, with KTheoryLowDegrees U.4 for `SK₁(O_F) = 0`): for a number field,
`0 → K₂(O_F) → K₂(F) → ⊕_𝔭 k(𝔭)ˣ → 0` is exact. -/
theorem tame_kernel_sequence (F : Type u) [Field F] [NumberField F] :
    Function.Injective (K2.map (algebraMap (𝓞 F) F)) ∧
    (K2.map (algebraMap (𝓞 F) F)).range =
      unramifiedSubgroup (primeFamily (𝓞 F) F) (fun p => p.valuation_surjective F) ∧
    ∀ y : Π₀ p : HeightOneSpectrum (𝓞 F), Additive (ResidueField (p.valuation F))ˣ,
      ∃ x : K2 F, ∀ p, Additive.ofMul
        (tameSymbolHomK2 (p.valuation F) (p.valuation_surjective F) x) = y p := by
  sorry

/-- `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`: for a finite set `S` of finite places,
`0 → K₂(O_F) → K₂(O_{F,S}) → ⊕_{𝔭 ∈ S} k(𝔭)ˣ → 0` is exact, and the image of `K₂(O_{F,S})` in
`K₂(F)` is the subgroup unramified outside `S`. -/
theorem s_integer_tame_kernel_sequence (F : Type u) [Field F] [NumberField F]
    (S : Set (HeightOneSpectrum (𝓞 F))) (hS : S.Finite) :
    Function.Injective (K2.map (algebraMap (𝓞 F) (S.integer F))) ∧
    (K2.map (algebraMap (S.integer F) F)).range =
      unramifiedOutside (primeFamily (𝓞 F) F) (fun p => p.valuation_surjective F) S ∧
    (∀ x : K2 (S.integer F), (∀ p ∈ S, tameSymbolHomK2 (p.valuation F) (p.valuation_surjective F)
        (K2.map (algebraMap (S.integer F) F) x) = 1) ↔
      x ∈ (K2.map (algebraMap (𝓞 F) (S.integer F))).range) ∧
    ∀ y : ∀ p : S, (ResidueField (p.1.valuation F))ˣ, ∃ x : K2 (S.integer F), ∀ p : S,
      tameSymbolHomK2 (p.1.valuation F) (p.1.valuation_surjective F)
        (K2.map (algebraMap (S.integer F) F) x) = y p := by
  sorry

/-! ### `K2SymbolsBrauer:T.5/certified-presentation` -/

/-- **An order certificate** for an abelian group `A`, on Mathlib's presentations: finitely many
generators and relations, a spanning solution (the upper bound), and a surjection onto a finite
group of the presented order (the lower bound). An upper bound with a surjective presentation is
never reported as an isomorphism without the lower bound. -/
structure OrderCertificate (A : Type v) [AddCommGroup A] where
  /-- The relations (over `ℤ`). -/
  rel : Module.Relations.{0, 0} ℤ
  finite_G : Finite rel.G
  finite_R : Finite rel.R
  /-- The solution: the images of the generators. -/
  sol : rel.Solution A
  span_eq_top : Submodule.span ℤ (Set.range sol.var) = ⊤
  /-- The lower-bound group. -/
  B : Type v
  [addCommGroupB : AddCommGroup B]
  finite_B : Finite B
  /-- The lower-bound map. -/
  φ : A →+ B
  surjective_φ : Function.Surjective φ
  finite_quotient : Finite rel.Quotient
  /-- The matching bound. -/
  card_quotient_eq : Nat.card B = Nat.card rel.Quotient

attribute [instance] OrderCertificate.addCommGroupB

namespace OrderCertificate

variable {A : Type v} [AddCommGroup A] (c : OrderCertificate A)

/-- The upper bound: `fromQuotient` is onto, so `Nat.card A ≤ Nat.card rel.Quotient`. -/
theorem fromQuotient_surjective : Function.Surjective c.sol.fromQuotient := by
  sorry

/-- Soundness: the solution is a presentation. -/
theorem isPresentation : c.sol.IsPresentation := by
  sorry

/-- The Mathlib presentation (a real definition). -/
def toPresentation : Module.Presentation.{0, 0} ℤ A :=
  Module.Presentation.ofIsPresentation c.isPresentation

/-- `Nat.card A = Nat.card B = Nat.card rel.Quotient`. -/
@[simp]
theorem card_eq : Nat.card A = Nat.card c.B ∧ Nat.card c.B = Nat.card c.rel.Quotient := by
  sorry

/-- `rel.Quotient ≃ₗ[ℤ] A` (a real definition). -/
def linearEquiv : c.rel.Quotient ≃ₗ[ℤ] A := c.isPresentation.linearEquiv

/-- A complete kernel argument gives a certificate with `B = A`. -/
def ofIsPresentation {rel : Module.Relations.{0, 0} ℤ}
    [Finite rel.G] [Finite rel.R] [Finite rel.Quotient] {sol : rel.Solution A}
    (h : sol.IsPresentation) : OrderCertificate A where
  rel := rel
  finite_G := inferInstance
  finite_R := inferInstance
  sol := sol
  span_eq_top := by sorry
  B := A
  finite_B := by sorry
  φ := AddMonoidHom.id A
  surjective_φ := Function.surjective_id
  finite_quotient := inferInstance
  card_quotient_eq := by sorry

end OrderCertificate

/- The packet's structure field `card_eq` is named `card_quotient_eq` here, because the packet
also asks for the lemma `OrderCertificate.card_eq` with a different statement. -/

-- test orderCertificate_trivial (degenerate)
example {A : Type} [AddCommGroup A] (c : OrderCertificate A) (hG : IsEmpty c.rel.G) :
    Subsingleton A := by
  sorry

-- test upper_bound_not_iso (non-example)
/- One generator with `4g = 0` sent to the generator of `ℤ/2`: it spans and solves the relation,
but `ℤ/4 → ℤ/2` is not injective and no surjection from `ℤ/2` hits a group of order `4`. -/
example :
    Nat.card (⟨Unit, Unit, fun _ => Finsupp.single () 4⟩ : Module.Relations.{0, 0} ℤ).Quotient =
      4 ∧
    ∀ (B : Type) [AddCommGroup B] (φ : ZMod 2 →+ B), Function.Surjective φ → Nat.card B ≠ 4 := by
  sorry

-- test orderCertificate_isPresentation (characterisation)
example {A : Type v} [AddCommGroup A] (c : OrderCertificate A) : c.sol.IsPresentation := by
  sorry

-- test orderCertificate_toPresentation (compatibility)
example {A : Type v} [AddCommGroup A] (c : OrderCertificate A) :
    c.toPresentation.toRelations = c.rel ∧ c.toPresentation.toSolution = c.sol := by
  sorry

/-! ### `K2SymbolsBrauer:T.5/real-sign-symbol` -/

/-- **The real sign symbol** `(x, y)_∞` (Example III.6.2.1): `K₂(ℝ) →* ℤˣ`,
`{x, y} ↦ -1` if `x < 0` and `y < 0`, else `1`. -/
def realSignSymbol : K2 ℝ →* ℤˣ := sorry

@[simp]
theorem realSignSymbol_symbol (x y : ℝˣ) :
    realSignSymbol (steinbergSymbol x y (Commute.all _ _)) =
      if (x : ℝ) < 0 ∧ (y : ℝ) < 0 then -1 else 1 := by
  sorry

@[simp]
theorem realSignSymbol_neg_one_neg_one :
    realSignSymbol (steinbergSymbol (-1 : ℝˣ) (-1) (Commute.all _ _)) = -1 := by
  sorry

theorem realSignSymbol_surjective : Function.Surjective realSignSymbol := by
  sorry

/-- The sign symbol at a real embedding `σ : F → ℝ` (a real definition). -/
def signSymbolAt {R : Type u} [Ring R] (σ : R →+* ℝ) : K2 R →* ℤˣ := realSignSymbol.comp (K2.map σ)

/-- The degree-two part of the graded map `K^M_*(ℝ) → (ℤ/2)[t]`, `{x₁, …, xₙ} ↦ ∏ [xᵢ < 0] tⁿ`
of `K2SymbolsBrauer:T.2/milnor-examples`, under `ℤ/2 ≅ ℤˣ`, read on `K^M_2(ℝ)` through Matsumoto:
`{x, y} ↦ -1` exactly when both are negative. -/
theorem realSignSymbol_eq_milnorExamples (x y : ℝˣ) :
    realSignSymbol (Additive.toMul (matsumotoEquiv ℝ (milnorK.symbol ![x, y]))) =
      if (x : ℝ) < 0 ∧ (y : ℝ) < 0 then -1 else 1 := by
  sorry

-- test realSignSymbol_values (computation)
example : realSignSymbol (steinbergSymbol (Units.mk0 (-2 : ℝ) (by norm_num))
      (Units.mk0 (-3 : ℝ) (by norm_num)) (Commute.all _ _)) = -1 ∧
    realSignSymbol (steinbergSymbol (Units.mk0 (-2 : ℝ) (by norm_num))
      (Units.mk0 (3 : ℝ) (by norm_num)) (Commute.all _ _)) = 1 := by
  sorry

-- test realSignSymbol_one (degenerate)
example (x y : ℝˣ) : realSignSymbol (steinbergSymbol x 1 (Commute.all _ _)) = 1 ∧
    realSignSymbol (steinbergSymbol 1 y (Commute.all _ _)) = 1 := by
  sorry

-- test orSign_not_steinberg (non-example)
/- The "or" pairing is `-1` at `(2, -1)` although `2 + (-1) = 1`, where every Steinberg symbol
is trivial. -/
example : (if (2 : ℝ) < 0 ∨ (-1 : ℝ) < 0 then (-1 : ℤˣ) else 1) = -1 ∧
    steinbergSymbol (Units.mk0 (2 : ℝ) (by norm_num)) (-1) (Commute.all _ _) = 1 := by
  sorry

-- test signSymbolAt_rat (characterisation)
example : signSymbolAt (Rat.castHom ℝ) (steinbergSymbol (-1 : ℚˣ) (-1) (Commute.all _ _)) = -1 ∧
    ∀ p q : ℚˣ, 0 < (p : ℚ) → 0 < (q : ℚ) →
      signSymbolAt (Rat.castHom ℝ) (steinbergSymbol p q (Commute.all _ _)) = 1 := by
  sorry

-- test realSignSymbol_hilbert (compatibility)
example (x y : ℝˣ) :
    realSignSymbol (steinbergSymbol x y (Commute.all _ _)) = 1 ↔
      ∃ a b : ℝ, (x : ℝ) * a ^ 2 + (y : ℝ) * b ^ 2 = 1 := by
  sorry

/-- `K2SymbolsBrauer:T.5/k2-of-the-integers`, the lower bound (Example III.6.2.1): the sign symbol
sends `{-1, -1} ∈ K₂(ℤ)` to `-1`, so `{-1, -1} ≠ 1`. -/
theorem k2_of_the_integers_lower_bound :
    signSymbolAt (Int.castRingHom ℝ) (steinbergSymbol (-1 : ℤˣ) (-1) (Commute.all _ _)) = -1 := by
  sorry

/-- `K2SymbolsBrauer:T.5/k2-of-the-integers`: `K₂(ℤ)` is cyclic of order two, generated by
`{-1, -1}`, and `K₂(ℤ) → K₂(ℝ) → {±1}` is an isomorphism. The upper bound is Milnor's
computation in `St(ℤ)` (cited, a gap). -/
theorem k2_of_the_integers :
    Nat.card (K2 ℤ) = 2 ∧
      Subgroup.zpowers (steinbergSymbol (-1 : ℤˣ) (-1) (Commute.all _ _)) = ⊤ ∧
      Function.Bijective (signSymbolAt (Int.castRingHom ℝ)) := by
  sorry

-- test orderCertificate_k2_int (computation)
/- One generator `{-1, -1}`, one relation `2g = 0`, the span from Milnor's bound, the lower bound
the real sign symbol onto `ℤˣ`: `K₂(ℤ) ≃ ℤ/2`. -/
example : ∃ c : OrderCertificate (Additive (K2 ℤ)), Nat.card c.B = 2 ∧
    ∀ g, c.sol.var g = Additive.ofMul (steinbergSymbol (-1 : ℤˣ) (-1) (Commute.all _ _)) := by
  sorry

/-- `K2SymbolsBrauer:T.5/k2-of-the-rationals` (Application III.6.5.1): the residue sum gives the
split exact sequence `1 → K₂(ℤ) → K₂(ℚ) → ⊕_p 𝔽_pˣ → 1`, split by the real sign symbol; in
particular `K₂(ℚ)` is infinite. -/
theorem k2_of_the_rationals :
    Function.Injective (K2.map (Int.castRingHom ℚ)) ∧
    (K2.map (Int.castRingHom ℚ)).range = unramifiedSubgroup primeVal primeVal_surjective ∧
    (∀ y : Π₀ p : Nat.Primes, Additive (ResidueField (primeVal p))ˣ,
      ∃ x : K2 ℚ, ∀ p, Additive.ofMul (tameSymbolHomK2 (primeVal p) (primeVal_surjective p) x) =
        y p) ∧
    Function.Bijective ((signSymbolAt (Rat.castHom ℝ)).comp (K2.map (Int.castRingHom ℚ))) ∧
    Infinite (K2 ℚ) := by
  sorry

end TauCeti.TameSymbol

/-! ## `K2SymbolsBrauer:T.6` — Dennis–Stein symbols and relative `K₂`

Convention (pinned): the modern Dennis–Stein symbol `⟨r, s⟩`, defined when `1 - rs` is a unit;
the pre-1980 symbol (`1 + ab` a unit) is `⟨-a, b⟩⁻¹` and is not a second definition. -/

namespace TauCeti.K2

open TauCeti.Steinberg TauCeti.MilnorK

section DennisStein

variable {R : Type u} [Ring R]

/-- The Dennis–Stein word `x_ji(-s u⁻¹) x_ij(-r) x_ji(s) x_ij(u⁻¹ r) h_ij(u)⁻¹` in `St(R)`
(a real definition). -/
def dennisSteinWord {i j : ℕ} (hij : i ≠ j) (r s : R) (u : Rˣ) : StableSteinberg R :=
  StableSteinberg.x hij.symm (-(s * ((u⁻¹ : Rˣ) : R))) * StableSteinberg.x hij (-r) *
    StableSteinberg.x hij.symm s * StableSteinberg.x hij (((u⁻¹ : Rˣ) : R) * r) *
    (StableSteinberg.h hij u)⁻¹

/-- **The Dennis–Stein symbol** `⟨r, s⟩ ∈ K₂(R)` (`K2SymbolsBrauer:T.6/dennis-stein-symbol`) for
commuting `r, s` with `1 - rs` a unit: the Dennis–Stein word at `(i, j) = (0, 1)`; it lies in
`K₂(R)` because its image in `E(R)` is trivial. -/
def dennisStein (r s : R) (hrs : Commute r s) (hu : IsUnit (1 - r * s)) : K2 R :=
  ⟨dennisSteinWord (i := 0) (j := 1) (by decide) r s hu.unit, by sorry⟩

variable (r s : R) (hrs : Commute r s) (hu : IsUnit (1 - r * s))

theorem coe_dennisStein {i j : ℕ} (hij : i ≠ j) :
    (dennisStein r s hrs hu : StableSteinberg R) = dennisSteinWord hij r s hu.unit := by
  sorry

theorem dennisStein_index_indep {i j k l : ℕ} (hij : i ≠ j) (hkl : k ≠ l) :
    dennisSteinWord hij r s hu.unit = dennisSteinWord hkl r s hu.unit := by
  sorry

/-- The image in `E(R)` of the four elementary factors is `diag(u, u⁻¹)` at `(i, j)`, read on
column vectors. -/
theorem phi_dennisSteinWord {i j : ℕ} (hij : i ≠ j) (c : ℕ →₀ R) :
    StableSteinberg.phi R (StableSteinberg.x hij.symm (-(s * ((hu.unit⁻¹ : Rˣ) : R))) *
        StableSteinberg.x hij (-r) * StableSteinberg.x hij.symm s *
        StableSteinberg.x hij (((hu.unit⁻¹ : Rˣ) : R) * r)) c =
      c + Finsupp.single i (((hu.unit : R) - 1) * c i) +
        Finsupp.single j ((((hu.unit⁻¹ : Rˣ) : R) - 1) * c j) := by
  sorry

@[simp]
theorem dennisStein_zero_left (s : R) :
    dennisStein 0 s (Commute.zero_left s) (by simp) = 1 := by
  sorry

@[simp]
theorem dennisStein_zero_right (r : R) :
    dennisStein r 0 (Commute.zero_right r) (by simp) = 1 := by
  sorry

/-- For a unit `r`, `⟨r, s⟩ = {r, 1 - rs}`. -/
theorem dennisStein_eq_steinbergSymbol (u : Rˣ) (s : R) (hus : Commute (u : R) s)
    (hu' : IsUnit (1 - (u : R) * s)) :
    dennisStein (u : R) s hus hu' = steinbergSymbol u hu'.unit (by
      rw [IsUnit.unit_spec]
      exact (Commute.one_right _).sub_right ((Commute.refl _).mul_right hus)) := by
  sorry

/-- For commuting units, `{u, v} = ⟨u, u⁻¹(1 - v)⟩`. -/
theorem steinbergSymbol_eq_dennisStein (u v : Rˣ) (huv : Commute (u : R) v) :
    steinbergSymbol u v huv = dennisStein (u : R) (((u⁻¹ : Rˣ) : R) * (1 - v))
      ((Commute.units_inv_right (Commute.refl _)).mul_right
        ((Commute.one_right _).sub_right huv))
      (by rw [← mul_assoc, Units.mul_inv, one_mul, sub_sub_cancel]; exact v.isUnit) := by
  sorry

theorem map_dennisStein {R' : Type v} [Ring R'] (f : R →+* R') :
    K2.map f (dennisStein r s hrs hu) =
      dennisStein (f r) (f s) (hrs.map f) (by simpa using hu.map f) := by
  sorry

/-- The pre-1980 symbol of `(a, b)`, defined when `1 + ab` is a unit, is `⟨-a, b⟩⁻¹`; no second
symbol is defined, so what is stated is that the old hypothesis is the new one at `(-a, b)`. -/
theorem dennisStein_neg_inv (a b : R) (hab : IsUnit (1 + a * b)) : IsUnit (1 - (-a) * b) := by
  sorry

end DennisStein

-- test TauCeti.K2.phi_dennisSteinWord_two (characterisation)
/- In `GL₂(R)`, with `u = 1 - rs` a unit and `rs = sr`,
`e₂₁(-s u⁻¹) e₁₂(-r) e₂₁(s) e₁₂(u⁻¹ r) = diag(u, u⁻¹)`. -/
example {R : Type u} [Ring R] (r s : R) (hrs : r * s = s * r) (u : Rˣ) (hu : (u : R) = 1 - r * s) :
    !![1, 0; -(s * ((u⁻¹ : Rˣ) : R)), 1] * !![1, -r; 0, 1] * !![1, 0; s, 1] *
        !![1, ((u⁻¹ : Rˣ) : R) * r; 0, 1] = !![(u : R), 0; 0, ((u⁻¹ : Rˣ) : R)] := by
  sorry

-- test TauCeti.K2.dennisStein_zero (degenerate)
example {R : Type u} [Ring R] (r s : R) :
    dennisStein r 0 (Commute.zero_right r) (by simp) = 1 ∧
      dennisStein 0 s (Commute.zero_left s) (by simp) = 1 := by
  sorry

-- test TauCeti.K2.dennisStein_neg_one_neg_two (computation)
/- In `K₂(ℤ)`, `⟨-1, -2⟩ = {-1, 1 - (-1)(-2)} = {-1, -1}`, non-trivial by the sign symbol. -/
example (h : IsUnit (1 - (-1 : ℤ) * (-2))) :
    dennisStein (-1 : ℤ) (-2) (Commute.all _ _) h = steinbergSymbol (-1) (-1) (Commute.all _ _) ∧
      TameSymbol.signSymbolAt (Int.castRingHom ℝ) (dennisStein (-1 : ℤ) (-2) (Commute.all _ _) h) =
        -1 := by
  sorry

-- test TauCeti.K2.dennisStein_not_old_convention (non-example)
/- At `(-1, -2)` in `ℚ` the pre-1980 symbol is `⟨1, -2⟩⁻¹ = {1, 3}⁻¹ = 1`, while the modern
`⟨-1, -2⟩ = {-1, -1} ≠ 1`; over `ℤ` the modern symbol is defined at `(1, 2)` (`1 - 2 = -1`) where
the old hypothesis (`1 + 2 = 3`) fails. -/
example (h₁ : IsUnit (1 - (1 : ℚ) * (-2))) (h₂ : IsUnit (1 - (-1 : ℚ) * (-2))) :
    (dennisStein (1 : ℚ) (-2) (Commute.all _ _) h₁)⁻¹ = 1 ∧
      dennisStein (-1 : ℚ) (-2) (Commute.all _ _) h₂ ≠ 1 ∧
      IsUnit (1 - (1 : ℤ) * 2) ∧ ¬ IsUnit (1 + (1 : ℤ) * 2) := by
  sorry

-- test TauCeti.K2.steinbergSymbol_two_three (compatibility)
/- In `K₂(ℚ)`, `{2, 3} = ⟨2, -1⟩`, the case `u = 2`, `v = 3` of `{u, v} = ⟨u, u⁻¹(1 - v)⟩`. -/
example (h : IsUnit (1 - (2 : ℚ) * (-1))) :
    steinbergSymbol (Units.mk0 (2 : ℚ) (by norm_num)) (Units.mk0 (3 : ℚ) (by norm_num))
      (Commute.all _ _) = dennisStein (2 : ℚ) (-1) (Commute.all _ _) h := by
  sorry

section Relations

variable {R : Type u} [CommRing R]

/-- `K2SymbolsBrauer:T.6/dennis-stein-relations` (D1): `⟨r, s⟩⟨s, r⟩ = 1`. -/
theorem dennis_stein_relations (r s : R) (h : IsUnit (1 - r * s)) (h' : IsUnit (1 - s * r)) :
    dennisStein r s (Commute.all _ _) h * dennisStein s r (Commute.all _ _) h' = 1 := by
  sorry

/-- `K2SymbolsBrauer:T.6/dennis-stein-relations` (D2): `⟨r, s⟩⟨r, t⟩ = ⟨r, s + t - rst⟩`. -/
theorem dennis_stein_relations_add (r s t : R) (hs : IsUnit (1 - r * s)) (ht : IsUnit (1 - r * t))
    (hst : IsUnit (1 - r * (s + t - r * s * t))) :
    dennisStein r s (Commute.all _ _) hs * dennisStein r t (Commute.all _ _) ht =
      dennisStein r (s + t - r * s * t) (Commute.all _ _) hst := by
  sorry

/-- `K2SymbolsBrauer:T.6/dennis-stein-relations` (D3): `⟨r, st⟩ = ⟨rs, t⟩⟨tr, s⟩`. -/
theorem dennis_stein_relations_mul (r s t : R) (h : IsUnit (1 - r * (s * t)))
    (h₁ : IsUnit (1 - r * s * t)) (h₂ : IsUnit (1 - t * r * s)) :
    dennisStein r (s * t) (Commute.all _ _) h =
      dennisStein (r * s) t (Commute.all _ _) h₁ * dennisStein (t * r) s (Commute.all _ _) h₂ := by
  sorry

/-- `K2SymbolsBrauer:T.6/dennis-stein-relations`: `⟨r, 1⟩ = 1` when `1 - r` is a unit (the source
prints `0`; see `K2SymbolsBrauer/E1`). -/
theorem dennis_stein_relations_one (r : R) (h : IsUnit (1 - r * 1)) :
    dennisStein r 1 (Commute.all _ _) h = 1 := by
  sorry

/-- The generators `⟨r, s⟩` of the Dennis–Stein presentation. -/
abbrev DSGen (R : Type u) [CommRing R] := {p : R × R // IsUnit (1 - p.1 * p.2)}

/-- The relations (D1)–(D3) among the generators. -/
def dsRel (R : Type u) [CommRing R] : Set (FreeAbelianGroup (DSGen R)) :=
  {z | ∃ (r s : R) (h : IsUnit (1 - r * s)) (h' : IsUnit (1 - s * r)),
      z = FreeAbelianGroup.of ⟨(r, s), h⟩ + FreeAbelianGroup.of ⟨(s, r), h'⟩} ∪
  {z | ∃ (r s t : R) (hs : IsUnit (1 - r * s)) (ht : IsUnit (1 - r * t))
      (hst : IsUnit (1 - r * (s + t - r * s * t))),
      z = FreeAbelianGroup.of ⟨(r, s), hs⟩ + FreeAbelianGroup.of ⟨(r, t), ht⟩ -
        FreeAbelianGroup.of ⟨(r, s + t - r * s * t), hst⟩} ∪
  {z | ∃ (r s t : R) (h : IsUnit (1 - r * (s * t))) (h₁ : IsUnit (1 - r * s * t))
      (h₂ : IsUnit (1 - t * r * s)),
      z = FreeAbelianGroup.of ⟨(r, s * t), h⟩ - FreeAbelianGroup.of ⟨(r * s, t), h₁⟩ -
        FreeAbelianGroup.of ⟨(t * r, s), h₂⟩}

/-- The abelian group `D(R)` generated by the `⟨r, s⟩` subject only to (D1)–(D3). -/
def dennisSteinGroup (R : Type u) [CommRing R] : Type u :=
  FreeAbelianGroup (DSGen R) ⧸ AddSubgroup.closure (dsRel R)

instance (R : Type u) [CommRing R] : AddCommGroup (dennisSteinGroup R) :=
  inferInstanceAs (AddCommGroup (_ ⧸ AddSubgroup.closure (dsRel R)))

/-- `D(R) → K₂(R)`, generator ↦ Dennis–Stein symbol (the relation check is
`K2SymbolsBrauer:T.6/dennis-stein-relations`). -/
def dennisSteinGroup.toK2 (R : Type u) [CommRing R] : dennisSteinGroup R →+ Additive (K2 R) :=
  QuotientAddGroup.lift _ (FreeAbelianGroup.lift fun p : DSGen R =>
    Additive.ofMul (dennisStein p.1.1 p.1.2 (Commute.all _ _) p.2)) (by sorry)

/-- `K2SymbolsBrauer:T.6/dennis-stein-presentation` (Theorem III.5.11.1(a)): for a commutative
local ring (a field included) `D(R) → K₂(R)` is an isomorphism. For a field it is Matsumoto's
theorem through `⟨r, s⟩ ↦ {r, 1 - rs}`; for a local ring that is not a field it is cited
(Maazen–Stienstra, van der Kallen; Keune [103]). -/
theorem dennis_stein_presentation (R : Type u) [CommRing R] [IsLocalRing R] :
    Function.Bijective (dennisSteinGroup.toK2 R) := by
  sorry

end Relations

/-! ### `K2SymbolsBrauer:T.6/relative-steinberg-group` -/

section Relative

variable (R : Type u) [Ring R] (I : Ideal R) [I.IsTwoSided]

/-- The double ring `R ⊕ I`, realised as `{(a, b) ∈ R × R | b - a ∈ I}` through
`(r, x) ↦ (r, r + x)`: `pr = fst`, `add = snd` (a real definition). -/
def doubleRing : Subring (R × R) where
  carrier := {p | p.2 - p.1 ∈ I}
  mul_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  zero_mem' := by sorry
  neg_mem' := by sorry

/-- `add : R ⊕ I → R`, `(r, x) ↦ r + x`. -/
def doubleAdd : doubleRing R I →+* R := (RingHom.snd R R).comp (doubleRing R I).subtype

/-- `pr : R ⊕ I → R`, `(r, x) ↦ r`. -/
def doublePr : doubleRing R I →+* R := (RingHom.fst R R).comp (doubleRing R I).subtype

/-- The element `(0, v)` of `R ⊕ I` for `v ∈ I`. -/
def doubleZeroV (v : R) (hv : v ∈ I) : doubleRing R I := ⟨(0, v), by sorry⟩

/-- The element `(v, -v)` of `R ⊕ I` for `v ∈ I` (`(v, 0)` in the model). -/
def doubleVNeg (v : R) (hv : v ∈ I) : doubleRing R I := ⟨(v, 0), by sorry⟩

/-- `St′(R, I)`: the normal subgroup of `St(R ⊕ I)` generated by the `x_ij(0, v)`, `v ∈ I`
(it is `ker St(pr)`). -/
def stPrime : Subgroup (StableSteinberg (doubleRing R I)) :=
  Subgroup.normalClosure {g | ∃ (i j : ℕ) (hij : i ≠ j) (v : R) (hv : v ∈ I),
    g = StableSteinberg.x hij (doubleZeroV R I v hv)}

/-- The cross-commutators `[x_ij(0, u), x_kl(v, -v)]`, `u, v ∈ I`. -/
def crossCommutators : Subgroup (StableSteinberg (doubleRing R I)) :=
  Subgroup.normalClosure {g | ∃ (i j k l : ℕ) (hij : i ≠ j) (hkl : k ≠ l) (a b : R) (ha : a ∈ I)
    (hb : b ∈ I), g = ⁅StableSteinberg.x hij (doubleZeroV R I a ha),
      StableSteinberg.x hkl (doubleVNeg R I b hb)⁆}

instance crossCommutators_subgroupOf_normal :
    ((crossCommutators R I).subgroupOf (stPrime R I)).Normal :=
  Subgroup.Normal.subgroupOf (Subgroup.normalClosure_normal) _

/-- **The relative Steinberg group** `St(R, I)` (Keune–Loday): `St′(R, I)` modulo the
cross-commutators. -/
def RelSteinberg : Type u := stPrime R I ⧸ (crossCommutators R I).subgroupOf (stPrime R I)

instance : Group (RelSteinberg R I) := inferInstanceAs (Group (_ ⧸ _))

/-- `St(R, I) → St(R)`, induced by `add`. -/
def RelSteinberg.add : RelSteinberg R I →* StableSteinberg R :=
  QuotientGroup.lift _ ((StableSteinberg.map (doubleAdd R I)).comp (stPrime R I).subtype)
    (by sorry)

/-- The range of `St(R, I) → St(R)` is the normal subgroup generated by the `x_ij(v)`, `v ∈ I`. -/
theorem RelSteinberg.range_add : (RelSteinberg.add R I).range =
    Subgroup.normalClosure {g | ∃ (i j : ℕ) (hij : i ≠ j) (v : R), v ∈ I ∧
      g = StableSteinberg.x hij v} := by
  sorry

/-- **Relative `K₂`**: `K₂(R, I) = ker(St(R, I) → E(R, I))`, the map to `E(R, I) ⊆ GL(R)` read
through `St(R)`. -/
def relK2 : Subgroup (RelSteinberg R I) := ((StableSteinberg.phi R).comp (RelSteinberg.add R I)).ker

/-- `K₂(R, I)` is central in `St(R, I)`, hence abelian; the group law is the subgroup's. -/
instance : CommGroup (relK2 R I) := { (inferInstance : Group (relK2 R I)) with mul_comm := sorry }

/-- `K₂(R, I) → K₂(R)` (a real definition). -/
def relK2.toK2 : relK2 R I →* K2 R where
  toFun g := ⟨RelSteinberg.add R I g, g.2⟩
  map_one' := by sorry
  map_mul' := by sorry

/-- Exactness of `K₂(R, I) → K₂(R) → K₂(R/I)` (Theorem III.5.7.1). The continuation
`→ K₁(R, I) → K₁(R) → K₁(R/I)` is not stated here; it needs `K₁(R, I)` and `E(R, I)`
(supplier: KTheoryLowDegrees:U.5). -/
theorem relK2.exact : (relK2.toK2 R I).range = (K2.map (Ideal.Quotient.mk I)).ker := by
  sorry

variable {R I}

/-- Functoriality of `K₂(R, I)`. -/
def relK2.map {R' : Type v} [Ring R'] (I' : Ideal R') [I'.IsTwoSided] (f : R →+* R')
    (hf : ∀ x ∈ I, f x ∈ I') : relK2 R I →* relK2 R' I' :=
  sorry

theorem relK2.map_id : relK2.map I (RingHom.id R) (fun _ hx => hx) = MonoidHom.id (relK2 R I) := by
  sorry

theorem relK2.map_comp {R' : Type v} {R'' : Type w} [Ring R'] [Ring R''] (I' : Ideal R')
    [I'.IsTwoSided] (I'' : Ideal R'') [I''.IsTwoSided] (f : R →+* R') (g : R' →+* R'')
    (hf : ∀ x ∈ I, f x ∈ I') (hg : ∀ x ∈ I', g x ∈ I'') :
    relK2.map I'' (g.comp f) (fun x hx => hg _ (hf x hx)) =
      (relK2.map I'' g hg).comp (relK2.map I' f hf) := by
  sorry

variable (R) in
theorem relK2_bot : ∀ g : relK2 R ⊥, g = 1 := by
  sorry

/-- **The relative Dennis–Stein symbol** `⟨r, s⟩ ∈ K₂(R, I)` for `s ∈ I`: the class of the
Dennis–Stein word of `((r, 0), (0, s))` in `St(R ⊕ I)` (in the model, `(r, r)` and `(0, s)`),
with `1 - (r, 0)(0, s) = (1, -rs)` inverted in `R ⊕ I` (a real definition). -/
def relDennisStein (r s : R) (hs : s ∈ I) (hrs : Commute r s) (hu : IsUnit (1 - r * s)) :
    relK2 R I :=
  ⟨QuotientGroup.mk ⟨dennisSteinWord (i := 0) (j := 1) (by decide)
      (⟨(r, r), by sorry⟩ : doubleRing R I) (doubleZeroV R I s hs)
      { val := ⟨(1, 1 - r * s), by sorry⟩
        inv := ⟨(1, ((hu.unit⁻¹ : Rˣ) : R)), by sorry⟩
        val_inv := by sorry
        inv_val := by sorry }, by sorry⟩, by sorry⟩

theorem toK2_relDennisStein (r s : R) (hs : s ∈ I) (hrs : Commute r s) (hu : IsUnit (1 - r * s)) :
    relK2.toK2 R I (relDennisStein r s hs hrs hu) = dennisStein r s hrs hu := by
  sorry

end Relative

-- test TauCeti.K2.relK2_zero_ideal (degenerate)
example {R : Type u} [Ring R] :
    (∀ g : RelSteinberg R ⊥, g = 1) ∧ ∀ g : relK2 R ⊥, g = 1 := by
  sorry

-- test TauCeti.K2.relK2_Z4 (computation)
/- For `ℤ/4 ⊇ I = (2)`: `K₂(ℤ/2) = 1`, so `K₂(ℤ/4, I) → K₂(ℤ/4)` is onto, and the relative
`⟨2, 2⟩` maps to `⟨2, 2⟩ = {-1, -1}`. -/
example (hu : IsUnit (1 - (2 : ZMod 4) * 2)) :
    Function.Surjective (relK2.toK2 (ZMod 4) (Ideal.span {2})) ∧
      relK2.toK2 (ZMod 4) (Ideal.span {2})
        (relDennisStein 2 2 (Ideal.mem_span_singleton_self 2) (Commute.all _ _) hu) =
        steinbergSymbol (-1) (-1) (Commute.all _ _) := by
  sorry

-- test TauCeti.K2.RelSteinberg.range_add_top (characterisation)
example {R : Type u} [Ring R] :
    (RelSteinberg.add R ⊤).range = ⊤ ∧ (RelSteinberg.add R ⊥).range = ⊥ := by
  sorry

section RelativePresentation

variable {R : Type u} [CommRing R] (I : Ideal R)

/-- The generators of the relative presentation: pairs with an entry in `I`. -/
abbrev RelDSGen (I : Ideal R) := {p : R × R // p.1 ∈ I ∨ p.2 ∈ I}

/-- The relations (D1)–(D3) among the relative generators (whenever `r`, `s` or `t` lies in `I`,
every symbol involved is a generator). -/
def relDSRel : Set (FreeAbelianGroup (RelDSGen I)) :=
  {z | ∃ (r s : R) (h : r ∈ I ∨ s ∈ I) (h' : s ∈ I ∨ r ∈ I),
      z = FreeAbelianGroup.of ⟨(r, s), h⟩ + FreeAbelianGroup.of ⟨(s, r), h'⟩} ∪
  {z | ∃ (r s t : R) (hs : r ∈ I ∨ s ∈ I) (ht : r ∈ I ∨ t ∈ I)
      (hst : r ∈ I ∨ s + t - r * s * t ∈ I),
      z = FreeAbelianGroup.of ⟨(r, s), hs⟩ + FreeAbelianGroup.of ⟨(r, t), ht⟩ -
        FreeAbelianGroup.of ⟨(r, s + t - r * s * t), hst⟩} ∪
  {z | ∃ (r s t : R) (h : r ∈ I ∨ s * t ∈ I) (h₁ : r * s ∈ I ∨ t ∈ I) (h₂ : t * r ∈ I ∨ s ∈ I),
      z = FreeAbelianGroup.of ⟨(r, s * t), h⟩ - FreeAbelianGroup.of ⟨(r * s, t), h₁⟩ -
        FreeAbelianGroup.of ⟨(t * r, s), h₂⟩}

/-- The relative Dennis–Stein group, generated by the relative generators subject only to
(D1)–(D3). -/
def relDennisSteinGroup : Type u := FreeAbelianGroup (RelDSGen I) ⧸ AddSubgroup.closure (relDSRel I)

instance : AddCommGroup (relDennisSteinGroup I) :=
  inferInstanceAs (AddCommGroup (_ ⧸ AddSubgroup.closure (relDSRel I)))

open Classical in
/-- For `I ⊆ rad R`, generator `(r, s)` ↦ `⟨r, s⟩` (`s ∈ I`) or `⟨s, r⟩⁻¹` (`r ∈ I`); every
`1 - rs` is a unit because `rs ∈ I ⊆ rad R`. -/
def relDennisSteinGroup.toRelK2 (hI : I ≤ Ideal.jacobson ⊥) :
    relDennisSteinGroup I →+ Additive (relK2 R I) :=
  QuotientAddGroup.lift _ (FreeAbelianGroup.lift fun p : RelDSGen I =>
    if h : p.1.2 ∈ I then Additive.ofMul (relDennisStein p.1.1 p.1.2 h (Commute.all _ _) (by sorry))
    else Additive.ofMul (relDennisStein p.1.2 p.1.1 (p.2.resolve_right h) (Commute.all _ _)
      (by sorry))⁻¹) (by sorry)

/-- `K2SymbolsBrauer:T.6/relative-presentation` (Theorem III.5.11.1(b), cited): for a radical ideal
of a commutative ring, `K₂(R, I)` is presented by the relative Dennis–Stein symbols subject only
to (D1)–(D3). -/
theorem relative_presentation (hI : I ≤ Ideal.jacobson ⊥) :
    Function.Bijective (relDennisSteinGroup.toRelK2 I hI) := by
  sorry

end RelativePresentation

section SquareZero

variable {A : Type u} [CommRing A]

/-- `K2SymbolsBrauer:T.6/relative-square-zero`: for `I² = 0` every `⟨a, s⟩`, `s ∈ I`, is defined
(`1 - as` has inverse `1 + as`). -/
theorem relative_square_zero (I : Ideal A) (hI : I ^ 2 = ⊥) (a s : A) (hs : s ∈ I) :
    IsUnit (1 - a * s) := by
  sorry

/-- `K2SymbolsBrauer:T.6/relative-square-zero`: `⟨s, a⟩ = ⟨a, s⟩⁻¹` and `s ↦ ⟨a, s⟩` is additive
on `I` (the term `ast` of (D2) lies in `I² = 0`). -/
theorem relative_square_zero_symm_add (I : Ideal A) (hI : I ^ 2 = ⊥) (a s t : A) (hs : s ∈ I)
    (ht : t ∈ I) (h₁ : IsUnit (1 - a * s)) (h₂ : IsUnit (1 - s * a)) (h₃ : IsUnit (1 - a * t))
    (h₄ : IsUnit (1 - a * (s + t))) :
    dennisStein s a (Commute.all _ _) h₂ = (dennisStein a s (Commute.all _ _) h₁)⁻¹ ∧
      dennisStein a (s + t) (Commute.all _ _) h₄ =
        dennisStein a s (Commute.all _ _) h₁ * dennisStein a t (Commute.all _ _) h₃ := by
  sorry

/-- `K2SymbolsBrauer:T.6/relative-square-zero` on Mathlib's `TrivSqZeroExt R M` with
`I = kerIdeal R M`: `K₂(A, I)` is generated by the relative `⟨a, s⟩`, `s ∈ I`. -/
theorem relative_square_zero_generation (R M : Type u) [CommRing R] [AddCommGroup M] [Module R M]
    [Module Rᵐᵒᵖ M] [IsCentralScalar R M] :
    Subgroup.closure {g | ∃ (a s : TrivSqZeroExt R M) (hs : s ∈ TrivSqZeroExt.kerIdeal R M)
      (hu : IsUnit (1 - a * s)), g = relDennisStein a s hs (Commute.all _ _) hu} =
      (⊤ : Subgroup (relK2 (TrivSqZeroExt R M) (TrivSqZeroExt.kerIdeal R M))) := by
  sorry

/-- `K2SymbolsBrauer:T.6/relative-square-zero`, Ex. III.5.14(c) (van der Kallen, cited): for the dual
numbers with `1/2 ∈ R`, `K₂(R[ε], (ε)) ≃ Ω¹_R`. -/
theorem relative_square_zero_dualNumber (R : Type u) [CommRing R] (h2 : IsUnit (2 : R)) :
    Nonempty (Additive (relK2 (DualNumber R) (TrivSqZeroExt.kerIdeal R R)) ≃+ Ω[R⁄ℤ]) := by
  sorry

/-- `K2SymbolsBrauer:T.6/relative-square-zero`, Ex. III.5.13: `K₂(ℤ/2ⁿ) ≅ {±1}` for `n ≥ 2`, and in
`K₂(ℤ/4)`, `{-1, -1} = ⟨-1, -2⟩ = ⟨2, 2⟩`. -/
theorem relative_square_zero_zmod (n : ℕ) (hn : 2 ≤ n) (h₁ : IsUnit (1 - (-1 : ZMod 4) * (-2)))
    (h₂ : IsUnit (1 - (2 : ZMod 4) * 2)) :
    Nat.card (K2 (ZMod (2 ^ n))) = 2 ∧
      steinbergSymbol (-1 : (ZMod 4)ˣ) (-1) (Commute.all _ _) =
        dennisStein (-1 : ZMod 4) (-2) (Commute.all _ _) h₁ ∧
      dennisStein (-1 : ZMod 4) (-2) (Commute.all _ _) h₁ =
        dennisStein (2 : ZMod 4) 2 (Commute.all _ _) h₂ := by
  sorry

/-- `K2SymbolsBrauer:T.6/relative-square-zero`, Ex. III.5.14(a),(b) (exercises in the source): for
`I² = 0` there is a surjection `K₂(A, I) → I ⊗_A Ω¹_{A/I}`, `⟨x, r⟩ ↦ x ⊗ dr̄` (so
`⟨r, x⟩ ↦ -(x ⊗ dr̄)`), whose kernel is generated by the `⟨x, y⟩` with `x, y ∈ I`. -/
theorem relative_square_zero_kaehler (I : Ideal A) (hI : I ^ 2 = ⊥) :
    letI : Module A Ω[(A ⧸ I)⁄ℤ] := Module.compHom _ (Ideal.Quotient.mk I)
    ∃ f : Additive (relK2 A I) →+ (I ⊗[A] Ω[(A ⧸ I)⁄ℤ]), Function.Surjective f ∧
      (∀ (x : A) (hx : x ∈ I) (r : A) (hu : IsUnit (1 - r * x)),
        f (Additive.ofMul (relDennisStein r x hx (Commute.all _ _) hu)) =
          -((⟨x, hx⟩ : I) ⊗ₜ KaehlerDifferential.D ℤ (A ⧸ I) (Ideal.Quotient.mk I r))) ∧
      f.ker = AddSubgroup.closure {z | ∃ (x y : A) (_ : x ∈ I) (hy : y ∈ I)
        (hu : IsUnit (1 - x * y)), z = Additive.ofMul (relDennisStein x y hy (Commute.all _ _) hu)} := by
  sorry

/- The comparison of `K₂(A, I)` with GeneralAlgebraicKTheory K.5's relative group, of which the
square-zero values above are tests: not stated here; needs `K(A, I)` as the homotopy fibre of
`K(A) → K(A/I)` and the Keune–Loday comparison (supplier: GeneralAlgebraicKTheory:K.5). -/

end SquareZero

end TauCeti.K2

/-! ## `K2SymbolsBrauer:T.7` — norm residue symbols

Convention (pinned): local reciprocity, and hence the norm residue symbol, carries the
arithmetic-Frobenius normalisation of ClassFieldTheory Layer 6, and the variable order is the
source's, `x ↦ (x, -)_F`. -/

namespace TauCeti.Twist

open TauCeti

variable {F : Type u} [Field F] {m : ℕ} [NeZero m]

/-- The weight-one trivialisation `τ_ζ^{(1)} : ZMod m ≃+ μ_m = KummerCoeff F m`, `1 ↦ ζ`, for a
primitive `m`-th root of unity `ζ ∈ F`: `IsPrimitiveRoot.zmodEquivZPowers` followed by
`IsPrimitiveRoot.zpowers_eq`, read in `KummerCoeff F m` (a real definition). This is the `j = 1`
case of the packet's `TauCeti.Twist.trivialisation`, whose other weights need the twists
`μ_m^{⊗j}` (not pinned; see below). -/
def trivialisationOne {ζ : F} (hζ : IsPrimitiveRoot ζ m) : ZMod m ≃+ KummerCoeff F m :=
  let η : (SeparableClosure F)ˣ :=
    ((hζ.map_of_injective (algebraMap F (SeparableClosure F)).injective).isUnit
      (NeZero.ne m)).unit
  have hη : IsPrimitiveRoot η m := by sorry
  hη.zmodEquivZPowers.trans (MulEquiv.subgroupCongr hη.zpowers_eq).toAdditive

/-- The weight-one change-of-root rule `τ_{ζ^u}^{(1)} = τ_ζ^{(1)} ∘ (u ·)`. -/
theorem trivialisationOne_pow {ζ : F} (hζ : IsPrimitiveRoot ζ m) (u : (ZMod m)ˣ) (a : ZMod m) :
    trivialisationOne (hζ.pow_of_coprime _ (ZMod.val_coe_unit_coprime u)) a =
      trivialisationOne hζ ((u : ZMod m) * a) := by
  sorry

/- `K2SymbolsBrauer:T.7/twisted-roots-of-unity`, the twists `μ_m^{⊗j}` (`j ∈ ℤ`) with the diagonal
action:
`TauCeti.Twist.trivialisation`: not stated here; needs μ_m^{⊗j} for j ≠ 0, 1 (supplier:
MotivicEtaleKTheory:M.1) — its weight-one case is `trivialisationOne` above.
`TauCeti.Twist.trivialisation_one`: not stated here; needs μ_m^{⊗j} (supplier:
MotivicEtaleKTheory:M.1).
`TauCeti.Twist.trivialisation_zero`: not stated here; needs μ_m^{⊗0} as the twist of weight zero
(supplier: MotivicEtaleKTheory:M.1).
`TauCeti.Twist.trivialisation_equivariant`: not stated here; needs the G_F-action on μ_m^{⊗j}
(supplier: MotivicEtaleKTheory:M.1).
`TauCeti.Twist.trivialisation_pow`: not stated here; needs μ_m^{⊗j} (supplier:
MotivicEtaleKTheory:M.1) — its weight-one case is `trivialisationOne_pow`.
`TauCeti.Twist.trivialisation_tensor`: not stated here; needs the pairings
μ_m^{⊗i} ⊗ μ_m^{⊗j} ≅ μ_m^{⊗(i+j)} (supplier: MotivicEtaleKTheory:M.1).
`TauCeti.Twist.trivialisation_one_eq`: realised by the definition of `trivialisationOne`
(`zmodEquivZPowers` followed by `zpowers_eq`, read in `KummerCoeff F m`); as an identity about
`trivialisation` it needs μ_m^{⊗1} as a twist (supplier: MotivicEtaleKTheory:M.1).
-- test TauCeti.Twist.trivialisation_zero_indep (degenerate): not stated here; needs μ_m^{⊗0}
(supplier: MotivicEtaleKTheory:M.1).
-- test TauCeti.Twist.trivialisation_two (computation): not stated here; needs μ_2^{⊗j}
(supplier: MotivicEtaleKTheory:M.1).
-- test TauCeti.Twist.trivialisation_pow_five (characterisation): the weight-one half is the
example below; the weight-two half needs μ_5^{⊗2} (supplier: MotivicEtaleKTheory:M.1).
-- test TauCeti.Twist.twist_Q_three (non-example): not stated here; needs μ_3^{⊗2} and H⁰ of it
(supplier: MotivicEtaleKTheory:M.1). -/

-- test TauCeti.Twist.trivialisation_pow_five (characterisation), weight one
/- For `m = 5` and `ζ' = ζ²`: `τ_{ζ'}^{(1)} = τ_ζ^{(1)} ∘ (2 ·)`. -/
example {F : Type u} [Field F] {ζ : F} (hζ : IsPrimitiveRoot ζ 5) (a : ZMod 5) :
    trivialisationOne (hζ.pow_of_coprime 2 (by norm_num)) a = trivialisationOne hζ (2 * a) := by
  sorry

end TauCeti.Twist

namespace TauCeti.NormResidueSymbol

open TauCeti TauCeti.MilnorK TauCeti.Steinberg TauCeti.ContCohomology

section Local

variable (F : Type u) [Field F] [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F]
  (m : ℕ) [NeZero m] [HasEnoughRootsOfUnity F m]

/-- **The `m`-th power norm residue symbol** `(x, y)_F ∈ μ_m`
(`K2SymbolsBrauer:T.7/classical-local-symbols`, Example III.6.2.3), for a nonarchimedean local
field with `μ_m ⊆ F` and `m` invertible: the value at `y` of the character of `Fˣ` attached, by
Kummer theory, to the local reciprocity image of `x` (arithmetic Frobenius). -/
def normResidueSymbol (hm : IsUnit (m : F)) (x y : Fˣ) : rootsOfUnity m F :=
  sorry

variable {F m} (hm : IsUnit (m : F))

/- `TauCeti.NormResidueSymbol.normResidueSymbol_apply`: not stated here; needs the local
reciprocity map `Fˣ → Gal(Fˢ/F)^{ab}` with its arithmetic-Frobenius normalisation (supplier:
ClassFieldTheory Layer 6, `localArtinEquiv`). -/

theorem normResidueSymbol_mul_left (x x' y : Fˣ) :
    normResidueSymbol F m hm (x * x') y = normResidueSymbol F m hm x y * normResidueSymbol F m hm x' y := by
  sorry

theorem normResidueSymbol_mul_right (x y y' : Fˣ) :
    normResidueSymbol F m hm x (y * y') = normResidueSymbol F m hm x y * normResidueSymbol F m hm x y' := by
  sorry

@[simp]
theorem normResidueSymbol_pow_right (x y : Fˣ) : normResidueSymbol F m hm x (y ^ m) = 1 := by
  sorry

/-- The source's "norm residue" property, read with `(x, y)_F` (see `K2SymbolsBrauer/E2`):
`(x, -)_F` is trivial exactly when `x` is an `m`-th power. -/
theorem forall_normResidueSymbol_eq_one_iff (x : Fˣ) :
    (∀ y, normResidueSymbol F m hm x y = 1) ↔ ∃ z : Fˣ, z ^ m = x := by
  sorry

theorem normResidueSymbol_one_sub (a : Fˣ) (ha : (a : F) ≠ 1) :
    normResidueSymbol F m hm a (Units.mk0 (1 - (a : F)) (sub_ne_zero.mpr ha.symm)) = 1 := by
  sorry

variable (F m) in
/-- The Steinberg symbol `K₂(F) → μ_m`, `{x, y} ↦ (x, y)_F` (through Matsumoto). -/
def normResidueK2 (hm : IsUnit (m : F)) : K2 F →* rootsOfUnity m F := sorry

theorem normResidueK2_steinbergSymbol (x y : Fˣ) :
    normResidueK2 F m hm (steinbergSymbol x y (Commute.all _ _)) = normResidueSymbol F m hm x y := by
  sorry

-- test TauCeti.NormResidueSymbol.normResidueSymbol_pow (degenerate)
example (x y : Fˣ) :
    normResidueSymbol F m hm x (y ^ m) = 1 ∧ normResidueSymbol F m hm x 1 = 1 := by
  sorry

end Local

open Classical in
/-- The source's conic symbol `c_F(r, s) ∈ {±1}` (`K2SymbolsBrauer:T.7/hilbert-symbol-steinberg`):
`+1` exactly when `r x² + s y² = 1` has a solution in `F` (a real definition). -/
def conicSymbol (F : Type u) [Field F] (r s : F) : ℤˣ :=
  if ∃ x y : F, r * x ^ 2 + s * y ^ 2 = 1 then 1 else -1

/- `TauCeti.NormResidueSymbol.hilbertSymbol_eq_one_iff_conic`: not stated here; needs `hilbertSymbol`
with its bimultiplicativity (supplier: QuadraticFormInvariants 6C). The source's `c_F` is
`conicSymbol`, and the statements below use it. -/

section Hilbert

variable (F : Type u) [Field F] [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F]

/-- **The Hilbert symbol as a Steinberg symbol**: `K₂(F) →* ℤˣ`, `{r, s} ↦ c_F(r, s)`, for a
nonarchimedean local field with `2` invertible (bilinear there; over `ℚ` it is not). -/
def hilbertK2 (h2 : IsUnit (2 : F)) : K2 F →* ℤˣ := sorry

variable {F}

@[simp]
theorem hilbertK2_symbol (h2 : IsUnit (2 : F)) (r s : Fˣ) :
    hilbertK2 F h2 (steinbergSymbol r s (Commute.all _ _)) = conicSymbol F r s := by
  sorry

/-- For `m = 2` the norm residue symbol is the Hilbert symbol (Example III.6.2.2); QuadraticForm-
Invariants 6C's `hilbertSymbol` is the same map (`hilbertSymbol_eq_qfi`, cited). -/
theorem normResidueSymbol_two [HasEnoughRootsOfUnity F 2] (hm : IsUnit ((2 : ℕ) : F)) (a b : Fˣ) :
    ((normResidueSymbol F 2 hm a b : Fˣ) : F) = ((conicSymbol F a b : ℤ) : F) := by
  sorry

theorem hilbertK2_eq_normResidueK2 [HasEnoughRootsOfUnity F 2] (h2 : IsUnit (2 : F))
    (hm : IsUnit ((2 : ℕ) : F)) (x : K2 F) :
    Units.map (Int.castRingHom F).toMonoidHom (hilbertK2 F h2 x) =
      (normResidueK2 F 2 hm x : Fˣ) := by
  sorry

end Hilbert

/-- Over `ℝ`, the conic symbol is the sign symbol of `K2SymbolsBrauer:T.5/real-sign-symbol`. -/
theorem hilbertK2_real (r s : ℝˣ) :
    conicSymbol ℝ r s = TameSymbol.realSignSymbol (steinbergSymbol r s (Commute.all _ _)) ∧
      conicSymbol ℝ r s = if (r : ℝ) < 0 ∧ (s : ℝ) < 0 then -1 else 1 := by
  sorry

-- test TauCeti.NormResidueSymbol.normResidueSymbol_Q2 (computation)
example [HasEnoughRootsOfUnity ℚ_[2] 2] (hm : IsUnit ((2 : ℕ) : ℚ_[2])) :
    (normResidueSymbol ℚ_[2] 2 hm (-1) (-1) : ℚ_[2]ˣ) = -1 := by
  sorry

-- test TauCeti.NormResidueSymbol.normResidueSymbol_Q3 (characterisation)
example [HasEnoughRootsOfUnity ℚ_[3] 2] (hm : IsUnit ((2 : ℕ) : ℚ_[3])) :
    (normResidueSymbol ℚ_[3] 2 hm (Units.mk0 3 (by norm_num)) (-1) : ℚ_[3]ˣ) = -1 := by
  sorry

-- test TauCeti.NormResidueSymbol.normResidueSymbol_not_tame (non-example)
/- On `ℚ₂` with `m = 2`, the tame symbol of `(-1, -1)` is `1` (both are units) while
`(-1, -1)_{ℚ₂} = -1`. -/
example [HasEnoughRootsOfUnity ℚ_[2] 2] (hm : IsUnit ((2 : ℕ) : ℚ_[2]))
    (hv : Function.Surjective (Padic.mulValuation (p := 2))) :
    TameSymbol.tameSymbol (Padic.mulValuation (p := 2)) hv (-1) (-1) = 1 ∧
      (normResidueSymbol ℚ_[2] 2 hm (-1) (-1) : ℚ_[2]ˣ) = -1 := by
  sorry

-- test TauCeti.NormResidueSymbol.normResidueSymbol_eq_tame_odd (compatibility)
/- On `ℚ_p`, `p` odd, `m = 2`: `(r, s) = ε(∂(r, s))`, `ε : 𝔽_pˣ → {±1}` the quadratic character, so
`(r, s) = 1` exactly when the tame symbol is a square (the inversion between the roadmap's and
the K-book's tame symbol is invisible to `ε`). -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) [HasEnoughRootsOfUnity ℚ_[p] 2]
    (hm : IsUnit ((2 : ℕ) : ℚ_[p])) (hv : Function.Surjective (Padic.mulValuation (p := p)))
    (r s : ℚ_[p]ˣ) :
    (normResidueSymbol ℚ_[p] 2 hm r s : ℚ_[p]ˣ) = 1 ↔
      IsSquare (TameSymbol.tameSymbol (Padic.mulValuation (p := p)) hv r s) := by
  sorry

-- test TauCeti.NormResidueSymbol.hilbertSymbol_Q2 (computation)
example : conicSymbol ℚ_[2] (-1) (-1) = -1 := by
  sorry

-- test TauCeti.NormResidueSymbol.hilbertSymbol_real (compatibility)
example (r s : ℝ) : conicSymbol ℝ r s = -1 ↔ r < 0 ∧ s < 0 := by
  sorry

-- test TauCeti.NormResidueSymbol.hilbertSymbol_eq_qfi (compatibility): not stated here; needs
-- `hilbertSymbol` of QuadraticFormInvariants 6C (supplier: QuadraticFormInvariants 6C).

-- test TauCeti.NormResidueSymbol.hilbertSymbol_degenerate (degenerate)
example {F : Type u} [Field F] (r s : F) : conicSymbol F 1 s = 1 ∧ conicSymbol F r (1 - r) = 1 := by
  sorry

-- test TauCeti.NormResidueSymbol.conicSymbol_Q_not_bilinear (non-example)
/- `c_ℚ(3, -1) = c_ℚ(7, -1) = c_ℚ(21, -1) = -1`, so `c_ℚ(21, -1) ≠ c_ℚ(3, -1) c_ℚ(7, -1)`. -/
example : conicSymbol ℚ 3 (-1) = -1 ∧ conicSymbol ℚ 7 (-1) = -1 ∧ conicSymbol ℚ 21 (-1) = -1 := by
  sorry

/-! ### `K2SymbolsBrauer:T.7/brauer-valued-symbol`

`Br(F)` is taken in its cohomological form `H²(G_F, (Fˢ)ˣ)`, Tau Ceti's
`H2 (AbsoluteGaloisGroup F) (UnitsCoeff F)`; its identification with Tau Ceti's `BrauerGroup F` of
central simple algebras is cited, not pinned. -/

section Brauer

variable {F : Type u} [Field F] {m : ℕ} [NeZero m]

/-- The pairing `μ_m × μ_m → μ_m`, `(a, b) ↦ τ_ζ⁻¹(b) · a`, i.e. `id ⊗ τ_ζ^{(1)⁻¹}` on
`μ_m ⊗ μ_m` (equivariant because `ζ ∈ F`; a real definition). -/
def rootPairing {ζ : F} (hζ : IsPrimitiveRoot ζ m) :
    KummerCoeff F m →+ KummerCoeff F m →+ KummerCoeff F m where
  toFun a :=
    { toFun := fun b => ((Twist.trivialisationOne hζ).symm b).val • a
      map_zero' := by sorry
      map_add' := by sorry }
  map_zero' := by sorry
  map_add' := by sorry

theorem rootPairing_continuous {ζ : F} (hζ : IsPrimitiveRoot ζ m) :
    Continuous fun p : KummerCoeff F m × KummerCoeff F m => rootPairing hζ p.1 p.2 := by
  sorry

theorem rootPairing_equivariant {ζ : F} (hζ : IsPrimitiveRoot ζ m) (g : AbsoluteGaloisGroup F)
    (a b : KummerCoeff F m) : rootPairing hζ (g • a) (g • b) = g • rootPairing hζ a b := by
  sorry

/-- The equivariant inclusion `μ_m → (Fˢ)ˣ` (`kummerCoeffIncl`, `kummerCoeffIncl_equivariant`). -/
def kummerCoeffInclHom (F : Type u) [Field F] (m : ℕ) :
    KummerCoeff F m →+[AbsoluteGaloisGroup F] UnitsCoeff F where
  toFun := kummerCoeffIncl F m
  map_smul' g x := kummerCoeffIncl_equivariant F m g x
  map_zero' := map_zero _
  map_add' := map_add _

/-- **The Brauer-valued symbol** `β_ζ : K₂(F) → Br(F)[m]` attached to a primitive root `ζ ∈ F`:
the Galois symbol `h_F`, then `id ⊗ τ_ζ^{(1)⁻¹}`, then `H²(G_F, μ_m) → H²(G_F, (Fˢ)ˣ)`. Its values
are killed by `m` (`nsmul_brauerSymbol`). -/
def brauerSymbol (hm : IsUnit (m : F)) {ζ : F} (hζ : IsPrimitiveRoot ζ m) :
    K2 F →* Multiplicative (H2 (AbsoluteGaloisGroup F) (UnitsCoeff F)) :=
  sorry

variable (hm : IsUnit (m : F)) {ζ : F} (hζ : IsPrimitiveRoot ζ m)

/-- `β_ζ{a, b}` is the image of `κ(a) ∪ κ(b)` under `id ⊗ τ_ζ⁻¹` and `μ_m → (Fˢ)ˣ`, computed with
the pinned `kummerMap` and `explicitCup11`. -/
theorem brauerSymbol_symbol (a b : Fˣ) :
    Multiplicative.toAdd (brauerSymbol hm hζ (steinbergSymbol a b (Commute.all _ _))) =
      explicitCoeff2 (AbsoluteGaloisGroup F) (KummerCoeff F m) (kummerCoeffInclHom F m)
        continuous_of_discreteTopology
        (explicitCup11 (AbsoluteGaloisGroup F) (KummerCoeff F m) (KummerCoeff F m) (KummerCoeff F m)
          (rootPairing hζ) (rootPairing_continuous hζ) (rootPairing_equivariant hζ)
          (Multiplicative.toAdd (kummerMap F m hm a)) (Multiplicative.toAdd (kummerMap F m hm b))) := by
  sorry

/-- Change of root: `β_{ζ^u} = u⁻¹ β_ζ`. -/
theorem brauerSymbol_pow_root (u : (ZMod m)ˣ) (x : K2 F) :
    Multiplicative.toAdd (brauerSymbol hm (hζ.pow_of_coprime _ (ZMod.val_coe_unit_coprime u)) x) =
      ((u⁻¹ : (ZMod m)ˣ) : ZMod m).val • Multiplicative.toAdd (brauerSymbol hm hζ x) := by
  sorry

@[simp]
theorem nsmul_brauerSymbol (x : K2 F) : m • Multiplicative.toAdd (brauerSymbol hm hζ x) = 0 := by
  sorry

-- test TauCeti.NormResidueSymbol.brauerSymbol_steinberg (degenerate)
example (a : Fˣ) (ha : (a : F) ≠ 1) (c : Fˣ) :
    brauerSymbol hm hζ (steinbergSymbol a (Units.mk0 (1 - (a : F)) (sub_ne_zero.mpr ha.symm))
      (Commute.all _ _)) = 1 ∧
    brauerSymbol hm hζ (steinbergSymbol a (c ^ m) (Commute.all _ _)) = 1 := by
  sorry

end Brauer

-- test TauCeti.NormResidueSymbol.brauerSymbol_pow_root_five (characterisation)
/- For `m = 5`, `β_{ζ²} = 3 β_ζ`, since `2⁻¹ = 3` in `ZMod 5`. -/
example {F : Type u} [Field F] (hm : IsUnit ((5 : ℕ) : F)) {ζ : F} (hζ : IsPrimitiveRoot ζ 5)
    (x : K2 F) :
    Multiplicative.toAdd (brauerSymbol hm (hζ.pow_of_coprime 2 (by norm_num)) x) =
      3 • Multiplicative.toAdd (brauerSymbol hm hζ x) := by
  sorry

-- test TauCeti.NormResidueSymbol.brauerSymbol_real (computation)
/- For `F = ℝ`, `m = 2`, `ζ = -1`: `β{-1, -1} ≠ 0` (the Hamilton quaternions under the cited
identification), and `β{a, b} = 0` unless `a < 0` and `b < 0`. -/
example (hm : IsUnit ((2 : ℕ) : ℝ)) (hζ : IsPrimitiveRoot (-1 : ℝ) 2) :
    brauerSymbol hm hζ (steinbergSymbol (-1) (-1) (Commute.all _ _)) ≠ 1 ∧
      ∀ a b : ℝˣ, ¬((a : ℝ) < 0 ∧ (b : ℝ) < 0) →
        brauerSymbol hm hζ (steinbergSymbol a b (Commute.all _ _)) = 1 := by
  sorry

-- test TauCeti.NormResidueSymbol.brauerSymbol_depends_on_root (non-example)
/- For `m = 3` and a field containing a primitive cube root `ζ` (such as `ℚ(μ₃)`),
`β_{ζ²} = -β_ζ`, so a symbol not naming `ζ` could only be `0`. -/
example {F : Type u} [Field F] (hm : IsUnit ((3 : ℕ) : F)) {ζ : F} (hζ : IsPrimitiveRoot ζ 3)
    (x : K2 F) :
    Multiplicative.toAdd (brauerSymbol hm (hζ.pow_of_coprime 2 (by norm_num)) x) =
      -Multiplicative.toAdd (brauerSymbol hm hζ x) := by
  sorry

/-! ### `K2SymbolsBrauer:T.7/global-reciprocity` -/

open IsDedekindDomain NumberField in
/-- `K2SymbolsBrauer:T.7/global-reciprocity`: for a number field with `μ_m ⊆ F` and `a, b ∈ Fˣ`,
the local symbols `(a, b)_v` (the norm residue symbol of `F_v` at the finite places, the sign
symbol at the real places, `1` at the complex ones) are `1` for almost all `v`, and
`∏_v (a, b)_v = 1`. The finite-place values are read in `μ_m(F)` (each lies in its image). -/
theorem global_reciprocity (F : Type u) [Field F] [NumberField F] (m : ℕ) [NeZero m]
    [HasEnoughRootsOfUnity F m]
    [∀ v : HeightOneSpectrum (𝓞 F), HasEnoughRootsOfUnity (v.adicCompletion F) m]
    (hm : ∀ v : HeightOneSpectrum (𝓞 F), IsUnit (m : v.adicCompletion F)) (a b : Fˣ) :
    ∃ c : HeightOneSpectrum (𝓞 F) → rootsOfUnity m F,
      (∀ v, restrictRootsOfUnity (algebraMap F (v.adicCompletion F)) m (c v) =
        normResidueSymbol (v.adicCompletion F) m (hm v)
          (Units.map (algebraMap F (v.adicCompletion F)).toMonoidHom a)
          (Units.map (algebraMap F (v.adicCompletion F)).toMonoidHom b)) ∧
      (Function.mulSupport c).Finite ∧
      (∏ᶠ v, ((c v : rootsOfUnity m F) : Fˣ)) *
        ∏ᶠ w : {w : InfinitePlace F // w.IsReal},
          Units.map (Int.castRingHom F).toMonoidHom
            (TameSymbol.signSymbolAt (InfinitePlace.embedding_of_isReal w.2)
              (steinbergSymbol a b (Commute.all _ _))) = 1 := by
  sorry

/- `K2SymbolsBrauer:T.7/symbol-formula`: not stated here; needs the Galois symbol
`h_F : K₂(F)/m → H²(F, μ_m^{⊗2})` and the module `μ_m^{⊗2}` with its diagonal action (supplier:
MotivicEtaleKTheory:M.3 for `h_F`, MotivicEtaleKTheory:M.1 for the twist). With a primitive root
`ζ ∈ F` its image in `Br(F)` is `brauerSymbol_symbol` above, computed with the pinned
`TauCeti.kummerMap` and `TauCeti.ContCohomology.explicitCup11`.
`K2SymbolsBrauer:T.7/local-comparison`: not stated here; needs the local invariant
`inv_F : Br(F) → ℚ/ℤ` with its arithmetic-Frobenius normalisation and `kummerCupPairing ζ`
(supplier: ClassFieldTheory Layer 5 and Layer 6).
`K2SymbolsBrauer:T.7/chern-class-agreement`: not stated here; needs the étale Chern class
`c_{2,2}` on Quillen `K₂` and the comparison `K2SymbolsBrauer:T.1/k2-pi2` (supplier:
MotivicEtaleKTheory:M.3 and K2SymbolsBrauer:T.1/k2-pi2). -/

end TauCeti.NormResidueSymbol
