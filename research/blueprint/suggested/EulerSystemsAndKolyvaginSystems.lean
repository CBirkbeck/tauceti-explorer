import Mathlib
import TauCeti.RepresentationTheory.Homological.ContCohomology.Shapiro

/-!
# Euler systems, Kolyvagin systems and higher-rank descent

The README states the arithmetic targets, their hypotheses, proof plans and unit tests.
This file suggests forms for light definitions and milestones on carriers supplied by
Mathlib and Tau Ceti at the pinned baseline. It does not construct arithmetic classes.
The admitted theorems are proposed statements; all data definitions have real bodies.
-/

namespace TauCetiRoadmap.EulerSystemsAndKolyvaginSystems

open Polynomial

namespace ErrorTolerant

/-! ## Layer 1: exponents, orders and the abundance exponent of Liu–Tian–Xiao–Zhang–Zhu

`exp_ϖ(x) = min{d : ϖᵈ x = 0}` and `ord_ϖ(x) = sup{d : x ∈ ϖᵈ M}` (Definition 2.1.6), and the
sequence `𝔣(0) = 𝔣(1) = 1`, `𝔣(r + 1) = 2(𝔣(r) + 1)` of the saturation lemma 2.3.4. -/

section Exponents

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- `exp_ϖ(x, M)`, valued in `ℕ∞` (`⊤` if no power of `ϖ` kills `x`). -/
noncomputable def expAt (ϖ : R) (x : M) : ℕ∞ :=
  ⨅ (n : ℕ) (_ : ϖ ^ n • x = 0), (n : ℕ∞)

/-- `ord_ϖ(x, M)`, valued in `ℕ∞` (`⊤` for `x = 0`). -/
noncomputable def ordAt (ϖ : R) (x : M) : ℕ∞ :=
  ⨆ (n : ℕ) (_ : ∃ y : M, x = ϖ ^ n • y), (n : ℕ∞)

theorem expAt_zero (ϖ : R) : expAt ϖ (0 : M) = 0 := by
  refine le_antisymm ?_ bot_le
  exact (iInf₂_le 0 (by simp)).trans (by simp)

theorem ordAt_zero (ϖ : R) : ordAt ϖ (0 : M) = ⊤ := by
  simp only [ordAt]
  refine ENat.eq_top_iff_forall_ge.2 fun n => ?_
  exact le_iSup₂_of_le (f := fun (k : ℕ) (_ : ∃ y : M, (0 : M) = ϖ ^ k • y) => (k : ℕ∞)) n
    ⟨0, by simp⟩ le_rfl

/-- Multiplication by three on ℤ/9 distinguishes annihilator exponent from divisibility. -/
example : expAt (3 : ℤ) (3 : ZMod 9) = 1 ∧
    ordAt (3 : ℤ) (3 : ZMod 9) = 1 ∧ expAt (3 : ℤ) (1 : ZMod 9) = 2 := by
  sorry

end Exponents

/-- The abundance exponent `𝔣` of Liu–Tian–Xiao–Zhang–Zhu, §2.3. -/
def abundanceExponent : ℕ → ℕ
  | 0 => 1
  | 1 => 1
  | r + 2 => 2 * (abundanceExponent (r + 1) + 1)

example : abundanceExponent 2 = 4 := rfl
example : abundanceExponent 3 = 10 := rfl

end ErrorTolerant

namespace KolyvaginSystems

/-! ## Layer 1: the error constant `C_α` of Castella–Grossi–Lee–Skinner

As a function of `u = α(γ) ∈ ℤ_pˣ`: `C_α = v_p(u − u⁻¹)` if `u ≠ u⁻¹` and `0` otherwise. -/

open scoped Classical in
/-- `C_α` for `α(γ) = u`. -/
noncomputable def charError (p : ℕ) [Fact p.Prime] (u : ℤ_[p]ˣ) : ℕ :=
  if (u : ℤ_[p]) = ((u⁻¹ : ℤ_[p]ˣ) : ℤ_[p]) then 0
  else PadicInt.valuation ((u : ℤ_[p]) - ((u⁻¹ : ℤ_[p]ˣ) : ℤ_[p]))

