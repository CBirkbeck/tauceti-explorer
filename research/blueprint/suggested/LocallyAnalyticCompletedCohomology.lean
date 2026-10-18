import Mathlib.Data.Matrix.Mul
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FinCases

/-!
# Locally analytic vectors in the completed cohomology of modular curves — suggested Lean companion

This file is not the roadmap and is not exhaustive: the roadmap document
`research/blueprint/readmes/LocallyAnalyticCompletedCohomology.md` is definitive. The statements
below suggest Lean forms for the parts that can be stated with what Mathlib and Tau Ceti provide at the
pinned commits, so that contributors and reviewers converge on names and signatures.

Nothing here develops theory. The perfectoid modular curve, the Hodge–Tate period map, the sheaves
`O^{la,χ}` on the flag variety, the differential operators `d_{k+1}`, `d̄_{k+1}` and the intertwining
operator, the period sheaves and the Fontaine operator are README targets (layers LA.0–LA.12): their
carriers are not at the pins. What is stated here is the finite combinatorics those targets are built
on and which a wrong formalisation would get wrong: the weight conventions for the horizontal Cartan
action, the two reflections of weights and their Harish-Chandra invariants, the infinitesimal
characters `χ̃_k`, the explicit generator of the horizontal nilpotent bundle `n⁰` and the coordinate
form of `θ_h`, the Lie algebra action on the function `t`, and the polynomial shadow of `d̄_{k+1}`.
-/

namespace LocallyAnalyticCompletedCohomology

open Matrix Polynomial

/-! ## Weights of the diagonal Cartan (LA.1/horizontal-cartan-action, LA.2/weight-sheaves) -/

/-- An integral weight `χ = (n₁, n₂)` of the diagonal Cartan `h ⊂ gl₂`, meaning the character
`diag(a, d) ↦ n₁ a + n₂ d` (Pan II §3.2.1). -/
@[ext]
structure Weight where
  n₁ : ℤ
  n₂ : ℤ
  deriving DecidableEq

namespace Weight

/-- The value of `χ` on `diag(a, d)` in a commutative ring. -/
def eval {R : Type*} [CommRing R] (χ : Weight) (a d : R) : R := χ.n₁ * a + χ.n₂ * d

/-- `χ(h)` for the coroot `h = diag(1, -1)`. -/
def evalH (χ : Weight) : ℤ := χ.n₁ - χ.n₂

/-- Twisting by `t^k` shifts the weight by `(k, k)` (Pan II Remark 3.2.4). -/
def twistT (χ : Weight) (k : ℤ) : Weight := ⟨χ.n₁ + k, χ.n₂ + k⟩

/-- The dot action of the nontrivial Weyl element, `w·χ = w(χ + ρ) - ρ = (n₂ - 1, n₁ + 1)`. -/
def dot (χ : Weight) : Weight := ⟨χ.n₂ - 1, χ.n₁ + 1⟩

/-- The reflection `-w·(-χ) = (n₂ + 1, n₁ - 1)`, the target weight of `d̄_{k+1}` and of the intertwining
operator `I_k` (Pan II Theorem 4.2.7, Definition 4.3.1). -/
def reflect (χ : Weight) : Weight := ⟨χ.n₂ + 1, χ.n₁ - 1⟩

/-- The Hodge–Tate weight of the analytic vectors of `O^{la,(n₁,n₂)}` (Pan II Proposition 3.3.8), in
Pan's convention where the cyclotomic character has weight `-1`. -/
def hodgeTateWeight (χ : Weight) : ℤ := -χ.n₂

/-- Harish-Chandra invariants of the dot orbit: `(n₁ + n₂, (n₁ - n₂ + 1)²)`. Two weights have the
same infinitesimal character iff these agree. -/
def dotInvariant (χ : Weight) : ℤ × ℤ := (χ.n₁ + χ.n₂, (χ.n₁ - χ.n₂ + 1) ^ 2)

/-- The invariants governing `θ_h`-weights of `O^la` (Pan II §4.2.4): `(n₁ + n₂, (n₁ - n₂ - 1)²)`. -/
def thetaInvariant (χ : Weight) : ℤ × ℤ := (χ.n₁ + χ.n₂, (χ.n₁ - χ.n₂ - 1) ^ 2)

theorem dot_dot (χ : Weight) : χ.dot.dot = χ := by
  ext <;> simp [dot]

theorem reflect_reflect (χ : Weight) : χ.reflect.reflect = χ := by
  ext <;> simp [reflect]

theorem dotInvariant_dot (χ : Weight) : χ.dot.dotInvariant = χ.dotInvariant := by
  simp only [dotInvariant, dot, Prod.mk.injEq]
  constructor <;> ring

