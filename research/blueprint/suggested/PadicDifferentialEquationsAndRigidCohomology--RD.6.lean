import Mathlib.NumberTheory.LegendreSymbol.AddCharacter
import Mathlib.RingTheory.Trace.Defs
import Mathlib.RingTheory.Norm.Defs
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.RingTheory.PowerSeries.Exp
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.CategoryTheory.Abelian.Basic
import Mathlib.CategoryTheory.Linear.LinearFunctor
import Mathlib.CategoryTheory.Monoidal.Braided.Basic
import Mathlib.CategoryTheory.Monoidal.Linear
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.Algebra.Category.FGModuleCat.Basic
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Rigid
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Symmetric

/-!
# P-adic differential equations and rigid cohomology, layer RD.6 (follow-up part)

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/PadicDifferentialEquationsAndRigidCohomology--RD.6.md` is definitive;
the statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Everything is proved by `sorry`; nothing here claims an implementation.

Only statements whose carriers exist at the pins (Mathlib 082e2d3, Tau Ceti f790474) appear:
additive characters, norms and traces of finite fields, Kloosterman sums, power series,
linear algebra of Frobenius eigenvalues, and the neutral Tannakian recognition theorem, stated
against Mathlib's rigid symmetric monoidal categories and Tau Ceti's finite comodules
(`TauCeti.FGComoduleCat`). Overconvergent F-isocrystals, rigid cohomology, Robba rings, the Weyl
algebra, the Tannakian categories of coefficients and the Christol–Mebkhout index theorems have no
carrier at the pins; they are targets of the roadmap document, not declarations here.

Conventions (RD.6/dwork-kummer-sign-dictionary): a Frobenius structure goes from the Frobenius
pullback to the module; the linear Frobenius at a closed point plays the role of geometric
Frobenius; the Dwork isocrystal has connection `π dx` and Frobenius multiplier `exp(π(x^q - x))`,
so its trace function is `ψ_π⁻¹ ∘ Tr`; the Kummer isocrystal `K_a` has connection `a dt/t` and
multiplier `t^((q-1)a)`, with trace function `χ_a ∘ Norm`.
-/

namespace TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD6

noncomputable section

/-! ## Dwork's additive character (RD.6/dwork-additive-character) -/

section DworkCharacter

variable (p : ℕ) [NeZero p] {K : Type*} [Field K]

/-- Dwork's additive character `ψ_π : 𝔽_p → K`, `a ↦ ζ^a`, attached to the `p`-th root of unity
`ζ = θ(1)` given by Dwork's splitting function. The analytic origin of `ζ` is a roadmap target;
the character itself only needs `ζ ^ p = 1`. -/
def dworkCharacter {ζ : K} (hζ : ζ ^ p = 1) : AddChar (ZMod p) K :=
  AddChar.zmodChar p hζ

/-- `ψ_{π,q'} = ψ_π ∘ Tr_{𝔽_{q'}/𝔽_p}` on the finite field with `p ^ n` elements. -/
def dworkCharacterOfField [Fact p.Prime] (n : ℕ) {ζ : K} (hζ : ζ ^ p = 1) :
    AddChar (GaloisField p n) K :=
  (dworkCharacter p hζ).compAddMonoidHom
    (Algebra.trace (ZMod p) (GaloisField p n)).toAddMonoidHom

variable {p}

/-- API `dworkCharacter_eq_zmodChar`: the character is Mathlib's `AddChar.zmodChar`. -/
theorem dworkCharacter_eq_zmodChar {ζ : K} (hζ : ζ ^ p = 1) :
    dworkCharacter p hζ = AddChar.zmodChar p hζ := rfl

/-- API: evaluation on residues. -/
theorem dworkCharacter_apply {ζ : K} (hζ : ζ ^ p = 1) (a : ZMod p) :
    dworkCharacter p hζ a = ζ ^ a.val := sorry

/-- API `dworkCharacter_ne_one`: a primitive root gives a nontrivial character. -/
theorem dworkCharacter_ne_one {ζ : K} (hζ : ζ ^ p = 1) (hprim : IsPrimitiveRoot ζ p)
    (hp : 1 < p) : dworkCharacter p hζ ≠ 1 := sorry

/-- API: the character sum over `𝔽_p` vanishes for a primitive root. -/
theorem dworkCharacter_sum {ζ : K} (hζ : ζ ^ p = 1) (hprim : IsPrimitiveRoot ζ p)
    (hp : 1 < p) : ∑ a : ZMod p, dworkCharacter p hζ a = 0 := sorry

/-- API `dworkCharacter_neg`: replacing `ζ` by `ζ⁻¹` (that is, `π` by `-π` for odd `p`)
inverts the character. -/
theorem dworkCharacter_neg {ζ : K} (hζ : ζ ^ p = 1) (hζ' : ζ⁻¹ ^ p = 1) (a : ZMod p) :
    dworkCharacter p hζ' a * dworkCharacter p hζ a = 1 := sorry

/-- API: evaluation of the field version `dworkCharacterOfField` through the trace. -/
theorem dworkCharacterOfField_apply [Fact p.Prime] (n : ℕ) {ζ : K} (hζ : ζ ^ p = 1)
    (x : GaloisField p n) :
    dworkCharacterOfField p n hζ x =
      dworkCharacter p hζ (Algebra.trace (ZMod p) (GaloisField p n) x) := rfl

/-- Unit test `dworkCharacter_zero`. -/
example {ζ : K} (hζ : ζ ^ p = 1) : dworkCharacter p hζ 0 = 1 := sorry

/-- Unit test `dworkCharacter_sum` for `p = 3`: `1 + ζ + ζ ^ 2 = 0`. -/
example {ζ : K} (hζ : ζ ^ 3 = 1) (hprim : IsPrimitiveRoot ζ 3) :
    dworkCharacter 3 hζ 0 + dworkCharacter 3 hζ 1 + dworkCharacter 3 hζ 2 = 0 := sorry

/-- Unit test `dworkCharacter_not_identity_root`: the character at `1` is `ζ`, which is not `1`
for a primitive root. -/
example {ζ : K} (hζ : ζ ^ 3 = 1) (hprim : IsPrimitiveRoot ζ 3) :
    dworkCharacter 3 hζ 1 ≠ 1 := sorry

end DworkCharacter

/-! ## Trace function of the Kummer F-isocrystal (RD.6/kummer-isocrystal) -/

section Kummer

variable {F L K : Type*} [Field F] [Field L] [Algebra F L] [Field K]

/-- The Frobenius trace function of `K_a` at a point with residue field `L ⊇ F = 𝔽_q`:
`x ↦ χ(N_{L/F} x)`, for the multiplicative character `χ = χ_a`. -/
def kummerTraceFunction (χ : Fˣ →* Kˣ) (x : Lˣ) : K :=
  (χ (Units.map (Algebra.norm F : L →* F) x) : K)

/-- API: the trace function is multiplicative (`K_a` has rank one). -/
theorem kummerTraceFunction_mul (χ : Fˣ →* Kˣ) (x y : Lˣ) :
    kummerTraceFunction χ (x * y) = kummerTraceFunction χ x * kummerTraceFunction χ y := sorry

/-- API `kummerIsocrystal_tensor`: `K_a ⊗ K_{a'} = K_{a+a'}` on trace functions. -/
theorem kummerTraceFunction_mul_char (χ χ' : Fˣ →* Kˣ) (x : Lˣ) :
    kummerTraceFunction (χ * χ') x = kummerTraceFunction χ x * kummerTraceFunction χ' x := sorry

/-- Unit test `kummerIsocrystal_zero`: the trivial character gives the constant coefficient. -/
example (x : Lˣ) : kummerTraceFunction (1 : Fˣ →* Kˣ) x = 1 := sorry

/-- Unit test: at a rational point (`L = F`) the trace is the character itself. -/
example (χ : Fˣ →* Kˣ) (x : Fˣ) : kummerTraceFunction (L := F) χ x = χ x := sorry

end Kummer

/-! ## Kloosterman sums (RD.6/kloosterman-f-isocrystal, RD.6/kloosterman-local-monodromy-and-purity) -/

section Kloosterman

variable {F K : Type*} [Field F] [Fintype F] [DecidableEq F] [CommRing K]

/-- The Kloosterman sum `Kl_{n+1}(z) = ∑_{x₁,…,xₙ ∈ Fˣ} ψ(x₁ + ⋯ + xₙ + z/(x₁⋯xₙ))`. The trace of
Frobenius of the Kloosterman F-isocrystal `Kl_{n+1}` at `z` is `(-1)^n` times this sum for
`ψ = ψ_π⁻¹`. -/
def kloostermanSum (ψ : AddChar F K) (n : ℕ) (z : Fˣ) : K :=
  ∑ x : Fin n → Fˣ, ψ ((∑ i, (x i : F)) + (z : F) * (((∏ i, x i)⁻¹ : Fˣ) : F))

/-- Unit test `kloostermanIsocrystal_degenerate`: `Kl_1(z) = ψ(z)`. -/
example (ψ : AddChar F K) (z : Fˣ) : kloostermanSum ψ 0 z = ψ z := sorry

/-- Unit test `kloostermanIsocrystal_rank_two`: the classical Kloosterman sum. -/
example (ψ : AddChar F K) (z : Fˣ) :
    kloostermanSum ψ 1 z = ∑ x : Fˣ, ψ ((x : F) + (z : F) * ((x⁻¹ : Fˣ) : F)) := sorry

/-- Weil's bound, the consequence of purity of weight `1` of `Kl_2`. (Over the quadratic extension
the sums satisfy `Kl_2(z; q^2) = 2q - Kl_2(z; q)^2`, the eigenvalue relation of
RD.6/kloosterman-f-isocrystal; that statement needs a pair of nested finite fields and is a
document target.) -/
theorem kloostermanSum_one_bound (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) (z : Fˣ) :
    ‖kloostermanSum ψ 1 z‖ ≤ 2 * Real.sqrt (Fintype.card F) := sorry

/-- Deligne's bound, the consequence of purity of weight `n` of the rank-`(n+1)` coefficient
`Kl_{n+1}` (RD.6/kloosterman-local-monodromy-and-purity (d)). -/
theorem kloostermanSum_bound (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) (n : ℕ) (z : Fˣ) :
    ‖kloostermanSum ψ n z‖ ≤ (n + 1) * Real.sqrt (Fintype.card F) ^ n := sorry

end Kloosterman

/-! ## Rational descent of power series (RD.6/rational-descent-of-power-series) -/

/-- A power series over `k` that is rational over an extension field `L` is rational over `k`
(Kronecker–Hankel; ClassicalArithmeticCompletion CA.6). -/
theorem rational_descent {k L : Type*} [Field k] [Field L] [Algebra k L] (f : PowerSeries k)
    (h : ∃ P Q : Polynomial L, Q.coeff 0 = 1 ∧
      (Q : PowerSeries L) * PowerSeries.map (algebraMap k L) f = (P : PowerSeries L)) :
    ∃ P Q : Polynomial k, Q.coeff 0 = 1 ∧ (Q : PowerSeries k) * f = (P : PowerSeries k) :=
  sorry

/-- Test: the zeta function of `ℙ¹` over `𝔽_q`, `∑ (1 + q^r) t^r`, is rational over `ℚ`. -/
example (q : ℕ) :
    (((Polynomial.C (1 : ℚ) - Polynomial.X) *
        (Polynomial.C 1 - Polynomial.C (q : ℚ) * Polynomial.X) : Polynomial ℚ) : PowerSeries ℚ) *
        PowerSeries.mk (fun r => (1 + (q : ℚ) ^ r)) =
      ((Polynomial.C 2 - Polynomial.C (1 + (q : ℚ)) * Polynomial.X : Polynomial ℚ) :
        PowerSeries ℚ) := sorry

/-! ## The Dwork multiplier (RD.6/dwork-kummer-sign-dictionary (i)) -/

/-- The multiplier `θ = exp(π(x^q - x))` satisfies `θ' = π(q x^(q-1) - 1) θ`: this is the
horizontality of `F(σ^*e) = θ e` for the connection `∇e = π e dx` with `σ(x) = x^q`. The opposite
multiplier `exp(π(x - x^q))` (printed by Kedlaya and by Xu–Zhu) fails this identity. -/
theorem dwork_multiplier_horizontal {K : Type*} [Field K] [CharZero K] (π : K) (q : ℕ) :
    PowerSeries.derivative K
        ((PowerSeries.exp K).subst (PowerSeries.C π * (PowerSeries.X ^ q - PowerSeries.X))) =
      PowerSeries.C π * (PowerSeries.C (q : K) * PowerSeries.X ^ (q - 1) - 1) *
        (PowerSeries.exp K).subst (PowerSeries.C π * (PowerSeries.X ^ q - PowerSeries.X)) :=
  sorry

