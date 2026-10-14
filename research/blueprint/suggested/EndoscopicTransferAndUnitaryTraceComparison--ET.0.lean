import Mathlib.Algebra.Group.Conj
import Mathlib.Algebra.Group.Action.Defs
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Basic.Complex.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Coeff
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.FieldTheory.Separable
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.Finiteness.Defs

/-!
# Endoscopic transfer and unitary trace comparison, layers ET.0–ET.3: suggested signatures

This file is not the roadmap and is not exhaustive. The roadmap document
(`EndoscopicTransferAndUnitaryTraceComparison--ET.0.md`) is definitive; the statements below
suggest Lean forms so that contributors and reviewers converge on names and signatures.

Only light definitions with real bodies over carriers that exist at the pinned Mathlib are
given, together with milestones statable over them. Reductive groups over local and global
fields, their Galois cohomology, endoscopic data, transfer factors, orbital integrals, the
Hitchin fibration and the fundamental lemma have no carriers at the pins; they are targets of
the roadmap document, not declarations here.

Conventions. A cocycle `a : Γ → H` for a group `Γ` acting on a group `H` satisfies
`a (σ * τ) = a σ * σ • a τ`; `b` is cohomologous to `a` when `b σ = c⁻¹ * a σ * σ • c`.
Profinite topologies are suppressed: the definitions are those of a finite Galois quotient
acting on the points over the corresponding finite extension. For `GL_n`, the Chevalley
characteristic map is the characteristic polynomial and the Kostant section is the companion
matrix with the convention `X^n + a_{n-1} X^{n-1} + … + a_0`.
-/

noncomputable section
open scoped BigOperators

namespace TauCetiRoadmap.EndoscopicTransfer

universe u v

/-! ## ET.0: nonabelian Galois cohomology with discrete coefficients -/

section NonabelianH1
variable (Γ : Type u) (H : Type v) [Group Γ] [Group H] [MulDistribMulAction Γ H]

/-- Crossed homomorphisms (1-cocycles) `Γ → H`. -/
def IsCocycle (a : Γ → H) : Prop := ∀ σ τ : Γ, a (σ * τ) = a σ * σ • a τ