theorem thetaInvariant_reflect (χ : Weight) : χ.reflect.thetaInvariant = χ.thetaInvariant := by
  simp only [thetaInvariant, reflect, Prod.mk.injEq]
  constructor <;> ring

theorem evalH_twistT (χ : Weight) (k : ℤ) : (χ.twistT k).evalH = χ.evalH := by
  simp [evalH, twistT]

/-- The two `θ_h`-weights of the twisted target of `d_{k+1}` differ by the reflection; for
`χ = (n₁, n₂)` with `k = n₂ - n₁`, the reflected weight has `χ(h) = k + 2`. -/
theorem evalH_reflect (χ : Weight) : χ.reflect.evalH = -χ.evalH + 2 := by
  simp [evalH, reflect]; ring

example : (⟨0, 0⟩ : Weight).dot = ⟨-1, 1⟩ := rfl

example : (⟨0, 3⟩ : Weight).reflect = ⟨4, -1⟩ := rfl

example : (⟨1, 1⟩ : Weight).hodgeTateWeight = -1 := rfl

end Weight

/-! ## Infinitesimal characters (LA.11/infinitesimal-character-chi-k, LA.5) -/

/-- `χ̃_k = {(0, 1 - k), (-k, 1)}`, the infinitesimal character of `Sym^{k-1}` of the dual of the
standard representation (Pan II §6.2.3), as an ordered pair of representatives. -/
def ChiTilde.orbit (k : ℤ) : Weight × Weight := (⟨0, 1 - k⟩, ⟨-k, 1⟩)

theorem ChiTilde.orbit_dot (k : ℤ) : (ChiTilde.orbit k).1.dot = (ChiTilde.orbit k).2 := by
  ext <;> simp [ChiTilde.orbit, Weight.dot]

/-- The Harish-Chandra invariants of the dot orbit `χ̃_k` agree with the `θ_h`-invariants of the weight
`(1 - k, 0)`: the `χ̃_k`-isotypic part of `O^la` is `O^{la,(1-k,0)} ⊕ O^{la,(1,-k)}` (Pan II §6.2.3). -/
theorem ChiTilde.matches_theta_weights (k : ℤ) :
    (ChiTilde.orbit k).1.dotInvariant = (⟨1 - k, 0⟩ : Weight).thetaInvariant := by
  simp only [ChiTilde.orbit, Weight.dotInvariant, Weight.thetaInvariant, Prod.mk.injEq]
  constructor <;> ring

theorem ChiTilde.k_one : ChiTilde.orbit 1 = (⟨0, 0⟩, ⟨-1, 1⟩) := by
  simp [ChiTilde.orbit]

theorem reflect_one_sub (k : ℤ) : (⟨1 - k, 0⟩ : Weight).reflect = ⟨1, -k⟩ := by
  ext <;> simp [Weight.reflect]

/-- The weights `(1 - k, 0)` and `(1, -k)` used in the decomposition of `O^{la,χ̃_k}` (the `t`-twist of
`χ̃_k` by `t^{1-k}` and `t^{1}` read off Pan II §6.2.3) have Hodge–Tate weights `0` and `k`. -/
theorem fontaine_weights (k : ℤ) :
    (⟨1 - k, 0⟩ : Weight).hodgeTateWeight = 0 ∧ (⟨1, -k⟩ : Weight).hodgeTateWeight = k := by
  simp [Weight.hodgeTateWeight]

/-- The infinitesimal character attached by Pan I Proposition 6.1.5 to a pro-cohomological irreducible
`ρ` with Hodge–Tate–Sen weights `(a, b)`: the dot orbit `{(-a - 1, -b), (-b - 1, -a)}`. -/
def infCharOfHTSen (a b : ℤ) : Weight × Weight := (⟨-a - 1, -b⟩, ⟨-b - 1, -a⟩)

theorem infCharOfHTSen_dot (a b : ℤ) : (infCharOfHTSen a b).1.dot = (infCharOfHTSen a b).2 := by
  ext <;> simp [infCharOfHTSen, Weight.dot]

/-- Gouvêa's conjecture in weight form (Pan I Theorem 6.4.11(1)): an overconvergent eigenform of weight
`(-a, -b - 1)` has `χ(h) = b - a + 1`; with `a = 0` this is `k = b + 1`, i.e. weights `0, k - 1`. -/
theorem gouvea_weight (a b : ℤ) : (⟨-a, -b - 1⟩ : Weight).evalH = b - a + 1 := by
  simp [Weight.evalH]; ring

