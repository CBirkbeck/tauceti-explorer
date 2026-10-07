/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These signatures suggest Lean forms so that contributors and reviewers
converge on names and interfaces; the mathematical specification is
research/blueprint/readmes/PadicHodgeRegulators.md and the two part packets.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The native prototype uses polynomial, finite-field, product-field, matrix,
submodule, coordinate-equivalence and tensor-product carriers at the Mathlib pin.
Proof obligations use sorry; the inherited closed finite-field computations are
proved. Period rings, Wach and Robba modules, continuous Iwasawa cohomology,
K-theory and syntomic regulators still require their actual supplier carriers.
Their UNELABORATED contracts below are comments, not typed declarations or
executable examples. Compiling this file checks only its native declarations;
comment-name coverage does not establish PROTOCOL section 13 coverage. No
arithmetic carrier is replaced by a Prop field. implementationStatus stays unchecked.
Tau Ceti's pinned Teichmuller and finite Kummer declarations are cited in the
packets; their modules are not imported into this Mathlib-only prototype.

Notation: representation vectors v_r=epsilon^(tensor r) and canonical period
vectors d_r=t^(-r) tensor v_r are different. In inherited L0/L1/D contracts e_r
means d_r; inside L2 cocycles and L3/L4 expressions t^(-r)e_r, e_r means v_r.
Coefficient vectors are rows and basis vectors columns: n'=U n gives c'=c U^-1
and M'=U M B^-1 when the output basis changes by B (after scalar extension).

Assembly retains the reviewed mathematics. L2 supplies the Tate Kummer
comparison only up to an unresolved sign; the source-normalized L3 Coleman
formula still needs that comparison. Finite-level duality does not supply the
normalized Lambda-valued Iwasawa pairing. L2 h_Iw applies to etale modules of
representations; general de Rham Robba modules need the separate PG comparison.
The unified reader and handoff record these consuming gaps explicitly.
-/

import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.RingTheory.OrzechProperty
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.LinearAlgebra.FreeModule.Finite.Basic
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.NumberTheory.Bernoulli
import Mathlib.GroupTheory.FreeAbelianGroup
import Mathlib.Tactic.NormNum
import Mathlib.LinearAlgebra.Lagrange
import Mathlib.LinearAlgebra.Basis.VectorSpace
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.RingTheory.LocalRing.MaximalIdeal.Defs
import Mathlib.NumberTheory.Padics.MahlerBasis
import Mathlib.LinearAlgebra.TensorProduct.Basic

noncomputable section
open scoped BigOperators TensorProduct
open Matrix Polynomial Module

namespace TauCeti.PadicHodgeRegulators

/-! ## Local Bloch–Kato maps and dilogarithmic regulators (L0–L2, D.1–D.5) -/

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
example [Fact (Nat.Prime 5)] : (finitePolylog 5 2).eval 2 = 1 := by
  norm_num [finitePolylog, Finset.sum_Ico_succ_top]
  have h4 : (4 : ZMod 5)⁻¹ = 4 := inv_eq_of_mul_eq_one_right (by decide +revert)
  have h9 : (9 : ZMod 5)⁻¹ = 4 := inv_eq_of_mul_eq_one_right (by clear h4; decide +revert)
  have h16 : (16 : ZMod 5)⁻¹ = 1 := inv_eq_of_mul_eq_one_right (by clear h4 h9; decide +revert)
  rw [h4, h9, h16]
  clear h4 h9 h16
  decide +revert
-- TEST finitePolylog_five_two_three
example [Fact (Nat.Prime 5)] : (finitePolylog 5 2).eval 3 = 3 := by
  norm_num [finitePolylog, Finset.sum_Ico_succ_top]
  have h4 : (4 : ZMod 5)⁻¹ = 4 := inv_eq_of_mul_eq_one_right (by decide +revert)
  have h9 : (9 : ZMod 5)⁻¹ = 4 := inv_eq_of_mul_eq_one_right (by clear h4; decide +revert)
  have h16 : (16 : ZMod 5)⁻¹ = 1 := inv_eq_of_mul_eq_one_right (by clear h4 h9; decide +revert)
  rw [h4, h9, h16]
  clear h4 h9 h16
  decide +revert
-- TEST finitePolylog_five_two_minus_one
example [Fact (Nat.Prime 5)] : (finitePolylog 5 2).eval 4 = 0 := by
  norm_num [finitePolylog, Finset.sum_Ico_succ_top]
  have h4 : (4 : ZMod 5)⁻¹ = 4 := inv_eq_of_mul_eq_one_right (by decide +revert)
  have h9 : (9 : ZMod 5)⁻¹ = 4 := inv_eq_of_mul_eq_one_right (by clear h4; decide +revert)
  have h16 : (16 : ZMod 5)⁻¹ = 1 := inv_eq_of_mul_eq_one_right (by clear h4 h9; decide +revert)
  rw [h4, h9, h16]
  clear h4 h9 h16
  decide +revert
-- TEST finitePolylog_one_index
example (p : ℕ) [Fact p.Prime] :
    finitePolylog p 0 = ∑ k ∈ Finset.Ico 1 p, (X : Polynomial (ZMod p)) ^ k := by sorry