/-- The trivial character contributes no character error. -/
example (p : ℕ) [Fact p.Prime] : charError p 1 = 0 := by
  simp [charError]

end KolyvaginSystems

namespace EulerSystems

/-! ## Layer 2: Euler polynomials

Rubin's Euler polynomial at an unramified prime `q` is `det(1 − Fr_q⁻¹ x | T*)`; Mazur–Rubin's is
`det(1 − Fr_q x | T)`. Both are `det(1 − f x)` for an endomorphism `f` of a finite free module,
which is the reverse of the characteristic polynomial. -/

section EulerPolynomial

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M] [Module.Free R M]
  [Module.Finite R M]

/-- `det(1 − f x)` for an endomorphism `f` of a finite free module. -/
noncomputable def eulerPoly (f : Module.End R M) : R[X] :=
  (LinearMap.charpoly f).reverse

/-- The constant coefficient of `det(1 − f x)` is `1`. -/
theorem eulerPoly_eval_zero [Nontrivial R] (f : Module.End R M) : (eulerPoly f).eval 0 = 1 := by
  sorry

/-- Cayley–Hamilton in Rubin's normalisation: `det(1 − f x)` evaluated at `f⁻¹` kills the module.
This is the step behind Rubin's Lemma IV.1.2(ii)–(iv). -/
theorem aeval_inv_eulerPoly_eq_zero (f : M ≃ₗ[R] M) :
    Polynomial.aeval (f.symm : Module.End R M) (eulerPoly (f : Module.End R M)) = 0 := by
  sorry

/-- For the identity of a rank-one module, `det(1 − x) = 1 − X`, not the characteristic polynomial
`X − 1`: the convention is the reversed one. -/
example [Nontrivial R] : eulerPoly (LinearMap.id : Module.End R R) = 1 - X := by
  sorry

end EulerPolynomial

/-- The polynomial identity behind Rubin's Example IV.8.2 (`T = ℤ_p(1)`, `P(x) = 1 − x`):
`P(x) − P(N x) = (N − 1) x`. -/
theorem eulerPoly_gm_congruence {R : Type*} [CommRing R] (n : R) :
    ((1 - X : R[X]) - (1 - C n * X)) = C (n - 1) * X := by
  rw [C_sub, C_1]
  ring

end EulerSystems

namespace KolyvaginSystems

/-! ## Layer 3: Kolyvagin's derivative operators

For `σ` of order `m` in a cyclic group, `D = Σ_{i<m} i σⁱ` and `N = Σ_{i=1}^{m} σⁱ` satisfy
`(σ − 1) D = m − N`. Inside a decomposition group the lift of `σ` need not have order `m`, and the
identity becomes `(σ − 1) D = m σᵐ − N` (Rubin, identity (9) of IV §7). -/

section Derivative

variable {G : Type*} [Group G]

/-- Kolyvagin's derivative `D_σ = Σ_{i<m} i σⁱ` in `ℤ[G]`. -/
noncomputable def kolyvaginDerivative (σ : G) (m : ℕ) : MonoidAlgebra ℤ G :=
  ∑ i ∈ Finset.range m, (i : ℤ) • MonoidAlgebra.of ℤ G (σ ^ i)

/-- The norm `N = Σ_{i=1}^{m} σⁱ`, indexed as in Rubin IV §7. -/
noncomputable def liftedNorm (σ : G) (m : ℕ) : MonoidAlgebra ℤ G :=
  ∑ i ∈ Finset.range m, MonoidAlgebra.of ℤ G (σ ^ (i + 1))

/-- The lifted telescoping identity `(σ − 1) D = m σᵐ − N`, with no condition on the order of `σ`. -/
theorem sub_one_mul_kolyvaginDerivative_lifted (σ : G) (m : ℕ) :
    (MonoidAlgebra.of ℤ G σ - 1) * kolyvaginDerivative σ m =
      (m : ℤ) • MonoidAlgebra.of ℤ G (σ ^ m) - liftedNorm σ m := by
  sorry