/-! ## Neutral Tannakian recognition (RD.6/neutral-tannakian-recognition) -/

section Tannakian

open CategoryTheory MonoidalCategory

universe u

/-- The neutral Tannakian recognition theorem (Deligne–Milne Theorem 2.11): a `K`-linear abelian
rigid symmetric monoidal category with `End(𝟙) = K` and an exact faithful `K`-linear symmetric
monoidal functor to finite-dimensional vector spaces is equivalent to the finite-dimensional
comodules over a commutative Hopf algebra (Tau Ceti's `FGComoduleCat`, whose rigid and symmetric
structures are `TauCeti.FGComoduleCat.instRigidCategory` and `instSymmetricCategory`).
Omitted: that the equivalence is symmetric monoidal and carries `ω` to the forgetful functor, and
part (c) (a tensor generator gives a Hopf algebra of finite type); these are document targets. -/
theorem neutralTannakian_recognition (K : Type u) [Field K]
    (C : Type (u + 1)) [Category.{u} C] [Abelian C] [Linear K C]
    [MonoidalCategory C] [MonoidalPreadditive C] [MonoidalLinear K C] [SymmetricCategory C]
    [RigidCategory C]
    (hEnd : Function.Bijective (fun c : K => c • 𝟙 (𝟙_ C)))
    (ω : C ⥤ FGModuleCat K) [ω.Braided] [ω.Additive] [ω.Linear K] [ω.Faithful]
    [Limits.PreservesFiniteLimits ω] [Limits.PreservesFiniteColimits ω] :
    ∃ (H : Type u) (_ : CommRing H) (_ : HopfAlgebra K H),
      Nonempty (C ≌ TauCeti.FGComoduleCat.{u, u, u} K H) := sorry