-- TEST finitePolylog_three_non_example
example [Fact (Nat.Prime 3)] : (finitePolylog 3 2).eval 1 = 2 := by
  norm_num [finitePolylog, Finset.sum_Ico_succ_top]
  have h4 : (4 : ZMod 3)⁻¹ = 1 := inv_eq_of_mul_eq_one_right (by decide +revert)
  rw [h4]
  clear h4
  decide +revert
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
      (Set.range fun x : {x : GaloisField p s // x ≠ 0 ∧ x ≠ 1} => residueDilogReduction p s x) = ⊤ := by
  sorry

-- PadicHodgeRegulators:D.3/residue-spanning, statement (b) modulo p
theorem residueSpanning_differences_mod_p (hp : 5 ≤ p) (hs : 1 ≤ s) :
    Submodule.span (ZMod p)
      (Set.range fun xy : {x : GaloisField p s // x ≠ 0 ∧ x ≠ 1} × {x : GaloisField p s // x ≠ 0 ∧ x ≠ 1} =>
        residueDilogReduction p s xy.1 - residueDilogReduction p s xy.2) = ⊤ := by
  sorry

/-- The counting input: a subset of `𝔽_{p^s}` with more than `p^{s-1}` elements spans. -/
theorem span_eq_top_of_card_gt (S : Finset (GaloisField p s)) (hs : 1 ≤ s)
    (hS : p ^ (s - 1) < S.card) : Submodule.span (ZMod p) (S : Set (GaloisField p s)) = ⊤ := by
  sorry

/-- The fibre bound: every fibre of `f_p` on `𝔽_{p^s}ˣ \ {1}` has at most `p - 2` points. -/
theorem residueDilogReduction_fibre_card (hp : 5 ≤ p) (c : GaloisField p s) :
    {x : GaloisField p s | x ≠ 0 ∧ x ≠ 1 ∧ residueDilogReduction p s x = c}.ncard ≤ p - 2 := by
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

/-! ## D.4 — rational injectivity and scalar extension

These examples are linear algebra on existing carriers. They test why the packet has
separate rational and Q_p-linear injectivity predicates, without defining K-theory by
placeholder types. -/

section ScalarExtension
variable {K : Type*} [Field K] [Algebra ℚ K]

-- TEST injective_scalar_extension_non_example (rational restriction)
example (α : K) (hα : α ∉ Set.range (algebraMap ℚ K)) :
    Function.Injective (fun x : ℚ × ℚ => algebraMap ℚ K x.1 + α * algebraMap ℚ K x.2) := by
  sorry

-- TEST injective_scalar_extension_non_example (extension has kernel (−α,1))
example (α : K) : ¬ Function.Injective (fun x : K × K => x.1 + α * x.2) := by
  sorry

end ScalarExtension



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

/-- The additive extension on admissible symbols `[z]`, matching the packet domain. -/
def etaleDilogHom (D : ∀ i, A i → A i) :
    FreeAbelianGroup {z : ∀ i, A i // etaleAdmissible z} →+ (∀ i, A i) :=
  FreeAbelianGroup.lift (fun z => etaleDilog D z.val)

@[simp] lemma etaleDilogHom_of (D : ∀ i, A i → A i)
    (z : {z : ∀ i, A i // etaleAdmissible z}) :
    etaleDilogHom D (FreeAbelianGroup.of z) = etaleDilog D z.val := by sorry

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


/-! ## UNELABORATED supplier-dependent contracts

The complete mathematical statements below keep the packet and this file synchronized.
They are comments, not Lean signatures or executable tests. Successful elaboration does
not verify them. See the packet’s review and the report for the missing carrier/map
contracts. No imaginary period-ring, cohomology or K-theory carrier is modeled by Prop.
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions (comparison): Hodge–Tate, twist and period conventions for the regulator
   STATEMENT
     Throughout PadicHodgeRegulators: (i) t = log[ε] ∈ B_dR^+ is the period of Z_p(1) for a fixed
     compatible system ε = (ζ_{p^n}) of p-power roots of unity; Fil^i B_dR = t^i B_dR^+, g(t) =
     χ(g)t for the cyclotomic character χ, and φ(t) = pt in B_cris (arithmetic Frobenius). (ii)
     Hodge–Tate weights: h is a weight of V when Fil^{−h}D_dR(V) ≠ Fil^{−h+1}D_dR(V); with this
     convention Q_p(1) has weight +1 and V_pA of an abelian variety has weights 0 and 1, matching
     the L3–L4 packet, PadicHodgeTheory R06.4 and FiniteFlatGroupsAndIntegralPadicHodgeTheory
     R07.3 (HT(χ) = +1). (iii) For r ∈ Z, e_r := t^{−r} ⊗ ε^{⊗r} is a basis of D_cris(Q_p(r)) =
     K_0·e_r and of D_dR(Q_p(r)) = K·e_r, independent of ε, with φ(e_r) = p^{−r}e_r, Fil^{−r} =
     D_dR and Fil^{−r+1} = 0; hence D_dR(Q_p(r))/Fil^0 = K·e_r for r ≥ 1 and 0 for r ≤ 0. (iv)
     Twisting: D_cris(V(i)) = D_cris(V)⟨i⟩ via d ↦ d ⊗ e_i, with Fil^j(D⟨i⟩) = Fil^{j+i}D and
     φ|_{D⟨i⟩} = p^{−i}φ|_D. (v) Crystalline representations have N = 0; the monodromy operator is
     used only for semistable inputs (D.5's boundary). Sources using the opposite weight sign
     (Benois: Q_p(1) of weight −1) are translated, never mixed.
   HYPOTHESIS
     K/Q_p finite with maximal unramified subfield K_0; V a p-adic representation of G_K.
   PREREQUISITE
     PadicHodgeTheory:R06.2/hodge-tate-weight-convention
   PREREQUISITE
     PadicHodgeTheory:R06.1/fontaine-element-t
   PREREQUISITE
     PadicHodgeTheory:R06.1/bdr-filtration-and-graded
   PREREQUISITE
     PadicHodgeTheory:R06.1/frobenius-on-acris
   PREREQUISITE
     PadicHodgeTheory:R06.2/ddr-of-tate-twists
   PREREQUISITE
     PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L0/fundamental-exact-sequences (comparison): The fundamental exact sequences used by the Bloch–Kato maps
   STATEMENT
     From PadicHodgeTheory R06.1 (its nodes fundamental-exact-sequence, bcris-twisted-frobenius-
     sequences and divided-frobenius-exact-sequence), with the conventions of L0/hodge-tate-and-
     twist-conventions: (a) with B_e := B_cris^{φ=1}, the sequences 0 → Q_p → B_e → B_dR/B_dR^+ →
     0 and 0 → Q_p → B_e ⊕ B_dR^+ → B_dR → 0 are exact; (b) 0 → Q_p → B_cris --(φ − 1, mod
     Fil^0)--> B_cris ⊕ B_dR/B_dR^+ → 0 is exact; (c) for every r ∈ Z, 0 → Q_p(r) → Fil^r B_cris
     --(p^{−r}φ − 1)--> B_cris → 0 is exact (Fontaine); (d) integrally, 0 → Z_p(r)' → Fil^r A_cr
     --(p^r − φ)--> A_cr has cokernel killed by p^r, with Z_p(r)' = p^{−a(r)}Z_p(r) for r = (p −
     1)a(r) + b(r). Tensoring (a)–(c) with any p-adic representation V gives exact sequences of
     G_K-modules; for de Rham V, H^0(K, (B_dR/B_dR^+) ⊗ V) = D_dR(V)/Fil^0 and H^0(K, B_e ⊗ V) =
     D_cris(V)^{φ=1}.
   HYPOTHESIS
     K/Q_p finite; V any p-adic representation for exactness, de Rham for the identification of
     invariants.
   PREREQUISITE
     PadicHodgeTheory:R06.1/fundamental-exact-sequence
   PREREQUISITE
     PadicHodgeTheory:R06.1/bcris-twisted-frobenius-sequences
   PREREQUISITE
     PadicHodgeTheory:R06.1/divided-frobenius-exact-sequence
   PREREQUISITE
     PadicHodgeTheory:R06.1/period-ring-invariants
   PREREQUISITE
     PadicHodgeTheory:R06.2/period-functors
   PREREQUISITE
     PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L0/integral-period-interface (comparison): Integral comparison interface for small weights
   STATEMENT
     For K/Q_p finite unramified and a crystalline G_K-stable Z_p-lattice T with Hodge–Tate
     weights in [0, p − 2] (HT(χ) = +1), the Fontaine–Laffaille correspondence T ↔ M (strongly
     divisible W(k)-lattice in D_cris(V^∨)) of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3
     is imported with its normalisation; for T = Z_p(r), 0 ≤ r ≤ p − 2, the lattice is W(k)·e_{−r}
     in D_cris(Q_p(−r)). The integral Bloch–Kato statement of L1/integral-logarithm-unramified and
     the integral period map of D.2/fontaine-messing-kato-period-map are formulated against these
     lattices and the integral sequence L0/fundamental-exact-sequences (d); no further integral
     period carrier is introduced here.
   HYPOTHESIS
     K unramified over Q_p; weights in [0, p − 2]; p odd.
   PREREQUISITE
     FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-lattice-correspondence
   PREREQUISITE
     FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/strongly-divisible-lattices
   PREREQUISITE
     PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences
   PREREQUISITE
     PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary
   PREREQUISITE
     PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L1/bloch-kato-subgroups (definition): The Bloch–Kato local conditions H¹_e, H¹_f, H¹_g
   DECLARATION blochKatoF
   STATEMENT
     Let K/Q_p be finite and V a p-adic representation of G_K. Define H^1_e(K, V) := ker(H^1(K, V)
     → H^1(K, B_e ⊗ V)), H^1_f(K, V) := ker(H^1(K, V) → H^1(K, B_cris ⊗ V)) and H^1_g(K, V) :=
     ker(H^1(K, V) → H^1(K, B_dR ⊗ V)), so H^1_e ⊆ H^1_f ⊆ H^1_g. For a G_K-stable Z_p-lattice T ⊂
     V and W = V/T, H^1_f(K, T) is the preimage of H^1_f(K, V) and H^1_f(K, W) the image of
     H^1_f(K, V); these are the finite local conditions. For ℓ ≠ p (K/Q_ℓ finite) H^1_f := H^1_ur.
     The singular quotient is H^1_s := H^1/H^1_f.
   HYPOTHESIS
     K/Q_p finite (or K/Q_ℓ finite with ℓ ≠ p for the unramified condition); V finite-dimensional
     continuous.
   PREREQUISITE
     PadicHodgeRegulators:L0/fundamental-exact-sequences
   PREREQUISITE
     PadicHodgeTheory:R06.1/crystalline-period-ring
   PREREQUISITE
     PadicHodgeTheory:R06.1/de-rham-period-ring
   PREREQUISITE
     ArithmeticGaloisDuality:R02.1/continuous-section-long-exact
   PREREQUISITE
     ArithmeticGaloisDuality:R02.1/rationalization
   PREREQUISITE
     SelmerIwasawaCohomology:L0/padic-kummer-identification
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
     For a G_K-map V → V', H^1(K, V) → H^1(K, V') maps blochKatoF into blochKatoF (same for e, g).
   API blochKatoF_res [functoriality]
     For L/K finite, restriction maps blochKatoF K V into blochKatoF L V and corestriction maps
     back.
   API blochKatoF_unramified [compatibility]
     For ℓ ≠ p, blochKatoF := H^1_ur.
   API blochKatoE_extensionality [extensionality]
     Two Bloch–Kato submodules agree iff their membership predicates agree on every class, by
     Submodule.ext. Each inherits the ambient Q_p-module operations; membership is stable under
     zero, addition and scalar multiplication.
   TEST blochKatoF_trivial [computation]
     For V = Q_p and K = Q_p, blochKatoF = H^1_ur(Q_p, Q_p) = Hom(Gal(Q_p^ur/Q_p), Q_p), of
     dimension 1, while H^1(Q_p, Q_p) has dimension 2.
   TEST blochKatoF_negative_twist [degenerate]
     For V = Q_p(−1), H^1_e = H^1_f = H^1_g = 0 although H^1(K, Q_p(−1)) has dimension [K : Q_p].
   TEST blochKatoF_rubin_compat [compatibility]
     For V = Q_p(1), blochKatoF agrees with Rubin's U_{L,v} ⊗ Φ condition (Euler Systems, §I.6.3,
     (7)) and with the Kummer image of the completed units.
   TEST blochKatoG_not_all [non-example]
     For V = Q_p, H^1_g(K, Q_p) = H^1_f(K, Q_p) ≠ H^1(K, Q_p): the de Rham condition is a proper
     subspace (the ramified homomorphisms are excluded).
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L1/bloch-kato-exponential (construction): The Bloch–Kato exponential
   DECLARATION blochKatoExp
   STATEMENT
     For K/Q_p finite and V a de Rham representation, exp_{K,V} : D_dR(V)/Fil^0 D_dR(V) → H^1(K,
     V) is the connecting homomorphism of 0 → V → B_e ⊗ V → (B_dR/B_dR^+) ⊗ V → 0 (L0/fundamental-
     exact-sequences (a) ⊗ V). There are exact sequences 0 → H^0(K, V) → D_cris(V)^{φ=1} →
     D_dR(V)/Fil^0 → H^1_e(K, V) → 0 and 0 → H^0(K, V) → D_cris(V) → D_cris(V) ⊕ D_dR(V)/Fil^0 →
     H^1_f(K, V) → 0 (the first map x ↦ (φx − x, x̄)); in particular im(exp_{K,V}) = H^1_e(K, V)
     and ker(exp_{K,V}) is the image of D_cris(V)^{φ=1}. Explicitly, exp(x) is the class of g ↦ (g
     − 1)b for any b ∈ B_e ⊗ V with b − x ∈ B_dR^+ ⊗ V.
   HYPOTHESIS
     K/Q_p finite; V de Rham (for the identification of the source with D_dR(V)/Fil^0).
   PREREQUISITE
     PadicHodgeRegulators:L0/fundamental-exact-sequences
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-subgroups
   PREREQUISITE
     PadicHodgeTheory:R06.2/period-functors
   PREREQUISITE
     ArithmeticGaloisDuality:R02.1/continuous-section-long-exact
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
   API blochKatoExp_extensionality [extensionality]
     Two instances of this map agree iff their values agree on every element of the specified
     source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and
     map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred
     for the semilinear twist.
   TEST blochKatoExp_twist_two [computation]
     For K = Q_p and V = Q_p(2), blochKatoExp is an isomorphism Q_p·e_2 ≅ H^1(Q_p, Q_p(2)) ≅ Q_p.
   TEST blochKatoExp_trivial [degenerate]
     For V = Q_p, D_dR(Q_p)/Fil^0 = 0, so blochKatoExp = 0 and H^1_e(K, Q_p) = 0.
   TEST blochKatoExp_kummer [compatibility]
     For V = Q_p(1) and u ∈ 1 + p^c O_K (c > 1/(p − 1)), blochKatoExp(log u · e_1) = κ(u), the
     Kummer class (Bloch–Kato 3.10.1).
   TEST blochKatoExp_not_onto_f [non-example]
     For V = Q_p(1), H^1_e = H^1_f has dimension [K : Q_p] but H^1(K, Q_p(1)) has dimension [K :
     Q_p] + 1: the exponential does not reach the valuation direction.
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L1/bloch-kato-logarithm (construction): The Bloch–Kato logarithm
   DECLARATION blochKatoLog
   STATEMENT
     Let K/Q_p be finite and V de Rham with D_cris(V)^{φ=1} = H^0(K, V) (so exp_{K,V} is
     injective). The Bloch–Kato logarithm is log_BK := exp_{K,V}^{−1} : H^1_e(K, V) →
     D_dR(V)/Fil^0 D_dR(V). For V = Q_p(r), r ≥ 2, H^1_e = H^1(K, Q_p(r)) and log_BK : H^1(K,
     Q_p(r)) ≅ K·e_r ≅ K; for V = Q_p(1), log_BK ∘ κ = log_p on O_K^× (Iwasawa branch), with κ the
     Kummer map.
   HYPOTHESIS
     D_cris(V)^{φ=1} = H^0(K, V).
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-exponential
   PREREQUISITE
     ColemanIntegration:L0/iwasawa-logarithm
   PREREQUISITE
     tauceti:TauCeti.kummerClassMap
   PREREQUISITE
     SelmerIwasawaCohomology:L0/padic-kummer-identification
   API blochKatoLog [data]
     blochKatoLog K V : blochKatoE K V →ₗ[ℚ_p] D_dR(V) ⧸ Fil^0 (under the injectivity hypothesis).
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
   API blochKatoLog_extensionality [extensionality]
     Two instances of this map agree iff their values agree on every element of the specified
     source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and
     map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred
     for the semilinear twist.
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

/- UNELABORATED CONTRACT PadicHodgeRegulators:L1/dual-exponential (construction): Kato's dual exponential
   DECLARATION dualExp
   STATEMENT
     For K/Q_p finite and V de Rham, the dual exponential exp*_{K,V^*(1)} : H^1(K, V) → Fil^0
     D_dR(V) is the composite H^1(K, V) → H^1(K, B_dR ⊗ V) ≅ D_dR(V), the isomorphism being x ↦ (g
     ↦ log χ(g)·x) (Kato); its image lies in Fil^0 D_dR(V) and its kernel is H^1_g(K, V). It is
     the transpose of exp_{K,V^*(1)} for the Tate pairing ⟨ , ⟩ : H^1(K, V) × H^1(K, V^*(1)) →
     H^2(K, Q_p(1)) = Q_p and the de Rham pairing [ , ] : D_dR(V) × D_dR(V^*(1)) → D_dR(Q_p(1)) =
     K --Tr_{K/Q_p}--> Q_p: [x, exp*(y)] = ⟨exp(x), y⟩ for x ∈ D_dR(V^*(1))/Fil^0, y ∈ H^1(K, V),
     with the sign convention pinned here (the sources warn that signs vary).
   HYPOTHESIS
     K/Q_p finite; V de Rham.
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-exponential
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-subgroups
   PREREQUISITE
     SelmerIwasawaCohomology:L1/orthogonal-complement
   PREREQUISITE
     PadicHodgeTheory:R06.1/de-rham-invariants
   PREREQUISITE
     ArithmeticGaloisDuality:D7/duality-after-localization
   PREREQUISITE
     ArithmeticGaloisDuality:R02.4
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
   API dualExp_extensionality [extensionality]
     Two instances of this map agree iff their values agree on every element of the specified
     source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and
     map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred
     for the semilinear twist.
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

/- UNELABORATED CONTRACT PadicHodgeRegulators:L1/dimension-formulas (theorem): Dimensions of the Bloch–Kato subspaces
   STATEMENT
     Let K/Q_p be finite and V a de Rham representation. Then dim H^1_f(K, V) = dim_{Q_p}
     D_dR(V)/Fil^0 + dim H^0(K, V); dim H^1_f/H^1_e = dim D_cris(V)^{φ=1}; dim H^1_g(K, V) = dim
     H^1_f(K, V) + dim D_cris(V^*(1))^{φ=1}; and dim H^1(K, V) = [K : Q_p]·dim V + dim H^0(K, V) +
     dim H^0(K, V^*(1)).
   HYPOTHESIS
     K/Q_p finite; V de Rham (crystalline for nothing further).
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-exponential
   PREREQUISITE
     PadicHodgeRegulators:L1/local-duality-of-conditions
   PREREQUISITE
     ArithmeticGaloisDuality:D7/duality-after-localization
   PREREQUISITE
     ArithmeticGaloisDuality:D7/duality-after-localization
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L1/local-duality-of-conditions (theorem): Local duality of the Bloch–Kato conditions
   STATEMENT
     Let K/Q_p be finite and V de Rham. Under the perfect cup-product pairing H^1(K, V) × H^1(K,
     V^*(1)) → H^2(K, Q_p(1)) = Q_p: H^1_f(K, V^*(1)) = H^1_f(K, V)^⊥, H^1_e(K, V^*(1)) = H^1_g(K,
     V)^⊥ and H^1_g(K, V^*(1)) = H^1_e(K, V)^⊥. For a G_K-stable lattice T, H^1_f(K, T) and
     H^1_f(K, V^*(1)/T^*(1)) (propagated conditions; V^*(1)/T^*(1) = Hom(T, μ_{p^∞})) are exact
     annihilators under the induced pairing H^1(K, T) × H^1(K, V^*(1)/T^*(1)) → Q_p/Z_p. For a
     finite extension K_ℓ/Q_ℓ with ℓ ≠ p and a finite unramified p-primary G_{K_ℓ}-module M,
     H¹_un(K_ℓ,M) and H¹_un(K_ℓ,M^D) are exact annihilators under finite local Tate duality; no
     unrestricted ramified torsion-module assertion is made.
   HYPOTHESIS
     K/Q_p finite; V de Rham (Bloch–Kato Proposition 3.8; Fontaine–Ouyang state it for semistable
     V).
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-subgroups
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-exponential
   PREREQUISITE
     ArithmeticGaloisDuality:R02.4/unramified-exact-annihilators
   PREREQUISITE
     SelmerIwasawaCohomology:L1/orthogonal-complement
   PREREQUISITE
     SelmerIwasawaCohomology:L1/lattice-pairing-compatibility
   PREREQUISITE
     ArithmeticGaloisDuality:D7/duality-after-localization
   PREREQUISITE
     ArithmeticGaloisDuality:D7/local-invariant-trivialization
   PREREQUISITE
     ArithmeticGaloisDuality:D7/local-duality-maps
   PREREQUISITE
     ArithmeticGaloisDuality:D7/derived-local-duality
   PREREQUISITE
     PadicHodgeTheory:R06.3/p-adic-monodromy-theorem
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L1/twist-and-change-of-field (lemma): Twists, restriction and corestriction for the Bloch–Kato maps
   STATEMENT
     Let L/K be a finite extension of finite extensions of Q_p and V de Rham over K. (a)
     Restriction: res_{L/K} ∘ exp_{K,V} = exp_{L,V} ∘ ι, with ι : D_dR,K(V) → L ⊗_K D_dR,K(V) =
     D_dR,L(V) the inclusion. (b) Corestriction: cor_{L/K} ∘ exp_{L,V} = exp_{K,V} ∘ Tr_{L/K}, and
     Tr_{L/K} ∘ exp*_L = exp*_K ∘ cor_{L/K}. (c) Twisting: for i ∈ Z, D_cris(V(i)) = D_cris(V) ⊗
     e_i and D_dR(V(i)) = D_dR(V) ⊗ e_i with Fil^j shifted by i and φ multiplied by p^{−i}; there
     is no finite-level map H^1(K, V) → H^1(K, V(i)), and twisting enters the exponentials only
     through Iwasawa cohomology (L2/local-iwasawa-twist). (d) Shapiro: for V a representation of
     G_L, H^1(K, Ind_L^K V) ≅ H^1(L, V) carries H^1_f to H^1_f and exp_{K, Ind V} to exp_{L, V}
     under D_dR,K(Ind V) = D_dR,L(V).
   HYPOTHESIS
     K ⊆ L finite over Q_p; V de Rham.
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-exponential
   PREREQUISITE
     PadicHodgeRegulators:L1/dual-exponential
   PREREQUISITE
     PadicHodgeRegulators:L0/hodge-tate-and-twist-conventions
   PREREQUISITE
     PadicHodgeTheory:R06.2/de-rham-base-change
   PREREQUISITE
     PadicHodgeTheory:R06.2/induction-and-restriction-of-scalars
   PREREQUISITE
     ArithmeticGaloisDuality:D7/duality-after-localization
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L1/tate-twist-examples (theorem): The Bloch–Kato conditions for Tate twists
   STATEMENT
     Let K/Q_p be finite. (i) V = Q_p: H^1_e = 0, H^1_f = H^1_g = H^1_ur (dimension 1). (ii) V =
     Q_p(1): H^1_e = H^1_f = κ((O_K^×)^∧ ⊗ Q_p) of dimension [K : Q_p], H^1_g = H^1 (dimension [K
     : Q_p] + 1); exp_BK(log_p u·e_1) = κ(u) for u ∈ O_K^× and log_BK ∘ κ = log_p. (iii) V =
     Q_p(r), r ≥ 2: H^1_e = H^1_f = H^1_g = H^1(K, Q_p(r)) of dimension [K : Q_p], and exp : K·e_r
     ≅ H^1(K, Q_p(r)). (iv) V = Q_p(r), r ≤ −1: H^1_e = H^1_f = H^1_g = 0 while dim H^1 = [K :
     Q_p]. Integrally: H^1_f(K, Z_p(1)) = (O_K^×)^∧ and H^1_f(K, Z_p(r)) = H^1(K, Z_p(r)) for r ≥
     2.
   HYPOTHESIS
     K/Q_p finite.
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-logarithm
   PREREQUISITE
     PadicHodgeRegulators:L1/dimension-formulas
   PREREQUISITE
     PadicHodgeRegulators:L1/local-duality-of-conditions
   PREREQUISITE
     SelmerIwasawaCohomology:L0/padic-kummer-identification
   PREREQUISITE
     SelmerIwasawaCohomology:L0/local-completion
   PREREQUISITE
     ArithmeticGaloisDuality:D7/duality-after-localization
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L1/abelian-variety-logarithm (comparison): The Bloch–Kato logarithm of Kummer classes of abelian varieties
   STATEMENT
     Let K/Q_p be finite and A/K an abelian variety with good reduction, V = V_pA. Then H^1_e(K,
     V) = H^1_f(K, V) = H^1_g(K, V) = κ(A(K) ⊗ Q_p), with κ the Kummer map; D_dR(V)/Fil^0 ≅ Lie(A)
     ⊗ K; and log_BK ∘ κ = log_A on A(K) ⊗ Q_p, where log_A : A(K) → Lie(A) is the logarithm of
     the formal group (extended to A(K) by finite index). For an isogeny or a quotient map π : A →
     B of abelian varieties with good reduction, log_BK is natural: log_B(π(x)) = dπ(log_A(x)).
     Pairing with an invariant differential ω ∈ Fil^0 D_dR(V^*(1)) = H^0(A, Ω^1) gives ⟨log_BK
     κ(P), ω⟩ = log_ω(P).
   HYPOTHESIS
     A has good reduction over O_K; the sign convention of exp is that of L1/bloch-kato-
     exponential.
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-logarithm
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-subgroups
   PREREQUISITE
     PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction
   PREREQUISITE
     PadicHodgeTheory:R06.6/good-reduction-iff-crystalline
   PREREQUISITE
     PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L1/integral-logarithm-unramified (theorem): The integral Bloch–Kato logarithm for unramified fields
   STATEMENT
     Let p be odd, L/Q_p finite unramified and 2 ≤ r ≤ p − 2. Then H^1(L, Z_p(r)) is torsion-free
     of rank [L : Q_p], H^1_f(L, Z_p(r)) = H^1(L, Z_p(r)), and log_BK(H^1(L, Z_p(r))) = (r −
     1)!·p^r·O_L·e_r = p^r·O_L·e_r. For r = 1, log_BK(H^1_f(L, Z_p(1))/tors) = p·O_L·e_1 (the
     logarithm of the principal units). Equivalently, Fontaine's map ∂^r : L → H^1(L, Q_p(r)), the
     connecting map of L0/fundamental-exact-sequences (c), equals ±exp_BK ∘ (1 − p^{−r}σ)^{−1} and
     maps O_L isomorphically onto H^1(L, Z_p(r)), because (1 − p^{−r}σ)^{−1}O_L = p^r O_L. The
     statement is not asserted for ramified L, for r ≥ p − 1, or for p = 2.
   HYPOTHESIS
     p odd; L unramified; 2 ≤ r ≤ p − 2 (Fontaine–Laffaille range).
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-logarithm
   PREREQUISITE
     PadicHodgeRegulators:L1/tate-twist-examples
   PREREQUISITE
     PadicHodgeRegulators:L0/integral-period-interface
   PREREQUISITE
     PadicHodgeRegulators:L0/fundamental-exact-sequences
   PREREQUISITE
     KTheoryFiniteLocalFields:L.6/h1-of-tate-twists
   PREREQUISITE
     KTheoryFiniteLocalFields:L.6/h0-of-tate-twists
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L1/semilocal-bloch-kato (construction): Semilocal Bloch–Kato maps
   DECLARATION semilocalBlochKatoExp
   STATEMENT
     For a finite étale Q_p-algebra A = ∏_v K_v (for instance F ⊗ Q_p = ∏_{v|p} F_v for a number
     field F) and a p-adic representation V of G_{Q_p} (or a family V_v of de Rham representations
     of the G_{K_v}), put H^1(A, V) := ⊕_v H^1(K_v, V), H^1_*(A, V) := ⊕_v H^1_*(K_v, V) for * ∈
     {e, f, g}, D_dR(A, V) := ⊕_v D_dR,K_v(V), and define exp_{A,V} and exp*_{A,V} componentwise.
     Define log_{A,V} on ⊕_v H^1_e(K_v,V_v) only when D_cris,K_v(V_v)^{φ=1} = H^0(K_v,V_v) for
     every v. Under Shapiro's isomorphism H^1(Q_p, Ind_{K_v}^{Q_p} V) ≅ H^1(K_v, V) these are the
     Bloch–Kato maps of the induced representation (L1/twist-and-change-of-field (d)). For a
     number field F the semilocal Kummer map E_F ⊗ Q_p → H^1_f(F ⊗ Q_p, Q_p(1)) composed with log
     is the unit regulator of D.1/unit-logarithm-kernel.
   HYPOTHESIS
     A finite étale over Q_p; V de Rham at each factor.
   HYPOTHESIS
     The componentwise logarithm requires the injectivity hypothesis of L1/bloch-kato-logarithm at
     every factor; the subgroup construction does not.
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-exponential
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-logarithm
   PREREQUISITE
     PadicHodgeRegulators:L1/dual-exponential
   PREREQUISITE
     PadicHodgeRegulators:L1/twist-and-change-of-field
   PREREQUISITE
     tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-
     places
   API semilocalBlochKatoF [data]
     semilocalBlochKatoF A V : Submodule ℚ_p (⨁ v, H^1(K_v, V)).
   API semilocalBlochKatoExp [constructor]
     semilocalBlochKatoExp A V := ⨁ v, blochKatoExp K_v V.
   API semilocalBlochKatoLog [constructor]
     The componentwise logarithm on ⨁ v, blochKatoE K_v V. It requires injective exp at every
     factor, and is its inverse on the direct sum of the images.
   API semilocal_shapiro [compatibility]
     Under Shapiro's isomorphism, semilocalBlochKatoExp A V = blochKatoExp ℚ_p (Ind_A V).
   API semilocal_prod [simp]
     For A = A' × A'', the semilocal maps are the direct sums of those of A' and A''.
   API semilocalBlochKatoF_extensionality [extensionality]
     Two instances of this map agree iff their values agree on every element of the specified
     source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and
     map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred
     for the semilinear twist.
   TEST semilocal_split_quadratic [computation]
     For F = Q(√2), p = 7: dim_{Q_7} semilocalBlochKatoF (F ⊗ Q_7) Q_7(1) = 2.
   TEST semilocal_zero_algebra [degenerate]
     For A = 0 all semilocal groups are 0.
   TEST semilocal_field_compat [compatibility]
     For A = K a field, the semilocal maps are the local maps of L1.
   TEST semilocal_independent_factors [non-example]
     For p odd and A = Q_p × Q_p, let c = κ(1+p) ≠ 0 in H^1_f(Q_p,Q_p(1)). Both (c,0) and (0,c)
     belong to semilocalBlochKatoF A Q_p(1) and are independent; replacing this group by the one-
     dimensional diagonal {(x,x)} fails. The two-factor group agrees with H^1_f(Q_p,Q_p(1) ⊕
     Q_p(1)).
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L2/fontaine-iwasawa-map (construction): Fontaine's isomorphism h_Iw : D(T)^{ψ=1} ≅ H¹_Iw
   DECLARATION fontaineIwasawaEquiv
   STATEMENT
     Assume H₀. Let D(T) be the étale (φ, Γ)-module of T over O_E ⊗ A_{Q_p} with the operator ψ
     (PhiGammaModulesAndIwasawaCohomology PG.1, PG.4). Define h_{Iw,T} : D(T)^{ψ=1} → H^1_Iw(Q_p,
     T) as the H^1-comparison of the ψ-complex [D(T) --(ψ − 1)--> D(T)] with the inverse-
     corestriction Iwasawa complex (PG.5, SelmerIwasawaCohomology L3). Then: (a) h_{Iw,T} is a
     Λ-linear bijection; (b) for n ≥ 1, a topological generator γ_n of
     Gal(Q_p(μ_{p^∞})/Q_p(μ_{p^n})) and ℓ_n(γ_n) := log_p χ(γ_n)/p^n, pr_n(h(y)) is the class of σ
     ↦ ℓ_n(γ_n)((σ − 1)/(γ_n − 1)·y − (σ − 1)b), where x_n ∈ D(T)^{ψ=0} solves (γ_n − 1)x_n = (φ −
     1)y and b ∈ A ⊗ T solves (φ − 1)b = x_n; (c) cor ∘ pr_{n+1} = pr_n and pr_0 =
     cor_{Q_p(μ_p)/Q_p} ∘ pr_1; (d) h_{Iw,V} := h ⊗ Q is independent of the lattice; (e) the Λ_E-
     torsion of D(V)^{ψ=1} is V^{H_{Q_p}} and maps onto the torsion of H^1_Iw(Q_p, V); H^1_Iw(Q_p,
     T) has no Z_p-torsion.
   HYPOTHESIS
     p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ =
     Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with
     continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).
   PREREQUISITE
     PhiGammaModulesAndIwasawaCohomology:PG.5
   PREREQUISITE
     PhiGammaModulesAndIwasawaCohomology:PG.5/psi-complex
   PREREQUISITE
     PhiGammaModulesAndIwasawaCohomology:PG.5/psi-complex-h1
   PREREQUISITE
     PhiGammaModulesAndIwasawaCohomology:PG.4/psi-zero-splitting
   PREREQUISITE
     PhiGammaModulesAndIwasawaCohomology:PG.3/herr-complex
   PREREQUISITE
     PhiGammaModulesAndIwasawaCohomology:PG.1
   PREREQUISITE
     SelmerIwasawaCohomology:L3/iwasawa-cohomology
   PREREQUISITE
     PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings
   PREREQUISITE
     PadicMeasuresIwasawaAlgebras:L1/convolution-algebra
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-exponential
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
   API fontaineIwasawaEquiv_extensionality [extensionality]
     Two instances of this map agree iff their values agree on every element of the specified
     source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and
     map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred
     for the semilinear twist.
   TEST fontaineIwasawa_trivial [computation]
     For V = Q_p, the class h(1) is nonzero and fixed by G_∞.
   TEST fontaineIwasawa_unramified_char [degenerate]
     For V = E(μ) with μ unramified nontrivial, H^1_Iw(Q_p, V) is torsion-free (Q_p(μ_{p^∞}) ∩
     Q_p^ur = Q_p).
   TEST fontaineIwasawa_cor_compat [compatibility]
     cor_{Q_p(μ_{p^2})/Q_p(μ_p)} ∘ pr_2 ∘ h = pr_1 ∘ h, matching SelmerIwasawaCohomology's inverse
     system.
   TEST fontaineIwasawa_not_D_itself [non-example]
     h is defined on D(T)^{ψ=1}, not on D(T)^{φ=1}: for V = Q_p(1), (1 + π)/π ⊗ e_1 lies in
     D^{ψ=1} but not in D^{φ=1}.
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L2/generator-independence (lemma): Independence of the generator of Γ
   STATEMENT
     Assume H₀. For generators γ, γ' = γ^a (a ∈ Z_p^×) of Γ_n, u := (γ − 1)/(γ' − 1) is a unit of
     Λ, and the cochain map ι_{γ,γ'} := (u, u ⊕ id, id) : C_{φ,γ} → C_{φ,γ'} is an isomorphism
     with ℓ(γ)[c_{x,y}] = ℓ(γ')[c_{ux,y}] in H^1. Hence the level-n formula of L2/fontaine-
     iwasawa-map (b) does not depend on γ_n, and replacing γ by γ^a only changes the variable X =
     γ − 1 of Λ to (1 + X)^a − 1. For γ' = γ^m with p ∤ m, PG.3's generator map equals
     Q_m·ι_{γ,γ^m} on H^1.
   HYPOTHESIS
     p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ =
     Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with
     continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).
   PREREQUISITE
     PadicHodgeRegulators:L2/fontaine-iwasawa-map
   PREREQUISITE
     PhiGammaModulesAndIwasawaCohomology:PG.3/herr-generator-map
   PREREQUISITE
     PhiGammaModulesAndIwasawaCohomology:PG.3/herr-generator-isomorphism
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L2/root-change (comparison): Changing the compatible system of roots of unity
   STATEMENT
     Assume H₀ and let a ∈ Z_p^×, σ_a ∈ G_∞ with χ(σ_a) = a, ε' = σ_a(ε) = ε^a. (i) The embeddings
     ι_ε : A_{Q_p} → Ã (π ↦ [ε] − 1) satisfy ι_{ε'} = ι_ε ∘ γ_a on A, A^+ and B^+_rig; D(T), N(T),
     ψ, the G_∞-action and h_{Iw,T} are unchanged. (ii) t' = a·t, e'_j = a^j e_j, ∂' = a^{−1}∂;
     the localisation maps ι_n are unchanged as maps (coordinates ζ' = ζ^a). (iii) For the Mellin
     transform M_ε(λ) = λ·(1 + π_ε): M_{ε'}(λ) = M_ε(λσ_a), so M_{ε'}^{−1} = [σ_a]^{−1}M_ε^{−1}.
     (iv) Twisting by e'_j is a^j times twisting by e_j. (v) Coleman power series:
     f^{ε'}_u(π_{ε'}) = f^ε_u(π_ε) in A^+ and Δ(f^{ε'}_u) ⊗ e'_1 = Δ(f^ε_u) ⊗ e_1.
   HYPOTHESIS
     p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ =
     Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with
     continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).
   PREREQUISITE
     PadicHodgeRegulators:L2/fontaine-iwasawa-map
   PREREQUISITE
     PadicHodgeTheory:P7:annulus-foundations/cyclotomic-gamma-action
   PREREQUISITE
     PadicHodgeTheory:P7:annulus-foundations/cyclotomic-log-element-t
   PREREQUISITE
     PadicHodgeTheory:P7:annulus-foundations/localisation-at-roots-of-unity
   PREREQUISITE
     PadicMeasuresIwasawaAlgebras:L2/amice-dilation
   PREREQUISITE
     PadicMeasuresIwasawaAlgebras:L2/unit-measure-amice-kernel-equivalence
   PREREQUISITE
     ColemanPowerSeries:L2/coleman-interpolation-equivariance
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L2/local-iwasawa-twist (construction): Twisting local Iwasawa cohomology by characters of G_∞
   DECLARATION iwasawaTwist
   STATEMENT
     Assume H₀. For a continuous character η : G_∞ → O_E^×, choose n(k) ≥ k with η ≡ 1 mod p^k on
     Gal(Q_p(μ_{p^∞})/Q_p(μ_{p^{n(k)}})); using H^1_Iw(Q_p, T) = lim_k H^1(Q_p(μ_{p^{n(k)}}),
     T/p^k) define Tw_η := lim_k (x ↦ x ∪ ē_η) with ē_η ∈ H^0(Q_p(μ_{p^{n(k)}}), (O_E/p^k)(η)).
     Then Tw_η : H^1_Iw(Q_p, T) → H^1_Iw(Q_p, T(η)) is a well-defined O_E-linear bijection,
     independent of the choices, with Tw_1 = id, Tw_η ∘ Tw_η' = Tw_{ηη'}, and Tw_η(λx) =
     Tw_η(λ)Tw_η(x) where Tw_η(σ) = η(σ)^{−1}σ on Λ (SelmerIwasawaCohomology's convention Tw_k for
     η = χ^k). For ω of finite order trivial on G_{Q_p(μ_{p^n})}: pr_n(Tw_ω x) = pr_n(x) ⊗ e_ω.
   HYPOTHESIS
     p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ =
     Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with
     continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).
   PREREQUISITE
     SelmerIwasawaCohomology:L3/iwasawa-cohomology
   PREREQUISITE
     SelmerIwasawaCohomology:L3/iwasawa-shapiro
   PREREQUISITE
     SelmerIwasawaCohomology:L3/iwasawa-twist
   PREREQUISITE
     PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom
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
   API iwasawaTwist_extensionality [extensionality]
     Two instances of this map agree iff their values agree on every element of the specified
     source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and
     map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred
     for the semilinear twist.
   TEST iwasawaTwist_inverse [computation]
     iwasawaTwist η⁻¹ (iwasawaTwist η x) = x.
   TEST iwasawaTwist_trivial [degenerate]
     iwasawaTwist 1 x = x.
   TEST iwasawaTwist_level_cyclotomic [compatibility]
     For η = χ^j and n ≥ 1, pr_n(Tw_{χ^j}x) ≡ pr_n(x) ∪ ε_n^{⊗j} modulo p^n.
   TEST iwasawaTwist_not_linear [non-example]
     iwasawaTwist χ is not Λ-linear: iwasawaTwist χ (σ • x) = χ(σ)^{−1} σ • iwasawaTwist χ x ≠ σ •
     iwasawaTwist χ x for χ(σ) ≠ 1.
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L2/twist-compatibility (comparison): Compatibility of h_Iw with twists
   STATEMENT
     Assume H₀. (i) D(T(η)) = D(T) ⊗ e_η with φ, ψ acting on the first factor and g(x ⊗ e_η) =
     η(g)g(x) ⊗ e_η, so ⊗e_η : D(T)^{ψ=1} → D(T(η))^{ψ=1} is Tw_η-semilinear. (ii) h_{Iw,T(η)}(y ⊗
     e_η) = Tw_η(h_{Iw,T}(y)). (iii) For η = χ^j the level-n cocycle of h(y ⊗ e_j) is σ ↦
     ℓ(γ_n)((σ − 1)/(γ_n − 1)·y(j) − (σ − 1)b) with y(j) the image of y in D(V(j))^{ψ=1}
     (Cherbonnier–Colmez, proof of Theorem IV.2.1). (iv) For crystalline V, N(T(j)) = π^{−j}N(T) ⊗
     e_j.
   HYPOTHESIS
     p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ =
     Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with
     continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).
   PREREQUISITE
     PadicHodgeRegulators:L2/fontaine-iwasawa-map
   PREREQUISITE
     PadicHodgeRegulators:L2/local-iwasawa-twist
   PREREQUISITE
     PhiGammaModulesAndIwasawaCohomology:PG.1
   PREREQUISITE
     PhiGammaModulesAndIwasawaCohomology:PG.6
   PREREQUISITE
     PadicHodgeTheory:P7/robba-realisation-comparison
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L2/wach-psi-fixed-vectors (theorem): Berger: ψ-fixed vectors lie in the Wach module
   STATEMENT
     Assume H₀ and let V be E-linear crystalline with Hodge–Tate weights in [a; b], T ⊂ V a
     G-stable O_E-lattice and N(T) its Wach module (PG.6). (i) D(T)^{ψ=1} ⊂ π^{a−1}N(T). (ii) If V
     has no quotient isomorphic to E(a), then D(T)^{ψ=1} ⊂ π^a N(T). (iii) In particular, if a ≥ 0
     and V has no quotient isomorphic to E (equivalently, as a Q_p-representation, no quotient
     Q_p), then ψ(N(T)) ⊂ N(T), N(T)^{ψ=1} = D(T)^{ψ=1}, N(V)^{ψ=1} = D(V)^{ψ=1}, and h_Iw
     restricts to Λ-isomorphisms N(T)^{ψ=1} ≅ H^1_Iw(Q_p, T) and N(V)^{ψ=1} ≅ H^1_Iw(Q_p, V).
   HYPOTHESIS
     p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ =
     Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with
     continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).
   HYPOTHESIS
     V crystalline with weights in [a; b]; for (iii) a ≥ 0 and no quotient E.
   PREREQUISITE
     PhiGammaModulesAndIwasawaCohomology:PG.6
   PREREQUISITE
     PhiGammaModulesAndIwasawaCohomology:PG.4
   PREREQUISITE
     PadicHodgeRegulators:L2/fontaine-iwasawa-map
   PREREQUISITE
     PadicHodgeRegulators:L2/twist-compatibility
   PREREQUISITE
     PadicHodgeTheory:P7/wach-dcris-comparison
   PREREQUISITE
     PadicHodgeTheory:R06.1/fundamental-exact-sequence
   PREREQUISITE
     PadicHodgeTheory:R06.2/period-functors
   PREREQUISITE
     PadicHodgeTheory:R06.2/hodge-tate-weight-convention
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L2/character-specialisation (construction): Specialisation of Iwasawa classes at characters
   DECLARATION charSpecialization
   STATEMENT
     Assume H₀. For x ∈ H^1_Iw(Q_p, T) and a continuous character η of G_∞, put x_η :=
     Tw_{η^{−1}}(x) ∈ H^1_Iw(Q_p, T(η^{−1})) and x_{η,n} := pr_n(x_η) ∈ H^1(Q_p(μ_{p^n}),
     T(η^{−1})). (a) (λx)_{η,0} = η(λ)x_{η,0} for λ ∈ Λ. (b) If x = h_Iw(y) and η = χ^jω with ω of
     conductor p^m, then for n ≥ max(m, 1): x_{η,n} = pr_n(h_{Iw,T(η^{−1})}(y ⊗ e_{−j} ⊗
     e_{ω^{−1}})) and x_{η,0} = cor_{Q_p(μ_{p^n})/Q_p}(x_{η,n}), independent of n. (c) With T' =
     T(η^{−1}): 0 → (H^1_Iw(T')_{Γ_1})^Δ → H^1(Q_p, T') → (H^2_Iw(T')^{Γ_1})^Δ → 0.
   HYPOTHESIS
     p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ =
     Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with
     continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).
   PREREQUISITE
     PadicHodgeRegulators:L2/fontaine-iwasawa-map
   PREREQUISITE
     PadicHodgeRegulators:L2/local-iwasawa-twist
   PREREQUISITE
     PadicHodgeRegulators:L2/twist-compatibility
   PREREQUISITE
     SelmerIwasawaCohomology:L3/iwasawa-descent
   PREREQUISITE
     PadicMeasuresIwasawaAlgebras:L1/character-integral-algebra-hom
   API charSpecialization [data]
     charSpecialization η : H1Iw T →ₗ[O_E] H^1(ℚ_p, T(η⁻¹)).
   API charSpecialization_smul [relation]
     charSpecialization η (λ • x) = η(λ) • charSpecialization η x.
   API charSpecialization_fontaine [characterisation]
     charSpecialization η (h y) = cor (pr_n (h (y ⊗ e_{−j} ⊗ e_{ω⁻¹}))) for n ≥ max(m,1).
   API charSpecialization_descent [relation]
     The descent exact sequence (c).
   API charSpecialization_extensionality [extensionality]
     Two instances of this map agree iff their values agree on every element of the specified
     source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and
     map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred
     for the semilinear twist.
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

/- UNELABORATED CONTRACT PadicHodgeRegulators:L2/lattice-and-coefficient-squares (comparison): Lattice and coefficient-change squares
   STATEMENT
     Assume H₀. (a) For lattices U ⊂ T ⊂ V: D(U) ⊂ D(T) ⊂ D(V) compatibly with φ, ψ, G_∞ and h_Iw;
     H^1_Iw(Q_p, T) → H^1_Iw(Q_p, V) is injective with image h(D(V)^{ψ=1} ∩ D(T)); N(U) = N(V) ∩
     D(U), and U ↦ N(U) is an inclusion-preserving bijection between G-stable lattices and Wach
     lattices in N(V); under L2/wach-psi-fixed-vectors (iii), H^1_Iw(Q_p, T) = h(N(T)^{ψ=1}). (b)
     For E'/E finite, D, N, ψ, H^1_Iw, h, Λ and the Mellin transform commute with O_{E'} ⊗_{O_E}
     −; restriction of scalars to Z_p changes none of D, ψ, h.
   HYPOTHESIS
     p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ =
     Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with
     continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).
   PREREQUISITE
     PadicHodgeRegulators:L2/fontaine-iwasawa-map
   PREREQUISITE
     PadicHodgeRegulators:L2/wach-psi-fixed-vectors
   PREREQUISITE
     PhiGammaModulesAndIwasawaCohomology:PG.1
   PREREQUISITE
     PhiGammaModulesAndIwasawaCohomology:PG.5
   PREREQUISITE
     PhiGammaModulesAndIwasawaCohomology:PG.6
   PREREQUISITE
     PadicHodgeTheory:P7/integral-dcris-lattice
   PREREQUISITE
     PadicHodgeTheory:P7:annulus-foundations/coefficient-extension
   PREREQUISITE
     PadicMeasuresIwasawaAlgebras:L2/coefficient-extension-amice
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:L2/kummer-coleman-comparison (comparison): Kummer classes and Coleman power series
   STATEMENT
     Assume H₀ with T = Z_p(1). For a norm-compatible system u ∈ U_∞ of principal units of the
     tower Q_p(μ_{p^n}) with Coleman power series f_u (f_u(ε^{(n)} − 1) = u_n), Δ(f_u) := (1 +
     π)f_u'/f_u lies in A^{ψ=1}, and h_{Iw,Z_p(1)}(Δ(f_u) ⊗ e_1) = s·κ(u), where κ : U_∞ →
     H^1_Iw(Q_p, Z_p(1)) is the Kummer map of SelmerIwasawaCohomology (cocycle τ ↦ τ(α)/α) and s ∈
     {±1} is a sign whose value remains to be checked against Cherbonnier–Colmez's Proposition
     V.3.2 iii) and the cocycle of L2/fontaine-iwasawa-map (b). Independently of that sign, Δ(f_u)
     ⊗ e_1 ∈ N(Z_p(1))^{ψ=1}, and by L2/root-change (v) the element is independent of ε.
   HYPOTHESIS
     p odd; E/Q_p finite with ring of integers O_E; G_∞ = Gal(Q_p(μ_{p^∞})/Q_p) = Δ × Γ_1; Λ =
     Λ_{O_E}(G_∞); ε = (ζ_{p^n}) fixed and e_j = ε^{⊗j}; HT(E(1)) = +1; T a free O_E-lattice with
     continuous G_{Q_p}-action, V = T[1/p]; H^1_Iw(Q_p, T) = lim_cor H^1(Q_p(μ_{p^n}), T).
   HYPOTHESIS
     T = Z_p(1).
   PREREQUISITE
     PadicHodgeRegulators:L2/fontaine-iwasawa-map
   PREREQUISITE
     PadicHodgeRegulators:L2/root-change
   PREREQUISITE
     PadicHodgeRegulators:L2/wach-psi-fixed-vectors
   PREREQUISITE
     ColemanPowerSeries:L1/coleman-equivalence
   PREREQUISITE
     ColemanPowerSeries:L2/logarithmic-derivative
   PREREQUISITE
     ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map
   PREREQUISITE
     SelmerIwasawaCohomology:L4/local-units-iwasawa-cohomology
   PREREQUISITE
     SelmerIwasawaCohomology:L0/kummer-limit-map
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.1/teichmuller-unit-decomposition (comparison): Teichmüller decomposition of the units of a local field
   STATEMENT
     Let L be a nonarchimedean local field with valuation ring O_L, maximal ideal m_L and residue
     field F_q, q = p^f. Write ω = TauCeti.teichmuller L : F_q^× → O_L^× for the Teichmüller lift
     and U^1_L = 1 + m_L for the principal units. Then every u ∈ O_L^× factors uniquely as u =
     ω(ū)·⟨u⟩ with ū the residue of u and ⟨u⟩ := u·ω(ū)^{-1} ∈ U^1_L, so that O_L^× = μ_{q-1}(O_L)
     × U^1_L is an internal direct product; u ↦ ⟨u⟩ is a continuous group homomorphism onto U^1_L.
     The decomposition is natural for continuous field embeddings L → L' of local fields and for
     automorphisms of L, and, if L is a finite extension of Q_p, for every branch log_a of the
     p-adic logarithm (ColemanIntegration:L0/log-branch) one has log_a(u) = log(⟨u⟩), the series
     logarithm of the principal-unit part, because log_a vanishes on roots of unity.
   HYPOTHESIS
     L is a nonarchimedean local field of residue characteristic p (Mathlib's
     IsNonarchimedeanLocalField with Tau Ceti's valuative structure).
   HYPOTHESIS
     For the logarithm clause, L is identified with a subfield of C_p by a continuous embedding.
   HYPOTHESIS
     The logarithm clause is only for mixed characteristic L/Q_p finite. The unit decomposition is
     imported from LocalFieldsRamification Layer 1, not replanned here.
   PREREQUISITE
     tauceti:TauCeti.teichmuller
   PREREQUISITE
     tauceti:TauCeti.range_teichmuller
   PREREQUISITE
     tauceti:TauCeti.residue_teichmuller
   PREREQUISITE
     tauceti:TauCeti.eq_teichmuller
   PREREQUISITE
     ColemanIntegration:L0/log-branch
   PREREQUISITE
     tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-
     multiplicative-group
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.1/unramified-frobenius-on-roots (lemma): Frobenius on the roots of unity of an unramified field
   STATEMENT
     Let L be a finite unramified extension of Q_p with residue field F_q and let φ_L be its
     arithmetic Frobenius, the unique field automorphism of L over Q_p whose reduction is x ↦ x^p
     on F_q (an arithmetic Frobenius in the sense of IsArithFrobAt for the extension O_L/Z_p).
     Then φ_L(ω(α)) = ω(α^p) for every α ∈ F_q^×, hence φ_L(ζ) = ζ^p for every ζ ∈ μ_{q-1}(L); for
     p odd μ(L) = μ_{q-1}(L), so φ_L(ζ) = ζ^p for every root of unity of L. For a finite product L
     = ∏_i L_i of such fields put φ_L := ∏_i φ_{L_i}; then φ_L(ζ) = ζ^p componentwise. This is the
     rank-one relation φ_p ζ = ζ^p of GSWZ (176).
   HYPOTHESIS
     L/Q_p finite unramified (ramification index one); p any prime for the first two assertions, p
     odd for μ(L) = μ_{q−1}(L).
   PREREQUISITE
     PadicHodgeRegulators:D.1/teichmuller-unit-decomposition
   PREREQUISITE
     tauceti:TauCeti.eq_teichmuller
   PREREQUISITE
     mathlib:IsArithFrobAt
   PREREQUISITE
     tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.1/etale-algebra-dilogarithm (construction): Coleman's p-adic dilogarithm on a finite étale Q_p-algebra
   DECLARATION etaleDilog
   STATEMENT
     Let A be a finite étale Q_p-algebra, with its canonical decomposition A = ∏_{i∈I} A_i into
     finite field extensions A_i/Q_p (the primitive idempotents). Put A^adm := {z ∈ A : z_i ∉ {0,
     1} for every i}. For a finite extension M/Q_p and x ∈ M ∖ {0, 1} define D_M(x) :=
     ι^{-1}(D^0(ι(x))) for any Q_p-embedding ι : M → C_p, where D^0(z) = Li_2(z) +
     ½·log_p(z)·log_p(1 − z) is Coleman's dilogarithm for the Iwasawa branch log_p(p) = 0
     (ColemanIntegration:L2/dilogarithm-identities with a = 0); it lies in M and does not depend
     on ι. Define D_A : A^adm → A by D_A(z) := (D_{A_i}(z_i))_{i∈I}, and extend it additively to
     D_A : Z[A^adm] → A on the free abelian group of formal symbols [z]. This is GSWZ's D_p of
     (174) applied factor by factor.
   HYPOTHESIS
     A is a finite étale (equivalently finite reduced) commutative Q_p-algebra; p is any prime.
   HYPOTHESIS
     The branch of the logarithm is the Iwasawa branch log_p(p) = 0
     (ColemanIntegration:L0/iwasawa-logarithm).
   PREREQUISITE
     ColemanIntegration:L2/dilogarithm-identities
   PREREQUISITE
     ColemanIntegration:L0/iwasawa-logarithm
   PREREQUISITE
     ColemanIntegration:L2/galois-equivariance
   PREREQUISITE
     ColemanIntegration:L2/values-in-finite-extensions
   PREREQUISITE
     mathlib:PadicComplex
   PREREQUISITE
     mathlib:FreeAbelianGroup
   API etaleDilog [data]
     etaleDilog A : A → A is a componentwise total extension of the map on A^adm, assigning 0 at 0
     and 1 in each field factor. Only its restriction to A^adm has mathematical content; it is not
     required to be zero as an entire vector whenever one component is inadmissible.
   API etaleAdmissible [other]
     etaleAdmissible z : every component of z differs from 0 and 1 (the domain A^adm).
   API etaleDilog_apply_pi [simp]
     For A = ∏_i A_i and admissible z, (etaleDilog A z)_i = etaleDilog A_i z_i.
   API etaleDilog_field [compatibility]
     For a finite field extension M ⊂ C_p of Q_p and x ∈ M ∖ {0,1}, etaleDilog M x = D^0(x),
     Coleman's D for the Iwasawa branch.
   API etaleDilog_map [functoriality]
     For a Q_p-algebra homomorphism f : A → B of finite étale algebras with f(A^adm) ⊆ B^adm,
     etaleDilog B (f z) = f (etaleDilog A z).
   API etaleDilog_one_sub [relation]
     etaleDilog A (1 − z) = −etaleDilog A z for admissible z.
   API etaleDilog_inv [relation]
     etaleDilog A z⁻¹ = −etaleDilog A z for admissible z.
   API etaleDilog_fiveTerm [relation]
     For x, y ∈ A^adm with x − y a unit, D(x) − D(y) + D(y/x) − D((1 − x⁻¹)/(1 − y⁻¹)) + D((1 −
     x)/(1 − y)) = 0 componentwise (ColemanIntegration:L2/five-term-relation).
   API etaleDilog_rootOfUnity [simp]
     For ζ ∈ A with ζ^m = 1 and all components ≠ 1, etaleDilog A ζ = (Li_2(ζ_i))_i, since log_p
     vanishes on roots of unity.
   API etaleDilogHom [constructor]
     The additive extension FreeAbelianGroup A^adm →+ A, [z] ↦ etaleDilog A z.
   API etaleDilog_extensionality [extensionality]
     Two dilogarithm values in a finite product agree iff all component values agree. The additive
     extension is determined by its values on admissible FreeAbelianGroup generators; it preserves
     zero and addition, whereas D_A on admissible points is not an additive map.
   API etaleDilogHom_of [simp]
     etaleDilogHom D (FreeAbelianGroup.of z) = etaleDilog D z.val for z∈A^adm.
   TEST etaleDilog_neg_one [computation]
     For p odd, etaleDilog Q_p (−1) = 0: the inversion relation gives D(−1) = −D(−1).
   TEST etaleDilog_teichmuller_two_mod [computation]
     For p = 5 and ω = TauCeti.teichmuller Q_5 2 (a primitive 4th root of unity), etaleDilog Q_5 ω
     ∈ 25·Z_5 and etaleDilog Q_5 ω ≡ 25 mod 125 (by D.3/finite-polylogarithm-reduction, since
     li_{2,5}(2) = 1 in F_5); this is the Q_5-component of D_5(ζ_24) in GSWZ (273).
   TEST etaleDilog_zero_algebra [degenerate]
     For the zero algebra A = 0 (empty product), A^adm = {0} and etaleDilog A 0 = 0.
   TEST etaleDilog_diag [compatibility]
     For the diagonal Q_p → Q_p × Q_p and x ∉ {0,1}, etaleDilog (Q_p × Q_p) (x, x) = (D^0(x),
     D^0(x)), agreeing with ColemanIntegration's D^0.
   TEST etaleDilog_not_branch_one [non-example]
     With the branch log_1 (log_1(p) = 1) instead of the Iwasawa branch, D^1(p) − D^0(p) =
     ½·log_p(1 − p) ≠ 0 (ColemanIntegration:L2/dilogarithm-identities (d)); a definition with an
     unpinned branch is wrong at z = p ∈ Q_p^adm.
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.1/dilogarithm-scalar-extension (lemma): Frobenius and extension-of-scalars squares for the p-adic dilogarithm
   STATEMENT
     Let A → B be an injective homomorphism of finite étale Q_p-algebras (for instance K ⊗ Q_p →
     K' ⊗ Q_p for an extension of number fields K ⊂ K', or the inclusion of a factor-wise
     extension of local fields). (a) Extension of scalars: for z ∈ A^adm, D_B(ι z) = ι(D_A(z)).
     (b) Automorphisms: for every Q_p-algebra automorphism τ of A, D_A(τ z) = τ(D_A(z)); in
     particular, for a finite unramified product A with Frobenius φ_A (D.1/unramified-frobenius-
     on-roots), D_A(φ_A z) = φ_A(D_A(z)) and D_A(ζ^p) = φ_A(D_A(ζ)) for every root of unity ζ of
     order prime to p with all components ≠ 1. (c) Trace: if B is free over A, then Tr_{B/A}(D_B(ι
     z)) = [B : A]·D_A(z) for z ∈ A^adm. (d) Frobenius-modified value: for A unramified and ζ ∈
     μ(A) of order prime to p with all components ≠ 1, (1 − p^{-2}φ_A)(D_A(ζ)) = ℓ_2(ζ), the
     integral modified dilogarithm of ColemanIntegration:L2/integral-modified-polylogarithm, which
     lies in O_A. (e) Frobenius behaviour on residue discs of special units: for p odd, A
     unramified and z ∈ O_A with z and 1 − z units in every factor, D_A(z) − p^{−2}D_A(z^p) =
     Li^{(p)}_2(z) − ½·log_p(z)·Li^{(p)}_1(z) componentwise, and this lies in O_A (Li^{(p)}_k =
     ℓ_k is bounded by 1 off the residue disc of 1, and log_p(z) ∈ pO_A).
   HYPOTHESIS
     A, B finite étale Q_p-algebras; the Iwasawa branch throughout.
   HYPOTHESIS
     In (b) for Frobenius and in (d), A is a finite product of finite unramified extensions of
     Q_p.
   PREREQUISITE
     PadicHodgeRegulators:D.1/etale-algebra-dilogarithm
   PREREQUISITE
     PadicHodgeRegulators:D.1/unramified-frobenius-on-roots
   PREREQUISITE
     ColemanIntegration:L2/galois-equivariance
   PREREQUISITE
     ColemanIntegration:L2/values-at-tame-roots-of-unity
   PREREQUISITE
     ColemanIntegration:L2/integral-modified-polylogarithm
   PREREQUISITE
     ColemanIntegration:L2/frobenius-relation
   PREREQUISITE
     PadicHodgeRegulators:D.1/unit-logarithm-kernel
   PREREQUISITE
     mathlib:Algebra.trace
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.1/combined-dilogarithm (construction): The combined p-adic dilogarithm of a number field
   DECLARATION blochDilog
   STATEMENT
     Let K be a number field, p a prime and K_p := K ⊗_Q Q_p, a finite étale Q_p-algebra
     identified with ∏_{v|p} K_v by Tau Ceti's semilocal equivalence (NumberFieldArithmetic layer
     5). Define D_{K,p} on the free abelian group Z[K^×] by [z] ↦ D_{K_p}(z ⊗ 1) for z ≠ 1
     (D.1/etale-algebra-dilogarithm; z ⊗ 1 is admissible) and [1] ↦ 0. Its v-component is D_σ([z])
     = D^0(σ_v(z)) for the embedding σ_v : K → K_v ⊂ C_p, as in GSWZ §3.1. D_{K,p} kills the five-
     term relations, hence factors through the pre-Bloch group P(K) of K3BlochGroups:V.3/pre-
     bloch-group, and restricts to D_{K,p} : B(K) → K_p on Suslin's Bloch group. On B(K) the map
     does not depend on the branch of the logarithm used to define D.
   HYPOTHESIS
     K a number field, p any prime; the integrality statements of D.3–D.4 add p > 3 unramified in
     K.
   HYPOTHESIS
     The Iwasawa branch is used to define D; branch independence is asserted only on B(K).
   PREREQUISITE
     PadicHodgeRegulators:D.1/etale-algebra-dilogarithm
   PREREQUISITE
     K3BlochGroups:V.3/pre-bloch-group
   PREREQUISITE
     K3BlochGroups:V.3/bloch-group
   PREREQUISITE
     K3BlochGroups:V.3/five-term-relation
   PREREQUISITE
     ColemanIntegration:L2/five-term-relation
   PREREQUISITE
     ColemanIntegration:L2/dilogarithm-identities
   PREREQUISITE
     tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-
     places
   API combinedDilog [data]
     combinedDilog K p : FreeAbelianGroup Kˣ →+ K ⊗[ℚ] ℚ_[p], with [1] ↦ 0.
   API combinedDilog_of [simp]
     combinedDilog K p [z] = etaleDilog (K ⊗ ℚ_[p]) (z ⊗ 1).
   API combinedDilog_component [projection]
     Under K ⊗ Q_p ≅ ∏_{v|p} K_v, the v-component of combinedDilog K p [z] is D^0(σ_v z).
   API combinedDilog_fiveTerm [relation]
     combinedDilog vanishes on the five-term subgroup, giving preBlochDilog K p : P(K) →+ K ⊗ Q_p.
   API blochDilog [constructor]
     blochDilog K p : B(K) →+ K ⊗ Q_p, the restriction of preBlochDilog to Suslin's Bloch group.
   API blochDilog_branch_indep [characterisation]
     For any branch parameter a ∈ Q_p, the Bloch-group map built from D^a equals blochDilog K p.
   API blochDilog_map [functoriality]
     For a field embedding K → K', blochDilog K' p ∘ B(ι) = (ι ⊗ 1) ∘ blochDilog K p.
   API blochDilog_galois [functoriality]
     For τ ∈ Aut(K), blochDilog K p ∘ B(τ) = (τ ⊗ 1) ∘ blochDilog K p.
   API combinedDilog_extensionality [extensionality]
     Two instances of this map agree iff their values agree on every element of the specified
     source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and
     map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred
     for the semilinear twist.
   TEST combinedDilog_rat [compatibility]
     For K = Q, combinedDilog Q p [z] = D^0(z) ∈ Q_p, the ColemanIntegration value.
   TEST combinedDilog_zero [degenerate]
     combinedDilog K p 0 = 0, and blochDilog vanishes on the subgroup generated by [x] + [x⁻¹] for
     x ≠ 0, 1.
   TEST blochDilog_cubic_five [computation]
     For K = Q(α), α³ − α² + 1 = 0, ξ = 2[1 − α²] + [1 − α] ∈ B(K) and p = 5, blochDilog K 5 ξ =
     (3·5² + 5³ + 2·5⁴ + …)α² + (5² + 3·5³ + …)α + (2·5² + 3·5³ + …), GSWZ (271).
   TEST combinedDilog_not_on_bloch_branch [non-example]
     On the pre-Bloch group the map depends on the branch: for p odd the symbol [p] ∈ P(Q) has
     D^1([p]) − D^0([p]) = ½·log_p(1 − p) ≠ 0, so branch independence is not asserted off B(K)
     ([p] ∉ B(Q) since p ∧ (1 − p) ≠ 0).
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.1/regulator-normalisation-dictionary (comparison): Dictionary of dilogarithm and regulator normalisations
   STATEMENT
     Fix the Iwasawa branch. On C_p ∖ {0,1}: (i) GSWZ's D_p(z) = Li_2(z) + ½ log(z) log(1 − z)
     (GSWZ (174)) equals Coleman's D(z) (ColemanIntegration:L2/dilogarithm-identities with a = 0),
     Besser–de Jeu's L_mod,2(z) = L_2(z) + ½ log(z) L_1(z) = Li_2(z) − ½ log(z) Li_1(z) (BdJ §1,
     the unique choice for n = 2), and the n = 2 case L^mod_2 = Li_2 + B_1 Li_1 log of
     ColemanIntegration:L3/padic-regulator-polylogarithm (B_1 = −1/2, Li_1(z) = −log(1 − z)). (ii)
     Besser–de Jeu's regulator formula carries the factor ±(n − 1)!, which is ±1 for n = 2; the
     sign is the indeterminacy of BdJ Remark 1.7 and is fixed once in D.3/local-regulator. (iii)
     Gros's syntomic regulator on an unramified field satisfies reg^Gros = (1 −
     Frob/p²)·reg^Besser in weight two (BdJ Remark 1.13); on a root of unity ζ of order prime to p
     it takes the value ℓ_2(ζ) = Li_2(ζ) − p^{-2}Li_2(ζ^p) ∈ O, while the Besser value Li_2(ζ)
     lies in p²O (D.1/dilogarithm-scalar-extension (d)). (iv) The Bloch–Kato normalisation: under
     D_dR(Q_p(2)) = L·e_2, e_2 = t^{-2}⊗ε^{⊗2}, with t = log[ε] the period of Q_p(1), the
     regulator of GSWZ is ε·log_BK∘c_{2,1} for one sign ε ∈ {±1} (D.2/syntomic-etale-regulator-
     comparison). (v) On roots of unity ζ ≠ 1 every branch gives the same value D(ζ) = Li_2(ζ),
     and on special units (|z| = |1 − z| = 1) D is branch independent.
   HYPOTHESIS
     p any prime for (i), (ii) and (v); (iii) and (iv) concern unramified, respectively arbitrary,
     finite extensions L/Q_p.
   PREREQUISITE
     ColemanIntegration:L2/dilogarithm-identities
   PREREQUISITE
     ColemanIntegration:L3/padic-regulator-polylogarithm
   PREREQUISITE
     ColemanIntegration:L2/branch-dependence
   PREREQUISITE
     PadicHodgeRegulators:D.1/dilogarithm-scalar-extension
   PREREQUISITE
     mathlib:bernoulli
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.1/unit-logarithm-kernel (lemma): Kernel of the logarithm on local units and the p-adic regulator matrix
   STATEMENT
     (a) Let L/Q_p be finite. The Iwasawa logarithm restricts to a continuous homomorphism log_p :
     O_L^× → L whose kernel is the finite group μ(L) of all roots of unity in L (including those
     of p-power order, and ±1 when p = 2) and whose image is an open Z_p-submodule of L; hence
     log_p induces an isomorphism (O_L^×)^∧_p ⊗_{Z_p} Q_p ≅ L, and for L unramified and p odd it
     maps U^1_L = 1 + pO_L isomorphically onto pO_L. (b) Let F be a number field, E_F its unit
     group and ε_1, …, ε_r a basis of E_F modulo torsion. The composite E_F ⊗ Z_p →
     ∏_{v|p}(O_v^×)^∧_p → ∏_{v|p} F_v = F ⊗ Q_p (completion followed by log_p), after the scalar
     extension F ⊗ Q_p ⊗_{Q_p} C_p ≅ C_p^{Hom(F, C_p)}, has matrix (log_p σ_j(ε_i))_{i ≤ r, j ≤
     [F:Q]}. In particular rr_p(F), the rank of this matrix (Polylogarithms:P.6/padic-regulator),
     is the Z_p-rank of the image of E_F ⊗ Z_p in ∏_{v|p}(O_v^×)^∧_p, and Leopoldt's conjecture
     for (F,p) is injectivity of the rational unit logarithm (E_F/μ(F))⊗_Z Q_p → F⊗_Q Q_p. This is
     equivalent to full rank r of the displayed logarithm matrix; torsion is removed before
     stating the rank criterion.
   HYPOTHESIS
     log_p is the Iwasawa branch (log_p(p) = 0); embeddings σ_j : F → C_p are the [F:Q] field
     embeddings.
   PREREQUISITE
     ColemanIntegration:L0/iwasawa-logarithm
   PREREQUISITE
     ColemanIntegration:L0/log-one-add-convergence
   PREREQUISITE
     ColemanIntegration:L0/log-branch-field-compatibility
   PREREQUISITE
     PadicHodgeRegulators:D.1/teichmuller-unit-decomposition
   PREREQUISITE
     tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-
     places
   PREREQUISITE
     tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-
     multiplicative-group
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.1/logarithm-norm-trace (lemma): The logarithm takes norms to traces
   STATEMENT
     Let A → B be a finite free extension of finite étale Q_p-algebras (for instance an extension
     of finite products of p-adic fields, or K ⊗ Q_p → K' ⊗ Q_p for number fields K ⊂ K'). For
     every u ∈ B^× with log_p defined componentwise, log_p(N_{B/A}(u)) = Tr_{B/A}(log_p(u)). In
     particular, for an extension of p-adic fields L'/L, log_p ∘ N_{L'/L} = Tr_{L'/L} ∘ log_p on
     L'^×, and the same holds on the completed unit groups.
   HYPOTHESIS
     log_p is the Iwasawa branch, applied factor by factor.
   PREREQUISITE
     ColemanIntegration:L0/iwasawa-logarithm
   PREREQUISITE
     ColemanIntegration:L0/log-branch-field-compatibility
   PREREQUISITE
     mathlib:Algebra.norm
   PREREQUISITE
     mathlib:Algebra.trace
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.2/etale-regulator (construction): Soulé's étale regulator to continuous Galois cohomology
   DECLARATION etaleRegulator
   STATEMENT
     Let F be a field of characteristic 0 (a number field, a finite extension of Q_p, or a finite
     product of such), p a prime and n ≥ 1. The étale regulator r^et_n : K_{2n−1}(F) → H^1(F,
     Z_p(n)) is the composite of the reductions K_{2n−1}(F) → K_{2n−1}(F; Z/p^ν), Soulé's étale
     Chern classes c_{n,1} : K_{2n−1}(F; Z/p^ν) → H^1(F, μ_{p^ν}^{⊗n}) (compatible in ν), and the
     inverse limit H^1(F, Z_p(n)) = lim_ν H^1(F, μ_{p^ν}^{⊗n}) of continuous cohomology; it
     factors through the completion K_{2n−1}(F; Z_p) and induces r^et_n ⊗ Q : K_{2n−1}(F) ⊗ Q_p →
     H^1(F, Q_p(n)). For n = 1 it is the Kummer map F^× → H^1(F, Z_p(1)). For F a finite extension
     of Q_p and n ≥ 2 the map on completed K-theory is the isomorphism of
     KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1.
   HYPOTHESIS
     F of characteristic 0; Chern classes in the normalisation of Soulé (Chern classes, not Chern
     character components); n ≥ 1.
   PREREQUISITE
     MotivicEtaleKTheory:M.7
   PREREQUISITE
     MotivicEtaleKTheory:M.1
   PREREQUISITE
     KTheoryFiniteLocalFields:L.1/k-theory-mod-m
   PREREQUISITE
     KTheoryFiniteLocalFields:L.1/completed-k-theory
   PREREQUISITE
     KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1
   PREREQUISITE
     KTheoryFiniteLocalFields:L.7/etale-chern-class-completion
   PREREQUISITE
     ArithmeticGaloisDuality:R02.1/tate-inverse-limit
   PREREQUISITE
     tauceti:TauCeti.kummerClassMap
   PREREQUISITE
     SelmerIwasawaCohomology:L0/padic-kummer-identification
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
   API etaleRegulator_extensionality [extensionality]
     Two instances of this map agree iff their values agree on every element of the specified
     source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and
     map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred
     for the semilinear twist.
   TEST etaleRegulator_kummer [compatibility]
     For F = Q_p, n = 1 and u ∈ Z_p^×, etaleRegulator F p 1 u is the image of u under lim_ν of Tau
     Ceti's kummerClassMap.
   TEST etaleRegulator_rank_q5 [computation]
     For F = Q_5, n = 2, the completed etaleRegulator is a ℤ_5-linear isomorphism between free
     modules of rank 1.
   TEST etaleRegulator_torsion_Q [degenerate]
     For F = Q and n = 2, K_3(Q) ≅ Z/48 is torsion, so the image of etaleRegulator Q p 2 lies in
     the torsion of H^1(Q, Z_p(2)) and its rationalisation is 0.
   TEST etaleRegulator_not_basis_functional [non-example]
     For F = Q_{p²} and p > 3, a ℤ_p-isomorphism K_3(F; ℤ_p) ≅ ℤ_p² chosen from bases is not
     etaleRegulator: etaleRegulator commutes with the Frobenius automorphism of F, while a generic
     basis isomorphism does not.
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.2/rigid-syntomic-cohomology (definition): Rigid syntomic cohomology of smooth schemes over a p-adic integer ring
   DECLARATION rigidSyntomicCohomology
   STATEMENT
     Let R be a complete discrete valuation ring of characteristic 0 with perfect residue field k
     of characteristic p and fraction field K, R_0 = W(k), K_0 = R_0[1/p], and n ∈ Z. For a smooth
     R-scheme X with syntomic data (a smooth P_0 over R_0 with a σ-semilinear Frobenius lift Φ, a
     smooth P over R, X ↪ P and P_0 → P), Besser's rigid syntomic complex is RΓ_syn(X, n) :=
     Cone(Fil^n RΓ_dR(X_K) ⊕ RΓ_rig(X_k/K_0) → RΓ_rig(X_k/K) ⊕ RΓ_rig(X_k/K_0))[−1], (a, b) ↦ (a −
     b, (1 − Φ*/p^n)b), with RΓ_rig from overconvergent de Rham complexes on the tubes; its
     cohomology H^i_syn(X, n) is independent of the syntomic data and functorial in X. For X =
     Spec R and n ≥ 1, H^i_syn(Spec R, n) = 0 for i ≠ 1 and the de Rham component η : H^1_syn(Spec
     R, n) ≅ K is an isomorphism (1 − σ/p^n being bijective on K_0).
   HYPOTHESIS
     R a complete DVR, char K = 0, k perfect of characteristic p (finite in the arithmetic
     applications); X smooth, separated and of finite type over R.
   PREREQUISITE
     PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology
   PREREQUISITE
     PadicDifferentialEquationsAndRigidCohomology:RD.4/overconvergent-de-rham-complex
   PREREQUISITE
     PadicDifferentialEquationsAndRigidCohomology:RD.4/frobenius-on-rigid-cohomology
   PREREQUISITE
     PadicDifferentialEquationsAndRigidCohomology:RD.4/monsky-washnitzer-comparison
   PREREQUISITE
     DerivedDeRhamCohomology:DD.2
   API rigidSyntomicCohomology [data]
     rigidSyntomicCohomology X n i : the Q_p-vector space H^i_syn(X,n); 1−Φ/p^n is Q_p-linear. At
     Spec R, η transports the K-module structure if desired.
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
   API rigidSyntomicCohomology_extensionality [extensionality]
     The cohomology carrier is obtained from the specified Q_p-linear cone. Functorial induced
     maps are equal when the corresponding chain maps are homotopic; cohomology-map equality is
     pointwise. A homotopy does not assert equality of raw complexes.
   TEST rigidSyntomic_zp_two [computation]
     For R = Z_p, H^1_syn(Spec Z_p, 2) ≅ Q_p via η, and, with Huber–Kings' cone map (a, b) ↦ (a −
     b, (1 − Φ/p^n)b), the class of (0, c) with c ∈ Q_p maps to (1 − 1/p²)^{−1}c.
   TEST rigidSyntomic_weight_zero [degenerate]
     For n = 0 and X = Spec R, H^0_syn(Spec R, 0) ≅ Q_p (the kernel of 1 − σ on K_0 is Q_p) and
     the η-isomorphism of the n ≥ 1 case does not hold.
   TEST rigidSyntomic_monsky_washnitzer [compatibility]
     For X smooth affine, the rigid terms are Monsky–Washnitzer cohomology of the dagger algebra
     (PadicDifferentialEquationsAndRigidCohomology:RD.4/monsky-washnitzer-comparison).
   TEST rigidSyntomic_not_de_rham [non-example]
     H^1_syn(Spec R, n) is not Fil^n H^0_dR(K) (which is 0 for n ≥ 1): the syntomic group sees the
     cone, not the filtration step.
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.2/syntomic-regulator (construction): Besser's syntomic regulator
   DECLARATION syntomicRegulator
   STATEMENT
     For a smooth R-scheme X (R as in D.2/rigid-syntomic-cohomology) and i, j ≥ 0, the syntomic
     Chern classes c^syn_{i,j} : K_j(X) → H^{2i−j}_syn(X, i) are obtained by evaluating the
     universal syntomic Chern classes c_i ∈ H^{2i}_syn(B_•GL_N, i) — characterised by mapping to
     the de Rham Chern classes in Fil^i H^{2i}_dR — through Gillet's formalism. For X = Spec R and
     n ≥ 1 the syntomic regulator is reg_syn := η ∘ c^syn_{n,2n−1} : K_{2n−1}(R) → K; for n ≥ 2 it
     factors through K_{2n−1}(R) ⊗ Q ≅ K_{2n−1}(K) ⊗ Q. It is compatible with finite extensions R
     → R' (reg_syn,R' ∘ K(ι) = ι ∘ reg_syn,R) and with automorphisms of R, and for n = 1 it is
     log_p on R^×.
   HYPOTHESIS
     R a complete DVR of characteristic 0 with perfect residue field; for the arithmetic uses the
     residue field is algebraic over F_p and the branch of log is the Iwasawa branch.
   PREREQUISITE
     PadicHodgeRegulators:D.2/rigid-syntomic-cohomology
   PREREQUISITE
     SchemeKTheoryOperations:S.7/chern-character
   PREREQUISITE
     SchemeKTheoryOperations:S.5/projective-bundle-theorem
   PREREQUISITE
     KTheoryFiniteLocalFields:L.2/odd-k-ring-of-integers-equals-field
   PREREQUISITE
     GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring
   API syntomicChernClass [data]
     syntomicChernClass X i j : K_j(X) →+ H^{2i−j}_syn(X, i).
   API syntomicRegulator [constructor]
     syntomicRegulator R n := η ∘ syntomicChernClass (Spec R) n (2n−1) : K_{2n−1}(R) →+ K.
   API syntomicRegulator_one [compatibility]
     syntomicRegulator R 1 u = log_p u for u ∈ Rˣ (Iwasawa branch).
   API syntomicRegulator_baseChange [functoriality]
     For a finite extension R → R' with fraction fields K ⊂ K', syntomicRegulator R' n ∘ K(ι) = ι
     ∘ syntomicRegulator R n.
   API syntomicRegulator_aut [functoriality]
     For an automorphism τ of R, syntomicRegulator R n ∘ K(τ) = τ ∘ syntomicRegulator R n.
   API syntomicChernClass_deRham [characterisation]
     The image of the universal class in Fil^i H^{2i}_dR(B_•GL_N) is the de Rham Chern class.
   API syntomicChernClass_extensionality [extensionality]
     Two instances of this map agree iff their values agree on every element of the specified
     source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and
     map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred
     for the semilinear twist.
   TEST syntomicRegulator_log [computation]
     For R = Z_p (p odd) and u = 1 + p, syntomicRegulator Z_p 1 u = log(1 + p) = p − p²/2 + p³/3 −
     … .
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

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison (theorem): The syntomic regulator is the Bloch–Kato logarithm of the étale regulator
   STATEMENT
     Let R be the integer ring of a finite extension K of Q_p and n ≥ 1. The natural map ρ_syn :
     H^1_syn(Spec R, n) → H^1(K, Q_p(n)) (compatible with Chern classes) equals exp_BK ∘ η, where
     exp_BK : K = D_dR(Q_p(n))/Fil^0 → H^1(K, Q_p(n)) is the Bloch–Kato exponential (L1/bloch-
     kato-exponential, with D_dR(Q_p(n)) = K·e_n (e_n=t^{−n}⊗ε^{⊗n})). Consequently, on
     K_{2n−1}(R): r^et_n ⊗ Q = exp_BK ∘ reg_syn, with no constant when both regulators use Chern
     classes. For n ≥ 2, exp_BK is an isomorphism and reg_syn = log_BK ∘ r^et_n; for n = 1 this is
     ∂ = exp_BK ∘ log_p on R^× (Bloch–Kato 3.10.1). For a smooth variety X over K the same Chern-
     class compatibility holds for the Nekovář–Nizioł syntomic regulator: ρ_syn ∘ c^syn_{i,j} =
     c^et_{i,j}, and the syntomic boundary followed by the arithmetic edge map H^q_dR(X)/F^r →
     H^1(G_K, H^q_et(X_K̄, Q_p(r))) is the Bloch–Kato exponential of H^q_et(X_K̄, Q_p(r)).
   HYPOTHESIS
     K/Q_p finite (any ramification); n ≥ 1; Chern-class normalisation for both regulators.
   PREREQUISITE
     PadicHodgeRegulators:D.2/syntomic-regulator
   PREREQUISITE
     PadicHodgeRegulators:D.2/etale-regulator
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-exponential
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-logarithm
   PREREQUISITE
     PadicHodgeRegulators:D.2/rigid-syntomic-cohomology
   PREREQUISITE
     SelmerIwasawaCohomology:L0/padic-kummer-identification
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison (theorem): Besser–de Jeu: the weight-two regulator is Coleman's dilogarithm on special units
   STATEMENT
     Let F be a field of characteristic 0, O ⊂ F a discrete valuation ring with residue field κ,
     and σ : F → K an embedding into a complete discretely valued subfield K ⊂ C_p with σ(O) ⊂ R
     (so κ is algebraic over F_p). Let ξ ∈ K_3(O) ⊗ Q be the image, under de Jeu's map
     H^1(M̃^{(2)}(O)) → K^{(2)}_3(O), of an element Σ_i n_i [x_i]_2 with n_i ∈ Q, x_i ∈ O^♭
     special units (x_i, 1 − x_i ∈ O^×) and Σ_i n_i (1 − x_i) ∧ x_i = 0 in ∧²(O^×) ⊗ Q. Then
     reg_syn(σ_* ξ) = ±Σ_i n_i D(σ(x_i)), with D = L_mod,2 Coleman's dilogarithm (D.1/regulator-
     normalisation-dictionary), the sign being the single sign indeterminacy of de Jeu's map. For
     F a number field and O its localisation at a prime above p the same holds without further
     hypotheses, and for every root of unity ζ ≠ 1 of F (of any order) the cyclotomic element
     [ζ]_2 satisfies reg_syn(σ_*[ζ]_2) = ±Li_2(σζ). Combined with D.2/syntomic-etale-regulator-
     comparison: log_BK(r^et_2(σ_* ξ)) = ±Σ_i n_i D(σ x_i). For arbitrary elements of B(F) ⊗ Q
     (symbols that are not special units of O) the identity is Besser–de Jeu's Conjecture 1.14 and
     is not asserted.
   HYPOTHESIS
     n = 2 (no Beilinson–Soulé hypothesis is needed in weight two).
   HYPOTHESIS
     Every x_i is a special unit of O; the comparison of de Jeu's weight-two complex with Suslin's
     Bloch group (requested from Polylogarithms:P.4) transports the statement to B(F) ⊗ Q.
   PREREQUISITE
     PadicHodgeRegulators:D.2/syntomic-regulator
   PREREQUISITE
     PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison
   PREREQUISITE
     PadicHodgeRegulators:D.1/regulator-normalisation-dictionary
   PREREQUISITE
     PadicHodgeRegulators:D.1/combined-dilogarithm
   PREREQUISITE
     Polylogarithms:P.4
   PREREQUISITE
     K3BlochGroups:V.4/suslin-exact-sequence
   PREREQUISITE
     K3BlochGroups:V.6/comparison-rational
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.2/higher-weight-polylogarithm-comparison (theorem): Besser–de Jeu: the syntomic regulator in higher weight
   STATEMENT
     Let F be a number field, O the localisation of O_F at a prime above p, σ : F → K an embedding
     into a complete discretely valued subfield K ⊂ C_p with σ(O) ⊂ R, and n ≥ 2. On de Jeu's
     H^1(M̃^{(n)}(O)) → K^{(n)}_{2n−1}(O) ≅ K^{(n)}_{2n−1}(F), the composite with σ_* and reg_syn
     maps [x]_n (x a special unit of O) to ±(n − 1)!·L_mod,n(σ(x)), and for every root of unity ζ
     ≠ 1 of F (of any order) maps the cyclotomic element [ζ]_n to ±(n − 1)!·L_mod,n(σζ) = ±(n −
     1)!·Li_n(σζ). For a field F of characteristic 0 and a discrete valuation ring O ⊂ F, the same
     holds on special units under the Beilinson–Soulé conjecture for F and its residue field (n ≥
     3). L_mod,n is the modified polylogarithm of ColemanIntegration:L3/padic-regulator-
     polylogarithm. For n = 2 this is D.2/weight-two-dilogarithm-comparison.
   HYPOTHESIS
     n ≥ 2; F a number field (no further hypothesis), or the Beilinson–Soulé conjecture for F and
     κ when n ≥ 3.
   HYPOTHESIS
     The comparison of de Jeu's complexes with K-theory in weight n is requested from
     Polylogarithms:P.4.
   PREREQUISITE
     PadicHodgeRegulators:D.2/syntomic-regulator
   PREREQUISITE
     PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison
   PREREQUISITE
     ColemanIntegration:L3/padic-regulator-polylogarithm
   PREREQUISITE
     ColemanIntegration:L2/distribution-relation
   PREREQUISITE
     Polylogarithms:P.4
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.2/gros-normalisation (comparison): Gros's normalisation of the syntomic regulator
   STATEMENT
     Let K/Q_p be finite unramified with Frobenius σ and n ≥ 1. Gros's syntomic regulator is
     reg^Gros_n = (1 − σ/p^n) ∘ reg_syn on K_{2n−1}(O_K), with reg_syn = η ∘ c^syn of
     D.2/syntomic-regulator. On a cyclotomic element [ζ]_n with ζ a root of unity of order prime
     to p it takes the value Li^{(p)}_n(ζ) = Li_n(ζ) − p^{−n}Li_n(ζ^p) if the cyclotomic symbol is
     normalized by the same de Jeu map as D.2/higher-weight-polylogarithm-comparison, with its
     sign and factor (n−1)!. Agreement with Gros’s own symbol normalization for n>2 is not
     inferred here; for n = 2 this is ±ℓ_2(ζ) ∈ O_K, whereas reg_syn([ζ]_2) = ±Li_2(ζ) ∈ p²O_K.
     The Gros regulator is defined only for unramified K.
   HYPOTHESIS
     K/Q_p finite unramified, σ its Frobenius; p ∤ ord(ζ).
   PREREQUISITE
     PadicHodgeRegulators:D.2/syntomic-regulator
   PREREQUISITE
     PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison
   PREREQUISITE
     PadicHodgeRegulators:D.1/dilogarithm-scalar-extension
   PREREQUISITE
     ColemanIntegration:L2/values-at-tame-roots-of-unity
   PREREQUISITE
     PadicHodgeRegulators:D.2/higher-weight-polylogarithm-comparison
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.2/log-syntomic-complex (comparison): Log-syntomic complexes S_n(r)
   STATEMENT
     Let O_K be a complete discrete valuation ring of mixed characteristic (0, p) with perfect
     residue field k, O_F = W(k), and let X be an fs log-scheme, log-smooth over O_K^× (O_K with
     the log structure of its closed point); X_n := X ⊗ Z/p^n. For r ≥ 0 the mod-p^n log-syntomic
     complex is RΓ_syn(X, r)_n := [RΓ_cr(X, J^{[r]})_n --(p^r − φ)--> RΓ_cr(X)_n] (homotopy
     fibre), where RΓ_cr(X, J^{[r]})_n is absolute log-crystalline cohomology of X_n over W_n(k)
     with coefficients in the r-th divided-power ideal J^{[r]} (J^{[r]} = O for r ≤ 0) and φ is
     the crystalline Frobenius; its étale sheafification on X_0 is S_n(r)_X ≃ [J^{[r]}_{cr,n}
     --(p^r − φ)--> A_{cr,n}], with RΓ_syn(X, r)_n = RΓ(X_{0,ét}, S_n(r)_X). The completed version
     is RΓ_syn(X, r) := holim_n RΓ_syn(X, r)_n, with RΓ_syn(X, r)_n ≃ RΓ_syn(X, r) ⊗^L Z/p^n, and
     rationally RΓ_syn(X, r)_Q ≃ Cone(RΓ_cr(X, J^{[r]})_Q --(1 − φ_r)--> RΓ_cr(X)_Q)[−1] with φ_r
     = φ/p^r. This is CN §5.1.1’s undivided convention p^r−φ. A classical divided-Frobenius
     convention uses 1−φ_r on the appropriate Frobenius-divisible ideal. These are identified
     after inverting p; the integral comparison must be provided explicitly, not assumed termwise.
   HYPOTHESIS
     X fs, log-smooth over O_K^×, of Cartier type where comparisons with Hyodo–Kato cohomology are
     used; O_K need not be unramified.
   HYPOTHESIS
     r ≥ 0, n ≥ 1.
   HYPOTHESIS
     Required supplier contract in the early classical log-syntomic prefix of
     CohomologyComparisons Part II, per the accepted verification of RT-AREA-iwasawa-2/3. CP.4 is
     only the routing anchor; its current rational proper B_st comparison does not supply this
     integral/open construction.
   PREREQUISITE
     CrystallineCohomology:CR.5
   PREREQUISITE
     CrystallineCohomology:CR.3
   PREREQUISITE
     CrystallineCohomology:CR.0/pd-filtration
   PREREQUISITE
     PadicHodgeTheory:R06.1/crystalline-period-ring
   PREREQUISITE
     CohomologyComparisons:CP.4
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
     For X = Spec O_K (log structure of the closed point), r = 2: H^1(logSyntomicCompleted X 2) is
     p^{N}-isomorphic to O_K and H^2 to 0.
   TEST logSyntomic_weight_zero [degenerate]
     For r = 0, J^{[0]} = O and S_n(0) is the fibre of 1 − φ on A_{cr,n}; on X = Spec O_K its H^0
     is Z/p^n.
   TEST logSyntomic_rigid_compat [compatibility]
     For X smooth over O_K with trivial horizontal log structure and K unramified, the rational
     complex agrees with D.2/rigid-syntomic-cohomology (both compute the fibre of 1 − φ_r against
     the Hodge filtration).
   TEST logSyntomic_not_naive_twist [non-example]
     At r=p−1 the chosen Euclidean decomposition gives a(r)=1 and Z_p(r)′=p^{-1}Z_p(r), whereas at
     r=p−2 it gives a(r)=0 and the ordinary twist. Replacing all modified lattices by the ordinary
     lattice loses this normalization.
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map (comparison): The Fontaine–Messing–Kato period morphism
   STATEMENT
     For X as in D.2/log-syntomic-complex, i:X_0→X and j:X_tr→X, the required supplier defines the
     Fontaine–Messing–Kato morphism α^FM_{r,n}:S_n(r)_X→i^*Rj_*Z/p^n(r)′, r≥0, compatible with
     reduction and the source’s product convention. Here Z_p(r)′=p^{-a(r)}Z_p(r) with
     r=(p−1)a(r)+b(r), 0≤b(r)<p−1. CN §4.7 constructs its local map using period rings, the
     crystalline Poincaré lemma and the integral fundamental-sequence maps. The p^r-exact
     fundamental sequence gives only a p-power comparison; its backwards arrow cannot be inverted
     as an actual quasi-isomorphism in D(Z/p^n). The precise integral map, its direction and the
     comparison between undivided and divided complexes are required from the supplier (recorded
     gap); after inverting p these arrows become quasi-isomorphisms.
   HYPOTHESIS
     X fs log-smooth over O_K^×; r ≥ 0; the normalisation of Z_p(r)' follows Colmez–Nizioł
     (Nekovář–Nizioł use (p^a a!)^{−1}Z_p(r), which agrees for r < p(p − 1)).
   HYPOTHESIS
     Required supplier contract in the early classical log-syntomic prefix of
     CohomologyComparisons Part II, per the accepted verification of RT-AREA-iwasawa-2/3. CP.4 is
     only the routing anchor; its current rational proper B_st comparison does not supply this
     integral/open construction.
   PREREQUISITE
     PadicHodgeRegulators:D.2/log-syntomic-complex
   PREREQUISITE
     AInfCohomology:AI.4
   PREREQUISITE
     PadicHodgeTheory:R06.1/crystalline-period-ring
   PREREQUISITE
     PadicHodgeTheory:R06.1/divided-frobenius-exact-sequence
   PREREQUISITE
     CrystallineCohomology:CR.2
   PREREQUISITE
     PadicHodgeRegulators:L0/fundamental-exact-sequences
   PREREQUISITE
     CohomologyComparisons:CP.4
   API fmkPeriodMap [data]
     fmkPeriodMap X r n : S_n(r)_X ⟶ i^* Rj_* (ℤ/p^n)(r)'_{X_tr} in the derived category of étale
     sheaves on X_0.
   API fmkPeriodMap_local [characterisation]
     On a small chart Spf R it agrees with CN §4.7’s explicitly directed integral map; p-power
     quasi-isomorphisms are not inverted integrally. The supplier must state and compare the
     divided and undivided conventions.
   API fmkPeriodMap_mul [structure]
     fmkPeriodMap is compatible with cup products S_n(r) ⊗ S_n(s) → S_n(r + s).
   API fmkPeriodMap_reduction [relation]
     Compatible with the reduction maps n → n − 1 and with the completed versions.
   API fmkPeriodMap_degree_one [example]
     For r = 1 on X = Spec O_K, it sends the syntomic class of u ∈ O_K^× to the Kummer class of u.
   TEST fmk_kummer [computation]
     For X = Spec Z_p, r = 1, n = 1 and u = 1 + p, the image of the syntomic class of u is the
     Kummer class of 1 + p in H^1(Q_p, μ_p).
   TEST fmk_weight_zero [degenerate]
     For r = 0, α^FM_{0,n} is the identification of S_n(0) with i^*Rj_*Z/p^n in degree 0 (both are
     Z/p^n on a connected X).
   TEST fmk_twist_normalisation [compatibility]
     For r < p − 1, a(r) = 0 and Z_p(r)' = Z_p(r), so the Colmez–Nizioł and Nekovář–Nizioł
     normalisations coincide.
   TEST fmk_untwisted_fails [non-example]
     At r=p−1, Z_p(r)′=p^{-1}Z_p(r) and its prescribed period generator has p-adic valuation one
     less than the ordinary generator; an ordinary generator cannot be silently substituted in the
     same normalized map.
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.2/small-twist-comparison (comparison): Kato–Kurihara–Tsuji: the period map is an isomorphism for small twists
   STATEMENT
     Let X be an fs log-scheme log-smooth over a henselian discrete valuation ring O_K of mixed
     characteristic (0, p). For integers i ≤ r ≤ p − 1 and n ≥ 1 the period map α^FM_{r,n} :
     H^i(S_n(r)_X) → i^* R^i j_* Z/p^n(r)_{X_tr} is an isomorphism (for r ≤ p − 2, Z_p(r)' =
     Z_p(r)). For general r, Colmez–Nizioł prove that the kernel and cokernel of α^FM_{r,n} on
     H^i, 0 ≤ i ≤ r, are killed by p^{Nr + c_p} if K contains enough roots of unity and by
     p^{N(K,p,r)} in general, for X semistable over O_K (or a base change of one). Consequently,
     for X proper and log-smooth over O_K^×, H^j_syn(X_{O_K̄}, r)_Q ≅ H^j_et(X_{tr,K̄}, Q_p(r))
     for j ≤ r.
   HYPOTHESIS
     X fs log-smooth over a henselian DVR of mixed characteristic; i ≤ r ≤ p − 1 for the exact
     statement (Nekovář–Nizioł use r ≤ p − 2, where both formulations agree).
   HYPOTHESIS
     For the p^N statements, X semistable (or a base change of a semistable scheme) and 0 ≤ i ≤ r.
   HYPOTHESIS
     Required supplier contract in the early classical log-syntomic prefix of
     CohomologyComparisons Part II, per the accepted verification of RT-AREA-iwasawa-2/3. CP.4 is
     only the routing anchor; its current rational proper B_st comparison does not supply this
     integral/open construction.
   HYPOTHESIS
     The quoted exact small-range comparison requires identifying S_n(r) with the classical
     complex to which that exact theorem applies, including its divided-Frobenius convention; this
     integral identification remains a gap. The rational and p-power conclusions do not by
     themselves establish it. Applications here use r≤p−2.
   PREREQUISITE
     PadicHodgeRegulators:D.2/log-syntomic-complex
   PREREQUISITE
     PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map
   PREREQUISITE
     PhiGammaModulesAndIwasawaCohomology:PG.3/herr-complex
   PREREQUISITE
     CohomologyComparisons:CP.4
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.2/syntomic-exponential (comparison): The syntomic exponential and the Bloch–Kato exponential
   STATEMENT
     Let X be a quasi-compact formal semistable scheme over O_K and r ≥ 1. There is a natural map
     α_{r,i} : H^{i−1}_dR(X_{K,tr}) → H^i_syn(X, r)_Q (the boundary of the syntomic fibre
     sequence, through the identification of crystalline cohomology modulo J^{[r]} with log de
     Rham cohomology modulo F^r), an isomorphism for i ≤ r − 1 and injective for i = r. For X
     proper semistable and 1 ≤ i ≤ r − 1, the composite α^FM ∘ α_{r,i} : D_dR(V_{i−1}) =
     H^{i−1}_dR(X_K) → H^1(G_K, V_{i−1}) ⊂ H^i_et(X_K, Q_p(r)), V_{i−1} := H^{i−1}_et(X_K̄,
     Q_p(r)), is the Bloch–Kato exponential of V_{i−1}. For X = Spec O_K, r≥2 and i=1 this is the
     statement H^0_dR(K) = K → H^1_syn → H^1(K, Q_p(r)) equals exp_BK, used in D.2/syntomic-etale-
     regulator-comparison.
   HYPOTHESIS
     X quasi-compact formal semistable over O_K; for the Bloch–Kato identification, X proper
     semistable and 1 ≤ i ≤ r − 1.
   HYPOTHESIS
     Required supplier contract in the early classical log-syntomic prefix of
     CohomologyComparisons Part II, per the accepted verification of RT-AREA-iwasawa-2/3. CP.4 is
     only the routing anchor; its current rational proper B_st comparison does not supply this
     integral/open construction.
   PREREQUISITE
     PadicHodgeRegulators:D.2/log-syntomic-complex
   PREREQUISITE
     PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map
   PREREQUISITE
     PadicHodgeRegulators:D.2/small-twist-comparison
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-exponential
   PREREQUISITE
     CrystallineCohomology:CR.5
   PREREQUISITE
     CohomologyComparisons:CP.4
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.3/unramified-etale-algebra (comparison): Finite unramified étale Q_p-algebras
   STATEMENT
     A finite unramified étale Q_p-algebra is a Q_p-algebra L isomorphic to a finite product
     ∏_{i∈I} L_i of finite unramified field extensions L_i/Q_p; equivalently L ≅ W(k)[1/p] for a
     finite reduced F_p-algebra k = ∏_i F_{q_i} (Witt vectors of a finite product of finite
     fields), with k ≅ O_L/pO_L. Its ring of integers is O_L = ∏_i O_{L_i} = W(k), the integral
     closure of Z_p in L; its rank is [L : Q_p] = Σ_i [L_i : Q_p] = dim_{F_p} k; its Frobenius φ_L
     = ∏_i φ_{L_i} is the Witt-vector Frobenius W(Frob_k)[1/p]. For a number field F and a prime p
     unramified in F, F ⊗_Q Q_p ≅ ∏_{v|p} F_v is such an algebra, with O_F ⊗ Z_p = ∏_v O_v.
   HYPOTHESIS
     p any prime; I finite (I = ∅ gives the zero algebra).
   HYPOTHESIS
     The local-field carrier, unramified classification and Witt identification are imported from
     LocalFieldsRamification Layer 2; the API below is the required specialized supplier
     interface. Formal unramifiedness of a characteristic-zero field algebra only detects
     separability and does not detect arithmetic ramification.
   PREREQUISITE
     mathlib:WittVector
   PREREQUISITE
     mathlib:WittVector.frobenius
   PREREQUISITE
     PadicHodgeRegulators:D.1/unramified-frobenius-on-roots
   PREREQUISITE
     tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-
     places
   PREREQUISITE
     tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius
   API IsUnramifiedEtaleAlgebra [structure]
     IsUnramifiedEtaleAlgebra p L : L is a finite product of finite unramified field extensions of
     ℚ_[p] (data: the factor decomposition up to isomorphism).
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

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.3/completed-k3-unramified (construction): Completed K₃ of a finite unramified étale algebra
   DECLARATION completedK3
   STATEMENT
     For a finite unramified étale Q_p-algebra L = ∏_i L_i put K_3(L; Z_p) := π_3 K(L; Z_p), the
     p-completed K-theory of KTheoryFiniteLocalFields:L.1/completed-k-theory. The projections
     induce K_3(L; Z_p) ≅ ∏_i K_3(L_i; Z_p) (finite products commute with K-theory and with
     derived p-completion), and K_3(O_L; Z_p) → K_3(L; Z_p) is an isomorphism. The étale Chern
     classes give c_L : K_3(L; Z_p) ≅ H^1(L, Z_p(2)) := ∏_i H^1(L_i, Z_p(2)). For p > 3, K_3(L;
     Z_p) is a free Z_p-module of rank [L : Q_p]; for p ∈ {2, 3} it has the nonzero torsion
     Z/w_2^{(p)}(L_i) on each factor.
   HYPOTHESIS
     L finite unramified étale over Q_p (D.3/unramified-etale-algebra); freeness needs p > 3.
   PREREQUISITE
     PadicHodgeRegulators:D.3/unramified-etale-algebra
   PREREQUISITE
     KTheoryFiniteLocalFields:L.1/completed-k-theory
   PREREQUISITE
     GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring
   PREREQUISITE
     KTheoryFiniteLocalFields:L.6/completed-k3-of-unramified-fields
   PREREQUISITE
     KTheoryFiniteLocalFields:L.6/odd-completed-k-groups-are-h1
   PREREQUISITE
     KTheoryFiniteLocalFields:L.6/ring-of-integers-versus-field
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
   API completedK3_extensionality [extensionality]
     The completed module is imported from p-completed K-theory. Equality of induced maps is
     pointwise, and product maps are determined by all factor projections. Inherit Module and
     map_zero/map_add/map_smul rather than define a new completion carrier.
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

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.3/completed-k3-bloch-description (theorem): Completed K₃ of an unramified field is the completed Bloch group
   STATEMENT
     Let L be a finite unramified extension of Q_p with p ≥ 3. For every ν ≥ 1 the natural maps
     K_3(L)/p^ν → K_3^ind(L)/p^ν → B(L)/p^ν are isomorphisms (B(L) Suslin's Bloch group), and the
     completion map identifies K_3(L; Z_p) with lim_ν K_3(L)/p^ν ≅ lim_ν B(L)/p^ν =: B(L)^∧_p. In
     particular the image of B(L) — more precisely of K_3(L), which surjects onto every B(L)/p^ν —
     is dense in K_3(L; Z_p), and the kernel of K_3(L) → K_3(L; Z_p) is ⋂_ν p^ν K_3(L). For a
     finite product L = ∏ L_i the statements hold factorwise.
   HYPOTHESIS
     L/Q_p finite unramified and p odd, so that μ(L) has order prime to p and ζ_p ∉ L.
   PREREQUISITE
     KTheoryFiniteLocalFields:L.6/completion-exact-sequence
   PREREQUISITE
     KTheoryFiniteLocalFields:L.6/milnor-k-of-local-fields
   PREREQUISITE
     KTheoryFiniteLocalFields:L.3/moore-theorem
   PREREQUISITE
     KTheoryFiniteLocalFields:L.6/finite-coefficient-lichtenbaum-quillen
   PREREQUISITE
     K3BlochGroups:V.6/comparison-finite-coefficients
   PREREQUISITE
     K3BlochGroups:V.4/suslin-exact-sequence
   PREREQUISITE
     K3BlochGroups:V.2/k3-indecomposable
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.3/finite-polylogarithm (definition): Kontsevich's finite polylogarithm
   DECLARATION finitePolylog
   STATEMENT
     For a prime p and n ∈ Z, the finite polylogarithm is the polynomial li_{n,p}(x) :=
     Σ_{k=1}^{p−1} x^k / k^n ∈ F_p[x] (equivalently its lift with coefficients in Z_(p)). It has
     degree p − 1 (for p > 2), constant term 0, and satisfies x·li'_{n,p}(x) = li_{n−1,p}(x);
     li_{n,p}(1) = Σ_{k=1}^{p−1} k^{−n} ≡ 0 mod p exactly when (p − 1) ∤ n. In particular for p >
     3: li_{2,p}(1) ≡ 0 and li'_{2,p}(1) = li_{1,p}(1) ≡ 0 mod p, so (x − 1)² divides li_{2,p}(x)
     in F_p[x].
   HYPOTHESIS
     p prime; n ∈ Z (negative n allowed, k^{−n} = k^{|n|}).
   PREREQUISITE
     mathlib:Polynomial
   PREREQUISITE
     mathlib:ZMod
   API finitePolylog [data]
     finitePolylog p n : Polynomial (ZMod p) := Σ_{k=1}^{p−1} C ((k : ZMod p)^n)⁻¹ * X^k.
   API finitePolylog_eval_zero [simp]
     (finitePolylog p n).eval 0 = 0.
   API finitePolylog_derivative [relation]
     X * derivative (finitePolylog p n) = finitePolylog p (n − 1).
   API finitePolylog_eval_one [characterisation]
     (finitePolylog p n).eval 1 = 0 ↔ ¬ (p − 1 ∣ n).
   API finitePolylog_two_rootMultiplicity_one [relation]
     For 5 ≤ p, (X − 1)² ∣ finitePolylog p 2.
   API finitePolylog_natDegree [characterisation]
     For 2 < p, (finitePolylog p n).natDegree = p − 1.
   API finitePolylog_extensionality [extensionality]
     Equality of finite polylogarithm polynomials is determined coefficientwise by Polynomial.ext;
     coeff k = (k^n)^{-1} for 1≤k<p and 0 otherwise.
   TEST finitePolylog_five_two [computation]
     (finitePolylog 5 2).eval 2 = 1 in ZMod 5.
   TEST finitePolylog_one_index [degenerate]
     finitePolylog p 0 = Σ_{k=1}^{p−1} X^k, the truncated geometric series.
   TEST finitePolylog_compat_coleman [compatibility]
     For ζ ∈ μ(Q_{p^s}) ∖ {1} of order prime to p, the reduction of p^{−2}Li_2(ζ^p) is
     −li_{2,p}(ζ̄)/(1 − ζ̄)^p, the form of ColemanIntegration:L2/values-at-tame-roots-of-unity
     (c).
   TEST finitePolylog_three_non_example [non-example]
     (finitePolylog 3 2).eval 1 = 2 ≠ 0 in ZMod 3, so the factorisation li_{2,p} = (x − 1)² g_p
     fails at p = 3.
   TEST finitePolylog_five_two_three [computation]
     (finitePolylog 5 2).eval 3 = 3 in ZMod 5; hence f_5(3)=3/(3−1)^5=4.
   TEST finitePolylog_five_two_minus_one [computation]
     (finitePolylog 5 2).eval 4 = 0 in ZMod 5, so f_5(−1)=0.
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.3/finite-polylogarithm-reduction (lemma): Reduction of the p-adic dilogarithm at roots of unity
   STATEMENT
     Let p be odd, L an unramified extension of Q_p and ζ ∈ μ(L) ∖ {1}. Then D_L(ζ) = Li_2(ζ) ∈
     p²O_L and p^{−2}D_L(ζ^p) ≡ li_{2,p}(ζ̄)/(ζ̄ − 1)^p mod p, where ζ̄ ∈ k_L^× is the residue of
     ζ. Equivalently, with σ(ζ) the root of unity with σ(ζ)^p = ζ, p^{−2}D_L(ζ) ≡
     li_{2,p}(σ(ζ)‾)/(σ(ζ)‾ − 1)^p. Componentwise the same holds for a finite unramified product L
     and ζ ∈ μ(L) with all components ≠ 1.
   HYPOTHESIS
     p odd, so every ζ ∈ μ(L) has order prime to p (L unramified).
   PREREQUISITE
     ColemanIntegration:L2/values-at-tame-roots-of-unity
   PREREQUISITE
     PadicHodgeRegulators:D.1/etale-algebra-dilogarithm
   PREREQUISITE
     PadicHodgeRegulators:D.3/finite-polylogarithm
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.3/dilogarithm-integrality (lemma): p²-integrality of the dilogarithm on special units
   STATEMENT
     Let p > 3 and let L be a finite unramified étale Q_p-algebra. If z ∈ O_L satisfies z ∈ O_L^×
     and 1 − z ∈ O_L^× in every factor (z is a special unit), then D_L(z) ∈ p²O_L. This is GSWZ
     Lemma 3.1 for R^∧_p = O_{K_p}.
   HYPOTHESIS
     p > 3; L unramified (each factor); z and 1 − z units in every factor.
   PREREQUISITE
     PadicHodgeRegulators:D.3/finite-polylogarithm-reduction
   PREREQUISITE
     PadicHodgeRegulators:D.1/teichmuller-unit-decomposition
   PREREQUISITE
     ColemanIntegration:L2/polylogarithm-expansion-at-a-root-of-unity
   PREREQUISITE
     ColemanIntegration:L2/values-at-tame-roots-of-unity
   PREREQUISITE
     ColemanIntegration:L0/log-one-add-convergence
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.3/residue-spanning (theorem): Dilogarithms of roots of unity span the residue space
   STATEMENT
     Let p > 3. (a) For every s ≥ 1, Span_{Z_p}{p^{−2}D(ζ) : ζ ∈ μ(Q_{p^s}) ∖ {1}} = Z_{p^s}. (b)
     For every s ≥ 1 also Span_{Z_p}{p^{−2}(D(ζ) − D(ζ')) : ζ, ζ' ∈ μ(Q_{p^s}) ∖ {1}} = Z_{p^s}.
     (c) Consequently, for a finite unramified product L = ∏_i Q_{p^{s_i}},
     Span_{Z_p}{p^{−2}D_L(ζ) : ζ ∈ μ(L) with every component ≠ 1} = O_L. Statement (a) is GSWZ
     Proposition 3.3 with ζ = 1 excluded; (b) and (c) are needed for products once components
     equal to 1 are excluded.
   HYPOTHESIS
     p > 3 (the argument uses li_{2,p}(1) ≡ li'_{2,p}(1) ≡ 0 mod p).
   HYPOTHESIS
     s ≥ 1; L a finite product of unramified extensions of Q_p.
   PREREQUISITE
     PadicHodgeRegulators:D.3/finite-polylogarithm
   PREREQUISITE
     PadicHodgeRegulators:D.3/finite-polylogarithm-reduction
   PREREQUISITE
     PadicHodgeRegulators:D.1/unramified-frobenius-on-roots
   PREREQUISITE
     mathlib:Submodule.span
   PREREQUISITE
     mathlib:Submodule.le_of_le_smul_of_le_jacobson_bot
   PREREQUISITE
     ColemanIntegration:L2/dilogarithm-identities
   PREREQUISITE
     PadicHodgeRegulators:D.1/dilogarithm-scalar-extension
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.3/root-of-unity-classes (construction): Root-of-unity classes in completed K₃
   DECLARATION rootClassK3
   STATEMENT
     Let p be odd, L a finite unramified étale Q_p-algebra and ζ ∈ μ(L) a root of unity of order m
     (prime to p) all of whose components are ≠ 1. Define [ζ]_L ∈ K_3(L; Z_p) as the image, under
     B(L) ⊗ Z_p → lim_ν B(L)/p^ν ≅ K_3(L; Z_p) (D.3/completed-k3-bloch-description, factorwise),
     of the Z_p-coefficient class ⟦ζ⟧ = m^{−1} ⊗ m[ζ] of K3BlochGroups:V.6/root-of-unity-class
     (iii) (componentwise; m[ζ] ∈ B(L) by K3BlochGroups:V.6/integral-root-multiple). This is the
     class GSWZ denote [ζ]: when ζ ∧ (1 − ζ) = 0 in Suslin's antisymmetric square (always the case
     after ⊗ Z_p, p odd), [ζ]_L is the image of [ζ] ∈ B(L), and GSWZ's ord(ζ)·D_p(ζ) is the
     regulator of the integral multiple m[ζ].
   HYPOTHESIS
     p odd; L unramified (so ord(ζ) is prime to p); every component of ζ differs from 1 (GSWZ
     E38).
   PREREQUISITE
     K3BlochGroups:V.6/root-of-unity-class
   PREREQUISITE
     K3BlochGroups:V.6/integral-root-multiple
   PREREQUISITE
     K3BlochGroups:V.6/root-of-unity-symbol
   PREREQUISITE
     K3BlochGroups:V.3/angle-bracket-two-torsion
   PREREQUISITE
     PadicHodgeRegulators:D.3/completed-k3-bloch-description
   PREREQUISITE
     PadicHodgeRegulators:D.3/completed-k3-unramified
   API rootClassK3 [data]
     rootClassK3 L ζ : completedK3 p L, for ζ a root of unity of L with all components ≠ 1.
   API rootClassK3_eq_bloch [compatibility]
     rootClassK3 L ζ is the image of K3BlochGroups' rootClassPadic ζ under B(L) ⊗ ℤ_p →
     completedK3 p L.
   API rootClassK3_prod [simp]
     For L = ∏ L_i, rootClassK3 L ζ = (rootClassK3 L_i ζ_i)_i.
   API rootClassK3_map [functoriality]
     For a ℚ_p-algebra map f : L → L', completedK3 map sends rootClassK3 L ζ to rootClassK3 L' (f
     ζ); in particular φ_L(rootClassK3 ζ) = rootClassK3 (ζ^p).
   API rootClassK3_inv [relation]
     rootClassK3 L ζ⁻¹ = −rootClassK3 L ζ.
   API rootClassK3_mul_ord [relation]
     ord(ζ) • rootClassK3 L ζ is the image of the integral Bloch element m[ζ].
   API rootClassK3_extensionality [extensionality]
     In a finite product, two rootClassK3 values are equal iff all factor projections agree; the
     construction is invariant under equality of admissible root arguments. It is a function of
     roots, not asserted to be additive in the multiplicative root argument.
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

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.3/local-regulator (construction): The p-adic regulator on completed K₃
   DECLARATION localRegulator
   STATEMENT
     For a finite étale Q_p-algebra L = ∏ L_i (any p; L_i/Q_p finite) define D_L : K_3(L; Z_p) → L
     as the composite of the étale Chern isomorphism K_3(L; Z_p) ≅ H^1(L, Z_p(2)) (componentwise,
     D.2/etale-regulator), the inclusion into H^1(L, Q_p(2)) and the Bloch–Kato logarithm log_BK :
     H^1(L, Q_p(2)) ≅ D_dR(Q_p(2)) = L·e_2 ≅ L (L1/bloch-kato-logarithm, e_2 = t^{−2} ⊗ ε^{⊗2}),
     multiplied by the sign ε ∈ {±1} fixed so that D_L([ζ]_L) = +D_L(ζ) = +Li_2(ζ) on root-of-
     unity classes. By D.2/syntomic-etale-regulator-comparison, D_L = ε·reg_syn (Besser's
     normalisation) on the image of K_3(O_L), and by D.2/weight-two-dilogarithm-comparison D_L
     agrees with the dilogarithm D_L of D.1 on Bloch elements presented by special units of O_L.
     This is GSWZ's D_p of (19) and (183), defined on the completed group.
   HYPOTHESIS
     L finite étale over Q_p; integrality and bijectivity statements are D.3/unramified-regulator-
     theorem (p > 3, L unramified).
   PREREQUISITE
     PadicHodgeRegulators:D.3/completed-k3-unramified
   PREREQUISITE
     PadicHodgeRegulators:D.2/etale-regulator
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-logarithm
   PREREQUISITE
     PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison
   PREREQUISITE
     PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison
   PREREQUISITE
     PadicHodgeRegulators:D.3/root-of-unity-classes
   PREREQUISITE
     PadicHodgeRegulators:D.1/regulator-normalisation-dictionary
   API localRegulator [data]
     localRegulator L : completedK3 p L →ₗ[ℤ_[p]] L.
   API localRegulator_eq_logBK [characterisation]
     localRegulator L = ε • (logBK ∘ chernEquiv) with ε = ±1 the pinned sign.
   API localRegulator_rootClass [simp]
     localRegulator L (rootClassK3 L ζ) = etaleDilog L ζ (= (Li_2(ζ_i))_i).
   API localRegulator_specialUnits [compatibility]
     On the image of a Bloch element Σ n_i [x_i] with x_i special units of O_L, localRegulator = Σ
     n_i etaleDilog L x_i.
   API localRegulator_map [functoriality]
     For a ℚ_p-algebra map f : L → L', localRegulator L' ∘ completedK3.map f = f ∘ localRegulator
     L; in particular localRegulator commutes with φ_L.
   API localRegulator_transfer [functoriality]
     For L → L' finite free, localRegulator L ∘ transfer = Tr_{L'/L} ∘ localRegulator L'.
   API localRegulator_prod [simp]
     On L = ∏ L_i, localRegulator is the product of the factor regulators.
   API localRegulator_extensionality [extensionality]
     Two instances of this map agree iff their values agree on every element of the specified
     source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and
     map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred
     for the semilinear twist.
   TEST localRegulator_q5_root [computation]
     localRegulator Q_5 (rootClassK3 Q_5 (teichmuller 2)) ≡ 25 mod 125.
   TEST localRegulator_zero_algebra [degenerate]
     localRegulator 0 = 0.
   TEST localRegulator_syntomic_compat [compatibility]
     On the image of K_3(O_L), localRegulator = ε·syntomicRegulator (D.2/syntomic-regulator) with
     n = 2.
   TEST localRegulator_not_gros [non-example]
     For L = Q_5, the Gros-normalised map (1 − 5^{−2})·localRegulator sends rootClassK3
     (teichmuller 2) to a unit, so it is not localRegulator and does not have image 25Z_5.
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.3/unramified-regulator-theorem (theorem): The unramified p > 3 theorem
   STATEMENT
     Let p > 3 and let L be a finite unramified étale Q_p-algebra (for instance K_p = K ⊗ Q_p for
     a number field K in which p is unramified). Then the p-adic regulator is a Z_p-linear
     isomorphism D_L : K_3(L; Z_p) ≅ p²O_L. The statement is not asserted for p ∈ {2, 3}, for
     ramified L, or for the uncompleted group K_3(L).
   HYPOTHESIS
     p > 3; L a finite product of finite unramified extensions of Q_p.
   PREREQUISITE
     PadicHodgeRegulators:D.3/local-regulator
   PREREQUISITE
     PadicHodgeRegulators:D.3/completed-k3-unramified
   PREREQUISITE
     PadicHodgeRegulators:L1/integral-logarithm-unramified
   PREREQUISITE
     PadicHodgeRegulators:D.3/residue-spanning
   PREREQUISITE
     PadicHodgeRegulators:D.3/root-of-unity-classes
   PREREQUISITE
     mathlib:Module.Free
   PREREQUISITE
     mathlib:OrzechProperty
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.3/roots-of-unity-generate (theorem): Completed K₃ is generated by roots of unity
   STATEMENT
     Let p > 3 and L a finite unramified étale Q_p-algebra. Then K_3(L; Z_p) is generated as a
     Z_p-module by the classes [ζ]_L, ζ ∈ μ(L) with every component ≠ 1; every ξ ∈ K_3(L; Z_p) has
     a finite presentation ξ = Σ_ζ a_ζ[ζ]_L with a_ζ ∈ Z_p, and for any such presentation D_L(ξ) =
     Σ_ζ a_ζ Li_2(ζ). Presentations are not unique; D_L(ξ) is.
   HYPOTHESIS
     p > 3; L unramified; ζ ranges over roots of unity with all components ≠ 1 (GSWZ E38).
   PREREQUISITE
     PadicHodgeRegulators:D.3/unramified-regulator-theorem
   PREREQUISITE
     PadicHodgeRegulators:D.3/residue-spanning
   PREREQUISITE
     PadicHodgeRegulators:D.3/root-of-unity-classes
   PREREQUISITE
     PadicHodgeRegulators:D.3/local-regulator
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.4/global-p-adic-regulator (construction): The global p-adic K₃ regulator
   DECLARATION globalPadicRegulator
   STATEMENT
     Let F be a number field and p a prime. The global p-adic regulator is D_{F,p} := D_{F⊗Q_p} ∘
     λ_{F,p} : K_3(F) → F ⊗_Q Q_p ≅ ∏_{v|p} F_v, where λ_{F,p} : K_3(F) → ∏_{v|p} K_3(F_v; Z_p) =
     K_3(F ⊗ Q_p; Z_p) is the semilocal completed map of KTheoryFiniteLocalFields:L.7/semilocal-
     completed-map and D_{F⊗Q_p} is the regulator of D.3/local-regulator. It kills the torsion
     subgroup of K_3(F) and induces D_{F,p} ⊗ Q : K_3(F) ⊗ Q → F ⊗ Q_p; for p > 3 unramified in F
     its image lies in p²(O_F ⊗ Z_p).
   HYPOTHESIS
     F a number field, p any prime; the integrality clause needs p > 3 unramified in F.
   PREREQUISITE
     KTheoryFiniteLocalFields:L.7/semilocal-completed-map
   PREREQUISITE
     PadicHodgeRegulators:D.3/local-regulator
   PREREQUISITE
     PadicHodgeRegulators:D.3/unramified-regulator-theorem
   PREREQUISITE
     tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-
     places
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
   API globalPadicRegulator_extensionality [extensionality]
     Two instances of this map agree iff their values agree on every element of the specified
     source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and
     map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred
     for the semilinear twist.
   TEST globalPadicRegulator_rat_zero [computation]
     globalPadicRegulator ℚ p = 0, since K_3(ℚ) ≅ ℤ/48 is finite.
   TEST globalPadicRegulator_torsion_zero [degenerate]
     For F totally real, K_3(F) ⊗ Q = 0 (Borel: rank r_2 = 0), so globalPadicRegulator F p ⊗ Q =
     0.
   TEST globalPadicRegulator_bloch_compat [compatibility]
     For ξ ∈ K_3(F) whose Bloch image is presented by special units at p, globalPadicRegulator F p
     ξ = blochDilog F p (presentation) (D.4/special-unit-formula).
   TEST globalPadicRegulator_not_injective_claim [non-example]
     For F imaginary quadratic and p split, K_3(F) ⊗ Q has rank 1 while F ⊗ Q_p has rank 2;
     injectivity of globalPadicRegulator ⊗ Q is a separate proposition (D.4/padic-k3-regulator-
     injectivity), not a consequence of the ranks.
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.4/special-unit-formula (theorem): The global regulator on special-unit presentations
   STATEMENT
     Let F be a number field, p a prime, and let ξ ∈ K_3(F) have image in B(F) ⊗ Q presented as
     Σ_i n_i[z_i] (n_i ∈ Q) with z_i and 1 − z_i units at every prime of F above p. Then
     D_{F,p}(ξ) = ±Σ_i n_i D_{F,p}^{dil}([z_i]), where D^{dil}_{F,p} is the combined dilogarithm
     of D.1/combined-dilogarithm and the sign is the pinned sign of D.3/local-regulator. In
     particular: (a) for every root of unity ζ ≠ 1 of F, D_{F,p}([ζ]) = Li_2(ζ ⊗ 1) componentwise;
     (b) for a fixed presentation the hypothesis holds for all but finitely many p; (c) when R =
     O_F[1/Δ] and all z_i, 1 − z_i ∈ R^×, the formula holds at every p ∤ Δ. For presentations by
     symbols that are not special units at p the formula is Besser–de Jeu's Conjecture 1.14 (gap).
   HYPOTHESIS
     z_i, 1 − z_i ∈ O_{F,(v)}^× for every v | p; the presentation lies in the image of B(F) ⊗ Q
     under Suslin's map.
   PREREQUISITE
     PadicHodgeRegulators:D.4/global-p-adic-regulator
   PREREQUISITE
     PadicHodgeRegulators:D.2/weight-two-dilogarithm-comparison
   PREREQUISITE
     PadicHodgeRegulators:D.1/combined-dilogarithm
   PREREQUISITE
     PadicHodgeRegulators:D.3/local-regulator
   PREREQUISITE
     KTheoryFiniteLocalFields:L.7/restriction-completion-square
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.4/norm-trace-compatibility (theorem): Restriction and transfer for the global regulator
   STATEMENT
     Let E/F be a finite extension of number fields and p a prime. (a) Restriction:
     D_{E,p}(res_{E/F} ξ) = ι(D_{F,p}(ξ)) for ξ ∈ K_3(F), ι : F ⊗ Q_p → E ⊗ Q_p. (b) Transfer:
     D_{F,p}(N_{E/F} η) = Tr_{E⊗Q_p/F⊗Q_p}(D_{E,p}(η)) for η ∈ K_3(E). (c) Consequently
     D_{F,p}(N_{E/F} res_{E/F} ξ) = [E : F]·D_{F,p}(ξ). The same holds for the local regulators of
     D.3 along finite extensions of finite étale Q_p-algebras.
   HYPOTHESIS
     E/F finite; Iwasawa branch; Bloch–Kato logarithms of the factors.
   PREREQUISITE
     PadicHodgeRegulators:D.4/global-p-adic-regulator
   PREREQUISITE
     KTheoryFiniteLocalFields:L.7/semilocal-completed-map
   PREREQUISITE
     KTheoryFiniteLocalFields:L.7/transfer-completion-formula
   PREREQUISITE
     PadicHodgeRegulators:D.2/etale-regulator
   PREREQUISITE
     PadicHodgeRegulators:L1/twist-and-change-of-field
   PREREQUISITE
     PadicHodgeRegulators:D.1/logarithm-norm-trace
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.4/frobenius-compatibility (theorem): Frobenius compatibility of the p-adic regulator
   STATEMENT
     Let p be unramified in the number field F and let φ_p be the Frobenius of the unramified
     étale algebra F ⊗ Q_p ≅ ∏_{v|p} F_v (the product of the arithmetic Frobenii). Then φ_p acts
     on K_3(F ⊗ Q_p; Z_p) by functoriality and D_{F⊗Q_p}(φ_p x) = φ_p(D_{F⊗Q_p}(x)); in particular
     D_p(φ_p ξ) = φ_p D_p(ξ) for ξ ∈ K_3(F), with φ_p ξ := φ_p λ_{F,p}(ξ). On root-of-unity
     classes, φ_p[ζ] = [ζ^p] and D(ζ^p) = φ_p D(ζ).
   HYPOTHESIS
     p unramified in F (any p for the functoriality; p > 3 for the integral statements it is
     combined with).
   PREREQUISITE
     PadicHodgeRegulators:D.3/local-regulator
   PREREQUISITE
     PadicHodgeRegulators:D.3/unramified-etale-algebra
   PREREQUISITE
     PadicHodgeRegulators:D.1/dilogarithm-scalar-extension
   PREREQUISITE
     PadicHodgeRegulators:D.3/root-of-unity-classes
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.4/torsion-and-denominators (theorem): Torsion classes and controlled denominators
   STATEMENT
     Let F be a number field and p > 3 unramified in F. (a) Every torsion element of K_3(F) has
     D_{F,p} = 0. (b) If β ∈ K_3(F) ⊗ Q satisfies Nβ ∈ image(K_3(F)) for a nonzero integer N, then
     D_{F,p}(β) ∈ p^{2 − v_p(N)}(O_F ⊗ Z_p). (c) For a root of unity ζ ∈ μ(F) ∖ {1} of order m,
     the coefficient-localised class ⟦ζ⟧ ∈ B(F) ⊗ Z[1/m] of K3BlochGroups:V.6/root-of-unity-class
     has D_{F,p}(⟦ζ⟧) = Li_2(ζ ⊗ 1), which lies in p²(O_F ⊗ Z_p) when p ∤ m. (d) The image
     D_{F,p}(K_3(F)) is a finitely generated Z-submodule of rank at most r_2(F) inside p²(O_F ⊗
     Z_p); its Z_p-span need not be all of p²(O_F ⊗ Z_p).
   HYPOTHESIS
     F a number field; p > 3 unramified in F for (b)–(d).
   HYPOTHESIS
     N≠0 in the denominator bound; the root-of-unity notation is a coefficient-localized Bloch
     class transported rationally, not necessarily the raw integral symbol [ζ].
   PREREQUISITE
     PadicHodgeRegulators:D.4/global-p-adic-regulator
   PREREQUISITE
     PadicHodgeRegulators:D.4/special-unit-formula
   PREREQUISITE
     K3BlochGroups:V.5/k3-number-field
   PREREQUISITE
     K3BlochGroups:V.2/k3-rank-borel
   PREREQUISITE
     K3BlochGroups:V.6/root-of-unity-class
   PREREQUISITE
     K3BlochGroups:V.6/comparison-rational
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.4/habiro-regulator-export (comparison): The regulator exported to Habiro-module gluing
   STATEMENT
     Let K be a number field, Δ a positive integer divisible by disc(K) and by 6, R = O_K[1/Δ],
     and p ∤ Δ (so p > 3 is unramified in K). The p-adic regulator used to define invertible
     L_p(ξ)-sections (GSWZ Definition 1.3, (22)) is D_p := D_{K,p} : K_3(K) → p²R^∧_p ⊂ K_p =
     R^∧_p[1/p] = K ⊗ Q_p, with: (i) the Iwasawa branch and D_p([ζ]) = Li_2(ζ) on roots of unity;
     (ii) D_p(φ_p ξ) = φ_p D_p(ξ); (iii) D_p(ξ) = Σ n_i D(z_i) for presentations by Δ-special
     units z_i, 1 − z_i ∈ R^×; (iv) every ξ has a Z_p-presentation λ_{K,p}(ξ) = Σ a_ζ [ζ]_{K_p} by
     roots of unity of order prime to p with all components ≠ 1, and D_p(ξ) = Σ a_ζ Li_2(ζ); (v)
     scalar dictionary: D_p = ε·log_BK∘r^et_2 (Bloch–Kato, e_2-basis), D_p = Besser's syntomic
     regulator, and the Gros normalisation is (1 − φ_p/p²)·D_p, which maps p²R^∧_p onto R^∧_p. No
     injectivity of λ_{K,p} ⊗ Q is asserted (D.4/padic-k3-regulator-injectivity).
   HYPOTHESIS
     Δ divisible by disc(K) and 6; p ∤ Δ.
   PREREQUISITE
     PadicHodgeRegulators:D.4/global-p-adic-regulator
   PREREQUISITE
     PadicHodgeRegulators:D.4/special-unit-formula
   PREREQUISITE
     PadicHodgeRegulators:D.4/frobenius-compatibility
   PREREQUISITE
     PadicHodgeRegulators:D.3/roots-of-unity-generate
   PREREQUISITE
     PadicHodgeRegulators:D.1/regulator-normalisation-dictionary
   PREREQUISITE
     PadicHodgeRegulators:D.2/gros-normalisation
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.4/padic-k3-regulator-injectivity (definition): The p-adic K₃ regulator injectivity proposition
   DECLARATION PadicK3RegulatorInjective
   STATEMENT
     For a number field F and prime p, Inj(F,p) means injectivity of the Q-linear map
     D_{F,p}⊗Q:K_3(F)⊗Q→F⊗Q_p. Since the source has Q-dimension r_2(F), this is equivalent to
     Z-rank r_2(F) of the finitely generated integral image. Separately, StrongInj(F,p) means
     injectivity of the Q_p-linear extension K_3(F)⊗Q_p→F⊗Q_p, equivalently Q_p-dimension r_2(F)
     of its span, or Z_p-rank r_2(F) of the Z_p-span. StrongInj implies Inj; the converse is not a
     formal equivalence. Neither assertion for positive r_2 follows from Borel’s rank formula or
     the local D.3 isomorphism.
   HYPOTHESIS
     F a number field, p a prime.
   PREREQUISITE
     PadicHodgeRegulators:D.4/global-p-adic-regulator
   PREREQUISITE
     K3BlochGroups:V.2/k3-rank-borel
   PREREQUISITE
     K3BlochGroups:V.5/k3-number-field
   API PadicK3RegulatorInjective [data]
     PadicK3RegulatorInjective F p : Prop := Function.Injective (globalPadicRegulator_rat F p).
   API padicK3RegulatorInjective_of_totallyReal [example]
     If F is totally real, PadicK3RegulatorInjective F p holds.
   API padicK3RegulatorInjective_iff_rank [characterisation]
     PadicK3RegulatorInjective F p ↔ the integral image has Z-rank r_2(F), equivalently the
     rational image has Q-dimension r_2(F). This is not a Q_p-span criterion.
   API padicK3RegulatorInjective_baseChange [functoriality]
     For E/F finite, PadicK3RegulatorInjective E p implies PadicK3RegulatorInjective F p
     (restriction is injective rationally and compatible with D.4/norm-trace-compatibility).
   API StrongPadicK3RegulatorInjective [data]
     Function.Injective of the Q_p-linear extension of globalPadicRegulator_rat; equivalent to
     Q_p-span dimension r_2(F).
   API strongPadicK3RegulatorInjective_implies [relation]
     StrongPadicK3RegulatorInjective F p implies PadicK3RegulatorInjective F p; no converse from
     linear algebra.
   API PadicK3RegulatorInjective_extensionality [extensionality]
     The injectivity predicates depend only on the specified Q-linear or Q_p-linear map
     respectively: pointwise equal maps give equivalent predicates. Proof witnesses are unique by
     proof irrelevance; scalar extension is not an extensionality equivalence.
   TEST injective_rat [computation]
     PadicK3RegulatorInjective ℚ p holds, since K_3(ℚ) ⊗ ℚ = 0.
   TEST injective_totally_real [degenerate]
     For F totally real (r_2 = 0) the source is zero and the proposition holds.
   TEST injective_rank_compat [compatibility]
     For F imaginary quadratic, the proposition is equivalent to D_{F,p}(ξ_0) ≠ 0 for a generator
     ξ_0 of K_3(F) modulo torsion.
   TEST injective_not_from_rank [non-example]
     A zero map from a nonzero Q-vector space into a larger Q_p-vector space is not injective. The
     inequality r_2≤[F:Q] alone supplies no information about the regulator’s kernel.
   TEST injective_scalar_extension_non_example [non-example]
     For α∈Q_p outside Q, (a,b)↦a+αb on Q² is injective, while the Q_p-linear map with the same
     formula has nonzero kernel (−α,1). Thus rational injectivity alone does not imply full Q_p-
     span rank.
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.4/example-cubic-field-five-two (application): GSWZ Example 4.3: the class of 5₂ at p = 5
   STATEMENT
     Let K = Q(α), α³ − α² + 1 = 0 (discriminant −23), z_1 = z_3 = 1 − α², z_2 = z_1² − z_1 + 2 =
     1 − α, and ξ = [z_1] + [z_2] + [z_3] = 2[1 − α²] + [1 − α] ∈ B(K) (the class of the knot
     5_2). All of 1 − α², α², 1 − α and α are units of O_K (norm ±1). At p = 5, K_5 ≅ Q_{25} ×
     Q_5, μ(K_5) ≅ μ_24 × μ_4, and ζ_24 := lim_s α^{5^{2s}} has order 24 with Q_5-component the
     Teichmüller lift of 2 (order 4). Then D_5(ξ) = c_1D_5(ζ_24) + c_2D_5(ζ_24²) + c_3D_5(ζ_24⁶)
     with c_1 = 1 + 4·5 + 3·5² + ⋯, c_2 = 3 + 5 + ⋯, c_3 = 1 + 5 + 4·5² + ⋯, hence λ_{K,5}(ξ) =
     c_1[ζ_24] + c_2[ζ_24²] + c_3[ζ_24⁶] in K_3(K_5; Z_5). The second line of GSWZ (273) is the
     value D_5(ζ_24²), misprinted there with the label ζ_24^5 (GSWZ E56).
   HYPOTHESIS
     p = 5 ∤ 6·23.
   PREREQUISITE
     PadicHodgeRegulators:D.4/habiro-regulator-export
   PREREQUISITE
     PadicHodgeRegulators:D.4/special-unit-formula
   PREREQUISITE
     PadicHodgeRegulators:D.3/roots-of-unity-generate
   PREREQUISITE
     PadicHodgeRegulators:D.1/combined-dilogarithm
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.5/curve-weight-two-target (definition): The weight-two syntomic target of a curve and its two identifications
   DECLARATION curveSyntomicTarget
   STATEMENT
     Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve
     with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on
     H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Let H^2_syn(𝒳, 2) be rigid syntomic cohomology (D.2/rigid-
     syntomic-cohomology). Since F^2H^1_dR = 0 and F^2H^2_dR = 0, the canonical boundary in the
     fixed q-Frobenius modified model, transported to rigid syntomic cohomology using Besser
     Proposition 8.6(2),(3), is ι : H^1_dR(X/K) → H^2_syn(𝒳, 2) is an isomorphism, and Besser's
     normalised identification is Θ := (1 − φ/q²)^{−1} ∘ ι^{−1} : H^2_syn(𝒳, 2) ≅ H^1_dR(X/K) (1 −
     φ/q² is invertible because φ has weight 1 on H^1). The cup-product pairing B(a, b) := Tr(a ∪
     b) on H^1_dR(X/K) is alternating with B(φa, φb) = q·B(a, b), and for forms of the second kind
     B([dF], [dG]) = Σ_x Res_x(F dG).
   HYPOTHESIS
     K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with
     geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on
     H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K).
   PREREQUISITE
     PadicHodgeRegulators:D.2/rigid-syntomic-cohomology
   PREREQUISITE
     PadicDifferentialEquationsAndRigidCohomology:RD.4/frobenius-on-rigid-cohomology
   PREREQUISITE
     PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology
   PREREQUISITE
     PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction
   PREREQUISITE
     ColemanIntegration:L0/annulus-residue
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
   API cupTrace_eigen [relation]
     If cupTrace is a q-similitude for φ and φ v = γ v (γ ≠ 0), then cupTrace (φ a) v =
     (q/γ)·cupTrace a v.
   API curveSyntomicTarget_extensionality [extensionality]
     The canonical/normalized equivalences are determined by their values on cohomology classes,
     and cupTrace by its values on pairs. Require the explicit comparison maps before transporting
     the K-module structure.
   TEST curveTarget_projective_line [computation]
     For 𝒳 = P^1_{O_K}, curveSyntomicTarget 𝒳 = 0.
   TEST curveTarget_weight_one_analogue [degenerate]
     In weight one for Spec O_K (i = n = 1), the normalised class of a unit u is log u while the
     canonical class is (1 − 1/q)·log u.
   TEST curveTarget_eigen_factor [compatibility]
     If φv = γv then B(φa, v) = (q/γ)B(a, v); for p = q = 5 and γ = 2, (1 − 1/(pγ)) = 9/10 is the
     factor between canonical and normalised pairings.
   TEST curveTarget_h2_non_example [non-example]
     For H^3_syn(𝒳, 1) the operator 1 − φ/q on H^2_rig(𝒳_k) is zero (φ = q there), so no
     normalised identification exists; Besser–de Jeu Definition 4.6 requires n ≥ i > dim.
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.5/open-curve-splitting (construction): The Frobenius splitting for an open curve
   DECLARATION openCurveSplitting
   STATEMENT
     Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve
     with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on
     H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Let (𝒳, D) be a good-reduction pair
     (ColemanIntegration:L1/good-reduction-pair) with D finite étale over O_K and Y = 𝒳 ∖ D. Then
     H̃^2_ms(Y, 2) = Ω^†(Y)/dA^†(Y) = H^1_dR(A^†(Y)), the restriction res : H^1_dR(X) → H^1_dR(Y)
     is φ-equivariant and injective, and there is a unique φ-equivariant retraction p_D :
     H^1_dR(Y) → H^1_dR(X) (H^1(X) has Frobenius weight 1 and the cokernel of res, spanned by
     residues, weight 2). p_D does not depend on the Frobenius lift and is compatible with
     enlarging D.
   HYPOTHESIS
     K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with
     geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on
     H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K).
   HYPOTHESIS
     (𝒳, D) a good-reduction pair; D finite étale over O_K.
   PREREQUISITE
     ColemanIntegration:L1/good-reduction-pair
   PREREQUISITE
     ColemanIntegration:L1/wide-open-neighbourhood
   PREREQUISITE
     ColemanIntegration:L1/frobenius-lift
   PREREQUISITE
     PadicDifferentialEquationsAndRigidCohomology:RD.4/monsky-washnitzer-comparison
   PREREQUISITE
     PadicDifferentialEquationsAndRigidCohomology:RD.4/frobenius-on-rigid-cohomology
   PREREQUISITE
     PadicHodgeRegulators:D.5/curve-weight-two-target
   PREREQUISITE
     PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-lifts-induce-homotopic-maps
   API openCurveSplitting [data]
     openCurveSplitting 𝒳 D : H1dR (Y) →ₗ[K] H1dR X.
   API openCurveSplitting_comp_res [simp]
     openCurveSplitting 𝒳 D ∘ res = id.
   API openCurveSplitting_frob [characterisation]
     openCurveSplitting commutes with φ and is the unique such retraction.
   API openCurveSplitting_mono [relation]
     For D ⊆ D', openCurveSplitting 𝒳 D' ∘ res_{Y,Y'} = openCurveSplitting 𝒳 D.
   API openCurveSplitting_extensionality [extensionality]
     Two instances of this map agree iff their values agree on every element of the specified
     source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and
     map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred
     for the semilinear twist.
   TEST splitting_p1 [computation]
     For P^1 and D = {0, ∞}, openCurveSplitting = 0.
   TEST splitting_empty_boundary [degenerate]
     For D = ∅ (Y = X), openCurveSplitting = id.
   TEST splitting_res_compat [compatibility]
     openCurveSplitting 𝒳 D ∘ res = id on H1dR X.
   TEST splitting_not_residue_free [non-example]
     For X=P¹ and D={0,∞}, dlog(t) has nonzero boundary residues and projects to 0, while residue-
     free cohomology is the image of H¹(X), not a proposed complementary subspace. A rule equating
     the complementary summand with residue-free cohomology is therefore wrong.
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.5/curve-syntomic-regulator (construction): The degree-two syntomic regulator of a curve
   DECLARATION curveSyntomicRegulator
   STATEMENT
     Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve
     with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on
     H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). For u ∈ K_2(𝒳)^{(2)} ⊗ Q define reg_syn(u) ∈ H^2_syn(𝒳, 2) by
     the syntomic Chern class of D.2/syntomic-regulator, and put regSynCan(u) :=
     ι^{−1}(reg_syn(u)) and regP(u) := Θ(reg_syn(u)) = (1 − φ/q²)^{−1}regSynCan(u) in H^1_dR(X/K).
     If the restriction of u to Y = 𝒳 ∖ D is a finite sum Σ n_i{f_i, g_i} of symbols with f_i, g_i
     ∈ O(Y)^×, then regSynCan(u) = p_D[Σ_i n_i ε(f_i, g_i)] with ε(f, g) :=
     q^{−2}·log(f_0)·φ^*dlog g − q^{−1}·log(g_0)·dlog f, f_0 := f^q/φ^*f (a class in H̃^2_ms(Y, 2)
     = H^1_dR(A^†(Y))), and regP(u) = p_D((1 − φ^*/q²)^{−1}[Σ_i n_i ε(f_i, g_i)]). This gives the
     full 2g-coordinate regulator vector, not only its pairing with holomorphic forms.
   HYPOTHESIS
     K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with
     geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on
     H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K).
   HYPOTHESIS
     (𝒳, D) a good-reduction pair containing the supports of all f_i, g_i.
   PREREQUISITE
     PadicHodgeRegulators:D.5/curve-weight-two-target
   PREREQUISITE
     PadicHodgeRegulators:D.5/open-curve-splitting
   PREREQUISITE
     PadicHodgeRegulators:D.2/syntomic-regulator
   PREREQUISITE
     EllipticKTheory:E.4/adams-operations-and-the-weight-decomposition
   PREREQUISITE
     EllipticKTheory:E.3/localisation-sequence-for-a-curve
   PREREQUISITE
     K2SymbolsBrauer:T.3/tame-symbol
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
   API regSynCan_pairing_eigen [relation]
     For φ v = γ v: cupTrace (x − q^{−2}φ x) v = (1 − 1/(qγ))·cupTrace x v, the pairing form of
     regSynCan = (1 − φ/q²)·regP.
   API curveSyntomicRegulator_weight_three [simp]
     The weight-three part of K_2(𝒳) ⊗ Q maps to 0 (H^4_syn(𝒳, 3)-target vanishes for a curve).
   API curveSyntomicRegulator_extensionality [extensionality]
     Two instances of this map agree iff their values agree on every element of the specified
     source. Inherit map_zero and map_add from its AddMonoidHom or LinearMap structure, and
     map_smul when the declared scalar-linearity applies; no extra scalar-linearity is inferred
     for the semilinear twist.
   TEST regulator_constant_symbol [computation]
     For c ∈ μ_{q−1}, regSynCan {f, c} = 0.
   TEST regulator_diagonal_symbol [degenerate]
     regSynCan {f, f} = 0.
   TEST regulator_eigen_compat [compatibility]
     If φv = γv, B(regSynCan u, v) = (1 − 1/(pγ))·B(regP u, v) for K = Q_p.
   TEST regulator_canonical_not_coleman [non-example]
     Feeding regSynCan instead of regP into the Coleman symbol formula is off by (1 − φ/q²); on an
     eigen-pairing by the factor (1 − 1/(pγ)).
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.5/coleman-symbol-formula (theorem): Besser's Coleman-integral formula for the regulator of a symbol
   STATEMENT
     Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve
     with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on
     H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Let u ∈ K_2(𝒳)^{(2)} ⊗ Q restrict on Y = 𝒳 ∖ D to Σ_i n_i{f_i,
     g_i} with f_i, g_i ∈ O(Y)^× and (𝒳, D) a good-reduction pair containing all supports, and let
     ω ∈ H^0(X, Ω^1). Then B(regP(u), [ω]) = Σ_i n_i Σ_{x ∈ |D_K|} ord_x(f_i)·Tr_{K(x)/K}(CT_x(∫
     log(g_i)·ω)), where ∫ log(g_i)ω is the Coleman integral (ColemanIntegration:L1/coleman-
     integral) and CT_x the log-free constant term at x in a local parameter (after a finite
     extension, descending by Galois equivariance). The value is independent of the branch of the
     logarithm and of the constant of integration. Equivalently Tr_X(Θ(reg_syn{f, g}) ∪ [ω]) =
     ∫_{(f)} log(g)ω (Coleman–de Shalit's p-adic regulator). The formula holds for Θ = regP, not
     for the canonical regSynCan.
   HYPOTHESIS
     K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with
     geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on
     H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K).
   HYPOTHESIS
     All supports in a finite étale D; ω holomorphic.
   PREREQUISITE
     PadicHodgeRegulators:D.5/curve-syntomic-regulator
   PREREQUISITE
     ColemanIntegration:L1/coleman-integral
   PREREQUISITE
     ColemanIntegration:L1/locally-analytic-log-functions
   PREREQUISITE
     ColemanIntegration:L1/branch-independence-principle
   PREREQUISITE
     ColemanIntegration:L0/log-branch-field-compatibility
   PREREQUISITE
     K2SymbolsBrauer:T.4/weil-reciprocity-symbol-form
   PREREQUISITE
     EllipticKTheory:E.7/symbol-certificates
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.5/curve-etale-comparison (comparison): The curve regulator and the Bloch–Kato logarithm
   STATEMENT
     Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve
     with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on
     H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). and put V = H^1_et(X_K̄, Q_p(2)), a crystalline representation
     with D_cris(V) = H^1_dR(X/K) ⊗ e_2 and V^{G_K} = 0. For u ∈ K_2(𝒳)^{(2)} ⊗ Q the étale
     regulator r^et(u) ∈ H^1(K, V) lies in H^1_f = H^1_e, and regP(u) = log_BK(r^et(u)) under
     D_dR(V)/Fil^0 = H^1_dR(X/K); equivalently regSynCan(u) = (1 − p^{−2}φ_p)·log_BK(r^et(u)) for
     K = Q_p (φ_p the p-power Frobenius). If φ_p v = γv then B(regSynCan u, v) = (1 −
     1/(pγ))·B(regP u, v).
   HYPOTHESIS
     K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with
     geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on
     H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K).
   HYPOTHESIS
     For the (1 − p^{−2}φ_p) form, K = Q_p (or φ_p the p-semilinear Frobenius on an unramified K).
   PREREQUISITE
     PadicHodgeRegulators:D.5/curve-syntomic-regulator
   PREREQUISITE
     PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison
   PREREQUISITE
     PadicHodgeRegulators:L1/bloch-kato-logarithm
   PREREQUISITE
     PadicHodgeRegulators:L1/dimension-formulas
   PREREQUISITE
     PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.5/curve-regulator-functoriality (theorem): Pullback, pushforward and base change of the curve regulator
   STATEMENT
     Assume K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve
     with geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on
     H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K). Let π : 𝒳' → 𝒳 be a finite flat morphism of good-reduction
     curves. (a) Pullback: regP(π^*u) = π^*regP(u), and B'(π^*a, π^*b) = deg(π)·B(a, b). (b)
     Pushforward: regP(π_*u') = π_*regP(u') with π_* the de Rham trace, characterised by B(π_*a',
     b) = B'(a', π^*b); at the level of symbols ∫_{(π^*f)} log(g)·π^*ω = ∫_{(f)} log(N g)·ω. (c)
     Base change: for K'/K finite unramified, regP(u|_{𝒳_{O_{K'}}}) = regP(u) ⊗ 1, and the
     transfer N_{K'/K} corresponds to Tr_{K'/K}. The same holds for regSynCan. Part (b) at the
     level of syntomic cohomology is recorded as a gap: no source read proves pushforward
     compatibility for rigid syntomic regulators; it follows from (a) and the projection formula
     on the image of pullback, and in general from the étale comparison D.5/curve-etale-comparison
     and corestriction compatibility of r^et.
   HYPOTHESIS
     K/Q_p finite unramified with residue field F_q, q = p^f; 𝒳/O_K a smooth proper curve with
     geometrically connected fibres and generic fibre X; φ the K-linear q-power Frobenius on
     H^1_dR(X/K) ≅ H^1_rig(𝒳_k/K).
   HYPOTHESIS
     π finite flat between smooth proper curves over O_K.
   PREREQUISITE
     PadicHodgeRegulators:D.5/curve-syntomic-regulator
   PREREQUISITE
     PadicHodgeRegulators:D.5/curve-etale-comparison
   PREREQUISITE
     SchemeKTheoryOperations:S.2/k-theory-pullback
   PREREQUISITE
     SchemeKTheoryOperations:S.2/k-theory-proper-pushforward
   PREREQUISITE
     SchemeKTheoryOperations:S.2/projection-formula
   PREREQUISITE
     EllipticKTheory:E.3/naturality-for-finite-pullback
   PREREQUISITE
     EllipticKTheory:E.3/naturality-for-finite-transfer
   PREREQUISITE
     ColemanIntegration:L1/coleman-pullback
   PREREQUISITE
     PadicDifferentialEquationsAndRigidCohomology:RD.4/de-rham-trace
   PREREQUISITE
     PadicDifferentialEquationsAndRigidCohomology:RD.4/functoriality-of-rigid-cohomology
