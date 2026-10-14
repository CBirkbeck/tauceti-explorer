import Mathlib
import TauCeti.RepresentationTheory.GaloisDescent.Span
import TauCeti.RepresentationTheory.GaloisDescent.Injective
import TauCeti.Algebra.AlgebraicGroup.Representation.Tannaka.GroupFunctor

/-!
# P-adic differential equations: RD.2 continued — representative target signatures

The roadmap is `research/blueprint/readmes/PadicDifferentialEquationsAndRigidCohomology--RD.2.md`,
which continues layer RD.2 of `research/blueprint/readmes/PadicDifferentialEquationsAndRigidCohomology.md`.
This file is not the roadmap and is not exhaustive: the roadmap document is definitive, and the
statements below only suggest Lean forms so that contributors and reviewers converge on names and
signatures. It records the targets of this part that can be stated with the pinned APIs
(Mathlib 082e2d3, Tau Ceti f790474) over existing carriers: the characteristic-free completion
lemma, the matrix condition behind c-constancy, the numerical heart of Tsuzuki's key lemma, the
Frobenius twist of a nilpotent residue, the Herbrand function of an Artin–Schreier extension and
the formal solutions of a unipotent connection. Robba and Amice rings, differential modules,
Frobenius structures, Galois representations into them and their Tannakian categories are not at
the pins; they remain roadmap targets, listed at the end, and no placeholder carrier represents
them. Every `sorry` is an honest proof obligation.
-/

namespace TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD2

noncomputable section

/-! ## RD.0/completed-algebraic-closure-is-algebraically-closed -/

/-- The completion of an algebraically closed nonarchimedean field is algebraically closed, in
every characteristic: Mathlib's `IsAlgClosed.of_denseRange` without its `CharZero` hypothesis.
The proof replaces Krasner's lemma by continuity of roots
(`Polynomial.exists_aroots_norm_sub_lt_of_norm_coeff_sub_lt`) and a Cauchy subsequence. -/
theorem isAlgClosed_of_denseRange {K L : Type*} [Field K] [NontriviallyNormedField L]
    [CompleteSpace L] [IsUltrametricDist L] [Algebra K L]
    (hi : DenseRange (algebraMap K L)) [IsAlgClosed K] : IsAlgClosed L := by
  sorry

/-- In characteristic zero the statement is Mathlib's. -/
example {K L : Type*} [Field K] [NontriviallyNormedField L] [CompleteSpace L] [CharZero L]
    [IsUltrametricDist L] [Algebra K L] (hi : DenseRange (algebraMap K L)) [IsAlgClosed K] :
    IsAlgClosed L :=
  IsAlgClosed.of_denseRange hi

/-- Test: `ℂ_[p]`, the completion of an algebraic closure of `ℚ_[p]`. -/
example (p : ℕ) [Fact p.Prime] : IsAlgClosed ℂ_[p] :=
  isAlgClosed_of_denseRange (K := PadicAlgCl p) UniformSpace.Completion.denseRange_coe

/-! ## RD.2/c-constant-unit-root-module: the matrix condition

A unit-root module is c-constant when some basis has Frobenius matrix `A` with `‖A − 1‖ ≤ c`
entrywise for the 1-Gauss norm. The module carrier is a roadmap target; the matrix condition is
stated over any normed ring. -/

section CConstant

variable {R : Type*} [NormedRing R]

/-- The Frobenius-matrix condition of c-constancy: every entry of `A − 1` has norm at most `c`. -/
def IsWithinOfOne {n : Type*} [DecidableEq n] (c : ℝ) (A : Matrix n n R) : Prop :=
  ∀ i j, ‖(A - 1) i j‖ ≤ c

/-- The identity matrix satisfies the condition for every `c ≥ 0` (the trivial module). -/
example {n : Type*} [DecidableEq n] (c : ℝ) (hc : 0 ≤ c) :
    IsWithinOfOne c (1 : Matrix n n R) := by
  intro i j
  simpa using hc

