/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These signatures suggest Lean forms so that contributors and reviewers
converge on names and interfaces; the mathematical specification is the document
(research/blueprint/readmes/PadicHodgeRegulators--D.1.md) and the packet.

PadicHodgeRegulators, part D.1 (layers D.1–D.5, L0–L2).
Pins: Mathlib 082e2d3; Tau Ceti f790474. Checked with lean-check against Mathlib only.

Every statement below is unproved (`sorry`). Only objects whose carriers exist in the
pinned Mathlib are written as Lean declarations: Kontsevich's finite polylogarithm, the
residue-spanning statement over finite fields, the Orzech step of the unramified
regulator theorem, the componentwise dilogarithm on a finite product of fields
(prototyped against the field-level dilogarithm, which ColemanIntegration owns), the
Frobenius-eigenvector algebra of the curve regulator, and the Bernoulli convention of
the modified polylogarithm. Objects whose carriers do not exist yet (period rings and
the Bloch–Kato maps, Quillen K-theory with coefficients, rigid and log-syntomic
cohomology, (φ,Γ)-modules and Iwasawa cohomology, regulators of curves) appear as
commented contracts under the names the packet gives them; they are not replaced by
`Prop`-valued placeholders. Tau Ceti's `TauCeti.teichmuller` and `TauCeti.kummerClassMap`
are cited in the packet; their modules are not in the shared build used for checking.
-/

import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.RingTheory.OrzechProperty
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.LinearAlgebra.FreeModule.Finite.Basic
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.NumberTheory.Bernoulli
import Mathlib.GroupTheory.FreeAbelianGroup

noncomputable section
open Polynomial

namespace TauCeti.PadicHodgeRegulators

/-! ## D.3 — Kontsevich's finite polylogarithm -/

section FinitePolylog
variable (p : ℕ) [Fact p.Prime]

-- PadicHodgeRegulators:D.3/finite-polylogarithm
/-- `li_{n,p}(x) = Σ_{k=1}^{p-1} x^k / k^n ∈ 𝔽_p[x]`. -/
def finitePolylog (n : ℤ) : Polynomial (ZMod p) :=
  ∑ k ∈ Finset.Ico 1 p, C (((k : ZMod p) ^ n)⁻¹) * X ^ k

lemma finitePolylog_eval_zero (n : ℤ) : (finitePolylog p n).eval 0 = 0 := by sorry

lemma finitePolylog_derivative (n : ℤ) :
    X * derivative (finitePolylog p n) = finitePolylog p (n - 1) := by sorry

lemma finitePolylog_eval_one (n : ℤ) :
    (finitePolylog p n).eval 1 = 0 ↔ ¬ ((p : ℤ) - 1 ∣ n) := by sorry

lemma finitePolylog_two_rootMultiplicity_one (hp : 5 ≤ p) :
    (X - 1) ^ 2 ∣ finitePolylog p 2 := by sorry

lemma finitePolylog_natDegree (hp : 2 < p) (n : ℤ) :
    (finitePolylog p n).natDegree = p - 1 := by sorry

end FinitePolylog

-- TEST finitePolylog_five_two
example [Fact (Nat.Prime 5)] : (finitePolylog 5 2).eval 2 = 1 := by sorry
-- TEST finitePolylog_one_index
example (p : ℕ) [Fact p.Prime] :
    finitePolylog p 0 = ∑ k ∈ Finset.Ico 1 p, (X : Polynomial (ZMod p)) ^ k := by sorry
-- TEST finitePolylog_three_non_example
example [Fact (Nat.Prime 3)] : (finitePolylog 3 2).eval 1 = 2 := by sorry
-- TEST finitePolylog_compat_coleman (commented contract)
-- For ζ ∈ μ(ℚ_{p^s}) \ {1} of order prime to p, the reduction of p^{-2} Li_2(ζ^p) is
-- -li_{2,p}(ζ̄)/(1 - ζ̄)^p (ColemanIntegration:L2/values-at-tame-roots-of-unity (c)).

/-! ## D.3 — the residue-spanning statement modulo p -/

section ResidueSpanning
variable (p : ℕ) [Fact p.Prime] (s : ℕ)

/-- The reduction `f_p(x) = li_{2,p}(x)/(x - 1)^p` of `p^{-2} D(ζ^p)` on `𝔽_{p^s}`. -/
def residueDilogReduction (x : GaloisField p s) : GaloisField p s :=
  aeval x (finitePolylog p 2) / (x - 1) ^ p