-/

/- UNELABORATED CONTRACT PadicHodgeRegulators:D.5/semistable-input-boundary (comparison): What bad or semistable reduction requires beyond good reduction
   STATEMENT
     For a smooth proper semistable curve X/K, NN Theorems A,B provide rational syntomic
     cohomology and compatible Chern classes; the arithmetic regulator factors through
     H¹_st(G_K,H¹_et(X_K̄,Q_p(2))). The semistable comparison imports the Hyodo–Kato (φ,N)
     structure from CohomologyComparisons CP.4. Besser–Zerbes Theorem 1.1 identifies Vologodsky
     integration with appropriately corrected/glued Coleman primitives on semistable curves. These
     results do not themselves give a weight-two symbol formula in H¹_dR or prove that its domain
     is exactly ker N. Such a formula, its monodromy restriction and any convenient quotient are
     remaining targets to be sourced and planned through the shared log-syntomic prefix and
     ColemanIntegration Part II; none is asserted by this node.
   HYPOTHESIS
     X/K smooth proper with semistable reduction.
   PREREQUISITE
     PadicHodgeRegulators:D.2/log-syntomic-complex
   PREREQUISITE
     PadicHodgeRegulators:D.2/syntomic-exponential
   PREREQUISITE
     CohomologyComparisons:CP.4
   PREREQUISITE
     PadicHodgeRegulators:D.5/coleman-symbol-formula