/-- The telescoping identity `(σ − 1) D = m − N` when `σᵐ = 1`. -/
theorem sub_one_mul_kolyvaginDerivative_of_pow_eq_one (σ : G) (m : ℕ) (h : σ ^ m = 1) :
    (MonoidAlgebra.of ℤ G σ - 1) * kolyvaginDerivative σ m = (m : MonoidAlgebra ℤ G) - liftedNorm σ m := by
  sorry

/-- The derivative begins at exponent zero with coefficient zero. -/
example (σ : G) : kolyvaginDerivative σ 1 = 0 := by
  simp [kolyvaginDerivative]

example (σ : G) : kolyvaginDerivative σ 2 = MonoidAlgebra.of ℤ G σ := by
  simp [kolyvaginDerivative, Finset.sum_range_succ]

/-- The lifted norm begins at exponent one. -/
example (σ : G) : liftedNorm σ 1 = MonoidAlgebra.of ℤ G σ := by
  simp [liftedNorm]

end Derivative

/-! ## Layer 3: the finite–singular polynomial

At a prime `q` with `M ∣ P(1)`, Rubin's `Q_q` is the quotient of `P(x) − P(1)` by `x − 1`
(Lemma IV.5.2), and the finite–singular comparison is `Q_q(Fr_q⁻¹)` (Definition IV.5.3). -/

/-- `Q` with `(X − 1) Q = P − P(1)`. When
`P(1) = 0` this is the `Q` of the finite–singular comparison, with `(X − 1) Q = P`. -/
noncomputable def fsQuotientPoly {R : Type*} [CommRing R] (P : R[X]) : R[X] :=
  (P - C (P.eval 1)) /ₘ (X - C 1)

theorem fsQuotientPoly_spec {R : Type*} [CommRing R] (P : R[X]) :
    (X - C 1) * fsQuotientPoly P = P - C (P.eval 1) :=
  mul_divByMonic_eq_iff_isRoot.2 (by simp [IsRoot])

/-- The quotient polynomial of 1−X is −1; reversing the denominator changes this sign. -/
example : fsQuotientPoly (1 - X : ℤ[X]) = -1 := by
  have h := fsQuotientPoly_spec (1 - X : ℤ[X])
  have heq : (X - C (1 : ℤ)) * fsQuotientPoly (1 - X) =
      (X - C 1) * (-1) := by
    rw [h]
    simp
  exact mul_left_cancel₀ (X_sub_C_ne_zero 1) heq

end KolyvaginSystems

namespace KolyvaginSystems

/-! ## Layer 3: Rubin's induced modules are Tau Ceti's coinduced modules

Rubin's `𝕎_M = Maps_cont(G_K, W_M)` with right translation is `TauCeti.DiscreteCoind G ⊥ W_M`,
and his `Ind_D(W_M)` is `TauCeti.DiscreteCoind G D W_M` for a decomposition group `D`; Shapiro's
lemma in degree one is `TauCeti.ContCohomology.explicitShapiro1`. The vanishing of `H¹(G, 𝕎_M)` is
the input of the exact sequence defining Rubin's connecting map `δ_L`. -/

#check @TauCeti.coind
#check @TauCeti.ContCohomology.explicitShapiro1

theorem subsingleton_H1_discreteCoind_bot (G : Type*) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (A : Type*) [AddCommGroup A] [TopologicalSpace A] [DiscreteTopology A]
    [DistribMulAction (⊥ : Subgroup G) A] [ContinuousSMul (⊥ : Subgroup G) A] :
    Subsingleton (TauCeti.ContCohomology.H1 G (TauCeti.DiscreteCoind G (⊥ : Subgroup G) A)) := by
  sorry

end KolyvaginSystems

namespace ErrorTolerant

/-! ## Layer 4: bounded-image matrices over a truncated discrete valuation ring

The linear algebra behind the corrected Proposition 2.6.7 of Liu–Tian–Xiao–Zhang–Zhu: if a square matrix over `R/ϖⁿ` has image containing `ϖᶜ (R/ϖⁿ)ʳ`
with `c < n`, it has a two-sided scaled inverse. It need not be diagonalisable by column
operations alone. -/

