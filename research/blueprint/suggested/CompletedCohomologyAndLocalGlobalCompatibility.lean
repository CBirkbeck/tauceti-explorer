/-
# Completed cohomology and p-adic local–global compatibility over Q: representative interfaces

This file is not the roadmap and is not exhaustive. The definitive document is
`CompletedCohomologyAndLocalGlobalCompatibility.md`; these statements suggest Lean forms so that
contributors and reviewers converge on names and signatures. Proofs are admitted, except for a
few one-line facts; elaboration establishes neither the mathematics nor an implementation.
Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.

Only what is statable over carriers that exist at the pins is prototyped: completed modules as
`AdicCompletion` of a supplied p-level colimit, the definite quaternionic module as continuous
functions on a supplied profinite space, Hecke closures as topological closures of subalgebras,
equivariant multiplicity spaces and their evaluation maps, Eisenstein ideals, pro-modular primes,
and supports of patched modules. The étale cohomology of modular and Shimura curves, the
completed Hecke algebras of CompletedCohomologyPartII CC.8, the p-adic local Langlands
correspondence, Colmez's functor, Paškūnas's blocks and the patched modules themselves are not at
the pins; their declarations are README targets, listed in the register at the end. No such
object is replaced by an arbitrary type or an empty predicate.
-/
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.Topology.ContinuousMap.Algebra
import Mathlib.Topology.Algebra.Algebra
import Mathlib.RingTheory.Spectrum.Prime.Basic
import Mathlib.RingTheory.Spectrum.Prime.RingHom
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.RingTheory.Support
import Mathlib.RepresentationTheory.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.GroupTheory.GroupAction.Quotient
import Mathlib.RingTheory.LocalRing.Basic
import Mathlib.Analysis.Normed.Field.Basic
import Mathlib.Topology.Algebra.Module.FiniteDimension

noncomputable section
open TensorProduct

/-! ## R31.1 Towers and completed cohomology

### `R31.1/the-object-the-conjecture-is-about`

The p-level colimit `H = colim_{K_p} H¹(Y(K_pK^p), O)` and its arithmetic actions are supplied by
CompletedCohomologyPartII (CC.1, CC.8); here only the ϖ-adic completion is formed, with Mathlib's
`AdicCompletion`. -/
namespace TauCeti.ModularCompletedCohomology

section Completion
variable (O : Type*) [CommRing O] (ϖ : O)
variable (H : Type*) [AddCommGroup H] [Module O H]

/-- Completed cohomology at a fixed tame level: the ϖ-adic completion of the p-level colimit. -/
abbrev atTameLevel : Type _ := AdicCompletion (Ideal.span {ϖ}) H

/-- The reduction maps `Ĥ → H/ϖ^s H`. -/
abbrev reduction (s : ℕ) : atTameLevel O ϖ H →ₗ[O] H ⧸ ((Ideal.span {ϖ}) ^ s • ⊤ : Submodule O H) :=
  AdicCompletion.eval (Ideal.span {ϖ}) H s

/-- `reductionEquiv`: the reduction maps induce `Ĥ/ϖ^s Ĥ ≅ H/ϖ^s H` (Emerton (5.1.2)); the ideal
is finitely generated, so this holds for every module. -/
theorem reductionEquiv (s : ℕ) :
    Nonempty ((atTameLevel O ϖ H ⧸ ((Ideal.span {ϖ}) ^ s • ⊤ : Submodule O (atTameLevel O ϖ H)))
      ≃ₗ[O] (H ⧸ ((Ideal.span {ϖ}) ^ s • ⊤ : Submodule O H))) := sorry

/-- The reduction maps are surjective. -/
theorem reduction_surjective (s : ℕ) : Function.Surjective (reduction O ϖ H s) :=
  AdicCompletion.eval_surjective (Ideal.span {ϖ}) H s

/- Test: degenerate. The completion of the zero module is zero. -/
example [Subsingleton H] : Subsingleton (atTameLevel O ϖ H) := sorry

end Completion

end TauCeti.ModularCompletedCohomology

/-! ### `R31.1/definite-quaternionic-completed-module`

