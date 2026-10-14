import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.Algebra.Polynomial.Div
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.Adjugate
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Ideal.Quotient.Operations
import TauCeti.RepresentationTheory.Homological.ContCohomology.Shapiro

/-!
# Euler systems, Kolyvagin systems and higher-rank descent: suggested Lean statements

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/EulerSystemsAndKolyvaginSystems.md` is definitive. The statements
below suggest Lean forms for the parts of the roadmap that can be stated with what Mathlib and
Tau Ceti provide at the pinned commits (Mathlib `082e2d3`, Tau Ceti `f790474`), so that
contributors and reviewers converge on names and signatures. Everything whose carrier does not
exist at the pins (Selmer structures of Galois representations of number fields, Euler and
Kolyvagin systems, Iwasawa modules, exterior biduals of Selmer modules) is a README target and is
listed in the closing comment block with its proposed declaration names. Theorems are proved by
`sorry`; no data is defined by `sorry`.
-/

open Polynomial

namespace TauCeti.EulerSystems

/-! ## ES.2: Euler polynomials

Rubin's Euler polynomial at an unramified prime `q` is `det(1 − Fr_q⁻¹ x | T*)`; Mazur–Rubin's is
`det(1 − Fr_q x | T)`. Both are `det(1 − f x)` for an endomorphism `f` of a finite free module,
which is the reverse of the characteristic polynomial. -/

section EulerPolynomial

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M] [Module.Free R M]
  [Module.Finite R M]

/-- `det(1 − f x)` for an endomorphism `f` of a finite free module (`ES.2/euler-polynomial`). -/
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
`P(x) − P(N x) = (N − 1) x` (`ES.3/congruence-units-example`). -/
theorem eulerPoly_gm_congruence {R : Type*} [CommRing R] (n : R) :
    ((1 - X : R[X]) - (1 - C n * X)) = C (n - 1) * X := by
  rw [C_sub, C_1]
  ring

end TauCeti.EulerSystems

namespace TauCeti.KolyvaginSystems

/-! ## ES.3: Kolyvagin's derivative operators

For `σ` of order `m` in a cyclic group, `D = Σ_{i<m} i σⁱ` and `N = Σ_{i=1}^{m} σⁱ` satisfy
`(σ − 1) D = m − N`. Inside a decomposition group the lift of `σ` need not have order `m`, and the
identity becomes `(σ − 1) D = m σᵐ − N` (Rubin, identity (9) of IV §7; `ES.3/key-relation`). -/

section Derivative

variable {G : Type*} [Group G]

/-- Kolyvagin's derivative `D_σ = Σ_{i<m} i σⁱ` in `ℤ[G]` (`ES.3/derivative-operators`). -/
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

/-- The coefficient of `σⁱ` is `i`, starting from `0`: `D_σ` for `m = 2` is `σ`, not `1 + 2σ`. -/
example (σ : G) : kolyvaginDerivative σ 2 = MonoidAlgebra.of ℤ G σ := by
  simp [kolyvaginDerivative, Finset.sum_range_succ]

/-- `D_σ` vanishes for `m = 1`: the trivial group has derivative zero. -/
example (σ : G) : kolyvaginDerivative σ 1 = 0 := by
  simp [kolyvaginDerivative]

end Derivative

/-! ## ES.3: the finite–singular polynomial

At a prime `q` with `M ∣ P(1)`, Rubin's `Q_q` is the quotient of `P(x) − P(1)` by `x − 1`
(Lemma IV.5.2), and the finite–singular comparison is `Q_q(Fr_q⁻¹)` (Definition IV.5.3). -/

/-- `Q` with `(X − 1) Q = P − P(1)` (`ES.1/finite-singular-comparison`, `ES.3/key-relation`). When
`P(1) = 0` this is the `Q` of the finite–singular comparison, with `(X − 1) Q = P`. -/
noncomputable def fsQuotientPoly {R : Type*} [CommRing R] (P : R[X]) : R[X] :=
  (P - C (P.eval 1)) /ₘ (X - C 1)

theorem fsQuotientPoly_spec {R : Type*} [CommRing R] (P : R[X]) :
    (X - C 1) * fsQuotientPoly P = P - C (P.eval 1) :=
  mul_divByMonic_eq_iff_isRoot.2 (by simp [IsRoot])

/-- For the multiplicative group, `P(x) = 1 − x` and `Q = −1`. -/
example : fsQuotientPoly (1 - X : ℤ[X]) = -1 := by
  have h := fsQuotientPoly_spec (1 - X : ℤ[X])
  have : (X - C (1 : ℤ)) * fsQuotientPoly (1 - X) = (X - C 1) * (-1) := by
    rw [h]; simp
  exact mul_left_cancel₀ (X_sub_C_ne_zero 1) this

end TauCeti.KolyvaginSystems

namespace TauCeti.ErrorTolerant

/-! ## ES.1: exponents, orders and the abundance exponent of Liu–Tian–Xiao–Zhang–Zhu

`exp_ϖ(x) = min{d : ϖᵈ x = 0}` and `ord_ϖ(x) = sup{d : x ∈ ϖᵈ M}` (Definition 2.1.6), and the
sequence `𝔣(0) = 𝔣(1) = 1`, `𝔣(r + 1) = 2(𝔣(r) + 1)` of the saturation lemma 2.3.4
(`ES.1/reducibility-depth`, `ES.1/selmer-field-saturation`). -/

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

/-- In `ℤ/9` with `ϖ = 3`: `3` has exponent `1` and order `1`, and `1` has exponent `2`. -/
example : expAt (3 : ℤ) (3 : ZMod 9) = 1 ∧ ordAt (3 : ℤ) (3 : ZMod 9) = 1 ∧
    expAt (3 : ℤ) (1 : ZMod 9) = 2 := by
  sorry

end Exponents

/-- The abundance exponent `𝔣` of Liu–Tian–Xiao–Zhang–Zhu, §2.3. -/
def abundanceExponent : ℕ → ℕ
  | 0 => 1
  | 1 => 1
  | r + 2 => 2 * (abundanceExponent (r + 1) + 1)

example : abundanceExponent 2 = 4 := rfl

example : abundanceExponent 3 = 10 := rfl

/-! ## ES.4: bounded-image matrices over a truncated discrete valuation ring

The linear algebra behind the corrected Proposition 2.6.7 of Liu–Tian–Xiao–Zhang–Zhu
(`ES.4/abundant-localization`): if a square matrix over `R/ϖⁿ` has image containing `ϖᶜ (R/ϖⁿ)ʳ`
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

end TauCeti.ErrorTolerant

namespace TauCeti.KolyvaginSystems

/-! ## ES.1: the error constant `C_α` of Castella–Grossi–Lee–Skinner

As a function of `u = α(γ) ∈ ℤ_pˣ`: `C_α = v_p(u − u⁻¹)` if `u ≠ u⁻¹` and `0` otherwise
(`ES.1/twist-error-constants`). -/

open scoped Classical in
/-- `C_α` for `α(γ) = u`. -/
noncomputable def charError (p : ℕ) [Fact p.Prime] (u : ℤ_[p]ˣ) : ℕ :=
  if (u : ℤ_[p]) = ((u⁻¹ : ℤ_[p]ˣ) : ℤ_[p]) then 0
  else PadicInt.valuation ((u : ℤ_[p]) - ((u⁻¹ : ℤ_[p]ˣ) : ℤ_[p]))

/-- The trivial character has `C_α = 0`. -/
example (p : ℕ) [Fact p.Prime] : charError p 1 = 0 := by
  simp [charError]

/-- A character of order two has `C_α = 0` although it is nontrivial. -/
example (p : ℕ) [Fact p.Prime] : charError p (-1) = 0 := by
  simp [charError]

/-! ## ES.3: Rubin's induced modules are Tau Ceti's coinduced modules

Rubin's `𝕎_M = Maps_cont(G_K, W_M)` with right translation is `TauCeti.DiscreteCoind G ⊥ W_M`,
and his `Ind_D(W_M)` is `TauCeti.DiscreteCoind G D W_M` for a decomposition group `D`; Shapiro's
lemma in degree one is `TauCeti.ContCohomology.explicitShapiro1`. The vanishing of `H¹(G, 𝕎_M)` is
the input of the exact sequence defining Rubin's connecting map `δ_L`
(`ES.3/lifting-to-induced-module`, `ES.3/local-lifts`). -/

#check @TauCeti.coind
#check @TauCeti.ContCohomology.explicitShapiro1

theorem subsingleton_H1_discreteCoind_bot (G : Type*) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (A : Type*) [AddCommGroup A] [TopologicalSpace A] [DiscreteTopology A]
    [DistribMulAction (⊥ : Subgroup G) A] [ContinuousSMul (⊥ : Subgroup G) A] :
    Subsingleton (TauCeti.ContCohomology.H1 G (TauCeti.DiscreteCoind G (⊥ : Subgroup G) A)) := by
  sorry

end TauCeti.KolyvaginSystems

/-!
## README targets not stated in this file

Every target of the roadmap is listed below with its kind and, for definitions and constructions,
the declaration names its API proposes. A target whose carrier exists at the pins is stated above
and marked `stated above`; all others are README targets, whose exact statements, hypotheses,
API and unit tests are in the roadmap document. Targets added in the whole-roadmap pass are marked `+`.


### ES.0

- `ES.0/selmer-triple` (definition): Selmer triples and squarefree conductors.
  API (TauCeti.KolyvaginSystems): SelmerTriple, IsCoefficientRing, residueChar, IsCompactCoefficient, IsDiscreteCoefficient, IsArithmeticCoefficient, SelmerStructure, conductors, one_mem_conductors, conductors_dvd_closed, restrictPrimes, isCompactCoefficient, restrictPrimes_F, dual, dualRep, dualRep_isDiscreteCoefficient, dualRep_isCompactCoefficient, dualRep_isUnramified, localPairing_nondegenerate, dualStructure_sigma, propagatedStructure_sigma.
- `ES.0/quotient-category` (definition): The category of quotients of T.
  API (TauCeti.KolyvaginSystems): QuotCat, scalarHom, scalarHom_comp, scalarHom_injective_iff, propagate_functorial.
- `ES.0/cartesian-condition` (definition): Cartesian local conditions.
  API (TauCeti.KolyvaginSystems): IsCartesian, isCartesian_iff_comap, isCartesian_unramified, isCartesian_of_field, isCartesian_of_torsionFree_quotient, quotient.
- `ES.0/cartesian-length-linearity` (lemma): Lengths of cartesian conditions grow linearly.
- `ES.0/quotient-dual-propagation` (lemma): Propagation commutes with local duality.
- `ES.0/selmer-torsion-identification` (lemma): Selmer modules of quotients and torsion submodules.
- `ES.0/selmer-length-difference` (theorem): The Euler characteristic formula for Selmer modules.
- `ES.0/core-rank` (definition): The core rank of a cartesian Selmer structure.
  API (TauCeti.KolyvaginSystems): coreRankInt, coreRank, coreRank_mul_length, coreRank_eq_zero_or_dual, selmer_equiv_dual_prod_free, coreRank_field.
- `ES.0/core-rank-independence-of-modulus` (theorem): The core rank is independent of the modulus.
- `ES.0/canonical-selmer-structure` (definition): The canonical and the unramified Selmer structures.
  API (TauCeti.KolyvaginSystems): canonicalStructure, canonicalStructure_torsionFree, canonicalStructure_dual_at_p, canonicalStructure_quotient_at_p, UnramifiedLocalLayer, unramifiedCor, universalNormSubgroup, saturation, unramifiedCondition, unramifiedStructure, unramifiedStructure_condition, unramifiedStructure_condition_away, unramifiedStructure_dual_corank_at_p, unramifiedStructure_relaxed_at_p, unramifiedStructure_eq_canonical.
- `ES.0/core-rank-formula` (theorem): Core rank of the canonical and unramified structures.
- `ES.0/hypotheses-mr2004` (definition): The Mazur–Rubin 2004 hypotheses (H.0)–(H.6) over ℚ.
  API (TauCeti.KolyvaginSystems): MR04Hypotheses, invariants_eq_bot, dual, quotient, of_rank_one.
- `ES.0/hypotheses-mr2016` (definition): The Mazur–Rubin 2016 hypotheses (H.1)–(H.7) over a number field.
  API (TauCeti.KolyvaginSystems): MR16Hypotheses, IsArtinianAdmissible, quotient, artinianAdmissible_of_frobenius, of_mr04.
- `ES.0/hypotheses-implications` (lemma): Implications between the hypothesis records.
- `ES.0/example-cyclotomic-twist` (application): Worked example: twists of ℤ_p(1) by characters of finite order.
- `ES.0/example-elliptic` (application): Worked example: the Tate module of an elliptic curve.
- `ES.0/non-example-inadmissible` (application): Worked non-example: the trivial and Teichmüller characters.

### ES.1

- `ES.1/ray-class-tower` (construction): The fields K(q), K(r) and their Galois groups.
  API (TauCeti.KolyvaginSystems): rayPExtension, gammaPrime, gammaPrime_equiv, gammaConductor_equiv_pi, card_gammaPrime_dvd, rayPExtension_ramification.
- `ES.1/conductor-ideal` (definition): The ideals I_q, I_n and the groups G_q, G_n.
  API (TauCeti.KolyvaginSystems): conductorIdeal, conductorIdeal_one, conductorIdeal_mono, tameGroup, tameGroup_tensor_free, conductorIdeal_rat.
- `ES.1/kolyvagin-primes` (definition): Kolyvagin primes: P_k, P(L, τ) and R_{F,M}.
  API (TauCeti.KolyvaginSystems): kolyvaginPrimes, kolyvaginPrimes_antitone, frobeniusPrimes, mem_kolyvaginPrimes_of_frobenius, rubinPrimes, mem_rubinPrimes_of_frobenius, kolyvaginPrimes_infinite.
- `ES.1/finite-singular-decomposition` (lemma): Finite and singular parts at an unramified prime.
- `ES.1/transverse-condition` (definition): The transverse local condition.
  API (TauCeti.KolyvaginSystems): transverse, transverse_isCompl_finite, transverse_equiv_singular, transverse_map, finitePart, transverse_eq_bot_iff.
- `ES.1/finite-singular-comparison` (construction): The finite–singular comparison map.
  Stated above: TauCeti.KolyvaginSystems.fsQuotientPoly, fsQuotientPoly_spec.
  API (TauCeti.KolyvaginSystems): fsQuotientPoly, fsQuotientPoly_spec, finiteSingular, finiteSingular_bijective, finiteSingular_map, finiteSingular_generator.
- `ES.1/modified-selmer-structures` (definition): The Selmer structures F_a^b(c).
  API (TauCeti.KolyvaginSystems.SelmerTriple): modify, modify_le, dual_modify, selmer_strict_eq_inf, modify_isCartesian, strict_sigma, relaxed_sigma, modify_sigma.
- `ES.1/transverse-duality` (theorem): The transverse condition is self-dual.
- `ES.1/chebotarev-nonvanishing` (theorem): Simultaneous nonvanishing of localisations.
- `ES.1/chebotarev-prescribed-kernels` (theorem): Primes with prescribed localisation kernels.
- `ES.1/rubin-prime-selection` (theorem): Rubin's selection of primes with large localisation.
- `ES.1/reducibility-depth` (definition): Exponents, orders and reducibility depth.
  Stated above: TauCeti.ErrorTolerant.expAt, ordAt, expAt_zero, ordAt_zero.
  API (TauCeti.ErrorTolerant): expAt, ordAt, expAt_add_ordAt_le, reducibilityDepth, reducibilityDepth_eq_zero, reducibilityDepth_bounded.
- `ES.1/selmer-field-saturation` (theorem): The field cut out by a Selmer module and saturation of θ_S.
  Stated above: TauCeti.ErrorTolerant.abundanceExponent.
- `ES.1/abundant-tuples` (definition): γ-associated places and (S, γ)-abundant tuples.
  API (TauCeti.ErrorTolerant): gammaAssociated, frobeniusSet, frobeniusSet_subset_fixed, frobeniusSet_eq_image, IsAbundant, exists_isAbundant.
+ `ES.1/twist-error-constants` (definition): Anticyclotomic twists of a Tate module and their error constants.
  Stated above: TauCeti.KolyvaginSystems.charError.
  API (TauCeti.KolyvaginSystems): TwistData, ordinaryStructure, charError, scalarError, spanError, scalarError_eq_zero_of_surjective, spanError_eq_zero_of_irreducible, pow_spanError_mul_end_le.
+ `ES.1/error-tolerant-chebotarev` (theorem): Chebotarev selection of Kolyvagin primes with error terms.
+ `ES.1/abundant-tuple-existence` (theorem): Existence of abundant tuples under the corrected span hypothesis.
+ `ES.1/residual-two-class-detection` (theorem): Residual detection of two classes and classes with prescribed ramification.

### ES.2

- `ES.2/euler-polynomial` (definition): Euler polynomials and their conventions.
  Stated above: TauCeti.EulerSystems.eulerPoly, eulerPoly_eval_zero, aeval_inv_eulerPoly_eq_zero.
  API (TauCeti.EulerSystems): eulerPoly, eulerPoly_eq_det_twist, eulerPolyMR, eulerPoly_coeff, eulerPoly_congr, eulerPoly_aeval_annihilates, eulerPoly_twist.
- `ES.2/euler-system-module` (definition): The module of Euler systems.
  API (TauCeti.EulerSystems): EulerSystem, eval, cor_eval, cor_eval_of_ramified_eq, ext, lift, restrictTower, IsAdmissibleTower.
- `ES.2/classes-unramified-outside-p` (theorem): Euler-system classes are unramified away from p.
- `ES.2/conductor-presentation` (theorem): The conductor-indexed presentations.
- `ES.2/twisting` (construction): Twisting Euler systems by characters of finite order.
  API (TauCeti.EulerSystems.EulerSystem): twist, twist_eval, twist_one, res_twist, baseChange.
- `ES.2/euler-factor-change` (theorem): Changing the Euler factors.
- `ES.2/universal-euler-system` (construction): The universal Euler system.
  API (TauCeti.EulerSystems.Universal): X, gen, norm_gen, lift, free, ext_eq_zero.
- `ES.2/rigidity-variants` (definition): Variants: rigidity conditions, finite depth and anticyclotomic systems.
  API (TauCeti.EulerSystems): IsRigid, FiniteDepthEulerSystem, toFiniteDepth, AnticyclotomicEulerSystem, of_trivial, IsTrivialAt.
+ `ES.2/ring-class-anticyclotomic-euler-system` (definition): Anticyclotomic Euler systems over ring class fields.
  API (TauCeti.EulerSystems): RingClassEulerSystem, eval, cor_eval, loc_eval, conj_eval, bottom, ext, twist.

### ES.3

- `ES.3/derivative-operators` (definition): The norm and Kolyvagin derivative operators.
  Stated above: TauCeti.KolyvaginSystems.kolyvaginDerivative, sub_one_mul_kolyvaginDerivative_of_pow_eq_one.
  API (TauCeti.KolyvaginSystems): normElement, kolyvaginDerivative, sub_one_mul_kolyvaginDerivative, augmentation_kolyvaginDerivative, kolyvaginDerivative_prod, kolyvaginDerivative_generator, normElement_eq_representation_norm.
- `ES.3/derivative-invariance` (lemma): Invariance of the derivative of the universal class.
- `ES.3/lifting-to-induced-module` (theorem): The induced module, the connecting map and lifts of an Euler system.
  Stated above: TauCeti.KolyvaginSystems.subsingleton_H1_discreteCoind_bot (with Tau Ceti's coind and explicitShapiro1).
- `ES.3/derivative-class` (construction): Kolyvagin's derivative classes κ_{F,r,M}.
  API (TauCeti.KolyvaginSystems): derivativeClass, derivativeClass_one, res_derivativeClass, derivativeClass_reduction, derivativeClass_cocycle, derivativeClass_linear, derivativeClass_generator.
- `ES.3/derivative-local-properties` (theorem): Local behaviour of derivative classes.
- `ES.3/congruence` (theorem): Kolyvagin's congruence.
- `ES.3/kolyvagin-system-module` (definition): Kolyvagin systems, weak Kolyvagin systems and their limits.
  API (TauCeti.KolyvaginSystems): KolyvaginSystem, eval, singular_eq_finiteSingular, ext, WeakKolyvaginSystem, map, GeneralizedKolyvaginSystem, ord.
- `ES.3/finite-part-formula` (theorem): Derivative classes form a weak Kolyvagin system; their finite parts.
- `ES.3/euler-to-kolyvagin` (construction): The map from Euler systems to Kolyvagin systems.
  API (TauCeti.KolyvaginSystems): correctedClass, correctedClass_one, correctedClass_finite_eq_zero, eulerToKolyvagin, eulerToKolyvagin_one, eulerToKolyvagin_ordinary, eulerToKolyvagin_twist.
- `ES.3/two-prime-test` (application): The two-prime check of the correction terms.
- `ES.3/anticyclotomic-derivative` (theorem): Derivative classes of χ-anticyclotomic Euler systems.
+ `ES.3/ring-class-derivative-classes` (construction): Derivative classes of ring-class anticyclotomic Euler systems and their local conditions at p.
  API (TauCeti.EulerSystems.RingClassEulerSystem): admissiblePrimes, derivative, derivative_one, derivative_mem_selmer, finiteSingular, derivative_conj, withLocalCondition.
+ `ES.3/derivative-classes-unramified` (theorem): Derivative classes are unramified away from pr, finite up to a bounded factor.
+ `ES.3/local-lifts` (theorem): Local lifts of an Euler system at a prime and the finite-part theorem.
  Stated above: TauCeti.KolyvaginSystems.subsingleton_H1_discreteCoind_bot (with Tau Ceti's coind and explicitShapiro1).
+ `ES.3/key-relation` (theorem): The lifted telescoping identity and the key norm relation for lifts.
  Stated above: TauCeti.KolyvaginSystems.liftedNorm, sub_one_mul_kolyvaginDerivative_lifted, fsQuotientPoly.
+ `ES.3/congruence-units-example` (application): Worked example: Kolyvagin's congruence for the multiplicative group.
  Stated above: TauCeti.EulerSystems.eulerPoly_gm_congruence.
+ `ES.3/rigidity-variant-derivative-classes` (theorem): Derivative classes and the key relation under the alternative rigidity conditions.

### ES.4

- `ES.4/selmer-sheaf` (construction): The Selmer graph and the Selmer sheaf.
  API (TauCeti.KolyvaginSystems): conductorGraph, GraphSheaf, sections, mem_sections, selmerSheaf, sections_selmerSheaf, Subsheaf.
- `ES.4/sheaf-monodromy` (definition): Locally cyclic sheaves, hubs, monodromy and primitive sections.
  API (TauCeti.KolyvaginSystems.GraphSheaf): IsLocallyCyclic, IsHub, HasTrivialMonodromy, eval_injective_of_isHub, eval_surjective_iff, IsPrimitive, generates_of_generates.
- `ES.4/vertex-step` (lemma): Selmer lengths across an edge.
- `ES.4/core-vertices` (definition): Core vertices and leading vertices.
  API (TauCeti.KolyvaginSystems): selmerLength, IsCoreVertex, isCoreVertex_iff_residual, free_of_isCoreVertex, exists_isCoreVertex_dvd, IsLeadingVertex, selmerLength_sub.
- `ES.4/leading-vertices` (theorem): Leading vertices through a prescribed submodule.
- `ES.4/stub-sheaf` (definition): The sheaf of stub Selmer modules.
  API (TauCeti.KolyvaginSystems): stubSheaf, stubSheaf_stalk_eq_bot, stubSheaf_stalk_free, stubSheaf_isLocallyCyclic, sections_stubSheaf_eq, kolyvaginSystem_eq_bot_of_coreRank_zero.
- `ES.4/kolyvagin-bound` (theorem): The Kolyvagin system bound.
- `ES.4/rubin-hypotheses` (definition): Rubin's hypotheses, index of divisibility and error terms.
  API (TauCeti.EulerSystems): HypKT, HypKV, toHypKV, indexOfDivisibility, indexOfDivisibility_eq_top_iff, errorTerm, indexOfDivisibility_smul.
- `ES.4/rubin-bound` (theorem): Rubin's bound with error terms.
- `ES.4/variant-bounds` (theorem): Bounds for the variants: finite depth and anticyclotomic systems.
- `ES.4/abundant-localization` (theorem): Localisation at abundant tuples with bounded loss.
  Stated above: TauCeti.ErrorTolerant.scaled_inverse.
- `ES.4/howard-descent-with-errors` (theorem): Self-dual descent with explicit error constants.
- `ES.4/weak-cassels-structure` (theorem): Cassels structure without residual irreducibility.
- `ES.4/nekovar-all-prime-descent` (theorem): All-prime CM-point descent with bounded error.
+ `ES.4/self-dual-module-induction` (theorem): Module lemmas for the self-dual induction over a discrete valuation ring.
+ `ES.4/rank-one-from-nonzero-class` (theorem): Rank one from a nonzero Kolyvagin class, with an explicit exponent bound.
+ `ES.4/uniform-near-trivial-bound` (theorem): Kolyvagin bounds with error independent of the twist, for characters close to 1.
+ `ES.4/rational-anticyclotomic-descent` (theorem): Rational Kolyvagin descent for ring-class anticyclotomic Euler systems.

### ES.5

- `ES.5/divisibility-invariants` (definition): Divisibility indices, elementary divisors and primitivity.
  API (TauCeti.KolyvaginSystems.KolyvaginSystem): divIndex, divIndex_zero, elementaryDivisor, divIndexInfty, IsPrimitive, divIndex_smul, not_isPrimitive_smul, ord_eq.
- `ES.5/rank-one-module-theorem` (theorem): Kolyvagin systems in core rank one.
- `ES.5/structure-theorem` (theorem): Structure of the dual Selmer group from a Kolyvagin system.
- `ES.5/kolyvagin-dual-selmer` (construction): The Kolyvagin-constructed dual Selmer group.
  API (TauCeti.KolyvaginSystems): kolyvaginDualSelmer, kolyvaginDualSelmer_map, dualSelmerToKolyvaginDual, ker_dualSelmerToKolyvaginDual, dualSelmerToKolyvaginDual_bijective.
- `ES.5/sharpness-examples` (application): Scaling, vanishing leading class and a non-primitive arithmetic system.
- `ES.5/howard-hypotheses` (definition): Howard's self-dual Selmer triples and hypotheses H.0–H.5.
  API (TauCeti.KolyvaginSystems.SelfDual): Hypotheses, inertPrimes, modify, baseChange, ofWeilPairing.
- `ES.5/cassels-structure` (theorem): The generalised Cassels pairing and the structure R^ε ⊕ M ⊕ M.
- `ES.5/howard-stub` (theorem): Stub Selmer modules in the self-dual setting.
- `ES.5/howard-dvr-theorem` (theorem): Howard's bound for self-dual Kolyvagin systems over a discrete valuation ring.
+ `ES.5/self-dual-eigenspace-localisation` (theorem): Simultaneous localisation of eigenclasses in Howard's self-dual setting.
+ `ES.5/self-dual-divisibility-profile` (definition): Divisibility profile and primitivity of self-dual Kolyvagin systems.
  API (TauCeti.KolyvaginSystems.SelfDual): index, minIndex, stableIndex, coreDivisibility, IsPrimitive, coreDivisibility_eq_top_iff, coreDivisibility_smul, stableIndex_eq_coreDivisibility, isPrimitive_iff_divisibilityInvariants.
+ `ES.5/self-dual-core-vertex-rigidity` (theorem): Rigidity of self-dual Kolyvagin systems at core vertices.
+ `ES.5/self-dual-structure-theorem` (theorem): Exact length of the Tate–Shafarevich module from a self-dual Kolyvagin system.

### ES.6

- `ES.6/exterior-bidual` (definition): Exterior biduals of Selmer modules.
  API (TauCeti.StarkSystems): selmerBidual, selmerToBidual, selmerToBidual_det, selmerToBidual_bijective.
- `ES.6/bidual-functoriality` (theorem): Selmer contractions and coefficient change.
- `ES.6/stark-systems` (definition): Stark systems.
  API (TauCeti.StarkSystems): stalk, transition, transition_comp, StarkSystem, ideal, eval_one.
- `ES.6/stark-structure` (theorem): Freeness of Stark systems and control of the dual Selmer group.
- `ES.6/bss-hypotheses` (definition): The Burns–Sakamoto–Sano hypotheses.
  API (TauCeti.StarkSystems): BSSHypothesis32, BSSHypothesis33, BSSHypothesis42, BSSHypothesis47, toFiniteLevel, free_of_core.
- `ES.6/kolyvagin-systems-rank-r` (definition): Kolyvagin systems of rank r and the regulator map.
  API (TauCeti.StarkSystems): KolyvaginSystemRank, rank_one_equiv, stub, regulator, regulator_eval_one, ideal.
- `ES.6/regulator-isomorphism` (theorem): The regulator isomorphism and structure of Kolyvagin systems of rank r.
- `ES.6/rubin-lattice` (definition): T-modified S-units, the order map and Rubin's lattice.
  API (TauCeti.RubinStark): modifiedUnits, ordG, ordG_ιMulti, ordG_bijective, rubinLattice, rubinLattice_rank_one.
- `ES.6/stark-comparison` (comparison): Comparison of exterior-power and bidual Stark systems.

### ES.7

- `ES.7/higher-rank-euler-systems` (definition): Euler systems of rank r.
  API (TauCeti.EulerSystems): HigherEulerSystem, eval, rank_one_equiv, BSSHypothesis61, iff_free, cor_eval.
- `ES.7/higher-kolyvagin-derivative` (construction): The higher Kolyvagin derivative.
  API (TauCeti.EulerSystems): rawHigherDerivative, higherDerivative, higherDerivative_one, higherDerivative_singular, higherDerivative_indep, higherDerivative_rank_one.
- `ES.7/fitting-bounds` (theorem): Fitting-ideal control from higher-rank Euler systems.
- `ES.7/rubin-brumer-stark` (construction): The Rubin–Brumer–Stark element and Rubin's conjecture.
  API (TauCeti.RubinStark): rubinBrumerStark, ordG_rubinBrumerStark, rubinBrumerStark_change_w, RubinConjecture, rubinConjecture_indep.
- `ES.7/rank-one-comparison` (comparison): Rank-one specialisation of the higher-rank theory.
- `ES.7/rubin-stark-class-group` (application): Euler-system and Rubin–Stark class-group bounds.
- `ES.7/rubin-stark-minus-comparison` (comparison): Archimedean and minus-unit Rubin–Stark dictionaries.

### ES.8

- `ES.8/admissible-zp-d-extension` (definition): Z_p^d-extensions in which no finite prime splits completely.
  API (TauCeti.EulerSystem): ZpdExtension, NoSplitPrimes, noSplitPrimes_iff_infinite_decompositionGroup, unramified_of_not_dvd_p, noSplitPrimes_of_cyclotomic_le, noSplitPrimes_mono, iwasawaAlgebra, layer_finite.
- `ES.8/iwasawa-large-image-hypotheses` (definition): Rubin's hypotheses Hyp(K∞, T) and Hyp(K∞, V).
  API (TauCeti.EulerSystem): IwasawaHypT, IwasawaHypV, toHypV, toBase, dual, of_rank_one, twist_iff, aTau_eq_one.
- `ES.8/leopoldt-tower-hypothesis` (definition): Rubin's hypothesis Hyp(K∞/K).
  API (TauCeti.EulerSystem): LeopoldtTowerHyp, of_two_le_rank, of_action_not_scalar, rat, imaginaryQuadratic, twist_iff, of_totallyReal_abelian.
- `ES.8/restricted-iwasawa-selmer-module` (construction): The Iwasawa module X∞ of the restricted Selmer groups.
  API (TauCeti.EulerSystem): restrictedSelmerInf, Xinf, res, Xinf_coinvariants, Xinf_finitelyGenerated, Xinf_twist, Xinf_eq_mazurRubin.
- `ES.8/iwasawa-class-of-an-euler-system` (construction): The Λ-adic class c_{K,∞} of an Euler system.
  API (TauCeti.EulerSystem): iwasawaClass, iwasawaClassAt, iwasawaClass_proj, iwasawaClass_smul, iwasawaClass_zero, iwasawaClass_mem_unramified, iwasawaClass_twist, iwasawaClass_eq_kappaOne.
- `ES.8/lambda-index` (definition): The Λ-adic index of divisibility ind_Λ.
  API (TauCeti.EulerSystem): lambdaIndex, lambdaIndex_smul, lambdaIndex_eq_bot_iff, apply_mem_lambdaIndex, lambdaIndex_of_rank_one, lambdaIndex_le_span_iff, lambdaIndex_twist, lambdaIndex_map_le.
- `ES.8/true-iwasawa-selmer-and-singular-quotient` (construction): The true Iwasawa Selmer group and the singular local term at p.
  API (TauCeti.EulerSystem): trueSelmerInf, singularLocalInf, locSingularInf, restrictedSelmerInf_le_true, compatible_cor_iff_res, singularLocal_torsionFree, singularLocalInf_eq_zero_of_full.
- `ES.8/twisting-by-characters-of-gamma` (construction): Twisting Euler systems by characters of infinite order.
  API (TauCeti.EulerSystem): twistGamma, twistGamma_eulerRelation, twistGamma_twistGamma, twistGamma_of_finiteOrder, iwasawaCohomologyTwistEquiv, selmerTwistEquiv, exists_good_twist, twistGamma_tate.
- `ES.8/twisting-invariance-of-iwasawa-theorems` (theorem): Invariance of the Iwasawa-theoretic statements under twisting.
- `ES.8/restriction-control-over-the-tower` (theorem): Kernels and cokernels of restriction along the tower.
- `ES.8/x-infinity-finitely-generated` (lemma): X∞ is finitely generated over Λ.
- `ES.8/iwasawa-evaluation-maps` (construction): Rubin's evaluation maps and the constant a_τ.
  API (TauCeti.EulerSystem): evalStar, eval, evalAt, aTau, aTau_eq_one, groupRingDualEquiv, eval_frobenius_derivative, eval_pairing, eval_semilinear.
- `ES.8/weak-leopoldt-from-an-euler-system` (theorem): Weak Leopoldt from an Euler system (Rubin, Theorem II.3.2).
- `ES.8/rank-one-leopoldt-case` (lemma): The rank-one exceptional actions (Rubin, Lemma VII.3.7).
- `ES.8/kolyvagin-sequence-induction` (theorem): Selmer sequences, Kolyvagin sequences and the inductive step (Rubin, Propositions VII.1.4 and VII.1.6).
- `ES.8/characteristic-ideal-bound-with-error` (theorem): The error-tolerant Iwasawa bound char(X∞) | a_τ^{5r} ind_Λ(c) (Rubin, Theorem VII.1.9).
- `ES.8/rubin-iwasawa-divisibility` (theorem): Rubin's Iwasawa divisibility char(X∞) | ind_Λ(c) (Theorem II.3.3).
- `ES.8/rubin-rational-iwasawa-divisibility` (theorem): Divisibility up to a power of p (Rubin, Theorem II.3.4).
- `ES.8/iwasawa-poitou-tate-sequence` (theorem): The Iwasawa Poitou–Tate sequence (Rubin, Proposition II.3.7).
- `ES.8/true-selmer-iwasawa-divisibility` (theorem): Divisibility for the true Selmer group (Rubin, Theorem II.3.8).
- `ES.8/unramified-at-split-primes-condition` (definition): Rubin's condition (*) at completely split primes.
  API (TauCeti.EulerSystem): UnramifiedAtSplitPrimes, unramifiedAtSplitPrimes_of_noSplitPrimes, unramifiedAtSplitPrimes_mem, splitPrimes_density_zero, weakLeopoldt_of_unramifiedAtSplitPrimes, unramifiedAtSplitPrimes_kummer.
- `ES.8/lambda-adic-selmer-structure` (construction): The Λ-adic representation 𝐓 = T ⊗ Λ and its Selmer structures.
  API (TauCeti.KolyvaginSystem): lambdaRep, lambdaRep_cohomologyEquiv, LambdaSelmerStructure, canonical, ordinary, canonical_selmer_eq, quotient, dualX, canonical_X_eq.
- `ES.8/lambda-adic-kolyvagin-systems` (construction): Λ-adic Kolyvagin systems.
  API (TauCeti.KolyvaginSystem): lambdaKS, lambdaKSBar, lambdaKS_toBar, bottomClass, lambdaKS_baseChange, lambdaKS_restrictPrimes, lambdaKS_ext, bottomClass_zero.
- `ES.8/euler-to-lambda-adic-kolyvagin` (theorem): From Euler systems to Λ-adic Kolyvagin systems (Mazur–Rubin, Theorem 5.3.3).
- `ES.8/exceptional-height-one-primes` (definition): The exceptional set Σ_Λ of height-one primes.
  API (TauCeti.KolyvaginSystem): exceptionalSet, exceptionalSet_finite, p_mem_exceptionalSet, mem_exceptionalSet_iff, exceptionalSet_twist.
- `ES.8/height-one-specialization` (construction): Specialization of Λ-adic Kolyvagin systems at height-one primes.
  API (TauCeti.KolyvaginSystem): specRing, specRep, specialize, specialize_bottomClass, specialize_augmentation, specialize_twist, perturb.
- `ES.8/specialization-control` (theorem): Control of Selmer groups at height-one specializations.
- `ES.8/generic-core-rank` (theorem): The generic core rank χ(𝐓) (Mazur–Rubin, Lemma 5.3.16).
- `ES.8/blind-spot-and-lambda-primitivity` (definition): The blind spot and Λ-primitive Kolyvagin systems.
  API (TauCeti.KolyvaginSystem): blindSpot, mem_blindSpot_iff, IsLambdaPrimitive, of_isPrimitive, specialize_ne_zero_of_not_mem_blindSpot, blindSpot_smul, not_isLambdaPrimitive_smul, blindSpot_zero.
- `ES.8/residual-primitivity-implies-lambda-primitivity` (lemma): Residual primitivity implies Λ-primitivity.
- `ES.8/lambda-adic-ind` (definition): Mazur–Rubin's principal index Ind(c).
  API (TauCeti.KolyvaginSystem): ind, ind_zero, ind_eq_char, ind_smul, exists_finiteIndex_mul_mem, lambdaIndex_le_ind, indKS.
- `ES.8/weak-leopoldt-from-lambda-adic-kolyvagin` (theorem): Weak Leopoldt from a Λ-adic Kolyvagin system (Mazur–Rubin, Theorem 5.3.6).
- `ES.8/mazur-rubin-lambda-adic-main-theorem` (theorem): The Λ-adic Kolyvagin-system bound and its equality criterion (Mazur–Rubin, Theorem 5.3.10).
- `ES.8/self-dual-lambda-adic-kolyvagin-bound` (theorem): The self-dual Λ-adic Kolyvagin bound (Howard, Theorem 2.2.10).
- `ES.8/error-tolerant-self-dual-lambda-adic-bound` (theorem): The error-tolerant self-dual Λ-adic bound (Castella–Grossi–Lee–Skinner, Theorem 3.4.1).
+ `ES.8/self-dual-lambda-primitivity-equality` (theorem): Equality in Howard's Λ-adic bound for Λ-primitive self-dual systems.
+ `ES.8/augmentation-prime-divisibility` (theorem): Λ-adic divisibility including the augmentation prime.
-/