theorem scaled_inverse {R : Type*} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    {ϖ : R} (hϖ : Irreducible ϖ) {r n c : ℕ} (hc : c < n)
    (A : Matrix (Fin r) (Fin r) (R ⧸ Ideal.span {ϖ ^ n}))
    (hA : ∀ v : Fin r → R ⧸ Ideal.span {ϖ ^ n},
      ∃ w, A.mulVec w = Ideal.Quotient.mk (Ideal.span {ϖ ^ n}) (ϖ ^ c) • v) :
    ∃ C : Matrix (Fin r) (Fin r) (R ⧸ Ideal.span {ϖ ^ n}),
      A * C = Ideal.Quotient.mk (Ideal.span {ϖ ^ n}) (ϖ ^ c) • (1 : Matrix (Fin r) (Fin r) _) ∧
      C * A = Ideal.Quotient.mk (Ideal.span {ϖ ^ n}) (ϖ ^ c) • (1 : Matrix (Fin r) (Fin r) _) := by
  sorry

end ErrorTolerant

/- A nonzero localization on a full artinian module may vanish on its socle.
The core-vertex criterion therefore uses residual localization. -/
example : (5 : ZMod 25) ≠ 0 ∧ (5 : ZMod 25) * 5 = 0 := by
  decide

/- Further arithmetic definitions and constructions specified in the README:
KolyvaginSystems.SelmerTriple, KolyvaginSystems.QuotCat, KolyvaginSystems.IsCartesian,
KolyvaginSystems.coreRankInt, KolyvaginSystems.canonicalStructure, KolyvaginSystems.MR04Hypotheses,
KolyvaginSystems.MR16Hypotheses, KolyvaginSystems.rayPExtension, KolyvaginSystems.conductorIdeal,
KolyvaginSystems.kolyvaginPrimes, KolyvaginSystems.transverse, KolyvaginSystems.SelmerTriple.modify,
ErrorTolerant.gammaAssociated, EulerSystems.EulerSystem, EulerSystems.EulerSystem.twist,
EulerSystems.Universal.X, EulerSystems.IsRigid, KolyvaginSystems.normElement,
KolyvaginSystems.derivativeClass, KolyvaginSystems.KolyvaginSystem, KolyvaginSystems.correctedClass,
KolyvaginSystems.conductorGraph, KolyvaginSystems.GraphSheaf.IsLocallyCyclic, KolyvaginSystems.selmerLength,
KolyvaginSystems.stubSheaf, EulerSystems.HypKT, KolyvaginSystems.KolyvaginSystem.divIndex,
KolyvaginSystems.kolyvaginDualSelmer, KolyvaginSystems.SelfDual.Hypotheses, StarkSystems.selmerBidual,
StarkSystems.stalk, StarkSystems.BSSHypothesis32, StarkSystems.KolyvaginSystemRank,
RubinStark.modifiedUnits, EulerSystems.HigherEulerSystem, EulerSystems.rawHigherDerivative,
RubinStark.rubinBrumerStark, EulerSystem.ZpdExtension, EulerSystem.IwasawaHypT,
EulerSystem.LeopoldtTowerHyp, EulerSystem.restrictedSelmerInf, EulerSystem.iwasawaClass,
EulerSystem.lambdaIndex, EulerSystem.trueSelmerInf, EulerSystem.twistGamma,
EulerSystem.evalStar, EulerSystem.UnramifiedAtSplitPrimes, KolyvaginSystem.lambdaRep,
KolyvaginSystem.lambdaKS, KolyvaginSystem.exceptionalSet, KolyvaginSystem.specRing,
KolyvaginSystem.blindSpot, KolyvaginSystem.ind, KolyvaginSystems.TwistData,
EulerSystems.RingClassEulerSystem, EulerSystems.RingClassEulerSystem.admissiblePrimes, KolyvaginSystems.SelfDual.index.
Their coefficient, local-duality and geometric carriers are supplied by the named
roadmaps before these signatures can be stated in Lean. -/

end TauCetiRoadmap.EulerSystemsAndKolyvaginSystems
