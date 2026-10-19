/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.RepresentationTheory.Homological.ContCohomology.Basic
import Mathlib.RepresentationTheory.Homological.ContCohomology.Functoriality
import Mathlib.RepresentationTheory.Continuous.Basic
import Mathlib.Topology.Algebra.Group.Matrix
import Mathlib.Topology.Instances.ZMod
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.Topology.Algebra.OpenSubgroup
import TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete

/-!
# Scholze's mod p functor and the mod p cohomology of the Lubin–Tate and Drinfeld towers

**Standard note.** This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower.md` is definitive.
The statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures; target proofs are placeholders. Light definitions have real bodies.

## What is stated here

The pinned Mathlib and Tau Ceti have continuous cohomology of topological groups
(`continuousCohomology`, built from homogeneous continuous cochains), topological representations
(`TopRep`), smooth discrete representations (`TauCeti.IsSmoothDiscrete`), `SL₂(ℚ_p)` and
`GL₂(ℚ_p)` as topological groups, and `ZMod p` with its discrete topology. This file states
what those carriers make statable:

* SZ.2: Moore's vanishing of `H¹` and `H²` of `SL₂(ℚ_p)` with trivial `ZMod p` coefficients
  for `p` odd; Fust's finiteness of the continuous cohomology of `SL₂(ℚ_p)` with admissible
  smooth coefficients; admissibility of the restriction to `SL₂(ℚ_p)` of an admissible
  representation of `GL₂(ℚ_p)` with a central character.
* SZ.4: generic pairs of characters.
* SZ.5: functors of finite image, with their API and unit tests.

## README targets without carriers at the pins

The equivariant étale sites, the Lubin–Tate and Drinfeld towers and the Gross–Hopkins torsor
(SZ.0), Scholze's sheaf `ℱ_π` and the functors `Sⁱ` with their finiteness (SZ.1), the
Cartan–Leray spectral sequence and the comparison map (SZ.2), Ludwig's Borel quotient and
vanishing theorem (SZ.3), the global input (SZ.4), the finite-length theorem (SZ.5) and the
multiplicity theorems (SZ.6) need perfectoid spaces, diamonds, étale cohomology of adic spaces
and completed cohomology, none of which exists at the pinned commits. They are targets of the
roadmap document and are not declared here.
-/

namespace TauCetiRoadmap.ScholzeFunctor

open CategoryTheory

/-! ## SZ.5: functors of finite image -/

section FiniteImage

variable (k : Type*) [Field k] {ι : Type*}

/-- A family of `k`-vector spaces, indexed by (isomorphism classes of) smooth irreducible
representations, is *of finite image* if every value is finite-dimensional and all but finitely
many values are zero (CDN, §4.2). -/
def IsFiniteImage (V : ι → Type*) [∀ i, AddCommGroup (V i)] [∀ i, Module k (V i)] : Prop :=
  (∀ i, FiniteDimensional k (V i)) ∧ {i | Nontrivial (V i)}.Finite

variable {k}

/-- `isFiniteImage_iff`: the definition unfolded. -/
theorem isFiniteImage_iff (V : ι → Type*) [∀ i, AddCommGroup (V i)] [∀ i, Module k (V i)] :
    IsFiniteImage k V ↔ (∀ i, FiniteDimensional k (V i)) ∧ {i | Nontrivial (V i)}.Finite :=
  Iff.rfl

/-- `IsFiniteImage.of_injective`: a pointwise subobject of a family of finite image is of finite
image. -/
theorem IsFiniteImage.of_injective {V W : ι → Type*} [∀ i, AddCommGroup (V i)]
    [∀ i, Module k (V i)] [∀ i, AddCommGroup (W i)] [∀ i, Module k (W i)]
    (f : ∀ i, V i →ₗ[k] W i) (hf : ∀ i, Function.Injective (f i)) (hW : IsFiniteImage k W) :
    IsFiniteImage k V := by
  sorry

/-- `IsFiniteImage.of_exact`: if `V' i → V i → V'' i` is exact for every `i` and the outer
families are of finite image, so is the middle one. -/
theorem IsFiniteImage.of_exact {V' V V'' : ι → Type*} [∀ i, AddCommGroup (V' i)]
    [∀ i, Module k (V' i)] [∀ i, AddCommGroup (V i)] [∀ i, Module k (V i)]
    [∀ i, AddCommGroup (V'' i)] [∀ i, Module k (V'' i)]
    (f : ∀ i, V' i →ₗ[k] V i) (g : ∀ i, V i →ₗ[k] V'' i) (hfg : ∀ i, Function.Exact (f i) (g i))
    (h' : IsFiniteImage k V') (h'' : IsFiniteImage k V'') :
    IsFiniteImage k V := by
  sorry

-- test: TauCetiRoadmap.ScholzeFunctor.IsFiniteImage_zero
/-- Unit test (degenerate): the zero family is of finite image. -/
example : IsFiniteImage k (fun _ : ι => Fin 0 → k) := by
  sorry

-- test: TauCetiRoadmap.ScholzeFunctor.IsFiniteImage_single
/-- Unit test (computation): a family supported at a single index, with a one-dimensional
value there, is of finite image. -/
example : IsFiniteImage k (fun n : ℕ => Fin (if n = 0 then 1 else 0) → k) := by
  sorry

-- test: TauCetiRoadmap.ScholzeFunctor.IsFiniteImage_not_iwahori (abstract form)
/-- Unit test (non-example): a family with infinitely many non-zero finite-dimensional values,
like `π ↦ π^{I₁}`, is not of finite image. -/
example : ¬ IsFiniteImage k (fun _ : ℕ => k) := by
  sorry

-- test: TauCetiRoadmap.ScholzeFunctor.IsFiniteImage_single_infinite_dimension
/-- Unit test (non-example): finite support alone does not suffice when its value is
infinite-dimensional. -/
example : ¬ IsFiniteImage k (fun _ : Unit => ℕ → k) := by
  sorry

end FiniteImage

/-! ## SZ.4: generic pairs of characters -/

section GenericPair

variable {p : ℕ} [Fact p.Prime] {k : Type*} [Field k]

/-- A pair `(χ₁, χ₂)` of characters `ℚ_p^× → k^×` is *generic* with respect to the mod `p`
cyclotomic character `ε` if `χ₁ χ₂⁻¹ ∉ {1, ε, ε⁻¹}` (CDN, §1.3.2). -/
def IsGenericPair (ε χ₁ χ₂ : ℚ_[p]ˣ →* kˣ) : Prop :=
  χ₁ / χ₂ ≠ 1 ∧ χ₁ / χ₂ ≠ ε ∧ χ₁ / χ₂ ≠ ε⁻¹

/-- `IsGenericPair.symm`: genericity is symmetric in the two characters. -/
theorem IsGenericPair.symm {ε χ₁ χ₂ : ℚ_[p]ˣ →* kˣ} (h : IsGenericPair ε χ₁ χ₂) :
    IsGenericPair ε χ₂ χ₁ := by
  sorry

/-- `IsGenericPair.twist`: genericity is invariant under twisting both characters. -/
theorem IsGenericPair.twist {ε χ₁ χ₂ : ℚ_[p]ˣ →* kˣ} (η : ℚ_[p]ˣ →* kˣ)
    (h : IsGenericPair ε χ₁ χ₂) : IsGenericPair ε (χ₁ * η) (χ₂ * η) := by
  sorry

/-- Unit test (non-example): a pair of equal characters is never generic. -/
example (ε χ : ℚ_[p]ˣ →* kˣ) : ¬ IsGenericPair ε χ χ := by
  sorry

/-- Unit test: a ratio equal to the cyclotomic character is excluded. -/
example (ε : ℚ_[p]ˣ →* kˣ) : ¬ IsGenericPair ε ε 1 := by
  sorry

/-- Unit test: the inverse cyclotomic ratio is excluded as well. -/
example (ε : ℚ_[p]ˣ →* kˣ) : ¬ IsGenericPair ε ε⁻¹ 1 := by
  sorry

/-- Unit test: when the three forbidden ratios coincide, every other ratio is generic. -/
example (χ : ℚ_[p]ˣ →* kˣ) (hχ : χ ≠ 1) : IsGenericPair 1 χ 1 := by
  sorry

end GenericPair

/-! ## SZ.2: continuous cohomology of `SL₂(ℚ_p)` -/

section ContinuousCohomologySL2

variable (p : ℕ) [Fact p.Prime]

/-- `SL₂(ℚ_p)` as a topological group. -/
abbrev SL2Qp : Type := Matrix.SpecialLinearGroup (Fin 2) ℚ_[p]

/-- `GL₂(ℚ_p)` as a topological group. -/
abbrev GL2Qp : Type := GL (Fin 2) ℚ_[p]

/-- The inclusion `SL₂(ℚ_p) → GL₂(ℚ_p)` as a continuous homomorphism. -/
noncomputable def slToGL : (SL2Qp p) →ₜ* (GL2Qp p) :=
  ⟨Matrix.SpecialLinearGroup.toGL, Matrix.SpecialLinearGroup.continuous_toGL⟩

/-- The trivial representation of `SL₂(ℚ_p)` on `ZMod p`. -/
noncomputable abbrev trivialModP : TopRep (ZMod p) (SL2Qp p) :=
  TopRep.of (ContRepresentation.trivial (ZMod p) (SL2Qp p) (ZMod p))

/-- SZ.2/moore-sl2-vanishing, degree one: `SL₂(ℚ_p)` is perfect, so it has no non-zero
continuous homomorphism to `ZMod p`. -/
theorem continuousCohomology_one_sl2_trivial :
    Subsingleton (continuousCohomology 1 (trivialModP p)) := by
  sorry

/-- SZ.2/moore-sl2-vanishing, degree two (Moore): for `p` odd the roots of unity of `ℚ_p` have
order prime to `p`, so `H²(SL₂(ℚ_p), ZMod p) = Hom(μ(ℚ_p), ZMod p) = 0`. -/
theorem continuousCohomology_two_sl2_trivial (hp : p ≠ 2) :
    Subsingleton (continuousCohomology 2 (trivialModP p)) := by
  sorry

/-- Admissibility of a smooth discrete representation over `ZMod p`: invariants under every
compact open subgroup are finite (Emerton's admissibility for `𝔽_p`-coefficients). -/
def IsAdmissibleModP {G : Type*} [Group G] [TopologicalSpace G]
    (X : TopRep (ZMod p) G) : Prop :=
  TauCeti.IsSmoothDiscrete (ZMod p) X ∧
    ∀ U : OpenSubgroup G, IsCompact (U : Set G) → {x : X.V | ∀ u ∈ U, X.ρ u x = x}.Finite

/-- The finite trivial representation is admissible. -/
example : IsAdmissibleModP p (TopRep.of
    (ContRepresentation.trivial (ZMod p) Unit (ZMod p))) := by
  sorry

/-- The zero representation is admissible. -/
example : IsAdmissibleModP p (TopRep.of
    (ContRepresentation.trivial (ZMod p) Unit (Fin 0 → ZMod p))) := by
  sorry

/-- A discrete infinite vector space with trivial action is smooth but is not admissible:
its fixed space for the compact open trivial group is the entire infinite set. -/
example (V : Type*) [AddCommGroup V] [Module (ZMod p) V] [TopologicalSpace V]
    [DiscreteTopology V] [IsTopologicalAddGroup V] [ContinuousSMul (ZMod p) V] [Infinite V] :
    ¬ IsAdmissibleModP p (TopRep.of (ContRepresentation.trivial (ZMod p) Unit V)) := by
  sorry

/-- SZ.2/fust-cohomology (c): continuous cohomology of the `p`-adic reductive group `SL₂(ℚ_p)`
with admissible smooth `ZMod p` coefficients is finite in every degree (Fust, Lemma 6.6). -/
theorem finite_continuousCohomology_sl2 (X : TopRep (ZMod p) (SL2Qp p))
    (hX : IsAdmissibleModP p X) (i : ℕ) : Finite (continuousCohomology i X) := by
  sorry

/-- SZ.2/fust-cohomology (e): the restriction to `SL₂(ℚ_p)` of an admissible smooth
representation of `GL₂(ℚ_p)` on which the centre acts by scalars is admissible. -/
theorem isAdmissibleModP_res_sl2 (X : TopRep (ZMod p) (GL2Qp p))
    (hX : IsAdmissibleModP p X)
    (hcentral : ∀ z ∈ Subgroup.center (GL2Qp p), ∃ c : ZMod p, ∀ x : X.V, X.ρ z x = c • x) :
    IsAdmissibleModP p (TopRep.res (slToGL p).toMonoidHom X) := by
  sorry

/-- Unit test (degree zero, compatibility with invariants): `H⁰` of the trivial representation
is `ZMod p` itself, so it is non-zero. -/
example : Nontrivial (continuousCohomology 0 (trivialModP p)) := by
  sorry

/-- Unit test (non-example for `p = 2`): Moore's computation gives `H²(SL₂(ℚ₂), 𝔽₂) ≅ 𝔽₂`, so the
oddness hypothesis cannot be dropped. -/
example : Nontrivial (continuousCohomology 2 (trivialModP 2)) := by
  sorry

end ContinuousCohomologySL2

end TauCetiRoadmap.ScholzeFunctor
