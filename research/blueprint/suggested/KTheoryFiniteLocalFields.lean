import Mathlib.Algebra.Category.FGModuleCat.Abelian
import Mathlib.Algebra.Category.FGModuleCat.EssentiallySmall
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Algebra.Group.Commutator
import Mathlib.Algebra.Module.Torsion.Basic
import Mathlib.CategoryTheory.Action.Limits
import Mathlib.Data.Finsupp.Basic
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.Perfect
import Mathlib.FieldTheory.RatFunc.AsPolynomial
import Mathlib.GroupTheory.Divisible
import Mathlib.GroupTheory.PGroup
import Mathlib.GroupTheory.PresentedGroup
import Mathlib.GroupTheory.Torsion
import Mathlib.LinearAlgebra.ExteriorAlgebra.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Card
import Mathlib.LinearAlgebra.PiTensorProduct.Basic
import Mathlib.NumberTheory.Cyclotomic.CyclotomicCharacter
import Mathlib.NumberTheory.LocalField.Basic
import Mathlib.NumberTheory.Multiplicity
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.Padics.HeightOneSpectrum
import Mathlib.NumberTheory.Padics.LocalField
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.RepresentationTheory.Character
import Mathlib.RepresentationTheory.FDRep
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Basic
import Mathlib.RepresentationTheory.Homological.GroupHomology.Basic
import Mathlib.RepresentationTheory.Homological.TateCohomology.Basic
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.DedekindDomain.AdicValuation
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.RingTheory.Kaehler.Polynomial
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.RingTheory.MvPolynomial.Symmetric.Defs
import Mathlib.RingTheory.Norm.Defs
import Mathlib.RingTheory.Norm.Transitivity
import Mathlib.RingTheory.Polynomial.Eisenstein.Basic
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.RootsOfUnity.Basic
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RingTheory.WittVector.Compare
import Mathlib.RingTheory.WittVector.DiscreteValuationRing
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.RingTheory.WittVector.Identities
import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.RingTheory.WittVector.Truncated
import Mathlib.RingTheory.WittVector.Verschiebung
import TauCeti.CategoryTheory.GrothendieckGroup.Abelian
import TauCeti.CategoryTheory.GrothendieckGroup.FiniteDimensionalVectorSpace
import TauCeti.FieldTheory.GaloisCohomology.Kummer
import TauCeti.NumberTheory.LocalField.NormalizedValuation
import TauCeti.NumberTheory.LocalField.Teichmuller
import TauCeti.RepresentationTheory.BaseChange
import TauCeti.RepresentationTheory.Homological.TateCohomology.LowDegree
import TauCeti.RepresentationTheory.RepresentationRing.Basic
import TauCeti.RingTheory.DedekindDomain.AdicCompletionExtension
import TauCeti.RingTheory.DedekindDomain.AdicValuation.Completion
import TauCeti.RingTheory.DedekindDomain.AdicValuation.ValuativeRel
import TauCeti.RingTheory.Henselian
import TauCeti.RingTheory.RootsOfUnity.Henselian

/-!
# Suggested Lean forms for `KTheoryFiniteLocalFields` (stages L.1–L.7)

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/KTheoryFiniteLocalFields.md` is definitive. The statements below
suggest Lean forms so that contributors and reviewers converge on names and signatures; they claim
no implementation, and `implementationStatus` stays `"unchecked"` for every node.

Pinned commits: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

Compiled with `lean` in the `TauCeti-adic` project on its Lake search path for Mathlib `082e2d3`,
with the imported Tau Ceti modules compiled from the `f790474` sources by `lean -o` into a
directory placed first on `LEAN_PATH`: it elaborates with exit code `0` and only `sorry` warnings.

## Pinned conventions

* **Finite coefficients** (`L.1/k-theory-mod-m`): `K_n(R; ℤ/m) = π_n(K(R)/m)`, the homotopy of the
  cofibre of `m` on the connective K-theory spectrum, equivalently of `K(R) ∧ P^∞(ℤ/m)` with the
  mod-`m` Moore spectrum; `K_n(R; ℤ/m) = 0` for `n < 0`.
* **Completed K-theory** (`L.1/completed-k-theory`): `K_n(R; ℤ_p) = π_n(holim_ν K(R)/p^ν)`, the
  homotopy of the `p`-completion; integral, completed and finite-coefficient groups are three
  distinct carriers, related only by `κ` and `ρ_ν`.
* **The localisation boundary** of a DVR `O ⊂ L` (`L.2/dvr-localisation`) has `∂[π] = [k] = 1`
  on `K_1(L) = Lˣ` and is left linear, `∂(x · y) = r(x) · ∂(y)` (`dvr_localisation`).
* **The tame formula** (`L.3`): for `d ∣ q - 1`, `(a, b)_d = ω(∂_v{a, b})^{-(q-1)/d}`, with `ω` the
  Teichmüller lift (Tau Ceti's `TauCeti.teichmuller`), `∂_v` the roadmap's tame symbol
  (`∂_v{u, π} = ū`; the K-book's is its inverse) and local reciprocity normalised by the
  arithmetic Frobenius (`TauCeti.LocalK2.normResidueMap_tame`).
* **Hesselholt–Madsen** (`L.4`–`L.6`): `p` is odd throughout; `TR^n` is indexed by
  `C_{p^{n-1}}`, so `π_0 TR^n(A; p) = W_n(A)` (Mathlib's `TruncatedWittVector p n A`).
* **K-book locators**: PDF page = book page + 8.

## Library declarations imported and reused

* Tau Ceti: `TauCeti.SplitK0` with `TauCeti.SplitK0.finrankEquiv` (`K₀` of a field, split model);
  `TauCeti.AbelianK0` (the Grothendieck group `R_{𝔽_q}(G)` of `FDRep`, available through the
  `EssentiallySmall` instance of `TauCeti/CategoryTheory/Action/EssentiallySmall.lean`);
  `TauCeti.repRing`, `TauCeti.repRingCharacter`, `TauCeti.virtualCharacters` (`R_ℂ(G)` and its
  characters) and `Representation.baseChange`; `TauCeti.teichmuller`,
  `TauCeti.normalizedValuation` and `TauCeti.rootsOfUnityEquivResidueField` (local fields and
  henselian rings); the `IsNonarchimedeanLocalField` instance on
  `IsDedekindDomain.HeightOneSpectrum.adicCompletion`,
  `IsDedekindDomain.HeightOneSpectrum.adicCompletionExtension` and
  `IsDedekindDomain.HeightOneSpectrum.residueFieldEquivAdicCompletion` (completions of number
  fields); `TauCeti.TateCohomology.H0LinearEquivTrivialIntZModCard` (Tate cohomology) and
  `TauCeti.kummerMap` (cited in L.7, where the degree-one étale Chern class is the Kummer map).
* Mathlib, finite fields and groups: `GaloisField`, `FiniteField.frobeniusAlgEquivOfAlgebraic`,
  `FiniteField.norm_surjective`, `FiniteField.algebraMap_norm_eq_pow`, `Algebra.norm`, `IsGalois`,
  `Matrix.GeneralLinearGroup` with `toLin`, `Sylow`, `IsPGroup`, `padicValNat`, `ZMod`,
  `rootsOfUnity`, `CommGroup.torsion`, `CommGroup.primaryComponent`, `AlgebraicClosure`.
* Mathlib, representations and (co)homology: `FDRep` with `FDRep.character` and `Action.res`,
  `Representation.trivial`, `LinearMap.charpoly`, `MvPolynomial.IsSymmetric`, `Rep`,
  `groupCohomology`, `groupHomology`, `tateCohomology`, `ProjectiveResolution`, `QuasiIso`,
  `ModuleCat.restrictScalars`.
* Mathlib, local rings and fields: `HenselianRing`, `HenselianLocalRing`,
  `IsDiscreteValuationRing`, `IsLocalRing.ResidueField`, `IsLocalRing.residue`,
  `IsNonarchimedeanLocalField` (with `𝒪[K]`, `𝓀[K]`), `ℚ_[p]` and `ℤ_[p]`, `NumberField`,
  `IsDedekindDomain.HeightOneSpectrum` with `adicCompletion` and `adicCompletionIntegers`,
  `IsAdicComplete`, `AdicCompletion`, `IntermediateField`, `modularCyclotomicCharacter`.
* Mathlib, Witt vectors, differentials and series: `WittVector` with `teichmuller`, `frobenius`,
  `verschiebung`, `ghostComponent` and `truncate`; `TruncatedWittVector` with `truncate` and
  `zmodEquivTrunc`; `KaehlerDifferential` with `D` and `map`, `exteriorPower` (`⋀[A]^i`);
  `PowerSeries.derivative`, `LaurentSeries`, `RatFunc`, `Polynomial.derivative`.
* Mathlib, abelian groups: `DivisibleBy`, `AddSubgroup.torsionBy`, `Submodule.torsionBy`,
  `Module.finrank`, `Module.IsTorsionFree`.

## Stand-ins, helpers and omissions

Neither pinned library has algebraic K-groups `K_n` for `n ≥ 1`, K-theory spectra, K-theory with
coefficients, THH/TR/TC, cyclotomic spectra, `BU`, the plus construction or de Rham–Witt
complexes. The prelude therefore defines, honestly and each documented as a stand-in for the node
that plans it, the carriers that can be defined: Milnor K-theory `TauCeti.MilnorK.milnorK F n`
(a quotient of tensor powers; `milnorK F 2` is Matsumoto's `K₂` of a field, as `L.3` pins), the
stable Steinberg group and Steinberg's `K₂(R) = ker(St(R) → E(R))`, and the `w`-invariants
`w_i(L)`, `w_i^{(ℓ)}(L)` of ArithmeticKTheory N.4 read off the Galois action on roots of unity.
The stages add further honest stand-ins (Brauer characters, the tame and quadratic Hilbert
symbols of a local field, log differentials of a DVR, `H⁰` of the finite Tate twists, the
maximal divisible subgroup and the `p`-adic Tate module). A statement that needs a carrier that
neither exists nor can honestly be defined here is left out, and a comment
`<name>: not stated here; needs … (supplier: …)` records it in place, so that every packet name
appears in this file; where only part of a node is statable, the honest part is stated and its
docstring says what is omitted.
-/

noncomputable section

open scoped TensorProduct commutatorElement WithZero Polynomial IntermediateField DirectSum

universe u v w

/-! ## Prelude: honest local stand-ins for carriers owned by other roadmaps

Milnor K-theory, the stable Steinberg group and Steinberg's `K₂` belong to the companion roadmap
`K2SymbolsBrauer` (part `--T.1`, nodes `T.1/*` and `T.2/*`) and are in neither pinned library. They
are defined here exactly as in the suggested file of `K2SymbolsBrauer--T.3`, each documented as a
stand-in for the node it replaces: the Milnor K-groups as a quotient of tensor powers, the stable
Steinberg group by its presentation, `K₂(R)` as the kernel of its action on column vectors.
Stage L.3 uses `K₂` of a local field in Matsumoto's form (`milnorK E 2`, as the packet pins) and
`K₂` of its valuation ring in Steinberg's form; stages L.1, L.6 and L.7 use the Milnor groups.
The `w`-invariants of ArithmeticKTheory N.4 are defined at the end of the prelude, honestly, from
the Galois action on roots of unity in an algebraic closure. -/

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

instance instAddCommGroupMilnorK (n : ℕ) : AddCommGroup (milnorK F n) :=
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

instance instGroupStableSteinberg : Group (StableSteinberg R) :=
  inferInstanceAs (Group (PresentedGroup (rels R)))

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
instance instCommGroupK2 : CommGroup (K2 R) :=
  { (inferInstance : Group (K2 R)) with mul_comm := sorry }

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

/-! ### The `w`-invariants (stand-in for ArithmeticKTheory N.4)

For a field `L` and `i ∈ ℤ`, `G_L` acts on `μ_m^{⊗ i}` through `χ(σ)^i`, where `σ(ζ) = ζ^{χ(σ)}` on
`μ_m`; since `χ(σ)^i = χ(σ^i)`, the action on `μ_m^{⊗ i}` is trivial exactly when every `σ^i` fixes
`μ_m`. This gives an honest definition of `W_i(L) = H⁰(L, ℚ/ℤ(i))` through its order, with no Tate
twist as a carrier. `G_L` is realised as the `L`-automorphisms of `AlgebraicClosure L`, which
restrict onto the automorphisms of the separable closure. -/

namespace TauCeti.KTheoryFiniteLocal

variable (L : Type u) [Field L]

/-- `G_L` acts trivially on `μ_m^{⊗ i}`: every `σ^i`, for `σ` an `L`-automorphism of an
algebraic closure, fixes every `m`-th root of unity (a real definition). -/
def TwistTrivial (i : ℤ) (m : ℕ) : Prop :=
  ∀ σ : AlgebraicClosure L ≃ₐ[L] AlgebraicClosure L, ∀ ζ ∈ rootsOfUnity m (AlgebraicClosure L),
    (σ ^ i) (ζ : AlgebraicClosure L) = ζ

/-- Stand-in for the `w`-invariant `w_i(L) = #W_i(L)` of ArithmeticKTheory N.4: the largest
`m ≥ 1`, invertible in `L`, with `G_L` acting trivially on `μ_m^{⊗ i}` (a real definition; for
`i = 0` the set is unbounded and `sSup` returns the junk value `0`). -/
def wInvariant (i : ℤ) : ℕ :=
  sSup {m : ℕ | 0 < m ∧ (m : L) ≠ 0 ∧ TwistTrivial L i m}

/-- Stand-in for the `ℓ`-primary `w`-invariant `w_i^{(ℓ)}(L) = #H⁰(L, ℚ_ℓ/ℤ_ℓ(i))` of
ArithmeticKTheory N.4: `ℓ^ν` for the largest `ν` with `G_L` acting trivially on `μ_{ℓ^ν}^{⊗ i}`
(a real definition; meaningful for `ℓ` invertible in `L` and `i ≠ 0`). -/
def wInvariantPrimary (ℓ : ℕ) (i : ℤ) : ℕ :=
  ℓ ^ sSup {ν : ℕ | TwistTrivial L i (ℓ ^ ν)}

end TauCeti.KTheoryFiniteLocal

/-! ## `KTheoryFiniteLocalFields:L.1` — the K-theory of finite fields

Conventions (pinned for L.1 and L.2): `K(R)` is the connective algebraic K-theory spectrum;
`K_n(R; ℤ/m) = π_n(K(R)/m)`, the homotopy of the cofibre of multiplication by `m`, equivalently
of `K(R) ∧ P^∞(ℤ/m)` with `P^∞(ℤ/m)` the mod-`m` Moore spectrum (`L.1/k-theory-mod-m`); and
`K_n(R; ℤ_ℓ) = π_n(holim_ν K(R)/ℓ^ν)`, the homotopy of the `ℓ`-completion
(`L.1/completed-k-theory`). Neither pinned library has the K-theory spectrum, the Moore spectrum,
`BU`, the plus construction or `FΨ^q`, so every statement about them is a comment naming its
supplier. What is stated in Lean is the representation theory (Brauer characters as honest
functions `G → ℂ`, Brauer lifting into Tau Ceti's representation ring), the arithmetic of finite
fields and cyclic groups, and `K₂` through the prelude's Milnor and Steinberg models. -/

/-! ### `KTheoryFiniteLocalFields:L.1/k-theory-mod-m` -/

namespace TauCeti.KTheory

-- TauCeti.KTheory.coeff: not stated here; needs the connective K-theory spectrum K(R) and the
--   mod-m cofibre E ↦ E/m of spectra (supplier: GeneralAlgebraicKTheory K.1 and K.2:plus;
--   StableHomotopyKTheory H.6/mod-l-homotopy-and-bockstein-sequence)
-- TauCeti.KTheory.coeffGroup: not stated here; needs π_n of the spectrum K(R)/m (supplier:
--   StableHomotopyKTheory H.6, GeneralAlgebraicKTheory K.1)
-- TauCeti.KTheory.coeffGroup_neg: not stated here; needs K_n(R; ℤ/m) (supplier:
--   StableHomotopyKTheory H.6)
-- TauCeti.KTheory.coeffGroup_zero: not stated here; needs K_0(R; ℤ/m) as π_0(K(R)/m) (supplier:
--   StableHomotopyKTheory H.6); the target K_0(R)/m is Tau Ceti's SplitK0 modulo m
-- TauCeti.KTheory.reduce: not stated here; needs K_n(R) for n ≥ 1 and K_n(R; ℤ/m) (supplier:
--   GeneralAlgebraicKTheory K.1, StableHomotopyKTheory H.6)
-- TauCeti.KTheory.bockstein: not stated here; needs the Bockstein of the cofibre sequence
--   K(R) → K(R) → K(R)/m (supplier: StableHomotopyKTheory H.6)
-- TauCeti.KTheory.coeff_exact: not stated here; needs the Bockstein sequence
--   0 → K_n(R)/m → K_n(R; ℤ/m) → mK_{n-1}(R) → 0 (supplier: StableHomotopyKTheory H.6)
-- TauCeti.KTheory.coeff_map_comp: not stated here; needs the functor R ↦ K(R)/m (supplier:
--   GeneralAlgebraicKTheory K.1, StableHomotopyKTheory H.6)
-- TauCeti.KTheory.coeffTransfer: not stated here; needs the transfer of K-theory spectra along
--   finite projective ring maps (supplier: GeneralAlgebraicKTheory K.3/resolution-theorem)
-- TauCeti.KTheory.coeff_colim: not stated here; needs K(R)/m and filtered colimits of spectra
--   (supplier: GeneralAlgebraicKTheory K.1/K-groups-of-exact-categories)
-- TauCeti.KTheory.coeff_change: not stated here; needs the maps of Moore spectra
--   P^∞(ℤ/m) ⇄ P^∞(ℤ/m′) (supplier: StableHomotopyKTheory H.6)
-- TauCeti.KTheory.coeff_coprime: not stated here; needs K_n(R; ℤ/m) (supplier:
--   StableHomotopyKTheory H.6); the coefficient side is Mathlib's ZMod.chineseRemainder
-- TauCeti.KTheory.coeff_module: not stated here; needs the pairing K(R) ∧ K(R)/m → K(R)/m
--   (supplier: GeneralAlgebraicKTheory K.7, StableHomotopyKTheory H.6)

-- test TauCeti.KTheory.coeffGroup_one_field (computation)
/- `K_1(𝔽₅; ℤ/4)` itself is not stated here; it needs K-theory with coefficients (supplier:
StableHomotopyKTheory H.6). Stated: the arithmetic value it is computed by,
`𝔽₅ˣ / (𝔽₅ˣ)⁴ ≅ ℤ/4`. -/
example : Nonempty ((ZMod 5)ˣ ⧸ (powMonoidHom 4 : (ZMod 5)ˣ →* (ZMod 5)ˣ).range ≃*
    Multiplicative (ZMod 4)) := by
  sorry

-- test TauCeti.KTheory.coeffGroup_one_modulus (degenerate): not stated here; needs the spectrum
--   K(R)/1 and its contractibility (supplier: StableHomotopyKTheory H.6)

-- test TauCeti.KTheory.coeffGroup_zero_field (compatibility)
/- The identification with `K_0(F; ℤ/m)` needs `π_0(K(F)/m)` (supplier: StableHomotopyKTheory
H.6). Stated: `SplitK0(FGModuleCat F)/m ≅ ℤ/m`, compatibly with Tau Ceti's
`TauCeti.SplitK0.finrankEquiv`. -/
example (F : Type) [Field F] (m : ℕ) :
    ∃ e : (TauCeti.SplitK0 (FGModuleCat F) ⧸
        (zsmulAddGroupHom (m : ℤ) : TauCeti.SplitK0 (FGModuleCat F) →+ _).range) ≃+ ZMod m,
      ∀ x : TauCeti.SplitK0 (FGModuleCat F),
        e (QuotientAddGroup.mk x) = (TauCeti.SplitK0.finrankEquiv F x : ZMod m) := by
  sorry

-- test TauCeti.KTheory.coeff_not_tensor (non-example)
/- `K_2(𝔽₃; ℤ/2)` is not stated here (needs K-theory with coefficients, supplier:
StableHomotopyKTheory H.6). Stated: its two inputs, `₂K_1(𝔽₃) = μ₂(𝔽₃)` of order `2`, and
`K_2(𝔽₃) = 0` in Matsumoto's model, so `K_2(𝔽₃) ⊗ ℤ/2 = 0`. -/
example : Nat.card (rootsOfUnity 2 (ZMod 3)) = 2 ∧
    ∀ x : TauCeti.MilnorK.milnorK (ZMod 3) 2, x = 0 := by
  sorry

-- test TauCeti.KTheory.coeff_integers_two (non-example): not stated here; needs K_2(ℤ; ℤ/2)
--   (supplier: StableHomotopyKTheory H.6, GeneralAlgebraicKTheory K.1)

end TauCeti.KTheory

/-! ### `KTheoryFiniteLocalFields:L.1/mod-m-products` -/

/- `KTheoryFiniteLocalFields:L.1/mod-m-products` (`TauCeti.KTheoryFiniteLocal.mod_m_products`):
not stated here; needs the homotopy associative and commutative ring spectrum K(R)/ℓ^ν and the
Araki–Toda products on the Moore spectrum (supplier: StableHomotopyKTheory H.6,
GeneralAlgebraicKTheory K.7). -/

/-! ### `KTheoryFiniteLocalFields:L.1/bott-element` -/

namespace TauCeti.KTheory

-- TauCeti.KTheory.bott: not stated here; needs K_2(R; ℤ/m) and the map P²(ℤ/m) → BGL(R)⁺
--   (supplier: StableHomotopyKTheory H.6, GeneralAlgebraicKTheory K.2:plus)
-- TauCeti.KTheory.bockstein_bott: not stated here; needs the Bockstein K_2(R; ℤ/m) → K_1(R)
--   (supplier: StableHomotopyKTheory H.6, GeneralAlgebraicKTheory K.1)
-- TauCeti.KTheory.map_bott: not stated here; needs the functoriality of K_2(−; ℤ/m) (supplier:
--   StableHomotopyKTheory H.6)
-- TauCeti.KTheory.bott_pow_change: not stated here; needs the reduction
--   K_2(R; ℤ/m′) → K_2(R; ℤ/m) (supplier: StableHomotopyKTheory H.6)
-- TauCeti.KTheory.bott_eq_of_split: not stated here; needs the universal coefficient sequence
--   of K-theory with coefficients (supplier: StableHomotopyKTheory H.6)
-- TauCeti.KTheory.bott_mul: not stated here; needs the group K_2(R; ℤ/m) (supplier:
--   StableHomotopyKTheory H.6)

-- test TauCeti.KTheory.bott_integers_two_order (non-example): not stated here; needs
--   K_2(ℤ; ℤ/2) ≅ ℤ/4 (supplier: StableHomotopyKTheory H.6, GeneralAlgebraicKTheory K.1)

-- test TauCeti.KTheory.bott_finiteField_generates (computation)
/- The Bott element is not stated here (needs `K_2(𝔽₅; ℤ/4)`, supplier: StableHomotopyKTheory
H.6). Stated: its Bockstein `[2]` generates `₄K_1(𝔽₅) = 𝔽₅ˣ`, i.e. `2` has order `4`. -/
example : orderOf (ZMod.unitOfCoprime 2 (by norm_num : Nat.Coprime 2 5)) = 4 := by
  sorry

-- test TauCeti.KTheory.bockstein_bott_units (compatibility): not stated here; needs the
--   Bockstein on K_2(R; ℤ/m) and K_1(R) → Rˣ (supplier: StableHomotopyKTheory H.6,
--   KTheoryLowDegrees U.3)

-- test TauCeti.KTheory.bott_trivial_modulus (degenerate)
/- The Bott elements are not stated here (supplier: StableHomotopyKTheory H.6). Stated: the
arithmetic of the degenerate case — a field of characteristic `2` has no unit of order `2`,
while `-1` has order `2` in `𝔽₃ˣ`. -/
example : (∀ (F : Type) [Field F] [CharP F 2] (x : Fˣ), orderOf x ≠ 2) ∧
    orderOf (-1 : (ZMod 3)ˣ) = 2 := by
  sorry

end TauCeti.KTheory

/-! ### `KTheoryFiniteLocalFields:L.1/brauer-character`

The Brauer character is an honest function `G → ℂ`: the eigenvalues of `g` on `V ⊗_k Ω` are the
roots (with multiplicity) of the characteristic polynomial of `V.ρ g` in an algebraically closed
field `Ω` of characteristic `p` containing `k` (for the packet `Ω = \bar 𝔽_p`), and they are
lifted to `ℂ` along the fixed injective `ι : Ωˣ →* ℂˣ`. -/

namespace TauCeti.Brauer

open CategoryTheory MonoidalCategory

section Character

variable {k : Type} [Field k] [Finite k] {Ω : Type} [Field Ω] [IsAlgClosed Ω] [Algebra k Ω]
  (ι : Ωˣ →* ℂˣ) {G : Type} [Group G] [Finite G]

/-- The eigenvalues of `g` on `V ⊗_k Ω`, with multiplicity, lifted to `ℂ` along `ι` (a real
definition: the roots of the characteristic polynomial of `V.ρ g` in `Ω`, all nonzero since
`V.ρ g` is invertible, the `0` branch being unreachable). -/
def liftedEigenvalues (V : FDRep k G) (g : G) : Multiset ℂ :=
  open Classical in
  (((LinearMap.charpoly (V.ρ g)).map (algebraMap k Ω)).roots).map
    fun a => if h : a = 0 then 0 else ((ι (Units.mk0 a h) : ℂˣ) : ℂ)

/-- **The Brauer character** (`KTheoryFiniteLocalFields:L.1/brauer-character`):
`χ_V(g) = Σ_λ μ(λ) ι(λ)`, the sum of the lifted eigenvalues of `g` on `V ⊗_k Ω` counted with
multiplicity. It depends on the fixed `ι`; the eigenvalues live in `Ω`, not in `k`. -/
def character (V : FDRep k G) (g : G) : ℂ :=
  (liftedEigenvalues ι V g).sum

variable {ι}

@[simp]
theorem character_one (V : FDRep k G) : character ι V 1 = Module.finrank k V := by
  sorry

@[simp]
theorem character_conj (V : FDRep k G) (g h : G) :
    character ι V (h * g * h⁻¹) = character ι V g := by
  sorry

/-- Additivity on short exact sequences `0 → V′ → V → V″ → 0` of representations. -/
theorem character_add {S : ShortComplex (FDRep k G)} (hS : S.ShortExact) :
    character ι S.X₂ = character ι S.X₁ + character ι S.X₃ := by
  sorry

theorem character_tensor (V W : FDRep k G) :
    character ι (V ⊗ W) = character ι V * character ι W := by
  sorry

/-- The Frobenius twist: if `e : V → W` is an additive bijection, semilinear for the Frobenius
`c ↦ c^p` of `k`, and `G`-equivariant, then `W ≅ Φ^*V` and `χ_W(g) = χ_V(g^p)`. -/
theorem character_pow (V W : FDRep k G) (e : V ≃+ W)
    (he : ∀ (c : k) (v : V), e (c • v) = c ^ ringChar k • e v)
    (hρ : ∀ (g : G) (v : V), e (V.ρ g v) = W.ρ g (e v)) (g : G) :
    character ι W g = character ι V (g ^ ringChar k) := by
  sorry

/-- `χ_V(g) = χ_V(g_{p′})`: for a decomposition `g = s * u` into commuting parts with `u` of
`p`-power order and `s` of order prime to `p`, `χ_V(g) = χ_V(s)`. -/
theorem character_pPart (V : FDRep k G) (g s u : G) (hsu : Commute s u) (hg : g = s * u)
    (hu : ∃ a : ℕ, orderOf u = ringChar k ^ a) (hs : (orderOf s).Coprime (ringChar k)) :
    character ι V g = character ι V s := by
  sorry

theorem character_restrict {H : Type} [Group H] [Finite H] (f : H →* G) (V : FDRep k G) :
    character ι ((Action.res (FGModuleCat k) f).obj V) = character ι V ∘ f := by
  sorry

/-- Extension of scalars `k ⊂ k′` (compatibly inside `Ω`) does not change the eigenvalues:
`χ_{k′ ⊗ V} = χ_V` (Tau Ceti's `Representation.baseChange`). -/
theorem character_baseChange {k' : Type} [Field k'] [Finite k'] [Algebra k k'] [Algebra k' Ω]
    [IsScalarTower k k' Ω] (V : FDRep k G) :
    character ι (FDRep.of (Representation.baseChange k' V.ρ)) = character ι V := by
  sorry

/-- Changing `ι` into `ι ∘ (x ↦ x^u)` replaces `χ_V(g)` by `χ_V(g^u)`. -/
theorem character_change_embedding (u : ℕ) (V : FDRep k G) (g : G) :
    character (ι.comp (powMonoidHom u)) V g = character ι V (g ^ u) := by
  sorry

end Character

section Examples

/-- The representation of `kˣ` on `k` by multiplication (test notation). -/
abbrev unitsRep (k : Type) [Field k] [Finite k] : FDRep k kˣ :=
  FDRep.of ((Algebra.lsmul k k k : k →ₐ[k] Module.End k k).toMonoidHom.comp (Units.coeHom k))

/-- The natural representation of `GL_n(k)` on `kⁿ` (a real definition). -/
abbrev stdRep (k : Type) [Field k] [Finite k] (n : ℕ) : FDRep k (GL (Fin n) k) :=
  FDRep.of ((Units.coeHom _).comp Matrix.GeneralLinearGroup.toLin.toMonoidHom)

-- test TauCeti.Brauer.character_units (computation)
example {k : Type} [Field k] [Finite k] {Ω : Type} [Field Ω] [IsAlgClosed Ω] [Algebra k Ω]
    (ι : Ωˣ →* ℂˣ) (z : kˣ) :
    character ι (unitsRep k) z = ((ι (Units.map (algebraMap k Ω).toMonoidHom z) : ℂˣ) : ℂ) := by
  sorry

-- test TauCeti.Brauer.character_GL2_F3 (computation)
/- `|GL_2(𝔽₃)| = 48`; on `u = (1 1; 0 1)` and on `-1` the Brauer character of `𝔽₃²` takes
the values `2` and `-2`, and `(1/48) Σ_g |χ(g)|² = 2`. -/
example (ι : (AlgebraicClosure (ZMod 3))ˣ →* ℂˣ) (hι : Function.Injective ι) :
    Nat.card (GL (Fin 2) (ZMod 3)) = 48 ∧
      (∀ u : GL (Fin 2) (ZMod 3), (u : Matrix (Fin 2) (Fin 2) (ZMod 3)) = !![1, 1; 0, 1] →
        character ι (stdRep (ZMod 3) 2) u = 2) ∧
      character ι (stdRep (ZMod 3) 2) (-1) = -2 ∧
      (∑ g : GL (Fin 2) (ZMod 3), Complex.normSq (character ι (stdRep (ZMod 3) 2) g)) / 48 =
        2 := by
  sorry

-- test TauCeti.Brauer.character_trivialGroup (degenerate)
example {k : Type} [Field k] [Finite k] {Ω : Type} [Field Ω] [IsAlgClosed Ω] [Algebra k Ω]
    (ι : Ωˣ →* ℂˣ) {G : Type} [Group G] [Finite G] [Subsingleton G] (V : FDRep k G) :
    character ι V = fun _ => (Module.finrank k V : ℂ) := by
  sorry

-- test TauCeti.Brauer.character_not_reduction (non-example)
/- For `G = ℤ/p` a nontrivial one-dimensional complex character `χ_W` reduces modulo `p` to the
trivial representation, whose Brauer character is `1 ≠ χ_W`. (The reduction of a lattice is not
stated; the two characters are.) -/
example (p : ℕ) [Fact p.Prime] (ι : (AlgebraicClosure (ZMod p))ˣ →* ℂˣ)
    (W : FDRep ℂ (Multiplicative (ZMod p))) (hW : Module.finrank ℂ W = 1) (hχ : W.character ≠ 1) :
    character ι (FDRep.of (Representation.trivial (ZMod p) (Multiplicative (ZMod p)) (ZMod p))) =
        1 ∧
      character ι (FDRep.of (Representation.trivial (ZMod p) (Multiplicative (ZMod p)) (ZMod p))) ≠
        W.character := by
  sorry

end Examples

end TauCeti.Brauer

/-! ### `KTheoryFiniteLocalFields:L.1/green-virtual-character` -/

namespace TauCeti.KTheoryFiniteLocal

open TauCeti.Brauer

/-- **Green's theorem** (`KTheoryFiniteLocalFields:L.1/green-virtual-character`): for an
`n`-dimensional representation `V`, a symmetric `S ∈ ℤ[t₁, …, tₙ]` and any enumeration `e g` of
the lifted eigenvalues of `g`, the class function `g ↦ S(e g)` is a virtual character, an element
of Tau Ceti's `virtualCharacters ℂ G` (the image of `R_ℂ(G)`). For `S = t₁ + ⋯ + tₙ` it is the
Brauer character `χ_V`. -/
theorem green_virtual_character {k : Type} [Field k] [Finite k] {Ω : Type} [Field Ω]
    [IsAlgClosed Ω] [Algebra k Ω] {ι : Ωˣ →* ℂˣ} (hι : Function.Injective ι) {G : Type}
    [Group G] [Finite G] (V : FDRep k G) {n : ℕ} (hn : Module.finrank k V = n)
    (S : MvPolynomial (Fin n) ℤ) (hS : S.IsSymmetric) (e : G → Fin n → ℂ)
    (he : ∀ g, Finset.univ.val.map (e g) = liftedEigenvalues ι V g) :
    (fun g => MvPolynomial.aeval (e g) S) ∈ TauCeti.virtualCharacters ℂ G := by
  sorry

end TauCeti.KTheoryFiniteLocal

/-! ### `KTheoryFiniteLocalFields:L.1/brauer-lift`

`R_{𝔽_q}(G)` is Tau Ceti's abelian `K₀` of `FDRep k G` (relations from all short exact
sequences, `TauCeti.AbelianK0`), and `R_ℂ(G)` is Tau Ceti's representation ring
`TauCeti.repRing ℂ G`, identified with the virtual characters by `TauCeti.repRingCharacter`.
`TauCeti.AbelianK0` carries no ring structure at the pinned commit (only `SplitK0` does), so the
lift is stated as an additive map; its multiplicativity is `character_tensor` read through
`character_lift`. -/

namespace TauCeti.Brauer

open CategoryTheory

section Lift

variable {k : Type} [Field k] [Finite k] {Ω : Type} [Field Ω] [IsAlgClosed Ω] [Algebra k Ω]
  (ι : Ωˣ →* ℂˣ) (hι : Function.Injective ι) {G : Type} [Group G] [Finite G]

/-- **Brauer lifting** (`KTheoryFiniteLocalFields:L.1/brauer-lift`):
`β_G : R_{𝔽_q}(G) → R_ℂ(G)`, `[V] ↦` the virtual representation with character `χ_V`
(well defined by `TauCeti.KTheoryFiniteLocal.green_virtual_character` and `character_add`). -/
def lift (ι : Ωˣ →* ℂˣ) (_hι : Function.Injective ι) :
    TauCeti.AbelianK0.{0} (FDRep k G) →+ TauCeti.repRing ℂ G :=
  sorry

@[simp]
theorem character_lift (V : FDRep k G) :
    TauCeti.repRingCharacter ℂ G (lift ι hι (TauCeti.AbelianK0.of V)) = character ι V := by
  sorry

@[simp]
theorem lift_one :
    lift ι hι (TauCeti.AbelianK0.of (FDRep.of (Representation.trivial k G k))) = 1 := by
  sorry

/-- Augmentation: the virtual dimension of `β_G[V]` (its character at `1`) is `dim V`. -/
theorem lift_dim (V : FDRep k G) :
    TauCeti.repRingCharacter ℂ G (lift ι hι (TauCeti.AbelianK0.of V)) 1 =
      Module.finrank k V := by
  sorry

/-- Naturality for restriction along `f : H →* G`, read on characters. -/
theorem lift_restrict {H : Type} [Group H] [Finite H] (f : H →* G) (V : FDRep k G) :
    TauCeti.repRingCharacter ℂ H
        (lift ι hι (TauCeti.AbelianK0.of ((Action.res (FGModuleCat k) f).obj V))) =
      TauCeti.repRingCharacter ℂ G (lift ι hι (TauCeti.AbelianK0.of V)) ∘ f := by
  sorry

theorem lift_baseChange {k' : Type} [Field k'] [Finite k'] [Algebra k k'] [Algebra k' Ω]
    [IsScalarTower k k' Ω] (V : FDRep k G) :
    lift ι hι (TauCeti.AbelianK0.of (FDRep.of (Representation.baseChange k' V.ρ))) =
      lift ι hι (TauCeti.AbelianK0.of V) := by
  sorry

-- TauCeti.Brauer.lift_psi: not stated here; needs the λ-ring structures (λ^k, ψ^k) on
--   R_{𝔽_q}(G) and R_ℂ(G) (supplier: SchemeKTheoryOperations S.6 in the K-book Ex. II.4.2 form;
--   no λ-operations on TauCeti.AbelianK0 or TauCeti.repRing at the pinned commit)

/-- `ψ^q ∘ β_G = β_G` (`L.1/brauer-lift-frobenius-invariant`), read on characters:
`(ψ^q χ)(g) = χ(g^q)`, with `q = #k`. -/
theorem lift_psi_q (x : TauCeti.AbelianK0.{0} (FDRep k G)) (g : G) :
    TauCeti.repRingCharacter ℂ G (lift ι hι x) (g ^ Nat.card k) =
      TauCeti.repRingCharacter ℂ G (lift ι hι x) g := by
  sorry

end Lift

/-- The standard embedding `i_n : GL_n(k) → GL_{n+1}(k)`, `g ↦ diag(g, 1)` (the map is a real
definition; the unit and homomorphism axioms are proofs). -/
def glIncl (k : Type) [Field k] (n : ℕ) : GL (Fin n) k →* GL (Fin (n + 1)) k where
  toFun g :=
    ⟨Matrix.reindex finSumFinEquiv finSumFinEquiv
        (Matrix.fromBlocks (g : Matrix (Fin n) (Fin n) k) 0 0 1),
      Matrix.reindex finSumFinEquiv finSumFinEquiv
        (Matrix.fromBlocks ((g⁻¹ : GL (Fin n) k) : Matrix (Fin n) (Fin n) k) 0 0 1),
      sorry, sorry⟩
  map_one' := sorry
  map_mul' := sorry

/-- `i_n^* β(id_{n+1}) = β(id_n) + 1` in `R_ℂ(GL_n(𝔽_q))` (`L.1/brauer-lift-stabilisation`). -/
theorem lift_stabilise {k : Type} [Field k] [Finite k] {Ω : Type} [Field Ω] [IsAlgClosed Ω]
    [Algebra k Ω] (ι : Ωˣ →* ℂˣ) (hι : Function.Injective ι) (n : ℕ) :
    lift ι hι (TauCeti.AbelianK0.of
        ((Action.res (FGModuleCat k) (glIncl k n)).obj (stdRep k (n + 1)))) =
      lift ι hι (TauCeti.AbelianK0.of (stdRep k n)) + 1 := by
  sorry

/-- The representation of `Kˣ` on `K` by multiplication, `K` viewed as a `k`-vector space
(test notation; `K = 𝔽_{q^r}` in the packet). -/
abbrev unitsRestrictRep (k K : Type) [Field k] [Finite k] [Field K] [Algebra k K]
    [Module.Finite k K] : FDRep k Kˣ :=
  FDRep.of ((Algebra.lsmul k k K : K →ₐ[k] Module.End k K).toMonoidHom.comp (Units.coeHom K))

-- test TauCeti.Brauer.lift_units (computation)
example {k : Type} [Field k] [Finite k] {Ω : Type} [Field Ω] [IsAlgClosed Ω] [Algebra k Ω]
    (ι : Ωˣ →* ℂˣ) (hι : Function.Injective ι) :
    TauCeti.repRingCharacter ℂ kˣ (lift ι hι (TauCeti.AbelianK0.of (unitsRep k))) =
      fun z => ((ι (Units.map (algebraMap k Ω).toMonoidHom z) : ℂˣ) : ℂ) := by
  sorry

-- test TauCeti.Brauer.lift_GL2_F3_virtual (non-example)
/- `β` of the natural representation of `GL_2(𝔽₃)` has norm `⟨χ, χ⟩ = 2` and no linear
constituent, so it is not the class of a representation. -/
example (ι : (AlgebraicClosure (ZMod 3))ˣ →* ℂˣ) (hι : Function.Injective ι) :
    (∑ g : GL (Fin 2) (ZMod 3), Complex.normSq (character ι (stdRep (ZMod 3) 2) g)) / 48 = 2 ∧
      (∀ W : FDRep ℂ (GL (Fin 2) (ZMod 3)), Module.finrank ℂ W = 1 →
        ∑ g : GL (Fin 2) (ZMod 3),
          character ι (stdRep (ZMod 3) 2) g * starRingEnd ℂ (W.character g) = 0) ∧
      ¬ ∃ W : FDRep ℂ (GL (Fin 2) (ZMod 3)),
        lift ι hι (TauCeti.AbelianK0.of (stdRep (ZMod 3) 2)) = TauCeti.SplitK0.of W := by
  sorry

-- test TauCeti.Brauer.lift_trivialGroup (degenerate)
example {k : Type} [Field k] [Finite k] {Ω : Type} [Field Ω] [IsAlgClosed Ω] [Algebra k Ω]
    (ι : Ωˣ →* ℂˣ) (hι : Function.Injective ι) {G : Type} [Group G] [Finite G]
    [Subsingleton G] (V : FDRep k G) :
    TauCeti.repRingCharacter ℂ G (lift ι hι (TauCeti.AbelianK0.of V)) =
      fun _ => (Module.finrank k V : ℂ) := by
  sorry

-- test TauCeti.Brauer.lift_pGroup (computation)
example {k : Type} [Field k] [Finite k] {Ω : Type} [Field Ω] [IsAlgClosed Ω] [Algebra k Ω]
    (ι : Ωˣ →* ℂˣ) (hι : Function.Injective ι) {G : Type} [Group G] [Finite G]
    (hG : IsPGroup (ringChar k) G) (V : FDRep k G) :
    lift ι hι (TauCeti.AbelianK0.of V) = (Module.finrank k V : TauCeti.repRing ℂ G) := by
  sorry

-- test TauCeti.Brauer.lift_cyclic (compatibility)
/- For `C = 𝔽_{q^r}ˣ` acting on `𝔽_{q^r}` over `𝔽_q`: `β = Σ_{i<r} ι^{q^i}`, read on
characters (`L.1/brauer-lift-cyclic`). -/
example {k : Type} [Field k] [Finite k] {K : Type} [Field K] [Algebra k K] [Module.Finite k K]
    {Ω : Type} [Field Ω] [IsAlgClosed Ω] [Algebra k Ω] [Algebra K Ω] [IsScalarTower k K Ω]
    (ι : Ωˣ →* ℂˣ) (hι : Function.Injective ι) :
    TauCeti.repRingCharacter ℂ Kˣ (lift ι hι (TauCeti.AbelianK0.of (unitsRestrictRep k K))) =
      fun z => ∑ i ∈ Finset.range (Module.finrank k K),
        ((ι (Units.map (algebraMap K Ω).toMonoidHom z ^ (Nat.card k ^ i)) : ℂˣ) : ℂ) := by
  sorry

end TauCeti.Brauer

/-! ### `KTheoryFiniteLocalFields:L.1/brauer-lift-frobenius-invariant` -/

namespace TauCeti.KTheoryFiniteLocal

open TauCeti.Brauer

/-- `KTheoryFiniteLocalFields:L.1/brauer-lift-frobenius-invariant`: for `V` defined over
`k = 𝔽_q`, `χ_V(g^q) = χ_V(g)`, so Brauer lifting lands in `R_ℂ(G)^{ψ^q}`. -/
theorem brauer_lift_frobenius_invariant {k : Type} [Field k] [Finite k] {Ω : Type} [Field Ω]
    [IsAlgClosed Ω] [Algebra k Ω] (ι : Ωˣ →* ℂˣ) {G : Type} [Group G] [Finite G]
    (V : FDRep k G) (g : G) : character ι V (g ^ Nat.card k) = character ι V g := by
  sorry

/- `KTheoryFiniteLocalFields:L.1/brauer-lift-lambda-ring` (`brauer_lift_lambda_ring`): not
stated here; needs the λ-ring structures on R_{𝔽_q}(G) and R_ℂ(G) and on homotopy classes into
BU (supplier: SchemeKTheoryOperations S.6; RefinedTraceMethods RT.4:topological (b)). -/

/-- `KTheoryFiniteLocalFields:L.1/brauer-lift-stabilisation`: `i_n^* id_{n+1} ≅ id_n ⊕ 1`,
hence `i_n^* β(id_{n+1}) = β(id_n) + 1` (the Brauer-lift form is `TauCeti.Brauer.lift_stabilise`);
stated here on representations and on Brauer characters. -/
theorem brauer_lift_stabilisation {k : Type} [Field k] [Finite k] {Ω : Type} [Field Ω]
    [IsAlgClosed Ω] [Algebra k Ω] (ι : Ωˣ →* ℂˣ) (n : ℕ) :
    Nonempty ((Action.res (FGModuleCat k) (glIncl k n)).obj (stdRep k (n + 1)) ≅
        CategoryTheory.Limits.biprod (stdRep k n)
          (FDRep.of (Representation.trivial k (GL (Fin n) k) k))) ∧
      character ι ((Action.res (FGModuleCat k) (glIncl k n)).obj (stdRep k (n + 1))) =
        character ι (stdRep k n) + 1 := by
  sorry

/-- `KTheoryFiniteLocalFields:L.1/brauer-lift-cyclic`: for `K = 𝔽_{q^r}` and `C = Kˣ` acting
on `K` as an `r`-dimensional `𝔽_q`-space, the eigenvalues of `z` are `z, z^q, …, z^{q^{r-1}}`,
so `χ_L(z) = Σ_{i<r} ι(z^{q^i})`. -/
theorem brauer_lift_cyclic {k : Type} [Field k] [Finite k] {K : Type} [Field K] [Algebra k K]
    [Module.Finite k K] {Ω : Type} [Field Ω] [IsAlgClosed Ω] [Algebra k Ω] [Algebra K Ω]
    [IsScalarTower k K Ω] (ι : Ωˣ →* ℂˣ) (z : Kˣ) :
    character ι (unitsRestrictRep k K) z = ∑ i ∈ Finset.range (Module.finrank k K),
      ((ι (Units.map (algebraMap K Ω).toMonoidHom z ^ (Nat.card k ^ i)) : ℂˣ) : ℂ) := by
  sorry

end TauCeti.KTheoryFiniteLocal

/-! ### `KTheoryFiniteLocalFields:L.1/fpsi` — `FΨ^q`, and the nodes about it

`BU`, its Adams operations and homotopy pullbacks of spaces are not in either pinned library
(requested from RefinedTraceMethods RT.4:topological), so this definition, its API and its tests
are comments. -/

namespace TauCeti.KU

-- TauCeti.KU.FPsi: not stated here; needs the space BU with an H-map ψ^q representing the
--   Adams operation, and homotopy pullbacks of spaces (supplier: RefinedTraceMethods
--   RT.4:topological, request items (a) and (b))
-- TauCeti.KU.FPsi.proj: not stated here; needs FΨ^q and BU (supplier: RefinedTraceMethods
--   RT.4:topological)
-- TauCeti.KU.FPsi.hofibEquiv: not stated here; needs homotopy fibres of H-maps BU → BU
--   (supplier: RefinedTraceMethods RT.4:topological)
-- TauCeti.KU.FPsi.hspace: not stated here; needs H-space structures on spaces (supplier:
--   RefinedTraceMethods RT.4:topological)
-- TauCeti.KU.FPsi.lift: not stated here; needs homotopy classes [X, BU] and [X, FΨ^q]
--   (supplier: RefinedTraceMethods RT.4:topological)
-- TauCeti.KU.FPsi.adams: not stated here; needs ψ^k on BU commuting with ψ^q up to homotopy
--   (supplier: RefinedTraceMethods RT.4:topological)
-- TauCeti.KU.FPsi.boundary: not stated here; needs the homotopy groups of BU and of FΨ^q
--   (supplier: RefinedTraceMethods RT.4:topological)

-- test TauCeti.KU.FPsi.pi_one (computation): not stated here; needs π_1(FΨ^q) (supplier:
--   RefinedTraceMethods RT.4:topological)
-- test TauCeti.KU.FPsi.pi_three (computation): not stated here; needs π_3(FΨ^q) (supplier:
--   RefinedTraceMethods RT.4:topological)
-- test TauCeti.KU.FPsi.pi_even (degenerate): not stated here; needs π_{2i}(FΨ^q) (supplier:
--   RefinedTraceMethods RT.4:topological)
-- test TauCeti.KU.FPsi.not_fixed_points (non-example): not stated here; needs FΨ^q and a
--   point-set model of ψ^q (supplier: RefinedTraceMethods RT.4:topological)
-- test TauCeti.KU.FPsi.adams_pi (characterisation): not stated here; needs ψ̃^k on π_*(FΨ^q)
--   (supplier: RefinedTraceMethods RT.4:topological)

end TauCeti.KU

/- `KTheoryFiniteLocalFields:L.1/fpsi-homotopy` (`TauCeti.KTheoryFiniteLocal.fpsi_homotopy`):
not stated here; needs the homotopy groups of FΨ^q and BU (supplier: RefinedTraceMethods
RT.4:topological). -/

/- `KTheoryFiniteLocalFields:L.1/fpsi-lifting` (`TauCeti.KTheoryFiniteLocal.fpsi_lifting`): not
stated here; needs homotopy classes of maps into BU and FΨ^q and K̃U^{-1}(BG) = 0 (supplier:
RefinedTraceMethods RT.4:topological, request item (d)). -/

/-! ### `KTheoryFiniteLocalFields:L.1/quillen-map` -/

namespace TauCeti.KTheory.FiniteField

-- TauCeti.KTheory.FiniteField.quillenMap: not stated here; needs BGL(𝔽_q), FΨ^q and the
--   Atiyah map (supplier: RefinedTraceMethods RT.4:topological, GeneralAlgebraicKTheory
--   K.2:plus)
-- TauCeti.KTheory.FiniteField.quillenMap_restrict: not stated here; needs quillenMap and the
--   Atiyah class of β(id_n) − n in [BGL_n(𝔽_q), BU] (supplier: RefinedTraceMethods
--   RT.4:topological); its representation-theoretic input is TauCeti.Brauer.lift_stabilise
-- TauCeti.KTheory.FiniteField.quillenMapPlus: not stated here; needs the plus construction
--   BGL(𝔽_q)⁺ (supplier: GeneralAlgebraicKTheory K.2:plus)
-- TauCeti.KTheory.FiniteField.brauerLiftMap: not stated here; needs BGL(𝔽_q)⁺ → BU and
--   K_n(𝔽_q) (supplier: GeneralAlgebraicKTheory K.2:plus, RefinedTraceMethods RT.4:topological)
-- TauCeti.KTheory.FiniteField.quillenMap_pi_one: not stated here; needs π_1 of BGL(𝔽_q)⁺ and of
--   FΨ^q (supplier: KTheoryLowDegrees U.6, RefinedTraceMethods RT.4:topological)
-- TauCeti.KTheory.FiniteField.quillenMap_change: not stated here; needs quillenMap and ψ̃^u
--   (supplier: RefinedTraceMethods RT.4:topological); the character side is
--   TauCeti.Brauer.character_change_embedding
-- TauCeti.KTheory.FiniteField.atiyahMap: not stated here; needs [BG, ℤ × BU] as a λ-ring
--   (supplier: RefinedTraceMethods RT.4:topological, request item (c))

-- test TauCeti.KTheory.FiniteField.quillenMap_pi_one_F2 (degenerate)
/- π_1(FΨ²) and θ⁺ are not stated here (supplier: RefinedTraceMethods RT.4:topological).
Stated: the arithmetic, `K_1(𝔽₂) = 𝔽₂ˣ = 1`. -/
example : Subsingleton (ZMod 2)ˣ := by
  sorry

-- test TauCeti.KTheory.FiniteField.quillenMap_pi_one_F5 (computation)
/- θ⁺ on π_1 is not stated here (supplier: RefinedTraceMethods RT.4:topological). Stated: the
arithmetic, `𝔽₅ˣ` is cyclic of order `4`, generated by the unit `2`. -/
example : Nat.card (ZMod 5)ˣ = 4 ∧
    Subgroup.zpowers (ZMod.unitOfCoprime 2 (by norm_num : Nat.Coprime 2 5)) = ⊤ := by
  sorry

-- test TauCeti.KTheory.FiniteField.brauerLiftMap_odd (compatibility): not stated here; needs
--   ρ_* : K_{2i-1}(𝔽_q) → π_{2i-1}(BU) = 0 (supplier: RefinedTraceMethods RT.4:topological,
--   GeneralAlgebraicKTheory K.2:plus)

-- test TauCeti.KTheory.FiniteField.quillenMap_not_rep (non-example)
/- `θ_2 = B(h)` is not stated here (needs BGL_2 and BU(2), supplier: RefinedTraceMethods
RT.4:topological). Stated: its representation-theoretic obstruction — no complex representation of
`GL_2(𝔽₃)` has the Brauer character of `𝔽₃²` as its character. -/
example (ι : (AlgebraicClosure (ZMod 3))ˣ →* ℂˣ) (hι : Function.Injective ι) :
    ¬ ∃ W : FDRep ℂ (GL (Fin 2) (ZMod 3)),
      W.character = TauCeti.Brauer.character ι (TauCeti.Brauer.stdRep (ZMod 3) 2) := by
  sorry

end TauCeti.KTheory.FiniteField

/- `KTheoryFiniteLocalFields:L.1/fpsi-cohomology` (`TauCeti.KTheoryFiniteLocal.fpsi_cohomology`):
not stated here; needs the singular cohomology H^*(FΨ^q; 𝔽_ℓ) and the Eilenberg–Moore spectral
sequence (supplier: RefinedTraceMethods RT.4:topological, StableHomotopyKTheory H.6). -/

/- `KTheoryFiniteLocalFields:L.1/fpsi-cohomology-ring`
(`TauCeti.KTheoryFiniteLocal.fpsi_cohomology_ring`): not stated here; needs the cohomology ring
H^*(FΨ^q; 𝔽_ℓ) with its Chern classes (supplier: RefinedTraceMethods RT.4:topological). -/

/-! ### `KTheoryFiniteLocalFields:L.1/gl-sylow-in-wreath` and the group-cohomology nodes -/

namespace TauCeti.KTheoryFiniteLocal

/-- `KTheoryFiniteLocalFields:L.1/gl-sylow-in-wreath`: for `ℓ` odd, `ℓ ∤ q`, `r` the order of
`q` modulo `ℓ` and `n = r m + j` with `j < r`, the `ℓ`-adic valuations of `|GL_n(𝔽_q)|` and of
`|Σ_m ⋉ C^m| = m! (q^r - 1)^m` agree, and `GL_n(𝔽_q)` has a subgroup of that order containing a
Sylow `ℓ`-subgroup. (The embedding of `Σ_m ⋉ C^m` itself is not constructed here.) -/
theorem gl_sylow_in_wreath {k : Type} [Field k] [Fintype k] (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 2)
    (hℓq : (Fintype.card k : ZMod ℓ) ≠ 0) (r m j n : ℕ)
    (hr : r = orderOf (Fintype.card k : ZMod ℓ)) (hj : j < r) (hn : n = r * m + j) :
    padicValNat ℓ (Nat.card (GL (Fin n) k)) =
        padicValNat ℓ (m.factorial * (Fintype.card k ^ r - 1) ^ m) ∧
      ∃ H : Subgroup (GL (Fin n) k), Nat.card H = m.factorial * (Fintype.card k ^ r - 1) ^ m ∧
        ∃ P : Sylow ℓ (GL (Fin n) k), (P : Subgroup (GL (Fin n) k)) ≤ H := by
  sorry

/- `KTheoryFiniteLocalFields:L.1/gl-cohomology-detection` (`gl_cohomology_detection`): not
stated here; needs the cup-product algebra structure on Mathlib's groupCohomology, the action of
Σ_m ⋉ π^m on H^*(C^m; 𝔽_ℓ) and the map θ_n^* from H^*(FΨ^q; 𝔽_ℓ) (supplier:
RefinedTraceMethods RT.4:topological for FΨ^q; no cohomology algebra of finite groups over 𝔽_ℓ at
the pinned commit). -/

/- `KTheoryFiniteLocalFields:L.1/gl-mod-p-acyclic` (`gl_mod_p_acyclic`): not stated here; needs
the infinite general linear group GL(𝔽_q) = colim GL_n(𝔽_q) with its group homology over 𝔽_p and ℚ
(supplier: GeneralAlgebraicKTheory K.2:plus, which owns BGL and its homology). -/

/- `KTheoryFiniteLocalFields:L.1/quillen-homology-iso` (`quillen_homology_iso`): not stated here;
needs H_*(BGL(𝔽_q); ℤ) and H_*(FΨ^q; ℤ) and the map θ (supplier: RefinedTraceMethods
RT.4:topological, GeneralAlgebraicKTheory K.2:plus). -/

/- `KTheoryFiniteLocalFields:L.1/quillen-fibration` (`quillen_fibration`): not stated here; needs
BGL(𝔽_q)⁺, FΨ^q and homotopy equivalences of spaces (supplier: GeneralAlgebraicKTheory K.2:plus,
RefinedTraceMethods RT.4:topological). -/

/- `KTheoryFiniteLocalFields:L.1/quillen-k-groups` (`quillen_k_groups`): not stated here; needs
the K-groups K_n(𝔽_q) for n ≥ 3 (supplier: GeneralAlgebraicKTheory K.1, K.2:plus). Its degree-one
and degree-two cases are `determinant_degree_one` (arithmetic side) and `degree_two_symbols`. -/

/- `KTheoryFiniteLocalFields:L.1/frobenius-is-adams` (`frobenius_is_adams`): not stated here;
needs the action of Frobenius on K_*(𝔽_q) and ψ̃^p on FΨ^q (supplier: GeneralAlgebraicKTheory K.1,
RefinedTraceMethods RT.4:topological). -/

/- `KTheoryFiniteLocalFields:L.1/adams-psi-p-frobenius` (`adams_psi_p_frobenius`): not stated
here; needs the Quillen–Hiller Adams operations on K_n(A) (supplier: SchemeKTheoryOperations
S.6). -/

/- `KTheoryFiniteLocalFields:L.1/adams-on-finite-field-k` (`adams_on_finite_field_k`): not stated
here; needs ψ^k on K_{2i-1}(𝔽_q) (supplier: SchemeKTheoryOperations S.6, RefinedTraceMethods
RT.4:topological). -/

/-- `KTheoryFiniteLocalFields:L.1/galois-tensor-splitting`: for `L/K` finite Galois with group
`G`, `x ⊗ y ↦ (x · g(y))_g` is an `L`-algebra isomorphism `L ⊗_K L ≅ ∏_{g ∈ G} L` (`L` acting
through the left factor); consequently, for an `L`-vector space `V`,
`x ⊗ v ↦ (g(x) · v)_g` is a `K`-linear isomorphism `L ⊗_K V ≅ ⊕_g g^*V`. -/
theorem galois_tensor_splitting {K L : Type} [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L] :
    (∃ e : L ⊗[K] L ≃ₐ[L] ((L ≃ₐ[K] L) → L), ∀ x y : L, e (x ⊗ₜ y) = fun g => x * g y) ∧
      ∀ (V : Type) [AddCommGroup V] [Module L V] [Module K V] [IsScalarTower K L V],
        ∃ e : L ⊗[K] V ≃ₗ[K] ((L ≃ₐ[K] L) → V),
          ∀ (x : L) (v : V), e (x ⊗ₜ v) = fun g => g x • v := by
  sorry

end TauCeti.KTheoryFiniteLocal

/-! ### `KTheoryFiniteLocalFields:L.1/restriction-and-transfer` and the finite-field formulas

Restriction and transfer act on `K_n(𝔽_q)` for all `n`, which is not in either library; in
degree one they are the inclusion `𝔽_qˣ ⊂ 𝔽_{q′}ˣ` and Mathlib's `Algebra.norm`
(`FiniteField.algebraMap_norm_eq_pow`, `FiniteField.norm_surjective`), and the Galois group is
generated by `FiniteField.frobeniusAlgEquivOfAlgebraic`. The tests state these degree-one values,
and the odd-degree formulas are stated on Quillen's cyclic models `ℤ/(q^{di} - 1)`. -/

namespace TauCeti.KTheory.FiniteField

-- TauCeti.KTheory.FiniteField.res: not stated here; needs K_n(𝔽_q) and its functoriality
--   (supplier: GeneralAlgebraicKTheory K.1)
-- TauCeti.KTheory.FiniteField.tr: not stated here; needs the transfer of exact categories
--   P(𝔽_{q′}) → P(𝔽_q) on K_n (supplier: GeneralAlgebraicKTheory K.3)
-- TauCeti.KTheory.FiniteField.tr_plus: not stated here; needs the plus-construction transfer
--   (supplier: GeneralAlgebraicKTheory K.2:plus, K.3)
-- TauCeti.KTheory.FiniteField.res_comp: not stated here; needs res and tr on K_n (supplier:
--   GeneralAlgebraicKTheory K.1, K.3)
-- TauCeti.KTheory.FiniteField.galois_act: not stated here; needs the action g ↦ g_* on K_n
--   (supplier: GeneralAlgebraicKTheory K.1)
-- TauCeti.KTheory.FiniteField.tr_galois: not stated here; needs tr and g_* on K_n (supplier:
--   GeneralAlgebraicKTheory K.3)
-- TauCeti.KTheory.FiniteField.tr_res: not stated here; needs tr ∘ res on K_n (supplier:
--   GeneralAlgebraicKTheory K.3); in degree one it is Mathlib's Algebra.norm_algebraMap
-- TauCeti.KTheory.FiniteField.res_tr: not stated here; needs res ∘ tr on K_n (supplier:
--   GeneralAlgebraicKTheory K.3); in degree one it is Mathlib's
--   Algebra.norm_eq_prod_automorphisms
-- TauCeti.KTheory.FiniteField.projection: not stated here; needs the K_*(𝔽_q)-module structure
--   on K_*(𝔽_{q′}) (supplier: GeneralAlgebraicKTheory K.7)
-- TauCeti.KTheory.FiniteField.res_coeff: not stated here; needs K_n(−; ℤ/m) (supplier:
--   StableHomotopyKTheory H.6)
-- TauCeti.KTheory.FiniteField.res_one: not stated here; needs K_1(𝔽_q) ≅ 𝔽_qˣ by the
--   determinant (supplier: KTheoryLowDegrees U.6, U.5); the degree-one maps themselves are
--   algebraMap and Mathlib's Algebra.norm

-- test TauCeti.KTheory.FiniteField.res_tr_degree_three (computation)
/- `K_3(𝔽₂) → K_3(𝔽₄)` is not stated here (needs K_3, supplier: GeneralAlgebraicKTheory K.1).
Stated: on the cyclic model `K_3(𝔽₄) ≅ ℤ/15` with Frobenius acting by `4`, the invariants have
order `3 = |K_3(𝔽₂)|`, and `1 + 4 = 5`. -/
example : Nat.card {x : ZMod 15 // (4 : ZMod 15) * x = x} = 3 ∧ 1 + 4 = 5 := by
  sorry

-- test TauCeti.KTheory.FiniteField.res_trivial_extension (degenerate): not stated here; needs
--   res and tr on K_n (supplier: GeneralAlgebraicKTheory K.1, K.3)

-- test TauCeti.KTheory.FiniteField.tr_one_norm (compatibility)
/- The identification of the degree-one transfer with the norm needs K_1 (supplier:
KTheoryLowDegrees U.5). Stated: for `𝔽₃ ⊂ 𝔽₉`, `Algebra.norm` is `x ↦ x⁴` and is onto. -/
example : (∀ x : GaloisField 3 2,
      algebraMap (ZMod 3) (GaloisField 3 2) (Algebra.norm (ZMod 3) x) = x ^ 4) ∧
    Function.Surjective (Algebra.norm (ZMod 3) (S := GaloisField 3 2)) := by
  sorry

-- test TauCeti.KTheory.FiniteField.res_not_iso (non-example): not stated here; needs
--   K_3(𝔽₂) → K_3(𝔽₄) and its transfer (supplier: GeneralAlgebraicKTheory K.1, K.3)

-- test TauCeti.KTheory.FiniteField.res_tr_degree_one (computation)
/- Stated: for `𝔽₃ ⊂ 𝔽₉` in degree one, `i^* i_* = 1 + φ_3` is `x ↦ x · φ_3(x) = x^{1+3}`. -/
example (x : GaloisField 3 2) :
    algebraMap (ZMod 3) (GaloisField 3 2) (Algebra.norm (ZMod 3) x) =
        x * FiniteField.frobeniusAlgEquivOfAlgebraic (ZMod 3) (GaloisField 3 2) x ∧
      x * FiniteField.frobeniusAlgEquivOfAlgebraic (ZMod 3) (GaloisField 3 2) x = x ^ (1 + 3) := by
  sorry

end TauCeti.KTheory.FiniteField

namespace TauCeti.KTheoryFiniteLocal

/- `KTheoryFiniteLocalFields:L.1/galois-transfer-formula` (`galois_transfer_formula`): not stated
here; needs restriction and transfer on K_n and K_n(−; ℤ/m) for n ≥ 2 (supplier:
GeneralAlgebraicKTheory K.3, StableHomotopyKTheory H.6). In degree one both formulas are already
Mathlib's `Algebra.norm_algebraMap` and `Algebra.norm_eq_prod_automorphisms`. -/

/-- `KTheoryFiniteLocalFields:L.1/frobenius-action-extension`, on Quillen's cyclic model. The
action of `φ_q` on `K_{2i-1}(𝔽_{q^d})` needs the K-groups (supplier: GeneralAlgebraicKTheory K.1,
and L.1/frobenius-is-adams); stated: on `ℤ/(q^{di} - 1)` with `φ_q` acting by `q^i`, the invariants
are the unique subgroup of order `q^i - 1`, and `Σ_{j<d} q^{ij} = (q^{di} - 1)/(q^i - 1)`. -/
theorem frobenius_action_extension (q d i : ℕ) (hq : 2 ≤ q) (hd : 1 ≤ d) (hi : 1 ≤ i) :
    Nat.card {x : ZMod (q ^ (d * i) - 1) // (q ^ i : ZMod (q ^ (d * i) - 1)) * x = x} =
        q ^ i - 1 ∧
      (∑ j ∈ Finset.range d, q ^ (i * j)) * (q ^ i - 1) = q ^ (d * i) - 1 := by
  sorry

/-- `KTheoryFiniteLocalFields:L.1/finite-field-galois-descent`, degree one. The statement for
`K_n`, `n ≥ 2`, needs the K-groups (supplier: GeneralAlgebraicKTheory K.1, K.3); stated: for
finite fields `K ⊂ K′`, `Kˣ → K′ˣ` is injective with image the `Gal(K′/K)`-invariants, and the
norm `K′ˣ → Kˣ` (the degree-one transfer) is onto. -/
theorem finite_field_galois_descent {K K' : Type} [Field K] [Field K'] [Finite K'] [Algebra K K'] :
    Function.Injective (Units.map (algebraMap K K').toMonoidHom) ∧
      ((Units.map (algebraMap K K').toMonoidHom).range : Set K'ˣ) =
        {x : K'ˣ | ∀ g : K' ≃ₐ[K] K', g (x : K') = x} ∧
      Function.Surjective (Units.map (Algebra.norm K (S := K'))) := by
  sorry

/- `KTheoryFiniteLocalFields:L.1/finite-field-transfer-formulas`
(`finite_field_transfer_formulas`): not stated here; needs restriction and transfer on
K_{2i-1}(𝔽_q) (supplier: GeneralAlgebraicKTheory K.3). Its arithmetic (the orders and the value
`(q^{di} - 1)/(q^i - 1)`) is `frobenius_action_extension`. -/

/-- `KTheoryFiniteLocalFields:L.1/finite-field-products-vanish`, in Milnor K-theory. The product
on Quillen's `K_*(𝔽_q)` needs the K-groups and their products (supplier: GeneralAlgebraicKTheory
K.1, K.7); stated: every product `K^M_m(𝔽_q) × K^M_n(𝔽_q) → K^M_{m+n}(𝔽_q)` with `m, n ≥ 1`
vanishes, in particular every symbol `{a, b}` is `0`. -/
theorem finite_field_products_vanish {F : Type} [Field F] [Finite F] {m n : ℕ} (hm : 1 ≤ m)
    (hn : 1 ≤ n) (x : TauCeti.MilnorK.milnorK F m) (y : TauCeti.MilnorK.milnorK F n) :
    TauCeti.MilnorK.milnorK.mul x y = 0 := by
  sorry

/-- `KTheoryFiniteLocalFields:L.1/determinant-degree-one`, arithmetic side. The identification
`K_1(𝔽_q) ≅ 𝔽_qˣ` by the determinant needs K_1 (supplier: KTheoryLowDegrees U.6); under it,
restriction is the inclusion, transfer is Mathlib's `Algebra.norm` (with value
`x^{(q′-1)/(q-1)}`, `FiniteField.algebraMap_norm_eq_pow`) and `φ_q` is `x ↦ x^q`. Stated: `𝔽_qˣ`
is cyclic of order `q - 1` (no preferred generator), and the image of restriction is
`{x : x^q = x}`. -/
theorem determinant_degree_one {K K' : Type} [Field K] [Field K'] [Finite K'] [Algebra K K'] :
    IsCyclic Kˣ ∧ Nat.card Kˣ = Nat.card K - 1 ∧
      ((Units.map (algebraMap K K').toMonoidHom).range : Set K'ˣ) =
        {x : K'ˣ | (x : K') ^ Nat.card K = x} := by
  sorry

/-- `KTheoryFiniteLocalFields:L.1/degree-two-symbols`: `K_2(𝔽_q) = 0`, in both honest models of
the prelude — Matsumoto's (`milnorK F 2`, every symbol `{a, b}` vanishes) and Steinberg's
(`TauCeti.Steinberg.K2 F`); the agreement with Quillen's `π_2 BGL(𝔽_q)⁺` needs the plus
construction (supplier: GeneralAlgebraicKTheory K.2:plus, K2SymbolsBrauer T.1/k2-pi2). -/
theorem degree_two_symbols (F : Type) [Field F] [Finite F] :
    (∀ x : TauCeti.MilnorK.milnorK F 2, x = 0) ∧ (∀ x : TauCeti.Steinberg.K2 F, x = 1) := by
  sorry

/- `KTheoryFiniteLocalFields:L.1/finite-field-mod-m-groups` (`finite_field_mod_m_groups`): not
stated here; needs K_n(𝔽_q; ℤ/m) (supplier: StableHomotopyKTheory H.6, GeneralAlgebraicKTheory
K.1). -/

/- `KTheoryFiniteLocalFields:L.1/browder-mod-l-ring` (`browder_mod_l_ring`): not stated here;
needs the graded ring K_*(𝔽_q; ℤ/ℓ) with the Bott element and ρ_* to π_*(BU; ℤ/ℓ) (supplier:
StableHomotopyKTheory H.6, RefinedTraceMethods RT.4:topological). -/

/-- `KTheoryFiniteLocalFields:L.1/algebraic-closure-k-groups`, degree one. The groups
`K_n(\bar 𝔽_p)`, `n ≥ 2`, and the Tate-twist identification need the K-groups (supplier:
GeneralAlgebraicKTheory K.1) and `μ^{⊗ i}` (supplier: MotivicEtaleKTheory M.1); stated:
`K_1(\bar 𝔽_p) = \bar 𝔽_pˣ` is a divisible torsion group without `p`-torsion (so
`≅ ⊕_{ℓ ≠ p} ℚ_ℓ/ℤ_ℓ`), on which the Frobenius acts by `x ↦ x^p`. -/
theorem algebraic_closure_k_groups (p : ℕ) [Fact p.Prime] :
    (∀ x : (AlgebraicClosure (ZMod p))ˣ, IsOfFinOrder x) ∧
      (∀ n : ℕ, 0 < n → ∀ x : (AlgebraicClosure (ZMod p))ˣ, ∃ y, y ^ n = x) ∧
      (∀ x : (AlgebraicClosure (ZMod p))ˣ, x ^ p = 1 → x = 1) := by
  sorry

/- `KTheoryFiniteLocalFields:L.1/algebraic-closure-mod-m-ring` (`algebraic_closure_mod_m_ring`):
not stated here; needs the graded ring K_*(\bar 𝔽_p; ℤ/m) and the Bott elements (supplier:
StableHomotopyKTheory H.6). -/

end TauCeti.KTheoryFiniteLocal

/-! ### `KTheoryFiniteLocalFields:L.1/completed-k-theory`

Convention (pinned): `K_n(R; ℤ_ℓ) = π_n (holim_ν K(R)/ℓ^ν)`, a carrier distinct from `K_n(R)`,
from `K_n(R) ⊗ ℤ_ℓ` and from `lim_ν K_n(R)/ℓ^ν`. -/

namespace TauCeti.KTheory

-- TauCeti.KTheory.completed: not stated here; needs holim of the tower of spectra K(R)/ℓ^ν
--   (supplier: StableHomotopyKTheory H.6 derived completion, GeneralAlgebraicKTheory K.1)
-- TauCeti.KTheory.completedGroup: not stated here; needs π_n of K(R; ℤ_ℓ) (supplier:
--   StableHomotopyKTheory H.6)
-- TauCeti.KTheory.toCompleted: not stated here; needs K(R) → holim_ν K(R)/ℓ^ν (supplier:
--   StableHomotopyKTheory H.6)
-- TauCeti.KTheory.completedReduce: not stated here; needs K_n(R; ℤ_ℓ) → K_n(R; ℤ/ℓ^ν)
--   (supplier: StableHomotopyKTheory H.6)
-- TauCeti.KTheory.completed_milnor: not stated here; needs the Milnor sequence of a tower of
--   spectra (supplier: StableHomotopyKTheory H.6)
-- TauCeti.KTheory.completed_eq_lim_of_finite: not stated here; needs K_n(R; ℤ_ℓ) and
--   K_n(R; ℤ/ℓ^ν) (supplier: StableHomotopyKTheory H.6)
-- TauCeti.KTheory.completed_mod: not stated here; needs K(R; ℤ_ℓ)/ℓ^ν ≃ K(R)/ℓ^ν (supplier:
--   StableHomotopyKTheory H.6)
-- TauCeti.KTheory.completedGroup_neg: not stated here; needs K_n(R; ℤ_ℓ) (supplier:
--   StableHomotopyKTheory H.6)
-- TauCeti.KTheory.completed_map_comp: not stated here; needs the functor R ↦ K(R; ℤ_ℓ)
--   (supplier: StableHomotopyKTheory H.6, GeneralAlgebraicKTheory K.1)
-- TauCeti.KTheory.completedTransfer: not stated here; needs transfers of K-theory spectra
--   (supplier: GeneralAlgebraicKTheory K.3)
-- TauCeti.KTheory.completed_prod: not stated here; needs K(R × S) ≃ K(R) × K(S) on spectra
--   (supplier: GeneralAlgebraicKTheory K.1)
-- TauCeti.KTheory.completed_ring: not stated here; needs ring spectra and products (supplier:
--   GeneralAlgebraicKTheory K.7, StableHomotopyKTheory H.6)
-- TauCeti.KTheory.completed_eq_tensor_of_fg: not stated here; needs κ : K_n(R) → K_n(R; ℤ_ℓ)
--   (supplier: StableHomotopyKTheory H.6, GeneralAlgebraicKTheory K.1)

-- test TauCeti.KTheory.completedGroup_finiteField_char (computation): not stated here; needs
--   K_n(𝔽_q; ℤ_p) (supplier: StableHomotopyKTheory H.6, GeneralAlgebraicKTheory K.1)

-- test TauCeti.KTheory.completedGroup_zero_field (compatibility): not stated here; needs
--   K_0(F; ℤ_p) and κ (supplier: StableHomotopyKTheory H.6); the rank equivalence
--   SplitK0(FGModuleCat F) ≃ ℤ is Tau Ceti's TauCeti.SplitK0.finrankEquiv

-- test TauCeti.KTheory.completedGroup_finiteField_prime_to_p (computation)
/- `κ ⊗ ℤ_ℓ` needs the completed groups (supplier: StableHomotopyKTheory H.6). Stated: the
value it predicts, `ℤ/(q^i - 1) ⊗ ℤ_ℓ ≅ ℤ/(q^i - 1)_ℓ`, the `ℓ`-part. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (q i : ℕ) (hq : 2 ≤ q) (hi : 1 ≤ i) :
    Nonempty (ℤ_[ℓ] ⊗[ℤ] ZMod (q ^ i - 1) ≃+ ZMod (ℓ ^ padicValNat ℓ (q ^ i - 1))) := by
  sorry

-- test TauCeti.KTheory.completedGroup_zero_ring (degenerate): not stated here; needs K(0; ℤ_ℓ)
--   (supplier: StableHomotopyKTheory H.6, GeneralAlgebraicKTheory K.1)

-- test TauCeti.KTheory.completedGroup_complex_two (non-example)
/- `K_2(ℂ; ℤ_ℓ) ≅ ℤ_ℓ` needs the completed groups (supplier: StableHomotopyKTheory H.6). Stated:
the other half of the non-example, `K_2(ℂ)` (Matsumoto's model) is uniquely divisible, so
`lim_ν K_2(ℂ)/ℓ^ν = 0`. -/
example : ∀ n : ℕ, n ≠ 0 →
    Function.Bijective (fun x : TauCeti.MilnorK.milnorK ℂ 2 => n • x) := by
  sorry

-- test TauCeti.KTheory.completedGroup_one_Qp (non-example)
/- `K_1(ℚ_p; ℤ_p) ≅ ℤ_p²` needs the completed groups (supplier: StableHomotopyKTheory H.6).
Stated: the other half, `K_1(ℚ_p) ⊗_ℤ ℤ_p = ℚ_pˣ ⊗_ℤ ℤ_p` is not a finitely generated
`ℤ_p`-module (`p` odd). -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    ¬ Module.Finite ℤ_[p] (ℤ_[p] ⊗[ℤ] Additive ℚ_[p]ˣ) := by
  sorry

end TauCeti.KTheory

/-! ## `KTheoryFiniteLocalFields:L.2` — rigidity and the K-theory of local fields away from `p`

Conventions (pinned): the localisation boundary of a DVR `O ⊂ L` with residue field `k` has
`∂[π] = [k] = 1` on `K_1(L) = Lˣ`, and it is left `K_*(O)`-linear, `∂(x·y) = r(x)·∂(y)`
(`L.2/dvr-localisation`). Rigidity, the localisation sequence and every K-group of degree `≥ 2`
need the K-theory spectrum (GeneralAlgebraicKTheory K.1–K.3, StableHomotopyKTheory H.6), so those
nodes are comments; their degree-one arithmetic, the degree-two case of
`even-k-uniquely-l-divisible` in Steinberg's model, and the `w`-invariants (through the prelude's
honest `wInvariantPrimary`) are stated. -/

namespace TauCeti.KTheoryFiniteLocal

open ValuativeRel

/- `KTheoryFiniteLocalFields:L.2/gabber-rigidity` (`gabber_rigidity`): not stated here; needs the
K-theory spectra with coefficients K(R)/n and K(R/I)/n and the homology of the congruence
subgroup GL(I) (supplier: L.1/k-theory-mod-m, i.e. GeneralAlgebraicKTheory K.1 and
StableHomotopyKTheory H.6). The hypothesis side is Mathlib's `HenselianRing R I`. -/

/- `KTheoryFiniteLocalFields:L.2/rigidity-finite-residue-field` (`rigidity_finite_residue_field`):
not stated here; needs K(O)/m ≃ K(𝔽_q)/m (supplier: L.1/k-theory-mod-m, StableHomotopyKTheory
H.6). -/

/- `KTheoryFiniteLocalFields:L.2/rigidity-l-adic` (`rigidity_l_adic`): not stated here; needs the
ℓ-adically completed K-groups K_n(−; ℤ_ℓ) (supplier: L.1/completed-k-theory, StableHomotopyKTheory
H.6). -/

/-- `KTheoryFiniteLocalFields:L.2/dvr-localisation`, degrees `≤ 1`. The fibration
`K(k) → K(O) → K(L)` and its boundary in higher degrees need the K-theory spectrum and the
localisation theorem (supplier: GeneralAlgebraicKTheory K.3; KTheoryLowDegrees U.5 for the
degree-one normalisation). Stated: the end of the sequence, `0 → Oˣ → Lˣ →∂ ℤ → 0`, with the
pinned sign `∂[π] = 1` for a uniformiser `π`. -/
theorem dvr_localisation (O L : Type) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Field L] [Algebra O L] [IsFractionRing O L] (π : O) (hπ : Irreducible π) :
    ∃ bd : Lˣ →* Multiplicative ℤ, Function.Surjective bd ∧
      bd.ker = (Units.map (algebraMap O L).toMonoidHom).range ∧
      ∀ x : Lˣ, (x : L) = algebraMap O L π → bd x = Multiplicative.ofAdd 1 := by
  sorry

/- `KTheoryFiniteLocalFields:L.2/localisation-bockstein-compatibility`
(`localisation_bockstein_compatibility`): not stated here; needs the localisation boundaries
and the Bocksteins on K_*(−; ℤ/m) (supplier: GeneralAlgebraicKTheory K.3, StableHomotopyKTheory
H.6). -/

/- `KTheoryFiniteLocalFields:L.2/henselian-dvr-mod-m-splitting` (`henselian_dvr_mod_m_splitting`):
not stated here; needs K_n(O; ℤ/m), K_n(L; ℤ/m) and the K_*(L)-module structure (supplier:
L.1/k-theory-mod-m, GeneralAlgebraicKTheory K.3, K.7). -/

/- `KTheoryFiniteLocalFields:L.2/odd-k-l-torsion` (`odd_k_l_torsion`): not stated here; needs
K_{2i-1}(O) for i ≥ 2 (supplier: GeneralAlgebraicKTheory K.1, with L.2/gabber-rigidity). Its
degree-one case, μ_{ℓ^ν}(O) ≅ μ_{ℓ^ν}(𝔽_q) by reduction, is Tau Ceti's
`TauCeti.rootsOfUnityEquivResidueField`. -/

/-- `KTheoryFiniteLocalFields:L.2/even-k-uniquely-l-divisible`, degree two. For `i ≥ 2` it needs
`K_{2i}(O)` (supplier: GeneralAlgebraicKTheory K.1); stated: for a henselian local ring `O` with
finite residue field of characteristic `p` and a prime `ℓ ≠ p`, Steinberg's `K₂(O)` is uniquely
`ℓ`-divisible. -/
theorem even_k_uniquely_l_divisible (O : Type) [CommRing O] [HenselianLocalRing O]
    [Finite (IsLocalRing.ResidueField O)] (ℓ : ℕ) [Fact ℓ.Prime]
    (hℓ : (ℓ : IsLocalRing.ResidueField O) ≠ 0) :
    (∀ x : TauCeti.Steinberg.K2 O, ∃ y, y ^ ℓ = x) ∧
      ∀ x : TauCeti.Steinberg.K2 O, x ^ ℓ = 1 → x = 1 := by
  sorry

/-- `KTheoryFiniteLocalFields:L.2/prime-to-p-ring-of-integers`, degree one. For `i ≥ 2` it needs
`K_{2i-1}(O)` (supplier: GeneralAlgebraicKTheory K.1); stated, for a henselian local ring `O`
with finite residue field `𝔽_q`: the torsion of `Oˣ` of order prime to `p` is `T_1 = μ_{q-1}(O)`
(the Teichmüller roots of unity), `Oˣ = μ_{q-1}(O) × (1 + 𝔪)` canonically, and `1 + 𝔪` is
uniquely `ℓ`-divisible for every prime `ℓ ≠ p` (a `ℤ_(p)`-module). -/
theorem prime_to_p_ring_of_integers (O : Type) [CommRing O] [HenselianLocalRing O]
    [Finite (IsLocalRing.ResidueField O)] :
    (∀ u : Oˣ, (∃ n : ℕ, 0 < n ∧ (n : IsLocalRing.ResidueField O) ≠ 0 ∧ u ^ n = 1) ↔
        u ∈ rootsOfUnity (Nat.card (IsLocalRing.ResidueField O) - 1) O) ∧
      (∀ u : Oˣ, ∃! ζ : rootsOfUnity (Nat.card (IsLocalRing.ResidueField O) - 1) O,
        (((u * (ζ : Oˣ)⁻¹ : Oˣ) : O) - 1) ∈ IsLocalRing.maximalIdeal O) ∧
      ∀ ℓ : ℕ, ℓ.Prime → (ℓ : IsLocalRing.ResidueField O) ≠ 0 → ∀ u : Oˣ,
        (u : O) - 1 ∈ IsLocalRing.maximalIdeal O →
          ∃! v : Oˣ, (v : O) - 1 ∈ IsLocalRing.maximalIdeal O ∧ v ^ ℓ = u := by
  sorry

/- `KTheoryFiniteLocalFields:L.2/even-k-field-splitting` (`even_k_field_splitting`): not stated
here; needs K_{2i}(O) → K_{2i}(L) → K_{2i-1}(𝔽_q) and the products K_{2i-1}(O) × K_1(L) → K_{2i}(L)
(supplier: GeneralAlgebraicKTheory K.3, K.7). For i = 1 over a nonarchimedean local field it is
`L.3/local-k2-localisation-sequence` in Steinberg's and Matsumoto's models. -/

/- `KTheoryFiniteLocalFields:L.2/odd-k-ring-of-integers-equals-field`
(`odd_k_ring_of_integers_equals_field`): not stated here for i ≥ 2; needs K_{2i-1}(O) and
K_{2i-1}(L) (supplier: GeneralAlgebraicKTheory K.1, K.3). Its i = 1 case,
`0 → Oˣ → Lˣ → ℤ → 0`, is the degree-one content of `dvr_localisation`. -/

/- `KTheoryFiniteLocalFields:L.2/change-of-uniformiser` (`change_of_uniformiser`): not stated
here; needs K_*(L; ℤ/m), the section s_π and the specialisation λ_π on K_*(L) (supplier:
L.1/k-theory-mod-m, GeneralAlgebraicKTheory K.3, K.7). Part (a) is the degree-one arithmetic of
`dvr_localisation` (the splittings `1 ↦ π` and `1 ↦ uπ` of `∂` differ by `u`). -/

/- `KTheoryFiniteLocalFields:L.2/local-field-prime-to-p` (`local_field_prime_to_p`): not stated
here; needs the integral, finite-coefficient and ℓ-adic K-groups of L (supplier:
GeneralAlgebraicKTheory K.1, L.1/k-theory-mod-m, L.1/completed-k-theory). -/

/- `KTheoryFiniteLocalFields:L.2/mod-m-local-field-ring` (`mod_m_local_field_ring`): not stated
here; needs the graded ring K_*(L; ℤ/m) (supplier: L.1/k-theory-mod-m, L.1/mod-m-products). -/

/-- `KTheoryFiniteLocalFields:L.2/w-invariant-local-field`: for a nonarchimedean local field `L`
with residue field `𝔽_q`, a prime `ℓ ≠ p` and `i ≠ 0`, `w_i^{(ℓ)}(L) = (q^i - 1)_ℓ`, the
`ℓ`-part of `q^{|i|} - 1`, which is also `w_i^{(ℓ)}(𝔽_q)` (the prelude's honest
`wInvariantPrimary`, a stand-in for ArithmeticKTheory N.4). -/
theorem w_invariant_local_field (L : Type) [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : 𝓀[L]) ≠ 0) (i : ℤ)
    (hi : i ≠ 0) :
    wInvariantPrimary L ℓ i = ℓ ^ padicValNat ℓ (Nat.card 𝓀[L] ^ i.natAbs - 1) ∧
      wInvariantPrimary 𝓀[L] ℓ i = wInvariantPrimary L ℓ i := by
  sorry

/- `KTheoryFiniteLocalFields:L.2/separable-closure-l-torsion` (`separable_closure_l_torsion`): not
stated here; needs K_{2i-1}(L^sep) as a G_L-module (supplier: GeneralAlgebraicKTheory K.1, with
L.2/gabber-rigidity) and the Tate twist ℤ/ℓ^∞(i) as a G_L-module (supplier: MotivicEtaleKTheory
M.1). -/

/- `KTheoryFiniteLocalFields:L.2/e-invariant-local-field` (`e_invariant_local_field`): not stated
here; needs K_{2i-1}(L) and the e-invariant of ArithmeticKTheory N.5 (supplier:
GeneralAlgebraicKTheory K.1, ArithmeticKTheory N.5). Its order `w_i^{(ℓ)}(L)` is
`w_invariant_local_field`. -/

end TauCeti.KTheoryFiniteLocal

/-! ## `KTheoryFiniteLocalFields:L.3` — `K₂` of a local field: norm residue map, Moore's theorem

Conventions (pinned by the packet for the layer). `E` is a nonarchimedean local field in Mathlib's
sense (`IsNonarchimedeanLocalField` with its `ValuativeRel`), `𝒪 = 𝒪[E]`, `k = 𝓀[E]` with
`q = Nat.card k` elements, `v` Tau Ceti's `normalizedValuation` (a uniformiser has value
`ofAdd 1`), `μ(E) = CommGroup.torsion Eˣ` of order `w = Nat.card μ(E)`, and
`ω = TauCeti.teichmuller`. `K₂(E)` is Matsumoto's group, here the prelude's `milnorK E 2`;
`K₂(𝒪)` is Steinberg's `K2 𝒪[E]`, carried to `K₂(E)` by `integersMap`. The tame symbol `∂_v` is
the roadmap's, `∂_v{u, π} = ū` (the K-book's `∂^{Kb}_v` is `∂_v⁻¹`), and the tame formula is
`(a, b)_{E,d} = ω(∂_v{a, b})^{−(q−1)/d}` (arithmetic-Frobenius local reciprocity).

Stand-ins introduced here, each for the `K2SymbolsBrauer` node that owns it: the tame symbol and
its homomorphism on `K₂(E)` (`T.3/tame-symbol`, `T.3/tame-symbol-hom`), the `d`-th power norm
residue symbol (`T.7/classical-local-symbols`) with `sorry` body — its defining equation needs
local reciprocity and is recorded as omitted — and the conic symbol with its homomorphism
(`T.7/hilbert-symbol-steinberg`), the conic symbol being a real definition. Mathlib has no
`IsNonarchimedeanLocalField` instance on `𝔽_p((t))` at the pinned commit, so the tests at
`𝔽_p((t))` are stated for any local field of characteristic `p` with residue field `𝔽_p`. -/

namespace TauCeti.LocalK2

open TauCeti TauCeti.MilnorK TauCeti.Steinberg ValuativeRel IsLocalRing
open TauCeti.MilnorK.milnorK (symbol)
open scoped Pointwise

section Carriers

variable (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

/-- `μ(E)`, the group of roots of unity of `E`: the torsion subgroup of `Eˣ`. -/
abbrev mu : Subgroup Eˣ := CommGroup.torsion Eˣ

/-- `w = w(E) = #μ(E)`. -/
abbrev muCard : ℕ := Nat.card (mu E)

/-- `q = #k`, the cardinality of the residue field. -/
abbrev resCard : ℕ := Nat.card 𝓀[E]

/-- The inclusion `𝒪ˣ → Eˣ`. -/
abbrev unitsToField : 𝒪[E]ˣ →* Eˣ := Units.map (algebraMap 𝒪[E] E).toMonoidHom

/-- Reduction of units `𝒪ˣ → kˣ`. -/
abbrev unitsResidue : 𝒪[E]ˣ →* 𝓀[E]ˣ := Units.map (residue 𝒪[E]).toMonoidHom

/-- The Teichmüller lift `ω : kˣ → Eˣ`: Tau Ceti's `teichmuller`, read in `E`. -/
abbrev omega : 𝓀[E]ˣ →* Eˣ := (unitsToField E).comp (teichmuller E)

/-- `π` is a uniformiser: its normalised valuation is `1` (a real definition). -/
def IsUniformizer (π : Eˣ) : Prop := normalizedValuation E π = Multiplicative.ofAdd 1

/-- `j : K₂(𝒪) → K₂(E)`: Steinberg's `K₂` of the valuation ring pushed along `𝒪 ⊂ E` and read in
Matsumoto's group (a composite of the prelude stand-ins). -/
def integersMap : Additive (K2 𝒪[E]) →+ milnorK E 2 :=
  (matsumotoEquiv E).symm.toAddMonoidHom.comp (MonoidHom.toAdditive (K2.map (algebraMap 𝒪[E] E)))

/-- Stand-in for `K2SymbolsBrauer:T.3/tame-symbol` at the normalised valuation of `E`:
`∂_v{f, g} = (−1)^{v(f) v(g)} · ū_f^{v(g)} · ū_g^{−v(f)} ∈ kˣ`, roadmap normalisation. -/
def tameSymbol (f g : Eˣ) : 𝓀[E]ˣ := sorry

/-- Stand-in for `K2SymbolsBrauer:T.3/tame-symbol-hom`: `∂_v : K₂(E) → kˣ`, written additively. -/
def tameSymbolHom : milnorK E 2 →+ Additive 𝓀[E]ˣ := sorry

/-- Stand-in for the `d`-th power norm residue symbol `(x, y)_{E,d} ∈ μ_d` of
`K2SymbolsBrauer:T.7/classical-local-symbols`, for `μ_d ⊆ E` and `d` invertible:
`(x, y)_{E,d} = rec_E(x)(η)/η` with `η^d = y`, `rec_E` local reciprocity with the arithmetic
normalisation. Its defining equation is not stated here: it needs the local reciprocity map
`Eˣ → Gal(Eˢᵉᵖ/E)^{ab}` (supplier: tauceti ClassFieldTheory Layer 6, `localArtinEquiv`). -/
def normResidueSymbol (d : ℕ) [HasEnoughRootsOfUnity E d] (hd : IsUnit (d : E)) (x y : Eˣ) :
    rootsOfUnity d E :=
  sorry

/-- Stand-in for the quadratic Hilbert symbol on `K₂(E)` (`K2SymbolsBrauer:T.7/hilbert-symbol-
steinberg`), `{a, b} ↦ c_E(a, b)`, bilinear for `2` invertible. -/
def hilbertK2 (h2 : IsUnit (2 : E)) : milnorK E 2 →+ Additive ℤˣ := sorry

end Carriers

open Classical in
/-- The conic symbol `c_F(a, b) ∈ {±1}` (`K2SymbolsBrauer:T.7/hilbert-symbol-steinberg`): `+1`
exactly when `a x² + b y² = 1` has a solution in `F` (a real definition). -/
def conicSymbol {F : Type*} [Field F] (a b : F) : ℤˣ :=
  if ∃ x y : F, a * x ^ 2 + b * y ^ 2 = 1 then 1 else -1

section StandInAPI

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

@[simp]
theorem tameSymbolHom_symbol (f g : Eˣ) :
    tameSymbolHom E (symbol ![f, g]) = Additive.ofMul (tameSymbol E f g) := by
  sorry

/-- The convention-pinning value `∂_v{u, π} = ū`. -/
theorem tameSymbol_unit_uniformizer (u : 𝒪[E]ˣ) {π : Eˣ} (hπ : IsUniformizer E π) :
    tameSymbol E (unitsToField E u) π = unitsResidue E u := by
  sorry

@[simp]
theorem hilbertK2_symbol (h2 : IsUnit (2 : E)) (a b : Eˣ) :
    hilbertK2 E h2 (symbol ![a, b]) = Additive.ofMul (conicSymbol (a : E) b) := by
  sorry

end StandInAPI

/-! ### `KTheoryFiniteLocalFields:L.3/norm-residue-map` -/

section NormResidueMap

variable (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

/-- **The norm residue map** `h_E : K₂(E) → μ(E)` (`KTheoryFiniteLocalFields:L.3/norm-residue-map`):
the `w`-th power norm residue homomorphism, `{a, b} ↦ (a, b)_{E,w}`, `w = #μ(E)`. No primitive root
is chosen: the target is the group `μ(E)` itself. -/
def normResidueMap : milnorK E 2 →+ Additive (mu E) := sorry

variable {E}

/-- `h_E{a, b} = (a, b)_{E,w}` (read in `Eˣ`, where `μ_w(E) = μ(E)`). -/
@[simp]
theorem normResidueMap_symbol [HasEnoughRootsOfUnity E (muCard E)] (hw : IsUnit (muCard E : E))
    (a b : Eˣ) :
    ((Additive.toMul (normResidueMap E (symbol ![a, b])) : mu E) : Eˣ) =
      (normResidueSymbol E (muCard E) hw a b : Eˣ) := by
  sorry

@[simp]
theorem normResidueMap_symbol_pow_right (a c : Eˣ) :
    normResidueMap E (symbol ![a, c ^ muCard E]) = 0 ∧
      ∀ (b : Eˣ) (hb : (b : E) ≠ 1),
        normResidueMap E (symbol ![b, Units.mk0 (1 - (b : E)) (sub_ne_zero.mpr hb.symm)]) = 0 := by
  sorry

/-- `h_E` is surjective (`KTheoryFiniteLocalFields:L.3/norm-residue-split-surjective`). -/
theorem normResidueMap_surjective : Function.Surjective (normResidueMap E) := by
  sorry

/-- For `d ∣ w`, `h_E^{w/d}` is the `d`-th power symbol
(`KTheoryFiniteLocalFields:L.3/norm-residue-power-compatibility`); stated on symbols, which
generate `K₂(E)`, because the `d`-th power symbol is only a stand-in on pairs of units here. -/
theorem normResidueMap_pow_eq (d : ℕ) (hdw : d ∣ muCard E) [HasEnoughRootsOfUnity E d]
    (hd : IsUnit (d : E)) (x y : Eˣ) :
    ((Additive.toMul ((muCard E / d) • normResidueMap E (symbol ![x, y])) : mu E) : Eˣ) =
      (normResidueSymbol E d hd x y : Eˣ) := by
  sorry

/-- The tame components (`KTheoryFiniteLocalFields:L.3/tame-component`): for `d ∣ q − 1`,
`h_E^{w/d} = (ω ∘ ∂_v)^{−(q−1)/d}` on `K₂(E)`. -/
theorem normResidueMap_tame (d : ℕ) (hd : d ∣ resCard E - 1) (x : milnorK E 2) :
    ((Additive.toMul ((muCard E / d) • normResidueMap E x) : mu E) : Eˣ) =
      omega E (Additive.toMul (tameSymbolHom E x)) ^ (-(((resCard E - 1) / d : ℕ) : ℤ)) := by
  sorry

/-- If `2` is invertible, `h_E^{w/2}` is the quadratic Hilbert symbol, read in `{±1} ⊆ Eˣ`. -/
theorem normResidueMap_two (h2 : IsUnit (2 : E)) (x : milnorK E 2) :
    ((Additive.toMul ((muCard E / 2) • normResidueMap E x) : mu E) : Eˣ) =
      Units.map (Int.castRingHom E).toMonoidHom (Additive.toMul (hilbertK2 E h2 x)) := by
  sorry

/-- `h_E{x, y} = 1` iff `x` is a norm from `E(η)`, `η^w = y`
(`KTheoryFiniteLocalFields:L.3/norm-residue-local-reciprocity`). -/
theorem normResidueMap_eq_one_iff_norm (x y : Eˣ) (η : AlgebraicClosure E)
    (hη : η ^ muCard E = algebraMap E (AlgebraicClosure E) y) :
    normResidueMap E (symbol ![x, y]) = 0 ↔ ∃ z : E⟮η⟯, Algebra.norm E z = (x : E) := by
  sorry

-- mooreKernel (data): the kernel of `normResidueMap`; defined below with its own node
-- `KTheoryFiniteLocalFields:L.3/moore-kernel`, where the packet lists it again.

-- normResidueMap_localSymbol: not stated here; needs the local invariant `inv_E : Br(E) ≅ ℚ/ℤ`
-- and the Galois symbol `β_ζ : K₂(E) → Br(E)[w]` with its fixed sign `ε` (supplier: tauceti
-- ClassFieldTheory Layer 5, K2SymbolsBrauer:T.7/local-comparison).

end NormResidueMap

section NormResidueMapTests

/-- `2`, `3`, `5` and `-1` as units of `ℚ_[p]` (test notation). -/
local notation "⟪" q "⟫" => Units.mk0 q (by norm_num)

-- test normResidueMap_Q2 (computation)
example :
    muCard ℚ_[2] = 2 ∧
      ((Additive.toMul (normResidueMap ℚ_[2] (symbol ![-1, -1])) : mu ℚ_[2]) : ℚ_[2]ˣ) = -1 ∧
      normResidueMap ℚ_[2] (symbol ![-1, ⟪(5 : ℚ_[2])⟫]) = 0 := by
  sorry

-- test normResidueMap_Q5 (computation)
/- `h{5, 2} = ω(2)` and `h{2, 5} = ω(3) = ω(2)⁻¹` in `μ(ℚ₅) = μ₄`; `α`, `β` are the residues
`2`, `3` as units of `𝓀[ℚ₅] = 𝔽₅`. -/
example [Fact (Nat.Prime 5)] (α β : 𝓀[ℚ_[5]]ˣ) (hα : (α : 𝓀[ℚ_[5]]) = 2)
    (hβ : (β : 𝓀[ℚ_[5]]) = 3) :
    muCard ℚ_[5] = 4 ∧
      ((Additive.toMul (normResidueMap ℚ_[5] (symbol ![⟪(5 : ℚ_[5])⟫, ⟪(2 : ℚ_[5])⟫])) :
        mu ℚ_[5]) : ℚ_[5]ˣ) = omega ℚ_[5] α ∧
      ((Additive.toMul (normResidueMap ℚ_[5] (symbol ![⟪(2 : ℚ_[5])⟫, ⟪(5 : ℚ_[5])⟫])) :
        mu ℚ_[5]) : ℚ_[5]ˣ) = omega ℚ_[5] β ∧
      omega ℚ_[5] β = (omega ℚ_[5] α)⁻¹ := by
  sorry

section Laurent

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

-- test normResidueMap_laurent (computation)
/- Stated for every local field of characteristic `p` with residue field `𝔽_p` (such as
`𝔽_p((t))`): for a uniformiser `t` and a constant `a` (`a^{p−1} = 1`, i.e. `a` is its own
Teichmüller lift), `h{t, a} = a` and `h{a, t} = a⁻¹`. -/
example (p : ℕ) [Fact p.Prime] [CharP E p] (hq : resCard E = p) (t a : Eˣ)
    (ht : IsUniformizer E t) (ha : a ^ (p - 1) = 1) :
    ((Additive.toMul (normResidueMap E (symbol ![t, a])) : mu E) : Eˣ) = a ∧
      ((Additive.toMul (normResidueMap E (symbol ![a, t])) : mu E) : Eˣ) = a⁻¹ := by
  sorry

-- test normResidueMap_degenerate (degenerate)
example :
    (∀ (a b c : Eˣ) (ha : (a : E) ≠ 1),
      normResidueMap E (symbol ![a, Units.mk0 (1 - (a : E)) (sub_ne_zero.mpr ha.symm)]) = 0 ∧
        normResidueMap E (symbol ![1, b]) = 0 ∧ normResidueMap E (symbol ![a, c ^ muCard E]) = 0) ∧
      (CharP E 2 → resCard E = 2 → muCard E = 1 ∧ normResidueMap E = 0) := by
  sorry

end Laurent

-- test normResidueMap_not_tame (non-example)
/- Both entries of `{−1, −1}` are units, so its tame symbol is trivial, but `h{−1, −1} = −1`. -/
example :
    tameSymbolHom ℚ_[2] (symbol ![-1, -1]) = 0 ∧ normResidueMap ℚ_[2] (symbol ![-1, -1]) ≠ 0 := by
  sorry

-- test normResidueMap_hilbert_Q3 (compatibility)
example :
    muCard ℚ_[3] = 2 ∧
      ((Additive.toMul (normResidueMap ℚ_[3] (symbol ![⟪(3 : ℚ_[3])⟫, -1])) : mu ℚ_[3]) :
        ℚ_[3]ˣ) = -1 ∧
      conicSymbol (3 : ℚ_[3]) (-1) = -1 := by
  sorry

end NormResidueMapTests

end TauCeti.LocalK2

namespace TauCeti.KTheoryFiniteLocal

open TauCeti TauCeti.MilnorK TauCeti.LocalK2 ValuativeRel IsLocalRing
open TauCeti.MilnorK.milnorK (symbol)

section NormResidueSymbols

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

/-- `KTheoryFiniteLocalFields:L.3/norm-residue-power-compatibility`: for `μ_m ⊆ E`, `m`
invertible and `d ∣ m`, `(x, y)_{E,d} = ((x, y)_{E,m})^{m/d}`: the `d`-th power symbol is the
`m`-th power symbol followed by the power map `μ_m → μ_d`, `ζ ↦ ζ^{m/d}`. For `m = w` this is
`normResidueMap_pow_eq`. -/
theorem norm_residue_power_compatibility (m d : ℕ) (hdm : d ∣ m) [HasEnoughRootsOfUnity E m]
    [HasEnoughRootsOfUnity E d] (hm : IsUnit (m : E)) (hd : IsUnit (d : E)) (x y : Eˣ) :
    (normResidueSymbol E d hd x y : Eˣ) = (normResidueSymbol E m hm x y : Eˣ) ^ (m / d) := by
  sorry

/-- `KTheoryFiniteLocalFields:L.3/hilbert-symbol-components`, parts (ii) and (iii): for a prime
power `ℓ^a` exactly dividing `w`, and `u` with `u · (w/ℓ^a) ≡ 1 (mod ℓ^a)`, the `ℓ`-primary
component `π_ℓ ∘ h_E = h_E^{u·(w/ℓ^a)}` equals `((−, −)_{E,ℓ^a})^u`; and for `ℓ ≠ p` that symbol is
tame, `(ω ∘ ∂_v)^{−(q−1)/ℓ^a}`. Part (i) is the decomposition of the cyclic group `μ(E)` into its
primary parts, part (v) is `normResidueMap_two`, and part (iv) is the test
`normResidueMap_not_tame`. For `E = ℚ₂(ζ₃)` (`w = 6`, `ℓ = 3`, `u = 2`) it gives
`π₃ ∘ h_E = ((−, −)_{E,3})^2 = ((−, −)_{E,3})⁻¹`, the packet's warning. -/
theorem hilbert_symbol_components [HasEnoughRootsOfUnity E (muCard E)]
    (ℓ a : ℕ) (hℓ : ℓ.Prime) (ha : ℓ ^ a ∣ muCard E) (hcop : Nat.Coprime ℓ (muCard E / ℓ ^ a))
    [HasEnoughRootsOfUnity E (ℓ ^ a)] (hd : IsUnit ((ℓ ^ a : ℕ) : E)) (u : ℕ)
    (hu : u * (muCard E / ℓ ^ a) ≡ 1 [MOD ℓ ^ a]) (x y : Eˣ) :
    ((Additive.toMul ((u * (muCard E / ℓ ^ a)) • normResidueMap E (symbol ![x, y])) : mu E) :
        Eˣ) = (normResidueSymbol E (ℓ ^ a) hd x y : Eˣ) ^ u ∧
      ((ℓ : 𝓀[E]) ≠ 0 → (normResidueSymbol E (ℓ ^ a) hd x y : Eˣ) =
        omega E (tameSymbol E x y) ^ (-(((resCard E - 1) / ℓ ^ a : ℕ) : ℤ))) := by
  sorry

/-- **The tame components** (`KTheoryFiniteLocalFields:L.3/tame-component`): for `d ∣ q − 1`,
`(a, b)_{E,d} = ω(∂_v{a, b})^{−(q−1)/d}`, with the arithmetic normalisation of local reciprocity
(with the geometric one every exponent changes sign). On `ℚ₅`, `d = 4`: `∂_v{5, 2} = 3`, so
`(5, 2)_{ℚ₅,4} = ω(3)⁻¹ = ω(2)`. The form on `K₂(E)` is `normResidueMap_tame`. -/
theorem tame_component (d : ℕ) (hd1 : d ∣ resCard E - 1) [HasEnoughRootsOfUnity E d]
    (hd : IsUnit (d : E)) (a b : Eˣ) :
    (normResidueSymbol E d hd a b : Eˣ) =
      omega E (tameSymbol E a b) ^ (-(((resCard E - 1) / d : ℕ) : ℤ)) := by
  sorry

/-- `KTheoryFiniteLocalFields:L.3/norm-residue-local-reciprocity`: for `d ∣ w` and `η^d = y`,
`(x, y)_{E,d} = 1` iff `x` is a norm from `E(η)`. (The index statement `[Eˣ : N(E(η)ˣ)] =
[E(η) : E]` and the conic form for `d = 2` are consequences; `x` is the argument of `rec_E`,
`y` the Kummer variable.) -/
theorem norm_residue_local_reciprocity (d : ℕ) (hdw : d ∣ muCard E) [HasEnoughRootsOfUnity E d]
    (hd : IsUnit (d : E)) (x y : Eˣ) (η : AlgebraicClosure E)
    (hη : η ^ d = algebraMap E (AlgebraicClosure E) y) :
    normResidueSymbol E d hd x y = 1 ↔ ∃ z : E⟮η⟯, Algebra.norm E z = (x : E) := by
  sorry

/-- `KTheoryFiniteLocalFields:L.3/norm-residue-split-surjective`: for a generator `ζ` of `μ(E)`,
`(ζ, −)_{E,w}` is onto `μ(E)`; for `x` with `(ζ, x)_{E,w} = ζ` the formula `ζ^i ↦ i·{ζ, x}`
defines a section of `h_E`; hence `h_E` is surjective. The section depends on `(ζ, x)`. -/
theorem norm_residue_split_surjective [HasEnoughRootsOfUnity E (muCard E)]
    (hw : IsUnit (muCard E : E)) (ζ : mu E) (hζ : Subgroup.zpowers ζ = ⊤) :
    (∀ ξ : mu E, ∃ x : Eˣ, (normResidueSymbol E (muCard E) hw ζ x : Eˣ) = ξ) ∧
      (∀ x : Eˣ, (normResidueSymbol E (muCard E) hw ζ x : Eˣ) = ζ →
        ∃ s : Additive (mu E) →+ milnorK E 2,
          (∀ i : ℤ, s (Additive.ofMul (ζ ^ i)) = i • symbol ![(ζ : Eˣ), x]) ∧
            (normResidueMap E).comp s = AddMonoidHom.id _) ∧
      Function.Surjective (normResidueMap E) := by
  sorry

end NormResidueSymbols

end TauCeti.KTheoryFiniteLocal

/-! ### `KTheoryFiniteLocalFields:L.3/moore-kernel` -/

namespace TauCeti.LocalK2

open TauCeti TauCeti.MilnorK TauCeti.Steinberg ValuativeRel IsLocalRing
open TauCeti.MilnorK.milnorK (symbol)
open scoped Pointwise

section MooreKernel

variable (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

/-- **Moore's kernel** `U(E) = ker h_E ⊆ K₂(E)` (`KTheoryFiniteLocalFields:L.3/moore-kernel`).
The body is the packet's definition, a kernel. The sequence `0 → U(E) → K₂(E) → μ(E) → 0` is
canonical; a splitting needs a section of `h_E`, which is a choice. -/
def mooreKernel : AddSubgroup (milnorK E 2) := (normResidueMap E).ker

variable {E}

theorem mem_mooreKernel_iff (x : milnorK E 2) : x ∈ mooreKernel E ↔ normResidueMap E x = 0 := by
  sorry

/-- `0 → U(E) → K₂(E) → μ(E) → 0` is exact (surjectivity: `normResidueMap_surjective`). -/
theorem mooreKernel_exact :
    Function.Injective (mooreKernel E).subtype ∧
      Function.Exact (mooreKernel E).subtype (normResidueMap E) ∧
      Function.Surjective (normResidueMap E) := by
  sorry

/-- `w · K₂(E) ⊆ U(E)`, as `μ(E)` has exponent `w`. -/
theorem nsmul_le_mooreKernel : muCard E • (⊤ : AddSubgroup (milnorK E 2)) ≤ mooreKernel E := by
  sorry

/-- Moore's theorem (`KTheoryFiniteLocalFields:L.3/moore-theorem`): `U(E) = w · K₂(E)`. -/
theorem mooreKernel_eq_nsmul : mooreKernel E = muCard E • (⊤ : AddSubgroup (milnorK E 2)) := by
  sorry

/-- Moore's theorem: `U(E) = ⋂_{m ≥ 1} m · K₂(E)`. -/
theorem mooreKernel_eq_iInf_nsmul :
    mooreKernel E = ⨅ (m : ℕ) (_ : 0 < m), m • (⊤ : AddSubgroup (milnorK E 2)) := by
  sorry

/-- `U(E) ⊆ j(K₂(𝒪))` (`KTheoryFiniteLocalFields:L.3/ring-of-integers-subgroup`). -/
theorem mooreKernel_le_range_integers : mooreKernel E ≤ (integersMap E).range := by
  sorry

/-- In characteristic `p`, `U(E) = j(K₂(𝒪))`
(`KTheoryFiniteLocalFields:L.3/moore-equal-characteristic`). -/
theorem mooreKernel_charP (p : ℕ) [Fact p.Prime] [CharP E p] :
    mooreKernel E = (integersMap E).range := by
  sorry

end MooreKernel

section MooreKernelTests

/-- Units of `ℚ_[p]` (test notation). -/
local notation "⟪" q "⟫" => Units.mk0 q (by norm_num)

-- test mooreKernel_Q2_five (characterisation)
/- `−x² + 5y² = 1` has the solution `x = 2, y = 1`, so `{−1, 5} ∈ U(ℚ₂)`; being `2`-torsion, it is
`0` by Moore's theorem. -/
example :
    symbol ![-1, ⟪(5 : ℚ_[2])⟫] ∈ mooreKernel ℚ_[2] ∧
      (2 : ℕ) • symbol ![-1, ⟪(5 : ℚ_[2])⟫] = 0 ∧ symbol ![-1, ⟪(5 : ℚ_[2])⟫] = 0 := by
  sorry

-- test mooreKernel_Q3 (computation)
example :
    symbol ![⟪(3 : ℚ_[3])⟫, -1] ∉ mooreKernel ℚ_[3] ∧
      symbol ![(-1 : ℚ_[3]ˣ), -1] ∈ mooreKernel ℚ_[3] ∧ symbol ![(-1 : ℚ_[3]ˣ), -1] = 0 := by
  sorry

section CharTwo

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

-- test mooreKernel_F2_laurent (degenerate)
/- For a local field of characteristic `2` with residue field `𝔽₂` (such as `𝔽₂((t))`):
`μ(E) = 1`, `w = 1` and `U(E) = K₂(E) = j(K₂(𝒪))`. -/
example [CharP E 2] (hq : resCard E = 2) :
    muCard E = 1 ∧ mooreKernel E = ⊤ ∧ (integersMap E).range = ⊤ := by
  sorry

-- test mooreKernel_laurent (compatibility)
/- For a local field of characteristic `p` (such as `𝔽_p((t))`): `U(E) = ker ∂_v = j(K₂(𝒪))`,
because `μ_{p^∞}(E) = 1`. -/
example (p : ℕ) [Fact p.Prime] [CharP E p] :
    mooreKernel E = (tameSymbolHom E).ker ∧ mooreKernel E = (integersMap E).range := by
  sorry

end CharTwo

-- test mooreKernel_ne_tame_kernel (non-example)
/- `{−1, −1}` lies in the tame kernel of `ℚ₂`, which is `j(K₂(ℤ₂))`, but not in `U(ℚ₂)`. -/
example :
    symbol ![(-1 : ℚ_[2]ˣ), -1] ∈ (tameSymbolHom ℚ_[2]).ker ∧
      symbol ![(-1 : ℚ_[2]ˣ), -1] ∈ (integersMap ℚ_[2]).range ∧
      symbol ![(-1 : ℚ_[2]ˣ), -1] ∉ mooreKernel ℚ_[2] := by
  sorry

end MooreKernelTests

end TauCeti.LocalK2

namespace TauCeti.KTheoryFiniteLocal

open TauCeti TauCeti.MilnorK TauCeti.Steinberg TauCeti.LocalK2 ValuativeRel IsLocalRing
open TauCeti.MilnorK.milnorK (symbol)

section MooreStructure

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

/-- `KTheoryFiniteLocalFields:L.3/local-k2-localisation-sequence`: `0 → K₂(𝒪) →j K₂(E) → kˣ → 0`
is exact and canonical. The localisation boundary is `∂^{Kb}_v = ∂_v⁻¹` on symbols
(`K2SymbolsBrauer:T.3/localization-boundary`); it has the same kernel and image as the tame
symbol `∂_v` used here, so `j(K₂(𝒪)) = ker ∂_v`. The splitting is canonical: `u ↦ {ω(u), π}` is a
section of `∂_v` for every uniformiser `π`, and it does not depend on `π`
(`KTheoryFiniteLocalFields:L.2/even-k-field-splitting`, `i = 1`). -/
theorem local_k2_localisation_sequence :
    Function.Injective (integersMap E) ∧ Function.Exact (integersMap E) (tameSymbolHom E) ∧
      Function.Surjective (tameSymbolHom E) ∧
      ∀ π π' : Eˣ, IsUniformizer E π → IsUniformizer E π' → ∀ u : 𝓀[E]ˣ,
        symbol ![omega E u, π] = symbol ![omega E u, π'] ∧
          tameSymbolHom E (symbol ![omega E u, π]) = Additive.ofMul u := by
  sorry

/-- `KTheoryFiniteLocalFields:L.3/moore-kernel-prime-to-p`: for a prime `ℓ ≠ p`, `U(E)` is
uniquely `ℓ`-divisible; `∂_v` induces `K₂(E)/ℓ ≅ kˣ/ℓ` and `K₂(E)[ℓ] ≅ kˣ[ℓ]`, and `h_E` induces
`K₂(E)/ℓ ≅ μ(E)/ℓ` and `K₂(E)[ℓ] ≅ μ(E)[ℓ]` (each quotient statement in the form "the preimage of
`ℓ ·` is `ℓ ·`", which with surjectivity is bijectivity of the induced map). -/
theorem moore_kernel_prime_to_p (ℓ : ℕ) (hℓ : ℓ.Prime) (hℓp : (ℓ : 𝓀[E]) ≠ 0) :
    (∀ x : mooreKernel E, ∃! y : mooreKernel E, ℓ • y = x) ∧
      (∀ x : milnorK E 2, (∃ a, tameSymbolHom E x = ℓ • a) → ∃ y, x = ℓ • y) ∧
      Set.BijOn (tameSymbolHom E) {x | ℓ • x = 0} {a | ℓ • a = 0} ∧
      (∀ x : milnorK E 2, (∃ ξ, normResidueMap E x = ℓ • ξ) → ∃ y, x = ℓ • y) ∧
      Set.BijOn (normResidueMap E) {x | ℓ • x = 0} {ξ | ℓ • ξ = 0} := by
  sorry

end MooreStructure

/-- `KTheoryFiniteLocalFields:L.3/k2-no-p-torsion-char-p`: `K₂` of a field of characteristic
`p > 0` has no `p`-torsion (K-book Theorem III.6.7), in this generality. -/
theorem k2_no_p_torsion_char_p (F : Type u) [Field F] (p : ℕ) [Fact p.Prime] [CharP F p]
    (x : milnorK F 2) (hx : p • x = 0) : x = 0 := by
  sorry

section MooreStructure

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

/-- `KTheoryFiniteLocalFields:L.3/k2-p-divisible-equal-characteristic`: a local field of
characteristic `p` has `K₂(E) = p · K₂(E)` (`[E : E^p] = p`, so `Ω²_E = 0`, and Bloch–Kato–Gabber
`K₂(E)/p ≅ ν(2)_E ⊆ Ω²_E`). -/
theorem k2_p_divisible_equal_characteristic (p : ℕ) [Fact p.Prime] [CharP E p]
    (x : milnorK E 2) : ∃ y, p • y = x := by
  sorry

/-- `KTheoryFiniteLocalFields:L.3/moore-kernel-p-divisible-mixed-characteristic`: if `char E = 0`
and `p = char k`, `h_E` induces `K₂(E)/p^ν ≅ μ(E)/p^ν` for every `ν`, and `U(E)` is
`p`-divisible. -/
theorem moore_kernel_p_divisible_mixed_characteristic [CharZero E] (p : ℕ) [Fact p.Prime]
    [CharP 𝓀[E] p] :
    (∀ (ν : ℕ) (x : milnorK E 2), (∃ ξ, normResidueMap E x = p ^ ν • ξ) → ∃ y, x = p ^ ν • y) ∧
      ∀ x : mooreKernel E, ∃ y : mooreKernel E, p • y = x := by
  sorry

/-- **Merkurjev's theorem** (`KTheoryFiniteLocalFields:L.3/merkurjev-p-torsion-free`): in
characteristic `0`, `U(E)` has no `p`-torsion (cited; the proof is not in a source read). -/
theorem merkurjev_p_torsion_free [CharZero E] (p : ℕ) [Fact p.Prime] [CharP 𝓀[E] p]
    (x : mooreKernel E) (hx : p • x = 0) : x = 0 := by
  sorry

/-- `KTheoryFiniteLocalFields:L.3/moore-kernel-uncountable`: `U(E)` is uncountable; indeed
`#K₂(E) = 2^{ℵ₀}` and `K₂(E)/U(E) ≅ μ(E)` is finite. -/
theorem moore_kernel_uncountable :
    Uncountable (mooreKernel E) ∧ Cardinal.mk (milnorK E 2) = Cardinal.continuum := by
  sorry

end MooreStructure

end TauCeti.KTheoryFiniteLocal

namespace TauCeti.LocalK2

open TauCeti TauCeti.MilnorK TauCeti.Steinberg ValuativeRel IsLocalRing
open TauCeti.MilnorK.milnorK (symbol)
open scoped Pointwise

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

/-- **Moore's theorem** (`KTheoryFiniteLocalFields:L.3/moore-theorem`), for a nonarchimedean local
field `E` with `w = #μ(E)`: (a) `U(E)` is uniquely divisible and uncountable; (b) the torsion
subgroup of `K₂(E)` is cyclic of order `w`, `h_E` restricts to an isomorphism from it onto `μ(E)`,
and `K₂(E) = U(E) ⊕ K₂(E)_tors` internally (canonically); (c) `U(E) = w·K₂(E) = ⋂ m·K₂(E)` is the
largest divisible subgroup; (d) every section of `h_E` lands in the torsion subgroup, so equals
`(h_E|_{tors})⁻¹`. In characteristic `0`, (a) at `p` rests on Merkurjev's theorem. -/
theorem moore_theorem :
    (∀ n : ℕ, 0 < n → ∀ x : mooreKernel E, ∃! y : mooreKernel E, n • y = x) ∧
      Uncountable (mooreKernel E) ∧
      IsAddCyclic (AddCommGroup.torsion (milnorK E 2)) ∧
      Nat.card (AddCommGroup.torsion (milnorK E 2)) = muCard E ∧
      Function.Bijective ((normResidueMap E).comp (AddCommGroup.torsion (milnorK E 2)).subtype) ∧
      IsCompl (mooreKernel E) (AddCommGroup.torsion (milnorK E 2)) ∧
      mooreKernel E = muCard E • (⊤ : AddSubgroup (milnorK E 2)) ∧
      mooreKernel E = ⨅ (m : ℕ) (_ : 0 < m), m • (⊤ : AddSubgroup (milnorK E 2)) ∧
      (∀ D : AddSubgroup (milnorK E 2), (∀ n : ℕ, 0 < n → ∀ x ∈ D, ∃ y ∈ D, n • y = x) →
        D ≤ mooreKernel E) ∧
      ∀ s : Additive (mu E) →+ milnorK E 2, (normResidueMap E).comp s = AddMonoidHom.id _ →
        ∀ ξ, s ξ ∈ AddCommGroup.torsion (milnorK E 2) := by
  sorry

end TauCeti.LocalK2

namespace TauCeti.KTheoryFiniteLocal

open TauCeti TauCeti.MilnorK TauCeti.Steinberg TauCeti.LocalK2 ValuativeRel IsLocalRing
open TauCeti.MilnorK.milnorK (symbol)

section MooreVariants

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

/-- `KTheoryFiniteLocalFields:L.3/ring-of-integers-subgroup`, with `j = integersMap` and
`w = (q − 1)·p^a`: (i) `U(E) ⊆ j(K₂(𝒪)) = ker ∂_v`; (ii) `h_E` maps `j(K₂(𝒪))` onto
`μ_{p^∞}(E)`, the `p`-primary component of `Eˣ`; (iii) `h_E^{p^a}`, read in
`μ_{q−1}(E) = ω(kˣ)`, is `ω ∘ ∂_v⁻¹ = ω ∘ ∂^{Kb}_v`; (iv) with Moore's theorem every element of
`j(K₂(𝒪))` is an element of `U(E)` plus a torsion element of `j(K₂(𝒪))`. -/
theorem ring_of_integers_subgroup (p : ℕ) [Fact p.Prime] [CharP 𝓀[E] p] :
    mooreKernel E ≤ (integersMap E).range ∧ (integersMap E).range = (tameSymbolHom E).ker ∧
      (∀ ξ : mu E, (ξ : Eˣ) ∈ CommGroup.primaryComponent Eˣ p ↔
        ∃ x ∈ (integersMap E).range, normResidueMap E x = Additive.ofMul ξ) ∧
      (∀ x : milnorK E 2,
        ((Additive.toMul ((muCard E / (resCard E - 1)) • normResidueMap E x) : mu E) : Eˣ) =
          omega E (Additive.toMul (tameSymbolHom E x))⁻¹) ∧
      ∀ x ∈ (integersMap E).range, ∃ u ∈ mooreKernel E,
        ∃ t ∈ (integersMap E).range ⊓ AddCommGroup.torsion (milnorK E 2), x = u + t := by
  sorry

/-- **Moore's theorem in characteristic `p`**
(`KTheoryFiniteLocalFields:L.3/moore-equal-characteristic`), `E ≅ 𝔽_q((π))`: `μ(E) = ω(kˣ)` and
`w = q − 1`; `h_E = ω ∘ ∂_v⁻¹` (the Teichmüller lift of the K-book's tame symbol); `U(E) = ker
∂_v = j(K₂(𝒪))`; and for a uniformiser `π`, `s(u) = {ω(u), π}` is a homomorphism with `K₂(E) =
j(K₂(𝒪)) ⊕ s(kˣ)` and `K₂(E)_tors = s(kˣ)`. (`K₂(𝒪) ≅ U(E)` uncountable and uniquely divisible
is `moore_theorem`.) -/
theorem moore_equal_characteristic (p : ℕ) [Fact p.Prime] [CharP E p] :
    muCard E = resCard E - 1 ∧
      (∀ x : milnorK E 2, ((Additive.toMul (normResidueMap E x) : mu E) : Eˣ) =
        omega E (Additive.toMul (tameSymbolHom E x))⁻¹) ∧
      mooreKernel E = (tameSymbolHom E).ker ∧ mooreKernel E = (integersMap E).range ∧
      ∀ π : Eˣ, IsUniformizer E π → ∃ s : Additive 𝓀[E]ˣ →+ milnorK E 2,
        (∀ u : 𝓀[E]ˣ, s (Additive.ofMul u) = symbol ![omega E u, π]) ∧
          IsCompl (integersMap E).range s.range ∧ s.range = AddCommGroup.torsion (milnorK E 2) := by
  sorry

/-- **Moore's theorem in characteristic `0`**
(`KTheoryFiniteLocalFields:L.3/moore-mixed-characteristic`), `E/ℚ_p` finite with residue field
`𝔽_q`: `w = (q − 1)·#μ_{p^∞}(E)`; `K₂(E)_tors ≅ μ(E)` has order `w`; `K₂(𝒪)_tors ≅ μ_{p^∞}(E)`;
`K₂(E) = j(K₂(𝒪)) ⊕ s(kˣ)`; and the K-book's printed `K₂(E) ≅ U₂ ⊕ 𝔽_qˣ` (torsion of order `q −
1`) holds exactly when `μ_p ⊄ E`. -/
theorem moore_mixed_characteristic [CharZero E] (p : ℕ) [Fact p.Prime] [CharP 𝓀[E] p] :
    muCard E = (resCard E - 1) * Nat.card (CommGroup.primaryComponent Eˣ p) ∧
      Nat.card (AddCommGroup.torsion (milnorK E 2)) = muCard E ∧
      Nat.card ((integersMap E).range ⊓ AddCommGroup.torsion (milnorK E 2) : AddSubgroup _) =
        Nat.card (CommGroup.primaryComponent Eˣ p) ∧
      (∀ π : Eˣ, IsUniformizer E π → ∃ s : Additive 𝓀[E]ˣ →+ milnorK E 2,
        (∀ u : 𝓀[E]ˣ, s (Additive.ofMul u) = symbol ![omega E u, π]) ∧
          IsCompl (integersMap E).range s.range) ∧
      (Nat.card (AddCommGroup.torsion (milnorK E 2)) = resCard E - 1 ↔
        ∀ ζ : Eˣ, ζ ^ p = 1 → ζ = 1) := by
  sorry

end MooreVariants

end TauCeti.KTheoryFiniteLocal

/-! ## `KTheoryFiniteLocalFields:L.4` — topological Hochschild homology (Hesselholt–Madsen)

Stage L.4 builds Hesselholt–Madsen's `T(C)`, `TR^n(C;p)`, `TC(C;p)`, Connes' operator, the Tate
spectral sequence and the spectra `T(A|K)`, `T(A)`, `T(k)` of a discrete valuation ring. Neither
pinned library has spectra, orthogonal `𝕋`-spectra, cyclotomic structures, genuine fixed points,
Waldhausen categories or Hochschild homology, so every statement about those objects is a comment
naming the missing carrier and its supplier (RefinedTraceMethods RT.1–RT.3, StableHomotopyKTheory
H.6, GeneralAlgebraicKTheory K.1/K.4). What *is* statable is stated honestly:

* Hesselholt–Madsen's model of Tate cohomology (`L.4/tate-cohomology-hm-model`), over Mathlib's
  `Rep k G`, with its comparison to Mathlib's `tateCohomology` and `groupCohomology`, its
  low-degree exact sequence, its cup product, and the odd cyclic calculation of
  `L.4/tate-cohomology-ring-of-odd-cyclic-group`;
* the homological lemma `L.4/torsion-homology-complex-replacement`, with Mathlib's
  `HomologicalComplex` and `QuasiIso`;
* the Witt-vector half of the tests that only concern `π₀ TR^n = W_n` (`TruncatedWittVector`,
  `WittVector.frobenius`, `WittVector.verschiebung`, `WittVector.teichmuller`), and the
  Kähler-differential half of the Connes-operator test. The spectrum half of each such test is
  named in its comment.

Indexing (pinned by the packet): `TR^n(C;p)` uses `C_{p^{n-1}}`, so `π₀ TR^n(A;p) = W_n(A)`, which
is Mathlib's `TruncatedWittVector p n A`. -/

namespace TauCeti.HM

/-! ### `L.4/thh-of-linear-waldhausen-category` -/

/- `TauCeti.HM.thhSpectrum`: not stated here; needs symmetric orthogonal `𝕋`-spectra, Bökstedt's
topological Hochschild spaces of linear categories and small linear Waldhausen categories with
the iterated `S`-construction (supplier: RefinedTraceMethods RT.2; GeneralAlgebraicKTheory K.4).
`TauCeti.HM.thhSpectrum.map`: not stated here; needs `T(C)` and exact linear functors (supplier:
RefinedTraceMethods RT.2; GeneralAlgebraicKTheory K.4).
`TauCeti.HM.thhSpectrum.zeroZero`: not stated here; needs `T(C)` and the geometric realisation of
the cyclic bar construction of `N^w_• C` (supplier: RefinedTraceMethods RT.2).
`TauCeti.HM.thhSpectrum.cyclotomic`: not stated here; needs genuine `C_{p^s}`-fixed points,
geometric fixed points and cyclotomic structure maps (supplier: RefinedTraceMethods RT.2).
`TauCeti.HM.thhSpectrum.trace`: not stated here; needs Waldhausen's `K(C)` and the `𝕋`-fixed
points of `T(C)` (supplier: RefinedTraceMethods RT.3; GeneralAlgebraicKTheory K.4).
`TauCeti.HM.thhSpectrum.ringOfSymmetricMonoidal`: not stated here; needs commutative monoids in
symmetric orthogonal `𝕋`-spectra (supplier: RefinedTraceMethods RT.2).
`TauCeti.HM.thhSpectrum.natIsoHomotopy`: not stated here; needs homotopies of maps of
`𝕋`-spectra and `T(f)` (supplier: RefinedTraceMethods RT.2).
`TauCeti.HM.thhSpectrum.equivProjective`: not stated here; needs `T(P_R)` and the `THH` of the
`E₁`-ring `HR` as cyclotomic spectra (supplier: RefinedTraceMethods RT.2). -/

-- test TauCeti.HM.thhSpectrum_trivial (degenerate): not stated here; needs `T(C)` and
-- contractibility of spectra (supplier: RefinedTraceMethods RT.2).
-- test TauCeti.HM.thhSpectrum_Fp (computation): not stated here; needs `π_* T(P_{𝔽_p})` and
-- Bökstedt periodicity (supplier: RefinedTraceMethods RT.2; node L.5/thh-of-perfect-field).
-- test TauCeti.HM.thhSpectrum_projective_eq_thh (compatibility): not stated here; needs
-- `π₀ T(P_R)` and `π₁ T(P_R)` (supplier: RefinedTraceMethods RT.1/RT.2); the targets `R/[R,R]`
-- and `Ω[R⁄ℤ]` exist in Mathlib, the source does not.
-- test TauCeti.HM.thhSpectrum_not_localization_invariant (non-example): not stated here; needs
-- mod-`p` homotopy of `T(C^b_q(P_{ℤ_p}))` and of `THH(ℚ_p)` (supplier: RefinedTraceMethods RT.2;
-- StableHomotopyKTheory H.6).

/-! ### `L.4/thh-structure-maps-f-equivalences` -/

/- `KTheoryFiniteLocalFields:L.4/thh-structure-maps-f-equivalences`
(`TauCeti.KTheoryFiniteLocal.thh_structure_maps_f_equivalences`): not stated here; needs the
spaces `T(C)_{n,V}`, their structure maps and `F`-equivalences of `𝕋`-spaces (supplier:
RefinedTraceMethods RT.2). -/

/-! ### `L.4/tr-pro-spectrum` -/

/- `TauCeti.HM.trSpectrum`: not stated here; needs the genuine `C_{p^{n-1}}`-fixed-point spectra
of `T(C)` and the root isomorphism (supplier: RefinedTraceMethods RT.2).
`TauCeti.HM.trSpectrum.one`: not stated here; needs `TR^1(C;p)` and `T(C)` (supplier:
RefinedTraceMethods RT.2).
`TauCeti.HM.trSpectrum.restriction`: not stated here; needs the cyclotomic structure map on fixed
points (supplier: RefinedTraceMethods RT.2).
`TauCeti.HM.trSpectrum.frobenius`: not stated here; needs inclusions of fixed-point spectra
(supplier: RefinedTraceMethods RT.2).
`TauCeti.HM.trSpectrum.verschiebung`: not stated here; needs transfers of fixed-point spectra
(supplier: RefinedTraceMethods RT.2).
`TauCeti.HM.trSpectrum.circleAction`: not stated here; needs the residual `𝕋`-action on
`TR^n(C;p)` (supplier: RefinedTraceMethods RT.2).
`TauCeti.HM.trSpectrum.frobenius_restriction`: not stated here; needs `R`, `F`, `V` as maps of
spectra (supplier: RefinedTraceMethods RT.2).
`TauCeti.HM.trSpectrum.frobenius_verschiebung`: not stated here; needs `π_* TR^n(C;p)` with `F`
and `V` (supplier: RefinedTraceMethods RT.2). Its Witt-vector shadow in degree `0` is Mathlib's
`WittVector.frobenius_verschiebung` (`F (V x) = x * p`).
`TauCeti.HM.trSpectrum.trace`: not stated here; needs `K(C)` and pro-spectra (supplier:
RefinedTraceMethods RT.3).
`TauCeti.HM.trSpectrum.map`: not stated here; needs `TR^n(C;p)` and exact functors (supplier:
RefinedTraceMethods RT.2; GeneralAlgebraicKTheory K.4).
`TauCeti.HM.trSpectrum.indexShift`: not stated here; needs `TR^n(C;p)` and the fixed points
`X^{C_{p^{n-1}}}` of a genuine cyclotomic spectrum (supplier: RefinedTraceMethods RT.2). -/

-- test TauCeti.HM.trSpectrum_pi0_Fp (computation)
/- The Witt-vector half: `W₂(𝔽_p) ≅ ℤ/p²` (`TruncatedWittVector.zmodEquivTrunc`), under which the
restriction `R = TruncatedWittVector.truncate` is reduction modulo `p`; on `W(𝔽_p)` the Frobenius
is the identity, so `F` is reduction modulo `p` as well, and `V` is multiplication by `p`. The
identification with `π₀ TR²(P_{𝔽_p};p)` is not stated here; needs `TR^n` (supplier:
RefinedTraceMethods RT.2; node L.4/pi0-tr-is-witt-vectors). -/
example (p : ℕ) [Fact p.Prime] :
    (TruncatedWittVector.truncate (p := p) (R := ZMod p) (by norm_num : 1 ≤ 2)).comp
        (TruncatedWittVector.zmodEquivTrunc p 2).toRingHom =
      (TruncatedWittVector.zmodEquivTrunc p 1).toRingHom.comp
        (ZMod.castHom (pow_dvd_pow p (by norm_num : 1 ≤ 2)) _) ∧
    (∀ x : WittVector p (ZMod p), WittVector.frobenius x = x) ∧
    ∀ x : WittVector p (ZMod p), WittVector.verschiebung x = x * p := by
  sorry

-- test TauCeti.HM.trSpectrum_one_eq_thh (degenerate): not stated here; needs `TR^1(C;p)`, `T(C)`
-- and the Dennis trace `K(C) → T(C)` (supplier: RefinedTraceMethods RT.2/RT.3).
-- test TauCeti.HM.trSpectrum_pi0_witt (compatibility): not stated here; needs `π₀ TR^n(P_A;p)`
-- (supplier: RefinedTraceMethods RT.2); the target is Mathlib's `TruncatedWittVector p n A` with
-- restriction `TruncatedWittVector.truncate`.

-- test TauCeti.HM.trSpectrum_R_ne_F (non-example)
/- The Witt-vector half: for the Teichmüller vector `[2]` over `ℤ` at `p = 3`, the restriction
`R[2]₂ = [2]₁` and the Frobenius `F[2]₂ = [2³]₁ = [8]₁` differ, while `F[2] = [8]` in `W(ℤ)`. That
these are `R` and `F` on `π₀ TR²(P_ℤ;3)` is not stated here; needs `TR^n` (supplier:
RefinedTraceMethods RT.2). -/
example [Fact (Nat.Prime 3)] :
    WittVector.frobenius (WittVector.teichmuller 3 (2 : ℤ)) = WittVector.teichmuller 3 8 ∧
      WittVector.truncate (p := 3) 1 (WittVector.frobenius (WittVector.teichmuller 3 (2 : ℤ))) ≠
        WittVector.truncate (p := 3) 1 (WittVector.teichmuller 3 (2 : ℤ)) := by
  sorry

/-! ### `L.4/norm-restriction-cofibre-sequence` -/

/- `KTheoryFiniteLocalFields:L.4/norm-restriction-cofibre-sequence`
(`TauCeti.KTheoryFiniteLocal.norm_restriction_cofibre_sequence`): not stated here; needs
homotopy-orbit, homotopy-fixed-point and Tate spectra of `𝕋`-spectra, cofibration sequences and
the maps `Γ`, `Γ̂` (supplier: RefinedTraceMethods RT.2). -/

/-! ### `L.4/p-typical-tc` -/

/- `TauCeti.HM.trLimit`: not stated here; needs homotopy limits of spectra and `TR^n(C;p)`
(supplier: RefinedTraceMethods RT.2).
`TauCeti.HM.trLimit.milnor`: not stated here; needs `π_*` of a homotopy limit of spectra and
`lim¹` (supplier: RefinedTraceMethods RT.2; StableHomotopyKTheory H.6).
`TauCeti.HM.tc`: not stated here; needs homotopy fibres of maps of spectra and `TR(C;p)`
(supplier: RefinedTraceMethods RT.2).
`TauCeti.HM.tc.longExact`: not stated here; needs `TC_q(C;p)` and `TR_q(C;p)` (supplier:
RefinedTraceMethods RT.2).
`TauCeti.HM.tc.trace`: not stated here; needs `K(C)` and `TC(C;p)` (supplier: RefinedTraceMethods
RT.3).
`TauCeti.HM.tc.map`: not stated here; needs `TC(C;p)` and exact functors (supplier:
RefinedTraceMethods RT.2; GeneralAlgebraicKTheory K.4).
`TauCeti.HM.tc.ring`: not stated here; needs ring spectra (supplier: RefinedTraceMethods RT.2).
`TauCeti.HM.tc.coefficients`: not stated here; needs the mod-`m` Moore spectrum and smash products
(supplier: StableHomotopyKTheory H.6; RefinedTraceMethods RT.2).
`TauCeti.HM.tc.equivNS`: not stated here; needs Nikolaus–Scholze's `TC(X,p)` of a bounded-below
cyclotomic spectrum (supplier: RefinedTraceMethods RT.2). -/

-- test TauCeti.HM.tc_Fp (computation)
/- The Witt-vector half: `TR_0(𝔽_p;p) = W(𝔽_p) ≅ ℤ_p` (`WittVector.equiv`) and `F = id` on it, so
`ker (1 - F) = W(𝔽_p)` and `coker (1 - F) = W(𝔽_p)`, i.e. `TC₀ ≅ TC₋₁ ≅ ℤ_p`. The groups
`TC_q(P_{𝔽_p};p)` themselves are not stated here; need `TC(C;p)` (supplier: RefinedTraceMethods
RT.2). -/
example (p : ℕ) [Fact p.Prime] :
    (∀ x : WittVector p (ZMod p), x - WittVector.frobenius x = 0) ∧
      Nonempty (WittVector p (ZMod p) ≃+* ℤ_[p]) := by
  sorry

-- test TauCeti.HM.tc_Fpbar (computation)
/- The Witt-vector half: for `k` algebraically closed of characteristic `p`, `1 - F` is surjective
on `W(k)`, so `TC₋₁(P_k;p) = coker (1 - F) = 0`. That `TC(P_k;p) ≃ HZ_p` is not stated here;
needs `TC(C;p)` and Eilenberg–Mac Lane spectra (supplier: RefinedTraceMethods RT.2). -/
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] :
    Function.Surjective fun x : WittVector p k => x - WittVector.frobenius x := by
  sorry

-- test TauCeti.HM.tc_not_connective (non-example): not stated here; needs `TC₋₁(P_{𝔽_p};p)` and
-- `K₋₁` (supplier: RefinedTraceMethods RT.2; GeneralAlgebraicKTheory K.1).

-- test TauCeti.HM.tc_R_minus_F (characterisation)
/- The Witt-vector half of the finite-level remark: on `W₂(𝔽_p) ≅ ℤ/p²` the restriction and the
Frobenius to `W₁(𝔽_p)` agree (both are reduction), so `R - F = 0` there and the finite-level fibre
has `π₀ = ℤ/p^n`, `π₋₁ = ℤ/p^{n-1}`, which is not `TC`. The homotopy-equaliser description of
`TC(C;p)` is not stated here; needs `TR(C;p)` and `TC(C;p)` (supplier: RefinedTraceMethods RT.2).
-/
example (p : ℕ) [Fact p.Prime] (x : WittVector p (ZMod p)) :
    WittVector.truncate (p := p) 1 (WittVector.frobenius x) = WittVector.truncate (p := p) 1 x := by
  sorry

/-! ### `L.4/connes-operator` -/

/- `TauCeti.HM.connesOperator`: not stated here; needs `𝕋`-spectra, their homotopy groups and
`σ[𝕋] ∈ π^S_1(𝕋_+)` (supplier: RefinedTraceMethods RT.2; StableHomotopyKTheory H.6).
`TauCeti.HM.connesOperator.map`: not stated here; needs maps of `𝕋`-spectra (supplier:
RefinedTraceMethods RT.2).
`TauCeti.HM.connesOperator_comp`: not stated here; needs `d` and the Hopf class `η ∈ π^S_1`
(supplier: StableHomotopyKTheory H.6; RefinedTraceMethods RT.2).
`TauCeti.HM.connesOperator_sq_eq_zero`: not stated here; needs `d` and `η` (supplier:
StableHomotopyKTheory H.6; RefinedTraceMethods RT.2).
`TauCeti.HM.connesOperator_derivation`: not stated here; needs ring `𝕋`-spectra (supplier:
RefinedTraceMethods RT.2).
`TauCeti.HM.connesOperator_hochschild`: not stated here; needs `HH_*(A)` and Connes' `B`
(supplier: RefinedTraceMethods RT.1); on `HH₀ = A` the target `d a ∈ Ω¹_A` is Mathlib's
`KaehlerDifferential.D ℤ A a`. -/

-- test TauCeti.HM.connesOperator_Fp (computation): not stated here; needs
-- `π_*(T(𝔽_p);ℤ/p) = Λ{ε} ⊗ S{σ}` and the Bockstein (supplier: RefinedTraceMethods RT.2;
-- StableHomotopyKTheory H.6).
-- test TauCeti.HM.connesOperator_trivialAction (degenerate): not stated here; needs `𝕋`-spectra
-- with the trivial action (supplier: RefinedTraceMethods RT.2).

-- test TauCeti.HM.connesOperator_HH_polynomial (compatibility)
/- The Kähler half: `d x = dx` is the nonzero element `KaehlerDifferential.D ℤ ℤ[X] X` of
`Ω¹_{ℤ[x]}` (free on `dx`). The identification `HH₁(ℤ[x]) ≅ Ω¹_{ℤ[x]}` and Connes' operator on
`HH₀` are not stated here; need `HH_*` (supplier: RefinedTraceMethods RT.1). -/
example : KaehlerDifferential.D ℤ (Polynomial ℤ) Polynomial.X ≠ 0 := by
  sorry

-- test TauCeti.HM.connesOperator_not_differential_p2 (non-example): not stated here; needs
-- `TR^n(ℤ_(2);2)`, `η` and `dlog(-1)` in `TR^n_1` (supplier: RefinedTraceMethods RT.2;
-- StableHomotopyKTheory H.6).

/-! ### `L.4/moore-spectrum-splitting-for-hz-modules` -/

/- `KTheoryFiniteLocalFields:L.4/moore-spectrum-splitting-for-hz-modules`
(`TauCeti.KTheoryFiniteLocal.moore_spectrum_splitting_for_hz_modules`): not stated here; needs
the mod-`m` Moore spectrum, `HZ/m`-module spectra and smash products (supplier:
StableHomotopyKTheory H.6). -/

/-! ### `L.4/tr-homotopy-orbit-spectral-sequence` -/

/- `KTheoryFiniteLocalFields:L.4/tr-homotopy-orbit-spectral-sequence`
(`TauCeti.KTheoryFiniteLocal.tr_homotopy_orbit_spectral_sequence`): not stated here; needs
homotopy-orbit spectra of `T(C)`, the homotopy-orbit spectral sequence and `F^{n-1} : W_n(A) → A`
on truncated Witt vectors (supplier: RefinedTraceMethods RT.2; StableHomotopyKTheory H.6;
CrystallineCohomology CR.4). -/

/-! ### `L.4/pi0-tr-is-witt-vectors` -/

/- `KTheoryFiniteLocalFields:L.4/pi0-tr-is-witt-vectors` (`pi0_tr_is_witt_vectors`): not stated
here; needs `π₀ TR^n(A;p) = π₀ T(A)^{C_{p^{n-1}}}` with `R`, `F`, `V` and the edgewise-subdivision
maps `Δ_r` (supplier: RefinedTraceMethods RT.2), and `F`, `V` on Mathlib's
`TruncatedWittVector p n A` (supplier: CrystallineCohomology CR.4). The Witt-vector side of its
acceptance (`R[a]_n = [a]_{n-1}`, `F[a]_n = [a^p]_{n-1}`) is stated below on untruncated Witt
vectors, where Mathlib has `F`. -/

end TauCeti.HM

namespace TauCeti.KTheoryFiniteLocal

/-- The Witt-vector side of `KTheoryFiniteLocalFields:L.4/pi0-tr-is-witt-vectors` on Teichmüller
representatives: restriction of `[a]_n` is `[a]_{n-1}` and the Frobenius of `[a]` is `[a^p]`, for
every commutative ring (the identity holds over `ℤ[X]`, which has no `p`-torsion). -/
theorem pi0_tr_is_witt_vectors_teichmuller (p : ℕ) [Fact p.Prime] {A : Type u} [CommRing A]
    (a : A) (n : ℕ) :
    TruncatedWittVector.truncate (p := p) (R := A) (Nat.le_succ n)
        (WittVector.truncate (n + 1) (WittVector.teichmuller p a)) =
      WittVector.truncate n (WittVector.teichmuller p a) ∧
      WittVector.frobenius (WittVector.teichmuller p a) = WittVector.teichmuller p (a ^ p) := by
  sorry

end TauCeti.KTheoryFiniteLocal

namespace TauCeti.HM

/-! ### `L.4/hm-conventions-agree-with-nikolaus-scholze` -/

/- `KTheoryFiniteLocalFields:L.4/hm-conventions-agree-with-nikolaus-scholze`
(`TauCeti.KTheoryFiniteLocal.hm_conventions_agree_with_nikolaus_scholze`): not stated here; needs
genuine and Nikolaus–Scholze cyclotomic spectra, `TR`, `TC^gen` and `TC(X,p)` (supplier:
RefinedTraceMethods RT.2). -/

/-! ### `L.4/integral-and-p-typical-tc-agree-after-completion` -/

/- `KTheoryFiniteLocalFields:L.4/integral-and-p-typical-tc-agree-after-completion`
(`TauCeti.KTheoryFiniteLocal.integral_and_p_typical_tc_agree_after_completion`): not stated here;
needs integral and `p`-typical `TC` of a cyclotomic spectrum and `p`-completion of spectra
(supplier: RefinedTraceMethods RT.2; StableHomotopyKTheory H.6). -/

/-! ### `L.4/log-thh-bounded-below` -/

/- `KTheoryFiniteLocalFields:L.4/log-thh-bounded-below`
(`TauCeti.KTheoryFiniteLocal.log_thh_bounded_below`): not stated here; needs the `𝕋`-spectra
`T(k)`, `T(A)`, `T(A|K)` and connectivity of spectra (supplier: RefinedTraceMethods RT.2; node
L.4/thh-of-dvr-with-log-poles). -/

/-! ### `L.4/tate-cohomology-hm-model` — Hesselholt–Madsen's model of Tate cohomology

Everything here is over Mathlib's `Rep k G` for a finite group `G` and a commutative ring `k`
(Mathlib's Tate cohomology takes `k` and `G` in one universe, so the model does too). The complex
is built from an arbitrary projective resolution `ε : P → k` of the trivial representation
`𝟙_ (Rep k G) = Rep.trivial k G k`; the answer is independent of `P`, as the comparison with
Mathlib's complete-resolution model `tateCohomology` records. -/

section TateHM

open CategoryTheory CategoryTheory.Limits MonoidalCategory

variable {k G : Type u} [CommRing k] [Group G] [Fintype G]

/-- **Hesselholt–Madsen's Tate complex** `TauCeti.HM.tateComplex`
(`KTheoryFiniteLocalFields:L.4/tate-cohomology-hm-model`):
for a projective resolution `ε : P → k` of the trivial representation, with mapping cone `P̃`, the
complex `(P̃ ⊗ Hom(P, M))^G` of `k`-modules — the total complex of the tensor product of the cone
with the `Hom`-complex, followed by `G`-invariants — indexed homologically by `ℤ`. -/
def tateComplex (P : ProjectiveResolution (𝟙_ (Rep.{u} k G))) (M : Rep.{u} k G) :
    ChainComplex (ModuleCat.{u} k) ℤ :=
  sorry

/-- **Hesselholt–Madsen Tate cohomology** `TauCeti.HM.tateCohomology`,
`Ĥⁿ(G, M) := H_{-n}((P̃ ⊗ Hom(P, M))^G)` (a real definition from the Tate complex). -/
def tateCohomology (P : ProjectiveResolution (𝟙_ (Rep.{u} k G))) (M : Rep.{u} k G) (n : ℤ) :
    ModuleCat.{u} k :=
  (tateComplex P M).homology (-n)

variable (P : ProjectiveResolution (𝟙_ (Rep.{u} k G)))

/-- `TauCeti.HM.tateCohomology.map`, functoriality in the coefficients: a `kG`-linear map `M → M'`
induces `Ĥⁿ(G, M) → Ĥⁿ(G, M')`. -/
def tateCohomology.map {M M' : Rep.{u} k G} (f : M ⟶ M') (n : ℤ) :
    tateCohomology P M n ⟶ tateCohomology P M' n :=
  sorry

@[simp]
theorem tateCohomology.map_id (M : Rep.{u} k G) (n : ℤ) :
    tateCohomology.map P (𝟙 M) n = 𝟙 _ := by
  sorry

theorem tateCohomology.map_comp {M M' M'' : Rep.{u} k G} (f : M ⟶ M') (g : M' ⟶ M'') (n : ℤ) :
    tateCohomology.map P (f ≫ g) n = tateCohomology.map P f n ≫ tateCohomology.map P g n := by
  sorry

/-- `Ĥⁿ(G, -)` as a functor `Rep k G ⥤ ModuleCat k` (the carrier of the naturality statements). -/
def tateCohomologyFunctor (n : ℤ) : Rep.{u} k G ⥤ ModuleCat.{u} k where
  obj M := tateCohomology P M n
  map f := tateCohomology.map P f n
  map_id M := tateCohomology.map_id P M n
  map_comp f g := tateCohomology.map_comp P f g n

/-- `TauCeti.HM.tateCohomology.isoTateCohomology`, **agreement with Mathlib's Tate cohomology**:
`Ĥⁿ(G, M) ≅ tateCohomology M n`, naturally in `M` (HM Lemma 4.1.2: both compute Tate cohomology
through a complete resolution). -/
def tateCohomology.isoTateCohomology (n : ℤ) :
    tateCohomologyFunctor P n ≅ _root_.tateCohomologyFunctor n :=
  sorry

/-- `TauCeti.HM.tateCohomology.isoGroupCohomology`, **agreement with group cohomology in positive
degrees**: `Ĥⁿ(G, M) ≅ Hⁿ(G, M)` for `n ≥ 1`, naturally in `M`. -/
def tateCohomology.isoGroupCohomology (n : ℕ) [NeZero n] :
    tateCohomologyFunctor P n ≅ groupCohomology.functor k G n :=
  sorry

/-- The boundary `∂ : Ĥ⁻¹(G, M) → H₀(G, M)` of HM's low-degree sequence. -/
def tateCohomology.boundaryNegOne (M : Rep.{u} k G) :
    tateCohomology P M (-1) ⟶ groupHomology M 0 :=
  sorry

/-- The norm map `N : H₀(G, M) → H⁰(G, M)`, induced by `m ↦ ∑_g g·m` from coinvariants to
invariants. -/
def tateCohomology.normZero (M : Rep.{u} k G) : groupHomology M 0 ⟶ groupCohomology M 0 :=
  sorry

/-- The map `H⁰(G, M) → Ĥ⁰(G, M)` of HM's low-degree sequence. -/
def tateCohomology.projZero (M : Rep.{u} k G) :
    groupCohomology M 0 ⟶ tateCohomology P M 0 :=
  sorry

/-- `TauCeti.HM.tateCohomology.lowDegreeExact`, **the low-degree exact sequence** `0 → Ĥ⁻¹(G, M) →∂
H₀(G, M) →N H⁰(G, M) → Ĥ⁰(G, M) → 0`, where `N` is the norm, read on the classes of elements of
`M`: `N [m] = ∑_g g·m` (through Mathlib's `groupHomology.H0π` and `groupCohomology.H0Iso`). -/
theorem tateCohomology.lowDegreeExact (M : Rep.{u} k G) :
    Function.Injective (tateCohomology.boundaryNegOne P M) ∧
      LinearMap.range (tateCohomology.boundaryNegOne P M).hom =
        LinearMap.ker (tateCohomology.normZero M).hom ∧
      LinearMap.range (tateCohomology.normZero M).hom =
        LinearMap.ker (tateCohomology.projZero P M).hom ∧
      Function.Surjective (tateCohomology.projZero P M) ∧
      ∀ m : M.V, ((groupCohomology.H0Iso M).hom
        (tateCohomology.normZero M (groupHomology.H0π M m)) : M.V) = M.ρ.norm m := by
  sorry

/-- Transport along an equality of degrees (a real definition). -/
def tateCohomology.castDeg (M : Rep.{u} k G) {m n : ℤ} (h : m = n) :
    tateCohomology P M m ≅ tateCohomology P M n :=
  eqToIso (by rw [h])

/-- `TauCeti.HM.tateCohomology.cup`, **the cup product**
`Ĥᵐ(G, M) ⊗ Ĥⁿ(G, M') → Ĥ^{m+n}(G, M ⊗ M')`, induced by chosen chain maps `P → P ⊗ P` and
`P̃ ⊗ P̃ → P̃` lifting `k ≅ k ⊗ k`. -/
def tateCohomology.cup (M M' : Rep.{u} k G) (m n : ℤ) :
    tateCohomology P M m →ₗ[k] tateCohomology P M' n →ₗ[k] tateCohomology P (M ⊗ M') (m + n) :=
  sorry

/-- The unit `1 ∈ Ĥ⁰(G, k)`, the class of `y₀ ⊗ N x₀^*`. -/
def tateCohomology.one : tateCohomology P (𝟙_ (Rep.{u} k G)) 0 :=
  sorry

/-- `TauCeti.HM.tateCohomology.cup_assoc`, **associativity and unit of the cup product** (the unit
being the class of `y₀ ⊗ N x₀^*`), read through the associator and the left unitor of `Rep k G`. -/
theorem tateCohomology.cup_assoc (M₁ M₂ M₃ : Rep.{u} k G) {l m n : ℤ}
    (x : tateCohomology P M₁ l) (y : tateCohomology P M₂ m) (z : tateCohomology P M₃ n) :
    (tateCohomology.castDeg P (M₁ ⊗ (M₂ ⊗ M₃)) (add_assoc l m n)).hom
        ((tateCohomology.map P (α_ M₁ M₂ M₃).hom (l + m + n))
          (tateCohomology.cup P (M₁ ⊗ M₂) M₃ (l + m) n
            (tateCohomology.cup P M₁ M₂ l m x y) z)) =
      tateCohomology.cup P M₁ (M₂ ⊗ M₃) l (m + n) x (tateCohomology.cup P M₂ M₃ m n y z) ∧
    ∀ w : tateCohomology P M₁ l,
      (tateCohomology.castDeg P M₁ (zero_add l)).hom
        ((tateCohomology.map P (λ_ M₁).hom (0 + l))
          (tateCohomology.cup P (𝟙_ (Rep.{u} k G)) M₁ 0 l (tateCohomology.one P) w)) = w := by
  sorry

/-- **Graded commutativity** of the cup product, through the braiding of `Rep k G`. -/
theorem tateCohomology.cup_comm (M M' : Rep.{u} k G) {m n : ℤ} (x : tateCohomology P M m)
    (y : tateCohomology P M' n) :
    (tateCohomology.castDeg P (M' ⊗ M) (add_comm m n)).hom
        ((tateCohomology.map P (β_ M M').hom (m + n)) (tateCohomology.cup P M M' m n x y)) =
      ((-1 : k) ^ (m * n).natAbs) • tateCohomology.cup P M' M n m y x := by
  sorry

/-- The cup product with trivial coefficients, `Ĥᵐ(G, k) ⊗ Ĥⁿ(G, k) → Ĥ^{m+n}(G, k)` (a real
definition: the cup product followed by the unitor `k ⊗ k ≅ k`). -/
def tateCohomology.cupTrivial (m n : ℤ) :
    tateCohomology P (𝟙_ (Rep.{u} k G)) m →ₗ[k] tateCohomology P (𝟙_ (Rep.{u} k G)) n →ₗ[k]
      tateCohomology P (𝟙_ (Rep.{u} k G)) (m + n) :=
  (tateCohomology.cup P (𝟙_ (Rep.{u} k G)) (𝟙_ (Rep.{u} k G)) m n).compr₂
    (tateCohomology.map P (λ_ (𝟙_ (Rep.{u} k G))).hom (m + n)).hom

end TateHM

section TateHMTests

open CategoryTheory CategoryTheory.Limits MonoidalCategory

-- test TauCeti.HM.tateCohomology_C3_F3 (computation)
/- For `G = C₃` (as `Multiplicative (ZMod 3)`) and `k = M = 𝔽₃`, `Ĥⁿ(C₃, 𝔽₃) ≅ 𝔽₃` for every
`n ∈ ℤ`. -/
example (P : ProjectiveResolution (𝟙_ (Rep.{0} (ZMod 3) (Multiplicative (ZMod 3))))) (n : ℤ) :
    Nonempty (tateCohomology P (𝟙_ (Rep.{0} (ZMod 3) (Multiplicative (ZMod 3)))) n ≃ₗ[ZMod 3]
      ZMod 3) := by
  sorry

-- test TauCeti.HM.tateCohomology_trivialGroup (degenerate)
/- For the trivial group every Tate group vanishes. -/
example {k G : Type u} [CommRing k] [Group G] [Fintype G] [Subsingleton G]
    (P : ProjectiveResolution (𝟙_ (Rep.{u} k G))) (M : Rep.{u} k G) (n : ℤ) :
    IsZero (tateCohomology P M n) := by
  sorry

-- test TauCeti.HM.tateCohomology_eq_mathlib (compatibility)
/- For `G = C₅` and `M = ℤ` with the trivial action: `Ĥ⁰ ≅ ℤ/5` and `Ĥ⁻¹ = 0`, as for Mathlib's
`tateCohomology` (Tau Ceti's `TauCeti.TateCohomology.H0LinearEquivTrivialIntZModCard`, composed
with `isoTateCohomology`, is the degree-zero isomorphism). -/
example (P : ProjectiveResolution (𝟙_ (Rep.{0} ℤ (Multiplicative (ZMod 5))))) :
    Nonempty (tateCohomology P (Rep.trivial ℤ (Multiplicative (ZMod 5)) ℤ) 0 ≃ₗ[ℤ] ZMod 5) ∧
      IsZero (tateCohomology P (Rep.trivial ℤ (Multiplicative (ZMod 5)) ℤ) (-1)) ∧
      Nat.card (_root_.tateCohomology (Rep.trivial ℤ (Multiplicative (ZMod 5)) ℤ) 0) = 5 := by
  sorry

-- test TauCeti.HM.tateCohomology_not_groupHomology (non-example)
/- `Ĥ⁰(C₂, ℤ) ≅ ℤ/2`, while `H⁰(C₂, ℤ) ≅ ℤ` and `H₀(C₂, ℤ) ≅ ℤ`. -/
example (P : ProjectiveResolution (𝟙_ (Rep.{0} ℤ (Multiplicative (ZMod 2))))) :
    Nat.card (tateCohomology P (Rep.trivial ℤ (Multiplicative (ZMod 2)) ℤ) 0) = 2 ∧
      Nonempty (groupCohomology (Rep.trivial ℤ (Multiplicative (ZMod 2)) ℤ) 0 ≃ₗ[ℤ] ℤ) ∧
      Nonempty (groupHomology (Rep.trivial ℤ (Multiplicative (ZMod 2)) ℤ) 0 ≃ₗ[ℤ] ℤ) := by
  sorry

end TateHMTests

end TauCeti.HM

namespace TauCeti.KTheoryFiniteLocal

open CategoryTheory CategoryTheory.Limits MonoidalCategory TauCeti.HM

/-! ### `L.4/tate-cohomology-ring-of-odd-cyclic-group` -/

/-- **Tate cohomology of a cyclic group of odd order with coefficients killed by its order**
(`KTheoryFiniteLocalFields:L.4/tate-cohomology-ring-of-odd-cyclic-group`). Let `C` be cyclic of odd
order `r` and `k` a commutative ring with `r = 0` in `k`. There are classes `t ∈ Ĥ²(C, k)` and
`u ∈ Ĥ¹(C, k)` (here `u₁`) with `Ĥ*(C, k) = Λ{u} ⊗ S{t^{±1}}` as graded `k`-algebras: the cup
product with `t` is bijective in every degree (so `t` has an inverse `t⁻¹ ∈ Ĥ⁻²`), `u² = 0`, and
`Ĥ⁰(C, k) = k · 1`, `Ĥ¹(C, k) = k · u` are free of rank one; and the boundary
`∂ : Ĥ⁻¹(C, k) → H₀(C, k) = k` takes `u t⁻¹` to the class of `-1` (Addendum 4.2.2). The packet's
representatives `y₀ ⊗ N x₂^*`, `y₀ ⊗ N x₁^*` refer to the standard resolution; for an arbitrary
resolution `P` the classes are asserted to exist. -/
theorem tate_cohomology_ring_of_odd_cyclic_group {k G : Type u} [CommRing k] [Group G] [Fintype G]
    [IsCyclic G] (hodd : Odd (Nat.card G)) (hk : (Nat.card G : k) = 0)
    (P : ProjectiveResolution (𝟙_ (Rep.{u} k G))) :
    ∃ (t : tateCohomology P (𝟙_ (Rep.{u} k G)) 2) (u₁ : tateCohomology P (𝟙_ (Rep.{u} k G)) 1)
      (tinv : tateCohomology P (𝟙_ (Rep.{u} k G)) (-2)),
      (∀ n : ℤ, Function.Bijective (tateCohomology.cupTrivial P 2 n t)) ∧
      tateCohomology.cupTrivial P 1 1 u₁ u₁ = 0 ∧
      Function.Bijective (fun a : k => a • tateCohomology.one P) ∧
      Function.Bijective (fun a : k => a • u₁) ∧
      (tateCohomology.castDeg P _ (by norm_num : (2 : ℤ) + -2 = 0)).hom
        (tateCohomology.cupTrivial P 2 (-2) t tinv) = tateCohomology.one P ∧
      tateCohomology.boundaryNegOne P _ ((tateCohomology.castDeg P _
          (by norm_num : (1 : ℤ) + -2 = -1)).hom (tateCohomology.cupTrivial P 1 (-2) u₁ tinv)) =
        groupHomology.H0π (𝟙_ (Rep.{u} k G)) (show (𝟙_ (Rep.{u} k G)).V from (-1 : k)) := by
  sorry

end TauCeti.KTheoryFiniteLocal

namespace TauCeti.HM

/-! ### `L.4/multiplicative-tate-spectral-sequence` -/

/- `TauCeti.HM.tateSpectralSequence`: not stated here; needs `G`-spectra, the Tate spectrum
`(Ẽ ∧ F(E_+, T))^G`, the filtration by sub-`G`-CW-spectra and spectral sequences of filtered
spectra (supplier: RefinedTraceMethods RT.2; StableHomotopyKTheory H.6). Its `E²`-term
`Ĥ^{-s}(G, π_t T)` is `TauCeti.HM.tateCohomology` above, once `π_t T` exists.
`TauCeti.HM.tateSpectralSequence.E1`: not stated here; needs `Ê¹(G, T)` and `π_t T` (supplier:
RefinedTraceMethods RT.2; StableHomotopyKTheory H.6); the target complex is the
`TauCeti.HM.tateComplex` of `π_t T`.
`TauCeti.HM.tateSpectralSequence.conditionallyConvergent`: not stated here; needs Boardman's
conditional convergence for spectral sequences of spectra (supplier: StableHomotopyKTheory H.6).
`TauCeti.HM.tateSpectralSequence.pairing`: not stated here; needs pairings of `G`-spectra and of
spectral sequences (supplier: RefinedTraceMethods RT.2; StableHomotopyKTheory H.6).
`TauCeti.HM.tateSpectralSequence.E2_cup`: not stated here; needs the pairing on `Ê²`; its target is
`TauCeti.HM.tateCohomology.cup` (supplier: RefinedTraceMethods RT.2).
`TauCeti.HM.tateSpectralSequence.map`: not stated here; needs maps of `G`-spectra and of spectral
sequences (supplier: RefinedTraceMethods RT.2; StableHomotopyKTheory H.6).
`TauCeti.HM.tateSpectralSequence.greenlees`: not stated here; needs Greenlees' `ℤ`-graded
filtration of `Ẽ` (supplier: RefinedTraceMethods RT.2). -/

-- test TauCeti.HM.tateSpectralSequence_Fp (computation): not stated here; needs `M_p ∧ T(𝔽_p)` and
-- its Tate spectral sequence (supplier: RefinedTraceMethods RT.2; StableHomotopyKTheory H.6).
-- test TauCeti.HM.tateSpectralSequence_trivialGroup (degenerate): not stated here; needs the Tate
-- spectrum of the trivial group (supplier: RefinedTraceMethods RT.2); its `E²`-vanishing is the
-- algebraic test `TauCeti.HM.tateCohomology_trivialGroup` above.
-- test TauCeti.HM.tateSpectralSequence_EM (compatibility): not stated here; needs the
-- Eilenberg–Mac Lane `C_p`-spectrum `H𝔽_p` and `π_* Ĥ(C_p, H𝔽_p)` (supplier: RefinedTraceMethods
-- RT.2; StableHomotopyKTheory H.6).

-- test TauCeti.HM.tateSpectrum_ne_fixedPoints (non-example)
/- The algebraic half: `π₀ Ĥ(C_p, HZ) = Ĥ⁰(C_p, ℤ)` has `p` elements, while
`π₀ F(E_+, HZ)^{C_p} = H⁰(C_p, ℤ) ≅ ℤ` (Mathlib's `tateCohomology` and `groupCohomology`). The two
spectra are not stated here; need `G`-spectra and homotopy fixed points (supplier:
RefinedTraceMethods RT.2). -/
example (p : ℕ) [Fact p.Prime] :
    Nat.card (_root_.tateCohomology (Rep.trivial ℤ (Multiplicative (ZMod p)) ℤ) 0) = p ∧
      Nonempty (groupCohomology (Rep.trivial ℤ (Multiplicative (ZMod p)) ℤ) 0 ≃ₗ[ℤ] ℤ) := by
  sorry

end TauCeti.HM

/-! ### `L.4/tate-spectral-sequence-connes-module` … `L.4/dundas-mccarthy-equivalence-criterion`

These nodes concern Tate spectral sequences of `𝕋`-spectra and the axiomatic functors `Φ` on
categories with cofibrations and weak equivalences (HM §1.3); none of their carriers exists. -/

/- `KTheoryFiniteLocalFields:L.4/tate-spectral-sequence-connes-module`
(`TauCeti.KTheoryFiniteLocal.tate_spectral_sequence_connes_module`): not stated here; needs the
Tate spectral sequence of a `𝕋`-spectrum as a module over `C_*(𝕋/C; k)` (supplier:
RefinedTraceMethods RT.2; StableHomotopyKTheory H.6).

`KTheoryFiniteLocalFields:L.4/tate-d2-is-connes-operator`
(`TauCeti.KTheoryFiniteLocal.tate_d2_is_connes_operator`): not stated here; needs `d²` of the Tate
spectral sequence and Connes' operator on `π_*` of a `𝕋`-spectrum (supplier: RefinedTraceMethods
RT.2; node L.4/connes-operator).

`KTheoryFiniteLocalFields:L.4/three-by-three-lemma`
(`TauCeti.KTheoryFiniteLocal.three_by_three_lemma`): not stated here; needs `3 × 3` diagrams of
cofibration sequences of spectra and their homotopy groups (supplier: StableHomotopyKTheory H.6).
(Mathlib's pretriangulated categories would carry an abstract version; the node is about `π_*` of
spectra with HM's sign conventions, which needs the stable homotopy category.)

`KTheoryFiniteLocalFields:L.4/exact-simplicial-homotopy-invariance`
(`TauCeti.KTheoryFiniteLocal.exact_simplicial_homotopy_invariance`): not stated here; needs
categories with cofibrations and weak equivalences, exact simplicial functors and functors `Φ` to
pointed spaces satisfying HM's axioms (i)–(iii) (supplier: GeneralAlgebraicKTheory K.4).

`KTheoryFiniteLocalFields:L.4/weak-equivalence-transformations-give-exact-homotopies`
(`TauCeti.KTheoryFiniteLocal.weak_equivalence_transformations_give_exact_homotopies`): not stated
here; needs the simplicial category `N^w_• C` and exact simplicial homotopies (supplier:
GeneralAlgebraicKTheory K.4).

`KTheoryFiniteLocalFields:L.4/isomorphism-nerve-degeneracy-equivalence`
(`TauCeti.KTheoryFiniteLocal.isomorphism_nerve_degeneracy_equivalence`): not stated here; needs
Waldhausen's `S_• C` and `N^i_• S_• C` (supplier: GeneralAlgebraicKTheory K.4).

`KTheoryFiniteLocalFields:L.4/thh-additivity-theorem`
(`TauCeti.KTheoryFiniteLocal.thh_additivity_theorem`): not stated here; needs `Φ(N^w_• S_• E)` for
the category of cofibration sequences and `THH(-; S^V)^{C_r}` (supplier: GeneralAlgebraicKTheory
K.4; RefinedTraceMethods RT.2).

`KTheoryFiniteLocalFields:L.4/thh-relative-s-construction-square`
(`TauCeti.KTheoryFiniteLocal.thh_relative_s_construction_square`): not stated here; needs the
relative `S`-construction and homotopy cartesian squares of spaces (supplier:
GeneralAlgebraicKTheory K.4).

`KTheoryFiniteLocalFields:L.4/cofibration-weak-equivalence-nerve-lemma`
(`TauCeti.KTheoryFiniteLocal.cofibration_weak_equivalence_nerve_lemma`): not stated here; needs
cylinder functors, the cylinder and saturation axioms and `Φ` (supplier: GeneralAlgebraicKTheory
K.4).

`KTheoryFiniteLocalFields:L.4/swallowing-lemma` (`TauCeti.KTheoryFiniteLocal.swallowing_lemma`):
not stated here; needs `N^{v,w} C` and `Φ` (supplier: GeneralAlgebraicKTheory K.4).

`KTheoryFiniteLocalFields:L.4/thh-fibration-theorem`
(`TauCeti.KTheoryFiniteLocal.thh_fibration_theorem`): not stated here; needs Waldhausen's
fibration theorem setting (`v ⊂ w`, `C^w`, the extension axiom) and `Φ = THH^{C_r}` (supplier:
GeneralAlgebraicKTheory K.4; RefinedTraceMethods RT.2).

`KTheoryFiniteLocalFields:L.4/thh-resolution-theorem`
(`TauCeti.KTheoryFiniteLocal.thh_resolution_theorem`): not stated here; needs `Φ(N^i_• S_• E)`
and `C^b(E)` with quasi-isomorphisms as weak equivalences (supplier: GeneralAlgebraicKTheory K.4).

`KTheoryFiniteLocalFields:L.4/dundas-mccarthy-equivalence-criterion`
(`TauCeti.KTheoryFiniteLocal.dundas_mccarthy_equivalence_criterion`): not stated here; needs
`THH(N^w_• S_• C)`, the categories `END_n(C)` and `F`-equivalences (supplier: RefinedTraceMethods
RT.2; GeneralAlgebraicKTheory K.4). -/

/-! ### `L.4/torsion-homology-complex-replacement` -/

namespace TauCeti

open CategoryTheory CategoryTheory.Limits

/-- **Complexes with `I`-power-torsion homology are quasi-isomorphic to complexes of
`I`-power-torsion modules** (`KTheoryFiniteLocalFields:L.4/torsion-homology-complex-replacement`,
HM Lemma 1.5.3).
Let `A` be a commutative noetherian ring, `B` an `A`-algebra (not necessarily commutative), `I` an
ideal of `A`, and `C` a bounded complex of left `B`-modules, finitely generated over `A`, whose
homology is killed by a power of `I`. Then `C` is quasi-isomorphic, by a map `C → D`, to a bounded
complex `D` of left `B`-modules, finitely generated over `A` and killed by a power of `I`. -/
theorem torsion_homology_complex_replacement {A B : Type u} [CommRing A] [IsNoetherianRing A]
    [Ring B] [Algebra A B] (I : Ideal A) (C : ChainComplex (ModuleCat.{u} B) ℤ)
    (hbdd : ∃ a b : ℤ, ∀ i, (i < a ∨ b < i) → IsZero (C.X i))
    (hfin : ∀ i, Module.Finite A ((ModuleCat.restrictScalars (algebraMap A B)).obj (C.X i)))
    (htors : ∃ N : ℕ, ∀ i, ∀ a ∈ I ^ N, ∀ x : C.homology i, algebraMap A B a • x = 0) :
    ∃ (D : ChainComplex (ModuleCat.{u} B) ℤ) (f : C ⟶ D), QuasiIso f ∧
      (∃ a b : ℤ, ∀ i, (i < a ∨ b < i) → IsZero (D.X i)) ∧
      (∀ i, Module.Finite A ((ModuleCat.restrictScalars (algebraMap A B)).obj (D.X i))) ∧
      ∃ N : ℕ, ∀ i, ∀ a ∈ I ^ N, ∀ x : D.X i, algebraMap A B a • x = 0 := by
  sorry

end TauCeti

/- `KTheoryFiniteLocalFields:L.4/thh-torsion-complexes-f-equivalence`
(`TauCeti.KTheoryFiniteLocal.thh_torsion_complexes_f_equivalence`): not stated here; needs
`THH(N^z_• S_• C^b(M^q_A))`, Waldhausen categories of bounded complexes and `F`-equivalences
(supplier: RefinedTraceMethods RT.2; GeneralAlgebraicKTheory K.4). Its algebraic input is
`TauCeti.torsion_homology_complex_replacement` above.

`KTheoryFiniteLocalFields:L.4/thh-projective-complexes-f-equivalence`
(`TauCeti.KTheoryFiniteLocal.thh_projective_complexes_f_equivalence`): not stated here; needs
`THH(N^z_• S_• C^b(P_A)^q)` and `F`-equivalences (supplier: RefinedTraceMethods RT.2;
GeneralAlgebraicKTheory K.4). -/

/-! ### `L.4/thh-of-dvr-with-log-poles` -/

/- `TauCeti.HM.logTHH`: not stated here; needs `T(C)` of the Waldhausen category `C^b_q(P_A)` of
bounded complexes of finitely generated projective `A`-modules with `K`-rational quasi-isomorphisms
(supplier: RefinedTraceMethods RT.2; GeneralAlgebraicKTheory K.4; node
L.4/thh-of-linear-waldhausen-category).
`TauCeti.HM.dvrTHH`: not stated here; needs `T(C^b_z(P_A))` and `T(C^b_z(P_A)^q)` (supplier:
RefinedTraceMethods RT.2; GeneralAlgebraicKTheory K.4).
`TauCeti.HM.logTR`: not stated here; needs `TR^n(C^b_q(P_A);p)` (supplier: RefinedTraceMethods
RT.2; node L.4/tr-pro-spectrum).
`TauCeti.HM.logTC`: not stated here; needs `TC(C^b_q(P_A);p)` (supplier: RefinedTraceMethods RT.2;
node L.4/p-typical-tc).
`TauCeti.HM.logTHH.j`: not stated here; needs `T(A) → T(A|K)` as a map of ring `𝕋`-spectra
(supplier: RefinedTraceMethods RT.2).
`TauCeti.HM.logTHH.pi0`: not stated here; needs `π₀ T(A|K)` and `TR^n_0(A|K;p)` (supplier:
RefinedTraceMethods RT.2); the targets `A` and `TruncatedWittVector p n A` exist in Mathlib.
`TauCeti.HM.logTHH.map`: not stated here; needs `ι_* : T(A|K) → T(B|L)` (supplier:
RefinedTraceMethods RT.2).
`TauCeti.HM.dvrTHH.equivRing`: not stated here; needs `THH(A)` and `THH(k)` as cyclotomic spectra
(supplier: RefinedTraceMethods RT.2; node L.4/dvr-tr-agrees-with-ring-tr). -/

-- test TauCeti.HM.logTHH_Zp_pi0_modp (computation): not stated here; needs `π_*(T(ℤ_p|ℚ_p);ℤ/p)`
-- and `dlog p ∈ π₁` (supplier: RefinedTraceMethods RT.2; StableHomotopyKTheory H.6).
-- test TauCeti.HM.logTHH_ne_thh_fraction_field (non-example): not stated here; needs `THH(ℚ_p)` as
-- a `ℚ_p`-module spectrum and `π_*(T(ℤ_p|ℚ_p);ℤ/p)` (supplier: RefinedTraceMethods RT.2).
-- test TauCeti.HM.logTHH_ne_thh (non-example): not stated here; needs `π₁(T(ℤ_p);ℤ/p)` and
-- `π₁(T(ℤ_p|ℚ_p);ℤ/p)` (supplier: RefinedTraceMethods RT.2; StableHomotopyKTheory H.6).
-- test TauCeti.HM.logTHH_rational (compatibility): not stated here; needs rational homotopy of
-- `T(A)`, `T(A|K)` and `HH_*(K) = Ω^*_K` (supplier: RefinedTraceMethods RT.1/RT.2).
-- test TauCeti.HM.logTHH_residue_trivial (degenerate): not stated here; needs `T(k)` as a
-- `T(A)`-module and `π_* T(k) = k[σ]` (supplier: RefinedTraceMethods RT.2; node
-- L.5/thh-of-perfect-field).

/- `KTheoryFiniteLocalFields:L.4/dvr-tr-agrees-with-ring-tr`
(`TauCeti.KTheoryFiniteLocal.dvr_tr_agrees_with_ring_tr`): not stated here; needs `TR^n(A;p)`,
`TR^n(k;p)` of Definition 1.5.5 and `TR^n(P_R;p)` (supplier: RefinedTraceMethods RT.2; node
L.4/thh-of-dvr-with-log-poles).

`KTheoryFiniteLocalFields:L.4/tr-localization-sequence`
(`TauCeti.KTheoryFiniteLocal.tr_localization_sequence`): not stated here; needs the cofibration
sequence `TR^n(k;p) → TR^n(A;p) → TR^n(A|K;p)` of spectra (supplier: RefinedTraceMethods RT.2;
GeneralAlgebraicKTheory K.4).

`KTheoryFiniteLocalFields:L.4/k-tc-localization-square`
(`TauCeti.KTheoryFiniteLocal.k_tc_localization_square`): not stated here; needs Quillen's
localisation sequence `K(k) → K(A) → K(K)`, `TC(A|K;p)` and the cyclotomic trace (supplier:
GeneralAlgebraicKTheory K.1/K.4; RefinedTraceMethods RT.3). -/

/-! ## `KTheoryFiniteLocalFields:L.5` — Witt vectors, log differentials and TR of a complete DVR

Standing hypotheses of the stage (pinned by the packet): `A` is a complete discrete valuation ring
with fraction field `K` of characteristic `0` and perfect residue field `k` of characteristic `p`;
`e = e_K` is the absolute ramification index (`pA = 𝔪^e`), `π = π_K` a uniformiser with minimal
polynomial `φ_K(x) = x^e + pθ_K(x)` over `W(k)`, and `M = A ∩ Kˣ` the canonical prelog structure.
Hesselholt–Madsen's `p` is odd throughout L.4–L.6 wherever the packet says so.

Carriers. The Witt-vector statements are made on Mathlib's `WittVector` and `TruncatedWittVector`.
Mathlib has the Frobenius `F` and the Verschiebung `V` only on the untruncated `WittVector`, so the
truncated `F : W_{n+1}(A) → W_n(A)` and `V : W_n(A) → W_{n+1}(A)` are local stand-ins (data with
`sorry` bodies, each with its defining compatibility with `WittVector.truncate`) for the request to
CrystallineCohomology CR.4. The module of log differentials `ω¹_{(A,M)}` is a local stand-in,
defined honestly by its presentation, for CrystallineCohomology CR.5:log-algebra. Everything built
on TR, THH, TC, spectra, the Tate spectral sequence, log Witt complexes or the de Rham–Witt complex
with log poles is recorded by a `not stated here` comment naming its supplier.

Indexing. Where the packet writes `W_{n-1} → W_n`, the Lean forms use `W_n → W_{n+1}` so that no
natural-number subtraction occurs. -/

namespace TauCeti.WittVector

open IsLocalRing

section Helpers

variable (p : ℕ) [Fact p.Prime] (n : ℕ) (R : Type u) [CommRing R]

/-- `W̄_n(R) = W_n(R)/p`, the truncated Witt vectors modulo `p` (notation of Hesselholt–Madsen). -/
abbrev WittModP : Type u :=
  TruncatedWittVector p n R ⧸ Ideal.span {(p : TruncatedWittVector p n R)}

/-- The class map `W_n(R) → W̄_n(R)`. -/
abbrev toWittModP : TruncatedWittVector p n R →+* WittModP p n R :=
  Ideal.Quotient.mk _

/-- The truncated Teichmüller representative `a ↦ [a]_n = (a, 0, …, 0)` (a real definition). -/
def teichmullerTrunc : R →* TruncatedWittVector p n R :=
  (WittVector.truncate n).toMonoidHom.comp (WittVector.teichmuller p)

/-- The ghost map `w : W_n(R) → R^n`, `w_s = a_0^{p^s} + p a_1^{p^{s-1}} + ⋯ + p^s a_s`, computed on
any lift to `W(R)` (a real definition; `w_s` only involves `a_0, …, a_s`). -/
def truncatedGhostMap (x : TruncatedWittVector p n R) : Fin n → R :=
  fun s => WittVector.ghostComponent (s : ℕ) x.out

variable {p n R}

/-- Stand-in for the truncated Frobenius `F : W_{n+1}(R) → W_n(R)` requested from
CrystallineCohomology CR.4 (Mathlib has `WittVector.frobenius` only on `W(R)`). -/
def truncFrobenius : TruncatedWittVector p (n + 1) R →+* TruncatedWittVector p n R :=
  sorry

/-- The defining property of `truncFrobenius`: it is induced by `WittVector.frobenius`. -/
theorem truncFrobenius_truncate (x : WittVector p R) :
    truncFrobenius (WittVector.truncate (n + 1) x) =
      WittVector.truncate n (WittVector.frobenius x) := by
  sorry

/-- Stand-in for the truncated Verschiebung `V : W_n(R) → W_{n+1}(R)` requested from
CrystallineCohomology CR.4 (Mathlib has `WittVector.verschiebung` only on `W(R)`). -/
def truncVerschiebung : TruncatedWittVector p n R →+ TruncatedWittVector p (n + 1) R :=
  sorry

/-- The defining property of `truncVerschiebung`: it is induced by `WittVector.verschiebung`. -/
theorem truncVerschiebung_truncate (x : WittVector p R) :
    truncVerschiebung (WittVector.truncate n x) =
      WittVector.truncate (n + 1) (WittVector.verschiebung x) := by
  sorry

/-- The restriction `R : W̄_{n+1}(R) → W̄_n(R)` induced by `TruncatedWittVector.truncate`
(data with a `sorry` for the compatibility of the ideals). -/
def restrictModP : WittModP p (n + 1) R →+* WittModP p n R :=
  Ideal.quotientMap _ (TruncatedWittVector.truncate (Nat.le_succ n)) (by sorry)

/-- The Frobenius `F : W̄_{n+1}(R) → W̄_n(R)` induced by `truncFrobenius`. -/
def frobeniusModP : WittModP p (n + 1) R →+* WittModP p n R :=
  Ideal.quotientMap _ truncFrobenius (by sorry)

/-- The Verschiebung `V : W̄_n(R) → W̄_{n+1}(R)` induced by `truncVerschiebung`
(`V` is additive, so it preserves `p·W_n`). -/
def verschiebungModP : WittModP p n R →+ WittModP p (n + 1) R :=
  sorry

/-- `verschiebungModP` is induced by `truncVerschiebung`. -/
theorem verschiebungModP_mk (x : TruncatedWittVector p n R) :
    verschiebungModP (toWittModP p n R x) = toWittModP p (n + 1) R (truncVerschiebung x) := by
  sorry

end Helpers

end TauCeti.WittVector

namespace TauCeti.KTheoryFiniteLocal

open TauCeti.WittVector

/-- `KTheoryFiniteLocalFields:L.5/complete-dvr-eisenstein-presentation`: for a complete DVR `A`
of mixed characteristic `(0, p)` with perfect residue field `k`, there is a unique ring homomorphism
`f : W(k) → A` inducing the identity on residue fields; and for a uniformiser `π` and `e` with
`pA = 𝔪^e`, `A = W(k)[π]/(φ(π))` with `φ = x^e + pθ` Eisenstein, `deg θ < e`, `θ(0) ∈ W(k)ˣ`,
`θ(π) ∈ Aˣ` and `-p = π^e θ(π)⁻¹`. -/
theorem complete_dvr_eisenstein_presentation (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A]
    [IsDomain A] [IsDiscreteValuationRing A] [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [CharZero A] [CharP (IsLocalRing.ResidueField A) p]
    [PerfectRing (IsLocalRing.ResidueField A) p] (π : A) (hπ : Irreducible π) (e : ℕ)
    (he : Ideal.span {(p : A)} = IsLocalRing.maximalIdeal A ^ e) :
    (∃! f : WittVector p (IsLocalRing.ResidueField A) →+* A,
      ∀ w, IsLocalRing.residue A (f w) = WittVector.constantCoeff w) ∧
    ∀ f : WittVector p (IsLocalRing.ResidueField A) →+* A,
      (∀ w, IsLocalRing.residue A (f w) = WittVector.constantCoeff w) →
      ∃ θ : Polynomial (WittVector p (IsLocalRing.ResidueField A)),
        θ.natDegree < e ∧ IsUnit (θ.coeff 0) ∧
        (Polynomial.X ^ e + Polynomial.C (p : WittVector p _) * θ).IsEisensteinAt
          (Ideal.span {(p : WittVector p (IsLocalRing.ResidueField A))}) ∧
        IsUnit ((θ.map f).eval π) ∧
        -(p : A) * (θ.map f).eval π = π ^ e ∧
        ∃ h : (Polynomial.X ^ e + Polynomial.C (p : WittVector p _) * θ).eval₂ f π = 0,
          Function.Bijective (AdjoinRoot.lift f π h) := by
  sorry

/-- `KTheoryFiniteLocalFields:L.5/ghost-image-criterion` (injectivity): if `R` has no
`p`-torsion, the ghost map `W_n(R) → R^n` is injective. -/
theorem ghost_image_criterion_injective (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R]
    (hR : ∀ r : R, (p : R) * r = 0 → r = 0) (n : ℕ) :
    Function.Injective (truncatedGhostMap p n R) := by
  sorry

/-- `KTheoryFiniteLocalFields:L.5/ghost-image-criterion`: if `R` has no `p`-torsion and
`φ : R → R` is a ring endomorphism with `φ(a) ≡ a^p (mod p)`, then `w ∈ R^n` is a ghost vector
exactly when `w_{s+1} ≡ φ(w_s) (mod p^{s+1})` for all `s + 1 < n`. -/
theorem ghost_image_criterion (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R]
    (hR : ∀ r : R, (p : R) * r = 0 → r = 0) (φ : R →+* R)
    (hφ : ∀ a : R, φ a - a ^ p ∈ Ideal.span {(p : R)}) (n : ℕ) (w : Fin n → R) :
    w ∈ Set.range (truncatedGhostMap p n R) ↔
      ∀ (s : ℕ) (hs : s + 1 < n),
        w ⟨s + 1, hs⟩ - φ (w ⟨s, by omega⟩) ∈ Ideal.span {(p : R) ^ (s + 1)} := by
  sorry

/-- `KTheoryFiniteLocalFields:L.5/ghost-image-criterion` (the consequence): if `R` has no
`p`-torsion, `x ∈ p·W_n(R)` exactly when `w(x)/p` is a ghost vector. -/
theorem ghost_image_criterion_mem_span_p (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R]
    (hR : ∀ r : R, (p : R) * r = 0 → r = 0) (n : ℕ) (x : TruncatedWittVector p n R) :
    x ∈ Ideal.span {(p : TruncatedWittVector p n R)} ↔
      ∃ y : TruncatedWittVector p n R,
        ∀ s, (p : R) * truncatedGhostMap p n R y s = truncatedGhostMap p n R x s := by
  sorry

-- acceptance (computation): `R = ℤ`, `p = 3`, `n = 2`: `(1, 4)` is a ghost vector, `(1, 2)` is not.
example [Fact (Nat.Prime 3)] :
    ![(1 : ℤ), 4] ∈ Set.range (truncatedGhostMap 3 2 ℤ) ∧
      ![(1 : ℤ), 2] ∉ Set.range (truncatedGhostMap 3 2 ℤ) := by
  sorry

/-- `KTheoryFiniteLocalFields:L.5/verschiebung-one-is-teichmuller-minus-p`: for `p` odd and any
commutative ring `R`, `V(1) ≡ [-p]_n` and `[-1]_n ≡ -1` modulo `p·W_n(R)`. -/
theorem verschiebung_one_is_teichmuller_minus_p (p : ℕ) [Fact p.Prime] (hp : p ≠ 2)
    (R : Type u) [CommRing R] (n : ℕ) :
    toWittModP p n R (WittVector.truncate n (WittVector.verschiebung (1 : WittVector p R))) =
        toWittModP p n R (teichmullerTrunc p n R (-(p : R))) ∧
      toWittModP p n R (teichmullerTrunc p n R (-1)) = -1 := by
  sorry

-- acceptance (non-example): for `p = 2`, `n = 3`, `V(1) ≢ [-2]_3 (mod 2·W_3(ℤ))`.
example [Fact (Nat.Prime 2)] :
    toWittModP 2 3 ℤ (WittVector.truncate 3 (WittVector.verschiebung (1 : WittVector 2 ℤ))) ≠
      toWittModP 2 3 ℤ (teichmullerTrunc 2 3 ℤ (-2)) := by
  sorry

-- acceptance (non-example): for `p = 2`, `n = 2`, `[-1]_2 ≢ -1 (mod 2·W_2(ℤ))`.
example [Fact (Nat.Prime 2)] : toWittModP 2 2 ℤ (teichmullerTrunc 2 2 ℤ (-1)) ≠ -1 := by
  sorry

/-- `KTheoryFiniteLocalFields:L.5/teichmuller-pth-power-additive-mod-p`: for every ring `R`,
`[x + y]_n^p ≡ ([x]_n + [y]_n)^p ≡ [x]_n^p + [y]_n^p (mod p·W_n(R))`; consequently
`x ↦ [x]_n^p (mod p)` is a ring homomorphism `R → W̄_n(R)`. -/
theorem teichmuller_pth_power_additive_mod_p (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R]
    (n : ℕ) (x y : R) :
    toWittModP p n R (teichmullerTrunc p n R (x + y) ^ p) =
        toWittModP p n R ((teichmullerTrunc p n R x + teichmullerTrunc p n R y) ^ p) ∧
      toWittModP p n R ((teichmullerTrunc p n R x + teichmullerTrunc p n R y) ^ p) =
        toWittModP p n R (teichmullerTrunc p n R x ^ p + teichmullerTrunc p n R y ^ p) := by
  sorry

/-- The corollary of `teichmuller_pth_power_additive_mod_p`: `x ↦ [x]_n^p (mod p)` is a ring
homomorphism. -/
theorem exists_ringHom_teichmuller_pow_mod_p (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R]
    (n : ℕ) :
    ∃ f : R →+* WittModP p n R, ∀ x, f x = toWittModP p n R (teichmullerTrunc p n R x ^ p) := by
  sorry

-- acceptance (non-example): without the `p`-th power, `[2]_2 ≢ [1]_2 + [1]_2 (mod 3·W_2(ℤ))`.
example [Fact (Nat.Prime 3)] :
    toWittModP 3 2 ℤ (teichmullerTrunc 3 2 ℤ 2) ≠
      toWittModP 3 2 ℤ (teichmullerTrunc 3 2 ℤ 1 + teichmullerTrunc 3 2 ℤ 1) := by
  sorry

end TauCeti.KTheoryFiniteLocal

/-! ### `KTheoryFiniteLocalFields:L.5/residue-field-to-witt-mod-p` — the `k`-algebra `W̄_n(A)`

`ρ_n : k → W̄_n(A)`, `x ↦ [f(x̃)]_n^p (mod p)` with `x̃ ∈ W(k)` any lift of `x^{1/p}` and
`f : W(k) → A` the lift of the identity of residue fields
(`complete_dvr_eisenstein_presentation`). -/

namespace TauCeti.WittVector

open IsLocalRing

section ResidueMap

variable (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A] [IsDomain A]
  [IsDiscreteValuationRing A] [IsAdicComplete (maximalIdeal A) A]
  [CharP (ResidueField A) p] [PerfectRing (ResidueField A) p]

/-- **`ρ_n : k →+* W̄_n(A)`** (`KTheoryFiniteLocalFields:L.5/residue-field-to-witt-mod-p`):
`x ↦ [f(x̃)]_n^p (mod p)`, `x̃ ∈ W(k)` lifting `x^{1/p}`. `W̄_n(A)` is always regarded as a
`k`-algebra through `ρ_n`. -/
def residueMap (n : ℕ) : ResidueField A →+* WittModP p n A :=
  sorry

variable {p A}

/-- `residueMap_restrict`: `R ∘ ρ_{n+1} = ρ_n`. -/
theorem residueMap_restrict (n : ℕ) :
    (restrictModP (p := p) (n := n) (R := A)).comp (residueMap p A (n + 1)) =
      residueMap p A n := by
  sorry

/-- `residueMap_frobenius`: `F ∘ ρ_{n+1} = ρ_n ∘ (x ↦ x^p)`. -/
theorem residueMap_frobenius (n : ℕ) (x : ResidueField A) :
    frobeniusModP (p := p) (n := n) (R := A) (residueMap p A (n + 1) x) =
      residueMap p A n (x ^ p) := by
  sorry

/-- `residueMap_independent`: for the lift `f : W(k) → A` of the identity of residue fields and
any `x̃ ∈ W(k)` whose residue class is `x^{1/p}`, `ρ_n(x) = [f(x̃)]_n^p (mod p)`; in particular the
value does not depend on the lift `x̃`. -/
theorem residueMap_independent (n : ℕ) (f : WittVector p (ResidueField A) →+* A)
    (hf : ∀ w, residue A (f w) = WittVector.constantCoeff w) (x : ResidueField A)
    (x' : WittVector p (ResidueField A))
    (hx' : WittVector.constantCoeff x' = (frobeniusEquiv (ResidueField A) p).symm x) :
    residueMap p A n x = toWittModP p n A (teichmullerTrunc p n A (f x') ^ p) := by
  sorry

-- test TauCeti.WittVector.residueMap_one (degenerate)
example (n : ℕ) : residueMap p A n 1 = 1 ∧ residueMap p A n 0 = 0 := by
  sorry

-- test TauCeti.WittVector.residueMap_n_one (computation)
/- For `n = 1` the `p`-th power undoes the `p`-th root: `ρ_1(x)` is the class of `f(ỹ)` for any
lift `ỹ ∈ W(k)` of `x` itself (`W_1(A) = A`, `[a]_1 = a`). -/
example (f : WittVector p (ResidueField A) →+* A)
    (hf : ∀ w, residue A (f w) = WittVector.constantCoeff w) (x : ResidueField A)
    (y : WittVector p (ResidueField A)) (hy : WittVector.constantCoeff y = x) :
    residueMap p A 1 x = toWittModP p 1 A (teichmullerTrunc p 1 A (f y)) := by
  sorry

end ResidueMap

-- test TauCeti.WittVector.residueMap_Zp (compatibility)
/- For `A = ℤ_p`, `ρ_n` is the structure map of the `𝔽_p`-algebra `W_n(ℤ_p)/p`: the unique ring
homomorphism out of the prime field `k = 𝔽_p`. -/
example (p : ℕ) [Fact p.Prime] [IsAdicComplete (maximalIdeal ℤ_[p]) ℤ_[p]]
    [CharP (ResidueField ℤ_[p]) p] [PerfectRing (ResidueField ℤ_[p]) p] (n : ℕ)
    (g : ResidueField ℤ_[p] →+* WittModP p n ℤ_[p]) :
    g = residueMap p ℤ_[p] n := by
  sorry

-- test TauCeti.WittVector.residueMap_not_teichmuller (non-example)
/- Without the `p`-th power `x ↦ [f(x̃)]_n (mod p)` is not additive: for `A = ℤ_3`, `n = 2`,
`[2]_2 ≢ [1]_2 + [1]_2 (mod 3)`
(`KTheoryFiniteLocalFields:L.5/teichmuller-pth-power-additive-mod-p`). -/
example [Fact (Nat.Prime 3)] :
    toWittModP 3 2 ℤ_[3] (teichmullerTrunc 3 2 ℤ_[3] 2) ≠
      toWittModP 3 2 ℤ_[3] (teichmullerTrunc 3 2 ℤ_[3] 1 + teichmullerTrunc 3 2 ℤ_[3] 1) := by
  sorry

end TauCeti.WittVector

/-! ### `KTheoryFiniteLocalFields:L.5/modified-verschiebung` — `V_π` on `W̄_n(A)`

`V_π(a) = θ_K([π]_{n+1})·V(a) : W̄_n(A) → W̄_{n+1}(A)`, where `θ_K([π])` is the image of
`θ_K ∈ W(k)[x]` under the `k`-algebra map `k[x] → W̄_{n+1}(A)`, `x ↦ [π]`: its coefficients act
through their residues in `k = W(k)/p` and `ρ_{n+1}`. The uniformiser `π` and `θ = θ_K` are
arguments; the relation `π^e = -pθ(π)` is a hypothesis where it is used. -/

namespace TauCeti.WittVector

open IsLocalRing

section ModVerschiebung

variable (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A] [IsDomain A]
  [IsDiscreteValuationRing A] [IsAdicComplete (maximalIdeal A) A]
  [CharP (ResidueField A) p] [PerfectRing (ResidueField A) p]

/-- `θ_K([π]_n) ∈ W̄_n(A)`: `Σ_i ρ_n(θ̄_i)·[π]_n^i`, `θ̄_i ∈ k` the residue of the coefficient
`θ_i ∈ W(k)` (a real definition). -/
def thetaTeichmuller (n : ℕ) (θ : Polynomial (WittVector p (ResidueField A))) (π : A) :
    WittModP p n A :=
  (θ.map (WittVector.constantCoeff)).eval₂ (residueMap p A n)
    (toWittModP p n A (teichmullerTrunc p n A π))

/-- **The modified Verschiebung** `V_π(a) := θ_K([π]_{n+1})·V(a)`
(`KTheoryFiniteLocalFields:L.5/modified-verschiebung`), `W̄_n(A) → W̄_{n+1}(A)` (a real
definition from the stand-in `verschiebungModP`). -/
def modVerschiebung (n : ℕ) (θ : Polynomial (WittVector p (ResidueField A))) (π : A) :
    WittModP p n A →+ WittModP p (n + 1) A :=
  (AddMonoidHom.mulLeft (thetaTeichmuller p A (n + 1) θ π)).comp verschiebungModP

/-- The iterate `V_π^s : W̄_n(A) → W̄_{n+s}(A)` (a real definition). -/
def modVerschiebungIter (n : ℕ) (θ : Polynomial (WittVector p (ResidueField A))) (π : A) :
    (s : ℕ) → WittModP p n A →+ WittModP p (n + s) A
  | 0 => AddMonoidHom.id _
  | s + 1 => (modVerschiebung p A (n + s) θ π).comp (modVerschiebungIter n θ π s)

/-- The iterate `V^s : W̄_n(A) → W̄_{n+s}(A)` of the ordinary Verschiebung (a real definition). -/
def verschiebungModPIter (n : ℕ) : (s : ℕ) → WittModP p n A →+ WittModP p (n + s) A
  | 0 => AddMonoidHom.id _
  | s + 1 => verschiebungModP.comp (verschiebungModPIter n s)

variable {p A}

/-- `frobenius_modVerschiebung`: `F(V_π(a)) = θ̃·F(V(a)) = θ̃·p·a = 0` in `W̄_n(A)` (any `p`). -/
theorem frobenius_modVerschiebung (n : ℕ)
    (θ : Polynomial (WittVector p (ResidueField A))) (π : A) (a : WittModP p n A) :
    frobeniusModP (modVerschiebung p A n θ π a) = 0 := by
  sorry

/-- `modVerschiebung_one`: `V_π(1) = [π]_{n+1}^e` in `W̄_{n+1}(A)`, for `π^e = -p·θ(π)` (the image
of `θ` under the lift `f : W(k) → A` of the identity of residue fields) and `p` odd. -/
theorem modVerschiebung_one (hp : p ≠ 2) (n : ℕ)
    (θ : Polynomial (WittVector p (ResidueField A))) (π : A) (e : ℕ)
    (f : WittVector p (ResidueField A) →+* A)
    (hf : ∀ w, residue A (f w) = WittVector.constantCoeff w)
    (hφ : π ^ e + (p : A) * (θ.map f).eval π = 0) :
    modVerschiebung p A n θ π 1 = toWittModP p (n + 1) A (teichmullerTrunc p (n + 1) A π) ^ e := by
  sorry

/-- `modVerschiebung_iterate`: `V_π^s(a) = θ_K([π])·V^s(c_s·a)` for a unit `c_s` of `W̄_n(A)`
(`c_s = Π_{j=1}^{s-1} F^j(θ_K([π]))`, by the projection formula `y·V(a) = V(F(y)·a)`); in
particular `V_π^s` and `V^s` have the same image. -/
theorem modVerschiebung_iterate (hp : p ≠ 2) (n s : ℕ) (hs : 0 < s)
    (θ : Polynomial (WittVector p (ResidueField A))) (π : A) (hθ : IsUnit (θ.coeff 0)) :
    ∃ c : (WittModP p n A)ˣ, ∀ a : WittModP p n A,
      modVerschiebungIter p A n θ π s a =
        thetaTeichmuller p A (n + s) θ π *
          verschiebungModPIter p A n s ((c : WittModP p n A) * a) := by
  sorry

end ModVerschiebung

-- test TauCeti.WittVector.modVerschiebung_unramified (computation)
/- `A = ℤ_p`, `φ(x) = x - p`, `θ = -1`: `V_π = -V`, and `V_π(1) = [p]_2` in `W̄_2(ℤ_p)`. -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) [IsAdicComplete (maximalIdeal ℤ_[p]) ℤ_[p]]
    [CharP (ResidueField ℤ_[p]) p] [PerfectRing (ResidueField ℤ_[p]) p] :
    (∀ a : WittModP p 1 ℤ_[p], modVerschiebung p ℤ_[p] 1 (-1) (p : ℤ_[p]) a =
      -verschiebungModP a) ∧
    modVerschiebung p ℤ_[p] 1 (-1) (p : ℤ_[p]) 1 =
      toWittModP p 2 ℤ_[p] (teichmullerTrunc p 2 ℤ_[p] (p : ℤ_[p])) := by
  sorry

-- test TauCeti.WittVector.modVerschiebung_n_one (degenerate)
/- For `n = 1` (in the packet's indexing) the source `W̄_0(A) = 0` and `V_π : W̄_0 → A/p` is
zero. -/
example (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A] [IsDomain A]
    [IsDiscreteValuationRing A] [IsAdicComplete (maximalIdeal A) A]
    [CharP (ResidueField A) p] [PerfectRing (ResidueField A) p]
    (θ : Polynomial (WittVector p (ResidueField A))) (π : A) :
    modVerschiebung p A 0 θ π = 0 := by
  sorry

-- test TauCeti.WittVector.modVerschiebung_frobenius_zero (characterisation)
/- `F ∘ V_π = 0` on `W̄_n(A)`, and `F ∘ V = p = 0` as well; `V_π ≠ V` unless `θ_K([π]) = 1`
(the next test). -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (A : Type u) [CommRing A] [IsDomain A]
    [IsDiscreteValuationRing A] [IsAdicComplete (maximalIdeal A) A]
    [CharP (ResidueField A) p] [PerfectRing (ResidueField A) p] (n : ℕ)
    (θ : Polynomial (WittVector p (ResidueField A))) (π : A) :
    (frobeniusModP (p := p) (n := n) (R := A)).toAddMonoidHom.comp
        (modVerschiebung p A n θ π) = 0 ∧
      (frobeniusModP (p := p) (n := n) (R := A)).toAddMonoidHom.comp verschiebungModP = 0 := by
  sorry

-- test TauCeti.WittVector.modVerschiebung_ne_V (non-example)
/- For `A = ℤ_p` (`p` odd) `V_π(1) = -V(1) ≠ V(1)` in `W̄_2(ℤ_p) ≅ 𝔽_p²`. -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) [IsAdicComplete (maximalIdeal ℤ_[p]) ℤ_[p]]
    [CharP (ResidueField ℤ_[p]) p] [PerfectRing (ResidueField ℤ_[p]) p] :
    modVerschiebung p ℤ_[p] 1 (-1) (p : ℤ_[p]) 1 = -verschiebungModP 1 ∧
      modVerschiebung p ℤ_[p] 1 (-1) (p : ℤ_[p]) 1 ≠ verschiebungModP 1 := by
  sorry

end TauCeti.WittVector

namespace TauCeti.WittVector

open IsLocalRing

/-- The endomorphism `V_π ∘ R` of `W̄_{n+1}(A)`; its `s`-th iterate sends `[π]_{n+1}^i` to the
element `V_π^s([π]_{n+1-s}^i)` of Hesselholt–Madsen (a real definition). -/
def modVerschiebungEnd (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A] [IsDomain A]
    [IsDiscreteValuationRing A] [IsAdicComplete (maximalIdeal A) A]
    [CharP (ResidueField A) p] [PerfectRing (ResidueField A) p] (n : ℕ)
    (θ : Polynomial (WittVector p (ResidueField A))) (π : A) :
    WittModP p (n + 1) A →+ WittModP p (n + 1) A :=
  (modVerschiebung p A n θ π).comp (restrictModP (p := p) (n := n) (R := A)).toAddMonoidHom

end TauCeti.WittVector

namespace TauCeti.KTheoryFiniteLocal

open IsLocalRing TauCeti.WittVector

/-- `KTheoryFiniteLocalFields:L.5/witt-mod-p-of-dvr`: for `p` odd, the `k`-algebra
`W̄_{n+1}(A)` (through `ρ_{n+1}`) is `(n+1)·e`-dimensional, spanned by the
`E^s([π]^i) = V_π^s([π]^i)` (`s ≤ n`, `i < e`, `E = V_π ∘ R`), subject to
`[π]^i·V_π^t([π]^j) = V_π^t([π]^{p^t i + j})`, `V_π^s([π]^i)·V_π^t([π]^j) = 0` for `0 < s ≤ t`, and
`V_π^s([π]^{e+i}) = V_π^{s+1}([π]^{p i})`. The data: `f : W(k) → A` the lift of the identity of
residue fields, `π` a uniformiser, `φ = x^e + pθ` its Eisenstein polynomial. -/
theorem witt_mod_p_of_dvr (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (A : Type u) [CommRing A]
    [IsDomain A] [IsDiscreteValuationRing A] [IsAdicComplete (maximalIdeal A) A] [CharZero A]
    [CharP (ResidueField A) p] [PerfectRing (ResidueField A) p] (π : A) (hπ : Irreducible π)
    (e : ℕ) (he : Ideal.span {(p : A)} = maximalIdeal A ^ e)
    (f : WittVector p (ResidueField A) →+* A)
    (hf : ∀ w, residue A (f w) = WittVector.constantCoeff w)
    (θ : Polynomial (WittVector p (ResidueField A))) (hθ : θ.natDegree < e)
    (hθ0 : IsUnit (θ.coeff 0)) (hφ : π ^ e + (p : A) * (θ.map f).eval π = 0) (n : ℕ) :
    letI : Algebra (ResidueField A) (WittModP p (n + 1) A) := (residueMap p A (n + 1)).toAlgebra
    Module.finrank (ResidueField A) (WittModP p (n + 1) A) = (n + 1) * e ∧
    Submodule.span (ResidueField A)
        {x | ∃ s i, s ≤ n ∧ i < e ∧ x = (modVerschiebungEnd p A n θ π)^[s]
          (toWittModP p (n + 1) A (teichmullerTrunc p (n + 1) A π) ^ i)} = ⊤ ∧
    (∀ t i j, t ≤ n →
      toWittModP p (n + 1) A (teichmullerTrunc p (n + 1) A π) ^ i *
          (modVerschiebungEnd p A n θ π)^[t]
            (toWittModP p (n + 1) A (teichmullerTrunc p (n + 1) A π) ^ j) =
        (modVerschiebungEnd p A n θ π)^[t]
          (toWittModP p (n + 1) A (teichmullerTrunc p (n + 1) A π) ^ (p ^ t * i + j))) ∧
    (∀ s t i j, 0 < s → s ≤ t → t ≤ n →
      (modVerschiebungEnd p A n θ π)^[s]
          (toWittModP p (n + 1) A (teichmullerTrunc p (n + 1) A π) ^ i) *
        (modVerschiebungEnd p A n θ π)^[t]
          (toWittModP p (n + 1) A (teichmullerTrunc p (n + 1) A π) ^ j) = 0) ∧
    (∀ s i, s + 1 ≤ n →
      (modVerschiebungEnd p A n θ π)^[s]
          (toWittModP p (n + 1) A (teichmullerTrunc p (n + 1) A π) ^ (e + i)) =
        (modVerschiebungEnd p A n θ π)^[s + 1]
          (toWittModP p (n + 1) A (teichmullerTrunc p (n + 1) A π) ^ (p * i))) := by
  sorry

end TauCeti.KTheoryFiniteLocal

/-! ### Log differentials of a discrete valuation ring (stand-in for CR.5:log-algebra)

For a domain `A` with fraction field `K`, the canonical prelog structure is `M = A ∩ Kˣ` with group
completion `M^gp = Kˣ`. The universal log derivation module is
`ω¹_{(A,M)/R} = (Ω¹_{A/R} ⊕ (A ⊗ M^gp)) / ⟨dα(a) - α(a) ⊗ a⟩`: the stand-in
`TauCeti.LogKaehler R A K` below is exactly this quotient, `R = ℤ` giving the absolute
`ω¹_{(A,M)}` and `R = W(k)` the relative one. `dlog` and the inclusion of `Ω¹` are real
definitions; the residue map is data with a `sorry` body. -/

namespace TauCeti

open IsLocalRing

section LogKaehler

variable (R : Type u) (A : Type v) (K : Type w) [CommRing R] [CommRing A] [Algebra R A]
  [Field K] [Algebra A K]

/-- The relations `dα(a) - α(a) ⊗ a`, `a ∈ A ∩ Kˣ`, of the log differentials. -/
def logKaehlerRel : Submodule A (Ω[A⁄R] × (A ⊗[ℤ] Additive Kˣ)) :=
  Submodule.span A {z | ∃ (a : A) (ha : algebraMap A K a ≠ 0),
    z = (KaehlerDifferential.D R A a,
      -(a ⊗ₜ[ℤ] Additive.ofMul (Units.mk0 (algebraMap A K a) ha)))}

/-- Stand-in for `ω¹_{(A,M)/R}` of CrystallineCohomology CR.5:log-algebra, for the canonical
prelog structure `M = A ∩ Kˣ` (a real definition by the presentation). -/
def LogKaehler : Type (max v w) :=
  (Ω[A⁄R] × (A ⊗[ℤ] Additive Kˣ)) ⧸ logKaehlerRel R A K

instance instAddCommGroupLogKaehler : AddCommGroup (LogKaehler R A K) :=
  inferInstanceAs (AddCommGroup (_ ⧸ logKaehlerRel R A K))

instance instModuleLogKaehler : Module A (LogKaehler R A K) :=
  inferInstanceAs (Module A (_ ⧸ logKaehlerRel R A K))

namespace LogKaehler

/-- The map `Ω¹_{A/R} → ω¹_{(A,M)/R}` (a real definition). -/
def ofKaehler : Ω[A⁄R] →ₗ[A] LogKaehler R A K :=
  (logKaehlerRel R A K).mkQ ∘ₗ LinearMap.inl A _ _

/-- `dlog : M^gp = Kˣ → ω¹_{(A,M)/R}`, `b ↦ class of 1 ⊗ b` (a real definition). -/
def dlog : Additive Kˣ →+ LogKaehler R A K :=
  ((logKaehlerRel R A K).mkQ ∘ₗ LinearMap.inr A _ _).toAddMonoidHom.comp
    (TensorProduct.mk ℤ A (Additive Kˣ) 1).toAddMonoidHom

/-- The residue `res : ω¹_{(A,M)/R} → k`, `res(a·dlog b) = a·v_K(b) + 𝔪` (data; the
well-definedness on the relations is the work). -/
def residue [IsDomain A] [IsDiscreteValuationRing A] [IsFractionRing A K] :
    LogKaehler R A K →ₗ[A] ResidueField A :=
  sorry

/-- The relation `dα(a) = α(a)·dlog a`, read for a unit `u`: `dlog u = u⁻¹ du`. -/
theorem dlog_unit (u : Aˣ) :
    (u : A) • dlog R A K (Additive.ofMul (Units.map (algebraMap A K) u)) =
      ofKaehler R A K (KaehlerDifferential.D R A u) := by
  sorry

end LogKaehler

end LogKaehler

end TauCeti

namespace TauCeti.KTheoryFiniteLocal

open IsLocalRing TauCeti.LogKaehler

/-- `KTheoryFiniteLocalFields:L.5/log-differentials-residue-sequence`: for a discrete valuation
ring `A` with fraction field `K`, `0 → Ω¹_A → ω¹_{(A,M)} → k → 0` is exact (absolute
differentials), with `res(dlog π) = 1` for a uniformiser and `res(dlog u) = 0` for a unit, so
`res(a·dlog b) = a·v_K(b)`. The packet's clause `res_B ∘ i_* = e_{L/K}·(i ∘ res_A)` for a finite
extension needs the functoriality of `ω¹` in the log ring and is not stated here. -/
theorem log_differentials_residue_sequence (A : Type v) (K : Type w) [CommRing A] [IsDomain A]
    [IsDiscreteValuationRing A] [Field K] [Algebra A K] [IsFractionRing A K] :
    Function.Injective (ofKaehler ℤ A K) ∧
      LinearMap.range (ofKaehler ℤ A K) = LinearMap.ker (residue ℤ A K) ∧
      Function.Surjective (residue ℤ A K) ∧
      (∀ (π : A) (_ : Irreducible π) (h : algebraMap A K π ≠ 0),
        residue ℤ A K (dlog ℤ A K (Additive.ofMul (Units.mk0 _ h))) = 1) ∧
      ∀ u : Aˣ, residue ℤ A K (dlog ℤ A K (Additive.ofMul (Units.map (algebraMap A K) u))) = 0 := by
  sorry

/-- `KTheoryFiniteLocalFields:L.5/log-differentials-residue-sequence`, relative version:
`0 → Ω¹_{A/W(k)} → ω¹_{(A,M)/W(k)} → k → 0` is exact. -/
theorem log_differentials_residue_sequence_relative (p : ℕ) [Fact p.Prime] (A : Type v)
    (K : Type w) [CommRing A] [IsDomain A] [IsDiscreteValuationRing A] [Field K] [Algebra A K]
    [IsFractionRing A K] [CharP (ResidueField A) p]
    [Algebra (WittVector p (ResidueField A)) A] :
    Function.Injective (ofKaehler (WittVector p (ResidueField A)) A K) ∧
      LinearMap.range (ofKaehler (WittVector p (ResidueField A)) A K) =
        LinearMap.ker (residue (WittVector p (ResidueField A)) A K) ∧
      Function.Surjective (residue (WittVector p (ResidueField A)) A K) := by
  sorry

/-- `KTheoryFiniteLocalFields:L.5/relative-log-differentials-of-dvr`: `dlog π` generates
`ω¹_{(A,M)/W(k)}`, its annihilator is `(π φ'(π))`, and
`π φ'(π) = p(π θ'(π) - e θ(π)) ∈ pA`; the annihilator is `pA` exactly when `p ∤ e`. (The packet
corrects Hesselholt–Madsen's printed "this ideal contains `p`" to the inclusion into `pA`.) -/
theorem relative_log_differentials_of_dvr (p : ℕ) [Fact p.Prime] (A : Type v) (K : Type w)
    [CommRing A] [IsDomain A] [IsDiscreteValuationRing A] [IsAdicComplete (maximalIdeal A) A]
    [CharZero A] [Field K] [Algebra A K] [IsFractionRing A K] [CharP (ResidueField A) p]
    [PerfectRing (ResidueField A) p] [Algebra (WittVector p (ResidueField A)) A]
    (hf : ∀ w : WittVector p (ResidueField A),
      residue A (algebraMap _ A w) = WittVector.constantCoeff w)
    (π : A) (hπ : Irreducible π) (hπ0 : algebraMap A K π ≠ 0) (e : ℕ)
    (θ : Polynomial (WittVector p (ResidueField A))) (hθ : θ.natDegree < e)
    (hθ0 : IsUnit (θ.coeff 0))
    (hφ : Polynomial.aeval π (Polynomial.X ^ e + Polynomial.C (p : WittVector p _) * θ) = 0) :
    Submodule.span A
        {dlog (WittVector p (ResidueField A)) A K (Additive.ofMul (Units.mk0 _ hπ0))} = ⊤ ∧
      Module.annihilator A (LogKaehler (WittVector p (ResidueField A)) A K) =
        Ideal.span {π * Polynomial.aeval π (Polynomial.derivative
          (Polynomial.X ^ e + Polynomial.C (p : WittVector p _) * θ))} ∧
      π * Polynomial.aeval π (Polynomial.derivative
          (Polynomial.X ^ e + Polynomial.C (p : WittVector p _) * θ)) =
        (p : A) * (π * Polynomial.aeval π (Polynomial.derivative θ) -
          (e : A) * Polynomial.aeval π θ) ∧
      π * Polynomial.aeval π (Polynomial.derivative
          (Polynomial.X ^ e + Polynomial.C (p : WittVector p _) * θ)) ∈ Ideal.span {(p : A)} ∧
      (Module.annihilator A (LogKaehler (WittVector p (ResidueField A)) A K) =
          Ideal.span {(p : A)} ↔ ¬ p ∣ e) := by
  sorry

end TauCeti.KTheoryFiniteLocal

namespace TauCeti.LogKaehler

open IsLocalRing

/-- The map `A ⊗_{W(k)} Ω¹_{W(k)} → ω¹_{(A,M)}` (data; `a ⊗ dw ↦ a·d(f w)`). -/
def fromBase (p : ℕ) [Fact p.Prime] (A : Type v) (K : Type w) [CommRing A] [IsLocalRing A]
    [Field K] [Algebra A K] [Algebra (WittVector p (ResidueField A)) A] :
    A ⊗[WittVector p (ResidueField A)] Ω[WittVector p (ResidueField A)⁄ℤ] →ₗ[A]
      LogKaehler ℤ A K :=
  sorry

/-- The change of base `ω¹_{(A,M)} → ω¹_{(A,M)/W(k)}` (data). -/
def toRelative (p : ℕ) [Fact p.Prime] (A : Type v) (K : Type w) [CommRing A] [IsLocalRing A]
    [Field K] [Algebra A K] [Algebra (WittVector p (ResidueField A)) A] :
    LogKaehler ℤ A K →ₗ[A] LogKaehler (WittVector p (ResidueField A)) A K :=
  sorry

/-- The base change `B ⊗_A ω¹_{(A,M_A)/R} → ω¹_{(B,M_B)/R}` along an extension of domains with
fraction fields `K ⊆ L` (data). -/
def baseChangeMap (R : Type u) (A : Type v) (K : Type w) (B : Type v) (L : Type w) [CommRing R]
    [CommRing A] [CommRing B] [Algebra R A] [Algebra R B] [Algebra A B] [IsScalarTower R A B]
    [Field K] [Field L] [Algebra A K] [Algebra B L] :
    B ⊗[A] LogKaehler R A K →ₗ[B] LogKaehler R B L :=
  sorry

end TauCeti.LogKaehler

namespace TauCeti.KTheoryFiniteLocal

open IsLocalRing TauCeti.LogKaehler

/-- `KTheoryFiniteLocalFields:L.5/log-differentials-divisible-part`: the sequence
`A ⊗_{W(k)} Ω¹_{W(k)} → ω¹_{(A,M)} → ω¹_{(A,M)/W(k)} → 0` is exact, `A ⊗_{W(k)} Ω¹_{W(k)}` is
uniquely divisible, and `ω^i_{(A,M)} = Λ^i_A ω¹_{(A,M)}` is uniquely divisible for `i ≥ 2`. (The
packet's sequence for every `i > 0` is stated in degree one; in degrees `i ≥ 2` its consequence.) -/
theorem log_differentials_divisible_part (p : ℕ) [Fact p.Prime] (A : Type v) (K : Type w)
    [CommRing A] [IsDomain A] [IsDiscreteValuationRing A] [IsAdicComplete (maximalIdeal A) A]
    [CharZero A] [Field K] [Algebra A K] [IsFractionRing A K] [CharP (ResidueField A) p]
    [PerfectRing (ResidueField A) p] [Algebra (WittVector p (ResidueField A)) A]
    (hf : ∀ w : WittVector p (ResidueField A),
      residue A (algebraMap _ A w) = WittVector.constantCoeff w) :
    LinearMap.range (fromBase p A K) = LinearMap.ker (toRelative p A K) ∧
      Function.Surjective (toRelative p A K) ∧
      (∀ m : ℕ, m ≠ 0 → Function.Bijective fun x : A ⊗[WittVector p (ResidueField A)]
        Ω[WittVector p (ResidueField A)⁄ℤ] => m • x) ∧
      ∀ i : ℕ, 2 ≤ i → ∀ m : ℕ, m ≠ 0 →
        Function.Bijective fun x : ⋀[A]^i (LogKaehler ℤ A K) => m • x := by
  sorry

/-- `KTheoryFiniteLocalFields:L.5/log-differentials-p-torsion`: the `p`-torsion of the absolute
`ω¹_{(A,M)}` is `A/p · dlog(-p)`, free of rank one over `A/p`. -/
theorem log_differentials_p_torsion (p : ℕ) [Fact p.Prime] (A : Type v) (K : Type w)
    [CommRing A] [IsDomain A] [IsDiscreteValuationRing A] [IsAdicComplete (maximalIdeal A) A]
    [CharZero A] [Field K] [Algebra A K] [IsFractionRing A K] [CharP (ResidueField A) p]
    [PerfectRing (ResidueField A) p] (hp : (p : K) ≠ 0) :
    Submodule.torsionBy A (LogKaehler ℤ A K) (p : A) =
        Submodule.span A {dlog ℤ A K (Additive.ofMul (Units.mk0 (-(p : K)) (neg_ne_zero.mpr hp)))} ∧
      ∀ a : A, a • dlog ℤ A K (Additive.ofMul (Units.mk0 (-(p : K)) (neg_ne_zero.mpr hp))) = 0 ↔
        a ∈ Ideal.span {(p : A)} := by
  sorry

/-- `KTheoryFiniteLocalFields:L.5/tame-base-change-of-log-differentials`: for a finite extension
`L/K` with `B` the integral closure of `A`, of ramification index `e_{L/K}`
(`𝔪_A B = 𝔪_B^{e_{L/K}}`), `B ⊗_A ω¹_{(A,M_A)/W(k)} → ω¹_{(B,M_B)/W(k)}` is an isomorphism exactly
when `p ∤ e_{L/K}`. (The packet's parenthetical on `Ω¹`, an isomorphism iff `e_{L/K} = 1`, is
stated as the second clause.) -/
theorem tame_base_change_of_log_differentials (p : ℕ) [Fact p.Prime] (A : Type v) (K : Type w)
    (B : Type v) (L : Type w) [CommRing A] [IsDomain A] [IsDiscreteValuationRing A]
    [IsAdicComplete (maximalIdeal A) A] [CharZero A] [Field K] [Algebra A K]
    [IsFractionRing A K] [CharP (ResidueField A) p] [PerfectRing (ResidueField A) p]
    [CommRing B] [IsDomain B] [IsDiscreteValuationRing B] [Field L] [Algebra B L]
    [IsFractionRing B L] [Algebra K L] [FiniteDimensional K L] [Algebra A B] [Algebra A L]
    [IsScalarTower A B L] [IsScalarTower A K L] [IsIntegralClosure B A L]
    [Algebra (WittVector p (ResidueField A)) A] [Algebra (WittVector p (ResidueField A)) B]
    [IsScalarTower (WittVector p (ResidueField A)) A B]
    (hf : ∀ w : WittVector p (ResidueField A),
      residue A (algebraMap _ A w) = WittVector.constantCoeff w)
    (eLK : ℕ) (he : Ideal.map (algebraMap A B) (maximalIdeal A) = maximalIdeal B ^ eLK) :
    (Function.Bijective (baseChangeMap (WittVector p (ResidueField A)) A K B L) ↔ ¬ p ∣ eLK) ∧
      (Function.Bijective ((KaehlerDifferential.map (WittVector p (ResidueField A))
          (WittVector p (ResidueField A)) A B).liftBaseChange B) ↔ eLK = 1) := by
  sorry

/-- `KTheoryFiniteLocalFields:L.5/hochschild-homology-of-perfect-field`, its degree-one part:
for a perfect field `k` of characteristic `p`, `Ω¹_k = 0` (absolute Kähler differentials). The
full statement `HH_*(k) = k` needs Hochschild homology (supplier: RefinedTraceMethods RT.1). -/
theorem hochschild_homology_of_perfect_field (p : ℕ) [Fact p.Prime] (k : Type u) [Field k]
    [CharP k p] [PerfectRing k p] : Subsingleton (Ω[k⁄ℤ]) := by
  sorry

-- acceptance (non-example): for `k = 𝔽_p(t)` (not perfect), `dt ≠ 0` in `Ω¹_{k/𝔽_p}`.
example (p : ℕ) [Fact p.Prime] :
    KaehlerDifferential.D (ZMod p) (RatFunc (ZMod p)) RatFunc.X ≠ 0 := by
  sorry

end TauCeti.KTheoryFiniteLocal

/-! ### `KTheoryFiniteLocalFields:L.5/log-witt-complex` — log Witt complexes over `(R, M)` -/

/- `TauCeti.LogWittComplex`: not stated here; needs pro-log differential graded rings
`(E^*_•, M_E)` with `Dlog` and the prelog structure `W_n(R)` through `[-]_n` (supplier:
CrystallineCohomology CR.5:log-algebra, with the Witt complexes of CrystallineCohomology CR.4).
A structure with `Prop`-valued axiom fields over a type family would have to invent those
carriers here, so it is not introduced.
`TauCeti.LogWittComplex.Hom`: not stated here; needs `TauCeti.LogWittComplex` (supplier:
CrystallineCohomology CR.5:log-algebra, CR.4).
`TauCeti.LogWittComplex.frobenius_dlog`: not stated here; needs the pro-log dga `E^*_•` and its
`dlog_n` (supplier: CrystallineCohomology CR.5:log-algebra).
`TauCeti.LogWittComplex.frobenius_d_teichmuller`: not stated here; needs the pro-dga `E^*_•` with
`d` and `λ : W_•(R) → E^0_•` (supplier: CrystallineCohomology CR.4).
`TauCeti.LogWittComplex.frobenius_verschiebung`: not stated here; needs `F, V` on the pro-dga
`E^*_•` (supplier: CrystallineCohomology CR.4).
`TauCeti.LogWittComplex.ofWittComplex`: not stated here; needs Witt complexes over `R`
(supplier: CrystallineCohomology CR.4) and log Witt complexes (CR.5:log-algebra).
`TauCeti.LogWittComplex.restrictScalars`: not stated here; needs maps of log rings and log Witt
complexes (supplier: CrystallineCohomology CR.5:log-algebra). -/

-- test TauCeti.LogWittComplex.degreeZero (degenerate): not stated here; needs log Witt complexes
-- and `W_•ω^*_{(R,M)}` (supplier: CrystallineCohomology CR.5:log-algebra, CR.4).
-- test TauCeti.LogWittComplex.ofTrivial (compatibility): not stated here; needs the categories of
-- Witt complexes and log Witt complexes (supplier: CrystallineCohomology CR.4, CR.5:log-algebra).
-- test TauCeti.LogWittComplex.tr_example (computation): not stated here; needs `TR^•_*(ℤ_p|ℚ_p;p)`
-- (supplier: KTheoryFiniteLocalFields:L.4/thh-of-dvr-with-log-poles, RefinedTraceMethods RT.2).
-- test TauCeti.LogWittComplex.not_p2 (non-example): not stated here; needs `TR^•_*(ℤ_(2)|ℚ;2)`
-- with Connes' operator (supplier: KTheoryFiniteLocalFields:L.4/connes-operator, RT.2).

/- `KTheoryFiniteLocalFields:L.5/log-witt-complex-derived-relations`
(`TauCeti.KTheoryFiniteLocal.log_witt_complex_derived_relations`): not stated here; needs
log Witt complexes (supplier: KTheoryFiniteLocalFields:L.5/log-witt-complex, i.e.
CrystallineCohomology CR.5:log-algebra and CR.4). -/

/-! ### `KTheoryFiniteLocalFields:L.5/log-de-rham-witt-complex` — `W_•ω^*_{(R,M)}` -/

/- `TauCeti.logDeRhamWitt`: not stated here; needs the category of log Witt complexes and its
initial object (supplier: CrystallineCohomology CR.5:log-algebra, CR.4; the existence proof is
the Freyd adjoint-functor argument recorded as the gap KTheoryFiniteLocalFields/E24).
`TauCeti.logDeRhamWitt.lift`: not stated here; needs `TauCeti.logDeRhamWitt` and maps of log
Witt complexes (supplier: CR.5:log-algebra, CR.4).
`TauCeti.logDeRhamWitt.lift_unique`: not stated here; needs `TauCeti.logDeRhamWitt` and maps of
log Witt complexes (supplier: CR.5:log-algebra, CR.4).
`TauCeti.logDeRhamWitt.surjective_of_logDeRham`: not stated here; needs the log de Rham complex
`ω^*_{(W_n(R),M)}` of a general log ring and `W_nω^*_{(R,M)}` (supplier: CR.5:log-algebra).
`TauCeti.logDeRhamWitt.degreeZero`: not stated here; needs `W_nω^0_{(R,M)}` (supplier:
CR.5:log-algebra, CR.4).
`TauCeti.logDeRhamWitt.map`: not stated here; needs `W_•ω^*` and maps of log rings (supplier:
CR.5:log-algebra).
`TauCeti.logDeRhamWitt.ofDeRhamWitt`: not stated here; needs the de Rham–Witt complex `W_•Ω^*_R`
(supplier: CrystallineCohomology CR.4) and `W_•ω^*_{(R,M)}` (CR.5:log-algebra).
`TauCeti.logDeRhamWitt.dlog`: not stated here; needs `W_nω^1_{(R,M)}` (supplier:
CR.5:log-algebra, CR.4). -/

-- test TauCeti.logDeRhamWitt_levelOne (computation): not stated here; needs `W_1ω^*_{(R,M)}`
-- (supplier: CrystallineCohomology CR.5:log-algebra); its level-one target `ω¹_{(ℤ_p,M)}` is the
-- stand-in `TauCeti.LogKaehler ℤ ℤ_[p] ℚ_[p]`.
-- test TauCeti.logDeRhamWitt_trivial (compatibility): not stated here; needs `W_•ω^*_{(R,{1})}`
-- and `W_•Ω^*_R` (supplier: CrystallineCohomology CR.4, CR.5:log-algebra).
-- test TauCeti.logDeRhamWitt_units (degenerate): not stated here; needs `W_•ω^*_{(R,Rˣ)}` and
-- `W_•Ω^*_R` (supplier: CrystallineCohomology CR.4, CR.5:log-algebra).
-- test TauCeti.logDeRhamWitt_Zp_dim (computation): not stated here; needs `W_nω¹_{(ℤ_p,M)}`
-- (supplier: CrystallineCohomology CR.5:log-algebra, CR.4).
-- test TauCeti.logDeRhamWitt_ne_ordinary (non-example): not stated here; needs `W_1ω¹_{(A,M)}` and
-- `W_1Ω¹_{ℤ_p}` (supplier: CrystallineCohomology CR.4, CR.5:log-algebra).

/- `KTheoryFiniteLocalFields:L.5/log-de-rham-witt-level-one`
(`TauCeti.KTheoryFiniteLocal.log_de_rham_witt_level_one`): not stated here; needs
`W_1ω^*_{(R,M)}` and the universal log dga `ω^*_{(R,M)}` of a general log ring (supplier:
CrystallineCohomology CR.5:log-algebra).
`KTheoryFiniteLocalFields:L.5/standard-filtration-quotient`
(`TauCeti.KTheoryFiniteLocal.standard_filtration_quotient`): not stated here; needs log Witt
complexes and `W_nω^i_{(R,M)}` (supplier: CrystallineCohomology CR.5:log-algebra, CR.4). -/

/-! ### `KTheoryFiniteLocalFields:L.5/homotopy-orbit-de-rham-witt-module` — `F^{n-1}d` and
`hW_nω^i`

`F^{n-1}d(a) = Σ_i a_i^{p^{n-1-i}-1} da_i` only involves the differentials `da_i`, so it is an
honest map into `Ω¹_{R/ℤ}`; its composite with `Ω¹_R → ω¹_{(R,M)}` is Hesselholt–Madsen's map.
The module `hW_nω^i` needs `ω^{i-1}` and `ω^i` of a general log ring and is recorded as a
comment. -/

namespace TauCeti.logDeRhamWitt

/-- **`F^{n-1}d : W_n(R) → Ω¹_R`**, `a ↦ Σ_{i<n} a_i^{p^{n-1-i}-1} da_i` (a real definition;
`F^{n-1}d` of Hesselholt–Madsen is its image in `ω¹_{(R,M)}`). -/
def frobeniusIterD (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] (n : ℕ)
    (a : TruncatedWittVector p n R) : Ω[R⁄ℤ] :=
  ∑ i : Fin n, a.coeff i ^ (p ^ (n - 1 - (i : ℕ)) - 1) • KaehlerDifferential.D ℤ R (a.coeff i)

/-- `frobeniusIterD_derivation`: `F^{n-1}d(ab) = F^{n-1}(a) F^{n-1}d(b) + F^{n-1}(b) F^{n-1}d(a)`,
where `F^{n-1} : W_n(R) → W_1(R) = R` is the ghost component `w_{n-1}`. -/
theorem frobeniusIterD_derivation (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] (n : ℕ)
    (hn : 0 < n) (a b : TruncatedWittVector p n R) :
    frobeniusIterD p R n (a * b) =
      WittVector.ghostComponent (n - 1) a.out • frobeniusIterD p R n b +
        WittVector.ghostComponent (n - 1) b.out • frobeniusIterD p R n a := by
  sorry

/-- `d_frobeniusIter`: `d(F^{n-1}(a)) = p^{n-1} F^{n-1}d(a)`. -/
theorem d_frobeniusIter (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] (n : ℕ) (hn : 0 < n)
    (a : TruncatedWittVector p n R) :
    KaehlerDifferential.D ℤ R (WittVector.ghostComponent (n - 1) a.out) =
      (p : R) ^ (n - 1) • frobeniusIterD p R n a := by
  sorry

/- `TauCeti.logDeRhamWitt.hW`: not stated here; needs `ω^{i-1}_{(R,M)}` and `ω^i_{(R,M)}` of a
general log ring with the twisted `W_n(R)`-module structure (supplier: CrystallineCohomology
CR.5:log-algebra; the stand-in `TauCeti.LogKaehler` covers only `ω¹` of a domain with its
canonical log structure).
`TauCeti.logDeRhamWitt.hW_exact`: not stated here; needs `TauCeti.logDeRhamWitt.hW` and the
`p^{n-1}`-torsion of `ω^{i-1}_{(R,M)}` (supplier: CR.5:log-algebra).
`TauCeti.logDeRhamWitt.hW_map`: not stated here; needs `TauCeti.logDeRhamWitt.hW` and maps of log
rings (supplier: CR.5:log-algebra). -/

-- test TauCeti.logDeRhamWitt.hW_n_one (degenerate): not stated here; needs `hW_1ω^i_{(R,M)}`
-- (supplier: CrystallineCohomology CR.5:log-algebra).

-- test TauCeti.logDeRhamWitt.frobeniusIterD_teichmuller (computation)
example (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] (n : ℕ) (a : R) :
    frobeniusIterD p R n (TauCeti.WittVector.teichmullerTrunc p n R a) =
      a ^ (p ^ (n - 1) - 1) • KaehlerDifferential.D ℤ R a := by
  sorry

-- test TauCeti.logDeRhamWitt.frobeniusIterD_V (computation)
/- `F^{n-1}d(V^{n-1}[a]_1) = da` in `W_n(R)` (written for level `n + 1`): only the last coordinate
of `V^n [a] = (0, …, 0, a)` is nonzero. -/
example (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] (n : ℕ) (a : R) :
    frobeniusIterD p R (n + 1)
        (WittVector.truncate (n + 1)
          ((⇑(WittVector.verschiebung (p := p) (R := R)))^[n] (WittVector.teichmuller p a))) =
      KaehlerDifferential.D ℤ R a := by
  sorry

-- test TauCeti.logDeRhamWitt.hW_Zp_degree_one (compatibility): not stated here; needs
-- `hW_2ω¹_{(ℤ_p,M)}` (supplier: CR.5:log-algebra) and `hTR^2_1(ℤ_p|ℚ_p;p)` (supplier:
-- KTheoryFiniteLocalFields:L.4/norm-restriction-cofibre-sequence, RefinedTraceMethods RT.2).

-- test TauCeti.logDeRhamWitt.frobeniusIterD_not_additive_naive (non-example)
/- The naive `a ↦ d(a_0)` is additive, but it is not a derivation for the `F^{n-1}`-twisted module
structure: for `R = ℤ[x]`, `p = 3`, `n = 2`, `a = b = [x]_2`, `d((ab)_0) = 2x dx` while
`w_1(a) d(b_0) + w_1(b) d(a_0) = 2x³ dx`. (The packet's phrasing "needed for additivity" is
corrected in the report: the naive map fails the Leibniz rule, not additivity.) -/
example [Fact (Nat.Prime 3)] :
    KaehlerDifferential.D ℤ (Polynomial ℤ)
        ((TauCeti.WittVector.teichmullerTrunc 3 2 (Polynomial ℤ) Polynomial.X *
          TauCeti.WittVector.teichmullerTrunc 3 2 (Polynomial ℤ) Polynomial.X).coeff 0) ≠
      WittVector.ghostComponent 1
          (TauCeti.WittVector.teichmullerTrunc 3 2 (Polynomial ℤ) Polynomial.X).out •
          KaehlerDifferential.D ℤ (Polynomial ℤ) Polynomial.X +
        WittVector.ghostComponent 1
          (TauCeti.WittVector.teichmullerTrunc 3 2 (Polynomial ℤ) Polynomial.X).out •
          KaehlerDifferential.D ℤ (Polynomial ℤ) Polynomial.X := by
  sorry

end TauCeti.logDeRhamWitt

/- `KTheoryFiniteLocalFields:L.5/kernel-of-restriction`
(`TauCeti.KTheoryFiniteLocal.kernel_of_restriction`): not stated here; needs `W_nω^i_{(R,M)}` and
`hW_nω^i_{(R,M)}` (supplier: CrystallineCohomology CR.5:log-algebra, CR.4).
`KTheoryFiniteLocalFields:L.5/log-de-rham-witt-dvr-divisible`
(`TauCeti.KTheoryFiniteLocal.log_de_rham_witt_dvr_divisible`): not stated here; needs
`W_nω^i_{(A,M)}` for `i ≥ 2` (supplier: CrystallineCohomology CR.5:log-algebra, CR.4).
`KTheoryFiniteLocalFields:L.5/log-de-rham-witt-dvr-mod-p`
(`TauCeti.KTheoryFiniteLocal.log_de_rham_witt_dvr_mod_p`): not stated here; needs
`W_nω^*_{(A,M)}/p` as a differential graded `k`-algebra (supplier: CrystallineCohomology
CR.5:log-algebra, CR.4); its degree-zero part `W̄_n(A)` is
`TauCeti.KTheoryFiniteLocal.witt_mod_p_of_dvr`. -/

/-! ### `KTheoryFiniteLocalFields:L.5/tr-log-structure-maps` — `α_n`, `dlog_n` on `TR^n(A|K;p)` -/

/- `TauCeti.HM.logTR.alpha`: not stated here; needs `TR^n_0(A|K;p)` (supplier:
KTheoryFiniteLocalFields:L.4/thh-of-dvr-with-log-poles, RefinedTraceMethods RT.2).
`TauCeti.HM.logTR.dlog`: not stated here; needs `TR^n_1(A|K;p)`, the determinant
`Σ^∞B Aut(A) → K(C^b_q(P_A))` and the cyclotomic trace (supplier: L.4/thh-of-dvr-with-log-poles,
RefinedTraceMethods RT.2, RT.3).
`TauCeti.HM.logTR.dlog_mul`: not stated here; needs `TauCeti.HM.logTR.dlog` (supplier:
L.4/thh-of-dvr-with-log-poles, RT.2).
`TauCeti.HM.logTR.frobenius_dlog`: not stated here; needs `F, R` on `TR^•_1(A|K;p)` (supplier:
KTheoryFiniteLocalFields:L.4/tr-pro-spectrum, RT.2).
`TauCeti.HM.logTR.boundary_dlog`: not stated here; needs the localisation boundary
`π_1T(A|K) → π_0T(k)` (supplier: KTheoryFiniteLocalFields:L.4/tr-localization-sequence).
`TauCeti.HM.logTR.alpha_eq_teichmuller`: not stated here; needs `π_0TR^n(A|K;p) ≅ W_n(A)`
(supplier: KTheoryFiniteLocalFields:L.4/pi0-tr-is-witt-vectors); its target, the truncated
Teichmüller map, is `TauCeti.WittVector.teichmullerTrunc`. -/

-- test TauCeti.HM.logTR.boundary_dlog_uniformizer (computation): not stated here; needs `dlog_1`
-- and the boundary `π_1T(A|K) → π_0T(k)` (supplier: L.4/tr-localization-sequence); the
-- algebraic shadow `res(dlog π) = 1`, `res(dlog u) = 0` is part of
-- `TauCeti.KTheoryFiniteLocal.log_differentials_residue_sequence`.
-- test TauCeti.HM.logTR.dlog_one (degenerate): not stated here; needs `TauCeti.HM.logTR.dlog`
-- (supplier: L.4/thh-of-dvr-with-log-poles, RT.2).
-- test TauCeti.HM.logTR.dlog_unit (compatibility): not stated here; needs `π_1T(A) ⊂ π_1T(A|K)`
-- (supplier: L.4/thh-of-dvr-with-log-poles); the log-differential identity `u·dlog u = du` is
-- `TauCeti.LogKaehler.dlog_unit`.
-- test TauCeti.HM.logTR.dlog_not_in_A (non-example): not stated here; needs `π_1T(A) → π_1T(A|K)`
-- and its boundary (supplier: KTheoryFiniteLocalFields:L.4/tr-localization-sequence).

/- `KTheoryFiniteLocalFields:L.5/dlog-relation` (`TauCeti.KTheoryFiniteLocal.dlog_relation`):
not stated here; needs `α_n`, `dlog_n` and Connes' operator on `TR^n_*(A|K;p)` (supplier:
KTheoryFiniteLocalFields:L.4/connes-operator, L.4/thh-of-dvr-with-log-poles).
`KTheoryFiniteLocalFields:L.5/tr-log-dvr-is-log-dga`
(`TauCeti.KTheoryFiniteLocal.tr_log_dvr_is_log_dga`): not stated here; needs `TR^n_*(A|K;p)` as a
graded ring with `d` and log dgas (supplier: L.4/thh-of-dvr-with-log-poles, RefinedTraceMethods
RT.2, CrystallineCohomology CR.5:log-algebra).
`KTheoryFiniteLocalFields:L.5/thh-of-dvr-p-adic` (`TauCeti.KTheoryFiniteLocal.thh_of_dvr_p_adic`):
not stated here; needs `π_*(T(A);ℤ_p)` (supplier: L.4/thh-of-dvr-with-log-poles, RT.2,
StableHomotopyKTheory H.6).
`KTheoryFiniteLocalFields:L.5/thh-of-dvr-mod-p` (`TauCeti.KTheoryFiniteLocal.thh_of_dvr_mod_p`):
not stated here; needs `π_*(T(A);ℤ/p)` as a graded `k`-algebra (supplier:
L.4/thh-of-dvr-with-log-poles, RT.2).
`KTheoryFiniteLocalFields:L.5/log-thh-low-degrees`
(`TauCeti.KTheoryFiniteLocal.log_thh_low_degrees`): not stated here; needs `π_qT(A|K)` (supplier:
L.4/thh-of-dvr-with-log-poles, RT.2); its algebraic side `ω¹_{(A,M)}` is `TauCeti.LogKaehler ℤ A K`.
`KTheoryFiniteLocalFields:L.5/log-thh-mod-p` (`TauCeti.KTheoryFiniteLocal.log_thh_mod_p`): not
stated here; needs `π_*(T(A|K);ℤ/p)` and the class `κ` (supplier: L.4/thh-of-dvr-with-log-poles,
RT.2).
`KTheoryFiniteLocalFields:L.5/log-thh-p-adic` (`TauCeti.KTheoryFiniteLocal.log_thh_p_adic`): not
stated here; needs `π_*(T(A|K);ℤ_p)` (supplier: L.4/thh-of-dvr-with-log-poles, RT.2, H.6).
`KTheoryFiniteLocalFields:L.5/log-thh-tame-descent`
(`TauCeti.KTheoryFiniteLocal.log_thh_tame_descent`): not stated here; needs the homotopy fixed
points `H^•(G_{L/K}, T(B|L))` (supplier: RefinedTraceMethods RT.2, L.4/thh-of-dvr-with-log-poles).
`KTheoryFiniteLocalFields:L.5/tr-log-dvr-is-log-witt-complex`
(`TauCeti.KTheoryFiniteLocal.tr_log_dvr_is_log_witt_complex`): not stated here; needs
`TR^•_*(A|K;p)` and log Witt complexes (supplier: L.4/tr-pro-spectrum, CR.5:log-algebra, CR.4).
`KTheoryFiniteLocalFields:L.5/homotopy-orbit-comparison`
(`TauCeti.KTheoryFiniteLocal.homotopy_orbit_comparison`): not stated here; needs `hW_nω^i` and
`hTR^n_i(A|K;p)` (supplier: CR.5:log-algebra, L.4/norm-restriction-cofibre-sequence).
`KTheoryFiniteLocalFields:L.5/frobenius-on-homotopy-orbits`
(`TauCeti.KTheoryFiniteLocal.frobenius_on_homotopy_orbits`): not stated here; needs
`hTR^n_2(A|K;p,ℤ_p)` (supplier: L.4/norm-restriction-cofibre-sequence, H.6).
`KTheoryFiniteLocalFields:L.5/log-de-rham-witt-tr-level-two`
(`TauCeti.KTheoryFiniteLocal.log_de_rham_witt_tr_level_two`): not stated here; needs
`TR^n_q(A|K;p)` and `W_nω^q_{(A,M)}` (supplier: L.4/tr-pro-spectrum, CR.5:log-algebra, CR.4).
`KTheoryFiniteLocalFields:L.5/norm-restriction-exact-low-degrees`
(`TauCeti.KTheoryFiniteLocal.norm_restriction_exact_low_degrees`): not stated here; needs
`hTR^n_i`, `TR^n_i(A|K;p)` (supplier: L.4/norm-restriction-cofibre-sequence, RT.2).
`KTheoryFiniteLocalFields:L.5/tr2-of-dvr-divisible`
(`TauCeti.KTheoryFiniteLocal.tr2_of_dvr_divisible`): not stated here; needs `TR^n_2(A;p)`
(supplier: L.4/dvr-tr-agrees-with-ring-tr, RT.2).
`KTheoryFiniteLocalFields:L.5/log-de-rham-witt-tr-low-degrees`
(`TauCeti.KTheoryFiniteLocal.log_de_rham_witt_tr_low_degrees`): not stated here; needs
`W_nω^q_{(A,M)} → TR^n_q(A|K;p)` (supplier: CR.5:log-algebra, CR.4, L.4/tr-pro-spectrum).
`KTheoryFiniteLocalFields:L.5/connecting-map-of-kappa`
(`TauCeti.KTheoryFiniteLocal.connecting_map_of_kappa`): not stated here; needs
`TR^1_2(A|K;p,ℤ/p) → hTR^2_1(A|K;p,ℤ/p)` and `κ` (supplier: L.4/norm-restriction-cofibre-sequence,
RT.2, H.6). -/

namespace TauCeti.KTheoryFiniteLocal

open IsLocalRing TauCeti.LogKaehler

/-- `KTheoryFiniteLocalFields:L.5/lubin-tate-unit-polynomial`: if `μ_p ⊂ K`, a generator `ζ` of
`μ_p` and a uniformiser `π` determine `u_K ∈ W(k)[x]` of degree `< e` with
`u_K(π)^{p-1} = θ(π)`, and in `ω¹_{(A,M)}`, `dlog ζ = -π^{e/(p-1)} u_K(π)⁻¹ dlog(-p)`, written
`u_K(π)·dlog ζ = -π^{e/(p-1)}·dlog(-p)`. The addendum for a totally ramified `L/K`
(`ι(u_K(π_K)) = (-θ_{L/K}(π_L))^{-e_K/(p-1)} u_L(π_L)`) needs the functoriality of the
Eisenstein data in `L/K` and is not stated here. -/
theorem lubin_tate_unit_polynomial (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (A : Type v) (K : Type w)
    [CommRing A] [IsDomain A] [IsDiscreteValuationRing A] [IsAdicComplete (maximalIdeal A) A]
    [CharZero A] [Field K] [Algebra A K] [IsFractionRing A K] [CharP (ResidueField A) p]
    [PerfectRing (ResidueField A) p] [Algebra (WittVector p (ResidueField A)) A]
    (hf : ∀ w : WittVector p (ResidueField A),
      residue A (algebraMap _ A w) = WittVector.constantCoeff w)
    (π : A) (hπ : Irreducible π) (e : ℕ) (he : Ideal.span {(p : A)} = maximalIdeal A ^ e)
    (θ : Polynomial (WittVector p (ResidueField A))) (hθ : θ.natDegree < e)
    (hφ : Polynomial.aeval π (Polynomial.X ^ e + Polynomial.C (p : WittVector p _) * θ) = 0)
    (ζ : Kˣ) (hζ : IsPrimitiveRoot ζ p) (hpK : (p : K) ≠ 0) :
    ∃ u : Polynomial (WittVector p (ResidueField A)),
      u.natDegree < e ∧ IsUnit (Polynomial.aeval π u) ∧
      Polynomial.aeval π u ^ (p - 1) = Polynomial.aeval π θ ∧
      Polynomial.aeval π u • dlog ℤ A K (Additive.ofMul ζ) =
        -(π ^ (e / (p - 1)) • dlog ℤ A K
          (Additive.ofMul (Units.mk0 (-(p : K)) (neg_ne_zero.mpr hpK)))) := by
  sorry

end TauCeti.KTheoryFiniteLocal

/- `KTheoryFiniteLocalFields:L.5/log-thh-mod-p-alpha-presentation`
(`TauCeti.KTheoryFiniteLocal.log_thh_mod_p_alpha_presentation`): not stated here; needs
`π_*(T(A|K);ℤ/p)` as a differential graded `k`-algebra and `α_K = u_K(π)⁻¹κ` (supplier:
KTheoryFiniteLocalFields:L.4/thh-of-dvr-with-log-poles, RefinedTraceMethods RT.2). -/

/-! ### `KTheoryFiniteLocalFields:L.5/bott-element-in-tr` — the Bott elements `b_n` -/

/- `TauCeti.HM.bottTR`: not stated here; needs `TR^n_2(A|K;p,ℤ/p^v)`, the determinant
`Σ^∞Bμ_{p^v+} → K(K)` and the cyclotomic trace (supplier:
KTheoryFiniteLocalFields:L.4/tr-pro-spectrum,
RefinedTraceMethods RT.2, RT.3, StableHomotopyKTheory H.6).
`TauCeti.HM.bottTR_bockstein`: not stated here; needs `TauCeti.HM.bottTR`, the Bockstein and
`dlog_n` (supplier: L.4/tr-pro-spectrum, H.6).
`TauCeti.HM.bottTR_restriction`: not stated here; needs `R, F` on `TR^•_2(A|K;p,ℤ/p^v)` (supplier:
L.4/tr-pro-spectrum).
`TauCeti.HM.bottTR_mul`: not stated here; needs `TauCeti.HM.bottTR` (supplier: L.4/tr-pro-spectrum,
RT.3).
`TauCeti.HM.bottTR_pow`: not stated here; needs `v_1 ∈ π̄_{2p-2}(S^0)` and the unit map (supplier:
RefinedTraceMethods RT.2, StableHomotopyKTheory H.6).
`TauCeti.HM.bottTR_one`: not stated here; needs `π̄_2T(A|K)` and `α_K` (supplier:
L.4/thh-of-dvr-with-log-poles, RT.2). -/

-- test TauCeti.HM.bottTR_Qp_zeta_p (computation): not stated here; needs `π̄_2T(A|K)` for
-- `K = ℚ_p(ζ_p)` (supplier: L.4/thh-of-dvr-with-log-poles, RefinedTraceMethods RT.2).
-- test TauCeti.HM.bottTR_trivial_root (degenerate): not stated here; needs
-- `TauCeti.HM.bottTR` (supplier: L.4/tr-pro-spectrum, RT.3).
-- test TauCeti.HM.bottTR_kernel (compatibility): not stated here; needs the K-theory Bott element
-- `β_ζ ∈ K_2(K;ℤ/p^v)` (supplier: KTheoryFiniteLocalFields:L.1/bott-element) and the trace
-- (RefinedTraceMethods RT.3).
-- test TauCeti.HM.bottTR_not_integral (non-example): not stated here; needs `TR^n_2(A|K;p)` and
-- its mod `p^v` groups (supplier: L.4/tr-pro-spectrum, H.6).

/- `KTheoryFiniteLocalFields:L.5/reduction-mod-p-of-thh-dvr`
(`TauCeti.KTheoryFiniteLocal.reduction_mod_p_of_thh_dvr`): not stated here; needs
`π̄_*T(A) → π̄_*T(A/p)` and `π̄_*T(k)` (supplier: L.4/thh-of-dvr-with-log-poles, RT.2).
`KTheoryFiniteLocalFields:L.5/kappa-differential`
(`TauCeti.KTheoryFiniteLocal.kappa_differential`): not stated here; needs `κ̃ ∈ π̄_2T(A)` and
Connes' operator (supplier: L.4/connes-operator, L.4/thh-of-dvr-with-log-poles).
`KTheoryFiniteLocalFields:L.5/tate-perfect-field-generators`
(`TauCeti.KTheoryFiniteLocal.tate_perfect_field_generators`): not stated here; needs the Tate
spectral sequence of `T(k)` (supplier:
KTheoryFiniteLocalFields:L.4/multiplicative-tate-spectral-sequence,
RT.2).
`KTheoryFiniteLocalFields:L.5/tate-infinite-cycle-dlog`
(`TauCeti.KTheoryFiniteLocal.tate_infinite_cycle_dlog`): not stated here; needs
`Ê^*(C_{p^n}, T(A|K))` and `Γ̂` (supplier: L.4/multiplicative-tate-spectral-sequence,
L.4/norm-restriction-cofibre-sequence).
`KTheoryFiniteLocalFields:L.5/tate-infinite-cycles-uniformizer`
(`TauCeti.KTheoryFiniteLocal.tate_infinite_cycles_uniformizer`): not stated here; needs
`Ê^*(C_{p^n}, T(A|K))` and `Γ̂` (supplier: L.4/multiplicative-tate-spectral-sequence).
`KTheoryFiniteLocalFields:L.5/tate-infinite-cycles-v1`
(`TauCeti.KTheoryFiniteLocal.tate_infinite_cycles_v1`): not stated here; needs
`Ê^*(C_{p^n}, T(A|K))`, `v_1` and the unit map (supplier: L.4/multiplicative-tate-spectral-sequence,
StableHomotopyKTheory H.6). -/

namespace TauCeti.PowerSeries

/-- `KTheoryFiniteLocalFields:L.5/log-derivative-frobenius-lemma`: for `k` a field of
characteristic `p` and `f ∈ k⟦x⟧` with `f(0) ≠ 0`, the coefficients of
`x f'(x)/f(x) = a_1 x + a_2 x² + ⋯` satisfy `a_{p i} = a_i^p` for `i ≥ 1`. -/
theorem log_derivative_frobenius_lemma (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    (f : PowerSeries k) (hf : PowerSeries.constantCoeff f ≠ 0) (i : ℕ) (hi : 0 < i) :
    PowerSeries.coeff (p * i) (PowerSeries.X * PowerSeries.derivative k f * f⁻¹) =
      PowerSeries.coeff i (PowerSeries.X * PowerSeries.derivative k f * f⁻¹) ^ p := by
  sorry

-- acceptance (computation): `k = 𝔽_3`, `f = 1 + x`: `x f'/f = x - x² + x³ - ⋯`, `a_3 = 1 = a_1^3`.
example :
    PowerSeries.coeff 3 (PowerSeries.X * PowerSeries.derivative (ZMod 3) (1 + PowerSeries.X) *
        (1 + PowerSeries.X)⁻¹) = 1 := by
  sorry

end TauCeti.PowerSeries

/- `KTheoryFiniteLocalFields:L.5/tate-spectral-sequence-first-level`
(`TauCeti.KTheoryFiniteLocal.tate_spectral_sequence_first_level`): not stated here; needs
`Ê^*(C_p, M_p ∧ T(A|K))` as a spectral sequence of bigraded `k`-algebras (supplier:
KTheoryFiniteLocalFields:L.4/multiplicative-tate-spectral-sequence, RefinedTraceMethods RT.2).
`KTheoryFiniteLocalFields:L.5/gamma-hat-mod-p-isomorphism`
(`TauCeti.KTheoryFiniteLocal.gamma_hat_mod_p_isomorphism`): not stated here; needs
`Γ̂ : π̄_iT(A|K) → π̄_iĤ(C_p, T(A|K))` (supplier: L.4/norm-restriction-cofibre-sequence, RT.2).
`KTheoryFiniteLocalFields:L.5/gamma-hat-all-levels`
(`TauCeti.KTheoryFiniteLocal.gamma_hat_all_levels`): not stated here; needs `Γ̂`, `Γ` on the
fixed points of `T(A|K)` with `ℤ/p^v` coefficients (supplier: L.4/norm-restriction-cofibre-sequence,
StableHomotopyKTheory H.6).
`KTheoryFiniteLocalFields:L.5/tate-spectral-sequence-unramified`
(`TauCeti.KTheoryFiniteLocal.tate_spectral_sequence_unramified`): not stated here; needs
`Ê^*(C_{p^n}, T(W(k)|K_0))` (supplier: L.4/multiplicative-tate-spectral-sequence).
`KTheoryFiniteLocalFields:L.5/tate-spectral-sequence-deeply-ramified`
(`TauCeti.KTheoryFiniteLocal.tate_spectral_sequence_deeply_ramified`): not stated here; needs
`Ê^*(C_{p^n}, T(A|K))` (supplier: L.4/multiplicative-tate-spectral-sequence).
`KTheoryFiniteLocalFields:L.5/tate-spectral-sequence-e-r-terms`
(`TauCeti.KTheoryFiniteLocal.tate_spectral_sequence_e_r_terms`): not stated here; needs the
`E^r`-terms of `Ê^*(C_{p^n}, T(A|K))` (supplier: L.4/multiplicative-tate-spectral-sequence).
`KTheoryFiniteLocalFields:L.5/tate-spectral-sequence-differentials`
(`TauCeti.KTheoryFiniteLocal.tate_spectral_sequence_differentials`): not stated here; needs the
differentials of `Ê^*(C_{p^n}, T(A|K))` (supplier: L.4/multiplicative-tate-spectral-sequence).
`KTheoryFiniteLocalFields:L.5/frobenius-surjective-odd-degrees`
(`TauCeti.KTheoryFiniteLocal.frobenius_surjective_odd_degrees`): not stated here; needs
`F : TR^n_{2i+1}(A|K;p) → TR^{n-1}_{2i+1}(A|K;p)` (supplier: L.4/tr-pro-spectrum).
`KTheoryFiniteLocalFields:L.5/tr-mod-p-dimension` (`TauCeti.KTheoryFiniteLocal.tr_mod_p_dimension`):
not stated here; needs `TR^n_q(A|K;p,ℤ/p)` (supplier: L.4/tr-pro-spectrum, H.6); its degree-zero
count `dim_k W̄_n(A) = n·e` is `TauCeti.KTheoryFiniteLocal.witt_mod_p_of_dvr`.
`KTheoryFiniteLocalFields:L.5/bott-multiplication-standard-basis`
(`TauCeti.KTheoryFiniteLocal.bott_multiplication_standard_basis`): not stated here; needs `b_n` and
the standard basis of `Ê^∞(C_{p^n}, T(A|K))` (supplier: L.5/bott-element-in-tr,
L.4/multiplicative-tate-spectral-sequence).
`KTheoryFiniteLocalFields:L.5/image-of-log-de-rham-witt`
(`TauCeti.KTheoryFiniteLocal.image_of_log_de_rham_witt`): not stated here; needs
`W_nω^*_{(A,M)} ⊗ S_{ℤ/p}(μ_p) → TR^n_*(A|K;p,ℤ/p)` (supplier: CR.5:log-algebra, CR.4,
L.4/tr-pro-spectrum).
`KTheoryFiniteLocalFields:L.5/log-de-rham-witt-tr-mod-p`
(`TauCeti.KTheoryFiniteLocal.log_de_rham_witt_tr_mod_p`): not stated here; needs pro-abelian
groups `W_•ω^*_{(A,M)} ⊗ S(μ_p)` and `TR^•_*(A|K;p,ℤ/p)` (supplier: CR.5:log-algebra, CR.4,
L.4/tr-pro-spectrum).
`KTheoryFiniteLocalFields:L.5/log-de-rham-witt-tr-mod-pv`
(`TauCeti.KTheoryFiniteLocal.log_de_rham_witt_tr_mod_pv`): not stated here; needs the same carriers
with `ℤ/p^v` coefficients and `b_ζ` (supplier: CR.5:log-algebra, CR.4, L.4/tr-pro-spectrum,
L.5/bott-element-in-tr).
`KTheoryFiniteLocalFields:L.5/roots-of-unity-torsion-in-log-drw`
(`TauCeti.KTheoryFiniteLocal.roots_of_unity_torsion_in_log_drw`): not stated here; needs the
pro-group `W_•ω¹_{(A,M)}` and its `dlog_•` (supplier: CrystallineCohomology CR.5:log-algebra, CR.4);
at level one only its (non-isomorphic) map `A/p ⊗ μ_p → _pω¹` exists, and the target
`_pω¹ = A/p·dlog(-p)` is `TauCeti.KTheoryFiniteLocal.log_differentials_p_torsion`.
`KTheoryFiniteLocalFields:L.5/tc-of-log-dvr-mod-p`
(`TauCeti.KTheoryFiniteLocal.tc_of_log_dvr_mod_p`):
not stated here; needs `TC_*(A|K;p,ℤ/p)` (supplier: KTheoryFiniteLocalFields:L.4/p-typical-tc,
L.4/thh-of-dvr-with-log-poles) and the Galois cohomology `H^i(K, μ_p^{⊗s})` of the twists
(supplier: MotivicEtaleKTheory M.1).
`KTheoryFiniteLocalFields:L.5/thh-of-perfect-field`
(`TauCeti.KTheoryFiniteLocal.thh_of_perfect_field`): not stated here; needs `π_*T(k)` (supplier:
RefinedTraceMethods RT.2, KTheoryFiniteLocalFields:L.4/thh-of-linear-waldhausen-category).
`KTheoryFiniteLocalFields:L.5/tr-of-perfect-field`
(`TauCeti.KTheoryFiniteLocal.tr_of_perfect_field`):
not stated here; needs `π_*TR^{n+1}(k;p)` with `R, F, V` (supplier: L.4/tr-pro-spectrum, RT.2). -/

namespace TauCeti.KTheoryFiniteLocal

/-- `KTheoryFiniteLocalFields:L.5/tc-of-perfect-field`, its Witt-vector content: for a perfect
field `k` of characteristic `p`, `ker(1 - F : W(k) → W(k)) = W(𝔽_p)`; for `k` finite
`coker(1 - F) ≅ ℤ_p` and `coker(1 - φ : k → k) ≅ 𝔽_p`; for `k` algebraically closed `1 - F` is
onto. The identification `TC_0(k;p) = ker(1 - F)`, `TC_{-1}(k;p) = coker(1 - F)` needs
`TC(k;p)` (supplier: KTheoryFiniteLocalFields:L.4/p-typical-tc, RefinedTraceMethods RT.2). -/
theorem tc_of_perfect_field (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    [PerfectRing k p] :
    {x : WittVector p k | WittVector.frobenius x = x} =
        Set.range (WittVector.map (ZMod.castHom (dvd_refl p) k)) ∧
      (Finite k → Nonempty ((WittVector p k ⧸
          (AddMonoidHom.id (WittVector p k) -
            (WittVector.frobenius : WittVector p k →+* WittVector p k).toAddMonoidHom).range) ≃+
          ℤ_[p]) ∧
        Nonempty ((k ⧸ (AddMonoidHom.id k - (frobenius k p).toAddMonoidHom).range) ≃+
          ZMod p)) ∧
      (IsAlgClosed k →
        Function.Surjective fun x : WittVector p k => x - WittVector.frobenius x) := by
  sorry

end TauCeti.KTheoryFiniteLocal

/- `KTheoryFiniteLocalFields:L.5/trace-equivalence-finite-witt-algebras`
(`TauCeti.KTheoryFiniteLocal.trace_equivalence_finite_witt_algebras`): not stated here; needs the
cyclotomic trace `K(A)^∧_p → TC(A;p)^∧_p` (supplier: RefinedTraceMethods RT.3,
GeneralAlgebraicKTheory K.1, StableHomotopyKTheory H.6).
`KTheoryFiniteLocalFields:L.5/trace-isomorphism-for-local-field`
(`TauCeti.KTheoryFiniteLocal.trace_isomorphism_for_local_field`): not stated here; needs
`K_i(K;ℤ/p^v)` and `TC_i(A|K;p,ℤ/p^v)` with the trace (supplier:
KTheoryFiniteLocalFields:L.1/k-theory-mod-m,
L.4/k-tc-localization-square, RT.3).
`KTheoryFiniteLocalFields:L.5/thh-of-pointed-monoid-algebra`
(`TauCeti.KTheoryFiniteLocal.thh_of_pointed_monoid_algebra`): not stated here; needs `T(A)`, the
cyclic bar construction `N^cy(Π)` as a `𝕋`-space and `F`-equivalences of cyclotomic spectra
(supplier: RefinedTraceMethods RT.2).
`KTheoryFiniteLocalFields:L.5/cyclic-bar-construction-of-truncated-monoid`
(`TauCeti.KTheoryFiniteLocal.cyclic_bar_construction_of_truncated_monoid`): not stated here; needs
pointed `𝕋`-spaces, `S^λ` and exact triangles of `𝕋`-spaces (supplier: RefinedTraceMethods RT.2). -/

namespace TauCeti

/-- `KTheoryFiniteLocalFields:L.5/hochschild-homology-of-truncated-polynomial-algebra`, its
degree-one part: if `e = 0` in `k`, then `HH_1(k[x]/(x^e)) = Ω¹_{k[x]/(x^e)/k}` is free of rank one
over `k[x]/(x^e)` on `dx` (so `d(x^e) = e x^{e-1} dx = 0` imposes nothing). The whole graded
statement `HH_*(k[x]/(x^e)) ≅ k(Π) ⊗ Λ{c_1} ⊗ Γ{c_2}` needs Hochschild homology (supplier:
RefinedTraceMethods RT.1). -/
theorem hochschild_homology_of_truncated_polynomial_algebra (k : Type u) [CommRing k] (e : ℕ)
    (he : (e : k) = 0) :
    Submodule.span (Polynomial k ⧸ Ideal.span {(Polynomial.X ^ e : Polynomial k)})
        {KaehlerDifferential.D k (Polynomial k ⧸ Ideal.span {(Polynomial.X ^ e : Polynomial k)})
          (Ideal.Quotient.mk _ Polynomial.X)} = ⊤ ∧
      ∀ a : Polynomial k ⧸ Ideal.span {(Polynomial.X ^ e : Polynomial k)},
        a • KaehlerDifferential.D k
          (Polynomial k ⧸ Ideal.span {(Polynomial.X ^ e : Polynomial k)})
          (Ideal.Quotient.mk _ Polynomial.X) = 0 → a = 0 := by
  sorry

end TauCeti

/- `KTheoryFiniteLocalFields:L.5/thh-of-truncated-polynomial-algebra`
(`TauCeti.KTheoryFiniteLocal.thh_of_truncated_polynomial_algebra`): not stated here; needs
`π_*T(k[π]/(π^e))` (supplier: RefinedTraceMethods RT.2, L.5/thh-of-pointed-monoid-algebra).
`KTheoryFiniteLocalFields:L.5/tate-spectral-sequence-truncated`
(`TauCeti.KTheoryFiniteLocal.tate_spectral_sequence_truncated`): not stated here; needs
`Ê^*(C_{p^n}, T(k(Π)))` (supplier:
KTheoryFiniteLocalFields:L.4/multiplicative-tate-spectral-sequence).
`KTheoryFiniteLocalFields:L.5/tate-image-of-uniformizer-truncated`
(`TauCeti.KTheoryFiniteLocal.tate_image_of_uniformizer_truncated`): not stated here; needs `Γ̂` on
`T(k(Π))^{C_{p^{n-1}}}` (supplier: L.4/norm-restriction-cofibre-sequence, RT.2).
`KTheoryFiniteLocalFields:L.5/relative-tc-of-truncated-polynomial-algebra`
(`TauCeti.KTheoryFiniteLocal.relative_tc_of_truncated_polynomial_algebra`): not stated here; needs
relative `TC_q(A[x]/(x^e),(x);p)` and the twisted groups `TR^n_{q-λ}(A;p)` (supplier:
KTheoryFiniteLocalFields:L.4/p-typical-tc, RefinedTraceMethods RT.2).
`KTheoryFiniteLocalFields:L.5/twisted-tr-of-regular-fp-algebra`
(`TauCeti.KTheoryFiniteLocal.twisted_tr_of_regular_fp_algebra`): not stated here; needs
`TR^n_{*-λ}(A;p)` and the de Rham–Witt complex `W_rΩ^*_A` (supplier: RefinedTraceMethods RT.2,
CrystallineCohomology CR.4).
`KTheoryFiniteLocalFields:L.5/relative-k-of-truncated-polynomial-over-perfect-field`
(`TauCeti.KTheoryFiniteLocal.relative_k_of_truncated_polynomial_over_perfect_field`): not stated
here; needs the relative K-groups `K_q(k[x]/(x^n),(x))` (supplier: GeneralAlgebraicKTheory K.5) and
the big Witt vectors `W_S(k)` for `S = {1, …, m}` with `V_n` (supplier: HabiroRings HR.4).
`KTheoryFiniteLocalFields:L.5/relative-k-of-truncated-polynomial-regular-fp`
(`TauCeti.KTheoryFiniteLocal.relative_k_of_truncated_polynomial_regular_fp`): not stated here; needs
relative K-groups (supplier: GeneralAlgebraicKTheory K.5) and `W_sΩ^*_A` (supplier:
CrystallineCohomology CR.4).
`KTheoryFiniteLocalFields:L.5/relative-cyclic-homology-of-truncated-polynomial-algebra`
(`TauCeti.KTheoryFiniteLocal.relative_cyclic_homology_of_truncated_polynomial_algebra`): not
stated here; needs `HH_*` and relative `HC_*` (supplier: RefinedTraceMethods RT.1).
`KTheoryFiniteLocalFields:L.5/relative-k-of-truncated-polynomial-char-zero`
(`TauCeti.KTheoryFiniteLocal.relative_k_of_truncated_polynomial_char_zero`): not stated here; needs
relative K-groups (supplier: GeneralAlgebraicKTheory K.5) and the absolute de Rham complex
`Ω^*_A` in all degrees (available as `⋀[A]^q Ω[A⁄ℤ]`, but the K-side is missing).
`KTheoryFiniteLocalFields:L.5/tr-of-smooth-fp-algebra`
(`TauCeti.KTheoryFiniteLocal.tr_of_smooth_fp_algebra`): not stated here; needs `TR^n_*(A;p)` and
`W_nΩ^*_A` (supplier: RefinedTraceMethods RT.2, CrystallineCohomology CR.4).
`KTheoryFiniteLocalFields:L.5/tc-of-regular-fp-algebra`
(`TauCeti.KTheoryFiniteLocal.tc_of_regular_fp_algebra`): not stated here; needs `TC_q(A;p)` and
`WΩ^q_A` with `F` (supplier: KTheoryFiniteLocalFields:L.4/p-typical-tc,
CrystallineCohomology CR.4). -/

/-! ## `KTheoryFiniteLocalFields:L.6` — K-groups of `p`-adic and equal-characteristic local fields

Conventions (pinned): completed K-theory `K_n(R; ℤ_p) = π_n` of the `p`-completion
(`L.1/completed-k-theory`); Hesselholt–Madsen's `p` is odd wherever their theorems are used; the
Tate twists are MotivicEtaleKTheory M.1's Galois modules `ℤ/p^ν(i) = μ_{p^ν}^{⊗ i}`.

Neither pinned library has K-groups `K_n` for `n ≥ 1`, K-theory with coefficients, the Tate twists
as continuous Galois modules or their `H¹`, `H²`. What *is* stated honestly here: the maximal
divisible subgroup and the `p`-adic Tate module of an abelian group (the two library definitions of
the stage, `TauCeti.AddCommGroup`), the group-theoretic lemmas behind the integral structure
theorems, the `w`-invariants through the prelude's `TwistTrivial`, `H⁰` of the finite Tate twists
(`tateTwistH0`, invariants of `ZMod` under the modular cyclotomic character), the Milnor K-groups
of local fields (prelude `milnorK`), and the arithmetic halves of the application nodes. -/

namespace TauCeti.AddCommGroup

section MaxDivisible

variable (A : Type u) [AddCommGroup A]

/-- A subgroup `D ≤ A` is divisible: `n • y = x` is solvable in `D` for every `x ∈ D` and every
`n ≠ 0` (a real definition; the Prop form of Mathlib's `DivisibleBy D ℤ`). -/
def IsDivisibleSubgroup (D : AddSubgroup A) : Prop :=
  ∀ n : ℤ, n ≠ 0 → ∀ x ∈ D, ∃ y ∈ D, n • y = x

/-- **The maximal divisible subgroup** `Div(A)`
(`KTheoryFiniteLocalFields:L.6/maximal-divisible-subgroup`): the supremum of the divisible
subgroups of `A` (a real definition). -/
def maxDivisible : AddSubgroup A :=
  sSup {D : AddSubgroup A | IsDivisibleSubgroup A D}

variable {A}

/-- `x ∈ Div(A)` if and only if `x` lies in some divisible subgroup of `A` (the supremum is itself
divisible). -/
theorem mem_maxDivisible_iff (x : A) :
    x ∈ maxDivisible A ↔ ∃ D : AddSubgroup A, IsDivisibleSubgroup A D ∧ x ∈ D := by
  sorry

/-- `Div(A)` is divisible, with an explicit division function (Mathlib's `DivisibleBy`). -/
noncomputable instance maxDivisible.divisibleBy : DivisibleBy (maxDivisible A) ℤ :=
  sorry

/-- Every divisible subgroup lies in `Div(A)`. -/
theorem le_maxDivisible {D : AddSubgroup A} (hD : IsDivisibleSubgroup A D) :
    D ≤ maxDivisible A := by
  sorry

/-- `Div(A)` is a direct summand: `A = Div(A) ⊕ C` internally, with `C ≅ A ⧸ Div(A)`. The complement
`C` is a choice: nothing makes it canonical. -/
theorem exists_isCompl_maxDivisible :
    ∃ C : AddSubgroup A, IsCompl (maxDivisible A) C ∧ Nonempty (C ≃+ A ⧸ maxDivisible A) := by
  sorry

/-- `A ⧸ Div(A)` is reduced. -/
theorem maxDivisible_quotient_eq_bot : maxDivisible (A ⧸ maxDivisible A) = ⊥ := by
  sorry

/-- Functoriality: `f(Div A) ≤ Div B`, and `Div(A × B) = Div(A) × Div(B)`. -/
theorem map_maxDivisible_le {B : Type v} [AddCommGroup B] (f : A →+ B) :
    (maxDivisible A).map f ≤ maxDivisible B ∧
      maxDivisible (A × B) = (maxDivisible A).prod (maxDivisible B) := by
  sorry

/-- `Div(A) ≤ ⋂_{m ≥ 1} mA`, with equality when `A` is torsion-free, and when `A = D ⊕ F` with `D`
divisible and `F` of finite exponent. -/
theorem maxDivisible_le_iInf :
    maxDivisible A ≤ ⨅ (m : ℕ) (_ : 0 < m), (nsmulAddMonoidHom m : A →+ A).range ∧
      ((∀ (n : ℕ) (x : A), 0 < n → n • x = 0 → x = 0) →
        maxDivisible A = ⨅ (m : ℕ) (_ : 0 < m), (nsmulAddMonoidHom m : A →+ A).range) ∧
      (∀ D F : AddSubgroup A, IsDivisibleSubgroup A D → IsCompl D F →
        (∃ e : ℕ, 0 < e ∧ ∀ x ∈ F, e • x = 0) →
        maxDivisible A = ⨅ (m : ℕ) (_ : 0 < m), (nsmulAddMonoidHom m : A →+ A).range) := by
  sorry

/-- `ℚ ⧸ ℤ`, the carrier of the Prüfer groups below. -/
abbrev RatModInt : Type := ℚ ⧸ (Int.castAddHom ℚ).range

/-- The Prüfer group `ℤ/ℓ^∞`, as the `ℓ`-primary part of `ℚ ⧸ ℤ` (a real definition). -/
def pruferGroup (ℓ : ℕ) : AddSubgroup RatModInt :=
  _root_.AddCommGroup.primaryComponent RatModInt ℓ

/-- The structure of `Div(A)`: `Div(A) ≅ ℚ^{(κ)} ⊕ ⨁_ℓ (ℤ/ℓ^∞)^{(λ_ℓ)}` for index types `κ`, `λ_ℓ`;
if `A` is uniquely `ℓ`-divisible for every prime `ℓ ≠ p`, then `λ_ℓ` is empty for `ℓ ≠ p`. -/
theorem maxDivisible_structure :
    (∃ (κ : Type u) (lam : Nat.Primes → Type u),
      Nonempty (maxDivisible A ≃+ (κ →₀ ℚ) × Π₀ ℓ : Nat.Primes, (lam ℓ →₀ pruferGroup ℓ))) ∧
    ∀ p : ℕ, (∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ p → Function.Bijective (fun x : A => ℓ • x)) →
      ∃ (κ : Type u) (lam : Type u),
        Nonempty (maxDivisible A ≃+ (κ →₀ ℚ) × (lam →₀ pruferGroup p)) := by
  sorry

end MaxDivisible

section MaxDivisibleTests

-- test TauCeti.AddCommGroup.maxDivisible_ratCircle_prod (computation)
example :
    maxDivisible (RatModInt × ZMod 6 × ℤ) = (⊤ : AddSubgroup RatModInt).prod ⊥ ∧
      Nonempty ((RatModInt × ZMod 6 × ℤ) ⧸ maxDivisible (RatModInt × ZMod 6 × ℤ) ≃+
        ZMod 6 × ℤ) := by
  sorry

-- test TauCeti.AddCommGroup.maxDivisible_finite (degenerate)
example (A : Type u) [AddCommGroup A] [Finite A] : maxDivisible A = ⊥ := by
  sorry

-- test TauCeti.AddCommGroup.maxDivisible_eq_top_iff (compatibility)
example (A : Type u) [AddCommGroup A] : maxDivisible A = ⊤ ↔ Nonempty (DivisibleBy A ℤ) := by
  sorry

-- test TauCeti.AddCommGroup.maxDivisible_int_ne_smul (non-example)
/- `Div(ℤ) = 0` while `wℤ ≠ 0` for every `w ≥ 1`: `Div(A) = w·A` is a theorem under the hypothesis
of `L.6/divisible-subgroup-criterion`, not a definition. -/
example : maxDivisible ℤ = ⊥ ∧ ∀ w : ℕ, 0 < w → (nsmulAddMonoidHom w : ℤ →+ ℤ).range ≠ ⊥ := by
  sorry

-- test TauCeti.AddCommGroup.maxDivisible_padicInt (non-example)
/- `Div(ℤ_p) = 0`, yet the quotient of `ℤ_p` by the rational `p`-adic integers `ℤ_(p) = ℤ_p ∩ ℚ`
is (uniquely) divisible: `Div` is not preserved by quotients. -/
example (p : ℕ) [Fact p.Prime] :
    maxDivisible ℤ_[p] = ⊥ ∧
      maxDivisible (ℤ_[p] ⧸ ((Rat.castHom ℚ_[p]).range.toAddSubgroup.comap
        (PadicInt.Coe.ringHom (p := p)).toAddMonoidHom)) = ⊤ := by
  sorry

end MaxDivisibleTests

section TateModule

variable (p : ℕ) (A : Type u) [AddCommGroup A]

/-- **The `p`-adic Tate module** `T_p(A) = lim_ν A[p^ν]`
(`KTheoryFiniteLocalFields:L.6/p-adic-tate-module`): the compatible sequences `(x_ν)_{ν ≥ 0}` with
`p^ν • x_ν = 0` and `p • x_{ν+1} = x_ν`, the inverse limit of the torsion subgroups
`A[p^ν] = AddSubgroup.torsionBy A (p^ν)` along multiplication by `p` (a real definition). -/
def pTateModule : AddSubgroup (ℕ → A) where
  carrier := {x | ∀ ν : ℕ, p ^ ν • x ν = 0 ∧ p • x (ν + 1) = x ν}
  zero_mem' := by
    intro ν
    simp
  add_mem' := by
    intro x y hx hy ν
    simp only [Pi.add_apply, smul_add, (hx ν).1, (hy ν).1, (hx ν).2, (hy ν).2, add_zero,
      and_self]
  neg_mem' := by
    intro x hx ν
    simp only [Pi.neg_apply, smul_neg, (hx ν).1, (hx ν).2, neg_zero, and_self]

/-- `ℚ_p ⧸ ℤ_p`, the `p`-divisible group co-representing `T_p` (`ℤ/p^∞` in the packet). -/
abbrev PadicCircle [Fact p.Prime] : Type := ℚ_[p] ⧸ (PadicInt.subring p).toAddSubgroup

/-- The `ℤ_p`-module structure of `T_p(A)`: `a • (x_ν)_ν = (a mod p^ν) • x_ν` (data of the
packet's item `pTateModule`; the body is the construction's work). -/
noncomputable instance pTateModule.instModule [Fact p.Prime] : Module ℤ_[p] (pTateModule p A) :=
  sorry

namespace pTateModule

variable {p A}

/-- `T_p(A) ≅ Hom(ℚ_p/ℤ_p, A)`, naturally in `A`. -/
noncomputable def equivHom [Fact p.Prime] : pTateModule p A ≃+ (PadicCircle p →+ A) :=
  sorry

/-- Functoriality of `T_p`. -/
noncomputable def map {B : Type v} [AddCommGroup B] (f : A →+ B) :
    pTateModule p A →+ pTateModule p B :=
  sorry

/-- `map id = id` (part of the packet item `pTateModule.map`). -/
theorem map_id : map (p := p) (AddMonoidHom.id A) = AddMonoidHom.id _ := by
  sorry

/-- `map (g ∘ f) = map g ∘ map f` (part of the packet item `pTateModule.map`). -/
theorem map_comp {B : Type v} {C : Type w} [AddCommGroup B] [AddCommGroup C] (f : A →+ B)
    (g : B →+ C) : map (p := p) (g.comp f) = (map g).comp (map f) := by
  sorry

/-- `T_p` is left exact (part of the packet item `pTateModule.map`): for `0 → A → B → C` exact,
`0 → T_p(A) → T_p(B) → T_p(C)` is exact. -/
theorem map_leftExact {B : Type v} {C : Type w} [AddCommGroup B] [AddCommGroup C] (f : A →+ B)
    (g : B →+ C) (hf : Function.Injective f) (hfg : f.range = g.ker) :
    Function.Injective (map (p := p) f) ∧ (map (p := p) f).range = (map (p := p) g).ker := by
  sorry

/-- `T_p(A)` is a torsion-free `ℤ_p`-module. -/
instance noZeroSMulDivisors [Fact p.Prime] : Module.IsTorsionFree ℤ_[p] (pTateModule p A) :=
  sorry

end pTateModule

variable {p A}

/-- If `p^N` kills the `p`-primary torsion `A[p^∞]`, then `T_p(A) = 0`. -/
theorem pTateModule_eq_zero_of_exponent (N : ℕ)
    (hN : ∀ x : A, (∃ ν : ℕ, p ^ ν • x = 0) → p ^ N • x = 0) : pTateModule p A = ⊥ := by
  sorry

/-- `T_p((ℚ_p/ℤ_p)^λ) ≅ ℤ_p^λ` for finite `λ`. -/
theorem pTateModule_padicCircle_pow [Fact p.Prime] (n : ℕ) :
    Nonempty (pTateModule p (Fin n → PadicCircle p) ≃ₗ[ℤ_[p]] (Fin n → ℤ_[p])) := by
  sorry

/-- If `A[p^∞] = Div(A)[p^∞] ⊕ F` with `F` of finite exponent, then `T_p(Div A) → T_p(A)` is an
isomorphism. -/
theorem pTateModule_maxDivisible (F : AddSubgroup A) (N : ℕ) (hF : ∀ x ∈ F, p ^ N • x = 0)
    (hdec : ∀ x : A, (∃ ν : ℕ, p ^ ν • x = 0) →
      ∃ d ∈ maxDivisible A, ∃ f ∈ F, x = d + f) :
    Function.Bijective (pTateModule.map (p := p) (maxDivisible A).subtype) := by
  sorry

end TateModule

section TateModuleTests

-- test TauCeti.AddCommGroup.pTateModule_padicCircle (computation)
example (p : ℕ) [Fact p.Prime] :
    Nonempty (pTateModule p (PadicCircle p) ≃ₗ[ℤ_[p]] ℤ_[p]) ∧
      Nonempty (pTateModule p ((Fin 2 → PadicCircle p) × ZMod (p ^ 5)) ≃ₗ[ℤ_[p]]
        (Fin 2 → ℤ_[p])) := by
  sorry

-- test TauCeti.AddCommGroup.pTateModule_of_finite (degenerate)
example (p : ℕ) (A : Type u) [AddCommGroup A] [Finite A] : pTateModule p A = ⊥ := by
  sorry

-- test TauCeti.AddCommGroup.pTateModule_units_complex (compatibility)
/- `T_p(ℂ^×) ≅ ℤ_p`: the Tate module of `μ_{p^∞}(ℂ)` on which the cyclotomic character acts. -/
example (p : ℕ) [Fact p.Prime] : Nonempty (pTateModule p (Additive ℂˣ) ≃ₗ[ℤ_[p]] ℤ_[p]) := by
  sorry

-- test TauCeti.AddCommGroup.pTateModule_int (non-example)
/- `T_p(ℤ) = 0`, while the `p`-adic completion `lim_ν ℤ/p^ν` of `ℤ` is `ℤ_p`: the Tate module is not
the `p`-adic completion. -/
example (p : ℕ) [Fact p.Prime] :
    pTateModule p ℤ = ⊥ ∧ Nonempty (AdicCompletion (Ideal.span {(p : ℤ)}) ℤ ≃+ ℤ_[p]) := by
  sorry

end TateModuleTests

end TauCeti.AddCommGroup

namespace TauCeti.KTheoryFiniteLocal

open TauCeti.AddCommGroup TauCeti.MilnorK

/- `KTheoryFiniteLocalFields:L.6/completion-exact-sequence` (`completion_exact_sequence`): not
stated here; needs the integral, finite-coefficient and completed K-groups `K_n(R)`,
`K_n(R; ℤ/p^ν)`, `K_n(R; ℤ_p)` with the completion map `κ` (supplier:
`KTheoryFiniteLocalFields:L.1/k-theory-mod-m`, `KTheoryFiniteLocalFields:L.1/completed-k-theory`,
GeneralAlgebraicKTheory K.1, StableHomotopyKTheory H.6). Its group-theoretic input, the Tate module
`T_p(K_{n-1}(R))`, is `TauCeti.AddCommGroup.pTateModule`. -/

section GroupLemmas

variable {A : Type u} [AddCommGroup A]

/-- `KTheoryFiniteLocalFields:L.6/divisible-subgroup-criterion`: if `mA = wA` for every positive
multiple `m` of `w ≥ 1`, then `wA` is divisible and equals `Div(A)`, so `A = Div(A) ⊕ C` with
`C ≅ A/wA` (non-canonically). If moreover `A/wA ≅ ℤ/w`, then every complement is `ℤ/w`,
`A/Div(A)` is torsion and `⋂_{m ≥ 1} mA = Div(A)`. -/
theorem divisible_subgroup_criterion (w : ℕ) (hw : 0 < w)
    (h : ∀ m : ℕ, 0 < m → w ∣ m →
      (nsmulAddMonoidHom m : A →+ A).range = (nsmulAddMonoidHom w : A →+ A).range) :
    (nsmulAddMonoidHom w : A →+ A).range = maxDivisible A ∧
      (∃ C : AddSubgroup A, IsCompl (maxDivisible A) C ∧
        Nonempty (C ≃+ A ⧸ (nsmulAddMonoidHom w : A →+ A).range)) ∧
      (Nonempty (A ⧸ (nsmulAddMonoidHom w : A →+ A).range ≃+ ZMod w) →
        (∀ C : AddSubgroup A, IsCompl (maxDivisible A) C → Nonempty (C ≃+ ZMod w)) ∧
        IsAddTorsion (A ⧸ maxDivisible A) ∧
        ⨅ (m : ℕ) (_ : 0 < m), (nsmulAddMonoidHom m : A →+ A).range = maxDivisible A) := by
  sorry

/-- The `ℤ_(p)`-span `ℤ_(p) x_1 + ⋯ + ℤ_(p) x_t` inside a group that is uniquely `ℓ`-divisible for
all `ℓ ≠ p`: the elements `y` with `b • y` in the `ℤ`-span of the `x_i` for some `b` prime to `p`
(a real carrier; the closure proofs are routine). -/
def zpLocalSpan (p : ℕ) {ι : Type*} (x : ι → A) : AddSubgroup A where
  carrier := {y | ∃ b : ℕ, ¬ p ∣ b ∧ b • y ∈ AddSubgroup.closure (Set.range x)}
  zero_mem' := sorry
  add_mem' := sorry
  neg_mem' := sorry

/-- `KTheoryFiniteLocalFields:L.6/torsion-free-lattice-lemma`. Let `T` be torsion-free and uniquely
`ℓ`-divisible for every prime `ℓ ≠ p`, with `T/pT` finite of `𝔽_p`-dimension `t`. Then
(a) `T/p^νT ≅ (ℤ/p^ν)^t` and the `p`-adic completion `T^∧` is `ℤ_p^t`;
(b) the kernel of `T → T^∧` is `⋂_ν p^νT = Div(T)`, a direct summand;
(c) if `x_1, …, x_t` reduce to a basis of `T/pT`, the `x_i` are `ℤ`-independent, the `ℤ_(p)`-span
`P` meets `Div(T)` trivially and `T/(P + Div(T))` is uniquely divisible;
(d) `T^∧/image(T)` is uniquely divisible.
Omitted from (c): `P ⊗ ℤ_p ≅ T^∧`, which needs the `ℤ_p`-module structure of the completion of a
`ℤ_(p)`-module (no carrier at the pinned commit for the tensor product with `ℤ_(p)`-scalars). -/
theorem torsion_free_lattice_lemma (p : ℕ) [Fact p.Prime] (T : Type u) [AddCommGroup T]
    (htf : ∀ (n : ℕ) (x : T), 0 < n → n • x = 0 → x = 0)
    (hdiv : ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ p → Function.Bijective (fun x : T => ℓ • x))
    (t : ℕ) (ht : Nat.card (T ⧸ (nsmulAddMonoidHom p : T →+ T).range) = p ^ t) :
    (∀ ν : ℕ, Nonempty (T ⧸ (nsmulAddMonoidHom (p ^ ν) : T →+ T).range ≃+
        (Fin t → ZMod (p ^ ν)))) ∧
      Nonempty (AdicCompletion (Ideal.span {(p : ℤ)}) T ≃+ (Fin t → ℤ_[p])) ∧
      (AdicCompletion.of (Ideal.span {(p : ℤ)}) T).ker.toAddSubgroup =
        ⨅ ν : ℕ, (nsmulAddMonoidHom (p ^ ν) : T →+ T).range ∧
      ⨅ ν : ℕ, (nsmulAddMonoidHom (p ^ ν) : T →+ T).range = maxDivisible T ∧
      (∃ C : AddSubgroup T, IsCompl (maxDivisible T) C) ∧
      (∀ x : Fin t → T,
        Function.Bijective (fun c : Fin t → ZMod p =>
          (QuotientAddGroup.mk (∑ i, (c i).val • x i) :
            T ⧸ (nsmulAddMonoidHom p : T →+ T).range)) →
        (∀ c : Fin t → ℤ, ∑ i, c i • x i = 0 → c = 0) ∧
        zpLocalSpan p x ⊓ maxDivisible T = ⊥ ∧
        ∀ n : ℕ, 0 < n → Function.Bijective
          (fun y : T ⧸ (zpLocalSpan p x ⊔ maxDivisible T) => n • y)) ∧
      ∀ n : ℕ, 0 < n → Function.Bijective
        (fun y : AdicCompletion (Ideal.span {(p : ℤ)}) T ⧸
          LinearMap.range (AdicCompletion.of (Ideal.span {(p : ℤ)}) T) => n • y) := by
  sorry

end GroupLemmas

section WInvariants

open ValuativeRel

/-- "Exceptional" field in the sense of ArithmeticKTheory N.4 (a real definition): for all large
`ν`, `Gal(L(ζ_{2^ν})/L)` is not cyclic, `ζ_{2^ν}` any primitive `2^ν`-th root of unity in an
algebraic closure. -/
def IsExceptional (L : Type u) [Field L] : Prop :=
  ∃ N : ℕ, ∀ ν ≥ N, ∀ ζ : AlgebraicClosure L, IsPrimitiveRoot ζ (2 ^ ν) →
    ¬ IsCyclic (L⟮ζ⟯ ≃ₐ[L] L⟮ζ⟯)

/-- `KTheoryFiniteLocalFields:L.6/p-adic-w-invariant`, odd `p`: for `L/ℚ_p` finite, `i ≠ 0`,
`r = [L(ζ_p) : L]` and `p^a = #μ_{p^∞}(L(ζ_p))`, `w_i^{(p)}(L) = p^{a + v_p(i)}` if `r ∣ i` and `1`
otherwise. (`W_i^{(p)}(L)` is finite cyclic: its order is the value computed here.) -/
theorem p_adic_w_invariant (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (L : Type u) [Field L]
    [Algebra ℚ_[p] L] [FiniteDimensional ℚ_[p] L] (ζ : AlgebraicClosure L)
    (hζ : IsPrimitiveRoot ζ p) (i : ℤ) (hi : i ≠ 0) :
    wInvariantPrimary L p i =
      if (Module.finrank L L⟮ζ⟯ : ℤ) ∣ i then
        Nat.card (CommGroup.primaryComponent (L⟮ζ⟯)ˣ p) * p ^ padicValInt p i
      else 1 := by
  sorry

open Classical in
/-- `KTheoryFiniteLocalFields:L.6/p-adic-w-invariant`, `p = 2`: with `2^a = #μ_{2^∞}(L(√−1))`,
`w_i^{(2)}(L) = 2^{a + v_2(i)}` if `√−1 ∈ L`; `2` if `√−1 ∉ L` and `i` is odd; and for `i` even
and `√−1 ∉ L`, `2^{a + v_2(i)}` or `2^{a + v_2(i) − 1}` as `L` is exceptional or not. -/
theorem p_adic_w_invariant_two (L : Type u) [Field L] [Algebra ℚ_[2] L]
    [FiniteDimensional ℚ_[2] L] (ι : AlgebraicClosure L) (hι : ι ^ 2 = -1) (i : ℤ) (hi : i ≠ 0) :
    wInvariantPrimary L 2 i =
      if ∃ x : L, x ^ 2 = -1 then
        Nat.card (CommGroup.primaryComponent (L⟮ι⟯)ˣ 2) * 2 ^ padicValInt 2 i
      else if Odd i then 2
      else if IsExceptional L then
        Nat.card (CommGroup.primaryComponent (L⟮ι⟯)ˣ 2) * 2 ^ padicValInt 2 i
      else Nat.card (CommGroup.primaryComponent (L⟮ι⟯)ˣ 2) * 2 ^ padicValInt 2 i / 2 := by
  sorry

/-- `KTheoryFiniteLocalFields:L.6/w-invariant-prime-to-p-factor`: for `L/ℚ_p` finite with residue
field `𝔽_q` and `i ≥ 1`, `w_i(L) = (q^i − 1)·w_i^{(p)}(L)`. -/
theorem w_invariant_prime_to_p_factor (p : ℕ) [Fact p.Prime] (L : Type u) [Field L]
    [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L] [CharZero L]
    [CharP 𝓀[L] p] (i : ℕ) (hi : 1 ≤ i) :
    wInvariant L i = (Nat.card 𝓀[L] ^ i - 1) * wInvariantPrimary L p i := by
  sorry

/-- `KTheoryFiniteLocalFields:L.6/p-adic-w-invariant-of-q-p`: for `i ≠ 0`,
`w_i^{(p)}(ℚ_p) = p^{1 + v_p(i)}` if `(p − 1) ∣ i` and `1` otherwise (`p` odd), and
`w_i^{(2)}(ℚ_2) = 2` for `i` odd, `2^{2 + v_2(i)}` for `i` even. -/
theorem p_adic_w_invariant_of_q_p (p : ℕ) [Fact p.Prime] (i : ℤ) (hi : i ≠ 0) :
    (p ≠ 2 → wInvariantPrimary ℚ_[p] p i =
        if ((p : ℤ) - 1) ∣ i then p ^ (1 + padicValInt p i) else 1) ∧
      (p = 2 → wInvariantPrimary ℚ_[p] p i =
        if Odd i then 2 else 2 ^ (2 + padicValInt 2 i)) := by
  sorry

/-- The acceptance values of `L.6/p-adic-w-invariant-of-q-p`: `w_1^{(3)}(ℚ_3) = 1`,
`w_2^{(3)} = 3`, `w_3^{(3)} = 1`, `w_6^{(3)} = 9`; `w_2^{(2)}(ℚ_2) = 8`, `w_4^{(2)}(ℚ_2) = 16`. -/
example : wInvariantPrimary ℚ_[3] 3 1 = 1 ∧ wInvariantPrimary ℚ_[3] 3 2 = 3 ∧
    wInvariantPrimary ℚ_[3] 3 3 = 1 ∧ wInvariantPrimary ℚ_[3] 3 6 = 9 ∧
    wInvariantPrimary ℚ_[2] 2 1 = 2 ∧ wInvariantPrimary ℚ_[2] 2 2 = 8 ∧
    wInvariantPrimary ℚ_[2] 2 3 = 2 ∧ wInvariantPrimary ℚ_[2] 2 4 = 16 := by
  sorry

/-- Stand-in for `H⁰(L, ℤ/p^ν(i))` of MotivicEtaleKTheory M.1 (a real carrier, `H⁰` only): the
twist `μ_{p^ν}^{⊗ i}` is `ℤ/#μ_{p^ν}(L̄)` with `σ` acting by `χ(σ)^i`, `χ` Mathlib's
`modularCyclotomicCharacter'` of the algebraic closure, and `H⁰` is the subgroup of invariants.
(`#μ_{p^ν}(L̄) = p^ν` when `p` is invertible in `L`.) -/
def tateTwistH0 (L : Type u) [Field L] (p ν : ℕ) [NeZero p] (i : ℤ) :
    AddSubgroup (ZMod (Nat.card (rootsOfUnity (p ^ ν) (AlgebraicClosure L)))) :=
  ⨅ σ : AlgebraicClosure L ≃ₐ[L] AlgebraicClosure L,
    (AddMonoidHom.mulLeft
      ((((modularCyclotomicCharacter' (AlgebraicClosure L) (p ^ ν) σ.toRingEquiv) ^ i :
        (ZMod (Nat.card (rootsOfUnity (p ^ ν) (AlgebraicClosure L))))ˣ) :
          ZMod (Nat.card (rootsOfUnity (p ^ ν) (AlgebraicClosure L)))) - 1)).ker

/-- `KTheoryFiniteLocalFields:L.6/h0-of-tate-twists`, finite level: for `L/ℚ_p` finite, `i ≠ 0`
and `ν ≥ 1`, `H⁰(L, ℤ/p^ν(i))` is cyclic of order `gcd(p^ν, w_i^{(p)}(L))`.
Omitted: `H⁰(L, ℤ_p(i)) = H⁰(L, ℚ_p(i)) = 0` and the transition maps of the towers, which need the
twists `ℤ_p(i)`, `ℚ_p(i)` and the maps between the `ℤ/p^ν(i)` as `G_L`-modules (supplier:
MotivicEtaleKTheory M.1). -/
theorem h0_of_tate_twists (p : ℕ) [Fact p.Prime] (L : Type u) [Field L] [Algebra ℚ_[p] L]
    [FiniteDimensional ℚ_[p] L] (i : ℤ) (hi : i ≠ 0) (ν : ℕ) (hν : 1 ≤ ν) :
    Nat.card (rootsOfUnity (p ^ ν) (AlgebraicClosure L)) = p ^ ν ∧
      IsAddCyclic (tateTwistH0 L p ν i) ∧
      Nat.card (tateTwistH0 L p ν i) = Nat.gcd (p ^ ν) (wInvariantPrimary L p i) := by
  sorry

/-- The acceptance value of `L.6/h0-of-tate-twists`: `H⁰(ℚ_3, ℤ/9(2)) ≅ ℤ/3`, and
`H⁰(ℚ_3, ℤ/3(1)) = 0` since `μ_3 ⊄ ℚ_3`. -/
example : Nat.card (tateTwistH0 ℚ_[3] 3 2 2) = 3 ∧ Nat.card (tateTwistH0 ℚ_[3] 3 1 1) = 1 := by
  sorry

end WInvariants

/- `KTheoryFiniteLocalFields:L.6/local-duality-for-tate-twists` (`local_duality_for_tate_twists`):
not stated here; needs `H²(L, ℤ/p^ν(j))`, `H²(L, ℤ_p(i+1))`, `H²(L, ℚ_p/ℤ_p(i+1))` of the Tate
twists as continuous `G_L`-modules and local Tate duality (supplier: MotivicEtaleKTheory M.1;
tauceti ClassFieldTheory Layer 5). Its `H⁰` input is `h0_of_tate_twists`.

`KTheoryFiniteLocalFields:L.6/h1-of-tate-twists` (`h1_of_tate_twists`): not stated here; needs
`H¹(L, ℤ_p(i))` as a finitely generated `ℤ_p`-module, the connecting map of
`0 → ℤ_p(i) → ℚ_p(i) → ℚ_p/ℤ_p(i) → 0` and the Euler characteristic (supplier: MotivicEtaleKTheory
M.1, ArithmeticGaloisDuality R02.1, tauceti ClassFieldTheory Layer 5).

`KTheoryFiniteLocalFields:L.6/h1-with-divisible-coefficients` (`h1_with_divisible_coefficients`):
not stated here; needs `H¹(L, ℚ_p/ℤ_p(i))`, `H¹(L, ℤ_p(i)) ⊗ ℚ_p/ℤ_p` and `H²(L, ℤ_p(i))`
(supplier: ArithmeticGaloisDuality R02.1, MotivicEtaleKTheory M.1).

`KTheoryFiniteLocalFields:L.6/ring-of-integers-versus-field` (`ring_of_integers_versus_field`): not
stated here; needs `K_n(V; ℤ/p^ν)`, `K_n(V; ℤ_p)` and the localisation sequence
`K(𝔽_q) → K(V) → K(E)` (supplier: `KTheoryFiniteLocalFields:L.1/k-theory-mod-m`,
`KTheoryFiniteLocalFields:L.1/completed-k-theory`, `KTheoryFiniteLocalFields:L.2/dvr-localisation`).

`KTheoryFiniteLocalFields:L.6/hm-etale-comparison` (`hm_etale_comparison`): not stated here; needs
`K_*(K; ℤ/p^v)` and Dwyer–Friedlander étale K-theory `K^ét_*(K; ℤ/p^v)` with the map `γ_K`
(supplier: `KTheoryFiniteLocalFields:L.1/k-theory-mod-m`, MotivicEtaleKTheory M.7).

`KTheoryFiniteLocalFields:L.6/hm-theorem-a` (`hm_theorem_a`): not stated here; needs
`K_*(K; ℤ/p^v)` and the Galois cohomology `H^j(K, μ_{p^v}^{⊗ s})` for `j = 1, 2` (supplier:
`KTheoryFiniteLocalFields:L.1/k-theory-mod-m`, MotivicEtaleKTheory M.1 and M.7).

`KTheoryFiniteLocalFields:L.6/finite-coefficient-lichtenbaum-quillen`
(`finite_coefficient_lichtenbaum_quillen`): not stated here; needs the étale Chern class
`c_{i,1} : K_{2i−1}(L; ℤ/p^ν) → H¹(L, μ_{p^ν}^{⊗ i})` and `H²(L, μ_{p^ν}^{⊗(i+1)})` (supplier:
MotivicEtaleKTheory M.8, M.7, M.1).

`KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1` (`odd_completed_k_groups_are_h1`): not
stated here; needs `K_{2i−1}(L; ℤ_p)` and `H¹(L, ℤ_p(i))` (supplier:
`KTheoryFiniteLocalFields:L.1/completed-k-theory`, MotivicEtaleKTheory M.8,
ArithmeticGaloisDuality R02.1).

`KTheoryFiniteLocalFields:L.6/even-completed-k-groups-are-h2` (`even_completed_k_groups_are_h2`):
not stated here; needs `K_{2i}(L; ℤ_p)` and `H²(L, ℤ_p(i+1))` (supplier:
`KTheoryFiniteLocalFields:L.1/completed-k-theory`, MotivicEtaleKTheory M.8,
ArithmeticGaloisDuality R02.1).

`KTheoryFiniteLocalFields:L.6/completed-k-groups-of-p-adic-fields`
(`completed_k_groups_of_p_adic_fields`): not stated here; needs `K_n(L; ℤ_p)`, `K_n(V; ℤ_p)` and
`H^j(L, ℤ_p(i))` (supplier: `KTheoryFiniteLocalFields:L.1/completed-k-theory`, MotivicEtaleKTheory
M.1). The torsion orders `w_i^{(p)}(L)` it names are `p_adic_w_invariant`. -/

/-- `KTheoryFiniteLocalFields:L.6/completed-k-groups-of-q-p`, its arithmetic half: the orders of the
torsion summands `ℤ/w_j^{(p)}(ℚ_p)` of the completed K-groups listed by the node —
`K_3(ℚ_2; ℤ_2)`: `8`; `K_3(ℚ_3; ℤ_3)`: `3`; `K_3(ℚ_p; ℤ_p)`, `p ≥ 5`: `1`; `K_{2p−3}(ℚ_p; ℤ_p)`,
`p` odd: `p`; `K_{11}(ℚ_3; ℤ_3)`: `9`; `K_4(ℚ_3; ℤ_3) ≅ ℤ/w_2^{(3)} = ℤ/3`;
`K_4(ℚ_2; ℤ_2) ≅ ℤ/8`; `K_5(ℚ_2; ℤ_2)`: `2`; `K_2(ℚ_2; ℤ_2) ≅ ℤ/2`; `K_2(ℚ_p; ℤ_p) = 0`, `p` odd.
Omitted: the K-groups themselves, which need `K_n(ℚ_p; ℤ_p)` (supplier:
`KTheoryFiniteLocalFields:L.1/completed-k-theory`). -/
theorem completed_k_groups_of_q_p (p : ℕ) [Fact p.Prime] :
    wInvariantPrimary ℚ_[2] 2 2 = 8 ∧ wInvariantPrimary ℚ_[3] 3 2 = 3 ∧
      (5 ≤ p → wInvariantPrimary ℚ_[p] p 2 = 1) ∧
      (p ≠ 2 → wInvariantPrimary ℚ_[p] p ((p : ℤ) - 1) = p) ∧
      wInvariantPrimary ℚ_[3] 3 6 = 9 ∧ wInvariantPrimary ℚ_[2] 2 3 = 2 ∧
      wInvariantPrimary ℚ_[2] 2 1 = 2 ∧ (p ≠ 2 → wInvariantPrimary ℚ_[p] p 1 = 1) := by
  sorry

section Unramified

open ValuativeRel

/-- `KTheoryFiniteLocalFields:L.6/completed-k3-of-unramified-fields`, its arithmetic half: for
`L/ℚ_p` finite unramified (`p` a uniformiser of `𝒪[L]`), the torsion of
`K_3(L; ℤ_p) ≅ ℤ_p^{[L:ℚ_p]} ⊕ ℤ/w_2^{(p)}(L)` has order `w_2^{(p)}(L) = 1` for `p ≥ 5`, `3` for
`p = 3` and `8` for `p = 2`. Omitted: the K-groups and `H¹(L, ℤ_p(2))` (supplier:
`KTheoryFiniteLocalFields:L.1/completed-k-theory`, MotivicEtaleKTheory M.1 and M.8). -/
theorem completed_k3_of_unramified_fields (p : ℕ) [Fact p.Prime] (L : Type u) [Field L]
    [ValuativeRel L] [TopologicalSpace L] [IsNonarchimedeanLocalField L] [CharZero L]
    [CharP 𝓀[L] p] (hunr : Irreducible (p : 𝒪[L])) :
    wInvariantPrimary L p 2 = if p = 2 then 8 else if p = 3 then 3 else 1 := by
  sorry

end Unramified

/- `KTheoryFiniteLocalFields:L.6/discrete-coefficient-k-groups` (`discrete_coefficient_k_groups`):
not stated here; needs `K_n(L; ℚ_p/ℤ_p) = colim_ν K_n(L; ℤ/p^ν)` and `H^j(L, ℚ_p/ℤ_p(i))` (supplier:
`KTheoryFiniteLocalFields:L.1/k-theory-mod-m`, MotivicEtaleKTheory M.1 and M.7).

`KTheoryFiniteLocalFields:L.6/p-primary-torsion-of-odd-k-groups`
(`p_primary_torsion_of_odd_k_groups`): not stated here; needs `K_n(L)` for `n ≥ 2`, the Bockstein
from `K_{2i}(L; ℚ_p/ℤ_p)` and the `e`-invariant (supplier: GeneralAlgebraicKTheory K.1,
`KTheoryFiniteLocalFields:L.1/k-theory-mod-m`, ArithmeticKTheory N.5).

`KTheoryFiniteLocalFields:L.6/odd-integral-k-groups` (`odd_integral_k_groups`): not stated here;
needs `K_{2i−1}(V) → K_{2i−1}(L)` and the `e`-invariant (supplier: GeneralAlgebraicKTheory K.1,
ArithmeticKTheory N.5). Its torsion order is `w_invariant_prime_to_p_factor`, and the group theory
of `T_i` is `torsion_free_lattice_lemma`.

`KTheoryFiniteLocalFields:L.6/even-k-groups-mod-p-powers` (`even_k_groups_mod_p_powers`): not stated
here; needs `K_{2i}(L)/p^ν`, `K_{2i−1}(L)[p^ν]` and `H^j(L, μ_{p^ν}^{⊗ ·})` (supplier:
GeneralAlgebraicKTheory K.1, MotivicEtaleKTheory M.1 and M.7).

`KTheoryFiniteLocalFields:L.6/even-integral-k-groups` (`even_integral_k_groups`): not stated here;
needs `K_{2i}(L)` and `K_{2i}(V)` (supplier: GeneralAlgebraicKTheory K.1). Its group theory is
`divisible_subgroup_criterion` and `maxDivisible_structure`.

`KTheoryFiniteLocalFields:L.6/even-k-groups-tate-module` (`even_k_groups_tate_module`): not stated
here; needs `K_{2i}(L)` and `K_{2i+1}(L; ℤ_p)` (supplier: GeneralAlgebraicKTheory K.1,
`KTheoryFiniteLocalFields:L.1/completed-k-theory`). Its group theory is `pTateModule_maxDivisible`.

`KTheoryFiniteLocalFields:L.6/divisible-rank-relation` (`divisible_rank_relation`): not stated here;
needs `K_{2i−1}(L)`, `K_{2i−2}(L)` and `K_{2i−1}(L; ℤ_p)` (supplier: GeneralAlgebraicKTheory K.1,
`KTheoryFiniteLocalFields:L.1/completed-k-theory`).

`KTheoryFiniteLocalFields:L.6/finite-coefficient-k-groups-structure`
(`finite_coefficient_k_groups_structure`): not stated here; needs `K_{2i−1}(L; ℤ/p^ν)` and
`H¹(L, μ_{p^ν}^{⊗ i})` (supplier: `KTheoryFiniteLocalFields:L.1/k-theory-mod-m`,
MotivicEtaleKTheory M.1 and M.8).

`KTheoryFiniteLocalFields:L.6/k3-torsion-free-lattice` (`k3_torsion_free_lattice`): not stated
here; needs `K_3(V)` and `K_3(V; ℤ_p)` (supplier: GeneralAlgebraicKTheory K.1,
`KTheoryFiniteLocalFields:L.1/completed-k-theory`). Its group theory is
`torsion_free_lattice_lemma`.

`KTheoryFiniteLocalFields:L.6/even-integral-to-completed-comparison`
(`even_integral_to_completed_comparison`) and
`KTheoryFiniteLocalFields:L.6/odd-integral-to-completed-comparison`
(`odd_integral_to_completed_comparison`): not stated here; need the completion map
`κ : K_n(L) → K_n(L; ℤ_p)` (supplier: `KTheoryFiniteLocalFields:L.1/completed-k-theory`) and
`H^j(L, ℤ_p(i))` (supplier: MotivicEtaleKTheory M.1). -/

section LocalFieldMilnorK

/-- `KTheoryFiniteLocalFields:L.6/milnor-k-of-local-fields`: for a local field `E` and `n ≥ 3`, the
Milnor K-group `K^M_n(E)` (prelude `milnorK`, stand-in for K2SymbolsBrauer T.2) is uniquely
divisible, and uncountable when `char E = 0`. The uncountability in characteristic `p` is a gap of
the sources and is not asserted. -/
theorem milnor_k_of_local_fields (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (n : ℕ) (hn : 3 ≤ n) :
    (∀ m : ℕ, 0 < m → Function.Bijective (fun x : milnorK E n => m • x)) ∧
      (CharZero E → ¬ Countable (milnorK E n)) := by
  sorry

end LocalFieldMilnorK

/- `KTheoryFiniteLocalFields:L.6/uniquely-divisible-summand` (`uniquely_divisible_summand`): not
stated here; needs `K_n(E)` and `K_n(V)` for `n ≥ 3` with the natural map `K^M_n(E) → K_n(E)`
(supplier: GeneralAlgebraicKTheory K.1 and K.7, MotivicEtaleKTheory M.6). Its Milnor-K input is
`milnor_k_of_local_fields`; the case `n = 2` is Moore's theorem (`L.3`). -/

section HMTheoremD

/-- `KTheoryFiniteLocalFields:L.6/hm-theorem-d`, its arithmetic half: for `p` odd, `L/ℚ_p` finite,
`r = [L(ζ_p) : L]`, `p^a = #μ_{p^∞}(L(ζ_p))`, `g` a topological generator of `ℤ_p^×` and
`k = g^{p^{a−1}(p−1)/r}`, one has `ℤ_p/(k^i − 1) ≅ ℤ/w_i^{(p)}(L)` for `i ≥ 1`, i.e.
`p^{v_p(k^i − 1)} = w_i^{(p)}(L)`. Omitted: the `p`-adic homotopy equivalence
`ℤ × BGL(L)^+ ≃ FΨ^k × BFΨ^k × U^d`, which needs `BGL(L)^+`, `BU` and the `p`-adic Adams operations
(supplier: RefinedTraceMethods RT.4:topological, `KTheoryFiniteLocalFields:L.1/fpsi`). -/
theorem hm_theorem_d (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (L : Type u) [Field L]
    [Algebra ℚ_[p] L] [FiniteDimensional ℚ_[p] L] (ζ : AlgebraicClosure L)
    (hζ : IsPrimitiveRoot ζ p) (a : ℕ)
    (ha : Nat.card (CommGroup.primaryComponent (L⟮ζ⟯)ˣ p) = p ^ a) (g : ℤ_[p]ˣ)
    (hg : Dense (Subgroup.zpowers g : Set ℤ_[p]ˣ)) (i : ℕ) (hi : 1 ≤ i) :
    p ^ PadicInt.valuation
        ((((g ^ (p ^ (a - 1) * (p - 1) / Module.finrank L L⟮ζ⟯) : ℤ_[p]ˣ) : ℤ_[p])) ^ i - 1) =
      wInvariantPrimary L p i := by
  sorry

end HMTheoremD

/- `KTheoryFiniteLocalFields:L.6/power-series-de-rham-witt` (`power_series_de_rham_witt`): not
stated here; needs the de Rham–Witt groups `W_nΩ^q` of `𝔽_q[[t]]`, `𝔽_q((t))` with `F` and the big
de Rham–Witt group `𝕎Ω^{q−1}_{𝔽_q}` (supplier: CrystallineCohomology CR.4).

`KTheoryFiniteLocalFields:L.6/geisser-hesselholt-regular-local`
(`geisser_hesselholt_regular_local`): not stated here; needs `K_q(A; ℤ_p)`, `TC_q(A; p)`, the
cyclotomic trace and `WΩ^q_A` with `1 − F` (supplier:
`KTheoryFiniteLocalFields:L.1/completed-k-theory`, `KTheoryFiniteLocalFields:L.4/p-typical-tc`,
RefinedTraceMethods RT.3, CrystallineCohomology CR.4). -/

section EqualCharacteristic

/-- `KTheoryFiniteLocalFields:L.6/equal-characteristic-relative-k-theory`, its algebraic half: the
group `U_1 = 1 + t𝔽_q[[t]]` of principal units, which is `K_1(𝔽_q[[t]], (t))`, is isomorphic to the
product `∏_{j ∈ I_p} W(𝔽_q)` of `p`-typical Witt vectors over the positive integers prime to `p`
(the big Witt vectors of `𝔽_q`, through the Artin–Hasse exponential). Omitted: the splitting
`K(V) ≃ K(𝔽_q) ∨ K(V, I)` and `K_q(V, I; ℤ_p) ≅ 𝕎Ω^{q−1}_{𝔽_q}` in all degrees, which need relative
and completed K-theory and the big de Rham–Witt complex (supplier: GeneralAlgebraicKTheory K.5,
`KTheoryFiniteLocalFields:L.1/completed-k-theory`, CrystallineCohomology CR.4). -/
theorem equal_characteristic_relative_k_theory (p : ℕ) [Fact p.Prime] (k : Type u) [Field k]
    [Finite k] [CharP k p] :
    Nonempty (Additive (Units.map (PowerSeries.constantCoeff (R := k)).toMonoidHom).ker ≃+
      ({j : ℕ // 0 < j ∧ ¬ p ∣ j} → WittVector p k)) := by
  sorry

/- `KTheoryFiniteLocalFields:L.6/equal-characteristic-completed-k-groups`
(`equal_characteristic_completed_k_groups`): not stated here; needs `K_q(V; ℤ_p)`, `K_q(E; ℤ_p)`
and `K_q(E; ℤ/p^ν)` (supplier: `KTheoryFiniteLocalFields:L.1/completed-k-theory`,
`KTheoryFiniteLocalFields:L.1/k-theory-mod-m`). -/

/-- `KTheoryFiniteLocalFields:L.6/equal-characteristic-unique-p-divisibility`, degrees one and two:
for `E = 𝔽_q((t))` and `V = 𝔽_q[[t]]`, `K_1(E) = E^×` and `K_1(V) = V^×` have no `p`-torsion (while
`t` is not a `p`-th power, so `K_1(E)` is not `p`-divisible), and `K_2(E)` (Matsumoto's group,
prelude `milnorK`) and `K_2(V)` (Steinberg's `K₂`, prelude) are uniquely `p`-divisible.
Omitted: degrees `q ≥ 3`, which need `K_q` (supplier: GeneralAlgebraicKTheory K.1). -/
theorem equal_characteristic_unique_p_divisibility (p : ℕ) [Fact p.Prime] (k : Type u) [Field k]
    [Finite k] [CharP k p] :
    (∀ x : (LaurentSeries k)ˣ, x ^ p = 1 → x = 1) ∧
      (¬ ∃ y : LaurentSeries k, y ^ p = HahnSeries.single (1 : ℤ) (1 : k)) ∧
      (∀ x : (PowerSeries k)ˣ, x ^ p = 1 → x = 1) ∧
      Function.Bijective (fun x : milnorK (LaurentSeries k) 2 => p • x) ∧
      Function.Bijective (fun x : TauCeti.Steinberg.K2 (PowerSeries k) => x ^ p) := by
  sorry

end EqualCharacteristic

/- `KTheoryFiniteLocalFields:L.6/equal-characteristic-integral-structure`
(`equal_characteristic_integral_structure`): not stated here; needs `K_n(E)`, `K_n(V)` for `n ≥ 2`
with the localisation splitting and `U_n = K_n(V, (t))` (supplier: GeneralAlgebraicKTheory K.1 and
K.5, `KTheoryFiniteLocalFields:L.2/dvr-localisation`). In degree two it is Moore's theorem in
characteristic `p` (`KTheoryFiniteLocalFields:L.3/moore-equal-characteristic`). -/

end TauCeti.KTheoryFiniteLocal

/-! ## `KTheoryFiniteLocalFields:L.7` — from global to local: completion maps

Setting (pinned by the packet for the layer): `F` is a number field, `v : HeightOneSpectrum (𝓞 F)`
a finite place, `F_v = v.adicCompletion F` (a nonarchimedean local field by Tau Ceti's
`isNonarchimedeanLocalField_adicCompletion`), `𝓞_v = v.adicCompletionIntegers F`, and
`k(v) = 𝓞 F ⧸ v` identified with `𝓀[F_v]` by Tau Ceti's `residueFieldEquivAdicCompletion`. The
completion map `c_v : K_n(F) → K_n(F_v)` needs the algebraic K-groups in every degree, which
neither pinned library has; every statement below is its honest part in degrees `≤ 2`: degree zero
through degrees of fields, degree one through `algebraMap F F_v` on units, degree two through
Matsumoto's group `milnorK _ 2` with the prelude's `milnorK.map`, the norm residue map and the tame
symbol of stage L.3. Stand-ins introduced here: the tame symbol of `F` at `v` and its homomorphism
on `K₂(F)` (`K2SymbolsBrauer:T.3/tame-symbol` at a finite place of a number field). -/

namespace TauCeti.KCompletion

open TauCeti TauCeti.MilnorK TauCeti.LocalK2 IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
  NumberField ValuativeRel
open TauCeti.MilnorK.milnorK (symbol)

/-! ### `KTheoryFiniteLocalFields:L.7/completion-map` -/

/- `completionMap`: not stated here; needs the algebraic K-groups `K_n(F)`, `K_n(F_v)` for all
`n` with their functoriality in ring maps (supplier: GeneralAlgebraicKTheory K.1). Its degree-two
component is `milnorK.map (algebraMap F (v.adicCompletion F)) 2` on Matsumoto's groups, which the
tests below use.
`completionMap_symbol`: not stated here; needs `completionMap` (supplier: GeneralAlgebraicKTheory
K.1); in degree two it is `milnorK.map_symbol` of the companion
(`K2SymbolsBrauer:T.2/milnor-k-theory`).
`completionMap_one`: not stated here; needs `completionMap` and `K₁(F) ≅ Fˣ` (supplier:
GeneralAlgebraicKTheory K.1, KTheoryLowDegrees U.3/U.6).
`completionMap_zero`: not stated here; needs `completionMap` and `K₀(F) ≅ ℤ` functorially
(supplier: GeneralAlgebraicKTheory K.1, KTheoryLowDegrees Z.2).
`completionMap_mul`: not stated here; needs the graded ring `K_*(F)` (supplier:
GeneralAlgebraicKTheory K.7).
`completionMap_integers`: not stated here; needs `K_n(𝓞_F) → K_n(F)` and `K_n(𝓞_v) → K_n(F_v)`
(supplier: GeneralAlgebraicKTheory K.1).
`completionMap_coefficients`: not stated here; needs `K_n(−; ℤ/m)` with its Bockstein sequence
(supplier: StableHomotopyKTheory H.6, node `KTheoryFiniteLocalFields:L.1/k-theory-mod-m`).
`completionMap_restriction`: not stated here; needs `completionMap` on `K_n` (supplier:
GeneralAlgebraicKTheory K.1); its content in degrees `≤ 2` is `restriction_completion_square`.
`completionMap_transfer`: not stated here; needs `completionMap` and transfers on `K_n` (supplier:
GeneralAlgebraicKTheory K.1, K.3); its content in degrees `0, 1` is `transfer_completion_formula`.
`completionMap_boundary`: not stated here; needs `completionMap` and the localisation boundaries
on `K_n` (supplier: ArithmeticKTheory N.2); its content in degrees `1, 2` is
`boundary_completion_compatibility`. -/

section CompletionMapTests

/-- Units of `ℚ` (test notation). -/
local notation "⟪" q "⟫" => Units.mk0 (q : ℚ) (by norm_num)

-- test completionMap_K1_rat (computation)
/- At `v = 5`: `c_5(2)` is a unit of `ℤ₅` and `c_5(10)` has normalised valuation one. -/
example (v : HeightOneSpectrum (𝓞 ℚ)) (hv : Rat.HeightOneSpectrum.natGenerator v = 5) :
    Valued.v (algebraMap ℚ (v.adicCompletion ℚ) 2) = 1 ∧
      normalizedValuation (v.adicCompletion ℚ)
          (Units.map (algebraMap ℚ (v.adicCompletion ℚ)).toMonoidHom ⟪10⟫) =
        Multiplicative.ofAdd 1 := by
  sorry

-- test completionMap_K0 (degenerate): not stated here; needs `completionMap` on `K₀` with
-- `K₀(F) ≅ ℤ ≅ K₀(F_v)` (supplier: GeneralAlgebraicKTheory K.1, KTheoryLowDegrees Z.2).

-- test completionMap_K2_dyadic (computation)
/- At `v = 2`: `c_2{−1, −1} ≠ 0` in `K₂(ℚ₂)`, since its norm residue symbol is `−1`. -/
example (v : HeightOneSpectrum (𝓞 ℚ)) (hv : Rat.HeightOneSpectrum.natGenerator v = 2) :
    milnorK.map (algebraMap ℚ (v.adicCompletion ℚ)) 2 (symbol ![-1, -1]) ≠ 0 ∧
      ((Additive.toMul (normResidueMap (v.adicCompletion ℚ)
          (milnorK.map (algebraMap ℚ (v.adicCompletion ℚ)) 2 (symbol ![-1, -1]))) :
        mu (v.adicCompletion ℚ)) : (v.adicCompletion ℚ)ˣ) = -1 := by
  sorry

-- test completionMap_not_injective (non-example)
/- At `v = 3`: `c_3{−1, −1} = 0` in `K₂(ℚ₃)` (norm residue symbol `1`, and Moore's theorem), while
`{−1, −1} ≠ 0` in `K₂(ℚ)` (the real sign symbol). -/
example (v : HeightOneSpectrum (𝓞 ℚ)) (hv : Rat.HeightOneSpectrum.natGenerator v = 3) :
    milnorK.map (algebraMap ℚ (v.adicCompletion ℚ)) 2 (symbol ![-1, -1]) = 0 ∧
      symbol ![(-1 : ℚˣ), -1] ≠ 0 := by
  sorry

-- test completionMap_K1_coe (compatibility): not stated here; needs `completionMap` on `K₁`
-- with the determinant identification `K₁(F) ≅ Fˣ` (supplier: KTheoryLowDegrees U.3/U.6).

end CompletionMapTests

end TauCeti.KCompletion

namespace TauCeti.KTheoryFiniteLocal

open TauCeti TauCeti.MilnorK TauCeti.LocalK2 IsDedekindDomain IsDedekindDomain.HeightOneSpectrum
  NumberField ValuativeRel
open TauCeti.MilnorK.milnorK (symbol)

section Restriction

variable {F L : Type u} [Field F] [NumberField F] [Field L] [NumberField L] [Algebra F L]
  (v : HeightOneSpectrum (𝓞 F)) (w : HeightOneSpectrum (𝓞 L)) [w.asIdeal.LiesOver v.asIdeal]

/-- `KTheoryFiniteLocalFields:L.7/restriction-completion-square`, in degrees one and two: with
`ι_{w/v} : F_v → L_w` Tau Ceti's `adicCompletionExtension`, `c_w ∘ res_{L/F} = ι_* ∘ c_v` on
`Fˣ` and on Matsumoto's `K₂(F)`. The statement in higher degrees and with coefficients needs
`K_n` (supplier: GeneralAlgebraicKTheory K.1, StableHomotopyKTheory H.6). -/
theorem restriction_completion_square :
    (∀ x : F, adicCompletionExtension F L v w (algebraMap F (v.adicCompletion F) x) =
        algebraMap L (w.adicCompletion L) (algebraMap F L x)) ∧
      (milnorK.map (adicCompletionExtension F L v w) 2).comp
          (milnorK.map (algebraMap F (v.adicCompletion F)) 2) =
        (milnorK.map (algebraMap L (w.adicCompletion L)) 2).comp
          (milnorK.map (algebraMap F L) 2) := by
  sorry

end Restriction

section Transfer

variable {F L : Type u} [Field F] [NumberField F] [Field L] [NumberField L] [Algebra F L]
  (v : HeightOneSpectrum (𝓞 F))

/-- `KTheoryFiniteLocalFields:L.7/transfer-completion-formula`, in degrees one and zero: for
`L/F` finite and `w` running over the places of `L` above `v`,
`c_v(N_{L/F} x) = ∏_{w | v} N_{L_w/F_v}(c_w x)` and `[L : F] = Σ_{w | v} [L_w : F_v]`. The
formula `c_v ∘ N_{L/F} = Σ_w N_{L_w/F_v} ∘ c_w` on `K_n` for `n ≥ 2` needs `K_n` with transfers
(supplier: GeneralAlgebraicKTheory K.1, K.3) and the semilocal equivalence
`L ⊗_F F_v ≅ ∏_{w | v} L_w` (supplier: tauceti NumberFieldArithmetic Layer 5). -/
theorem transfer_completion_formula
    [Fintype {w : HeightOneSpectrum (𝓞 L) // w.asIdeal.LiesOver v.asIdeal}] (x : L) :
    (algebraMap F (v.adicCompletion F) (Algebra.norm F x) =
        ∏ w : {w : HeightOneSpectrum (𝓞 L) // w.asIdeal.LiesOver v.asIdeal},
          letI : w.1.asIdeal.LiesOver v.asIdeal := w.2
          letI := adicCompletionExtensionAlgebra F L v w.1
          Algebra.norm (v.adicCompletion F) (algebraMap L (w.1.adicCompletion L) x)) ∧
      Module.finrank F L =
        ∑ w : {w : HeightOneSpectrum (𝓞 L) // w.asIdeal.LiesOver v.asIdeal},
          letI : w.1.asIdeal.LiesOver v.asIdeal := w.2
          letI := adicCompletionExtensionAlgebra F L v w.1
          Module.finrank (v.adicCompletion F) (w.1.adicCompletion L) := by
  sorry

end Transfer

/- `KTheoryFiniteLocalFields:L.7/boundary-at-a-prime-via-localisation`
(`boundary_at_a_prime_via_localisation`): not stated here; needs the localisation sequences of
K-theory for a Dedekind domain `R` and for `R_𝔭 ⊂ F` with the map `M ↦ M_𝔭` between them
(supplier: GeneralAlgebraicKTheory K.3, ArithmeticKTheory N.2). Its degree-one content
`∂_𝔭 f = ord_𝔭 f` is the definition of the valuation, and its degree-two content is the tame
symbol at `𝔭` for both sequences. -/

section Karoubi

variable {F : Type u} [Field F] [NumberField F] (v : HeightOneSpectrum (𝓞 F))

/-- `KTheoryFiniteLocalFields:L.7/karoubi-completion-square`, its degree-`≤ 1` part for
`R = 𝓞_(v)`, `R̂ = 𝓞_v`: (a) in degree one `ord_v(f) = ord_{F_v}(c f)`; (c) exactness of
`0 → 𝓞_(v)ˣ → 𝓞_vˣ × Fˣ → F_vˣ → 0`, i.e. `F_vˣ = 𝓞_vˣ · Fˣ` and `𝓞_vˣ ∩ Fˣ` is the group of
`v`-units of `F`. The homotopy-cartesian square of spectra and the Mayer–Vietoris sequence in
all degrees need `K(R)` (supplier: GeneralAlgebraicKTheory, Karoubi's Proposition V.7.5). -/
theorem karoubi_completion_square :
    (∀ f : F, Valued.v (algebraMap F (v.adicCompletion F) f) = v.valuation F f) ∧
      (∀ x : (v.adicCompletion F)ˣ, ∃ (u : (v.adicCompletionIntegers F)ˣ) (f : Fˣ),
        (x : v.adicCompletion F) = (u : v.adicCompletion F) * algebraMap F _ f) ∧
      ∀ f : Fˣ, (∃ u : (v.adicCompletionIntegers F)ˣ, (u : v.adicCompletion F) = algebraMap F _ f) ↔
        v.valuation F f = 1 := by
  sorry

end Karoubi

end TauCeti.KTheoryFiniteLocal

namespace TauCeti.KCompletion

open TauCeti TauCeti.MilnorK IsDedekindDomain IsDedekindDomain.HeightOneSpectrum NumberField

section GlobalTame

variable (F : Type u) [Field F] [NumberField F] (v : HeightOneSpectrum (𝓞 F))

/-- Stand-in for `K2SymbolsBrauer:T.3/tame-symbol` of the number field `F` at the finite place
`v`: `∂_v{f, g} = (−1)^{v(f) v(g)} · (f^{v(g)} g^{−v(f)})‾ ∈ k(v)ˣ`, roadmap normalisation. -/
def globalTameSymbol (f g : Fˣ) : (𝓞 F ⧸ v.asIdeal)ˣ := sorry

/-- Stand-in for `K2SymbolsBrauer:T.3/tame-symbol-hom` at `v`: `∂_v : K₂(F) → k(v)ˣ`. -/
def globalTameSymbolHom : milnorK F 2 →+ Additive (𝓞 F ⧸ v.asIdeal)ˣ := sorry

end GlobalTame

end TauCeti.KCompletion

namespace TauCeti.KTheoryFiniteLocal

open TauCeti TauCeti.MilnorK TauCeti.LocalK2 TauCeti.KCompletion IsDedekindDomain
  IsDedekindDomain.HeightOneSpectrum NumberField ValuativeRel
open TauCeti.MilnorK.milnorK (symbol)

section Boundary

variable {F : Type u} [Field F] [NumberField F] (v : HeightOneSpectrum (𝓞 F))

/-- `KTheoryFiniteLocalFields:L.7/boundary-completion-compatibility`, in degrees one and two:
`∂_v = ∂̂_v ∘ c_v`. In degree two the tame symbol of `F` at `v` is the tame symbol of `F_v` after
`k(v) ≅ 𝓀[F_v]` (`residueFieldEquivAdicCompletion`), so `ker c_v ⊆ ker ∂_v` on `K₂(F)`; in degree
one `ord_v(f) = ord_{F_v}(c_v f)`. Degrees `n ≥ 3` and coefficients need the localisation
boundaries on `K_n` (supplier: ArithmeticKTheory N.2, GeneralAlgebraicKTheory K.3). -/
theorem boundary_completion_compatibility :
    (∀ a b : Fˣ,
      Units.map (v.residueFieldEquivAdicCompletion (K := F)).toRingHom.toMonoidHom
          (globalTameSymbol F v a b) =
        tameSymbol (v.adicCompletion F)
          (Units.map (algebraMap F (v.adicCompletion F)).toMonoidHom a)
          (Units.map (algebraMap F (v.adicCompletion F)).toMonoidHom b)) ∧
      (∀ x : milnorK F 2, milnorK.map (algebraMap F (v.adicCompletion F)) 2 x = 0 →
        globalTameSymbolHom F v x = 0) ∧
      ∀ f : F, Valued.v (algebraMap F (v.adicCompletion F) f) = v.valuation F f := by
  sorry

/-- `KTheoryFiniteLocalFields:L.7/hilbert-symbol-completion`: with `h_v = h_{F_v} ∘ c_v` on
`K₂(F)` and `w_v = #μ(F_v)`: (a) `h_v{a, b} = (a, b)_{F_v,w_v}`; (b) for `μ_m ⊆ F` the `m`-th
power Hilbert symbol at `v` is `h_v^{w_v/m}` and lies in `μ_m(F)`; (c) on torsion classes
`c_v x = 0 ↔ h_v x = 1`; (d) for `d ∣ Nv − 1`, `(a, b)_{F_v,d} = ω(∂_v{a, b})^{−(Nv−1)/d}` with the
global tame symbol at `v`. (c) uses Moore's theorem for `F_v`, which rests on Merkurjev's. -/
theorem hilbert_symbol_completion [HasEnoughRootsOfUnity (v.adicCompletion F)
      (muCard (v.adicCompletion F))]
    (hw : IsUnit (muCard (v.adicCompletion F) : v.adicCompletion F)) (a b : Fˣ) :
    ((Additive.toMul (normResidueMap (v.adicCompletion F)
        (milnorK.map (algebraMap F (v.adicCompletion F)) 2 (symbol ![a, b]))) :
          mu (v.adicCompletion F)) : (v.adicCompletion F)ˣ) =
        (normResidueSymbol (v.adicCompletion F) (muCard (v.adicCompletion F)) hw
          (Units.map (algebraMap F (v.adicCompletion F)).toMonoidHom a)
          (Units.map (algebraMap F (v.adicCompletion F)).toMonoidHom b) : (v.adicCompletion F)ˣ) ∧
      (∀ (m : ℕ) [HasEnoughRootsOfUnity F m] [HasEnoughRootsOfUnity (v.adicCompletion F) m]
        (hm : IsUnit (m : v.adicCompletion F)),
        (normResidueSymbol (v.adicCompletion F) m hm
            (Units.map (algebraMap F (v.adicCompletion F)).toMonoidHom a)
            (Units.map (algebraMap F (v.adicCompletion F)).toMonoidHom b) : (v.adicCompletion F)ˣ) =
          ((Additive.toMul ((muCard (v.adicCompletion F) / m) • normResidueMap (v.adicCompletion F)
            (milnorK.map (algebraMap F (v.adicCompletion F)) 2 (symbol ![a, b]))) :
              mu (v.adicCompletion F)) : (v.adicCompletion F)ˣ) ∧
          ∃ ζ : rootsOfUnity m F, Units.map (algebraMap F (v.adicCompletion F)).toMonoidHom ζ =
            (normResidueSymbol (v.adicCompletion F) m hm
              (Units.map (algebraMap F (v.adicCompletion F)).toMonoidHom a)
              (Units.map (algebraMap F (v.adicCompletion F)).toMonoidHom b) :
                (v.adicCompletion F)ˣ)) ∧
      (∀ x ∈ AddCommGroup.torsion (milnorK F 2),
        milnorK.map (algebraMap F (v.adicCompletion F)) 2 x = 0 ↔
          normResidueMap (v.adicCompletion F)
            (milnorK.map (algebraMap F (v.adicCompletion F)) 2 x) = 0) ∧
      ∀ (d : ℕ) (_ : d ∣ Nat.card (𝓞 F ⧸ v.asIdeal) - 1)
        [HasEnoughRootsOfUnity (v.adicCompletion F) d] (hd : IsUnit (d : v.adicCompletion F)),
        (normResidueSymbol (v.adicCompletion F) d hd
            (Units.map (algebraMap F (v.adicCompletion F)).toMonoidHom a)
            (Units.map (algebraMap F (v.adicCompletion F)).toMonoidHom b) : (v.adicCompletion F)ˣ) =
          omega (v.adicCompletion F)
              (Units.map (v.residueFieldEquivAdicCompletion (K := F)).toRingHom.toMonoidHom
                (globalTameSymbol F v a b)) ^
            (-(((Nat.card (𝓞 F ⧸ v.asIdeal) - 1) / d : ℕ) : ℤ)) := by
  sorry

end Boundary

/- `KTheoryFiniteLocalFields:L.7/etale-chern-class-completion` (`etale_chern_class_completion`):
not stated here; needs the étale Chern classes `c_{i,n} : K_n(X; ℤ/m) → H^{2i−n}_et(X, μ_m^{⊗i})`
(supplier: MotivicEtaleKTheory M.8) and the restriction `H^j(F, μ_m^{⊗i}) → H^j(F_v, μ_m^{⊗i})` to a
decomposition group (supplier: MotivicEtaleKTheory M.1). Even the degree-one case
`res_v κ_F(a) = κ_{F_v}(a)` with Tau Ceti's `kummerMap` needs that restriction map, i.e. a map
`AbsoluteGaloisGroup F_v → AbsoluteGaloisGroup F` from an embedding of separable closures, which
the pinned libraries do not provide.

`KTheoryFiniteLocalFields:L.7/unramified-chern-class-reduction`
(`unramified_chern_class_reduction`): not stated here; needs the étale Chern classes of `K_n` with
finite coefficients (supplier: MotivicEtaleKTheory M.8), étale cohomology of `Spec 𝓞_v` with its
rigidity (supplier: MotivicEtaleKTheory M.1) and the unramified subgroups `H^j_ur(F_v, M)` with
inflation (supplier: ArithmeticGaloisDuality D7).

`KTheoryFiniteLocalFields:L.7/cyclotomic-trace-completion` (`cyclotomic_trace_completion`): not
stated here; needs the cyclotomic trace `K(A) → TC(A; p)` and its naturality (supplier:
RefinedTraceMethods RT.3) and `TC(𝓞_v | F_v; p)` (node
`KTheoryFiniteLocalFields:L.4/thh-of-dvr-with-log-poles`). -/

end TauCeti.KTheoryFiniteLocal

namespace TauCeti.KCompletion

open IsDedekindDomain IsDedekindDomain.HeightOneSpectrum NumberField

/-! ### `KTheoryFiniteLocalFields:L.7/semilocal-completed-map` -/

/- `semilocalCompletionMap`: not stated here; needs the completed K-groups `K_n(F_v; ℤ_p)`
(supplier: node `KTheoryFiniteLocalFields:L.1/completed-k-theory`, StableHomotopyKTheory H.6) and
`K_n(F)` (supplier: GeneralAlgebraicKTheory K.1).
`semilocalCompletionMap_apply`: not stated here; needs `semilocalCompletionMap` and
`completionMap` (same suppliers).
`semilocalCompletionMap_eq_tensor`: not stated here; needs `K` of the ring `F ⊗_ℚ ℚ_p` and the
semilocal equivalence `F ⊗_ℚ ℚ_p ≅ ∏_{v | p} F_v` (supplier: tauceti NumberFieldArithmetic Layer
5, GeneralAlgebraicKTheory K.1).
`semilocalCompletionMap_restriction`: not stated here; needs `semilocalCompletionMap` (same
suppliers); its degree-one and degree-two shadow is `restriction_completion_square`.
`semilocalCompletionMap_transfer`: not stated here; needs `semilocalCompletionMap` with transfers
(supplier: GeneralAlgebraicKTheory K.3); its degree-one shadow is `transfer_completion_formula`.
`semilocalCompletionMap_one`: not stated here; needs `K₁(F_v; ℤ_p) ≅ (F_vˣ)^∧_p`, the `p`-adic
completion of `F_vˣ` (supplier: node `KTheoryFiniteLocalFields:L.1/completed-k-theory`). -/

-- test semilocalCompletionMap_rat (degenerate): not stated here; needs `semilocalCompletionMap`
-- and `K_n(ℚ_p; ℤ_p)` (supplier: `KTheoryFiniteLocalFields:L.1/completed-k-theory`).

-- test semilocalCompletionMap_K1_split (computation): not stated here; needs the `5`-adic
-- completion `(ℚ₅ˣ)^∧_5 = K₁(ℚ₅; ℤ₅)` of the two components (supplier:
-- `KTheoryFiniteLocalFields:L.1/completed-k-theory`) and `ℚ(i)` as a number field with its two
-- named places above `5` (neither pinned library names them).

-- test semilocalCompletionMap_K1_not_injective (non-example)
/- The completion `(ℚ_pˣ)^∧_p` is not available, but the fact the test rests on is: for `p` odd,
`−1` is a `p^ν`-th power in `ℚ_p` for every `ν`, so its image `lim_ν [−1] ∈ lim_ν ℚ_pˣ/p^ν` is
trivial although `−1 ≠ 1` in `ℚˣ`. -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    (∀ ν : ℕ, ∃ y : ℚ_[p]ˣ, y ^ (p ^ ν) = -1) ∧ (-1 : ℚˣ) ≠ 1 := by
  sorry

-- test semilocalCompletionMap_transfer_K1 (compatibility)
/- Degree one of the compatibility with transfer: `N_{L/F}(x) = ∏_{w | v} N_{L_w/F_v}(x)` in
`F_v` (the local–global norm formula; `transfer_completion_formula`). -/
example {F L : Type u} [Field F] [NumberField F] [Field L] [NumberField L] [Algebra F L]
    (v : HeightOneSpectrum (𝓞 F))
    [Fintype {w : HeightOneSpectrum (𝓞 L) // w.asIdeal.LiesOver v.asIdeal}] (x : Lˣ) :
    algebraMap F (v.adicCompletion F) (Algebra.norm F (x : L)) =
      ∏ w : {w : HeightOneSpectrum (𝓞 L) // w.asIdeal.LiesOver v.asIdeal},
        letI : w.1.asIdeal.LiesOver v.asIdeal := w.2
        letI := adicCompletionExtensionAlgebra F L v w.1
        Algebra.norm (v.adicCompletion F) (algebraMap L (w.1.adicCompletion L) x) := by
  sorry

end TauCeti.KCompletion

end