-/

/-! ## Perrin–Riou regulators and Coleman coordinates (L3–L4) -/

section Euler
variable {E : Type*} [Field E] {d : ℕ}

-- PadicHodgeRegulators:L3/quadratic-frobenius-inverse
def quadraticFrobeniusInverse (a b : E) (Φ : Matrix (Fin d) (Fin d) E) :
    Matrix (Fin d) (Fin d) E := -b⁻¹ • (Φ + a • 1)

lemma quadraticFrobeniusInverse_formula (a b : E) (Φ : Matrix (Fin d) (Fin d) E) :
    quadraticFrobeniusInverse a b Φ = -b⁻¹ • (Φ + a • 1) := by sorry

-- PadicHodgeRegulators:L3/quadratic-frobenius-inverse-spec
lemma quadraticFrobeniusInverse_spec (a b : E) (Φ : Matrix (Fin d) (Fin d) E)
    (h : Φ * Φ + a • Φ + b • 1 = 0) (hb : b ≠ 0) :
    Φ * quadraticFrobeniusInverse a b Φ = 1 ∧
      quadraticFrobeniusInverse a b Φ * Φ = 1 := by sorry

lemma quadraticFrobeniusInverse_map {E' : Type*} [Field E'] (σ : E →+* E')
    (a b : E) (Φ : Matrix (Fin d) (Fin d) E) :
    (quadraticFrobeniusInverse a b Φ).map σ =
      quadraticFrobeniusInverse (σ a) (σ b) (Φ.map σ) := by sorry

-- TEST frobenius_scalar_two
example : quadraticFrobeniusInverse (-5 : ℚ) 6 (fun _ _ : Fin 1 => 2) =
    (fun _ _ : Fin 1 => (1 / 2 : ℚ)) := by sorry
-- TEST frobenius_scalar_minus_one
example : quadraticFrobeniusInverse (0 : ℚ) (-1) (fun _ _ : Fin 1 => -1) =
    (fun _ _ : Fin 1 => (-1 : ℚ)) := by sorry
-- TEST frobenius_singular_excluded
example : (0 : Matrix (Fin 1) (Fin 1) ℚ) * quadraticFrobeniusInverse 0 0 0 ≠ 1 := by sorry

-- PadicHodgeRegulators:L3/quadratic-euler-inverse
def quadraticEulerInverse (a b : E) (Φ : Matrix (Fin d) (Fin d) E) :
    Matrix (Fin d) (Fin d) E := (1 + a + b)⁻¹ • (Φ + (1 + a) • 1)

lemma quadraticEulerInverse_formula (a b : E) (Φ : Matrix (Fin d) (Fin d) E) :
    quadraticEulerInverse a b Φ = (1 + a + b)⁻¹ • (Φ + (1 + a) • 1) := by sorry

-- PadicHodgeRegulators:L3/quadratic-euler-inverse-spec
lemma quadraticEulerInverse_spec (a b : E) (Φ : Matrix (Fin d) (Fin d) E)
    (h : Φ * Φ + a • Φ + b • 1 = 0) (hs : 1 + a + b ≠ 0) :
    (1 - Φ) * quadraticEulerInverse a b Φ = 1 ∧
      quadraticEulerInverse a b Φ * (1 - Φ) = 1 := by sorry

lemma quadraticEulerInverse_map {E' : Type*} [Field E'] (σ : E →+* E')
    (a b : E) (Φ : Matrix (Fin d) (Fin d) E) :
    (quadraticEulerInverse a b Φ).map σ =
      quadraticEulerInverse (σ a) (σ b) (Φ.map σ) := by sorry

-- TEST euler_scalar_two
example : quadraticEulerInverse (-5 : ℚ) 6 (fun _ _ : Fin 1 => 2) =
    (fun _ _ : Fin 1 => (-1 : ℚ)) := by sorry
-- TEST euler_scalar_zero
example : quadraticEulerInverse (0 : ℚ) 0 (0 : Matrix (Fin 1) (Fin 1) ℚ) = 1 := by sorry
-- TEST euler_singular_excluded
example : (1 - (1 : Matrix (Fin 1) (Fin 1) ℚ)) * quadraticEulerInverse (-3) 2 1 ≠ 1 := by sorry

-- PadicHodgeRegulators:L3/quadratic-euler-product
theorem quadraticEulerProduct (p a b : E) (Φ : Matrix (Fin d) (Fin d) E)
    (h : Φ * Φ + a • Φ + b • 1 = 0) (hp : p ≠ 0) (hb : b ≠ 0)
    (hs : 1 + a + b ≠ 0) :
    quadraticEulerInverse a b Φ * (1 - p⁻¹ • quadraticFrobeniusInverse a b Φ) =
      (p * b * (1 + a + b))⁻¹ •
        ((1 + a + p * b) • Φ + (a * (1 + a + p * b) + b * (p - 1)) • 1) := by sorry
end Euler

section Constraints
variable {E R : Type*} [Field E] [CommRing R] [Algebra E R]
variable {d m : ℕ}

-- PadicHodgeRegulators:L4/evaluation-constraints
def evaluationConstraints (J : Finset (Fin m)) (ev : Fin m → R →ₐ[E] E)
    (V : Fin m → Submodule E (Fin d → E)) : Submodule R (Fin d → R) where
  carrier := {F | ∀ j ∈ J, (fun k => ev j (F k)) ∈ V j}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

lemma evaluationConstraints_mem (J : Finset (Fin m)) (ev : Fin m → R →ₐ[E] E)
    (V : Fin m → Submodule E (Fin d → E)) (F : Fin d → R) :
    F ∈ evaluationConstraints J ev V ↔ ∀ j ∈ J, (fun k => ev j (F k)) ∈ V j := by sorry

lemma evaluationConstraints_empty (ev : Fin m → R →ₐ[E] E)
    (V : Fin m → Submodule E (Fin d → E)) : evaluationConstraints ∅ ev V = ⊤ := by sorry

lemma evaluationConstraints_antitone (J J' : Finset (Fin m)) (h : J ⊆ J')
    (ev : Fin m → R →ₐ[E] E) (V : Fin m → Submodule E (Fin d → E)) :
    evaluationConstraints J' ev V ≤ evaluationConstraints J ev V := by sorry

-- TEST constraints_none
example (ev : Fin 0 → R →ₐ[E] E) (V : Fin 0 → Submodule E (Fin d → E)) :
    evaluationConstraints Finset.univ ev V = ⊤ := by sorry
-- TEST constraints_zero_at_zero: real polynomial evaluation, not a chosen zero map.
example :
    (fun _ : Fin 1 => (1 : ℚ[X])) ∉
      evaluationConstraints {0} (fun _ : Fin 1 => Polynomial.aeval (0 : ℚ))
        (fun _ => (⊥ : Submodule ℚ (Fin 1 → ℚ))) ∧
    (fun _ : Fin 1 => (X : ℚ[X])) ∈
      evaluationConstraints {0} (fun _ : Fin 1 => Polynomial.aeval (0 : ℚ))
        (fun _ => (⊥ : Submodule ℚ (Fin 1 → ℚ))) := by sorry
-- TEST constraints_diagonal
example :
    (![1,1] : Fin 2 → ℚ[X]) ∈
      evaluationConstraints {0} (fun _ : Fin 1 => Polynomial.aeval (0 : ℚ))
        (fun _ => Submodule.span ℚ {(![1,1] : Fin 2 → ℚ)}) ∧
    (![1,0] : Fin 2 → ℚ[X]) ∉
      evaluationConstraints {0} (fun _ : Fin 1 => Polynomial.aeval (0 : ℚ))
        (fun _ => Submodule.span ℚ {(![1,1] : Fin 2 → ℚ)}) := by sorry

-- PadicHodgeRegulators:L4/transported-specialization
def transportedSpecialization (V : Submodule E (Fin d → E))
    (C : Matrix (Fin d) (Fin d) E) : Submodule E (Fin d → E) :=
  V.comap ((Matrix.vecMulBilin E E).flip C)

lemma transportedSpecialization_mem (V : Submodule E (Fin d → E))
    (C : Matrix (Fin d) (Fin d) E) (v : Fin d → E) :
    v ∈ transportedSpecialization V C ↔ v ᵥ* C ∈ V := by sorry

lemma transportedSpecialization_one (V : Submodule E (Fin d → E)) :
    transportedSpecialization V 1 = V := by sorry

lemma transportedSpecialization_comp (V : Submodule E (Fin d → E))
    (C D : Matrix (Fin d) (Fin d) E) :
    transportedSpecialization (transportedSpecialization V C) D =
      transportedSpecialization V (D * C) := by sorry

-- TEST transport_identity
example (V : Submodule E (Fin d → E)) : transportedSpecialization V 1 = V := by sorry
-- TEST transport_shear
example : transportedSpecialization (Submodule.span ℚ {(![1,0] : Fin 2 → ℚ)})
    (!![1,1;0,1] : Matrix (Fin 2) (Fin 2) ℚ) =
    Submodule.span ℚ {(![1,-1] : Fin 2 → ℚ)} := by sorry
-- TEST transport_singular
example : transportedSpecialization (⊥ : Submodule ℚ (Fin 2 → ℚ)) 0 = ⊤ := by sorry

-- PadicHodgeRegulators:L4/transport-dimension
lemma transportedSpecialization_finrank (V : Submodule E (Fin d → E))
    (C : (Matrix (Fin d) (Fin d) E)ˣ) :
    (∃ e : transportedSpecialization V (C : Matrix (Fin d) (Fin d) E) ≃ₗ[E] V,
      ∀ v, (e v : Fin d → E) = (v : Fin d → E) ᵥ* (C : Matrix (Fin d) (Fin d) E)) ∧
    Module.finrank E (transportedSpecialization V (C : Matrix (Fin d) (Fin d) E)) =
      Module.finrank E V := by sorry

variable [domain : IsDomain R]
variable (J : Finset (Fin m)) (t : R) (x : Fin m → E)
variable (ev : Fin m → R →ₐ[E] E) (V : Fin m → Submodule E (Fin d → E))
variable (hx : Function.Injective x) (hev : ∀ j, ev j t = x j)
variable (hq : ∀ j, t - algebraMap E R (x j) ≠ 0)
variable (hker : ∀ j f, ev j f = 0 ↔ t - algebraMap E R (x j) ∣ f)

-- PadicHodgeRegulators:L4/scalar-multiple-zeros
lemma divisibleByEvaluationProduct (hx : Function.Injective x) (hev : ∀ j, ev j t = x j)
    (hq : ∀ j, t - algebraMap E R (x j) ≠ 0)
    (hker : ∀ j f, ev j f = 0 ↔ t - algebraMap E R (x j) ∣ f) (f : R) :
    (∀ j ∈ J, ev j f = 0) ↔ (∏ j ∈ J, (t - algebraMap E R (x j))) ∣ f := by sorry

-- PadicHodgeRegulators:L4/single-constraint-basis
lemma singleConstraintBasisExists
    (hx : Function.Injective x) (hev : ∀ j, ev j t = x j)
    (hq : ∀ j, t - algebraMap E R (x j) ≠ 0)
    (hker : ∀ j f, ev j f = 0 ↔ t - algebraMap E R (x j) ∣ f) (j : Fin m) :
    ∃ b : Module.Basis (Fin d) R (evaluationConstraints {j} ev V),
      ∃ C : (Matrix (Fin d) (Fin d) E)ˣ,
        (∀ v : Fin d → E, v ∈ V j ↔
          ∀ k : Fin d, Module.finrank E (V j) ≤ k.val →
            (v ᵥ* (↑C⁻¹ : Matrix (Fin d) (Fin d) E)) k = 0) ∧
        (fun i k => (b i : Fin d → R) k) =
          Matrix.diagonal (fun i : Fin d =>
            if i.val < Module.finrank E (V j) then 1 else t - algebraMap E R (x j)) *
            (↑C : Matrix (Fin d) (Fin d) E).map (algebraMap E R) := by sorry

-- PadicHodgeRegulators:L4/unused-point-invertibility
lemma constraintBasisEvaluationInvertible (hx : Function.Injective x)
    (hev : ∀ j, ev j t = x j) (B : Matrix (Fin d) (Fin d) R)
    (ε : Rˣ) (n : Fin m → ℕ)
    (hdet : B.det = (ε : R) * ∏ i ∈ J, (t - algebraMap E R (x i)) ^ n i)
    (j : Fin m) (hj : j ∉ J) : IsUnit (B.map (ev j)) := by sorry

-- PadicHodgeRegulators:L4/constraint-basis
-- Include the section domain hypothesis even though it is absent from the result type.
include domain in
def constraintBasis (J : Finset (Fin m)) (t : R) (x : Fin m → E)
    (ev : Fin m → R →ₐ[E] E) (V : Fin m → Submodule E (Fin d → E))
    (hx : Function.Injective x) (hev : ∀ j, ev j t = x j)
    (hq : ∀ j, t - algebraMap E R (x j) ≠ 0)
    (hker : ∀ j f, ev j f = 0 ↔ t - algebraMap E R (x j) ∣ f) :
    Module.Basis (Fin d) R (evaluationConstraints J ev V) := by sorry

lemma constraintBasis_rows_mem (i : Fin d) :
    ((constraintBasis J t x ev V hx hev hq hker i) : Fin d → R) ∈
      evaluationConstraints J ev V := by sorry

lemma constraintBasis_expansion (F : evaluationConstraints J ev V) :
    ∃! c : Fin d → R,
      ∑ i, c i • constraintBasis J t x ev V hx hev hq hker i = F := by sorry

-- PadicHodgeRegulators:L4/constraint-determinant
theorem constraintBasis_determinant
    (hx : Function.Injective x) (hev : ∀ j, ev j t = x j)
    (hq : ∀ j, t - algebraMap E R (x j) ≠ 0)
    (hker : ∀ j f, ev j f = 0 ↔ t - algebraMap E R (x j) ∣ f)
    (b : Module.Basis (Fin d) R (evaluationConstraints J ev V)) :
    Associated (Matrix.det (fun i k => (b i : Fin d → R) k))
      (∏ j ∈ J, (t - algebraMap E R (x j)) ^ (d - Module.finrank E (V j))) := by sorry

-- TEST basis_single_zero_condition
example : Function.Injective (fun f : ℚ[X] => X * f) ∧
    (∀ f : ℚ[X], f.eval 0 = 0 ↔ ∃ g, f = X * g) := by sorry
-- TEST basis_two_zero_conditions
example (f : ℚ[X]) : (f.eval 0 = 0 ∧ f.eval 5 = 0) ↔
    ∃! g : ℚ[X], f = (X * (X - C 5)) * g := by sorry
-- TEST basis_two_coordinates
example (F G : ℚ[X]) : (G.eval 0 = 0 ∧ F.eval 5 = 0) ↔
    ∃! c : Fin 2 → ℚ[X], F = c 0 * (X - C 5) ∧ G = c 1 * X := by sorry

attribute [local instance] Classical.propDecidable

-- PadicHodgeRegulators:L4/projection-generator
def projectionGenerator (k : Fin d) : R := by
  classical
  exact ∏ j ∈ J.filter (fun j => ∀ v ∈ V j, v k = 0), (t - algebraMap E R (x j))

lemma projectionGenerator_formula (k : Fin d) :
    projectionGenerator J t x V k =
      ∏ j ∈ J.filter (fun j => ∀ v ∈ V j, v k = 0), (t - algebraMap E R (x j)) := by
  classical
  sorry

lemma projectionGenerator_empty (k : Fin d)
    (h : ∀ j ∈ J, ∃ v ∈ V j, v k ≠ 0) : projectionGenerator J t x V k = 1 := by sorry

lemma projectionGenerator_eval (hx : Function.Injective x) (hev : ∀ j, ev j t = x j)
    (k : Fin d) (j : Fin m) (hj : j ∈ J) :
    ev j (projectionGenerator J t x V k) = 0 ↔ ∀ v ∈ V j, v k = 0 := by sorry

-- TEST projection_no_constraints
example (k : Fin d) : projectionGenerator (R := R) ∅ t x V k = 1 := by sorry
-- TEST projection_all_zero
example : projectionGenerator (R := ℚ[X]) Finset.univ X (![0,5] : Fin 2 → ℚ)
    (fun _ => (⊥ : Submodule ℚ (Fin 1 → ℚ))) 0 = X * (X - C 5) := by sorry
-- TEST projection_mixed
example :
    let V : Fin 2 → Submodule ℚ (Fin 2 → ℚ) :=
      ![Submodule.span ℚ {![(1:ℚ),0]}, Submodule.span ℚ {![0,(1:ℚ)]}]
    projectionGenerator (R := ℚ[X]) Finset.univ X (![0,5] : Fin 2 → ℚ) V 0 = X - C 5 ∧
    projectionGenerator (R := ℚ[X]) Finset.univ X (![0,5] : Fin 2 → ℚ) V 1 = X := by sorry

-- PadicHodgeRegulators:L4/projection-witness
def projectionWitness (J : Finset (Fin m)) (t : R) (x : Fin m → E)
    (ev : Fin m → R →ₐ[E] E) (V : Fin m → Submodule E (Fin d → E))
    (hx : Function.Injective x) (hev : ∀ j, ev j t = x j)
    (hq : ∀ j, t - algebraMap E R (x j) ≠ 0)
    (hker : ∀ j f, ev j f = 0 ↔ t - algebraMap E R (x j) ∣ f) (k : Fin d) :
    evaluationConstraints J ev V := by sorry

lemma projectionWitness_coordinate (k : Fin d) :
    (projectionWitness J t x ev V hx hev hq hker k : Fin d → R) k =
      projectionGenerator J t x V k := by sorry

lemma projectionWitness_mem (k : Fin d) :
    (projectionWitness J t x ev V hx hev hq hker k : Fin d → R) ∈
      evaluationConstraints J ev V := by sorry

lemma projectionWitness_multiples (k : Fin d) (r : R) :
    let F : Fin d → R := projectionWitness J t x ev V hx hev hq hker k
    r • F ∈ evaluationConstraints J ev V ∧ (r • F) k = r * projectionGenerator J t x V k := by sorry

-- TEST witness_empty
example (k : Fin d) : ∃ F ∈ evaluationConstraints ∅ ev V, F k = 1 := by sorry
-- TEST witness_diagonal
example : ∃ F ∈ evaluationConstraints {0} (fun _ : Fin 1 => Polynomial.aeval (0 : ℚ))
    (fun _ => Submodule.span ℚ {(![1,1] : Fin 2 → ℚ)}), F 0 = (1 : ℚ[X]) := by sorry
-- TEST witness_integral_denominators (rational computation)
example : Lagrange.interpolate Finset.univ (![0,5] : Fin 2 → ℚ) (![0,1] : Fin 2 → ℚ) =
    C (1 / 5 : ℚ) * X := by sorry

-- PadicHodgeRegulators:L4/coordinate-image
theorem coordinateImage_eq (hx : Function.Injective x) (hev : ∀ j, ev j t = x j)
    (hq : ∀ j, t - algebraMap E R (x j) ≠ 0)
    (hker : ∀ j f, ev j f = 0 ↔ t - algebraMap E R (x j) ∣ f) (k : Fin d) :
    {r : R | ∃ F ∈ evaluationConstraints J ev V, F k = r} =
      {r : R | projectionGenerator J t x V k ∣ r} := by sorry
end Constraints

section Coordinates
variable {R A H W Y : Type*} [CommRing R] [CommRing A] [Algebra R A]
variable [AddCommGroup H] [Module R H] [AddCommGroup W] [Module R W]
variable [AddCommGroup Y] [Module A Y] [Module R Y] [IsScalarTower R A Y]
variable {d : ℕ}

-- PadicHodgeRegulators:L4/coleman-coordinates
def colemanCoordinates (f : H →ₗ[R] W) (e : W ≃ₗ[R] (Fin d → R)) :
    H →ₗ[R] (Fin d → R) := e.toLinearMap.comp f

lemma colemanCoordinates_apply (f : H →ₗ[R] W) (e : W ≃ₗ[R] (Fin d → R)) (z : H) :
    colemanCoordinates f e z = e (f z) := by sorry

-- PadicHodgeRegulators:L4/coleman-reconstruction
lemma colemanCoordinates_reconstruct (f : H →ₗ[R] W) (e : W ≃ₗ[R] (Fin d → R)) (z : H) :
    e.symm (colemanCoordinates f e z) = f z := by sorry

lemma colemanCoordinates_precomp {H' : Type*} [AddCommGroup H'] [Module R H']
    (f : H →ₗ[R] W) (e : W ≃ₗ[R] (Fin d → R)) (g : H' →ₗ[R] H) :
    colemanCoordinates (f.comp g) e = (colemanCoordinates f e).comp g := by sorry

-- TEST coleman_zero
example (e : W ≃ₗ[R] (Fin d → R)) : colemanCoordinates (0 : H →ₗ[R] W) e = 0 := by sorry
-- TEST coleman_standard
example : colemanCoordinates (LinearMap.id : (Fin d → R) →ₗ[R] (Fin d → R))
    (LinearEquiv.refl R (Fin d → R)) = LinearMap.id := by sorry
-- TEST coleman_shear_inverse
example : (![1,0] : Fin 2 → ℚ) ᵥ* (!![1,-1;0,1] : Matrix (Fin 2) (Fin 2) ℚ) = ![1,-1] ∧
    (![1,0] : Fin 2 → ℚ) ᵥ* (!![1,1;0,1] : Matrix (Fin 2) (Fin 2) ℚ) ≠ ![1,-1] := by sorry

-- PadicHodgeRegulators:L4/logarithmic-matrix
def logarithmicMatrix (e : W ≃ₗ[R] (Fin d → R)) (b : Y ≃ₗ[A] (Fin d → A))
    (j : W →ₗ[R] Y) : Matrix (Fin d) (Fin d) A :=
  fun i k => b (j (e.symm (Pi.single i 1))) k

lemma logarithmicMatrix_entry (e : W ≃ₗ[R] (Fin d → R))
    (b : Y ≃ₗ[A] (Fin d → A)) (j : W →ₗ[R] Y) (i k : Fin d) :
    logarithmicMatrix e b j i k = b (j (e.symm (Pi.single i 1))) k := by sorry

-- PadicHodgeRegulators:L4/matrix-expansion
lemma logarithmicMatrix_expansion (e : W ≃ₗ[R] (Fin d → R))
    (b : Y ≃ₗ[A] (Fin d → A)) (j : W →ₗ[R] Y) (w : W) :
    b (j w) = (fun i => algebraMap R A (e w i)) ᵥ* logarithmicMatrix e b j := by sorry

lemma logarithmicMatrix_zero (e : W ≃ₗ[R] (Fin d → R)) (b : Y ≃ₗ[A] (Fin d → A)) :
    logarithmicMatrix e b (0 : W →ₗ[R] Y) = 0 := by sorry

-- TEST matrix_identity
example : logarithmicMatrix (LinearEquiv.refl R (Fin d → R))
    (LinearEquiv.refl R (Fin d → R)) LinearMap.id = 1 := by sorry
-- TEST matrix_non_diagonal
example : logarithmicMatrix (LinearEquiv.refl ℚ (Fin 2 → ℚ))
    (LinearEquiv.refl ℚ (Fin 2 → ℚ))
    ((Matrix.vecMulBilin ℚ ℚ).flip (!![1,2;3,4] : Matrix (Fin 2) (Fin 2) ℚ)) =
      !![1,2;3,4] := by sorry
-- TEST matrix_singular_inclusion
example : (logarithmicMatrix (LinearEquiv.refl ℚ (Fin 2 → ℚ))
    (LinearEquiv.refl ℚ (Fin 2 → ℚ))
    ((Matrix.vecMulBilin ℚ ℚ).flip (!![1,0;0,0] : Matrix (Fin 2) (Fin 2) ℚ))).det = 0 := by sorry

-- PadicHodgeRegulators:L4/regulator-coordinate-decomposition
theorem regulatorCoordinateDecomposition (f : H →ₗ[R] W) (e : W ≃ₗ[R] (Fin d → R))
    (b : Y ≃ₗ[A] (Fin d → A)) (j : W →ₗ[R] Y) (z : H) :
    b (j (f z)) = (fun i => algebraMap R A (colemanCoordinates f e z i)) ᵥ*
      logarithmicMatrix e b j := by sorry

-- PadicHodgeRegulators:L4/constant-basis-covariance
-- hU and hB specify changes between actual coordinate equivalences;
-- equivalently the columns of basis vectors satisfy n'=Un and nu'=Bnu.
theorem constantBasisCovariance
    (e e' : W ≃ₗ[R] (Fin d → R)) (b b' : Y ≃ₗ[A] (Fin d → A))
    (j : W →ₗ[R] Y) (U : (Matrix (Fin d) (Fin d) R)ˣ)
    (B : (Matrix (Fin d) (Fin d) A)ˣ)
    (hU : ∀ w, e w = e' w ᵥ* (↑U : Matrix (Fin d) (Fin d) R))
    (hB : ∀ y, b y = b' y ᵥ* (↑B : Matrix (Fin d) (Fin d) A)) :
    (∀ w, e' w = e w ᵥ* (↑U⁻¹ : Matrix (Fin d) (Fin d) R)) ∧
    logarithmicMatrix e' b' j =
      (↑U : Matrix (Fin d) (Fin d) R).map (algebraMap R A) *
        logarithmicMatrix e b j * (↑B⁻¹ : Matrix (Fin d) (Fin d) A) ∧
    (∀ w, (fun i => algebraMap R A (e' w i)) ᵥ* logarithmicMatrix e' b' j =
      ((fun i => algebraMap R A (e w i)) ᵥ* logarithmicMatrix e b j) ᵥ*
        (↑B⁻¹ : Matrix (Fin d) (Fin d) A)) := by sorry
end Coordinates

section Shear
variable {R : Type*} [CommRing R]

-- PadicHodgeRegulators:L4/shear-matrix
def shearMatrix (e1 e2 : R) : Matrix (Fin 2) (Fin 2) R := !![1,e2;e1,1]

lemma shearMatrix_action (e1 e2 F G : R) :
    (![F,G] : Fin 2 → R) ᵥ* shearMatrix e1 e2 = ![F + e1 * G, G + e2 * F] := by sorry

lemma shearMatrix_det (e1 e2 : R) : (shearMatrix e1 e2).det = 1 - e1 * e2 := by sorry

lemma shearMatrix_unit (e1 e2 : R) (h : IsUnit (1 - e1 * e2)) :
    IsUnit (shearMatrix e1 e2) := by sorry

-- TEST shear_identity
example : shearMatrix (0 : R) 0 = 1 := by sorry
-- TEST shear_order
example : (![7,11] : Fin 2 → ℤ) ᵥ* shearMatrix 2 3 = ![29,32] := by sorry

variable {E : Type*} [Field E]
-- PadicHodgeRegulators:L4/shear-specialization-lines
lemma shearSpecializationLines (e1 e2 F G r : E) (hdet : 1 - e1 * e2 ≠ 0) :
    (F = 0 ↔ F + e1 * G = e1 * (G + e2 * F)) ∧
    (G = 0 ↔ G + e2 * F = e2 * (F + e1 * G)) ∧
    (F = r * G ↔ (1 + e2 * r) * (F + e1 * G) = (e1 + r) * (G + e2 * F)) := by sorry

-- PadicHodgeRegulators:L4/integral-shear-choice
theorem integralShearChoice {O : Type*} [CommRing O] [IsDomain O] [IsLocalRing O]
    (ι : O →+* E) (hi : Function.Injective ι)
    (hinf : Set.Infinite (IsLocalRing.maximalIdeal O : Set O)) (rs : Finset E) :
    ∃ e1 e2 : O, e1 ≠ 0 ∧ e2 ≠ 0 ∧
      e1 ∈ IsLocalRing.maximalIdeal O ∧ e2 ∈ IsLocalRing.maximalIdeal O ∧
      (∀ r ∈ rs, ι e1 + r ≠ 0 ∧ 1 + ι e2 * r ≠ 0) ∧
      IsUnit (shearMatrix e1 e2) := by sorry

-- PadicHodgeRegulators:L4/sheared-coordinate-surjectivity
theorem shearedCoordinateSurjectivity {O R : Type*} [CommRing O] [IsDomain O]
    [IsLocalRing O] [CommRing R] [Algebra E R] [IsDomain R]
    (ι : O →+* E) (hi : Function.Injective ι)
    (hinf : Set.Infinite (IsLocalRing.maximalIdeal O : Set O))
    {m : ℕ} (J : Finset (Fin m)) (t : R) (x : Fin m → E)
    (ev : Fin m → R →ₐ[E] E) (V : Fin m → Submodule E (Fin 2 → E))
    (hx : Function.Injective x) (hev : ∀ j, ev j t = x j)
    (hq : ∀ j, t - algebraMap E R (x j) ≠ 0)
    (hker : ∀ j f, ev j f = 0 ↔ t - algebraMap E R (x j) ∣ f)
    (hline : ∀ j ∈ J, Module.finrank E (V j) = 1) :
    ∃ U : (Matrix (Fin 2) (Fin 2) O)ˣ,
      ∀ k : Fin 2, ∀ r : R, ∃ F ∈ evaluationConstraints J ev V,
        (F ᵥ* (↑U : Matrix (Fin 2) (Fin 2) O).map
          ((algebraMap E R).comp ι)) k = r := by sorry
end Shear

section IntegralTests
local instance : Fact (Nat.Prime 5) := ⟨by decide⟩
-- TEST shear_nonunit_determinant
example : (shearMatrix (1 : ℤ_[5]) (-4)).det = 5 ∧
    (5 : ℤ_[5]) ≠ 0 ∧ ¬ IsUnit (shearMatrix (1 : ℤ_[5]) (-4)) := by sorry
-- Additional half of TEST witness_integral_denominators.
example : ¬ ∃ f : Polynomial ℤ_[5], f.eval 0 = 0 ∧ f.eval 5 = 1 := by sorry
-- The proper ideal (5,X) becomes full after rationalization; no unqualified
-- integral-surjectivity theorem is asserted by this file.
end IntegralTests

section GammaFactor
-- PadicHodgeRegulators:L3/gamma-leading-factor
def gammaLeadingFactor (j : ℤ) : ℚ :=
  if 0 ≤ j then (j.toNat.factorial : ℚ)
  else (-1 : ℚ) ^ (-j - 1).toNat / ((-j - 1).toNat.factorial : ℚ)

lemma gammaLeadingFactor_nonneg (n : ℕ) :
    gammaLeadingFactor n = (n.factorial : ℚ) := by sorry
lemma gammaLeadingFactor_neg (n : ℕ) :
    gammaLeadingFactor (-(n : ℤ) - 1) = (-1 : ℚ)^n / (n.factorial : ℚ) := by sorry
lemma gammaLeadingFactor_ne_zero (j : ℤ) : gammaLeadingFactor j ≠ 0 := by sorry
-- TEST gamma_zero
example : gammaLeadingFactor 0 = 1 := by sorry
-- TEST gamma_minus_two
example : gammaLeadingFactor (-2) = -1 := by sorry
-- TEST gamma_minus_three
example : gammaLeadingFactor (-3) = 1 / 2 := by sorry
end GammaFactor

section ScalarProjection
variable {E H C Z : Type*} [Field E] [CommRing H] [Algebra E H]
  [AddCommGroup C] [Module E C] [AddCommGroup Z] [Module E Z]

-- PadicHodgeRegulators:L3/scalar-projection
-- This is the actual tensor projection given an already constructed vector map L.
-- It neither asserts nor packages the existence of an arithmetic regulator.
def scalarRegulator (L : Z →ₗ[E] H ⊗[E] C) (ell : C →ₗ[E] E) : Z →ₗ[E] H :=
  (TensorProduct.rid E H).toLinearMap ∘ₗ
    (TensorProduct.map (LinearMap.id : H →ₗ[E] H) ell) ∘ₗ L
lemma scalarRegulator_apply (L : Z →ₗ[E] H ⊗[E] C) (ell : C →ₗ[E] E) (z : Z) :
    scalarRegulator L ell z =
      TensorProduct.rid E H (TensorProduct.map (LinearMap.id : H →ₗ[E] H) ell (L z)) := by sorry
lemma scalarRegulator_add_functional (L : Z →ₗ[E] H ⊗[E] C)
    (ell1 ell2 : C →ₗ[E] E) :
    scalarRegulator L (ell1 + ell2) = scalarRegulator L ell1 + scalarRegulator L ell2 := by sorry
-- TEST scalar_zero_functional
example (L : Z →ₗ[E] H ⊗[E] C) : scalarRegulator L 0 = 0 := by sorry
-- TEST scalar_period_scaling
example (L : Z →ₗ[E] H ⊗[E] C) (ell : C →ₗ[E] E) :
    scalarRegulator L ((2 : E) • ell) = (2 : E) • scalarRegulator L ell := by sorry
-- TEST scalar_ordered_projection: use an actual pure tensor, not an arbitrary map.
example : TensorProduct.rid ℚ ℚ
    (TensorProduct.map (LinearMap.id : ℚ →ₗ[ℚ] ℚ)
      (LinearMap.proj (0 : Fin 2) : (Fin 2 → ℚ) →ₗ[ℚ] ℚ)
      ((1 : ℚ) ⊗ₜ[ℚ] (![2,3] : Fin 2 → ℚ))) = 2 ∧
    TensorProduct.rid ℚ ℚ
    (TensorProduct.map (LinearMap.id : ℚ →ₗ[ℚ] ℚ)
      (LinearMap.proj (1 : Fin 2) : (Fin 2 → ℚ) →ₗ[ℚ] ℚ)
      ((1 : ℚ) ⊗ₜ[ℚ] (![2,3] : Fin 2 → ℚ))) = 3 := by sorry
end ScalarProjection

section Refinement
variable {E C : Type*} [Field E] [AddCommGroup C] [Module E C]
  [FiniteDimensional E C]
-- PadicHodgeRegulators:L4/noncritical-refinement
-- Phi and Fil are the actual linear/filtered realization once supplied.
-- This predicate is explicitly the flag/dimension condition, not a placeholder Prop.
def noncriticalRefinement (d : ℕ) (Phi : C →ₗ[E] C)
    (Fil : ℤ → Submodule E C) (Y : Fin (d+1) → Submodule E C) : Prop :=
  Module.finrank E C = d ∧ Antitone Fil ∧
  Y 0 = ⊥ ∧ Y ⟨d, Nat.lt_succ_self d⟩ = ⊤ ∧ Monotone Y ∧
  (∀ i, Module.finrank E (Y i) = i.val) ∧
  (∀ i, Y i ≤ (Y i).comap Phi) ∧
  (∀ i j, Module.finrank E (Y i ⊓ Fil j : Submodule E C) = Module.finrank E (Fil j) + i.val - d)
lemma noncriticalRefinement_flag (d : ℕ) (Phi : C →ₗ[E] C)
    (Fil : ℤ → Submodule E C) (Y : Fin (d+1) → Submodule E C)
    (h : noncriticalRefinement d Phi Fil Y) :
    ∀ i, Module.finrank E (Y i) = i.val ∧ Y i ≤ (Y i).comap Phi := by sorry
lemma noncriticalRefinement_weights (d : ℕ) (Phi : C →ₗ[E] C)
    (Fil : ℤ → Submodule E C) (Y : Fin (d+1) → Submodule E C)
    (h : noncriticalRefinement d Phi Fil Y) :
    ∀ i j, Module.finrank E (Y i ⊓ Fil j : Submodule E C) = Module.finrank E (Fil j) + i.val - d := by sorry
-- TEST refinement_rank_one
example : noncriticalRefinement (E := ℚ) 1
    (LinearMap.id : (Fin 1 → ℚ) →ₗ[ℚ] (Fin 1 → ℚ))
    (fun j => if j ≤ 0 then ⊤ else ⊥)
    (fun i => if i.val = 0 then ⊥ else ⊤) := by sorry
-- TEST refinement_wrong_line
example : ¬ noncriticalRefinement (E := ℚ) 2
    (LinearMap.id : (Fin 2 → ℚ) →ₗ[ℚ] (Fin 2 → ℚ))
    (fun j => if j ≤ 0 then ⊤ else if j ≤ 2 then
      Submodule.span ℚ {(![0,1] : Fin 2 → ℚ)} else ⊥)
    (fun i => if i.val = 0 then ⊥ else if i.val = 1 then
      Submodule.span ℚ {(![0,1] : Fin 2 → ℚ)} else ⊤) := by sorry
-- TEST refinement_scalar_phi
example : noncriticalRefinement (E := ℚ) 2
    (LinearMap.id : (Fin 2 → ℚ) →ₗ[ℚ] (Fin 2 → ℚ))
    (fun j => if j ≤ 0 then ⊤ else if j ≤ 2 then
      Submodule.span ℚ {(![0,1] : Fin 2 → ℚ)} else ⊥)
    (fun i => if i.val = 0 then ⊥ else if i.val = 1 then
      Submodule.span ℚ {(![1,0] : Fin 2 → ℚ)} else ⊤) := by sorry
end Refinement

section SignedKernel
variable {R Z : Type*} [CommRing R] [AddCommGroup Z] [Module R Z] {d : ℕ}
-- PadicHodgeRegulators:L4/signed-local-condition
-- An actual supplied map Col is required. This definition only takes its kernel.
def signedColemanLocalCondition (Col : Z →ₗ[R] (Fin d → R)) (j : Fin d) :
    Submodule R Z := (LinearMap.proj j ∘ₗ Col).ker
lemma signedColemanLocalCondition_mem (Col : Z →ₗ[R] (Fin d → R)) (j : Fin d) (z : Z) :
    z ∈ signedColemanLocalCondition Col j ↔ Col z j = 0 := by sorry
lemma signedColemanLocalCondition_closed [TopologicalSpace R] [T2Space R]
    [TopologicalSpace Z] (Col : Z →ₗ[R] (Fin d → R)) (j : Fin d)
    (h : Continuous (fun z => Col z j)) :
    IsClosed (signedColemanLocalCondition Col j : Set Z) := by sorry
lemma signedColemanLocalCondition_covariance
    (Col Col' : Z →ₗ[R] (Fin d → R)) (Uinv : Matrix (Fin d) (Fin d) R)
    (h : ∀ z, Col' z = Col z ᵥ* Uinv) (j : Fin d) (z : Z) :
    z ∈ signedColemanLocalCondition Col' j ↔ (Col z ᵥ* Uinv) j = 0 := by sorry
-- TEST signed_zero
example (Col : Z →ₗ[R] (Fin d → R)) (j : Fin d) :
    (0 : Z) ∈ signedColemanLocalCondition Col j := by sorry
-- TEST signed_basis_mix
example : (![1,0] : Fin 2 → ℚ) ∈ signedColemanLocalCondition
    (LinearMap.id : (Fin 2 → ℚ) →ₗ[ℚ] (Fin 2 → ℚ)) 1 ∧
    (![1,0] : Fin 2 → ℚ) ∉ signedColemanLocalCondition
    (LinearMap.pi (fun j : Fin 2 => if j = 0 then (LinearMap.proj (0 : Fin 2) : (Fin 2 → ℚ) →ₗ[ℚ] ℚ)
      else (LinearMap.proj (0 : Fin 2) : (Fin 2 → ℚ) →ₗ[ℚ] ℚ) + LinearMap.proj (1 : Fin 2)) : (Fin 2 → ℚ) →ₗ[ℚ] (Fin 2 → ℚ)) 1 := by sorry
-- TEST signed_scalar_basis
example (Col : Z →ₗ[R] (Fin d → R)) (j : Fin d) (c : Rˣ) :
    signedColemanLocalCondition ((c : R) • Col) j = signedColemanLocalCondition Col j := by sorry
end SignedKernel

section FurtherAlgebraTests
-- Denominator-free interpolation does not determine the output when B=0.
example : let p : ℚ := 5
  let phi : ℚ := p⁻¹
  let A := 1 - phi
  let B := 1 - p⁻¹ * phi⁻¹
  B = 0 ∧ A ≠ 0 ∧ B * (0 : ℚ) = B * 1 := by sorry
-- E303: ordered quotient functional in the weight-two example.
example : (5 - 1 : ℚ) * 1 - (2 - 0) * 2 = 0 ∧
    (2 - 0 : ℚ) * 1 - (5 - 1) * 2 ≠ 0 := by sorry
-- A forward shear on coordinates requires an inverse shear on basis vectors.
example : (![1,0] : Fin 2 → ℚ) ᵥ* !![1,1;0,1] = ![1,1] ∧
    (!![1,1;0,1] : Matrix (Fin 2) (Fin 2) ℚ) * !![1,-1;0,1] = 1 := by sorry
end FurtherAlgebraTests

/-
Arithmetic interface boundary (all statements in this block are comments).

The pinned libraries lack the genuine D_cris, D_dR, N(T), N_rig(D), H_Iw and
unbounded analytic distribution carriers required below. These contracts name
actual mathematical domains and maps. They must become Lean signatures only
after their supplier API is elaborated. There are no Prop-valued stand-ins,
chosen maps asserted to be regulators, or examples of True in their place.
The definitive hypotheses, proof routes, and exact source versions are in the
packet/document. This is why elaboration of this file is algebraic validation.
-/

/-
PadicHodgeRegulators:L3/gamma-leading-factor
Native algebraic declaration above; arithmetic specialization contract:
For j in Z define Gamma*(1+j)=j! if j>=0 and (-1)^(-j-1)/(-j-1)! if j<=-1, as a nonzero rational number, then map it into E. This is the leading Laurent coefficient of the classical Gamma function; it is not the p-adic Gamma function.
Hypotheses: E has characteristic zero.
Proposed lemma gammaLeadingFactor_nonneg: For n in N its value at j=n is n!.
Proposed lemma gammaLeadingFactor_neg: Its value at j=-n-1 is (-1)^n/n!.
Proposed lemma gammaLeadingFactor_ne_zero: It is nonzero for every integral j.
Proposed example -- TEST gamma_zero
At j=0 the factor is 1.
Proposed example -- TEST gamma_minus_two
At j=-2 it is -1.
Proposed example -- TEST gamma_minus_three
At j=-3 it is 1/2, not 2.
-/

/-
PadicHodgeRegulators:L3/logarithmic-factors
Proposed declaration contract: logarithmicFactors (p, E, chosen gamma) : logarithmic factors ell_i, lambda_k, delta_i and n_k in the actual H_E(Gamma_1) algebra.
In each H_E(Gamma_1) component set ell_i=log(1+X)/log(chi(gamma))-i for i in Z, lambda_k=product_(0<=i<k) ell_i for k>=0, and delta_i=ell_i/(X+1-chi(gamma)^i). The apparent pole of delta_i is removable at x_i=chi(gamma)^i-1; its value there is 1/(chi(gamma)^i log(chi(gamma))). Put n_k=log(chi(gamma))^k lambda_k/product_(0<=i<k)(X-x_i).
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly.
Proposed lemma ellFactor_eval_weight: ell_i(chi^j eta)=j-i for any finite-order eta on Gamma_1.
Proposed lemma lambdaFactor_succ: lambda_(k+1)=lambda_k ell_k, lambda_0=1.
Proposed lemma deltaFactor_cleared: (X-x_i)delta_i=ell_i, including the removable point.
Proposed lemma ellFactor_generator: log(gamma)/log(chi(gamma)) is independent of the chosen topological generator under the group-algebra change of variable.
Proposed example -- TEST ell_at_zero
ell_0 at the trivial character is 0, whereas ell_1 there is -1.
Proposed example -- TEST delta_at_node
delta_0 at X=0 is 1/log(chi(gamma)), not zero or an undefined inverse.
Proposed example -- TEST lambda_empty
lambda_0=n_0=1; lambda_2 at chi^3 is 6.
-/

/-
PadicHodgeRegulators:L3/crystalline-regulator
Proposed declaration contract: crystallineRegulator (V crystalline, nonnegative weights, no trivial quotient) : H_Iw^1(Q_p,V) →ₗ[Lambda_E] H_E(G) ⊗[E] D_cris(V).
Define L_V=(Mellin_inverse tensor 1) composed with (1-phi) composed with h_Iw^(-1), from H^1_Iw(Q_p,V) to H_E(G) tensor_E D_cris(V). Here h_Iw:N(V)^(psi=1)~=H^1_Iw is the actual PG/L2 comparison, and the Wach embedding takes (1-phi)x into (B_rig^+)^(psi=0) tensor D_cris(V). This is a Lambda_E-linear continuous map; its analytic scalar extension is H_E-linear.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution.
Proposed lemma crystallineRegulator_apply: Mellin(L_V(z))=(1-phi)h_Iw^(-1)(z) in the specified period module.
Proposed lemma crystallineRegulator_linear: L_V(a z+b w)=a L_V(z)+b L_V(w) for a,b in Lambda_E, acting by convolution.
Proposed lemma crystallineRegulator_ext: The Mellin identity determines the map uniquely.
Proposed lemma crystallineRegulator_coefficient: The map commutes with finite coefficient extension using the supplier comparison squares.
Proposed example -- TEST regulator_zero
The zero Iwasawa class has zero regulator.
Proposed example -- TEST regulator_phi_fixed
An actual phi-fixed psi-one class is killed by 1-phi; for E(1) this kills the Kummer Tate tower.
Proposed example -- TEST regulator_composition_order
In the finite linear-map model h(x)=2x, boundary(x)=3x, Mellin_inverse(x)=5x, L(2)=15; using h instead of h inverse would give 60.
-/

/-
PadicHodgeRegulators:L3/big-exponential-obstruction
Proposed declaration contract: bigExponentialObstruction (V crystalline, h >= 1 with Fil^(-h) full) : (B_rig^+)^(psi=0) ⊗ D_cris(V) → direct_sum_(k=0..h) D_cris(V)/image(1-p^k phi)(k).
For h>=1 with Fil^(-h)D_cris(V)=D_cris(V), define Delta_h on (B_rig^+)^(psi=0) tensor D_cris(V) by the derivative values partial^k f(0) modulo (1-p^k phi)D_cris(V), 0<=k<=h, with their k twists. The admissible source is ker Delta_h. The kernel of 1-phi on the psi-one period module is direct_sum_(0<=k<=h)t^k D_cris(V)^(phi=p^(-k)).
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is crystalline; h>=1 and Fil^(-h)D_cris(V)=D_cris(V).
Proposed lemma bigExponentialObstruction_mem: f is admissible iff partial^k f(0) lies in image(1-p^k phi) for every indicated k.
Proposed lemma bigExponentialObstruction_nonsingular: If all these Euler maps are invertible, Delta_h=0 and its kernel is the whole source.
Proposed lemma bigExponentialObstruction_lift: An admissible f has a psi-one lift y with (1-phi)y=f; any two lifts differ in the displayed kernel.
Proposed example -- TEST obstruction_phi_one
For rank-one phi=1, k=0 forces f(0)=0, so a nonzero constant derivative is inadmissible.
Proposed example -- TEST obstruction_nonsingular
For phi=2 over Q_5 and h=1, both 1-2 and 1-10 are invertible; no derivative obstruction remains.
Proposed example -- TEST obstruction_lift_nonunique
At phi=1 two lifts differing by a constant have the same boundary; no unique inverse is inferred.
-/

/-
PadicHodgeRegulators:L3/big-exponential
Proposed declaration contract: bigExponential (V,h) : ker Delta_h → H_E ⊗[Lambda_E] H_Iw^1(Q_p,V)/V^(H_Qp); unquotiented only under the recorded no-E(h) hypothesis.
For admissible f in ker Delta_h choose a psi-one lift y with (1-phi)y=f and define Omega_(V,h)(f)=nabla_(h-1)...nabla_0(y), with nabla_i=t partial-i. Its value is well-defined in D_rig^+(V)^(psi=1)/V^(H_Qp). The eigencondition D_cris(V)^(phi=p^(-h))=0 suffices for an unquotiented value (Definition II.12). More generally, absence of an E(h) subrepresentation suffices by Remark II.14, after using Theorem II.13 to identify the remaining lift ambiguity with invariants. Map to H_E tensor_Lambda H^1_Iw using the established comparison.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; h>=1 with Fil^(-h) full; the source is ker Delta_h, not an arbitrary period vector.
Proposed lemma bigExponential_lift: Every valid lift gives the stated differential product in the quotient.
Proposed lemma bigExponential_linear: Omega_(V,h) is H_E-linear in the specified Mellin convention.
Proposed lemma bigExponential_no_tate: If no E(h) lies in V, the differential lift is independent in the unquotiented psi-one module.
Proposed lemma bigExponential_h_succ: nabla_h Omega_(V,h)=Omega_(V,h+1) with the natural obstruction-source comparison.
Proposed example -- TEST bigexp_zero
Omega_(V,h)(0)=0 in the quotient.
Proposed example -- TEST bigexp_kernel_killed
For a lift difference t^k v with 0<=k<h, the differential product is zero.
Proposed example -- TEST bigexp_top_kernel
For k=h the product is h! t^h v, nonzero before passing to invariants; the quotient cannot be dropped.
-/

/-
PadicHodgeRegulators:L3/auxiliary-h-comparison
Proposed theorem bigExponential_regulator (on its authentic supplier carriers):
Under the nonnegative, no-trivial-quotient hypotheses and the nonsingular Euler assumptions of LLZ4.5, over Frac(H_E) one has Omega_(V,h) L_V(z)=lambda_h z after identifying its Mellin source, for any admitted h>=1. Omega_(V,h+1)=ell_h Omega_(V,h); twisting sends Omega_(V,h)(f) tensor e_j to Omega_(V(j),h+j)(partial^(-j)f tensor t^(-j)e_j), on the common domain. Thus the intrinsic L_V is independent of h.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked. Choose h>=max(1,r_d); interpret equalities in the analytic scalar extension and its localization.
-/

/-
PadicHodgeRegulators:L3/meromorphic-twist-extension
Proposed declaration contract: meromorphicRegulator (V crystalline of arbitrary weights) : H_Iw^1(Q_p,V) → Frac(H_E) ⊗[E] D_cris(V).
For arbitrary E-linear crystalline V choose m>>0 so V(m) has nonnegative weights and no trivial quotient. Define L_V(z)=(ell_-1...ell_-m)^(-1) Tw_(chi^m)(L_(V(m))(z tensor e_m)) tensor t^m e_-m. The value lies in the total fraction algebra of H_E(G), component by component; it is independent of m. No general H_E-valued assertion follows without proving cancellation of these factors.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; use an admitted m and the actual twist comparison maps.
Proposed lemma meromorphicRegulator_choice: The value is independent of every admitted twist m.
Proposed lemma meromorphicRegulator_cleared: Multiplication by ell_-1...ell_-m gives the stated twisted positive-range map.
Proposed lemma meromorphicRegulator_positive: For V in the intrinsic range it equals L_V after localization.
Proposed example -- TEST twist_extension_identity
An admitted m=0 recovers the intrinsic positive-range regulator.
Proposed example -- TEST twist_extension_one_step
The m=1 and m=2 formulas agree by the one-step ell_-2 relation.
Proposed example -- TEST twist_extension_pole_control
In a scalar analytic model a nonzero numerator at the zero of ell_-1 gives a pole, so localization alone is not an H-valued result.
-/

/-
PadicHodgeRegulators:L3/ramified-interpolation
Proposed theorem crystallineRegulator_ramified (on its authentic supplier carriers):
Let eta=chi^j omega, j in Z, omega finite order of conductor p^n, n>=1; extend coefficients to contain omega. Write z_(eta,0) for the actual specialization in H^1(Q_p,V(eta^(-1))). Then L_V(z)(eta)=Gamma*(1+j) tau(omega)^(-1) p^(n(1+j)) phi^n (B_(j)(z_(eta,0)) tensor t^(-j)e_j), with the finite-character de Rham descent understood. B_j=exp*_(Q_p,V(eta^(-1))*(1)) for j>=0 and the Bloch–Kato logarithm on the finite part for j<=-1. The log is the inverse of exp only on its isomorphism range; source condition (dagger) supplies the finite-part class for this formula.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. z lies in the analytic Wach psi-one image (dagger of LZ AppendixB); in particular every z in the stated intrinsic range does. The Gauss sum uses the chosen roots and omega, not omega inverse.
-/

/-
PadicHodgeRegulators:L3/unramified-interpolation
Proposed theorem crystallineRegulator_unramified (on its authentic supplier carriers):
For eta=chi^j and j in Z put A_j=1-p^j phi and B_j=1-p^(-1-j)phi^(-1) on D_cris(V). If B_j is invertible then L_V(z)(chi^j)=Gamma*(1+j) A_j B_j^(-1) b_j(z_(chi^j,0)), where b_j is the exp*/log value with its Tate descent from the preceding theorem. No invertibility of A_j is required for this direction.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. The same Wach-image condition (dagger) holds; B_j is bijective; for the negative range retain the actual finite-class logarithm domain.
-/

/-
PadicHodgeRegulators:L3/singular-euler-specialization
Proposed theorem crystallineRegulator_singular (on its authentic supplier carriers):
For every integral j under (dagger), with no Euler invertibility assumption, B_j L_V(z)(chi^j)=Gamma*(1+j) A_j b_j(z_(chi^j,0)). More precisely, if u_j is the constant coefficient of partial^j h_Iw^(-1)(z) after Tate descent, the unsimplified identities are L_V(z)(chi^j)=A_j u_j and B_j u_j=Gamma*(1+j)b_j. They determine a relation, including the image of A_j(ker B_j); replacing B_j^(-1) by a total inverse is not a formula. For the big-exponential inverse keep ker Delta_h and the invariant quotient.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. Use b_j and the negative-weight log on precisely the domains in ramified-interpolation.
-/

/-
PadicHodgeRegulators:L3/growth
Proposed theorem crystallineRegulator_growth (on its authentic supplier carriers):
Let W subset D_cris(V) be phi-stable and h>=0. If every phi eigenvalue on Q=D_cris(V)/W has v_p(alpha)>=-h, the projection of L_V(z) to Q belongs to distributions of order h on the cyclotomic group, with the LAD C^h-dual convention. In particular take h=max(0,-min v_p(alpha)). State the seminorm bound on each finite-character component; no universal bounded (order zero) assertion is made.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. W is phi-stable; h is a nonnegative real number and the slope bound holds on Q.
-/

/-
PadicHodgeRegulators:L3/naturality-and-lattice
Proposed theorem crystallineRegulator_naturality (on its authentic supplier carriers):
For finite E extensions and equivariant morphisms of crystalline representations in the intrinsic range, L commutes with the actual D_cris and Iwasawa comparison maps. For a G-stable T its image lies in the Mellin inverse of (phi*N(T))^(psi=0) embedded in the analytic period target. It need not lie in Lambda_O tensor an arbitrary D_cris lattice. Changing gamma only changes X by (1+X)^a-1; changing roots zeta to sigma_a zeta multiplies the regulator distribution by [sigma_a]^(-1). These assertions compose and respect identities.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. For lattice statements use an integral good psi-zero basis; coefficient extension is finite and flat, and all cohomological base-change hypotheses are supplied by L2.
-/

/-
PadicHodgeRegulators:L3/explicit-reciprocity
Proposed theorem crystallineRegulator_reciprocity (on its authentic supplier carriers):
With the crystalline pairing extended linearly in the first and via iota(g)=g^-1 in the second variable, [L_V(x),L_(V*(1))(y)]_cris=-sigma_-1 ell_0 <x,y>_Iw in the total fraction algebra of H_E(G). sigma_-1 is the inertia element with chi=-1; the dual regulator uses the admitted meromorphic twist extension. Equivalently Berger II.16 states (-1)^h <Omega_(V,h)(f),[-1]Omega_(V*(1),1-h)(g)>=-[f,iota(g)].
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; x,y are actual Iwasawa classes and the pairings are the L2/L1 local-duality pairings with these normalizations.
-/

/-
PadicHodgeRegulators:L3/regulator-determinant
Proposed theorem crystallineRegulator_determinant (on its authentic supplier carriers):
Under NC, for each Delta component the determinant ideal of the H_E-linear scalar extension of L_V, with actual rank-d Iwasawa source, is generated up to H_E-unit by product_(i=0..r_d-1) ell_i^(d-n_i), where n_i=dim_E Fil^(-i)D_cris(V)=#{j:r_j<=i}. The determinant is an ideal in the analytic algebra, not a chosen equality of basis determinants.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.
-/

/-
PadicHodgeRegulators:L3/scalar-projection
Native algebraic declaration above; arithmetic specialization contract:
Given an explicitly chosen E-linear functional ell:D_cris(V)->E, define scalarRegulator_(V,ell)=(1 tensor ell) L_V. A differential or refinement supplies ell only after its pairing and period normalization are proved. The vector regulator is canonical with its cyclotomic choices; this scalar projection is not chosen from V alone.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. ell is specified, including every period scalar when it is derived from a geometric differential.
Proposed lemma scalarRegulator_apply: The output is (1 tensor ell)(L_V(z)).
Proposed lemma scalarRegulator_add_functional: Projection for ell1+ell2 is the sum of the two projections; scaling ell scales the output.
Proposed lemma scalarRegulator_base_change: Finite coefficient extension commutes after transporting ell.
Proposed lemma scalarRegulator_growth: The vector seminorm bound gives the projected bound times the functional norm; a stronger eigenline bound needs the specified phi-stable quotient.
Proposed example -- TEST scalar_zero_functional
The zero functional gives the zero map.
Proposed example -- TEST scalar_ordered_projection
For vector (2,3), first projection gives 2 and second gives 3.
Proposed example -- TEST scalar_period_scaling
Replacing a functional by twice itself doubles every value; it cannot be silently treated as the same normalized scalar regulator.
-/

/-
PadicHodgeRegulators:L3/tate-coleman-comparison
Proposed theorem tateRegulator_coleman (on its authentic supplier carriers):
For V=E(1), d=t^-1 e_1 and principal norm-compatible cyclotomic units u, the actual Kummer map satisfies L_(E(1))(kappa_Iw(u))=ell_0 Col_0(u) tensor d=-ell_0 Col(u) tensor d. Col_0 is exactly the raw ColemanPowerSeries composite and Col=-Col_0. Equivalently Mellin(Col_0(u))=(1-phi/p)log(f_u) and partial of this equals (1-phi)Delta(f_u). On psi-zero partial inverse is multiplication by x^-1 under Amice; no integration constant is chosen. The regulator kills the Tate-root tower and the coefficient-extended fundamental Coleman sequence gives the moment cokernel.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V=E(1), u lies in the actual principal inverse-limit unit module; use the same roots, norm operator, Kummer cocycle and Tate basis.
-/

/-
PadicHodgeRegulators:L3/rubin-coleman-map
Proposed declaration contract: rubinColemanMap (A ordinary or multiplicative elliptic curve, omega_A) : H^1_(infty,s)(Q_p,T_p A) →ₗ[Lambda] Lambda.
For an elliptic curve A/Q with good ordinary or multiplicative reduction at odd p, T=T_p A, let alpha in Z_p^times be the ordinary root and beta=p/alpha. In split multiplicative reduction set (alpha,beta)=(1,p), in nonsplit (-1,-p). On the actual inverse-corestriction singular quotients H^1_(infty,s)(Q_p,T) define Col_infty into Lambda(Z_p-extension) with its injection and Rubin III.5.14 normalization. For nontrivial finite chi of conductor p^k its value is alpha^-k tau(chi) sum_(g in G_n)chi(g)^-1 exp*_(omega_A)(g z_n). At chi=1 it is (1-alpha^-1)(1-beta^-1)^-1 exp*_(omega_A)(z_0).
Hypotheses: p is odd; A has the stated reduction; use Rubin cyclotomic Z_p-extension indexing Q_n and compatible p-power roots. omega_A is the specified Neron differential; local finite quotients and integral H^1_s are inherited from L1/Selmer.
Proposed lemma rubinColemanMap_specialization: Finite-character values are exactly the displayed Gauss-sum/differential formulas.
Proposed lemma rubinColemanMap_injective: Its kernel on the singular inverse-limit module is zero.
Proposed lemma rubinColemanMap_linear: It is Lambda-linear on that actual source.
Proposed lemma rubinColemanMap_period: Rescaling the differential by c rescales its scalar dual-exponential coordinate by c^-1, and hence the map by c^-1.
Proposed example -- TEST rubin_zero
Col_infty(0)=0.
Proposed example -- TEST rubin_split_trivial
At split multiplicative alpha=1 the trivial specialization is zero.
Proposed example -- TEST rubin_nonsplit_trivial
At p=5 and alpha=-1,beta=-5 the trivial Euler multiplier is 5/3, so it is not automatically zero.
-/

/-
PadicHodgeRegulators:L4/good-wach-basis
Proposed theorem exists_goodWachBasis (on its authentic supplier carriers):
For a crystalline V and G-stable T, each integral Wach basis n_i^0 admits a replacement n_i congruent n_i^0 mod pi such that b_i=(1+pi)phi(n_i) is a Lambda_O(G)-basis of (phi*N(T))^(psi=0). Rationally every E-basis nu_i of D_cris(V) has such a lift n_i mod pi. Analytically H_E tensor_Lambda (phi*N(V))^(psi=0) is (phi*N_rig(V))^(psi=0), and these b_i form its H_E-basis. This is an existence theorem, not a statement about all Wach bases.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V crystalline; T stable; for the analytic closure argument use finite free modules with their canonical Frechet topology.
-/

/-
PadicHodgeRegulators:L4/noncritical-refinement
Proposed declaration contract: noncriticalRefinement (D_cris(V), phi, induced filtration) : full phi-stable flag with the exact filtration dimension equalities.
A refinement is a full phi-stable flag 0=Y_0 subset Y_1 subset ... subset Y_d=D_cris(V), dim Y_i=i. It is noncritical if each Y_i has the i smallest filtration weights in LLZ’s positive representation convention (weights -s_1>=...>=-s_d with 0<=s_1<=...<=s_d); Equivalently dim Fil^j(Y_i)=max(0,dim Fil^j(D_cris(V))-d+i), for every j, with multiplicities retained. On W=V(m) nonnegative weights are r_1<=...<=r_d with s_i=m-r_(d+1-i). Existence after finite E extension is a separate hypothesis.
Hypotheses: V is crystalline, initially with nonpositive weights -s_i. Repeated weights are allowed.
Proposed lemma noncriticalRefinement_flag: Every step is phi-stable and has dimension i.
Proposed lemma noncriticalRefinement_weights: The induced filtration on Y_i has weights -s_1,...,-s_i.
Proposed lemma noncriticalRefinement_extension: Finite field extension transports a noncritical flag and its filtration dimensions.
Proposed example -- TEST refinement_rank_one
The unique flag of a rank-one filtered phi module is noncritical.
Proposed example -- TEST refinement_wrong_line
For weights 0,-2 with Fil^1 the second eigenline, the flag starting in that line is critical in the LLZ positive convention.
Proposed example -- TEST refinement_scalar_phi
With scalar phi any flag is stable, but only flags with the required filtration dimensions are noncritical.
-/

/-
PadicHodgeRegulators:L4/refinement-saturated-flag
Proposed theorem wachFlag_comparison (on its authentic supplier carriers):
For a noncritical refinement of a positive V, put mathcalY_i=B_rig^+ tensor Y_i and X_i=N_rig(V) intersect mathcalY_i[(t/pi)^(-1)]. Then X_i is saturated, rank i, and has weights -s_1,...,-s_i. For m>=s_d put A_i=pi^-m X_i e_m and B_i=t^-m mathcalY_i e_m. B_i is the saturation of A_i; A_d/A_(i-1) embeds in B_d/B_(i-1), with quotient annihilated by (t/pi)^(m-s_i). Passing to phi* and psi-zero gives cyclic successive quotients Btilde_i/(Btilde_(i-1)+Atilde_i) with exact annihilator n_(m-s_i); n_(m-s_i) annihilates the remaining quotient.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. Use the noncritical flag and m>=s_d; all intersections are in the same localized period module.
-/

/-
PadicHodgeRegulators:L4/logarithmic-elementary-divisors
Proposed theorem logarithmicMatrix_elementaryDivisors (on its authentic supplier carriers):
For W with nonnegative weights r_1<=...<=r_d admitting a noncritical refinement after finite coefficient extension, the H_E(Gamma_1) elementary divisors of (B_rig^+)^(psi=0) tensor D_cris(W)/(phi*N_rig(W))^(psi=0), and hence of the row-oriented logarithmic matrix M, are n_(r_1),...,n_(r_d). Consequently det M is associated to their product. In particular M(x_i) is invertible for x_i=chi(gamma)^i-1, 0<=i<r_d, since n_r has a removable nonzero value there.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. The refinement hypothesis holds after finite extension; work componentwise in H_E, with its actual elementary-divisor theorem.
-/

/-
PadicHodgeRegulators:L4/specialization-subspaces
Proposed declaration contract: colemanSpecializationSubspaces (V, eta, chosen good basis, i in 0..r_d-1) : E-subspace of row E^d, using V_(i,eta) M(x_i)^(-1).
Under NC define V_(i,eta) in D_cris(V) as (1-p^i phi)(1-p^(-1-i)phi^-1)^(-1) Fil^(-i) if eta=chi_0^i, and phi Fil^(-i) otherwise, for 0<=i<r_d. Identify D_cris with row coordinates through the chosen ordered nu basis. The constraint on Coleman rows is W_(i,eta)={v in E^d: v M(x_i) belongs to V_(i,eta)}=V_(i,eta) M(x_i)^(-1). It has codimension d-dim Fil^(-i).
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.
Proposed lemma colemanSpecializationSubspaces_mem: v is in W_(i,eta) iff v M(x_i) is in V_(i,eta).
Proposed lemma colemanSpecializationSubspaces_codim: codim W_(i,eta)=d-dim Fil^(-i).
Proposed lemma colemanSpecializationSubspaces_covariance: If M becomes U M B^-1 then W becomes W U^-1, with the period subspace transported by B^-1.
Proposed example -- TEST specialization_transport
For V=span(1,0) and M=[[0,1],[1,0]], W=span(0,1), so the first Coleman coordinate is forced zero.
Proposed example -- TEST specialization_full_filtration
If Fil^(-i) is full and both Euler maps invertible then W=E^d.
Proposed example -- TEST specialization_singular_exclusion
A phi eigenvalue p^-1 at i=0 violates NC and forbids using the displayed inverse.
-/

/-
PadicHodgeRegulators:L4/actual-coleman-image
Proposed theorem colemanMap_image (on its authentic supplier carriers):
Under NC, in each eta component the image of the actual Col:N(V)^(psi=1)->Lambda_E(Gamma_1)^d is exactly S={F:F(x_i) belongs to W_(i,eta),0<=i<r_d}. Its determinant ideal is product_i(X-x_i)^(d-n_i). Each coordinate image equals product_(i: W_(i,eta) subset {v:v_j=0})(X-x_i) Lambda_E. The kernel of 1-phi is zero under the excluded Frobenius eigenvalues, giving a bounded Lambda_E exact sequence with quotient direct_sum_i E^d/W_(i,eta), with Gamma action evaluated at x_i. Analytic scalar extension gives the corresponding H_E exact sequence.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.
-/

/-
PadicHodgeRegulators:L4/regulator-elementary-divisors
Proposed theorem crystallineRegulator_elementaryDivisors (on its authentic supplier carriers):
Under NC the H_E(G)-module cokernel of the H_E-linear extension of the actual L_V has elementary divisors lambda_(r_1),...,lambda_(r_d). These are analytic cokernel invariants, not bounded Coleman coordinate images. For each component the determinant specializes to the L3 formula.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. No eigenvalue of phi on D_cris(V) belongs to p^Z. A noncritical refinement exists after a finite coefficient extension when elementary divisors are invoked.
-/

/-
PadicHodgeRegulators:L4/modular-specialization
Proposed theorem modularColeman_specialization (on its authentic supplier carriers):
For the nonordinary modular representation V=V_(fbar)(k-1) in LLZ Section1C6 (p odd, weight k>=2, p not dividing N, coefficient E containing eigenvalues, source Frobenius exclusions), use the prescribed ordered bases and M(0)=[[0,p^(k-1)],[-1,a_p]]. Then at the trivial Delta component (1-a_p+p^(k-2)) Col_2(z)(0)=p^(k-2)(p-1) Col_1(z)(0); at nontrivial eta, Col_2(z)^eta(0)=0. For k=2 the quotient functional on the ordered pair (Col_1,Col_2) is rho(g,h)=(p-1)g(0)-(2-a_p)h(0), valued in E. Its kernel is the actual rational image, and it is surjective when the coefficients are not both zero.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. f and V have LLZ1C6 hypotheses; phi has no eigenvalue in p^Z and the refinement input for image equality holds. The period/Frobenius comparison for the modular form is a proved external dependency.
-/

/-
PadicHodgeRegulators:L4/integral-image-index
Proposed theorem integralColemanImage_finite (on its authentic supplier carriers):
In the modular range of LLZ5.10 let X_j^eta be the rational coordinate generator and X_k=product_(i=0..k-2)(X-chi(gamma)^i+1). For the prescribed integral good basis, X_k Lambda_O subset Im Col_j^eta subset X_j^eta Lambda_O, and X_j^eta Lambda_O/Im Col_j^eta has finite O_E length, hence is pseudo-null over O_E[[X]]. After the integral shear of Proposition5.11 all X_j^eta become 1, so each coordinate cokernel is finite; integral surjectivity is not asserted.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. Use the actual modular lattice and good basis of LLZ Section5; supply the integral lower inclusion for that lattice, including any extra (C),(D) restrictions required by the proof in LLZ2010.
-/

/-
PadicHodgeRegulators:L4/signed-local-condition
Proposed declaration contract: signedColemanLocalCondition (V,T,chosen good basis,j) : closed Lambda_O-submodule ker Col_j of the actual H_Iw^1(Q_p,T).
For a specified actual good integral Wach basis and coordinate j, export the closed Lambda_O-submodule ker Col_j of H^1_Iw(Q_p,T) via the proved h_Iw comparison. Its Tate-orthogonal local condition on the dual torsion representation is owned by ModularIwasawaMainConjectures. Under basis n prime=U n its row maps become Col prime=Col U^-1; the new kernel need not equal the old kernel. A basis or named signed normalization is part of the input.
Hypotheses: p is odd; E/Q_p is finite; G=Delta times Gamma_1; HT(E(1))=+1; roots zeta_(p^n), Tate bases e_j and a generator gamma are fixed compatibly. V is E-linear crystalline with nonnegative weights r_1<=...<=r_d and no trivial quotient; T is a G_Qp-stable O_E-lattice. Lambda_E=O_E[[G]][1/varpi], H_E is the locally analytic distribution algebra, with convolution. The h_Iw lattice comparison and chosen integral good basis are specified; continuity gives the closed kernel.
Proposed lemma signedColemanLocalCondition_mem: A class lies in the condition iff its specified Col_j value is zero.
Proposed lemma signedColemanLocalCondition_closed: The kernel is a closed Lambda_O submodule.
Proposed lemma signedColemanLocalCondition_covariance: Its transported description is {z:(Col(z) U^-1)_j=0}.
Proposed example -- TEST signed_zero
The zero class lies in every condition.
Proposed example -- TEST signed_basis_mix
For Col(z)=(1,0) and U^-1=[[1,1],[0,1]], the second new coordinate is 1, so the second condition changes.
Proposed example -- TEST signed_scalar_basis
Multiplying a coordinate by an O_E unit leaves its kernel unchanged; a noninvertible operation is not a basis change.
-/

/-
PadicHodgeRegulators:L4/derham-character-domain
Proposed declaration contract: deRhamCharacterDomain (D de Rham, admitted localization threshold) : admissible open U_D in the actual character weight space.
Let D be a de Rham (phi,Gamma)-module over R_E, Delta=N_rig(D) its differential module, and m(Delta) an overconvergence/localization threshold. On a torsion weight component write a character kappa by z_kappa=kappa(exp(q)), q=p for odd p and q=4 for p=2. If the torsion components differ set v_p(z_kappa-z_eta)=-infinity. For a primitive finite character eta of conductor p^c set B(eta,N)={kappa:v_p(z_kappa-z_eta)>p^(N-c)}. Choose the source threshold N(D); put U_D=union_(c>m(Delta)) B(eta,N(D)). Choices give admissible domains with compatible restriction, not a maximal canonical domain or all weight space. N(D) can be bounded in terms of the conductor of an extension where D becomes semistable.
Hypotheses: E/Q_p finite; D is de Rham; the locally analytic character space is the actual PMIA weight space. Localization and Robba norms are provided by PHT/PG.
Proposed lemma deRhamCharacterDomain_mem: Membership is existence of an admitted primitive eta with the stated coordinate valuation inequality.
Proposed lemma deRhamCharacterDomain_open: U_D is an admissible open of character space.
Proposed lemma deRhamCharacterDomain_restrict: Two valid threshold choices define compatible restrictions of the same regulator on their common admitted domain.
Proposed example -- TEST domain_center
Each admitted eta has infinite valuation difference from itself and lies in its ball.
Proposed example -- TEST domain_wrong_torsion
A character on another torsion component has valuation difference -infinity and lies outside this ball.
Proposed example -- TEST domain_threshold
A character with valuation difference exactly p^(N-c) is excluded by the strict inequality; the trivial character is not supplied by a high-conductor center argument.
-/

/-
PadicHodgeRegulators:L4/analytic-differential-powers
Proposed declaration contract: analyticDifferentialPower (Delta=N_rig(D), kappa in an admitted affinoid) : continuous E-linear operator on Delta^(psi=0), from the proved convergent binomial series.
On Delta^(psi=0), for a sufficiently small weight affinoid and N large define kappa(partial) by the convergent series sum_(i in (Z/p^N)^times) sum_(j>=0) binom(omega_kappa,j) kappa(i) i^-j (1+T)^i p^(Nj) phi^N(partial^j z_i), where z_i=psi^N((1+T)^(-i)z). The value is independent of large N and representatives and is rigid analytic in kappa; for kappa=x^k, k in Z, it equals partial^k on psi-zero (negative powers use its inverse there).
Hypotheses: Delta=N_rig(D) is the genuine differential Robba module; partial=nabla/t and psi/phi satisfy the source relations. Restrict to a weight affinoid and annulus where RJ PropositionI.13 proves convergence.
Proposed lemma analyticDifferentialPower_integer: At x^k the operator is partial^k for every integer k.
Proposed lemma analyticDifferentialPower_linear: It is E-linear in z and analytic in kappa on the specified affinoid.
Proposed lemma analyticDifferentialPower_choices: Changing N or residue representatives preserves the value on the common annulus.
Proposed example -- TEST differential_weight_zero
At k=0 the operator is the identity on psi-zero.
Proposed example -- TEST differential_weight_one
At k=1 it is partial, not t partial.
Proposed example -- TEST differential_inverse
At k=-1, partial composed with the operator is identity on psi-zero; no inverse is asserted on all Delta.
-/

/-
PadicHodgeRegulators:L4/derham-regulator
Proposed declaration contract: deRhamRegulator (D de Rham, z in N_rig(D)^(psi=1)) : rigid analytic section U_D → D_dR(D).
For z in Delta^(psi=1) and primitive finite eta of conductor exactly p^m with m>m(Delta), define Lambda_(D,z)(eta kappa)=G(eta)^(-1) sum_(a in (Z/p^m)^times) eta(a) sigma_a [phi^(-m) kappa(partial)(1-phi)z]_0, on its admitted high-conductor ball; the exponent m is the conductor exponent of eta, not a freely enlargeable localization index. The constant term is taken in E_m tensor D_dR(D) after localization at that conductor; the sum descends to D_dR(D). These definitions glue to a rigid analytic D_dR(D)-valued function on U_D. For positive-weight D and z in D^(psi=1), use its actual inclusion in Delta; an Iwasawa version is through the proved PG.5/L2 map.
Hypotheses: D is de Rham; use the actual Delta, localization embeddings, q coordinates and Gauss periods G(eta)=sum eta(a) zeta_(p^c)^a. On each ball retain the threshold needed for its analytic powers. Keep phi^(-m), the residue sum modulo p^m and G(eta) at the same primitive conductor. A larger coefficient field may receive this fixed expression; it does not replace m in the formula.
Proposed lemma deRhamRegulator_formula: Its value on an admitted ball is the displayed localized constant-term Gauss sum.
Proposed lemma deRhamRegulator_linear: It is E-linear in z; the Gamma action induces the source character-equivariance convention.
Proposed lemma deRhamRegulator_descent: The conductor-m expression descends to D_dR(D). Embedding it in a larger coefficient field preserves its value while phi^(-m), the residue modulus and G(eta) remain at cond(eta)=p^m.
Proposed lemma deRhamRegulator_restrict: Two admitted thresholds give equal functions on their common domain.
Proposed example -- TEST derham_zero
The zero psi-one vector gives the zero analytic function.
Proposed example -- TEST derham_phi_fixed
A psi-one vector fixed by phi is killed by 1-phi and gives zero.
Proposed example -- TEST derham_period_normalization
Replacing G(eta) by G(eta)^-1 would multiply the expression by G(eta)^2; the stated denominator is essential.
Proposed example -- TEST derham_conductor_level
In the Gauss-sum model at p=5, let eta be the quadratic character of conductor 5. For primitive compatible roots zeta_5=zeta_25^5, sum_(a mod 5, 5 not dividing a) eta(a) zeta_5^a=G(eta) is nonzero, whereas sum_(a mod 25, 5 not dividing a) eta(a) zeta_25^a=0. Thus the normalized conductor-5 value is 1 and the imprimitive modulus-25 replacement is 0.
-/

/-
PadicHodgeRegulators:L4/derham-interpolation-growth
Proposed theorem deRhamRegulator_interpolation (on its authentic supplier carriers):
For D with nonnegative Hodge–Tate weights, z in D^(psi=1), and eta x^j in U_D with eta primitive of conductor p^n, RJ I.27 gives Lambda_(D,z)(eta x^j)=Gamma*(j+1) p^(n(j+1)) exp*(integral_G eta chi^(-j) mu_z) tensor e_(eta,-j)^(dR,dual) for j>=0, and the analogous exp^(-1) value for j sufficiently negative that the indicated Bloch–Kato exponential is bijective. Gauss bases are e_(eta,j)^dR=G(eta)t^-j e_(eta,j), dual=G(eta)^-1 t^j e_(eta^-1,-j). For general z in Delta use TheoremI.15 after nabla_h, with Gamma*(j-h+1) and j>=h or j sufficiently negative. Its growth statement is the local Robba annulus convergence estimate of LemmaI.17; it is not a global finite-order distribution bound.
Hypotheses: D is de Rham; positivity and z in D^(psi=1) are required for I.27. Negative j belongs to the proved isomorphism range, not every j<0. All characters lie in the admitted open.
-/

/-
PadicHodgeRegulators:L4/crystalline-derham-comparison
Proposed theorem deRhamRegulator_crystalline (on its authentic supplier carriers):
For any crystalline de Rham D and z in N_rig(D)^(psi=1), Rodrigues Jacinto TheoremI.15/CorollaryI.29 assert that Lambda_(D,z) extends from U_D to the entire weight space. In the explicitly computed subcase with strictly negative phi slopes and an eigenbasis after finite coefficient extension, write z=sum A_lambda_i tensor e_i, phi(e_i)=alpha_i e_i and psi(lambda_i)=alpha_i lambda_i. PropositionI.28 identifies its value at ramified eta x^j, j>0, with sum_i alpha_i^-n (integral_Zp^times eta^-1 x^j lambda_i)e_i. This analytic integral expression gives the global extension in that subcase. The broader crystalline extension requires a proof of the reductions beyond that subcase; it is recorded as a gap, rather than deleting the source’s general target. On the common L3 range, the comparison to the LLZ/LZ regulator is a map-level equality after explicitly converting the Amice/Mellin, inverse finite-character and Gauss/Tate period conventions.
Hypotheses: D crystalline de Rham; z in the authentic differential module psi-one source. For the explicit I.28 formula additionally assume strictly negative phi slopes and a genuine eigenbasis, not just that eigenvalues lie in E. For the LLZ/LZ comparison retain their nonnegative/no-trivial-quotient range.
-/

/-
PadicHodgeRegulators:L4/split-multiplicative-augmentation
Proposed theorem rubinColemanMap_augmentation (on its authentic supplier carriers):
For an elliptic curve A with split multiplicative reduction at odd p, the actual Col_infty:H^1_(infty,s)(Q_p,T_p A)->Lambda is injective and its image is contained in the augmentation ideal ker(Lambda->Z_p). This is containment, not image equality or an exceptional-zero derivative formula.
Hypotheses: Use the source, differential, roots, indexing and lattice of rubinColemanMap. Split multiplicative reduction gives alpha=1,beta=p.
-/

end TauCeti.PadicHodgeRegulators
