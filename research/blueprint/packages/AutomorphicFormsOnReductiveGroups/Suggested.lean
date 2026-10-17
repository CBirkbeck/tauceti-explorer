import Mathlib
import TauCeti.NumberTheory.HeckeRing.GL2.Degree

/-!
# Automorphic forms on reductive groups

Light function, growth, coefficient and numerical interfaces for the roadmap.
Arithmetic point groups, constant terms and representations are supplied when
these predicates are specialized. Analytic and cohomological construction
targets and their exact hypotheses are in README.md, which is the roadmap.
This file records representative signatures and is not exhaustive. Right
translation, central balance and coherent weight shifts are explicit.
-/

namespace TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

noncomputable section

open scoped Classical

/- Layer 0: growth and invariance. -/

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

/-- A bounded height cannot accommodate the identity function on the real line. -/
example : ¬HasModerateGrowth (fun _ : ℝ => 1) (fun x : ℝ => (x : ℂ)) := sorry

/-- Exponential growth fails the polynomial-height condition. -/
example : ¬HasModerateGrowth (fun x : ℝ => 1 + |x|)
    (fun x : ℝ => (Real.exp x : ℂ)) := sorry

end Growth



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

/-- The trivial rational subgroup leaves every function available. -/
example (f : G → ℂ) : IsLeftInvariant ⊥ f := sorry

/-- The trivial level imposes no additional condition. -/
example (f : G → ℂ) : IsLevelInvariant ⊥ f := sorry

/-- Full right invariance forces constancy. -/
example {f : G → ℂ} (hf : IsLevelInvariant ⊤ f) : f = fun _ => f 1 := sorry

/-- Constants satisfy every finite-level relation. -/
example (J : Subgroup G) (c : ℂ) : IsLevelInvariant J (fun _ => c) := sorry

/-- Nonzero constants have the trivial central character. -/
example (Z : Subgroup G) (c : ℂ) : HasCentralCharacter Z 1 (fun _ => c) := sorry

/-- The zero function does not determine a central character. -/
example (Z : Subgroup G) (χ : Z →* ℂˣ) :
    HasCentralCharacter Z χ (fun _ => 0) := sorry

/-- A nonzero value detects the specified character; zero functions would not. -/
example (Z : Subgroup G) (χ : Z →* ℂˣ) {f : G → ℂ}
    (hf : HasCentralCharacter Z χ f) (g : G) (hg : f g ≠ 0) (z : Z)
    (hz : f (g * z) = f g) : χ z = 1 := sorry

/-- The identity parameter acts identically. -/
example (f : G → ℂ) : rightTranslate 1 f = f := sorry

/-- Evaluation specifies the action, beyond merely its representation law. -/
example (y g : G) (f : G → ℂ) : rightTranslate y f g = f (g * y) := rfl

end Equivariance

/- Layer 2: compact orbit spans. -/

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

/-- The finite-dimensional case includes every nonzero orbit, not only fixed vectors. -/
example [FiniteDimensional ℂ V] (ρ : Representation ℂ K V) (v : V) :
    IsKFinite ρ v := kFinite_of_finiteDimensional ρ v

/-- An infinite cyclic regular orbit spans infinitely many independent point masses. -/
example : ¬IsKFinite (Representation.leftRegular ℂ (Multiplicative ℤ))
    (MonoidAlgebra.single 1 1) := sorry

end CompactOrbits

/- Layer 4: constant-term kernels. -/

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



/- Layer 5: integral lattices and residual classes. -/

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

/-- In rank zero, the zero lattice is full, including at p=2. -/
example (p : ℕ) [Fact p.Prime] (J : Subgroup (GL (Fin 0) ℚ_[p])) :
    (⊥ : Submodule ℤ_[p] (Fin 0 → ℚ_[p])) ∈ LocalStableLattice p 0 J := sorry

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
    (Λ : Type*) [CommRing Λ] [Module Λ H] [SMulCommClass T Λ H] where
  sys : T →+* Λ
  c : H
  ne_zero : c ≠ 0
  eigen : ∀ t : T, t • c = sys t • c

/-- Finite residue fields give maximal kernels without requiring surjectivity. -/
theorem TorsionEigenSystem.maximalIdeal {T H Λ : Type*}
    [CommRing T] [AddCommGroup H] [Module T H] [Field Λ] [Finite Λ] [Module Λ H] [SMulCommClass T Λ H]
    (e : TorsionEigenSystem T H Λ) : (RingHom.ker e.sys).IsMaximal := sorry