`X` is a supplied topological space, with a continuous action of a group
`D` (standing for `D_p^×`, acting on the left through `g ↦ g⁻¹`, so that the translation below is
Pan's right translation) and of a centre `Z` through `ι`. Over Q one may use the profinite
raw quaternionic quotient. Over a general totally real field the README distinguishes that
quotient from the inverse limit of finite-level sets and retains Pan's central quotient. -/
namespace TauCeti.DefiniteQuaternionCompleted

section DefiniteQuaternion
variable (O : Type*) [CommRing O] [TopologicalSpace O] [IsTopologicalRing O]
variable (X : Type*) [TopologicalSpace X]
variable (M : Type*) [TopologicalSpace M] [AddCommGroup M] [Module O M] [IsTopologicalAddGroup M]
  [ContinuousConstSMul O M]

/-- The continuous `M`-valued functions on the quaternionic profinite set. -/
abbrev functions : Type _ := C(X, M)

variable {D : Type*} [Group D] [MulAction D X] [ContinuousConstSMul D X]

/-- Translation by `d ∈ D` on `C(X, M)`. -/
def translate (d : D) : C(X, M) →ₗ[O] C(X, M) where
  toFun f := f.comp ⟨fun x => d⁻¹ • x, continuous_const_smul _⟩
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

variable {Z : Type*} [CommGroup Z] (ι : Z →* D)

/-- `withCentralCharacter`: functions with `f(ι z • x) = ψ(z) f(x)`, Pan's `S_ψ(U^p, M)`. -/
def withCentralCharacter (ψ : Z →* Oˣ) : Submodule O C(X, M) where
  carrier := {f | ∀ z x, f (ι z • x) = (ψ z : O) • f x}
  add_mem' := by
    intro f g hf hg z x
    simp [hf z x, hg z x, smul_add]
  zero_mem' := by intro z x; simp
  smul_mem' := by
    intro c f hf z x
    simp [hf z x, smul_comm c]

/- Test: computation. Translation by `1` is the identity. -/
example (f : C(X, M)) : translate O X M (1 : D) f = f := sorry

/- Test: `TauCeti.DefiniteQuaternionCompleted.trivial_coefficients_degenerate` (empty case).
On the empty quaternionic set the module of functions is zero. -/
example [IsEmpty X] : Subsingleton C(X, M) := sorry

/-! ### `R31.1/definite-quaternionic-tower-structure`, part (b) (Dospinescu–Le Bras, Lemme 13.1)

A compact group acting freely on a compact Hausdorff space with finitely many orbits makes the
continuous functions a finite sum of copies of `C(K, M)`. -/
theorem functions_free_finite_orbits
    (K : Type*) [Group K] [TopologicalSpace K] [CompactSpace K] [IsTopologicalGroup K]
    [MulAction K X] [ContinuousSMul K X] [CompactSpace X] [T2Space X]
    (hfree : ∀ (k : K) (x : X), k • x = x → k = 1)
    [Finite (MulAction.orbitRel.Quotient K X)] :
    ∃ s : ℕ, Nonempty (C(X, M) ≃ₗ[O] (Fin s → C(K, M))) := sorry

end DefiniteQuaternion

/-! ## R31.2 Classical specialisations

### `R31.2/definite-quaternionic-classical-forms`, part (a) (Dospinescu–Le Bras, Lemme 4.5)

p-adic automorphic forms of weight `W` and level `K` are the `K`-equivariant functions
`X → W`; they are the `K`-maps from `W^*` to `C(X, E)`. -/
section ClassicalForms
variable (E : Type*) [NontriviallyNormedField E] [CompleteSpace E]
variable (X : Type*) [TopologicalSpace X]
variable {K : Type*} [Group K] [MulAction K X] [ContinuousConstSMul K X]
variable (W : Type*) [AddCommGroup W] [Module E W] [TopologicalSpace W] [IsTopologicalAddGroup W]
  [ContinuousSMul E W] [T2Space W] (ρ : Representation E K W)

/-- `A_K(W)`: continuous `f : X → W` with `f (k • x) = ρ k (f x)`. -/
def weightedForms : Submodule E C(X, W) where
  carrier := {f | ∀ (k : K) x, f (k • x) = ρ k (f x)}
  add_mem' := by intro f g hf hg k x; simp [hf k x, hg k x]
  zero_mem' := by intro k x; simp
  smul_mem' := by intro c f hf k x; simp [hf k x]

/-- The `K`-equivariant maps `W^* → C(X, E)`, with `K` acting on `W^*` contragrediently and on
`C(X, E)` by translation. -/
def equivariantDualMaps : Submodule E (Module.Dual E W →ₗ[E] C(X, E)) where
  carrier := {φ | ∀ (k : K) (l : Module.Dual E W),
    φ (l ∘ₗ ρ k⁻¹) = translate E X E k (φ l)}
  add_mem' := by intro φ ψ hφ hψ k l; simp [hφ k l, hψ k l]
  zero_mem' := by intro k l; simp
  smul_mem' := by intro c φ hφ k l; simp [hφ k l]

/-- Dospinescu–Le Bras Lemme 4.5, in the finite-dimensional case (the topology of `W` is the
canonical one, since `E` is complete and `W` is Hausdorff). -/
theorem weightedForms_equiv [FiniteDimensional E W] :
    Nonempty (equivariantDualMaps E X W ρ ≃ₗ[E] weightedForms E X W ρ) := sorry

/- Test: degenerate. For the trivial representation on `W = E`, weighted forms are the
`K`-invariant functions. -/
example (f : C(X, E)) :
    f ∈ weightedForms E X E (1 : Representation E K E) ↔ ∀ (k : K) x, f (k • x) = f x := sorry

end ClassicalForms

/-! ## R31.3 Hecke and deformation actions

### `R31.3/definite-quaternionic-hecke-algebra`

The big Hecke algebra as the closure of the subalgebra generated by the Hecke operators, in a
supplied topological algebra of operators (Dospinescu–Le Bras's weak closure). -/
section Hecke
variable (O : Type*) [CommRing O]
variable {A : Type*} [Ring A] [TopologicalSpace A] [IsTopologicalRing A] [Algebra O A]

/-- `heckeAlgebra_weakClosure`: the closure of the algebra generated by `S`. -/
def heckeClosure (S : Set A) : Subalgebra O A :=
  (Algebra.adjoin O S).topologicalClosure

theorem subset_heckeClosure (S : Set A) : S ⊆ heckeClosure O S :=
  fun _ hs => (Algebra.adjoin O S).le_topologicalClosure (Algebra.subset_adjoin hs)

/- Test: degenerate. The closure of the empty set of operators contains the scalars. -/
example (c : O) : algebraMap O A c ∈ heckeClosure O (∅ : Set A) := sorry

end Hecke

/-! ### `R31.3/eisenstein-localisation-and-pro-modular-primes` -/
section ProModular
variable {O T : Type*} [CommRing O] [CommRing T] [Algebra O T]

/-- `eisensteinIdeal`: generated by `ϖ` and `T_v − (1 + χ(Frob_v))` for `v` outside `S`. -/
def eisensteinIdeal (ϖ : O) {V : Type*} (Tv : V → T) (χ : V → O) : Ideal T :=
  Ideal.span (insert (algebraMap O T ϖ) (Set.range fun v => Tv v - (1 + algebraMap O T (χ v))))

variable {R : Type*} [CommRing R]

/-- `IsProModular`: a prime of the pseudo-deformation ring containing the kernel of the map to
the localised Hecke algebra (Pan 4.1.3). -/
def IsProModular (φ : R →+* T) (q : PrimeSpectrum R) : Prop :=
  RingHom.ker φ ≤ q.asIdeal

/-- `IsProModular.of_le`: pro-modularity is closed under specialisation. -/
theorem IsProModular.of_le {φ : R →+* T} {q q' : PrimeSpectrum R} (hq : IsProModular φ q)
    (h : q ≤ q') : IsProModular φ q' :=
  le_trans hq h

/-- `IsProModular_iff_comap`: for the surjection `R^{ps} ↠ T_m`, pro-modular primes are the
contractions of primes of `T_m`. -/
theorem isProModular_iff_comap (φ : R →+* T) (hφ : Function.Surjective φ) (q : PrimeSpectrum R) :
    IsProModular φ q ↔ ∃ Q : PrimeSpectrum T, PrimeSpectrum.comap φ Q = q := sorry

/- Test: `TauCeti.DefiniteQuaternionCompleted.IsProModular_zero_hecke`.
If the Hecke quotient is zero, no prime is pro-modular. -/
example (φ : R →+* T) [Subsingleton T] (q : PrimeSpectrum R) : ¬ IsProModular φ q := sorry

/- Test: `TauCeti.DefiniteQuaternionCompleted.IsProModular_kernel`.
A prime equal to the kernel is pro-modular. -/
example (φ : R →+* T) (q : PrimeSpectrum R) (hq : q.asIdeal = RingHom.ker φ) :
    IsProModular φ q := by
  unfold IsProModular
  rw [hq]

end ProModular

end TauCeti.DefiniteQuaternionCompleted

/-! ## R31.4 p-adic local–global compatibility

### Multiplicity spaces and evaluation maps (`R31.4/multiplicity-module`,
`R31.3/galois-factorisation-of-completed-cohomology`)

For a representation `V` of a group and a representation `H`, the multiplicity space is the
space of equivariant linear maps, and the evaluation map is `V ⊗ Hom_G(V, H) → H`. The actual
`X(θ)` is a space of continuous maps out of `ρ^m ⊗ θ` and is a README target. -/
namespace TauCeti.ModularCompletedCohomology

section Multiplicity
variable (E : Type*) [Field E] {G : Type*} [Group G]
variable {V H : Type*} [AddCommGroup V] [Module E V] [AddCommGroup H] [Module E H]
variable (ρV : Representation E G V) (ρH : Representation E G H)

/-- `multiplicitySpace`: `Hom_{E[G]}(V, H)`. -/
def multiplicitySpace : Submodule E (V →ₗ[E] H) where
  carrier := {f | ∀ g, f ∘ₗ ρV g = ρH g ∘ₗ f}
  add_mem' := by
    intro f f' hf hf' g
    simp [LinearMap.add_comp, LinearMap.comp_add, hf g, hf' g]
  zero_mem' := by intro g; simp
  smul_mem' := by
    intro c f hf g
    simp [LinearMap.smul_comp, LinearMap.comp_smul, hf g]

/-- `multiplicityEvaluation`: `V ⊗ Hom_{E[G]}(V, H) → H`. -/
def multiplicityEvaluation : V ⊗[E] multiplicitySpace E ρV ρH →ₗ[E] H :=
  TensorProduct.lift
    { toFun := fun v => { toFun := fun f => (f : V →ₗ[E] H) v
                          map_add' := fun f f' => rfl
                          map_smul' := fun c f => rfl }
      map_add' := fun v v' => by ext f; simp
      map_smul' := fun c v => by ext f; simp }

/-- For `V` finite-dimensional, irreducible and with only scalar equivariant endomorphisms, the
evaluation map is injective (the step used in Emerton's Proposition 5.5.3 and Theorem 6.4.16). -/
theorem multiplicityEvaluation_injective [FiniteDimensional E V]
    (hirr : ∀ W : Submodule E V, (∀ g, W.map (ρV g) ≤ W) → W = ⊥ ∨ W = ⊤)
    (hschur : ∀ f ∈ multiplicitySpace E ρV ρV, ∃ c : E, f = c • LinearMap.id) :
    Function.Injective (multiplicityEvaluation E ρV ρH) := sorry

/- Test: degenerate. Into the zero representation the multiplicity space is zero. -/
example [Subsingleton H] : Subsingleton (multiplicitySpace E ρV ρH) := sorry

end Multiplicity

end TauCeti.ModularCompletedCohomology

/-! ## R31.5 Patched completed modules and support

### `R31.5/patched-support-is-a-union-of-components`

Emerton–Paškūnas define the support of a module finitely generated over `R[[K]]` (not over `R`)
through its `R`-annihilator. -/
namespace TauCeti.PatchedCompletedModule

section Support
variable (R : Type*) [CommRing R] (M : Type*) [AddCommGroup M] [Module R M]

/-- `patchedSupport`: `V(Ann_R M)`. -/
def patchedSupport : Set (PrimeSpectrum R) :=
  PrimeSpectrum.zeroLocus (Module.annihilator R M : Set R)

/-- Emerton–Paškūnas Lemma 6.2: if finitely many elements generate `M` over a ring `B` acting
compatibly with `R`, the `R`-span of those elements has the same annihilator, hence the same
support. -/
theorem annihilator_span_eq {B : Type*} [Ring B] [Module B M] [SMulCommClass R B M]
    (S : Set M) (hS : Submodule.span B S = ⊤) :
    Module.annihilator R (Submodule.span R S) = Module.annihilator R M := sorry

/-- Full annihilator support means every element of the annihilator is nilpotent.
For a reduced ring this is equivalent to faithful action. A nilpotent ideal conclusion in
the general case additionally needs Noetherianity. -/
theorem patchedSupport_eq_univ_iff [IsReduced R] :
    patchedSupport R M = Set.univ ↔ Module.annihilator R M = ⊥ := sorry

/- Test: degenerate. The zero module has empty support when `R` is nonzero. -/
example [Nontrivial R] [Subsingleton M] : patchedSupport R M = ∅ := sorry

/- Test: computation. `R` itself has full support. -/
example : patchedSupport R R = Set.univ := sorry

end Support

end TauCeti.PatchedCompletedModule

/-! ## Register of README targets

The following packet declarations are not prototyped here because their carriers are not at
the pins (étale cohomology of modular and Shimura curves, CompletedCohomologyPartII's completed
Hecke algebras and residual localisations, the p-adic local Langlands correspondence, Colmez's
functor and Paškūnas's blocks, deformation rings, patched modules). Their statements, API and
unit tests are in the README.

* R31.1: `TauCeti.ModularCompletedCohomology.{tameColimit, atSigma, compactSupport, galoisAction,
  heckeOperator, tameRestriction_isClosedEmbedding, multiplicitySpace, equivCC}`;
  `TauCeti.ShimuraCurveCompleted.*`; `TauCeti.DefiniteQuaternionCompleted.{completedCohomology,
  completedHomology, invariants, schikhofDual, twist, equivCC}`.
* R31.2: `TauCeti.DefiniteQuaternionCompleted.{typed, typeSpecialised, typeSpecialised_dual,
  typeSpecialised_exact, typeSpecialised_free, typeHeckeAlgebra}`;
  `TauCeti.ModularCompletedCohomology.{globalSerreWeights,
  mem_globalSerreWeights_iff_m_torsion, isGoodWeight}` and the Serre-weight bound/genericity
  theorem, with its small-weight, multiplicity-one and Ihara inputs.
* R31.3: `TauCeti.ModularCompletedCohomology.{heckeAlgebra, heckeAlgebra_faithful,
  heckeAlgebra_productLocal, heckeAlgebra_dense, heckeAlgebra_tameMap, IsAllowableLevel,
  residualHeckeAlgebra, residualHeckeAlgebra_localNoetherian, residualHeckeAlgebra_eventuallyConst,
  heckeDeterminant, heckeDeterminant_charpoly, heckeDeterminant_tame, heckeRepresentation,
  heckeRepresentation_trace, heckeRepresentation_reduction, specialisation,
  specialisation_classical}`; `TauCeti.DefiniteQuaternionCompleted.{heckeAlgebra,
  heckeAlgebra_semilocal, heckeAlgebra_maxIdeal_bijection, heckeAlgebra_independent,
  heckeAlgebra_commutes, localHeckeAlgebra, eisensteinPseudoRep, psToHecke, semisimpleAtPrime}`.
* R31.4: `TauCeti.LocalGlobalCompatibility.*` (local families at and away from `p`, the
  multiplicity module `X(θ)`, its coadmissibility, cotorsion-free submodule and evaluation, and
  Emerton's completed tensor product); `TauCeti.DefiniteQuaternionCompleted.{multiplicityModule,
  multiplicityDual, multiplicityDual_finite, multiplicityModule_fibre, multiplicityModule_support,
  multiplicityEvaluation, block, blockMultiplicity, galoisAction, automorphicAction,
  blockMultiplicity_reconstruct}`.
* R31.5: `TauCeti.PatchedCompletedModule.*` (the CEGGPS patched module, its Banach dual and
  fibres, the quaternionic patched completed homology and its typed specialisations).
* The theorems of R31.4–R31.6 (Emerton's Theorems 1.2.1, 1.2.6, 6.2.13; Nakamura's
  Corollaries 2.5–2.8; Dospinescu–Le Bras's Théorèmes 5.4–5.5; Pan's Theorems 3.5.5, 4.1.7, 8.0.1;
  Tung's full-support theorems; promodularity and Böckle's R = T) are stated in the README.
  Canonical refined compatibility is retained for scalar residual endomorphisms; split
  distinct characters use the weaker θ-family form. Away from p, the co-Whittaker family
  and its coadmissible smooth dual have separate APIs. The source-normalisation and
  supplier gaps recorded in the README remain conditions on the corresponding targets.
-/