/-- Monotonicity in `c`. -/
theorem IsWithinOfOne.mono {n : Type*} [DecidableEq n] {c c' : ℝ} {A : Matrix n n R}
    (hA : IsWithinOfOne c A) (h : c ≤ c') : IsWithinOfOne c' A :=
  fun i j => (hA i j).trans h

/-- Tensor products of c-constant modules are c-constant: over an ultrametric normed ring, the
Kronecker product of two integral matrices within `c` of the identity is within `c` of the
identity (`A ⊗ B − 1 = (A − 1) ⊗ B + 1 ⊗ (B − 1)`). -/
theorem IsWithinOfOne.kronecker [IsUltrametricDist R] [NormOneClass R]
    {m n : Type*} [DecidableEq m] [DecidableEq n] {c : ℝ}
    {A : Matrix m m R} {B : Matrix n n R} (hA : IsWithinOfOne c A) (hB : IsWithinOfOne c B)
    (hB1 : ∀ i j, ‖B i j‖ ≤ 1) :
    IsWithinOfOne c (Matrix.kronecker A B) := by
  sorry

end CConstant

/-! ## RD.2/small-constant-unit-root-module-is-trivial: where `p^(−1/(p−1))` enters

In the key lemma, interpolating `|N|₁ ≤ c` and `|N|_{α^p} ≤ p` by log-convexity improves the
radius `α` to `β` with `log β = (p log c / (log c − log p)) · log α`. The improvement is strict
exactly when `c < p^(−1/(p−1))`. -/

/-- The exponent of Tsuzuki's key lemma exceeds one below the threshold. -/
theorem tsuzuki_exponent_gt_one (p c : ℝ) (hp : 1 < p) (hc0 : 0 < c)
    (hc : c < p ^ (-(1 / (p - 1)))) :
    1 < p * Real.log c / (Real.log c - Real.log p) := by
  sorry

/-- At the threshold `c = p^(−1/(p−1))` the exponent is exactly one, matching the sharpness of
the bound (Dwork's module is `p^(−1/(p−1))`-constant but not trivial). -/
theorem tsuzuki_exponent_eq_one (p : ℝ) (hp : 1 < p) :
    p * Real.log (p ^ (-(1 / (p - 1)))) /
      (Real.log (p ^ (-(1 / (p - 1)))) - Real.log p) = 1 := by
  sorry

/-! ## RD.2/quasi-unipotent-modules-admit-frobenius-structures: the residue under Frobenius

Pulling a unipotent module with residue `N` back along `t ↦ t^q` multiplies the residue by `q`.
A Frobenius structure exists because `q • N` is conjugate to `N`. -/

/-- A nilpotent matrix is conjugate to each of its nonzero multiples. -/
theorem exists_conj_eq_smul_of_isNilpotent {K : Type*} [Field K] {n : Type*} [Fintype n]
    [DecidableEq n] (N : Matrix n n K) (hN : IsNilpotent N) (q : K) (hq : q ≠ 0) :
    ∃ P : GL n K, (P : Matrix n n K) * N * ((P⁻¹ : GL n K) : Matrix n n K) = q • N := by
  sorry

/-- Test: the Jordan block of size two, conjugated by `diag(1, q⁻¹)`. -/
example {K : Type*} [Field K] (q : K) (hq : q ≠ 0) :
    ∃ P : GL (Fin 2) K, (P : Matrix (Fin 2) (Fin 2) K) * !![0, 1; 0, 0] *
      ((P⁻¹ : GL (Fin 2) K) : Matrix (Fin 2) (Fin 2) K) = q • !![0, 1; 0, 0] := by
  sorry

/-- The Kummer module `∇v = (1/m) v dt/t` has a Frobenius structure of order `h` as soon as
`m ∣ p^h − 1`; such an `h ≥ 1` exists when `p` and `m` are coprime. -/
theorem exists_dvd_pow_sub_one (p m : ℕ) (hm : 0 < m) (hpm : Nat.Coprime p m) :
    ∃ h, 0 < h ∧ m ∣ p ^ h - 1 := by
  sorry

/-! ## RD.2/highest-break-under-finite-etale-pullback: the Artin–Schreier Herbrand function -/

/-- The Herbrand function of an Artin–Schreier extension with break `d`
(Kedlaya, overview, Example 2.1.10): `m` up to `d`, then `d + (m − d)/p`. -/
def artinSchreierHerbrand (p d m : ℝ) : ℝ :=
  if m ≤ d then m else d + (m - d) / p

/-- Below the break the function is the identity. -/
example (p d m : ℝ) (h : m ≤ d) : artinSchreierHerbrand p d m = m := by
  simp [artinSchreierHerbrand, h]

/-- Its inverse sends `β ≥ d` to `pβ − (p − 1)d`: a break `β` of a module becomes the break
`pβ − (p − 1)d` after pulling back along an Artin–Schreier cover of break `d`. -/
theorem artinSchreierHerbrand_apply_inv (p d β : ℝ) (hp : 1 < p) (hβ : d ≤ β) :
    artinSchreierHerbrand p d (p * β - (p - 1) * d) = β := by
  sorry

/-! ## RD.2/unipotent-solutions-and-residues: formal solutions of a unipotent connection

On `V ⊗ K⟦x⟧` with `x d/dx` acting by the nilpotent `N`, a horizontal homomorphism to
`(K⟦x⟧, x d/dx)` is constant and kills the image of `N`: the solution space is `(coker N)^∨`.
The analytic version on the open unit disc is the roadmap target. -/

open PowerSeries in
/-- Horizontal homomorphisms into formal power series are constant and vanish on `range N`. -/
theorem horizontal_formal_solutions {K V : Type*} [Field K] [CharZero K] [AddCommGroup V]
    [Module K V] (N : V →ₗ[K] V) (hN : IsNilpotent N) (φ : V →ₗ[K] PowerSeries K)
    (h : ∀ v, φ (N v) = X * d⁄dX K (φ v)) :
    (∀ v, φ v = C (constantCoeff (φ v))) ∧ ∀ v, φ (N v) = 0 := by
  sorry

/-! ## Tau Ceti inputs used by the roadmap targets of this part -/

/- Semilinear Galois descent (Hilbert–Noether), used for `D(V)`, `D†(V)` and quasi-constant
modules. -/
#check @TauCeti.GaloisDescent.span_invariants_eq_top
#check @TauCeti.GaloisDescent.liftBaseChange_injective_of_invariant

/- Comodule reconstruction, used for the Tannakian group `I × G_a` of `MCF(R_K̄/K̄)`. -/
#check @TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor

/-!
## Roadmap targets requiring additional carriers

The following targets of this part are stated in the roadmap with their hypotheses, APIs and
checks. Their carriers (Amice and Robba rings with Frobenius lifts, differential modules,
Galois actions on unramified extensions, Tannakian categories of differential modules) are not
at the pins, so they are not declared here.

* `RD.2/unramified-extensions-of-amice-rings` — `AmiceRing.unramifiedExt`,
  `AmiceRing.boundedUnramifiedExt`, `AmiceRing.completedMaxUnramified`, `AmiceRing.galoisAction`,
  `AmiceRing.fixedPoints`, `AmiceRing.ker_derivation`, `AmiceRing.frobenius_invariants`.
* `RD.2/c-constant-unit-root-module` — `IsCConstant` (its matrix condition is
  `IsWithinOfOne` above), `IsCConstant.tensor`, `IsCConstant.changeFrobenius`,
  `IsCConstant.iff_galois`.
* `RD.2/lang-trivialisation-of-unit-root-modules` — fixed bases over `Ẽ` and c-constancy over a
  finite separable extension.
* `RD.2/galois-representation-to-differential-module` — `unitRootModule` (`D(V)`),
  `overconvergentUnitRootModule` (`D†(V)`), `HasFiniteLocalMonodromy`.
* `RD.2/fontaine-katz-unit-root-equivalence` — the equivalence `V₀ ↦ D(V)`.
* `RD.2/unit-root-matrix-normal-form`, `RD.2/dwork-transfer-to-the-centre-of-a-disc`,
  `RD.2/small-constant-unit-root-module-is-trivial` (numerical core above),
  `RD.2/tsuzuki-equivalence-finite-local-monodromy`.
* `RD.2/quasi-constant-modules-are-semilinear-representations`, `RD.2/matsuda-decomposition`.
* `RD.2/highest-break-under-finite-etale-pullback` (Herbrand function above),
  `RD.2/matsuda-highest-break-theorem`, `RD.2/irregularity-equals-swan-conductor`.
* `RD.2/quasi-unipotent-modules-admit-frobenius-structures` (residue twist above),
  `RD.2/differential-modules-with-algebraic-constants` — `RobbaAlgConst`, `DiffModCat`, `MCS`,
  `MCF`, `MCF.eq_quasiUnipotent`, `unipotentEquiv`, `logFiberFunctor`.
* `RD.2/unipotent-solutions-and-residues` (formal core above), `RD.2/andre-local-monodromy-group`.
* `RD.2/local-monodromy-over-finite-etale-robba-extensions`.
-/

end

end TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD2