/-- A zero class cannot satisfy the nonzero-eigenclass condition. -/
example {T H Λ : Type*} [CommRing T] [AddCommGroup H] [Module T H]
    [CommRing Λ] [Module Λ H] [SMulCommClass T Λ H] (e : TorsionEigenSystem T H Λ) : e.c ≠ 0 := e.ne_zero

/-- A zero coefficient module has no eigenclass data. -/
example {T H Λ : Type*} [CommRing T] [AddCommGroup H] [Module T H]
    [CommRing Λ] [Module Λ H] [SMulCommClass T Λ H] [Subsingleton H] :
    IsEmpty (TorsionEigenSystem T H Λ) := sorry

/-- A genuine residual scalar eigenclass exists over the field with two elements. -/
example : Nonempty (TorsionEigenSystem (ZMod 2) (ZMod 2) (ZMod 2)) := by
  exact ⟨{ sys := RingHom.id _
           c := 1
           ne_zero := by decide
           eigen := fun _ => rfl }⟩

/-- Non-surjectivity alone does not obstruct maximality of the kernel. -/
example : (RingHom.ker (algebraMap (ZMod 2) (Polynomial (ZMod 2)))).IsMaximal := sorry

/- Layer 6: coherent weight coordinates. -/

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

/-- The regular interior satisfies the same bound in every root direction. -/
example : Separated 5 (hcParameter 20 10).1 (hcParameter 20 10).2 := by
  norm_num [Separated, corootValues, hcParameter, Fin.forall_fin_succ]

/-- An interior weight tests all four root directions. -/
example : corootValues (hcParameter 20 10).1 (hcParameter 20 10).2 = ![11,19,27,8] := by
  norm_num [corootValues, hcParameter]

/-- The weight-two wall has parameter (k−1,0), not (k,2). -/
example : hcParameter 4 2 = (3, 0) := by norm_num [hcParameter]

/-- The weight boundary is not shifted by a common scalar. -/
example : hcParameter 2 2 = (1, 0) := by norm_num [hcParameter]

/-- The compact singular point is excluded by compact regularity. -/
example : hcParameter 1 2 = (0, 0) := by norm_num [hcParameter]

/-- Long-root coroot evaluations have no factor of two. -/
example : corootValues 3 1 = ![2, 3, 4, 1] := by norm_num [corootValues]

/-- Contragredience permutes the four evaluations and reverses their signs. -/
example : corootValues (-1) (-3) = ![2, -1, -4, -3] := by
  norm_num [corootValues]

end CoherentWeights

/- Layer 7: rational coefficient covariance. -/

section AlgebraicForms

variable {A Γ G M : Type*} [CommRing A] [Group Γ] [Group G]
  [AddCommGroup M] [Module A M]

/-- Gross's rational coefficient convention, on supplied rational and finite point groups.
The p-adic level-action convention is a distinct README target. -/
def IsAlgebraicModularForm (ι : Γ →* G) (σ : Representation A Γ M)
    (J : Subgroup G) (f : G → M) : Prop :=
  (∀ γ g, f (ι γ * g) = σ γ (f g)) ∧ ∀ g, ∀ u ∈ J, f (g * u) = f g

