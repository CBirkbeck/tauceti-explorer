import Mathlib

/-!
# Automorphic forms on reductive groups: representative target signatures

The mathematical roadmap is `AutomorphicFormsOnReductiveGroups.md`. This file records
light definitions and theorem signatures expressible against the pinned APIs; it is
not an exhaustive list of the targets of any layer.

The arithmetic scope is a connected reductive group over a number field. Generic
function predicates below specialize to its actual adelic points, rational diagonal,
central character and constant terms supplied by the named roadmaps. They do not
construct those objects. Compact-orbit finiteness is separate from smoothness and
admissibility. The explicit type-C₂ coroot bound permits zero pairings and tests the
nonzero ones uniformly; it is not the automorphic temperedness theorem.
-/

namespace TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

noncomputable section

open scoped Classical

/-! ## Layer AF.0: test functions and growth -/

section Growth

variable {X : Type*}

/-- Polynomial growth against a supplied height. Arithmetic heights are at least one. -/
def HasModerateGrowth (height : X → ℝ) (f : X → ℂ) : Prop :=
  ∃ C N : ℝ, 0 ≤ C ∧ 0 ≤ N ∧ ∀ x, ‖f x‖ ≤ C * height x ^ N

/-- Polynomially comparable heights give the same growth space. -/
theorem moderateGrowth_iff_of_comparable (h h' : X → ℝ)
    (h1 : ∀ x, 1 ≤ h x) (h1' : ∀ x, 1 ≤ h' x)
    (hcomp : ∃ C M : ℝ, 0 < C ∧ 0 ≤ M ∧ ∀ x, h x ≤ C * h' x ^ M)
    (hcomp' : ∃ C M : ℝ, 0 < C ∧ 0 ≤ M ∧ ∀ x, h' x ≤ C * h x ^ M)
    (f : X → ℂ) : HasModerateGrowth h f ↔ HasModerateGrowth h' f := sorry

/-- Right translation preserves moderate growth for a submultiplicative height. -/
theorem moderateGrowth_rightTranslate {G : Type*} [Group G]
    (height : G → ℝ) (h1 : ∀ x, 1 ≤ height x)
    (hmul : ∀ x y, height (x * y) ≤ height x * height y)
    {f : G → ℂ} (hf : HasModerateGrowth height f) (y : G) :
    HasModerateGrowth height (fun x => f (x * y)) := sorry

/-- Constants have moderate growth; the condition permits exponent zero. -/
example (height : X → ℝ) (h1 : ∀ x, 1 ≤ height x) (c : ℂ) :
    HasModerateGrowth height (fun _ => c) := sorry

/-- Exponential growth fails the polynomial-height condition. -/
example : ¬HasModerateGrowth (fun x : ℝ => 1 + |x|)
    (fun x : ℝ => (Real.exp x : ℂ)) := sorry

end Growth

/-! ## Layer AF.1a: cohomology and invariant forms

The full compatible pair, all-degree relative complex, homogeneous-space forms
and van Est comparison are README targets using the shared ALS foundation and
DifferentialGeometry. No new cohomology carrier is introduced here.
-/

/-! ## Layer AF.1: real reductive representations -/

section CompactOrbits

variable {K V : Type*} [Group K] [AddCommGroup V] [Module ℂ V]

/-- A vector is K-finite when the linear span of its compact-group orbit is finite.
Smoothness and differentiated covariance belong to the compatible-module contract. -/
def IsKFinite (ρ : Representation ℂ K V) (v : V) : Prop :=
  Module.Finite ℂ (Submodule.span ℂ {w : V | ∃ k : K, ρ k v = w})

/-- Every vector of a finite-dimensional representation is K-finite. -/
theorem kFinite_of_finiteDimensional [FiniteDimensional ℂ V]
    (ρ : Representation ℂ K V) (v : V) : IsKFinite ρ v := sorry

/-- The zero vector is K-finite without a finite-dimensional ambient space. -/
example (ρ : Representation ℂ K V) : IsKFinite ρ 0 := sorry

/-- In a trivial representation every orbit spans at most a line. -/
example (v : V) : IsKFinite (1 : Representation ℂ K V) v := sorry

end CompactOrbits

/-! ## Layer AF.2: automorphic spaces and representations -/

section Equivariance

variable {G : Type*} [Group G]

/-- Rational left invariance, with the actual diagonal subgroup supplied separately. -/
def IsLeftInvariant (Γ : Subgroup G) (f : G → ℂ) : Prop :=
  ∀ γ ∈ Γ, ∀ g, f (γ * g) = f g

/-- Right invariance under a fixed finite level; no smoothness is asserted. -/
def IsLevelInvariant (J : Subgroup G) (f : G → ℂ) : Prop :=
  ∀ u ∈ J, ∀ g, f (g * u) = f g

/-- The fixed central character convention is f(gz)=χ(z)f(g).
Z is supplied as a central subgroup by the arithmetic specialization. -/
def HasCentralCharacter (Z : Subgroup G) (χ : Z →* ℂˣ) (f : G → ℂ) : Prop :=
  ∀ z : Z, ∀ g, f (g * z) = (χ z : ℂ) * f g

/-- Right translation, with R(y)R(z)=R(yz). -/
def rightTranslate (y : G) (f : G → ℂ) : G → ℂ := fun g => f (g * y)

/-- The action law retains the order of the right-translation parameters. -/
theorem rightTranslate_mul (y z : G) (f : G → ℂ) :
    rightTranslate (y * z) f = rightTranslate y (rightTranslate z f) := sorry

/-- Rational left invariance survives right translation. -/
theorem leftInvariant_rightTranslate (Γ : Subgroup G) {f : G → ℂ}
    (hf : IsLeftInvariant Γ f) (y : G) :
    IsLeftInvariant Γ (rightTranslate y f) := sorry

/-- Right translation changes level by conjugation. -/
theorem levelInvariant_rightTranslate (J : Subgroup G) {f : G → ℂ}
    (hf : IsLevelInvariant J f) (y : G) :
    IsLevelInvariant (J.map (MulAut.conj y).toMonoidHom) (rightTranslate y f) := sorry

/-- In S₃ the two conjugation directions give different translated levels.
Here f(g)=g(2), J fixes 2, y=(0 1 2), and j=(0 1). -/
example :
    let y : Equiv.Perm (Fin 3) := Equiv.swap 0 1 * Equiv.swap 1 2
    let j : Equiv.Perm (Fin 3) := Equiv.swap 0 1
    let f : Equiv.Perm (Fin 3) → ℂ := fun g => ((g 2).val : ℂ)
    rightTranslate y f (y * j * y⁻¹) = rightTranslate y f 1 ∧
      rightTranslate y f (y⁻¹ * j * y) ≠ rightTranslate y f 1 := by
  norm_num [rightTranslate, Equiv.Perm.mul_apply, Equiv.swap_apply_def, Fin.ext_iff]

/-- A constant function is rationally invariant. -/
example (Γ : Subgroup G) (c : ℂ) : IsLeftInvariant Γ (fun _ => c) := sorry

/-- Full left invariance forces constancy, not merely an arbitrary invariant subspace. -/
example {f : G → ℂ} (hf : IsLeftInvariant ⊤ f) : f = fun _ => f 1 := sorry

/-- The trivial level imposes no additional condition. -/
example (f : G → ℂ) : IsLevelInvariant ⊥ f := sorry

/-- Full right invariance forces constancy. -/
example {f : G → ℂ} (hf : IsLevelInvariant ⊤ f) : f = fun _ => f 1 := sorry

/-- Nonzero constants have the trivial central character. -/
example (Z : Subgroup G) (c : ℂ) : HasCentralCharacter Z 1 (fun _ => c) := sorry

/-- A nonzero value detects the specified character; zero functions would not. -/
example (Z : Subgroup G) (χ : Z →* ℂˣ) {f : G → ℂ}
    (hf : HasCentralCharacter Z χ f) (g : G) (hg : f g ≠ 0) (z : Z)
    (hz : f (g * z) = f g) : χ z = 1 := sorry

/-- The identity parameter acts identically. -/
example (f : G → ℂ) : rightTranslate 1 f = f := sorry

/-- Evaluation specifies the action, beyond merely its representation law. -/
example (y g : G) (f : G → ℂ) : rightTranslate y f g = f (g * y) := rfl

end Equivariance

/-! ## Layer AF.3: constant terms and cuspidality -/

section ConstantTerms

variable {P V W : Type*} [AddCommGroup V] [Module ℂ V]
  [AddCommGroup W] [Module ℂ W]

/-- Kernel formulation on the actual constant-term maps supplied for proper parabolics.
The arithmetic specialization must index all proper rational parabolics. -/
def IsCuspidalFor (constantTerm : P → V →ₗ[ℂ] W) (v : V) : Prop :=
  ∀ p, constantTerm p v = 0

/-- No proper parabolics makes the kernel condition vacuous, as for an anisotropic group. -/
example [IsEmpty P] (constantTerm : P → V →ₗ[ℂ] W) (v : V) :
    IsCuspidalFor constantTerm v := sorry

/-- A nonzero constant term excludes cuspidality. -/
example (constantTerm : P → V →ₗ[ℂ] W) (v : V) (p : P)
    (h : constantTerm p v ≠ 0) : ¬IsCuspidalFor constantTerm v := sorry

/-- A zero constant-term map does not test other parabolics; all indices are required. -/
example (v : V) : IsCuspidalFor (fun _ : P => (0 : V →ₗ[ℂ] W)) v := sorry

end ConstantTerms

/-! ## Layer AF.4: algebraic weights, coherent cohomology and rationality -/

namespace CoherentWeights

/-- Positive C₂ coroot evaluations at semisimple infinitesimal character (x,y).
The long roots 2e₁,2e₂ have coroot evaluations x,y, without a spurious factor two. -/
def corootValues (x y : ℝ) : Fin 4 → ℝ := ![x - y, x, x + y, y]

/-- Every nonzero coroot evaluation exceeds one common bound in absolute value.
Zero evaluations are permitted: in particular the noncompact wall y=0. -/
def Separated (R x y : ℝ) : Prop :=
  ∀ i : Fin 4, corootValues x y i = 0 ∨ R < |corootValues x y i|

/-- Semisimple Harish-Chandra parameter for the coherent coefficient of weight (k,l).
The central coordinate and its balancing are supplied separately. -/
def hcParameter (k l : ℤ) : ℝ × ℝ := ((k : ℝ) - 1, (l : ℝ) - 2)

/-- The sufficient source inequalities imply the explicit coroot bound after shifting
its constant. This is an arithmetic inequality, not essential temperedness. -/
theorem separated_of_weight_gaps (R : ℝ) (hR : 0 < R) (k l : ℤ)
    (hgap : R + 2 < (k : ℝ) - l)
    (hl : l = 2 ∨ R + 2 < (l : ℝ)) :
    Separated R (hcParameter k l).1 (hcParameter k l).2 := sorry

/-- With l≥2, root separation gives the source inequalities with a smaller bound.
The constants are not identified without this adjustment. -/
theorem weight_gaps_of_separated (R : ℝ) (hR : 2 < R) (k l : ℤ)
    (hkl : l ≤ k) (hl : 2 ≤ l)
    (hsep : Separated R (hcParameter k l).1 (hcParameter k l).2) :
    R - 1 < (k : ℝ) - l ∧ (l = 2 ∨ R < (l : ℝ)) := sorry

/-- The holomorphic/generic limit wall remains eligible at sufficiently large k. -/
example : Separated 5 (hcParameter 12 2).1 (hcParameter 12 2).2 := by
  norm_num [Separated, corootValues, hcParameter, Fin.forall_fin_succ]

/-- The compact wall can stay close even when both coordinates are large. -/
example : ¬Separated 5 (hcParameter 12 12).1 (hcParameter 12 12).2 := by
  norm_num [Separated, corootValues, hcParameter, Fin.forall_fin_succ]

/-- A strictly positive distance equal to the bound does not suffice. -/
example : ¬Separated 5 5 0 := by
  norm_num [Separated, corootValues, Fin.forall_fin_succ]

/-- An interior weight tests all four root directions. -/
example : corootValues (hcParameter 20 10).1 (hcParameter 20 10).2 = ![11,19,27,8] := by
  norm_num [corootValues, hcParameter]

/-- The weight-two wall has parameter (k−1,0), not (k,2). -/
example : hcParameter 4 2 = (3, 0) := by norm_num [hcParameter]

end CoherentWeights

namespace CoefficientLattices

/-- Full, finitely generated Z_p lattices stable under the specified local matrix group. -/
def LocalStableLattice (p : ℕ) [Fact p.Prime] (n : ℕ)
    (J : Subgroup (GL (Fin n) ℚ_[p])) :
    Set (Submodule ℤ_[p] (Fin n → ℚ_[p])) :=
  {L | L.FG ∧ Submodule.span ℚ_[p] (L : Set (Fin n → ℚ_[p])) = ⊤ ∧
    ∀ g ∈ J, ∀ v ∈ L, (g : Matrix (Fin n) (Fin n) ℚ_[p]).mulVec v ∈ L}

/-- A compact subgroup of GL_n(Q_p) stabilizes a full lattice. -/
theorem exists_localStableLattice (p : ℕ) [Fact p.Prime] (n : ℕ)
    (J : Subgroup (GL (Fin n) ℚ_[p]))
    (hJ : IsCompact (J : Set (GL (Fin n) ℚ_[p]))) :
    (LocalStableLattice p n J).Nonempty := sorry

/-- The zero submodule is not full in a nonzero-dimensional space. -/
example (p : ℕ) [Fact p.Prime] :
    (⊥ : Submodule ℤ_[p] (Fin 1 → ℚ_[p])) ∉ LocalStableLattice p 1 ⊥ := sorry

/-- Scaling by p changes the lattice without losing stability or full span. -/
example (p : ℕ) [Fact p.Prime] (n : ℕ)
    (J : Subgroup (GL (Fin n) ℚ_[p])) {L : Submodule ℤ_[p] (Fin n → ℚ_[p])}
    (hL : L ∈ LocalStableLattice p n J) :
    L.map ((p : ℤ_[p]) • LinearMap.id) ∈ LocalStableLattice p n J := sorry

end CoefficientLattices

/-- A torsion/residual eigenclass includes a ring character and a nonzero vector.
Its arithmetic specialization is integral Betti cohomology with the ALS Hecke action. -/
structure TorsionEigenSystem (T : Type*) [CommRing T]
    (H : Type*) [AddCommGroup H] [Module T H]
    (Λ : Type*) [CommRing Λ] [Module Λ H] where
  sys : T →+* Λ
  c : H
  ne_zero : c ≠ 0
  eigen : ∀ t : T, t • c = sys t • c

/-- Finite residue fields give maximal kernels without requiring surjectivity. -/
theorem TorsionEigenSystem.maximalIdeal {T H Λ : Type*}
    [CommRing T] [AddCommGroup H] [Module T H] [Field Λ] [Finite Λ] [Module Λ H]
    (e : TorsionEigenSystem T H Λ) : (RingHom.ker e.sys).IsMaximal := sorry

/-- A zero class cannot satisfy the nonzero-eigenclass condition. -/
example {T H Λ : Type*} [CommRing T] [AddCommGroup H] [Module T H]
    [CommRing Λ] [Module Λ H] (e : TorsionEigenSystem T H Λ) : e.c ≠ 0 := e.ne_zero

/-- Non-surjectivity alone does not obstruct maximality of the kernel. -/
example : (RingHom.ker (algebraMap (ZMod 2) (Polynomial (ZMod 2)))).IsMaximal := sorry

/-! ## Layer AF.5: comparison examples and transport -/

section AlgebraicForms

variable {Γ G M : Type*} [Group Γ] [Group G]
  [AddCommGroup M] [Module ℂ M]

/-- Gross's rational coefficient convention, on supplied rational and finite point groups.
The p-adic level-action convention is a distinct README target. -/
def IsAlgebraicModularForm (ι : Γ →* G) (σ : Representation ℂ Γ M)
    (J : Subgroup G) (f : G → M) : Prop :=
  (∀ γ g, f (ι γ * g) = σ γ (f g)) ∧ ∀ g, ∀ u ∈ J, f (g * u) = f g

/-- Evaluation at double-coset representatives determines an equivariant form.
Arithmetic finiteness of the class set is imported from AdelicAlgebraicGroups. -/
theorem algebraicModularForm_ext (ι : Γ →* G) (σ : Representation ℂ Γ M)
    (J : Subgroup G) {I : Type*} (t : I → G)
    (hcover : ∀ g, ∃ (i : I) (γ : Γ) (u : J), g = ι γ * t i * u)
    {f f' : G → M} (hf : IsAlgebraicModularForm ι σ J f)
    (hf' : IsAlgebraicModularForm ι σ J f')
    (ht : ∀ i, f (t i) = f' (t i)) : f = f' := sorry

/-- Zero is always an equivariant form. -/
example (ι : Γ →* G) (σ : Representation ℂ Γ M) (J : Subgroup G) :
    IsAlgebraicModularForm ι σ J (fun _ => 0) := sorry

/-- A nonzero constant must satisfy rational coefficient equivariance. -/
example (ι : Γ →* G) (σ : Representation ℂ Γ M) (J : Subgroup G)
    (m : M) (γ : Γ) (hγ : σ γ m ≠ m) :
    ¬IsAlgebraicModularForm ι σ J (fun _ => m) := sorry

end AlgebraicForms

/-!
README-only targets include real/Harish-Chandra classification and globalization;
all-degree relative and coherent cohomology and van Est; actual automorphic
representation and discrete-occurrence carriers; the three BHR conclusions
`essentiallyTempered_of_automorphic_coherent_regular`,
`coherent_classification_largeWeight`, `holomorphic_of_coherentH0` and
`tempered_coherent_nonvanishing_iff`; global coefficient descent and rationality;
and the GL₁, GL₂ and Maass arithmetic comparison maps. Each has its complete
hypotheses, intended API and Checks in the roadmap. The pure weight predicates
above are only numerical parts of those contracts.

The full definition/construction targets are stated in the README under these names:

AF.0: Automorphic.SmoothAdelicFunction; Automorphic.TestFunction; Automorphic.SchwartzFunction;
  Automorphic.HasModerateGrowth; Automorphic.UniformModerateGrowth.

AF.1a: RelativeLieCohomology.Pair; RelativeLieCohomology.GKModule; RelativeLieCohomology.cochains;
  VanEst.smoothCochains; VanEst.invariantForms; RelativeLieCohomology.AbsoluteLie.complex.

AF.1: RealReductive.realPoints; RealReductive.Datum; RealReductive.kFinite; RealReductive.HCModule;
  RealReductive.InfChar; RealReductive.principalSeries; RealReductive.SFRep;
  RealReductive.GContinuousNorm; RealReductive.IrrAdmissible; RealReductive.normalizedInduction;
  RealReductive.GL2.WeightModel.

AF.2: Automorphic.AutomorphicForm; Automorphic.SmoothAutomorphicForm;
  Automorphic.AutomorphicForm.gkModule; Automorphic.AutomorphicRepresentation;
  Automorphic.RestrictedTensor; Automorphic.SL2.HolomorphicForm;
  RealReductive.archimedeanHeckeAlgebra.

AF.3: Automorphic.constantTerm; Automorphic.CuspForm; Automorphic.CuspidalRepresentation;
  Automorphic.MaassCuspForm.

AF.4: Automorphic.AlgebraicWeight; Automorphic.IsCAlgebraic; Automorphic.IsCohomological;
  Automorphic.ell0; Automorphic.Hermitian.IsHCPositive; Automorphic.coherentCohomology;
  Automorphic.GSp4.dsRep; Automorphic.StableLattice; Automorphic.rationalityField;
  Automorphic.TorsionEigenSystem; Automorphic.LocalStableLattice; Automorphic.IsCohomologicalWith.

AF.5: Automorphic.GL2.adelize; Automorphic.AlgebraicModularForm;
  Automorphic.CentralCharacterAlgebraicModularForm.
-/

end

end TauCetiRoadmap.AutomorphicFormsOnReductiveGroups