-- PadicHodgeRegulators:D.3/residue-spanning, statement (a) modulo p
theorem residueSpanning_mod_p (hp : 5 ≤ p) (hs : 1 ≤ s) :
    Submodule.span (ZMod p)
      (Set.range fun x : {x : GaloisField p s // x ≠ 1} => residueDilogReduction p s x) = ⊤ := by
  sorry

-- PadicHodgeRegulators:D.3/residue-spanning, statement (b) modulo p
theorem residueSpanning_differences_mod_p (hp : 5 ≤ p) (hs : 1 ≤ s) :
    Submodule.span (ZMod p)
      (Set.range fun xy : {x : GaloisField p s // x ≠ 1} × {x : GaloisField p s // x ≠ 1} =>
        residueDilogReduction p s xy.1 - residueDilogReduction p s xy.2) = ⊤ := by
  sorry

/-- The counting input: a subset of `𝔽_{p^s}` with more than `p^{s-1}` elements spans. -/
theorem span_eq_top_of_card_gt (S : Finset (GaloisField p s)) (hs : 1 ≤ s)
    (hS : p ^ (s - 1) < S.card) : Submodule.span (ZMod p) (S : Set (GaloisField p s)) = ⊤ := by
  sorry

/-- The fibre bound: every fibre of `f_p` on `𝔽_{p^s} \ {1}` has at most `p - 2` points. -/
theorem residueDilogReduction_fibre_card (hp : 5 ≤ p) (c : GaloisField p s) :
    {x : GaloisField p s | x ≠ 1 ∧ residueDilogReduction p s x = c}.ncard ≤ p - 2 := by
  sorry

end ResidueSpanning

/-! ## D.3 — the Orzech step of the unramified regulator theorem -/

-- PadicHodgeRegulators:D.3/unramified-regulator-theorem (final algebraic step):
-- a surjection between free ℤ_p-modules of the same finite rank is injective.
theorem unramifiedRegulator_injective_of_surjective (p : ℕ) [Fact p.Prime]
    (M N : Type*) [AddCommGroup M] [Module ℤ_[p] M] [Module.Free ℤ_[p] M] [Module.Finite ℤ_[p] M]
    [AddCommGroup N] [Module ℤ_[p] N] [Module.Free ℤ_[p] N] [Module.Finite ℤ_[p] N]
    (h : Module.finrank ℤ_[p] M = Module.finrank ℤ_[p] N)
    (f : M →ₗ[ℤ_[p]] N) (hf : Function.Surjective f) : Function.Injective f := by
  sorry

end TauCeti.PadicHodgeRegulators

namespace TauCeti.PadicHodgeRegulators

/-! ## D.1 — the dilogarithm on a finite étale algebra

A finite étale `ℚ_p`-algebra is the product `∀ i, A i` of its finitely many field factors.
`D i : A i → A i` is Coleman's dilogarithm `D^0` of ColemanIntegration (Iwasawa branch),
read in the factor `A i` through any `ℚ_p`-embedding into `ℂ_p`; its existence, values in
`A i` and independence of the embedding are ColemanIntegration's results
(L2/dilogarithm-identities, L2/values-in-finite-extensions, L2/galois-equivariance). The
étale-algebra map is the componentwise map; the relations below are stated with the
field-level relations as hypotheses. -/

section EtaleDilog
variable {ι : Type*} {A : ι → Type*} [∀ i, Field (A i)]

/-- Admissible points: every component differs from `0` and `1`. -/
def etaleAdmissible (z : ∀ i, A i) : Prop := ∀ i, z i ≠ 0 ∧ z i ≠ 1

-- PadicHodgeRegulators:D.1/etale-algebra-dilogarithm
/-- The componentwise dilogarithm `D_A(z) = (D_{A_i}(z_i))_i`. -/
def etaleDilog (D : ∀ i, A i → A i) (z : ∀ i, A i) : ∀ i, A i := fun i => D i (z i)

@[simp] lemma etaleDilog_apply_pi (D : ∀ i, A i → A i) (z : ∀ i, A i) (i : ι) :
    etaleDilog D z i = D i (z i) := by sorry

lemma etaleDilog_one_sub (D : ∀ i, A i → A i)
    (hD : ∀ i (x : A i), x ≠ 0 → x ≠ 1 → D i (1 - x) = - D i x)
    (z : ∀ i, A i) (hz : etaleAdmissible z) :
    etaleDilog D (1 - z) = - etaleDilog D z := by sorry

lemma etaleDilog_inv (D : ∀ i, A i → A i)
    (hD : ∀ i (x : A i), x ≠ 0 → x ≠ 1 → D i x⁻¹ = - D i x)
    (z : ∀ i, A i) (hz : etaleAdmissible z) :
    etaleDilog D z⁻¹ = - etaleDilog D z := by sorry

/-- Functoriality along a map of finite étale algebras, factor by factor: a family of
field maps `f i : A (σ i) →+* B i` intertwining the dilogarithms (Galois equivariance of
the Iwasawa branch) intertwines the étale dilogarithms. -/
lemma etaleDilog_map {κ : Type*} {B : κ → Type*} [∀ j, Field (B j)] (σ : κ → ι)
    (f : ∀ j, A (σ j) →+* B j) (DA : ∀ i, A i → A i) (DB : ∀ j, B j → B j)
    (hf : ∀ j x, DB j (f j x) = f j (DA (σ j) x)) (z : ∀ i, A i) :
    etaleDilog DB (fun j => f j (z (σ j))) = fun j => f j (etaleDilog DA z (σ j)) := by sorry

lemma etaleDilog_fiveTerm (D : ∀ i, A i → A i)
    (hD : ∀ i (x y : A i), x ≠ 0 → x ≠ 1 → y ≠ 0 → y ≠ 1 → x ≠ y →
      D i x - D i y + D i (y / x) - D i ((1 - x⁻¹) / (1 - y⁻¹)) + D i ((1 - x) / (1 - y)) = 0)
    (x y : ∀ i, A i) (hx : etaleAdmissible x) (hy : etaleAdmissible y) (hxy : ∀ i, x i ≠ y i) :
    etaleDilog D x - etaleDilog D y + etaleDilog D (y / x) - etaleDilog D ((1 - x⁻¹) / (1 - y⁻¹))
      + etaleDilog D ((1 - x) / (1 - y)) = 0 := by sorry

/-- On roots of unity the dilogarithm is `Li_2`, since `log_p` vanishes there: stated with
the field-level identity `D ζ = Li₂ ζ` as hypothesis. -/
lemma etaleDilog_rootOfUnity (D Li₂ : ∀ i, A i → A i) (m : ℕ)
    (hD : ∀ i (ζ : A i), ζ ^ m = 1 → ζ ≠ 1 → D i ζ = Li₂ i ζ)
    (ζ : ∀ i, A i) (hζ : ζ ^ m = 1) (h1 : ∀ i, ζ i ≠ 1) :
    etaleDilog D ζ = etaleDilog Li₂ ζ := by sorry

/-- The additive extension to formal symbols `[z]`. -/
def etaleDilogHom (D : ∀ i, A i → A i) : FreeAbelianGroup (∀ i, A i) →+ (∀ i, A i) :=
  FreeAbelianGroup.lift (etaleDilog D)

end EtaleDilog

-- TEST etaleDilog_neg_one: the inversion relation forces `D(−1) = 0` in characteristic zero.
example {ι : Type*} {A : ι → Type*} [∀ i, Field (A i)] [∀ i, CharZero (A i)]
    (D : ∀ i, A i → A i) (hD : ∀ i (x : A i), x ≠ 0 → x ≠ 1 → D i x⁻¹ = - D i x) :
    etaleDilog D (fun _ => -1) = 0 := by sorry
-- TEST etaleDilog_zero_algebra: the empty product (zero algebra).
example {A : Empty → Type*} [∀ i, Field (A i)] (D : ∀ i, A i → A i) (z : ∀ i, A i) :
    etaleDilog D z = 0 := by sorry

/-! ## D.1 — normalisation dictionary: the Bernoulli convention

The modified polylogarithm `L^mod_n = Σ_j (B_j/j!) Li_{n-j} log^j` uses `B_1 = −1/2`; for
`n = 2` it is `Li_2 − ½ log·Li_1 = D`. Mathlib's `bernoulli` has this convention
(`bernoulli'` has `B_1 = +1/2` and would give the wrong function). -/

-- PadicHodgeRegulators:D.1/regulator-normalisation-dictionary (convention check):
-- the formula uses Mathlib's `bernoulli` (bernoulli 1 = −1/2), not `bernoulli'`.

/-! ## D.5 — Frobenius-eigenvector algebra of the curve regulator -/

section CupTrace
variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- If the cup-product form is a `q`-similitude for `φ` and `φ v = γ v`, then pairing against
`v` turns `φ` into multiplication by `q/γ`. -/
theorem cupTrace_eigen (B : LinearMap.BilinForm K V) (φ : V →ₗ[K] V) (q γ : K)
    (hφ : ∀ a b, B (φ a) (φ b) = q * B a b) (hγ : γ ≠ 0) (v : V) (hv : φ v = γ • v) (a : V) :
    B (φ a) v = (q / γ) * B a v := by sorry

/-- The canonical and normalised curve regulators differ by `1 − φ/q²`; on a
`φ`-eigenvector of eigenvalue `γ` the pairing changes by `1 − 1/(qγ)`. -/
theorem regSynCan_pairing_eigen (B : LinearMap.BilinForm K V) (φ : V →ₗ[K] V) (q γ : K)
    (hφ : ∀ a b, B (φ a) (φ b) = q * B a b) (hq : q ≠ 0) (hγ : γ ≠ 0) (v : V)
    (hv : φ v = γ • v) (x : V) :
    B (x - (q ^ 2)⁻¹ • φ x) v = (1 - 1 / (q * γ)) * B x v := by sorry

end CupTrace

-- TEST regulator_eigen_compat: `regSynCan_pairing_eigen` with q = p is the factor
-- (1 − 1/(pγ)) of PadicHodgeRegulators:D.5/curve-etale-comparison.
example {V : Type*} [AddCommGroup V] [Module ℚ V] (B : LinearMap.BilinForm ℚ V)
    (φ : V →ₗ[ℚ] V) (hφ : ∀ a b, B (φ a) (φ b) = 5 * B a b) (v : V) (hv : φ v = (2 : ℚ) • v)
    (x : V) : B (x - ((5 : ℚ) ^ 2)⁻¹ • φ x) v = (9 / 10) * B x v := by sorry

end TauCeti.PadicHodgeRegulators

/-! ## Commented contracts

The objects below need carriers that the pinned libraries do not contain (period rings and
the Bloch–Kato maps, K-theory with coefficients, syntomic cohomology, (φ,Γ)-modules,
Iwasawa cohomology). Each contract records the packet's declaration, API and unit-test names
with their statements; a contributor turns them into Lean once the supplier carriers exist. -/

-- COMPARISON PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions: Hodge–Tate, twist and period conventions for the regulator
-- COMPARISON PadicHodgeRegulators:L0/fundamental-exact-sequences: The fundamental exact sequences used by the Bloch–Kato maps
-- COMPARISON PadicHodgeRegulators:L0/integral-period-interface: Integral comparison interface for small weights
/- CONTRACT PadicHodgeRegulators:L1/bloch-kato-subgroups (definition): The Bloch–Kato local conditions H¹_e, H¹_f, H¹_g
   DECLARATION blochKatoF
   API blochKatoE [data]
     blochKatoE K V : Submodule ℚ_p (H^1(K, V)).
   API blochKatoF [data]
     blochKatoF K V : Submodule ℚ_p (H^1(K, V)).
   API blochKatoG [data]
     blochKatoG K V : Submodule ℚ_p (H^1(K, V)).
   API blochKatoE_le_F [relation]
     blochKatoE K V ≤ blochKatoF K V ≤ blochKatoG K V.
   API blochKatoF_lattice [constructor]
     blochKatoF K T := preimage under H^1(K, T) → H^1(K, V); blochKatoF K (V/T) := image.
   API blochKatoF_map [functoriality]
     For a G_K-map V → V', H^1(K, V) → H^1(K, V') maps blochKatoF into blochKatoF (same for e,
     g).
   API blochKatoF_res [functoriality]
     For L/K finite, restriction maps blochKatoF K V into blochKatoF L V and corestriction maps
     back.
   API blochKatoF_unramified [compatibility]
     For ℓ ≠ p, blochKatoF := H^1_ur.
   TEST blochKatoF_trivial [computation]
     For V = Q_p and K = Q_p, blochKatoF = H^1_ur(Q_p, Q_p) = Hom(Gal(Q_p^ur/Q_p), Q_p), of
     dimension 1, while H^1(Q_p, Q_p) has dimension 2.
   TEST blochKatoF_negative_twist [degenerate]
     For V = Q_p(−1), H^1_e = H^1_f = H^1_g = 0 although H^1(K, Q_p(−1)) has dimension [K :
     Q_p].
   TEST blochKatoF_rubin_compat [compatibility]
     For V = Q_p(1), blochKatoF agrees with Rubin's U_{L,v} ⊗ Φ condition (Euler Systems,
     §I.6.3, (7)) and with the Kummer image of the completed units.
   TEST blochKatoG_not_all [non-example]
     For V = Q_p, H^1_g(K, Q_p) = H^1_f(K, Q_p) ≠ H^1(K, Q_p): the de Rham condition is a proper
     subspace (the ramified homomorphisms are excluded).
-/

/- CONTRACT PadicHodgeRegulators:L1/bloch-kato-exponential (construction): The Bloch–Kato exponential
   DECLARATION blochKatoExp
   API blochKatoExp [data]
     blochKatoExp K V : D_dR(V) ⧸ Fil^0 →ₗ[ℚ_p] H^1(K, V).
   API blochKatoExp_range [characterisation]
     LinearMap.range (blochKatoExp K V) = blochKatoE K V.
   API blochKatoExp_ker [characterisation]
     ker (blochKatoExp K V) = image of D_cris(V)^{φ=1} in D_dR(V)/Fil^0.
   API blochKatoExp_injective_iff [characterisation]
     blochKatoExp K V is injective iff D_cris(V)^{φ=1} = H^0(K, V).
   API blochKatoExp_cocycle [simp]
     blochKatoExp K V x is represented by g ↦ (g − 1)b for b ∈ B_e ⊗ V lifting x.
   API blochKatoExp_map [functoriality]
     Natural in V for G_K-equivariant maps of de Rham representations.
   API blochKatoExp_f_sequence [relation]
     The exact sequence 0 → H^0 → D_cris → D_cris ⊕ D_dR/Fil^0 → H^1_f → 0.
   TEST blochKatoExp_twist_two [computation]
     For K = Q_p and V = Q_p(2), blochKatoExp is an isomorphism Q_p·e_2 ≅ H^1(Q_p, Q_p(2)) ≅
     Q_p.
   TEST blochKatoExp_trivial [degenerate]
     For V = Q_p, D_dR(Q_p)/Fil^0 = 0, so blochKatoExp = 0 and H^1_e(K, Q_p) = 0.
   TEST blochKatoExp_kummer [compatibility]
     For V = Q_p(1) and u ∈ 1 + p^c O_K (c > 1/(p − 1)), blochKatoExp(log u · e_1) = κ(u), the
     Kummer class (Bloch–Kato 3.10.1).
   TEST blochKatoExp_not_onto_f [non-example]
     For V = Q_p(1), H^1_e = H^1_f has dimension [K : Q_p] but H^1(K, Q_p(1)) has dimension [K :
     Q_p] + 1: the exponential does not reach the valuation direction.
-/

/- CONTRACT PadicHodgeRegulators:L1/bloch-kato-logarithm (construction): The Bloch–Kato logarithm
   DECLARATION blochKatoLog
   API blochKatoLog [data]
     blochKatoLog K V : blochKatoE K V →ₗ[ℚ_p] D_dR(V) ⧸ Fil^0 (under the injectivity
     hypothesis).
   API blochKatoLog_exp [simp]
     blochKatoLog (blochKatoExp x) = x.
   API blochKatoExp_log [simp]
     blochKatoExp (blochKatoLog y) = y for y ∈ blochKatoE K V.
   API blochKatoLog_twist [equivalence]
     For r ≥ 2, blochKatoLog K (ℚ_p(r)) : H^1(K, ℚ_p(r)) ≃ₗ K·e_r.
   API blochKatoLog_kummer [compatibility]
     For r = 1 and u ∈ 𝒪_Kˣ, blochKatoLog (κ u) = log_p u · e_1.
   API blochKatoLog_map [functoriality]
     Natural for G_K-maps between representations satisfying the hypothesis.
   TEST blochKatoLog_principal_unit [computation]
     For K = Q_p (p odd), blochKatoLog (κ(1 + p)) = log(1 + p)·e_1 = (p − p²/2 + p³/3 − …)·e_1.
   TEST blochKatoLog_teichmuller [degenerate]
     For a Teichmüller unit ω, blochKatoLog (κ ω) = 0 (κ(ω) is torsion in H^1(K, Z_p(1)) and
     log_p(ω) = 0).
   TEST blochKatoLog_coleman_compat [compatibility]
     blochKatoLog ∘ κ = ColemanIntegration's Iwasawa logarithm on 𝒪_Kˣ
     (ColemanIntegration:L0/iwasawa-logarithm).
   TEST blochKatoLog_not_defined_trivial [non-example]
     For V = Q_p, D_cris^{φ=1} = Q_p = H^0 but D_dR/Fil^0 = 0 and H^1_e = 0, so blochKatoLog has
     zero source: H^1_f(K, Q_p) ≠ 0 is not in its domain.
-/

/- CONTRACT PadicHodgeRegulators:L1/dual-exponential (construction): Kato's dual exponential
   DECLARATION dualExp
   API dualExp [data]
     dualExp K V : H^1(K, V) →ₗ[ℚ_p] Fil^0 D_dR(V).
   API dualExp_ker [characterisation]
     ker (dualExp K V) = blochKatoG K V.
   API dualExp_adjoint [characterisation]
     deRhamPairing x (dualExp K V y) = tatePairing (blochKatoExp K V^*(1) x) y.
   API dualExp_formula [simp]
     dualExp K V is H^1(K, V) → H^1(K, B_dR^+ ⊗ V) ≅ Fil^0 D_dR(V) via ∪ log χ.
   API dualExp_map [functoriality]
     Natural in V; compatible with corestriction and trace (L1/twist-and-change-of-field).
   TEST dualExp_trivial_log_chi [computation]
     For K = Q_p and V = Q_p, dualExp (log χ) = 1.
   TEST dualExp_positive_twist [degenerate]
     For V = Q_p(r) with r ≥ 1, dualExp = 0.
   TEST dualExp_adjoint_compat [compatibility]
     For V = Q_p and x ∈ D_dR(Q_p(1))/Fil^0 = K·e_1: [x, dualExp y] = ⟨exp_{Q_p(1)}(x), y⟩,
     matching the Kummer/local class field theory pairing.
   TEST dualExp_kernel_not_f [non-example]
     For V = Q_p(1), ker dualExp = H^1_g = H^1 ≠ H^1_f: the kernel is H^1_g, not H^1_f.
-/

-- THEOREM PadicHodgeRegulators:L1/dimension-formulas: Dimensions of the Bloch–Kato subspaces
-- THEOREM PadicHodgeRegulators:L1/local-duality-of-conditions: Local duality of the Bloch–Kato conditions
-- LEMMA PadicHodgeRegulators:L1/twist-and-change-of-field: Twists, restriction and corestriction for the Bloch–Kato maps
-- THEOREM PadicHodgeRegulators:L1/tate-twist-examples: The Bloch–Kato conditions for Tate twists
-- COMPARISON PadicHodgeRegulators:L1/abelian-variety-logarithm: The Bloch–Kato logarithm of Kummer classes of abelian varieties
-- THEOREM PadicHodgeRegulators:L1/integral-logarithm-unramified: The integral Bloch–Kato logarithm for unramified fields
/- CONTRACT PadicHodgeRegulators:L1/semilocal-bloch-kato (construction): Semilocal Bloch–Kato maps
   DECLARATION semilocalBlochKatoExp
   API semilocalBlochKatoF [data]
     semilocalBlochKatoF A V : Submodule ℚ_p (⨁ v, H^1(K_v, V)).
   API semilocalBlochKatoExp [constructor]
     semilocalBlochKatoExp A V := ⨁ v, blochKatoExp K_v V.
   API semilocalBlochKatoLog [constructor]
     The componentwise logarithm on ⨁ v, blochKatoE K_v V.
   API semilocal_shapiro [compatibility]
     Under Shapiro's isomorphism, semilocalBlochKatoExp A V = blochKatoExp ℚ_p (Ind_A V).
   API semilocal_prod [simp]
     For A = A' × A'', the semilocal maps are the direct sums of those of A' and A''.
   TEST semilocal_split_quadratic [computation]
     For F = Q(√2), p = 7: dim_{Q_7} semilocalBlochKatoF (F ⊗ Q_7) Q_7(1) = 2.
   TEST semilocal_zero_algebra [degenerate]
     For A = 0 all semilocal groups are 0.
   TEST semilocal_field_compat [compatibility]
     For A = K a field, the semilocal maps are the local maps of L1.
   TEST semilocal_not_product_conditions [non-example]
     The semilocal H^1_f of Q_p(1) for A = Q_p × Q_p is not H^1_f(Q_p, Q_p(1) ⊕ Q_p(1)) computed
     with the diagonal Galois action of a single factor: the summands are indexed by the factors
     of A.
-/

/- CONTRACT PadicHodgeRegulators:L2/fontaine-iwasawa-map (construction): Fontaine's isomorphism h_Iw : D(T)^{ψ=1} ≅ H¹_Iw
   DECLARATION fontaineIwasawaEquiv
   API fontaineIwasawaEquiv [data]
     fontaineIwasawaEquiv T : D(T)^{ψ=1} ≃ₗ[Λ] H1Iw T.
   API fontaineIwasawaEquiv_pr [characterisation]
     pr_n (fontaineIwasawaEquiv T y) is the class of the explicit cocycle of (b).
   API fontaineIwasawaEquiv_cor [relation]
     cor ∘ pr_{n+1} = pr_n; pr_0 = cor ∘ pr_1.
   API fontaineIwasawaEquiv_rat [compatibility]
     The rationalisation is independent of T ⊂ V.
   API fontaineIwasawaEquiv_torsion [characterisation]
     Torsion of D(V)^{ψ=1} = V^{H_{Q_p}} ↦ torsion of H1Iw V.
   API H1Iw_noZpTorsion [other]
     H1Iw T has no ℤ_p-torsion.
   TEST fontaineIwasawa_trivial [computation]
     For V = Q_p, the class h(1) is nonzero and fixed by G_∞.
   TEST fontaineIwasawa_unramified_char [degenerate]
     For V = E(μ) with μ unramified nontrivial, H^1_Iw(Q_p, V) is torsion-free (Q_p(μ_{p^∞}) ∩
     Q_p^ur = Q_p).
   TEST fontaineIwasawa_cor_compat [compatibility]
     cor_{Q_p(μ_{p^2})/Q_p(μ_p)} ∘ pr_2 ∘ h = pr_1 ∘ h, matching SelmerIwasawaCohomology's
     inverse system.
   TEST fontaineIwasawa_not_D_itself [non-example]
     h is defined on D(T)^{ψ=1}, not on D(T)^{φ=1}: for V = Q_p(1), (1 + π)/π ⊗ e_1 lies in
     D^{ψ=1} but not in D^{φ=1}.
-/

-- LEMMA PadicHodgeRegulators:L2/generator-independence: Independence of the generator of Γ
-- COMPARISON PadicHodgeRegulators:L2/root-change: Changing the compatible system of roots of unity
/- CONTRACT PadicHodgeRegulators:L2/local-iwasawa-twist (construction): Twisting local Iwasawa cohomology by characters of G_∞
   DECLARATION iwasawaTwist
   API iwasawaTwist [data]
     iwasawaTwist η : H1Iw T ≃+ H1Iw (T(η)).
   API iwasawaTwist_smul [relation]
     iwasawaTwist η (λ • x) = Tw_η(λ) • iwasawaTwist η x.
   API iwasawaTwist_one [simp]
     iwasawaTwist 1 = id.
   API iwasawaTwist_mul [relation]
     iwasawaTwist η ∘ iwasawaTwist η' = iwasawaTwist (η * η').
   API iwasawaTwist_pr_finite [characterisation]
     For ω of finite order trivial on level n, pr_n ∘ iwasawaTwist ω = (· ⊗ e_ω) ∘ pr_n.
   API iwasawaTwist_eq_shapiro [compatibility]
     For η = χ^j, iwasawaTwist agrees with the Shapiro-lemma twist of SelmerIwasawaCohomology.
   TEST iwasawaTwist_inverse [computation]
     iwasawaTwist η⁻¹ (iwasawaTwist η x) = x.
   TEST iwasawaTwist_trivial [degenerate]
     iwasawaTwist 1 x = x.
   TEST iwasawaTwist_level_cyclotomic [compatibility]
     For η = χ^j and n ≥ 1, pr_n(Tw_{χ^j}x) ≡ pr_n(x) ∪ ε_n^{⊗j} modulo p^n.
   TEST iwasawaTwist_not_linear [non-example]
     iwasawaTwist χ is not Λ-linear: iwasawaTwist χ (σ • x) = χ(σ)^{−1} σ • iwasawaTwist χ x ≠ σ
     • iwasawaTwist χ x for χ(σ) ≠ 1.
-/

-- COMPARISON PadicHodgeRegulators:L2/twist-compatibility: Compatibility of h_Iw with twists
-- THEOREM PadicHodgeRegulators:L2/wach-psi-fixed-vectors: Berger: ψ-fixed vectors lie in the Wach module
/- CONTRACT PadicHodgeRegulators:L2/character-specialisation (construction): Specialisation of Iwasawa classes at characters
   DECLARATION charSpecialization
   API charSpecialization [data]
     charSpecialization η : H1Iw T →ₗ[O_E] H^1(ℚ_p, T(η⁻¹)).
   API charSpecialization_smul [relation]
     charSpecialization η (λ • x) = η(λ) • charSpecialization η x.
   API charSpecialization_fontaine [characterisation]
     charSpecialization η (h y) = cor (pr_n (h (y ⊗ e_{−j} ⊗ e_{ω⁻¹}))) for n ≥ max(m,1).
   API charSpecialization_descent [relation]
     The descent exact sequence (c).
   TEST charSpecialization_trivial [computation]
     charSpecialization 1 = pr_0.
   TEST charSpecialization_zero [degenerate]
     charSpecialization η 0 = 0.
   TEST charSpecialization_level_independence [compatibility]
     For ω of conductor p, the formula of (b) gives the same class for n = 1 and n = 2.
   TEST charSpecialization_not_equivariant [non-example]
     charSpecialization χ is not Λ-linear into a Λ-module: σ_{−1} acts on the target through
     χ(σ_{−1}) = −1.
-/

-- COMPARISON PadicHodgeRegulators:L2/lattice-and-coefficient-squares: Lattice and coefficient-change squares
-- COMPARISON PadicHodgeRegulators:L2/kummer-coleman-comparison: Kummer classes and Coleman power series
-- LEMMA PadicHodgeRegulators:D.1/teichmuller-unit-decomposition: Teichmüller decomposition of the units of a local field
-- LEMMA PadicHodgeRegulators:D.1/unramified-frobenius-on-roots: Frobenius on the roots of unity of an unramified field
/- CONTRACT PadicHodgeRegulators:D.1/etale-algebra-dilogarithm (construction): Coleman's p-adic dilogarithm on a finite étale Q_p-algebra
   API etaleDilog_field [compatibility]
     For a finite field extension M ⊂ C_p of Q_p and x ∈ M ∖ {0,1}, etaleDilog M x = D^0(x),
     Coleman's D for the Iwasawa branch.
   TEST etaleDilog_teichmuller_two_mod [computation]
     For p = 5 and ω = TauCeti.teichmuller Q_5 2 (a primitive 4th root of unity), etaleDilog Q_5
     ω ∈ 25·Z_5 and etaleDilog Q_5 ω ≡ 25 mod 125 (by D.3/finite-polylogarithm-reduction, since
     li_{2,5}(2) = 1 in F_5); this is the Q_5-component of D_5(ζ_24) in GSWZ (273).
   TEST etaleDilog_diag [compatibility]
     For the diagonal Q_p → Q_p × Q_p and x ∉ {0,1}, etaleDilog (Q_p × Q_p) (x, x) = (D^0(x),
     D^0(x)), agreeing with ColemanIntegration's D^0.
   TEST etaleDilog_not_branch_one [non-example]
     With the branch log_1 (log_1(p) = 1) instead of the Iwasawa branch, D^1(p) − D^0(p) =
     ½·log_p(1 − p) ≠ 0 (ColemanIntegration:L2/dilogarithm-identities (d)); a definition with an
     unpinned branch is wrong at z = p ∈ Q_p^adm.
-/

-- LEMMA PadicHodgeRegulators:D.1/dilogarithm-scalar-extension: Frobenius and extension-of-scalars squares for the p-adic dilogarithm
/- CONTRACT PadicHodgeRegulators:D.1/combined-dilogarithm (construction): The combined p-adic dilogarithm of a number field
   DECLARATION blochDilog
   API combinedDilog [data]
     combinedDilog K p : FreeAbelianGroup Kˣ →+ K ⊗[ℚ] ℚ_[p], with [1] ↦ 0.
   API combinedDilog_of [simp]
     combinedDilog K p [z] = etaleDilog (K ⊗ ℚ_[p]) (z ⊗ 1).
   API combinedDilog_component [projection]
     Under K ⊗ Q_p ≅ ∏_{v|p} K_v, the v-component of combinedDilog K p [z] is D^0(σ_v z).
   API combinedDilog_fiveTerm [relation]
     combinedDilog vanishes on the five-term subgroup, giving preBlochDilog K p : P(K) →+ K ⊗
     Q_p.
   API blochDilog [constructor]
     blochDilog K p : B(K) →+ K ⊗ Q_p, the restriction of preBlochDilog to Suslin's Bloch group.
   API blochDilog_branch_indep [characterisation]
     For any branch parameter a ∈ Q_p, the Bloch-group map built from D^a equals blochDilog K p.
   API blochDilog_map [functoriality]
     For a field embedding K → K', blochDilog K' p ∘ B(ι) = (ι ⊗ 1) ∘ blochDilog K p.
   API blochDilog_galois [functoriality]
     For τ ∈ Aut(K), blochDilog K p ∘ B(τ) = (τ ⊗ 1) ∘ blochDilog K p.
   TEST combinedDilog_rat [compatibility]
     For K = Q, combinedDilog Q p [z] = D^0(z) ∈ Q_p, the ColemanIntegration value.
   TEST combinedDilog_zero [degenerate]
     combinedDilog K p 0 = 0, and blochDilog vanishes on the subgroup generated by [x] + [x⁻¹]
     for x ≠ 0, 1.
   TEST blochDilog_cubic_five [computation]
     For K = Q(α), α³ − α² + 1 = 0, ξ = 2[1 − α²] + [1 − α] ∈ B(K) and p = 5, blochDilog K 5 ξ =
     (3·5² + 5³ + 2·5⁴ + …)α² + (5² + 3·5³ + …)α + (2·5² + 3·5³ + …), GSWZ (271).
   TEST combinedDilog_not_on_bloch_branch [non-example]
     On the pre-Bloch group the map depends on the branch: for p odd the symbol [p] ∈ P(Q) has
     D^1([p]) − D^0([p]) = ½·log_p(1 − p) ≠ 0, so branch independence is not asserted off B(K)
     ([p] ∉ B(Q) since p ∧ (1 − p) ≠ 0).
-/

-- COMPARISON PadicHodgeRegulators:D.1/regulator-normalisation-dictionary: Dictionary of dilogarithm and regulator normalisations
-- LEMMA PadicHodgeRegulators:D.1/unit-logarithm-kernel: Kernel of the logarithm on local units and the p-adic regulator matrix
-- LEMMA PadicHodgeRegulators:D.1/logarithm-norm-trace: The logarithm takes norms to traces
/- CONTRACT PadicHodgeRegulators:D.2/etale-regulator (construction): Soulé's étale regulator to continuous Galois cohomology
   DECLARATION etaleRegulator
   API etaleRegulator [data]
     etaleRegulator F p n : K_{2n−1}(F) →+ H^1(F, ℤ_p(n)).
   API etaleRegulator_completed [constructor]
     The factorisation through K_{2n−1}(F; ℤ_p), a ℤ_[p]-linear map.
   API etaleRegulator_one [compatibility]
     For n = 1, etaleRegulator F p 1 is the Kummer map F^× → H^1(F, ℤ_p(1)).
   API etaleRegulator_map [functoriality]
     For a field embedding F → F', res ∘ etaleRegulator F = etaleRegulator F' ∘ K_{2n−1}(ι).
   API etaleRegulator_transfer [functoriality]
     For F'/F finite, cor ∘ etaleRegulator F' = etaleRegulator F ∘ N_{F'/F} (transfer).
   API etaleRegulator_local_equiv [equivalence]
     For F/ℚ_p finite and n ≥ 2, the completed map is the isomorphism of
     KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1.
   API etaleRegulator_completion [compatibility]
     For a number field F and v | p, res_v ∘ etaleRegulator F = etaleRegulator F_v ∘ c_v.
   TEST etaleRegulator_kummer [compatibility]
     For F = Q_p, n = 1 and u ∈ Z_p^×, etaleRegulator F p 1 u is the image of u under lim_ν of
     Tau Ceti's kummerClassMap.
   TEST etaleRegulator_rank_q5 [computation]
     For F = Q_5, n = 2, the completed etaleRegulator is a ℤ_5-linear isomorphism between free
     modules of rank 1.
   TEST etaleRegulator_torsion_Q [degenerate]
     For F = Q and n = 2, K_3(Q) ≅ Z/48 is torsion, so the image of etaleRegulator Q p 2 lies in
     the torsion of H^1(Q, Z_p(2)) and its rationalisation is 0.
   TEST etaleRegulator_not_basis_functional [non-example]
     For F = Q_{p²} and p > 3, a ℤ_p-isomorphism K_3(F; ℤ_p) ≅ ℤ_p² chosen from bases is not
     etaleRegulator: etaleRegulator commutes with the Frobenius automorphism of F, while a
     generic basis isomorphism does not.
-/

/- CONTRACT PadicHodgeRegulators:D.2/rigid-syntomic-cohomology (definition): Rigid syntomic cohomology of smooth schemes over a p-adic integer ring
   DECLARATION rigidSyntomicCohomology
   API rigidSyntomicCohomology [data]
     rigidSyntomicCohomology X n i : the K_0-vector space H^i_syn(X, n).
   API rigidSyntomicCohomology_map [functoriality]
     A morphism of smooth R-schemes X → Y induces H^i_syn(Y, n) → H^i_syn(X, n), with map_id and
     map_comp.
   API rigidSyntomic_long_exact [relation]
     The long exact sequence … → H^{i−1}_rig(X_k/K_0) ⊕ Fil^n H^{i−1}_dR → H^{i−1}_rig(X_k/K) ⊕
     H^{i−1}_rig(X_k/K_0) → H^i_syn(X, n) → … .
   API rigidSyntomic_spec_eta [equivalence]
     η : H^1_syn(Spec R, n) ≃ K for n ≥ 1.
   API rigidSyntomic_spec_vanish [characterisation]
     H^i_syn(Spec R, n) = 0 for i ≠ 1 and n ≥ 1.
   API rigidSyntomic_independent [other]
     Independence of the syntomic data up to canonical isomorphism.
   TEST rigidSyntomic_zp_two [computation]
     For R = Z_p, H^1_syn(Spec Z_p, 2) ≅ Q_p via η, and, with Huber–Kings' cone map (a, b) ↦ (a
     − b, (1 − Φ/p^n)b), the class of (0, c) with c ∈ Q_p maps to (1 − 1/p²)^{−1}c.
   TEST rigidSyntomic_weight_zero [degenerate]
     For n = 0 and X = Spec R, H^0_syn(Spec R, 0) ≅ Q_p (the kernel of 1 − σ on K_0 is Q_p) and
     the η-isomorphism of the n ≥ 1 case does not hold.
   TEST rigidSyntomic_monsky_washnitzer [compatibility]
     For X smooth affine, the rigid terms are Monsky–Washnitzer cohomology of the dagger algebra
     (PadicDifferentialEquationsAndRigidCohomology:RD.4/monsky-washnitzer-comparison).
   TEST rigidSyntomic_not_de_rham [non-example]
     H^1_syn(Spec R, n) is not Fil^n H^0_dR(K) (which is 0 for n ≥ 1): the syntomic group sees
     the cone, not the filtration step.
-/

/- CONTRACT PadicHodgeRegulators:D.2/syntomic-regulator (construction): Besser's syntomic regulator
   DECLARATION syntomicRegulator
   API syntomicChernClass [data]
     syntomicChernClass X i j : K_j(X) →+ H^{2i−j}_syn(X, i).
   API syntomicRegulator [constructor]
     syntomicRegulator R n := η ∘ syntomicChernClass (Spec R) n (2n−1) : K_{2n−1}(R) →+ K.
   API syntomicRegulator_one [compatibility]
     syntomicRegulator R 1 u = log_p u for u ∈ Rˣ (Iwasawa branch).
   API syntomicRegulator_baseChange [functoriality]
     For a finite extension R → R' with fraction fields K ⊂ K', syntomicRegulator R' n ∘ K(ι) =
     ι ∘ syntomicRegulator R n.
   API syntomicRegulator_aut [functoriality]
     For an automorphism τ of R, syntomicRegulator R n ∘ K(τ) = τ ∘ syntomicRegulator R n.
   API syntomicChernClass_deRham [characterisation]
     The image of the universal class in Fil^i H^{2i}_dR(B_•GL_N) is the de Rham Chern class.
   TEST syntomicRegulator_log [computation]
     For R = Z_p (p odd) and u = 1 + p, syntomicRegulator Z_p 1 u = log(1 + p) = p − p²/2 + p³/3
     − … .
   TEST syntomicRegulator_teichmuller_one [degenerate]
     For n = 1 and u a Teichmüller unit, syntomicRegulator R 1 u = 0.
   TEST syntomicRegulator_cyclotomic [compatibility]
     For R = Z_p[ζ_m] with p ∤ m and ζ ≠ 1, syntomicRegulator R 2 [ζ]_2 = ±Li_2(ζ), the value of
     ColemanIntegration:L3/syntomic-regulator-of-cyclotomic-elements at n = 2.
   TEST syntomicRegulator_not_gros [non-example]
     For R = Z_p, the Gros normalisation (1 − Frob/p²)·syntomicRegulator differs from
     syntomicRegulator by the factor 1 − p^{−2} ≠ 1, so the two are not interchangeable in
     integrality statements.
-/

-- THEOREM PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison: The syntomic regulator is the Bloch–Kato logarithm of the étale regulator
-- THEOREM PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison: Besser–de Jeu: the weight-two regulator is Coleman's dilogarithm on special units
-- THEOREM PadicHodgeRegulators:D.2/higher-weight-polylogarithm-comparison: Besser–de Jeu: the syntomic regulator in higher weight
-- COMPARISON PadicHodgeRegulators:D.2/gros-normalisation: Gros's normalisation of the syntomic regulator
/- CONTRACT PadicHodgeRegulators:D.2/log-syntomic-complex (definition): Log-syntomic complexes S_n(r)
   DECLARATION logSyntomicComplex
   API logSyntomicComplex [data]
     logSyntomicComplex X r n : the complex RΓ_syn(X, r)_n of Z/p^n-modules.
   API logSyntomicSheaf [data]
     S_n(r)_X on X_{0,ét}, with RΓ(X_{0,ét}, S_n(r)_X) ≃ logSyntomicComplex X r n.
   API logSyntomicComplex_reduction [relation]
     logSyntomicComplex X r n ≃ logSyntomicCompleted X r ⊗^L Z/p^n.
   API logSyntomicComplex_rational [equivalence]
     logSyntomicCompleted X r ⊗ Q ≃ Cone(1 − φ_r)[−1] on rational log-crystalline cohomology.
   API logSyntomicComplex_map [functoriality]
     Morphisms of fs log-smooth O_K^×-schemes induce maps, with map_id and map_comp; base change
     along O_K → O_{K'}.
   API logSyntomicComplex_product [structure]
     Cup products S_n(r) ⊗ S_n(s) → S_n(r + s).
   TEST logSyntomic_point_weight_two [computation]
     For X = Spec O_K (log structure of the closed point), r = 2: H^1(logSyntomicCompleted X 2)
     is p^{N}-isomorphic to O_K and H^2 to 0.
   TEST logSyntomic_weight_zero [degenerate]
     For r = 0, J^{[0]} = O and S_n(0) is the fibre of 1 − φ on A_{cr,n}; on X = Spec O_K its
     H^0 is Z/p^n.
   TEST logSyntomic_rigid_compat [compatibility]
     For X smooth over O_K with trivial horizontal log structure and K unramified, the rational
     complex agrees with D.2/rigid-syntomic-cohomology (both compute the fibre of 1 − φ_r
     against the Hodge filtration).
   TEST logSyntomic_not_naive_twist [non-example]
     With the untwisted Z/p^n(r) the period map of D.2/fontaine-messing-kato-period-map does not
     have bounded kernel uniformly in r; Colmez–Nizioł's comparison needs the twist Z_p(r)' =
     p^{−a(r)}Z_p(r).
-/

/- CONTRACT PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map (construction): The Fontaine–Messing–Kato period morphism
   DECLARATION fmkPeriodMap
   API fmkPeriodMap [data]
     fmkPeriodMap X r n : S_n(r)_X ⟶ i^* Rj_* (ℤ/p^n)(r)'_{X_tr} in the derived category of
     étale sheaves on X_0.
   API fmkPeriodMap_local [characterisation]
     On an affine small chart Spf R it is the composite of the Poincaré-lemma and fundamental-
     sequence quasi-isomorphisms.
   API fmkPeriodMap_mul [structure]
     fmkPeriodMap is compatible with cup products S_n(r) ⊗ S_n(s) → S_n(r + s).
   API fmkPeriodMap_reduction [relation]
     Compatible with the reduction maps n → n − 1 and with the completed versions.
   API fmkPeriodMap_degree_one [example]
     For r = 1 on X = Spec O_K, it sends the syntomic class of u ∈ O_K^× to the Kummer class of
     u.
   TEST fmk_kummer [computation]
     For X = Spec Z_p, r = 1, n = 1 and u = 1 + p, the image of the syntomic class of u is the
     Kummer class of 1 + p in H^1(Q_p, μ_p).
   TEST fmk_weight_zero [degenerate]
     For r = 0, α^FM_{0,n} is the identification of S_n(0) with i^*Rj_*Z/p^n in degree 0 (both
     are Z/p^n on a connected X).
   TEST fmk_twist_normalisation [compatibility]
     For r < p − 1, a(r) = 0 and Z_p(r)' = Z_p(r), so the Colmez–Nizioł and Nekovář–Nizioł
     normalisations coincide.
   TEST fmk_untwisted_fails [non-example]
     For r = p − 1, the plain sequence 0 → Z_p(r) → F^r A_cr → A_cr → 0 is not exact on the left
     term's image; Z_p(p−1)' = p^{−1}Z_p(p−1) is needed.
-/

-- THEOREM PadicHodgeRegulators:D.2/small-twist-comparison: Kato–Kurihara–Tsuji: the period map is an isomorphism for small twists
-- THEOREM PadicHodgeRegulators:D.2/syntomic-exponential: The syntomic exponential and the Bloch–Kato exponential
/- CONTRACT PadicHodgeRegulators:D.3/unramified-etale-algebra (definition): Finite unramified étale Q_p-algebras
   DECLARATION IsUnramifiedEtaleAlgebra
   API IsUnramifiedEtaleAlgebra [structure]
     IsUnramifiedEtaleAlgebra p L : L is a finite product of finite unramified field extensions
     of ℚ_[p] (data: the factor decomposition up to isomorphism).
   API unramifiedEtaleAlgebra_equiv_witt [equivalence]
     L ≃ₐ[ℚ_[p]] Localization.Away (p : WittVector p k) for k := O_L ⧸ p, a finite reduced 𝔽_p-
     algebra.
   API unramifiedEtaleAlgebra_rank [characterisation]
     Module.finrank ℚ_[p] L = Module.finrank (ZMod p) k.
   API unramifiedEtaleAlgebra_frobenius [data]
     The Frobenius φ_L : L ≃ₐ[ℚ_[p]] L induced by WittVector.frobenius on W(k); it fixes exactly
     ℚ_[p]^{#π_0} componentwise.
   API unramifiedEtaleAlgebra_prod [instance]
     Finite products of unramified étale algebras are unramified étale.
   API unramifiedEtaleAlgebra_tensor_padic [example]
     For a number field F and p unramified in F, F ⊗[ℚ] ℚ_[p] is unramified étale.
   TEST unramified_rank_cubic [computation]
     For F = Q(α), α³ − α² + 1 = 0 and p = 5, F ⊗ Q_5 is unramified étale of rank 3 with factors
     of residue degrees 2 and 1.
   TEST unramified_zero [degenerate]
     The zero algebra (empty product, k = 0) is unramified étale of rank 0.
   TEST unramified_witt_compat [compatibility]
     For k = F_q, the algebra W(F_q)[1/p] is the unramified extension Q_q of degree log_p q, and
     its Frobenius is Mathlib's WittVector.frobenius after inverting p.
   TEST unramified_not_qp_zeta_p [non-example]
     For p odd, Q_p(ζ_p) is finite étale but not unramified: its residue field is F_p while its
     degree is p − 1, so it is not of the form W(k)[1/p].
-/

/- CONTRACT PadicHodgeRegulators:D.3/completed-k3-unramified (construction): Completed K₃ of a finite unramified étale algebra
   DECLARATION completedK3
   API completedK3 [data]
     completedK3 p L := π_3 K(L; ℤ_p), a ℤ_[p]-module.
   API completedK3_prodEquiv [equivalence]
     completedK3 p (∏ i, L i) ≃ₗ[ℤ_[p]] ∏ i, completedK3 p (L i).
   API completedK3_integers_equiv [equivalence]
     completedK3 p O_L ≃ₗ[ℤ_[p]] completedK3 p L, induced by O_L → L.
   API completedK3_chernEquiv [equivalence]
     completedK3 p L ≃ₗ[ℤ_[p]] H^1(L, ℤ_p(2)), componentwise étale Chern class c_{2,1}.
   API completedK3_free [characterisation]
     For p > 3, Module.Free ℤ_[p] (completedK3 p L) and Module.finrank = [L : ℚ_[p]].
   API completedK3_map [functoriality]
     A ℚ_[p]-algebra map f : L → L' induces completedK3 p L → completedK3 p L', with map_id and
     map_comp; the Frobenius φ_L acts by functoriality.
   API completedK3_transfer [functoriality]
     For L → L' finite free, a transfer completedK3 p L' → completedK3 p L, corresponding to
     corestriction under the Chern isomorphisms.
   TEST completedK3_rank_cubic [computation]
     For p = 5 and L = Q_{25} × Q_5, completedK3 5 L is free of rank 3.
   TEST completedK3_zero [degenerate]
     completedK3 p 0 = 0 for the zero algebra.
   TEST completedK3_chern_compat [compatibility]
     For L = Q_p the Chern isomorphism agrees with KTheoryFiniteLocalFields:L.6/odd-completed-k-
     groups-are-h1 at i = 2.
   TEST completedK3_three_torsion [non-example]
     For p = 3, completedK3 3 Q_3 has torsion Z/3 (w_2^{(3)}(Q_3) = 3), so it is not free and no
     injective map to a torsion-free lattice exists.
-/

-- THEOREM PadicHodgeRegulators:D.3/completed-k3-bloch-description: Completed K₃ of an unramified field is the completed Bloch group
-- LEMMA PadicHodgeRegulators:D.3/finite-polylogarithm-reduction: Reduction of the p-adic dilogarithm at roots of unity
-- LEMMA PadicHodgeRegulators:D.3/dilogarithm-integrality: p²-integrality of the dilogarithm on special units
-- THEOREM PadicHodgeRegulators:D.3/residue-spanning: Dilogarithms of roots of unity span the residue space
/- CONTRACT PadicHodgeRegulators:D.3/root-of-unity-classes (construction): Root-of-unity classes in completed K₃
   DECLARATION rootClassK3
   API rootClassK3 [data]
     rootClassK3 L ζ : completedK3 p L, for ζ a root of unity of L with all components ≠ 1.
   API rootClassK3_eq_bloch [compatibility]
     rootClassK3 L ζ is the image of K3BlochGroups' rootClassPadic ζ under B(L) ⊗ ℤ_p →
     completedK3 p L.
   API rootClassK3_prod [simp]
     For L = ∏ L_i, rootClassK3 L ζ = (rootClassK3 L_i ζ_i)_i.
   API rootClassK3_map [functoriality]
     For a ℚ_p-algebra map f : L → L', completedK3 map sends rootClassK3 L ζ to rootClassK3 L'
     (f ζ); in particular φ_L(rootClassK3 ζ) = rootClassK3 (ζ^p).
   API rootClassK3_inv [relation]
     rootClassK3 L ζ⁻¹ = −rootClassK3 L ζ.
   API rootClassK3_mul_ord [relation]
     ord(ζ) • rootClassK3 L ζ is the image of the integral Bloch element m[ζ].
   TEST rootClassK3_neg_one [computation]
     For p > 3, rootClassK3 Q_p (−1) = 0.
   TEST rootClassK3_order_two_product [degenerate]
     For L = Q_p × Q_p and ζ = (−1, −1), rootClassK3 L ζ = 0, the product of two zero classes.
   TEST rootClassK3_bloch_compat [compatibility]
     When ζ ∧ (1 − ζ) = 0 in Suslin's antisymmetric square (K3BlochGroups:V.6/root-of-unity-
     symbol), rootClassK3 L ζ is the image of [ζ] ∈ B(L).
   TEST rootClassK3_component_one [non-example]
     For p = 5, L = Q_{25} × Q_5 and ζ = ζ_24^4 (Q_5 component 1), the class is not defined: the
     raw symbol [1] is not a Bloch-group generator and D(1) is undefined (GSWZ E38).
-/

/- CONTRACT PadicHodgeRegulators:D.3/local-regulator (construction): The p-adic regulator on completed K₃
   DECLARATION localRegulator
   API localRegulator [data]
     localRegulator L : completedK3 p L →ₗ[ℤ_[p]] L.
   API localRegulator_eq_logBK [characterisation]
     localRegulator L = ε • (logBK ∘ chernEquiv) with ε = ±1 the pinned sign.
   API localRegulator_rootClass [simp]
     localRegulator L (rootClassK3 L ζ) = etaleDilog L ζ (= (Li_2(ζ_i))_i).
   API localRegulator_specialUnits [compatibility]
     On the image of a Bloch element Σ n_i [x_i] with x_i special units of O_L, localRegulator =
     Σ n_i etaleDilog L x_i.
   API localRegulator_map [functoriality]
     For a ℚ_p-algebra map f : L → L', localRegulator L' ∘ completedK3.map f = f ∘
     localRegulator L; in particular localRegulator commutes with φ_L.
   API localRegulator_transfer [functoriality]
     For L → L' finite free, localRegulator L ∘ transfer = Tr_{L'/L} ∘ localRegulator L'.
   API localRegulator_prod [simp]
     On L = ∏ L_i, localRegulator is the product of the factor regulators.
   TEST localRegulator_q5_root [computation]
     localRegulator Q_5 (rootClassK3 Q_5 (teichmuller 2)) ≡ 25 mod 125.
   TEST localRegulator_zero_algebra [degenerate]
     localRegulator 0 = 0.
   TEST localRegulator_syntomic_compat [compatibility]
     On the image of K_3(O_L), localRegulator = ε·syntomicRegulator (D.2/syntomic-regulator)
     with n = 2.
   TEST localRegulator_not_gros [non-example]
     For L = Q_5, the Gros-normalised map (1 − 5^{−2})·localRegulator sends rootClassK3
     (teichmuller 2) to a unit, so it is not localRegulator and does not have image 25Z_5.
-/

-- THEOREM PadicHodgeRegulators:D.3/unramified-regulator-theorem: The unramified p > 3 theorem
-- THEOREM PadicHodgeRegulators:D.3/roots-of-unity-generate: Completed K₃ is generated by roots of unity
/- CONTRACT PadicHodgeRegulators:D.4/global-p-adic-regulator (construction): The global p-adic K₃ regulator
   DECLARATION globalPadicRegulator
   API globalPadicRegulator [data]
     globalPadicRegulator F p : K_3(F) →+ F ⊗[ℚ] ℚ_[p].
   API globalPadicRegulator_component [projection]
     Its v-component is localRegulator F_v ∘ c_v.
   API globalPadicRegulator_torsion [simp]
     globalPadicRegulator F p x = 0 for every torsion x.
   API globalPadicRegulator_integral [characterisation]
     For 3 < p unramified in F, its range lies in p² • (𝓞_F ⊗ ℤ_p).
   API globalPadicRegulator_rat [constructor]
     The extension K_3(F) ⊗ ℚ →ₗ[ℚ] F ⊗ ℚ_[p].
   API globalPadicRegulator_galois [functoriality]
     For τ ∈ Aut(F), globalPadicRegulator F p ∘ K_3(τ) = (τ ⊗ 1) ∘ globalPadicRegulator F p.
   TEST globalPadicRegulator_rat_zero [computation]
     globalPadicRegulator ℚ p = 0, since K_3(ℚ) ≅ ℤ/48 is finite.
   TEST globalPadicRegulator_torsion_zero [degenerate]
     For F totally real, K_3(F) ⊗ Q = 0 (Borel: rank r_2 = 0), so globalPadicRegulator F p ⊗ Q =
     0.
   TEST globalPadicRegulator_bloch_compat [compatibility]
     For ξ ∈ K_3(F) whose Bloch image is presented by special units at p, globalPadicRegulator F
     p ξ = blochDilog F p (presentation) (D.4/special-unit-formula).
   TEST globalPadicRegulator_not_injective_claim [non-example]
     For F imaginary quadratic and p split, K_3(F) ⊗ Q has rank 1 while F ⊗ Q_p has rank 2;
     injectivity of globalPadicRegulator ⊗ Q is a separate proposition (D.4/padic-k3-regulator-
     injectivity), not a consequence of the ranks.
-/

-- THEOREM PadicHodgeRegulators:D.4/special-unit-formula: The global regulator on special-unit presentations
-- THEOREM PadicHodgeRegulators:D.4/norm-trace-compatibility: Restriction and transfer for the global regulator
-- THEOREM PadicHodgeRegulators:D.4/frobenius-compatibility: Frobenius compatibility of the p-adic regulator
-- THEOREM PadicHodgeRegulators:D.4/torsion-and-denominators: Torsion classes and controlled denominators
-- COMPARISON PadicHodgeRegulators:D.4/habiro-regulator-export: The regulator exported to Habiro-module gluing
/- CONTRACT PadicHodgeRegulators:D.4/padic-k3-regulator-injectivity (definition): The p-adic K₃ regulator injectivity proposition
   DECLARATION PadicK3RegulatorInjective
   API PadicK3RegulatorInjective [data]
     PadicK3RegulatorInjective F p : Prop := Function.Injective (globalPadicRegulator_rat F p).
   API padicK3RegulatorInjective_of_totallyReal [example]
     If F is totally real, PadicK3RegulatorInjective F p holds.
   API padicK3RegulatorInjective_iff_rank [characterisation]
     PadicK3RegulatorInjective F p ↔ the ℚ_p-span of the image has dimension r_2(F).
   API padicK3RegulatorInjective_baseChange [functoriality]
     For E/F finite, PadicK3RegulatorInjective E p implies PadicK3RegulatorInjective F p
     (restriction is injective rationally and compatible with D.4/norm-trace-compatibility).
   TEST injective_rat [computation]
     PadicK3RegulatorInjective ℚ p holds, since K_3(ℚ) ⊗ ℚ = 0.
   TEST injective_totally_real [degenerate]
     For F totally real (r_2 = 0) the source is zero and the proposition holds.
   TEST injective_rank_compat [compatibility]
     For F imaginary quadratic, the proposition is equivalent to D_{F,p}(ξ_0) ≠ 0 for a
     generator ξ_0 of K_3(F) modulo torsion.
   TEST injective_not_from_rank [non-example]
     The rank inequality r_2 ≤ [F : Q] does not imply the proposition: the image could lie in a
     smaller Q_p-subspace, and nothing in D.3 excludes this.
-/

-- APPLICATION PadicHodgeRegulators:D.4/example-cubic-field-five-two: GSWZ Example 4.3: the class of 5₂ at p = 5
/- CONTRACT PadicHodgeRegulators:D.5/curve-weight-two-target (definition): The weight-two syntomic target of a curve and its two identifications
   DECLARATION curveSyntomicTarget
   API curveSyntomicTarget [data]
     curveSyntomicTarget 𝒳 := H^2_syn(𝒳, 2).
   API curveSyntomicCanIso [equivalence]
     canIso 𝒳 : H1dR X ≃ₗ[K] curveSyntomicTarget 𝒳.
   API curveSyntomicNormIso [equivalence]
     normIso 𝒳 : curveSyntomicTarget 𝒳 ≃ₗ[K] H1dR X, equal to (1 − φ/q²)⁻¹ ∘ canIso⁻¹.
   API cupTrace [structure]
     cupTrace X : LinearMap.BilinForm K (H1dR X), alternating.
   API cupTrace_frob [relation]
     cupTrace (φ a) (φ b) = q • cupTrace a b.
   API cupTrace_res_sum [characterisation]
     For second-kind forms, cupTrace [dF] [dG] = Σ_x Res_x(F dG).
   TEST curveTarget_projective_line [computation]
     For 𝒳 = P^1_{O_K}, curveSyntomicTarget 𝒳 = 0.
   TEST curveTarget_weight_one_analogue [degenerate]
     In weight one for Spec O_K (i = n = 1), the normalised class of a unit u is log u while the
     canonical class is (1 − 1/q)·log u.
   TEST curveTarget_eigen_factor [compatibility]
     If φv = γv then B(φa, v) = (q/γ)B(a, v); for p = q = 5 and γ = 2, (1 − 1/(pγ)) = 9/10 is
     the factor between canonical and normalised pairings.
   TEST curveTarget_h2_non_example [non-example]
     For H^3_syn(𝒳, 1) the operator 1 − φ/q on H^2_rig(𝒳_k) is zero (φ = q there), so no
     normalised identification exists; Besser–de Jeu Definition 4.6 requires n ≥ i > dim.
-/

/- CONTRACT PadicHodgeRegulators:D.5/open-curve-splitting (construction): The Frobenius splitting for an open curve
   DECLARATION openCurveSplitting
   API openCurveSplitting [data]
     openCurveSplitting 𝒳 D : H1dR (Y) →ₗ[K] H1dR X.
   API openCurveSplitting_comp_res [simp]
     openCurveSplitting 𝒳 D ∘ res = id.
   API openCurveSplitting_frob [characterisation]
     openCurveSplitting commutes with φ and is the unique such retraction.
   API openCurveSplitting_mono [relation]
     For D ⊆ D', openCurveSplitting 𝒳 D' ∘ res_{Y,Y'} = openCurveSplitting 𝒳 D.
   TEST splitting_p1 [computation]
     For P^1 and D = {0, ∞}, openCurveSplitting = 0.
   TEST splitting_empty_boundary [degenerate]
     For D = ∅ (Y = X), openCurveSplitting = id.
   TEST splitting_res_compat [compatibility]
     openCurveSplitting 𝒳 D ∘ res = id on H1dR X.
   TEST splitting_not_residue_free [non-example]
     The complement of res(H^1(X)) chosen by 'residue-free forms' without Frobenius is a
     different splitting in general; only the φ-stable one is canonical.
-/

/- CONTRACT PadicHodgeRegulators:D.5/curve-syntomic-regulator (construction): The degree-two syntomic regulator of a curve
   DECLARATION curveSyntomicRegulator
   API curveSyntomicRegulator [data]
     curveSyntomicRegulator 𝒳 : K_2(𝒳)^{(2)}_ℚ →ₗ[ℚ] curveSyntomicTarget 𝒳.
   API regSynCan [projection]
     regSynCan := canIso⁻¹ ∘ curveSyntomicRegulator.
   API regP [projection]
     regP := normIso ∘ curveSyntomicRegulator.
   API regSynCan_eq_frob_regP [relation]
     regSynCan u = (1 − q⁻² • φ) (regP u).
   API regP_symbol [characterisation]
     On a symbol presentation on Y, regP u = openCurveSplitting ((1 − φ^*/q²)⁻¹ [Σ n_i ε(f_i,
     g_i)]).
   API curveSyntomicRegulator_weight_three [simp]
     The weight-three part of K_2(𝒳) ⊗ Q maps to 0 (H^4_syn(𝒳, 3)-target vanishes for a curve).
   TEST regulator_constant_symbol [computation]
     For c ∈ μ_{q−1}, regSynCan {f, c} = 0.
   TEST regulator_diagonal_symbol [degenerate]
     regSynCan {f, f} = 0.
   TEST regulator_canonical_not_coleman [non-example]
     Feeding regSynCan instead of regP into the Coleman symbol formula is off by (1 − φ/q²); on
     an eigen-pairing by the factor (1 − 1/(pγ)).
-/

-- THEOREM PadicHodgeRegulators:D.5/coleman-symbol-formula: Besser's Coleman-integral formula for the regulator of a symbol
-- COMPARISON PadicHodgeRegulators:D.5/curve-etale-comparison: The curve regulator and the Bloch–Kato logarithm
-- THEOREM PadicHodgeRegulators:D.5/curve-regulator-functoriality: Pullback, pushforward and base change of the curve regulator
-- COMPARISON PadicHodgeRegulators:D.5/semistable-input-boundary: What bad or semistable reduction requires beyond good reduction