/-- Evaluation at double-coset representatives determines an equivariant form.
Arithmetic finiteness of the class set is imported from AdelicAlgebraicGroups. -/
theorem algebraicModularForm_ext (ι : Γ →* G) (σ : Representation A Γ M)
    (J : Subgroup G) {I : Type*} (t : I → G)
    (hcover : ∀ g, ∃ (i : I) (γ : Γ) (u : J), g = ι γ * t i * u)
    {f f' : G → M} (hf : IsAlgebraicModularForm ι σ J f)
    (hf' : IsAlgebraicModularForm ι σ J f')
    (ht : ∀ i, f (t i) = f' (t i)) : f = f' := sorry

/-- Zero is always an equivariant form. -/
example (ι : Γ →* G) (σ : Representation A Γ M) (J : Subgroup G) :
    IsAlgebraicModularForm ι σ J (fun _ => 0) := sorry

/-- A constant invariant coefficient gives a form at every level. -/
example (ι : Γ →* G) (J : Subgroup G) (m : M) :
    IsAlgebraicModularForm ι (1 : Representation A Γ M) J (fun _ => m) := sorry

/-- A nonzero constant must satisfy rational coefficient equivariance. -/
example (ι : Γ →* G) (σ : Representation A Γ M) (J : Subgroup G)
    (m : M) (γ : Γ) (hγ : σ γ m ≠ m) :
    ¬IsAlgebraicModularForm ι σ J (fun _ => m) := sorry

end AlgebraicForms

/-- Distinct central scalars force a value to vanish over a coefficient field. -/
example {A : Type*} [Field A] (a b m : A) (hab : a ≠ b)
    (h : a * m = b * m) : m = 0 := by
  have hzero : (a - b) * m = 0 := by rw [sub_mul, h, sub_self]
  exact (mul_eq_zero.mp hzero).resolve_left (sub_ne_zero.mpr hab)

/-- Over a coefficient ring, unequal central scalars can agree on a nonzero value.
This checks centralAMF_ring_scalar_mismatch; overlap compatibility is still required. -/
example : (4 : ZMod 8) ≠ 0 ∧ (1 : ZMod 8) ≠ -1 ∧
    (-1 : ZMod 8) * 4 = 1 * 4 := by decide

/-- The supplied Hecke degree gives three sheets at the prime two. -/
example : (HeckeRing.GLn.diagCoset ![1, 2]).degree = 3 := by
  simpa using HeckeRing.GL2.degree_diagCoset_prime_pow 2 (by decide) 0 1 (by decide)

/-- The bracket term in the relative differential has the negative sign. -/
example : (-(1 : ℂ)) ≠ 1 := by norm_num

/-- The inhomogeneous trivial-coefficient coboundary at (1,2) for f(x)=x². -/
example : (2 : ℝ)^2 - (1 + 2)^2 + 1^2 = -4 := by norm_num

/-- Normalized induction at diag(2,1/2) uses the positive half modulus. -/
example : Real.sqrt ((2 : ℝ)^2) = 2 ∧ (2 : ℝ)⁻¹ = 1/2 := by norm_num

/-- The real Weil relation j²=-1 acts with square -4 for m=1,t=1. -/
example : (-2 : ℂ) * 2 = -4 ∧ (2 : ℂ) * 2 = 4 := by norm_num

/-- The compact basis has vanishing lowering coefficient at its lowest weight. -/
example : ((2 : ℂ) - 2)/2 = 0 ∧ ((2 : ℂ) + 2)/2 = 2 := by norm_num

/-- Casimir normalization for weights two, twelve and one. -/
example : (2 : ℚ)*(2-2)/4 = 0 ∧ (12 : ℚ)*(12-2)/4 = 30 ∧
    (1 : ℚ)*(1-2)/4 = -1/4 := by norm_num

/-- Dual highest weights reverse the two GL₂ coordinates before negating. -/
example : (-(0 : ℤ), -(2 : ℤ)) = (0, -2) ∧
    (-(0 : ℤ), -(2 : ℤ)) ≠ (-2, 0) := by decide

/-- The two coherent coefficients differ at weight two and meet at weight one. -/
example : (-(2 : ℤ)) ≠ 2-2 ∧ (-(1 : ℤ)) = 1-2 := by decide

/-- The ordinary relative GL₁ exterior differential leaves dimensions 1,1. -/
example : Nat.choose 1 0 = 1 ∧ Nat.choose 1 1 = 1 ∧ Nat.choose 1 2 = 0 := by decide

/-- Positive split C₂ roots sum to twice rho, including its central coordinate. -/
example : (1 : ℚ)+0+1+2 = 2*2 ∧ (-1 : ℚ)+2+1+0 = 2*1 ∧
    (0 : ℚ)-1-1-1 = 2*(-3/2) := by norm_num

/-- Compact parity is imposed after the split-to-compact conversion. -/
example : (3+2+2*(0 : ℤ)) % 2 = (3+2 : ℤ) % 2 ∧
    (0 : ℤ) % 2 ≠ (3+2 : ℤ) % 2 := by decide

/-- Coherent GSp₄ coefficient and dual parameter at (4,2;-3). -/
example : (-(2 : ℤ), -(4 : ℤ), 4+2+2*(-3 : ℤ)) = (-2,-4,0) ∧
    (2-(2 : ℤ), 1-(4 : ℤ), -4-2-2*(-3 : ℤ)) = (0,-3,0) := by decide

/-- Each noncompact coherent wall is detected in (k,r) coordinates. -/
example : ((0+2-1 : ℤ), (2-2 : ℤ)) = (1,0) ∧
    ((1+0-1 : ℤ), (0-2 : ℤ)) = (0,-2) ∧
    ((1+1-1 : ℤ) + (1-2 : ℤ)) = 0 ∧
    ((0+3-1 : ℤ), (3-2 : ℤ)) = (2,1) := by decide

/-- The half-order Bessel solution distinguishes the sign of nu squared. -/
example : (11/4 : ℚ)-3/2-5/4 = 0 ∧ (11/4 : ℚ)-3/2-3/4 = 1/2 := by norm_num

/-- The two component exchanges must have a positive product. -/
example : (1 : ℂ)*1 = 1 ∧ (1 : ℂ)*(-1) ≠ 1 := by norm_num

/-- GSp₄ contragredience sends chamber index i to 3-i. -/
example : 3-(0 : ℕ) = 3 ∧ 3-(1 : ℕ) = 2 := by decide

/-- The unitary scalar boundary remains regular in rank one. -/
example : (1-1/2 : ℚ) = 1/2 ∧ (1/2-1 : ℚ) = -1/2 ∧
    (1-1/2 : ℚ) ≠ 1/2-1 := by norm_num

/-- Central balancing is addition of the two weights. -/
example : (1 : ℤ)+(-1) = 0 ∧ (1 : ℤ)+1 ≠ 0 := by decide

/-- The scalar positive-real adelization factors cancel. -/
example : (2 : ℚ)^2 * (2 : ℚ)^(-2 : ℤ) = 1 := by norm_num

/-- The raising operator has factor 2i in the specified split basis. -/
example (k f f' : ℂ) :
    ((k*f+2*Complex.I*f')+Complex.I*(2*f'-Complex.I*k*f))/2 =
      k*f+2*Complex.I*f' := by ring_nf; norm_num; ring

/-- A constant local holomorphic function has raising scalar k at y=1. -/
example : 2*Complex.I*((2 : ℂ)/(2*Complex.I)) = 2 := by
  field_simp

/-- Delta's raw Hecke eigenvalue at two is -3/4; the classical factor is 32. -/
example : (2 : ℚ)^(12/2-1 : ℕ) = 32 ∧
    (32 : ℚ)*(-3/4) = -24 := by norm_num

/-- Diamond inversion is detected by a fourth root, not by a sign character. -/
example : (Complex.I)⁻¹ = -Complex.I ∧ (-Complex.I)⁻¹ = Complex.I := by
  norm_num

/-- Rational-to-level coefficient transport needs both inverses. -/
example : (3 : ℚ)⁻¹*2⁻¹*(2*6) = 2 ∧
    (3 : ℚ)⁻¹*2*(2*6) ≠ 2 := by norm_num

/-- Level covariance uses the inverse scalar; trace at index one is the identity. -/
example : (2 : ℚ)⁻¹*6 = 3 ∧ (1 : ℚ)*6 = 6 := by norm_num

/-- A residual sign invariant can appear at p=2. -/
example : (-1 : ZMod 2)*(1 : ZMod 2) = 1 ∧
    (-1 : ℤ)*(1 : ℤ) ≠ 1 := by decide

/-- A volume-two compact idempotent distinguishes normalization from a raw indicator. -/
example : (1/2 : ℚ)^2*2 = 1/2 ∧ (1 : ℚ)^2*2 = 2 := by norm_num

/-- Noncommuting point masses test the order of the convolution action. -/
example :
    let s : Equiv.Perm (Fin 3) := Equiv.swap 0 1
    let t : Equiv.Perm (Fin 3) := Equiv.swap 1 2
    (s*t) 0 = 1 ∧ (t*s) 0 = 2 := by decide

/-- Reversal of an enveloping product is visible on the standard sl₂ matrices. -/
example :
    let X : Matrix (Fin 2) (Fin 2) ℚ := !![0,1;0,0]
    let Y : Matrix (Fin 2) (Fin 2) ℚ := !![0,0;1,0]
    (X*Y) 0 0 = 1 ∧ (Y*X) 0 0 = 0 := by norm_num [Matrix.mul_apply, Fin.sum_univ_two]

/-- Odd exterior degrees change the swap sign; a degree-zero factor does not. -/
example : (-1 : ℤ)^(1*1 : ℕ) = -1 ∧ (-1 : ℤ)^(0*1 : ℕ) = 1 := by norm_num

/-- The zero-coboundary distinguishes the sign representation from the trivial one. -/
example : (-1 : ℂ)-1 = -2 ∧ (1 : ℂ)-1 = 0 := by norm_num

/-- Probability-Haar Schur orthogonality needs dimension, not reciprocal dimension. -/
example : (2 : ℚ)*(1/2) = 1 ∧ (1/2 : ℚ)*(1/2) = 1/4 := by norm_num

/-- A scalar Lie action is negated on the dual. -/
example : (-(2 : ℂ)) ≠ 2 ∧ (-(2 : ℂ))+2 = 0 := by norm_num

/-- A common half determinant shift makes both GL₂ C-algebraic coordinates integral. -/
example : (1/2+1/2 : ℚ) = 1 ∧ (-1/2+1/2 : ℚ) = 0 ∧
    (-1/2 : ℚ) ≠ 0 := by norm_num

/-- Hodge conjugation exchanges the two shifts while keeping total degree. -/
example : (1+0 : ℕ) = 0+1 ∧ (1-0 : ℤ) = 1 ∧ (0-1 : ℤ) = -1 := by norm_num

/-- The rank-one holomorphic tangent weight requires an inverse coefficient. -/
example : (2 : ℤ)+(-2) = 0 ∧ (2 : ℤ)+2 = 4 := by decide

/-- The Sp₄ minimal-type formula subtracts compact rho. -/
example : ((2 : ℚ)+3/2-1/2, (1 : ℚ)+3/2-(-1/2)) = (3,3) ∧
    ((2 : ℚ)+3/2+1/2, (1 : ℚ)+3/2+(-1/2)) = (4,2) := by norm_num

/-- Clozel and raw weights differ by 1-n, with the norm twist in the indicated direction. -/
example : (-10 : ℚ)+1-2 = -11 ∧ (1-2-(-11 : ℚ))/2 = 5 ∧
    (-10 : ℚ)+2*5 = 0 ∧ (-10 : ℚ)+2*(-5) = -20 ∧
    (0 : ℚ)+1-2 = -1 := by norm_num

/-
README definitions requiring analytic or representation-theoretic carriers:
AdelicSmoothFunction, AdelicTestFunction, AdelicSchwartzFunction, T_sm,
fixedLevelExponent, relativeCochainMap, relativeKoszulResolution,
smoothGroupCochains, homogeneousPoincareResolution, kFiniteSubmodule,
isotypic, IsAdmissible, IsHarishChandraModule, HasInfinitesimalCharacter,
generalizedCharacter, normalizedInduction, compactPicture, IsTempered,
IsSquareIntegrable, essentialTemperedness, discreteSeries, limitParameter,
langlandsQuotient, WeilGroupComplex, WeilGroupReal, induceCharacter,
IsBoundedParameter, recGL, D_k, HasWhittakerModel, SFRepresentation,
SAFRepresentation, GContinuousNorm, casselmanWallachGlobalization,
SmoothAutomorphicForm, classicalEquiv, IsAutomorphicRepresentation,
subquotientOccurrence, eisensteinFiniteJetRealization, archimedeanHeckeAlgebra,
finiteTypeCorner, RestrictedTensor, localFactor, DiscreteOccurrence,
smoothCuspidalForm, whittakerCoefficient, HolomorphicSL2Form, MaassCuspForm,
fourierCoefficient, maassHecke, modifiedBesselK, IsCAlgebraic, IsLAlgebraic,
HasCohomologyWith, ell0, q0, thetaStableParabolic, admissibleCharacter,
cohomologicalInduction, StableAdelicLattice, galoisTwist, rationalityField,
IsFieldOfDefinition, HermitianGroupDatum, hodgeStabilizer, positiveSplitCentre,
pPlus, pMinus, parabolicLie, coherentCochains, coherentCohomology,
CuspidalCoherentCohomology, DiscreteCoherentCohomology, splitCharacter,
compactCharacter, rho, coherentCoefficient, harishChandraParameter,
dualParameter, chamber, compactRegular, nondegenerateLimit,
positiveSimilitude, componentConjugate, inducedFullGroup, extendPlus,
extendMinus, coherentDegree, kostantRepresentatives, coherentChambers,
coherentRepresentation, scalarHolomorphicSeries, scalarParameter,
adelize, deadelize, LevelAlgebraicModularForm, stabilizer, IsSufficientlySmall,
CentralCharacterAlgebraicModularForm, effectiveStabilizer, resScalarsEquiv,
coefficientSlice, finiteTypeSliceDecomposition, automorphicProduct_factors.
The README specifies the carriers, APIs, Checks, source locators and supplier
contracts. Existing cochains, algebraic representations, coefficient modules,
Hecke characters and finite-place Hecke algebras are reused.
-/

end

end TauCetiRoadmap.AutomorphicFormsOnReductiveGroups