/-! ## The flag variety: `n⁰`, `θ_h` and the Lie algebra (LA.1) -/

section Flag

variable {R : Type*} [CommRing R]

/-- The generator of the horizontal nilpotent line bundle `n⁰` at the point with coordinate `x`
(Pan I §4.3.2): `(x x²; -1 -x)`. Up to a unit it is the relative Sen operator `θ` of the modular tower. -/
def FlagBundle.nZeroGenerator (x : R) : Matrix (Fin 2) (Fin 2) R := !![x, x ^ 2; -1, -x]

theorem FlagBundle.nZero_sq (x : R) :
    FlagBundle.nZeroGenerator x * FlagBundle.nZeroGenerator x = 0 := by
  rw [FlagBundle.nZeroGenerator, Matrix.mul_fin_two]
  ext i j; fin_cases i <;> fin_cases j <;> simp <;> ring

theorem FlagBundle.nZero_trace (x : R) : (FlagBundle.nZeroGenerator x).trace = 0 := by
  simp [FlagBundle.nZeroGenerator, Matrix.trace, Fin.sum_univ_two]

/-- The coordinate form of the horizontal Cartan action (Pan I §5.1.1): `θ_h(diag(a, d))` acts on a
chart where `e₁` generates as the element `(d  (d - a)x; 0  a)` of `O_Fl ⊗ gl₂`. -/
def ThetaH.coordinate (a d x : R) : Matrix (Fin 2) (Fin 2) R := !![d, (d - a) * x; 0, a]

/-- The bracket relation Pan uses to identify `θ_h` (Pan I §5.1.1). -/
theorem ThetaH.coordinate_bracket (a d x : R) :
    ThetaH.coordinate a d x * FlagBundle.nZeroGenerator x - FlagBundle.nZeroGenerator x * ThetaH.coordinate a d x =
      (a - d) • FlagBundle.nZeroGenerator x := by
  rw [ThetaH.coordinate, FlagBundle.nZeroGenerator, Matrix.mul_fin_two, Matrix.mul_fin_two]
  ext i j; fin_cases i <;> fin_cases j <;> simp <;> ring

/-- The upper nilpotent `u₊`, the coroot `h` and the centre `z` of `gl₂`. -/
def uPlus : Matrix (Fin 2) (Fin 2) R := !![0, 1; 0, 0]
def hCoroot : Matrix (Fin 2) (Fin 2) R := !![1, 0; 0, -1]
def zCentre : Matrix (Fin 2) (Fin 2) R := !![1, 0; 0, 1]

theorem bracket_h_uPlus :
    (hCoroot : Matrix (Fin 2) (Fin 2) R) * uPlus - uPlus * hCoroot = (2 : R) • uPlus := by
  rw [hCoroot, uPlus, Matrix.mul_fin_two, Matrix.mul_fin_two, Matrix.smul_of]
  ext i j; fin_cases i <;> fin_cases j <;> simp; ring

/-- The Lie algebra of `GL₂(Q_p)` acts on the function `t` by the trace (Pan I §4.3.1). -/
def ModularCurve.lieOnT (X : Matrix (Fin 2) (Fin 2) R) : R := X.trace

theorem ModularCurve.lie_t_centre : ModularCurve.lieOnT (zCentre : Matrix (Fin 2) (Fin 2) R) = 2 := by
  simp [ModularCurve.lieOnT, zCentre, Matrix.trace, Fin.sum_univ_two]; norm_num

theorem ModularCurve.lie_t_coroot : ModularCurve.lieOnT (hCoroot : Matrix (Fin 2) (Fin 2) R) = 0 := by
  simp [ModularCurve.lieOnT, hCoroot, Matrix.trace, Fin.sum_univ_two]

end Flag

/-! ## The polynomial shadow of `d̄_{k+1}` (LA.6/operator-dbar, LA.6/dbar-is-surjective-with-locally-algebraic-kernel)

On the dense `n`-finite part of `O^{la,(0,k)}`, sections are `t^{n₁} e₁^k · Σ cᵢ xⁱ` and `d̄_{k+1}` is a
nonzero rational multiple of `(u₊)^{k+1} = (d/dx)^{k+1}`. Its kernel on polynomials is the polynomials of
degree at most `k`, the shadow of `Sym^k V`, the locally algebraic subsheaf. -/

/-- The `(k + 1)`-st derivative kills polynomials of degree at most `k`. -/
theorem OperatorDbar.polynomial {R : Type*} [CommRing R] (k : ℕ) (P : R[X])
    (hP : P.natDegree ≤ k) : derivative^[k + 1] P = 0 :=
  iterate_derivative_eq_zero (Nat.lt_succ_of_le hP)