/-- The set of 1-cocycles. -/
def Cocycle := {a : Γ → H // IsCocycle Γ H a}

variable {Γ H}

/-- Two cocycles are cohomologous if they differ by twisted conjugation by an element of `H`. -/
def Cohomologous (a b : Cocycle Γ H) : Prop :=
  ∃ c : H, ∀ σ : Γ, b.1 σ = c⁻¹ * a.1 σ * σ • c

variable (Γ H)

/-- Cohomology of cocycles is an equivalence relation. -/
def cohomologousSetoid : Setoid (Cocycle Γ H) where
  r := Cohomologous
  iseqv := by sorry

/-- The pointed set `H¹(Γ, H)`. -/
def NonabelianH1 := Quotient (cohomologousSetoid Γ H)

/-- The trivial cocycle. -/
def Cocycle.one : Cocycle Γ H := ⟨fun _ => 1, by sorry⟩

/-- The base point of `H¹(Γ, H)`. -/
def NonabelianH1.basePoint : NonabelianH1 Γ H := Quotient.mk _ (Cocycle.one Γ H)

/-- For an abelian group with trivial action, cocycles are homomorphisms and `H¹` is `Hom(Γ, H)`:
the comparison used for tori split by the Galois group. -/
theorem NonabelianH1.equivHomOfTrivial {A : Type v} [CommGroup A] [MulDistribMulAction Γ A]
    (htriv : ∀ (σ : Γ) (x : A), σ • x = x) :
    Nonempty (NonabelianH1 Γ A ≃ (Γ →* A)) := by sorry

/-- A trivial coefficient group has a single cohomology class. -/
example [Subsingleton H] : Subsingleton (NonabelianH1 Γ H) := by sorry

/-- Over the trivial group every cocycle is trivial. -/
example [MulDistribMulAction Unit H] : Subsingleton (NonabelianH1 Unit H) := by sorry

end NonabelianH1

/-! ## ET.0: crossed modules -/

/-- A crossed module `∂ : H̃ → H` of groups (the coefficient object of abelianized cohomology,
`[G_sc → G]`). -/
structure CrossedModule (Ht : Type u) (H : Type v) [Group Ht] [Group H]
    [MulDistribMulAction H Ht] where
  /-- The boundary map. -/
  toHom : Ht →* H
  /-- Equivariance of the boundary. -/
  map_smul : ∀ (h : H) (x : Ht), toHom (h • x) = h * toHom x * h⁻¹
  /-- The Peiffer identity. -/
  peiffer : ∀ x y : Ht, toHom x • y = x * y * x⁻¹

/-- The kernel of a crossed module is central in the source. -/
theorem CrossedModule.ker_central {Ht : Type u} {H : Type v} [Group Ht] [Group H]
    [MulDistribMulAction H Ht] (X : CrossedModule Ht H) {x : Ht} (hx : X.toHom x = 1)
    (y : Ht) : x * y = y * x := by sorry

/-! ## ET.0: stable conjugacy for `GL_n` -/

section GLn
variable {n : Type*} [Fintype n] [DecidableEq n] {K : Type*} [Field K]

/-- For `GL_n` over a field, two elements with the same separable characteristic polynomial are
conjugate: stable and rational conjugacy agree for regular semisimple elements of `GL_n`. -/
theorem isConj_iff_charpoly_eq_of_separable (γ γ' : Matrix.GeneralLinearGroup n K)
    (hsep : (γ : Matrix n n K).charpoly.Separable) :
    IsConj γ γ' ↔ (γ : Matrix n n K).charpoly = (γ' : Matrix n n K).charpoly := by sorry

/-- Conjugate matrices have equal characteristic polynomials (the easy direction). -/
example (γ γ' : Matrix.GeneralLinearGroup n K) (h : IsConj γ γ') :
    (γ : Matrix n n K).charpoly = (γ' : Matrix n n K).charpoly := by sorry

/-- The equality of characteristic polynomials alone does not give conjugacy without
semisimplicity: the identity and a unipotent Jordan block in `GL_2(ℚ)`. -/
example : ¬ IsConj (1 : Matrix.GeneralLinearGroup (Fin 2) ℚ)
    (Matrix.GeneralLinearGroup.mkOfDetNeZero !![1, 1; 0, 1] (by sorry)) := by sorry

end GLn

/-! ## ET.0: the Kottwitz sign -/

/-- The Kottwitz sign `e(G) = (-1)^(q(G*) - q(G))`, from the `F`-ranks of the derived groups of the
quasi-split inner form and of the inner form. -/
def kottwitzSign (rankQuasiSplit rankInner : ℕ) : ℤˣ :=
  (-1 : ℤˣ) ^ ((rankQuasiSplit : ℤ) - rankInner)

@[simp] theorem kottwitzSign_self (r : ℕ) : kottwitzSign r r = 1 := by sorry

/-- `GL_m(D)` with `D` central of degree `d` and `n = m d`: the derived groups have `F`-ranks
`n - 1` and `m - 1`. -/
theorem kottwitzSign_gl (n m : ℕ) (hm : 1 ≤ m) (hmn : m ≤ n) :
    kottwitzSign (n - 1) (m - 1) = (-1 : ℤˣ) ^ ((n : ℤ) - m) := by sorry

/-- The quaternion division algebra: `e(D^×) = -1`. -/
example : kottwitzSign 1 0 = -1 := by sorry

/-! ## ET.1: κ-weighted sums over the rational classes in a stable class -/

section KappaSum
variable {D : Type*} [CommGroup D] [Fintype D]

/-- The κ-weighted sum `Σ_d κ(d) O(d)` over a finite abelian group of invariants (the rational
classes in a stable class, indexed by `inv(γ, ·)`). -/
def kappaSum (κ : D →* ℂˣ) (O : D → ℂ) : ℂ := ∑ d, (κ d : ℂ) * O d

/-- The stable sum is the κ-sum for the trivial character. -/
def stableSum (O : D → ℂ) : ℂ := kappaSum (1 : D →* ℂˣ) O

/-- Changing the base point of the stable class by `d₀` multiplies the κ-sum by `κ(d₀)⁻¹`. -/
theorem kappaSum_rebase (κ : D →* ℂˣ) (O : D → ℂ) (d₀ : D) :
    kappaSum κ (fun d => O (d₀ * d)) = ((κ d₀)⁻¹ : ℂˣ) * kappaSum κ O := by sorry

/-- The stable sum does not depend on the base point. -/
theorem stableSum_rebase (O : D → ℂ) (d₀ : D) :
    stableSum (fun d => O (d₀ * d)) = stableSum O := by sorry

/-- `SL_2` and an elliptic torus: two rational classes, and the nontrivial κ gives the difference
of the two orbital integrals. -/
example (κ : Multiplicative (ZMod 2) →* ℂˣ) (hκ : κ (Multiplicative.ofAdd 1) = -1)
    (O : Multiplicative (ZMod 2) → ℂ) :
    kappaSum κ O = O 1 - O (Multiplicative.ofAdd 1) := by sorry

/-- A single rational class (as for `GL_n`): κ-sum and stable sum both evaluate `O`. -/
example (O : Unit → ℂ) : stableSum O = O () := by sorry

end KappaSum

/-! ## ET.2b: the Chevalley map and the Kostant section for `GL_n` -/

section ChevalleyGL
variable {K : Type*} [Field K] {n : ℕ}

/-- The Chevalley characteristic map for `𝔤𝔩_n`: the non-leading coefficients of the
characteristic polynomial, a point of `𝔠 = 𝔸^n`. -/
def chevalleyMap (X : Matrix (Fin n) (Fin n) K) : Fin n → K := fun i => X.charpoly.coeff i

/-- The Kostant section for `𝔤𝔩_n`: the companion matrix of `X^n + Σ_i a_i X^i`, with ones on the
subdiagonal and `-a` in the last column. -/
def kostantSectionGL (a : Fin n → K) : Matrix (Fin n) (Fin n) K := fun i j =>
  (if (i : ℕ) = (j : ℕ) + 1 then 1 else 0) - (if (j : ℕ) + 1 = n then a i else 0)

/-- The characteristic polynomial of the companion matrix is `X^n + Σ_i a_i X^i`. -/
theorem charpoly_kostantSectionGL (a : Fin n → K) :
    (kostantSectionGL a).charpoly =
      Polynomial.X ^ n + ∑ i : Fin n, Polynomial.C (a i) * Polynomial.X ^ (i : ℕ) := by sorry

/-- The Kostant section is a section of the Chevalley map. -/
theorem chevalleyMap_kostantSectionGL (a : Fin n → K) : chevalleyMap (kostantSectionGL a) = a := by sorry

/-- `n = 1`: the companion matrix of `X + a₀` is `(-a₀)`. -/
example (a : Fin 1 → K) : kostantSectionGL a = fun _ _ => -a 0 := by sorry

/-- The Chevalley map is invariant under conjugation. -/
theorem chevalleyMap_conj (X : Matrix (Fin n) (Fin n) K)
    (g : Matrix.GeneralLinearGroup (Fin n) K) :
    chevalleyMap ((g : Matrix (Fin n) (Fin n) K) * X *
        ((g⁻¹ : Matrix.GeneralLinearGroup (Fin n) K) : Matrix (Fin n) (Fin n) K)) =
      chevalleyMap X := by sorry

/-- The zero matrix is not regular for `n = 2`, while `kostantSectionGL 0` is: the section passes through
regular nilpotent elements. -/
example : kostantSectionGL (0 : Fin 2 → K) ≠ 0 := by sorry

end ChevalleyGL

/-! ## ET.2b: the regular centralizer of `GL_n` -/

section RegularCentralizer
variable {K : Type*} [Field K]

/-- The fibre of the regular centralizer of `GL_n` at the characteristic polynomial `P`: the units
of `K[X]/(P)`. -/
abbrev RegularCentralizerGL (P : Polynomial K) := (AdjoinRoot P)ˣ

/-- For `P = X - c` the regular centralizer is `GL_1`. -/
theorem regularCentralizerGL_linear (c : K) :
    Nonempty (RegularCentralizerGL (Polynomial.X - Polynomial.C c) ≃* Kˣ) := by sorry

end RegularCentralizer

/-! ## ET.2b: affine Springer fibres for `GL_n` (lattices) -/

section AffineSpringer
variable (k : Type*) [Field k] (n : ℕ)

/-- A lattice in `k((ε))^n`: a finitely generated `k[[ε]]`-submodule spanning over `k((ε))`. -/
def IsLattice (L : Submodule (PowerSeries k) (Fin n → LaurentSeries k)) : Prop :=
  L.FG ∧ Submodule.span (LaurentSeries k) (L : Set (Fin n → LaurentSeries k)) = ⊤

variable {k n}

/-- The affine Springer fibre of `γ ∈ 𝔤𝔩_n(k((ε)))` in the affine Grassmannian of `GL_n`: the
lattices stable under `γ`. -/
def affineSpringerFibre (γ : Matrix (Fin n) (Fin n) (LaurentSeries k)) :
    Set (Submodule (PowerSeries k) (Fin n → LaurentSeries k)) :=
  {L | IsLattice k n L ∧ ∀ v ∈ L, γ.mulVec v ∈ L}

/-- For `γ = 0` every lattice is in the fibre: the fibre is the whole affine Grassmannian, which is
not of finite type (`γ = 0` is not regular semisimple). -/
theorem affineSpringerFibre_zero :
    affineSpringerFibre (0 : Matrix (Fin n) (Fin n) (LaurentSeries k)) =
      {L | IsLattice k n L} := by sorry

/-- The fibre of a scalar `c • 1` with `c` integral is again the whole affine Grassmannian. -/
example (c : PowerSeries k) :
    affineSpringerFibre ((algebraMap (PowerSeries k) (LaurentSeries k) c) •
      (1 : Matrix (Fin n) (Fin n) (LaurentSeries k))) = {L | IsLattice k n L} := by sorry

end AffineSpringer

end TauCetiRoadmap.EndoscopicTransfer