end Tannakian

/-! ## Weights (RD.6/weight-normalising-constant-line, RD.6/middle-cohomology-is-pure) -/

/-- A `d`-th root of a Frobenius eigenvalue of `ι`-weight `w` at a point of degree `d` has
absolute value `q^(w/2)`; twisting by the constant line it spans normalises the weight to `0`. -/
theorem weight_normalising_root {K : Type*} [Field K] (ι : K →+* ℂ) {q w : ℝ} (hq : 1 < q)
    {d : ℕ} (hd : 0 < d) {α c : K} (hc : c ^ d = α) (hα : ‖ι α‖ = q ^ (w * d / 2)) :
    ‖ι c‖ = q ^ (w / 2) := sorry

/-- The linear-algebra core of purity of middle cohomology: if a Frobenius-equivariant map goes
from a space whose eigenvalues have absolute value at most `r` to one whose eigenvalues have
absolute value at least `r`, every eigenvalue on its image has absolute value `r`. -/
theorem eigenvalue_norm_eq_on_image {V W : Type*} [AddCommGroup V] [Module ℂ V]
    [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ V] [FiniteDimensional ℂ W]
    (FV : Module.End ℂ V) (FW : Module.End ℂ W) (f : V →ₗ[ℂ] W) (hf : f ∘ₗ FV = FW ∘ₗ f)
    (r : ℝ) (hV : ∀ μ, Module.End.HasEigenvalue FV μ → ‖μ‖ ≤ r)
    (hW : ∀ μ, Module.End.HasEigenvalue FW μ → r ≤ ‖μ‖)
    (μ : ℂ) (v : V) (hv : f v ≠ 0) (hμ : FW (f v) = μ • f v) : ‖μ‖ = r := sorry

end

end TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology.RD6