/-- The `(k + 1)`-st derivative does not kill `X^{k+1}` in characteristic zero: the kernel is exactly the
degree-`≤ k` part, not larger. -/
theorem OperatorDbar.polynomial_sharp (k : ℕ) : derivative^[k + 1] ((X : ℚ[X]) ^ (k + 1)) ≠ 0 := by
  sorry

/-! ## The theta operator on `q`-expansions (LA.6/theta-operators)

By Bol's identity, `θ_{k+1}` acts on `q`-expansion coefficients by `aₙ ↦ c_k n^{k+1} aₙ` for a nonzero
rational `c_k`; the normalised form below drops `c_k`. -/

/-- The normalised action of `θ_{k+1}` on `q`-expansion coefficients. -/
def ThetaOp.onQExpansion {R : Type*} [CommRing R] (k : ℕ) (a : ℕ → R) : ℕ → R := fun n => (n : R) ^ (k + 1) * a n

theorem ThetaOp.kills_constants {R : Type*} [CommRing R] (k : ℕ) (a : ℕ → R)
    (ha : ∀ n, n ≠ 0 → a n = 0) : ThetaOp.onQExpansion k a = 0 := by
  funext n
  by_cases h : n = 0
  · subst h; simp [ThetaOp.onQExpansion]
  · simp [ThetaOp.onQExpansion, ha n h]

theorem ThetaOp.bol (k : ℕ) :
    ThetaOp.onQExpansion (R := ℚ) k (fun n => if n = 1 then 1 else 0) 1 = 1 := by
  simp [ThetaOp.onQExpansion]

/-! ## The group `GL₂(Q_p)` -/

/-- `GL₂(Q_p)`, acting on the perfectoid modular curve and on `V = Q_p²`. -/
abbrev GL2Qp (p : ℕ) [Fact p.Prime] := Matrix.GeneralLinearGroup (Fin 2) ℚ_[p]

/-!
## README targets not stated here

Their carriers are not at the pins; each is a target of the layer named, with its intended signature in
the roadmap document.

* LA.0: log G-Galois pro-étale perfectoid coverings of small affinoid curves, the Kummer tower with Tate's
  normalised traces, the relative Sen operator `φ_V`, the differential equation `θ ∈ B ⊗ Lie G`, locally
  analytic coverings and the acyclicity of `R^iLA`.
* LA.1: the perfectoid modular curve with `π_HT`, the fake Hasse invariants and `t`, the bundles
  `g⁰ ⊃ b⁰ ⊃ n⁰` on `Fl` (here only the generator `FlagBundle.nZeroGenerator`), the sheaves `O^la_{K^p}`,
  `O^sm_{K^p}`, the horizontal Cartan action (here only `ThetaH.coordinate` and `Weight`) and the twists
  `ω^{k,la}`.
* LA.2–LA.3: the power-series expansion, the Banach algebras `O_n(U){x,e₁,t}`, the weight sheaves,
  `H̃^i(K^p,C)^la = H^i(Fl, O^la)`, Sen operators on `C`-Banach representations, the LB topology.
* LA.4–LA.5: overconvergent forms `M†_χ`, the `n`-cohomology computations, the `μ`-isotypic
  decomposition, pro-modular representations, weight-one classicality, Fontaine–Mazur in the irregular
  case and Gouvêa's conjecture (here only the weight bookkeeping `gouvea_weight`, `infCharOfHTSen`).
* LA.6–LA.7: the de Rham bundle `D^sm`, `θ_{k+1}` (here only its `q`-expansion shadow
  `ThetaOp.onQExpansion`), `d_{k+1}`, `d̄_{k+1}` (here only its polynomial shadow `OperatorDbar.polynomial`),
  `I_k`, `I¹_k`, the `n`-invariants of `ker I¹_k` and their finiteness.
* LA.8–LA.10: the Newton stratification, Igusa rigid cohomology inputs, the Lubin–Tate and Drinfeld
  sheaves and operators, quaternionic forms on `Ω`, the three-step filtration, the spectral decomposition,
  `DR_k`, `D_k`, compactly supported de Rham cohomology of the Drinfeld tower and the vanishing-cycle
  sequence.
* LA.11–LA.12: the period sheaves `B^{+,la,χ̃}_{dR,k}`, the Fontaine operator `N_k` (here only the
  weights `ChiTilde.orbit`, `fontaine_weights`), the two comparisons and the Legendre relation, `Π_ρ`,
  the classicality theorem and the descriptions of `Π_ρ^la`.
-/

end LocallyAnalyticCompletedCohomology
