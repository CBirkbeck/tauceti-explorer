/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These signatures suggest Lean forms so that contributors and reviewers
converge on names and interfaces; the mathematical specification is the document
(research/blueprint/readmes/PadicHodgeRegulators--D.1.md) and the packet.

PadicHodgeRegulators, part D.1 (layers D.1–D.5, L0–L2).
Pins: Mathlib 082e2d3; Tau Ceti f790474. Checked with lean-check against Mathlib only.

The named supplier carriers and their maps are parameters with their actual module
or category structures. They are not new definitions of representations, continuous
cohomology, period rings, K-theory, filtered F-isocrystals or integration. Native
kernels, ranges, quotients, free symbols, polynomial and cochain-complex types are
used directly. PROTOCOL §13 permits conditions that cannot yet be stated to be
omitted: the section notes identify those source-specific geometric, topological,
completion and comparison conditions. Several theorem signatures expose selected
clauses of the complete mathematical statements. The packet and reader are the
specification; none of these omitted conditions or numerical source assertions is
verified by elaboration. In particular the imported unramified factorization datum
below omits the upstream arithmetic condition and is not a ramification criterion.

Every packet declaration and API name has a Lean declaration. Every named test has
an `example`, sometimes after a supplier's coordinate identification or with source
hypotheses omitted. The few native finite-field and scalar computations use
`norm_num`; remaining proof obligations use `sorry`. No implementation is claimed.
Tau Ceti's teichmuller and finite-coefficient kummerClassMap are baseline citations
in the packet; their modules are absent from the shared build used for checking.
-/

import Mathlib.Algebra.Homology.Additive
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.RingTheory.OrzechProperty
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.LinearAlgebra.FreeModule.Finite.Basic
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.NumberTheory.Bernoulli
import Mathlib.GroupTheory.FreeAbelianGroup
import Mathlib.Tactic.NormNum

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

-- TEST regulator_eigen_compat: the q=p eigenvector factor 1−1/(pγ).
example {V : Type*} [AddCommGroup V] [Module ℚ V] (B : LinearMap.BilinForm ℚ V)
    (φ : V →ₗ[ℚ] V) (hφ : ∀ a b, B (φ a) (φ b) = 5 * B a b) (v : V) (hv : φ v = (2 : ℚ) • v)
    (x : V) : B (x - ((5 : ℚ) ^ 2)⁻¹ • φ x) v = (9 / 10) * B x v := by sorry

end TauCeti.PadicHodgeRegulators

namespace TauCeti.PadicHodgeRegulators
/-! Imported carriers below are type parameters with their actual module structures.
`H1`, `He`, `Hcris`, `Hdr`, `D`, `Dcris`, `H0` denote continuous H¹, its period
coefficient groups, D_dR/Fil⁰, D_cris and invariants. The period maps, boundary,
comparison identifications and exactness come from the suppliers in the packet.
Their geometric origin/continuity and de Rham hypotheses cannot yet be stated here;
those conditions are omitted, not replaced by proof-valued carrier fields. -/
section LocalConditions
variable {F H1 He Hcris Hdr D Dcris H0 : Type*} [Field F]
  [AddCommGroup H1] [Module F H1] [AddCommGroup He] [Module F He]
  [AddCommGroup Hcris] [Module F Hcris] [AddCommGroup Hdr] [Module F Hdr]
  [AddCommGroup D] [Module F D] [AddCommGroup Dcris] [Module F Dcris]
  [AddCommGroup H0] [Module F H0]

def blochKatoE (periodE : H1 →ₗ[F] He) : Submodule F H1 := periodE.ker
def blochKatoF (periodCris : H1 →ₗ[F] Hcris) : Submodule F H1 := periodCris.ker
def blochKatoG (periodDR : H1 →ₗ[F] Hdr) : Submodule F H1 := periodDR.ker
lemma blochKatoE_le_F (e : H1 →ₗ[F] He) (c : H1 →ₗ[F] Hcris)
    (ec : He →ₗ[F] Hcris) (h : c = ec.comp e) : blochKatoE e ≤ blochKatoF c := by sorry
-- Integral coefficients R, with R→F and the imported lattice-to-rational map.
lemma blochKatoF_lattice {R T : Type*} [CommRing R] [Algebra R F]
    [AddCommGroup T] [Module R T] [Module R H1] [Module R Hcris]
    [IsScalarTower R F H1] [IsScalarTower R F Hcris]
    (c : H1 →ₗ[F] Hcris) (latticeMap : T →ₗ[R] H1) :
    ((c.restrictScalars R).ker).comap latticeMap =
      ((c.restrictScalars R).comp latticeMap).ker := by sorry
lemma blochKatoF_map {H1' Hcris' : Type*} [AddCommGroup H1'] [Module F H1']
    [AddCommGroup Hcris'] [Module F Hcris']
    (c : H1 →ₗ[F] Hcris) (c' : H1' →ₗ[F] Hcris')
    (f : H1 →ₗ[F] H1') (fc : Hcris →ₗ[F] Hcris') (h : c'.comp f = fc.comp c) :
    Submodule.map f (blochKatoF c) ≤ blochKatoF c' := by sorry
lemma blochKatoF_res {H1' Hcris' : Type*} [AddCommGroup H1'] [Module F H1']
    [AddCommGroup Hcris'] [Module F Hcris']
    (c : H1 →ₗ[F] Hcris) (c' : H1' →ₗ[F] Hcris')
    (res : H1 →ₗ[F] H1') (resC : Hcris →ₗ[F] Hcris') (h : c'.comp res = resC.comp c) :
    Submodule.map res (blochKatoF c) ≤ blochKatoF c' := by sorry
-- At ℓ≠p this uses the imported inertia-restriction map instead of crystalline periods.
lemma blochKatoF_unramified (finiteCondition : Submodule F H1)
    (inertia : H1 →ₗ[F] He) : finiteCondition = inertia.ker := by sorry
lemma blochKatoE_extensionality (e e' : H1 →ₗ[F] He)
    (h : ∀ x, e x = 0 ↔ e' x = 0) : blochKatoE e = blochKatoE e' := by sorry

def blochKatoExp (boundary : D →ₗ[F] H1) : D →ₗ[F] H1 := boundary
lemma blochKatoExp_range (boundary : D →ₗ[F] H1) (e : H1 →ₗ[F] He)
    (hexact : Function.Exact boundary e) : (blochKatoExp boundary).range = blochKatoE e := by sorry
lemma blochKatoExp_ker (boundary : D →ₗ[F] H1) (inv : Dcris →ₗ[F] D)
    (hexact : Function.Exact inv boundary) : (blochKatoExp boundary).ker = inv.range := by sorry
lemma blochKatoExp_injective_iff (boundary : D →ₗ[F] H1) (inv : Dcris →ₗ[F] D)
    (hexact : Function.Exact inv boundary) :
    Function.Injective (blochKatoExp boundary) ↔ inv = 0 := by sorry
-- `lift`, `action`, `classOf` below are supplied by the exact period sequence and
-- continuous cocycle quotient. The lift/exactness conditions are omitted.
lemma blochKatoExp_cocycle {G B : Type*} [AddCommGroup B]
    (boundary : D →ₗ[F] H1) (lift : D → B) (action : G → B → B)
    (classOf : (G → B) → H1) (x : D) :
    blochKatoExp boundary x = classOf (fun g => action g (lift x) - lift x) := by sorry
lemma blochKatoExp_map {D' H1' : Type*} [AddCommGroup D'] [Module F D']
    [AddCommGroup H1'] [Module F H1'] (exp : D →ₗ[F] H1) (exp' : D' →ₗ[F] H1')
    (fd : D →ₗ[F] D') (fh : H1 →ₗ[F] H1') :
    fh.comp (blochKatoExp exp) = (blochKatoExp exp').comp fd := by sorry
-- Fundamental exact sequence: the source is Dcris⊕D, not just D.
lemma blochKatoExp_f_sequence (finiteBoundary : (Dcris × D) →ₗ[F] H1)
    (c : H1 →ₗ[F] Hcris) (h : Function.Exact finiteBoundary c) :
    finiteBoundary.range = blochKatoF c := by sorry
lemma blochKatoExp_extensionality (b b' : D →ₗ[F] H1)
    (h : ∀ x, blochKatoExp b x = blochKatoExp b' x) : blochKatoExp b = blochKatoExp b' := by sorry

-- The actual logarithm has domain range(exp)=H_e and requires exp injective.
def blochKatoLog (exp : D →ₗ[F] H1) (hinj : Function.Injective exp) :
    exp.range →ₗ[F] D := (LinearEquiv.ofInjective exp hinj).symm.toLinearMap
lemma blochKatoLog_exp (exp : D →ₗ[F] H1) (hinj : Function.Injective exp) (x : D) :
    blochKatoLog exp hinj ⟨exp x, ⟨x,rfl⟩⟩ = x := by sorry
lemma blochKatoExp_log (exp : D →ₗ[F] H1) (hinj : Function.Injective exp) (x : exp.range) :
    exp (blochKatoLog exp hinj x) = x := by sorry
lemma blochKatoLog_twist {D' H1' : Type*} [AddCommGroup D'] [Module F D']
    [AddCommGroup H1'] [Module F H1'] (exp : D →ₗ[F] H1) (exp' : D' →ₗ[F] H1')
    (he : Function.Injective exp) (he' : Function.Injective exp')
    (td : D ≃ₗ[F] D') (th : exp.range ≃ₗ[F] exp'.range) :
    (blochKatoLog exp' he').comp th.toLinearMap = td.toLinearMap.comp (blochKatoLog exp he) := by sorry
-- Here `Units` is the imported completed unit group; `kummer` lands in H_e.
lemma blochKatoLog_kummer {Units : Type*} (exp : D →ₗ[F] H1) (he : Function.Injective exp)
    (kummer : Units → exp.range) (unitLog : Units → D) (u : Units) :
    blochKatoLog exp he (kummer u) = unitLog u := by sorry
lemma blochKatoLog_map {D' H1' : Type*} [AddCommGroup D'] [Module F D']
    [AddCommGroup H1'] [Module F H1'] (exp : D →ₗ[F] H1) (exp' : D' →ₗ[F] H1')
    (he : Function.Injective exp) (he' : Function.Injective exp')
    (fd : D →ₗ[F] D') (fh : exp.range →ₗ[F] exp'.range) :
    (blochKatoLog exp' he').comp fh = fd.comp (blochKatoLog exp he) := by sorry
lemma blochKatoLog_extensionality (exp : D →ₗ[F] H1) (he : Function.Injective exp)
    (l : exp.range →ₗ[F] D) (h : ∀ x, l ⟨exp x, ⟨x,rfl⟩⟩ = x) : l = blochKatoLog exp he := by sorry

-- `Fil0` is the supplied filtration submodule; the comparison lands in it.
def dualExp (Fil0 : Submodule F D) (comparison : H1 →ₗ[F] Fil0) : H1 →ₗ[F] Fil0 := comparison
lemma dualExp_ker (Fil0 : Submodule F D) (comp : H1 →ₗ[F] Fil0)
    (dr : H1 →ₗ[F] Hdr) : (dualExp Fil0 comp).ker = blochKatoG dr := by sorry
lemma dualExp_adjoint {Ddual Hdual : Type*} [AddCommGroup Ddual] [Module F Ddual]
    [AddCommGroup Hdual] [Module F Hdual] (Fil0 : Submodule F D)
    (comp : H1 →ₗ[F] Fil0) (expDual : Ddual →ₗ[F] Hdual)
    (tate : Hdual →ₗ[F] H1 →ₗ[F] F) (drPair : Ddual →ₗ[F] D →ₗ[F] F)
    (x : Ddual) (y : H1) : drPair x (dualExp Fil0 comp y) = tate (expDual x) y := by sorry
lemma dualExp_formula (Fil0 : Submodule F D) (comp : H1 →ₗ[F] Fil0)
    (logChiClass : D →ₗ[F] Hdr) (period : H1 →ₗ[F] Hdr) (y : H1) :
    logChiClass (dualExp Fil0 comp y) = period y := by sorry
lemma dualExp_map (Fil0 : Submodule F D) (comp : H1 →ₗ[F] Fil0)
    (fH : H1 →ₗ[F] H1) (fD : Fil0 →ₗ[F] Fil0) :
    (dualExp Fil0 comp).comp fH = fD.comp (dualExp Fil0 comp) := by sorry
lemma dualExp_extensionality (Fil0 : Submodule F D) (c c' : H1 →ₗ[F] Fil0)
    (h : ∀ x, dualExp Fil0 c x = dualExp Fil0 c' x) : dualExp Fil0 c = dualExp Fil0 c' := by sorry
end LocalConditions

section Semilocal
variable {F ι : Type*} [Field F] [Fintype ι] {H D C : ι → Type*}
  [∀ i, AddCommGroup (H i)] [∀ i, Module F (H i)]
  [∀ i, AddCommGroup (D i)] [∀ i, Module F (D i)]
  [∀ i, AddCommGroup (C i)] [∀ i, Module F (C i)]
def semilocalBlochKatoF (c : ∀ i, H i →ₗ[F] C i) : Submodule F (∀ i, H i) :=
  Submodule.pi Set.univ (fun i => blochKatoF (c i))
def semilocalBlochKatoExp (exp : ∀ i, D i →ₗ[F] H i) : (∀ i, D i) →ₗ[F] (∀ i, H i) :=
  LinearMap.pi (fun i => (exp i).comp (LinearMap.proj i))
def semilocalBlochKatoLog (exp : ∀ i, D i →ₗ[F] H i) (he : ∀ i, Function.Injective (exp i)) :
    (∀ i, (exp i).range) →ₗ[F] (∀ i, D i) :=
  LinearMap.pi (fun i => (blochKatoLog (exp i) (he i)).comp (LinearMap.proj i))
lemma semilocal_shapiro {IndH : Type*} [AddCommGroup IndH] [Module F IndH]
    (s : IndH ≃ₗ[F] (∀ i, H i)) (c : ∀ i, H i →ₗ[F] C i) :
    ∀ x, x ∈ (semilocalBlochKatoF c).comap s.toLinearMap ↔ ∀ i, c i (s x i) = 0 := by sorry
lemma semilocal_prod (exp : ∀ i, D i →ₗ[F] H i) (x : ∀ i, D i) (i : ι) :
    semilocalBlochKatoExp exp x i = exp i (x i) := by sorry
lemma semilocalBlochKatoF_extensionality (c c' : ∀ i, H i →ₗ[F] C i)
    (h : ∀ i, blochKatoF (c i) = blochKatoF (c' i)) :
    semilocalBlochKatoF c = semilocalBlochKatoF c' := by sorry
end Semilocal
end TauCeti.PadicHodgeRegulators

namespace TauCeti.PadicHodgeRegulators
section LocalTheorems
variable {F H D C V I J : Type*} [Field F]
  [AddCommGroup H] [Module F H] [AddCommGroup D] [Module F D]
  [AddCommGroup C] [Module F C] [AddCommGroup V] [Module F V]
  [AddCommGroup I] [Module F I] [AddCommGroup J] [Module F J]
-- D, I, J are t_V, H⁰(V), H⁰(V*(1)); H is continuous H¹.
-- De Rham admissibility, rational local duality/Euler, filtration-complement and
-- period invariants must be supplied. No finite ramified descent is assumed.
theorem blochKato_dimension_formulas [FiniteDimensional F H] [FiniteDimensional F D]
    [FiniteDimensional F V] [FiniteDimensional F I] [FiniteDimensional F J]
    (f : H →ₗ[F] C) (degree : ℕ) :
    Module.finrank F (blochKatoF f) = Module.finrank F D + Module.finrank F I ∧
    Module.finrank F H = degree * Module.finrank F V + Module.finrank F I + Module.finrank F J := by sorry
-- Distinct dual carriers and all three exact annihilator pairs.
theorem blochKato_local_duality {Hdual Cd : Type*} [AddCommGroup Hdual] [Module F Hdual]
    [AddCommGroup Cd] [Module F Cd]
    (pair : H →ₗ[F] Hdual →ₗ[F] F) (e f g : H →ₗ[F] C) (ed fd gd : Hdual →ₗ[F] Cd) :
    (∀ y, y ∈ blochKatoF fd ↔ ∀ x ∈ blochKatoF f, pair x y = 0) ∧
    (∀ y, y ∈ blochKatoE ed ↔ ∀ x ∈ blochKatoG g, pair x y = 0) ∧
    (∀ y, y ∈ blochKatoG gd ↔ ∀ x ∈ blochKatoE e, pair x y = 0) := by sorry
-- res, cor, inclusion and trace are imports attached to a finite L/K.
theorem blochKato_change_of_field {HL DL : Type*} [AddCommGroup HL] [Module F HL]
    [AddCommGroup DL] [Module F DL] (expK : D →ₗ[F] H) (expL : DL →ₗ[F] HL)
    (res : H →ₗ[F] HL) (cor : HL →ₗ[F] H) (incl : D →ₗ[F] DL) (trace : DL →ₗ[F] D) :
    res.comp expK = expL.comp incl ∧ cor.comp expL = expK.comp trace := by sorry
-- Representative examples, after the supplier's Tate-twist carrier identifications.
theorem blochKato_tate_twists (r degree : ℕ) (hr : 2 ≤ r)
    [FiniteDimensional F H] (e f g : H →ₗ[F] C) :
    blochKatoE e = ⊤ ∧ blochKatoF f = ⊤ ∧ blochKatoG g = ⊤ ∧ Module.finrank F H = degree := by sorry
theorem blochKato_abelian_log {Points : Type*} (kummer : Points → H)
    (exp : D →ₗ[F] H) (he : Function.Injective exp) (kappa : Points → exp.range)
    (formalLog : Points → D) (P : Points) : blochKatoLog exp he (kappa P) = formalLog P := by sorry
-- Integral lattice, scalar and p^r support are supplied by unramified FL, r≤p−2.
theorem blochKato_integral_log {R : Type*} [CommRing R] [Algebra R F]
    [Module R D] [IsScalarTower R F D]
    (exp : D →ₗ[F] H) (he : Function.Injective exp)
    [Module R exp.range] [IsScalarTower R F exp.range]
    (p r : ℕ) (hr : 2≤r) (hrp : r≤p-2)
    (integralClasses : Submodule R exp.range) (integralDR : Submodule R D) :
    Submodule.map ((blochKatoLog exp he).restrictScalars R) integralClasses =
      Submodule.map ((p : R)^r • (LinearMap.id : D →ₗ[R] D)) integralDR := by sorry
end LocalTheorems

/-! Local unit tests. Coordinate tests use the rational realization's identified
carriers, not a definition of a Galois group or period ring. Kummer/logarithm tests
leave the not-yet-expressible representation/geometric hypotheses omitted. -/
-- TEST blochKatoF_trivial: unramified direction versus a ramified direction.
example : Module.finrank ℚ (blochKatoF (LinearMap.fst ℚ ℚ ℚ)) = 1 := by sorry
-- TEST blochKatoF_negative_twist
example : blochKatoF (LinearMap.id : ℚ →ₗ[ℚ] ℚ) = ⊥ := by sorry
-- TEST blochKatoF_rubin_compat: coordinates (valuation, unit logarithm).
example : blochKatoF (LinearMap.fst ℚ ℚ ℚ) =
    (LinearMap.inr ℚ ℚ ℚ).range := by sorry
-- TEST blochKatoG_not_all
example : blochKatoG (LinearMap.fst ℚ ℚ ℚ) ≠ ⊤ := by sorry
-- TEST blochKatoExp_twist_two
example : Function.Bijective (blochKatoExp (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) := by sorry
-- TEST blochKatoExp_trivial
example : blochKatoExp (0 : (⊥ : Submodule ℚ ℚ) →ₗ[ℚ] ℚ) = 0 := by sorry
-- TEST blochKatoExp_kummer: omitted de Rham-period realization of the maps.
example {Units H D : Type*} [AddCommGroup H] [Module ℚ H] [AddCommGroup D] [Module ℚ D]
    (exp : D →ₗ[ℚ] H) (log : Units → D) (kappa : Units → H) (u : Units) :
    blochKatoExp exp (log u) = kappa u := by sorry
-- TEST blochKatoExp_not_onto_f: the unit image misses valuation.
example : ¬ Function.Surjective (LinearMap.inr ℚ ℚ ℚ) := by sorry
-- TEST blochKatoLog_principal_unit: κ(1+p) paired with the supplied convergent unit log.
example {H D : Type*} [AddCommGroup H] [Module ℚ H] [AddCommGroup D] [Module ℚ D]
    (exp : D →ₗ[ℚ] H) (he : Function.Injective exp) (principalKummer : exp.range)
    (principalLog : D) : blochKatoLog exp he principalKummer = principalLog := by sorry
-- TEST blochKatoLog_teichmuller: torsion rationalizes to the zero Kummer class.
example {H D : Type*} [AddCommGroup H] [Module ℚ H] [AddCommGroup D] [Module ℚ D]
    (exp : D →ₗ[ℚ] H) (he : Function.Injective exp) : blochKatoLog exp he 0 = 0 := by sorry
-- TEST blochKatoLog_coleman_compat
example {Units H D : Type*} [AddCommGroup H] [Module ℚ H] [AddCommGroup D] [Module ℚ D]
    (exp : D →ₗ[ℚ] H) (he : Function.Injective exp) (kappa : Units → exp.range)
    (colemanLog : Units → D) : ∀ u, blochKatoLog exp he (kappa u) = colemanLog u := by sorry
-- TEST blochKatoLog_not_defined_trivial: H_e=0, although H_f is the unramified line.
example : (0 : (⊥ : Submodule ℚ ℚ) →ₗ[ℚ] (ℚ × ℚ)).range = ⊥ ∧
    blochKatoF (LinearMap.fst ℚ ℚ ℚ) ≠ ⊥ := by sorry
-- TEST dualExp_trivial_log_chi
example : dualExp (⊤ : Submodule ℚ ℚ)
    (LinearMap.codRestrict (⊤ : Submodule ℚ ℚ) LinearMap.id (by intro x; trivial)) 1 = ⟨1, by trivial⟩ := by sorry
-- TEST dualExp_positive_twist
example : dualExp (⊥ : Submodule ℚ ℚ) (0 : ℚ →ₗ[ℚ] (⊥ : Submodule ℚ ℚ)) = 0 := by sorry
-- TEST dualExp_adjoint_compat: the local Tate/de Rham sign is + in this order.
example (x y : ℚ) : x * y = x * dualExp (⊤ : Submodule ℚ ℚ)
    (LinearMap.codRestrict (⊤ : Submodule ℚ ℚ) LinearMap.id (by intro x; trivial)) y := by sorry
-- TEST dualExp_kernel_not_f: Q_p(1) has H_g=all, H_f=the unit line.
example : (0 : (ℚ × ℚ) →ₗ[ℚ] ℚ).ker = ⊤ ∧
    (0 : (ℚ × ℚ) →ₗ[ℚ] ℚ).ker ≠ blochKatoF (LinearMap.fst ℚ ℚ ℚ) := by sorry
-- TEST semilocal_split_quadratic: after Q(√2)⊗Q_7=Q_7×Q_7.
example : Module.finrank ℚ (Fin 2 → ℚ) = 2 := by sorry
-- TEST semilocal_zero_algebra
example : Subsingleton (Empty → ℚ) := by sorry
-- TEST semilocal_field_compat
example (exp : ℚ →ₗ[ℚ] ℚ) (x : Unit → ℚ) :
    semilocalBlochKatoExp (fun _ : Unit => exp) x () = exp (x ()) := by sorry
-- TEST semilocal_independent_factors: the product contains both independent classes.
example (c : ℚ) (hc : c ≠ 0) :
    (c,0) ≠ (0,c) ∧ (c,0) ∉ {x : ℚ × ℚ | x.1 = x.2} := by sorry
end TauCeti.PadicHodgeRegulators

namespace TauCeti.PadicHodgeRegulators
/-! `PsiFixed`, `Iw`, `Level` are imported ψ-fixed, Iwasawa and finite-level
continuous cohomology modules. H₀, topological generators, continuous characters,
period comparisons and tensor/lattice descriptions cannot yet be stated here.
The coefficient-ring linearity is distinct from the twisted Λ action. -/
section Iwasawa
variable {Λ R PsiFixed Iw Level IwTwisted : Type*} [CommRing Λ] [CommRing R]
  [AddCommGroup PsiFixed] [Module Λ PsiFixed] [AddCommGroup Iw] [Module Λ Iw]
  [Module R Iw] [AddCommGroup Level] [Module R Level]
  [AddCommGroup IwTwisted] [Module Λ IwTwisted] [Module R IwTwisted]
def fontaineIwasawaEquiv (psiComparison : PsiFixed ≃ₗ[Λ] Iw) : PsiFixed ≃ₗ[Λ] Iw := psiComparison
lemma fontaineIwasawaEquiv_pr {G B : Type*} [AddCommGroup B]
    (h : PsiFixed ≃ₗ[Λ] Iw) (pr : Iw →+ Level) (ell : R)
    (quotientAction : G → PsiFixed → B) (periodAction : G → B → B)
    (b : B) (classOf : (G → B) → Level) (y : PsiFixed) :
    pr (fontaineIwasawaEquiv h y) = ell • classOf (fun σ => quotientAction σ y - (periodAction σ b - b)) := by sorry
lemma fontaineIwasawaEquiv_cor (h : PsiFixed ≃ₗ[Λ] Iw) (pr : ℕ → Iw →+ Level)
    (cor : ℕ → Level →+ Level) (n : ℕ) :
    (cor n).comp ((pr (n+1)).comp h.toAddEquiv.toAddMonoidHom) =
      (pr n).comp h.toAddEquiv.toAddMonoidHom := by sorry
lemma fontaineIwasawaEquiv_rat {Ψrat Irat : Type*} [AddCommGroup Ψrat] [AddCommGroup Irat]
    (h : PsiFixed ≃ₗ[Λ] Iw) (rΨ : PsiFixed →+ Ψrat) (rI : Iw →+ Irat)
    (hRat : Ψrat →+ Irat) : rI.comp h.toAddEquiv.toAddMonoidHom = hRat.comp rΨ := by sorry
lemma fontaineIwasawaEquiv_torsion (h : PsiFixed ≃ₗ[Λ] Iw) (y : PsiFixed) :
    (∃ a : Λ, a ≠ 0 ∧ a • y = 0) ↔ ∃ a : Λ, a ≠ 0 ∧ a • fontaineIwasawaEquiv h y = 0 := by sorry
lemma H1Iw_noZpTorsion (p : ℕ) [Fact p.Prime] [Module ℤ_[p] Iw]
    (a : ℤ_[p]) (ha : a ≠ 0) (x : Iw) (hx : a • x = 0) : x = 0 := by sorry
lemma fontaineIwasawaEquiv_extensionality (h h' : PsiFixed ≃ₗ[Λ] Iw)
    (heq : ∀ x, fontaineIwasawaEquiv h x = fontaineIwasawaEquiv h' x) :
    fontaineIwasawaEquiv h = fontaineIwasawaEquiv h' := by sorry

def iwasawaTwist (limitCupTwist : Iw ≃+ IwTwisted) : Iw ≃+ IwTwisted := limitCupTwist
lemma iwasawaTwist_smul (tw : Iw ≃+ IwTwisted) (TwΛ : Λ ≃+* Λ) (a : Λ) (x : Iw) :
    iwasawaTwist tw (a • x) = TwΛ a • iwasawaTwist tw x := by sorry
lemma iwasawaTwist_one (twOne : Iw ≃+ Iw) : iwasawaTwist twOne = AddEquiv.refl Iw := by sorry
lemma iwasawaTwist_mul {IwTwo : Type*} [AddCommGroup IwTwo]
    (twη : Iw ≃+ IwTwisted) (twη' : IwTwisted ≃+ IwTwo) (twProduct : Iw ≃+ IwTwo) :
    (iwasawaTwist twη).trans (iwasawaTwist twη') = iwasawaTwist twProduct := by sorry
lemma iwasawaTwist_pr_finite {LevelTwisted : Type*} [AddCommGroup LevelTwisted]
    (tw : Iw ≃+ IwTwisted) (pr : Iw →+ Level) (prTw : IwTwisted →+ LevelTwisted)
    (tensorBasis : Level →+ LevelTwisted) :
    prTw.comp (iwasawaTwist tw).toAddMonoidHom = tensorBasis.comp pr := by sorry
lemma iwasawaTwist_eq_shapiro (tw shapiroTwist : Iw ≃+ IwTwisted) :
    iwasawaTwist tw = shapiroTwist := by sorry
lemma iwasawaTwist_extensionality (tw tw' : Iw ≃+ IwTwisted)
    (h : ∀ x, iwasawaTwist tw x = iwasawaTwist tw' x) : iwasawaTwist tw = iwasawaTwist tw' := by sorry

-- The argument is Tw_{η⁻¹}, with coefficient-ring linearity supplied separately.
def charSpecialization (twInverseChar : Iw ≃ₗ[R] IwTwisted) (prZero : IwTwisted →ₗ[R] Level) :
    Iw →ₗ[R] Level := prZero.comp twInverseChar.toLinearMap
lemma charSpecialization_smul (tw : Iw ≃ₗ[R] IwTwisted) (pr : IwTwisted →ₗ[R] Level)
    (evaluateCharacter : Λ →+* R) (aΛ : Λ) (x : Iw) :
    charSpecialization tw pr (aΛ • x) = evaluateCharacter aΛ • charSpecialization tw pr x := by sorry
lemma charSpecialization_fontaine {PsiTwisted LevelTwisted : Type*}
    [AddCommGroup PsiTwisted] [Module Λ PsiTwisted] [AddCommGroup LevelTwisted]
    (tw : Iw ≃ₗ[R] IwTwisted) (pr : IwTwisted →ₗ[R] Level)
    (h : PsiFixed ≃ₗ[Λ] Iw) (htw : PsiTwisted ≃ₗ[Λ] IwTwisted)
    (tensorBasis : PsiFixed → PsiTwisted) (prN : IwTwisted →+ LevelTwisted)
    (cor : LevelTwisted →+ Level) (y : PsiFixed) :
    charSpecialization tw pr (fontaineIwasawaEquiv h y) = cor (prN (fontaineIwasawaEquiv htw (tensorBasis y))) := by sorry
lemma charSpecialization_descent {Coinvariant H2Invariant : Type*}
    [AddCommGroup Coinvariant] [AddCommGroup H2Invariant]
    (incl : Coinvariant →+ Level) (boundary : Level →+ H2Invariant) :
    Function.Injective incl ∧ Function.Exact incl boundary ∧ Function.Surjective boundary := by sorry
lemma charSpecialization_extensionality (tw tw' : Iw ≃ₗ[R] IwTwisted)
    (pr pr' : IwTwisted →ₗ[R] Level)
    (h : ∀ x, charSpecialization tw pr x = charSpecialization tw' pr' x) :
    charSpecialization tw pr = charSpecialization tw' pr' := by sorry

-- Regulator comparison theorems; cochain origins and normalization are omitted.
theorem fontaine_generator_independence {HerrH : Type*} [AddCommGroup HerrH] [Module R HerrH]
    (cγ cγ' : PsiFixed → HerrH) (u : PsiFixed → PsiFixed) (ellγ ellγ' : R) (y : PsiFixed) :
    ellγ • cγ y = ellγ' • cγ' (u y) := by sorry
theorem fontaine_root_change {Period : Type*} [AddCommGroup Period] [Module R Period]
    (t : Period) (a : R) (newT : Period) (oldMap newMap : PsiFixed → Iw) :
    newT = a • t ∧ newMap = oldMap := by sorry
theorem fontaine_twist_compatibility {PsiTwisted : Type*} [AddCommGroup PsiTwisted]
    [Module Λ PsiTwisted] (h : PsiFixed ≃ₗ[Λ] Iw) (htw : PsiTwisted ≃ₗ[Λ] IwTwisted)
    (tensorBasis : PsiFixed → PsiTwisted) (tw : Iw ≃+ IwTwisted) (y : PsiFixed) :
    fontaineIwasawaEquiv htw (tensorBasis y) = iwasawaTwist tw (fontaineIwasawaEquiv h y) := by sorry
theorem wach_psi_fixed_vectors {Ambient : Type*} [AddCommGroup Ambient] [Module Λ Ambient]
    (ψ : Ambient →ₗ[Λ] Ambient) (wach : Submodule Λ Ambient) :
    (ψ - LinearMap.id).ker ≤ wach := by sorry
theorem fontaine_lattice_coefficient_squares {Ψsmall Ismall : Type*}
    [AddCommGroup Ψsmall] [Module Λ Ψsmall] [AddCommGroup Ismall] [Module Λ Ismall]
    (h : PsiFixed ≃ₗ[Λ] Iw) (hsmall : Ψsmall ≃ₗ[Λ] Ismall)
    (inclΨ : Ψsmall →ₗ[Λ] PsiFixed) (inclI : Ismall →ₗ[Λ] Iw) :
    inclI.comp hsmall.toLinearMap = h.toLinearMap.comp inclΨ := by sorry
-- Sign s remains open: it is never silently chosen in this signature.
theorem kummer_coleman_comparison {Units : Type*} (h : PsiFixed ≃ₗ[Λ] Iw)
    (deltaColeman : Units → PsiFixed) (kummer : Units → Iw) (s : R)
    (hs : s = 1 ∨ s = -1) (u : Units) :
    fontaineIwasawaEquiv h (deltaColeman u) = s • kummer u := by sorry
end Iwasawa

-- TEST fontaineIwasawa_trivial
example (h : ℚ ≃ₗ[ℚ] ℚ) : fontaineIwasawaEquiv h 1 ≠ 0 := by sorry
-- TEST fontaineIwasawa_unramified_char: after the nontrivial character's torsion vanishes.
example (a x : ℚ) (ha : a ≠ 0) (h : a*x=0) : x=0 := by sorry
-- TEST fontaineIwasawa_cor_compat: levels 1 and 2.
example {D I L : Type*} [AddCommGroup D] [Module ℚ D] [AddCommGroup I] [Module ℚ I]
    [AddCommGroup L] (h : D ≃ₗ[ℚ] I) (pr1 pr2 : I →+ L) (cor : L →+ L) :
    cor.comp (pr2.comp (fontaineIwasawaEquiv h).toAddEquiv.toAddMonoidHom) =
      pr1.comp (fontaineIwasawaEquiv h).toAddEquiv.toAddMonoidHom := by sorry
-- TEST fontaineIwasawa_not_D_itself: ψ-fixed versus φ-fixed are different tests.
example (ψ φ : ℚ →ₗ[ℚ] ℚ) (y : ℚ) (hψ : ψ y=y) (hφ : φ y≠y) :
    y ∈ (ψ-LinearMap.id).ker ∧ y ∉ (φ-LinearMap.id).ker := by sorry
-- TEST iwasawaTwist_inverse
example {I J : Type*} [AddCommGroup I] [AddCommGroup J] (tw : I ≃+ J) (x : I) :
    iwasawaTwist tw.symm (iwasawaTwist tw x) = x := by sorry
-- TEST iwasawaTwist_trivial
example (x : ℚ) : iwasawaTwist (AddEquiv.refl ℚ) x = x := by sorry
-- TEST iwasawaTwist_level_cyclotomic: pr_mod and cup use the finite-level twist.
example {I J L : Type*} [AddCommGroup I] [AddCommGroup J] [AddCommGroup L]
    (tw : I ≃+ J) (pr : I →+ L) (prTw : J →+ L) (cupTate : L →+ L) (x : I) :
    prTw (iwasawaTwist tw x) = cupTate (pr x) := by sorry
-- TEST iwasawaTwist_not_linear: a nontrivial character rescales the action.
example (x : ℚ) (hx : x≠0) : (-1 : ℚ) * x ≠ x := by sorry
-- TEST charSpecialization_trivial
example (pr : ℚ →ₗ[ℚ] ℚ) : charSpecialization (LinearEquiv.refl ℚ ℚ) pr = pr := by sorry
-- TEST charSpecialization_zero
example (tw : ℚ ≃ₗ[ℚ] ℚ) (pr : ℚ →ₗ[ℚ] ℚ) : charSpecialization tw pr 0 = 0 := by sorry
-- TEST charSpecialization_level_independence
example (pr1 pr2 cor : ℚ →ₗ[ℚ] ℚ) (tw : ℚ ≃ₗ[ℚ] ℚ) (x : ℚ) :
    pr1 (tw x) = cor (pr2 (tw x)) := by sorry
-- TEST charSpecialization_not_equivariant: χ(σ_{−1})=−1.
example (x : ℚ) (hx : x≠0) : -x ≠ x := by sorry
end TauCeti.PadicHodgeRegulators

namespace TauCeti.PadicHodgeRegulators
/-! D.1 supplier units, branch functions and Bloch carriers are parameters.
The local-field topology, finite extension, Galois action and five-term
presentation conditions omitted here are specified in the packet. -/
section DilogAPI
variable {ι : Type*} {A : ι → Type*} [∀ i, Field (A i)]
lemma etaleDilog_field {K : Type*} [Field K] (D : K → K) (z : Unit → K) :
    etaleDilog (fun _ : Unit => D) z () = D (z ()) := by sorry
lemma etaleDilog_extensionality (D E : ∀ i, A i → A i)
    (h : ∀ i z, D i z=E i z) : etaleDilog D=etaleDilog E := by sorry
end DilogAPI

section CombinedDilog
variable {K L Bloch : Type*} [Field K] [AddCommGroup L] [AddCommGroup Bloch]
-- Zero at [1] is part of the actual construction, not a value of D at 1.
def combinedDilog (embed : K → L) (D : L → L) : FreeAbelianGroup Kˣ →+ L := by
  classical
  exact FreeAbelianGroup.lift (fun z => if z=1 then 0 else D (embed z.val))
lemma combinedDilog_of (embed : K → L) (D : L → L) (z : Kˣ) (hz : z≠1) :
    combinedDilog embed D (FreeAbelianGroup.of z) = D (embed z.val) := by sorry
lemma combinedDilog_component {ι : Type*} {Li : ι → Type*} [∀ i, AddCommGroup (Li i)]
    (embed : K → (∀ i, Li i)) (D : (∀ i, Li i) → (∀ i, Li i)) (z : Kˣ) (hz : z≠1) (i : ι) :
    combinedDilog embed D (FreeAbelianGroup.of z) i = D (embed z.val) i := by sorry
lemma combinedDilog_fiveTerm (embed : K → L) (D : L → L)
    (fiveTermRelations : AddSubgroup (FreeAbelianGroup Kˣ)) :
    fiveTermRelations ≤ (combinedDilog embed D).ker := by sorry
-- The imported Bloch realization includes the five-term quotient and wedge kernel.
def blochDilog (importedBlochRegulator : Bloch →+ L) : Bloch →+ L := importedBlochRegulator
lemma blochDilog_branch_indep (Dbranch Dzero : Bloch →+ L) :
    blochDilog Dbranch = blochDilog Dzero := by sorry
lemma blochDilog_map {Bloch' L' : Type*} [AddCommGroup Bloch'] [AddCommGroup L']
    (D : Bloch →+ L) (D' : Bloch' →+ L') (res : Bloch →+ Bloch') (incl : L →+ L') :
    (blochDilog D').comp res = incl.comp (blochDilog D) := by sorry
lemma blochDilog_galois (D : Bloch →+ L) (τB : Bloch →+ Bloch) (τL : L →+ L) :
    (blochDilog D).comp τB=τL.comp (blochDilog D) := by sorry
lemma combinedDilog_extensionality (f g : FreeAbelianGroup Kˣ →+ L)
    (h : ∀ z, f (FreeAbelianGroup.of z)=g (FreeAbelianGroup.of z)) : f=g := by sorry
end CombinedDilog

section AnalyticComparisons
variable {K : Type*} [Field K]
theorem teichmuller_unit_decomposition {Residue : Type*} (residue : Kˣ → Residue)
    (teichmuller : Residue → Kˣ) (u : Kˣ) :
    u = teichmuller (residue u) * (u / teichmuller (residue u)) := by sorry
-- φ and tameRoots are the imported arithmetic Frobenius and μ_(q−1).
theorem unramified_frobenius_on_roots (φ : K →+* K) (p : ℕ)
    (tameRoots : Subgroup Kˣ) (ζ : tameRoots) : φ (ζ.val.val) = ζ.val.val^p := by sorry
theorem dilogarithm_scalar_extension {L : Type*} [Field L] (incl : K →+* L)
    (DK : K → K) (DL : L → L) (z : K) (hz0 : z≠0) (hz1 : z≠1) :
    DL (incl z)=incl (DK z) := by sorry
theorem regulator_normalisation_dictionary (Li₂ Li₁ log D : K → K) (z : K) :
    D z = Li₂ z - (2 : K)⁻¹ * log z * Li₁ z := by sorry
-- O is the valuation ring, not the full field whose Iwasawa log also kills p.
theorem unit_logarithm_kernel {O : Type*} [CommRing O]
    (log : Oˣ →* Multiplicative K) (roots : Subgroup Oˣ) :
    log.ker = roots := by sorry
end AnalyticComparisons
-- A logarithm is naturally a hom from the multiplicative unit group to additive K.
-- Native representation uses Multiplicative K for the codomain.
theorem logarithm_norm_trace {K L : Type*} [Field K] [Field L]
    (norm : Lˣ →* Kˣ) (logK : Kˣ → Multiplicative K)
    (logL : Lˣ → Multiplicative L) (trace : L →+ K) (u : Lˣ) :
    (logK (norm u)).toAdd = trace (logL u).toAdd := by sorry

-- TEST etaleDilog_teichmuller_two_mod: imported p⁻²D(ω(2)), reduced mod 5.
example (Dmod : ZMod 125) (scaledDmod : ZMod 125)
    (hscale : Dmod=25*scaledDmod)
    (hred : ZMod.castHom (by decide : 5 ∣ 125) (ZMod 5) scaledDmod=1) :
    Dmod=25 := by sorry
-- TEST etaleDilog_diag
example (D : ℚ → ℚ) (x : ℚ) :
    etaleDilog (fun _ : Fin 2 => D) (fun _ => x) = fun _ => D x := by sorry
-- TEST etaleDilog_not_branch_one: local analytic nonvanishing is omitted.
example [Fact (Nat.Prime 5)] (Dzero Done log : ℚ_[5] → ℚ_[5]) :
    Done 5 - Dzero 5 = (2 : ℚ_[5])⁻¹ * log (1-5) ∧ Done 5≠Dzero 5 := by sorry
-- TEST combinedDilog_rat
example (D : ℚ → ℚ) (z : ℚˣ) (hz : z≠1) :
    combinedDilog id D (FreeAbelianGroup.of z)=D z.val := by sorry
-- TEST combinedDilog_zero
example {K L : Type*} [Field K] [AddCommGroup L] (embed : K → L) (D : L → L) :
    combinedDilog embed D 0=0 ∧ combinedDilog embed D (FreeAbelianGroup.of 1)=0 := by sorry
-- TEST blochDilog_cubic_five: source acceptance truncation, not recomputed numerics.
example {B L : Type*} [AddCommGroup B] [CommRing L] (D : B →+ L) (ξ : B)
    (α : L) (reduce125 : L →+* ZMod 125) :
    reduce125 (blochDilog D ξ) = reduce125 (75*α^2+25*α+50) := by sorry
-- TEST combinedDilog_not_on_bloch_branch
example [Fact (Nat.Prime 5)] (Dzero Done log : ℚ_[5] → ℚ_[5]) (five : ℚˣ) (hfive : five.val=5) :
    combinedDilog (algebraMap ℚ ℚ_[5]) Done (FreeAbelianGroup.of five) -
      combinedDilog (algebraMap ℚ ℚ_[5]) Dzero (FreeAbelianGroup.of five) =
        (2 : ℚ_[5])⁻¹ * log (1-5) ∧
    combinedDilog (algebraMap ℚ ℚ_[5]) Done (FreeAbelianGroup.of five) ≠
      combinedDilog (algebraMap ℚ ℚ_[5]) Dzero (FreeAbelianGroup.of five) := by sorry
lemma finitePolylog_extensionality (p : ℕ) [Fact p.Prime] (n : ℤ)
    (P : Polynomial (ZMod p)) (h : ∀ k, P.coeff k=(finitePolylog p n).coeff k) :
    P=finitePolylog p n := by sorry
-- TEST finitePolylog_compat_coleman: imported normalized tame-root value.
example (p : ℕ) [Fact p.Prime] (normalizedValue x : ZMod p) (hx0 : x≠0) (hx1 : x≠1) :
    normalizedValue = -(finitePolylog p 2).eval x / (1-x)^p := by sorry
end TauCeti.PadicHodgeRegulators

namespace TauCeti.PadicHodgeRegulators
/-! Étale/syntomic K-theory, period and cohomology carriers below are imported.
Schemes, universal Chern classes, continuous cohomology, special units and the
geometric comparison hypotheses are omitted. This section specifies their
regulator interfaces; it introduces no replacement cohomology carrier. -/
section EtaleRegulator
variable {Kgroup Kcompleted H1 : Type*} [AddCommGroup Kgroup]
  [AddCommGroup Kcompleted] [AddCommGroup H1]
def etaleRegulator (souleChern : Kgroup →+ H1) : Kgroup →+ H1 := souleChern
def etaleRegulator_completed {R : Type*} [CommRing R] [Module R Kcompleted] [Module R H1]
    (completedChern : Kcompleted →ₗ[R] H1) : Kcompleted →ₗ[R] H1 := completedChern
lemma etaleRegulator_one {Units : Type*} (souleChern : Kgroup →+ H1)
    (unitsToK1 : Units → Kgroup) (kummer : Units → H1) (u : Units) :
    etaleRegulator souleChern (unitsToK1 u) = kummer u := by sorry
lemma etaleRegulator_map {Kgroup' H1' : Type*} [AddCommGroup Kgroup'] [AddCommGroup H1']
    (c : Kgroup →+ H1) (c' : Kgroup' →+ H1') (kmap : Kgroup →+ Kgroup') (res : H1 →+ H1') :
    res.comp (etaleRegulator c) = (etaleRegulator c').comp kmap := by sorry
lemma etaleRegulator_transfer {Kgroup' H1' : Type*} [AddCommGroup Kgroup'] [AddCommGroup H1']
    (c : Kgroup →+ H1) (c' : Kgroup' →+ H1') (transfer : Kgroup' →+ Kgroup) (cor : H1' →+ H1) :
    cor.comp (etaleRegulator c') = (etaleRegulator c).comp transfer := by sorry
lemma etaleRegulator_local_equiv {R : Type*} [CommRing R] [Module R Kcompleted] [Module R H1]
    (c : Kcompleted →ₗ[R] H1) : Function.Bijective (etaleRegulator_completed c) := by sorry
lemma etaleRegulator_completion (c : Kgroup →+ H1) (cc : Kcompleted →+ H1)
    (complete : Kgroup →+ Kcompleted) (res : H1 →+ H1) :
    res.comp (etaleRegulator c) = cc.comp complete := by sorry
lemma etaleRegulator_extensionality (c c' : Kgroup →+ H1) (h : ∀ x, c x=c' x) :
    etaleRegulator c = etaleRegulator c' := by sorry
end EtaleRegulator

section RigidSyntomic
variable {F K Syn Kgroup : Type*} [Field F] [Field K] [Algebra F K]
  [AddCommGroup Syn] [Module F Syn] [AddCommGroup Kgroup]
abbrev rigidSyntomicCohomology (importedCohomology : Type*) := importedCohomology
def rigidSyntomicCohomology_map {Syn' : Type*} [AddCommGroup Syn'] [Module F Syn']
    (induced : Syn →ₗ[F] Syn') : Syn →ₗ[F] Syn' := induced
lemma rigidSyntomic_long_exact {Prev Next : Type*} [AddCommGroup Prev] [Module F Prev]
    [AddCommGroup Next] [Module F Next] (boundary : Prev →ₗ[F] Syn) (forget : Syn →ₗ[F] Next) :
    Function.Exact boundary forget := by sorry
-- Native UNRAMIFIED Spec O_K point model (K_0=K): b↦(-b,Ab)
-- on K×K, A=1−σ/p^n. The ramified K×K_0 model is omitted.
def rigidPointDifferential (A : K →ₗ[F] K) : K →ₗ[F] (K × K) := (-LinearMap.id).prod A
abbrev rigidPointCohomology (A : K →ₗ[F] K) := (K × K) ⧸ (rigidPointDifferential A).range
def rigidSyntomic_spec_eta (A : K ≃ₗ[F] K) : rigidPointCohomology A.toLinearMap ≃ₗ[F] K := by sorry
lemma rigidSyntomic_spec_eta_class (A : K ≃ₗ[F] K) (a c : K) :
    rigidSyntomic_spec_eta A (Submodule.Quotient.mk (a,c)) = a + A.symm c := by sorry
lemma rigidSyntomic_spec_vanish (Cohom : ℕ → Type*) (i n : ℕ) (hi : i≠1) (hn : 1≤n) :
    Subsingleton (Cohom i) := by sorry
lemma rigidSyntomic_independent {Syn' : Type*} [AddCommGroup Syn'] [Module F Syn'] :
    Nonempty (Syn ≃ₗ[F] Syn') := by sorry
lemma rigidSyntomicCohomology_extensionality {Syn' : Type*} [AddCommGroup Syn'] [Module F Syn']
    (f g : Syn →ₗ[F] Syn') (h : ∀ x, f x=g x) : f=g := by sorry

def syntomicChernClass (chern : Kgroup →+ Syn) : Kgroup →+ Syn := chern
def syntomicRegulator (chern : Kgroup →+ Syn) (eta : Syn →+ K) : Kgroup →+ K := eta.comp chern
lemma syntomicRegulator_one {Units : Type*} (chern : Kgroup →+ Syn) (eta : Syn →+ K)
    (unitsToK1 : Units → Kgroup) (logp : Units → K) (u : Units) :
    syntomicRegulator chern eta (unitsToK1 u) = logp u := by sorry
lemma syntomicRegulator_baseChange {Kgroup' Syn' K' : Type*} [AddCommGroup Kgroup']
    [AddCommGroup Syn'] [Field K'] (c : Kgroup →+ Syn) (c' : Kgroup' →+ Syn')
    (eta : Syn →+ K) (eta' : Syn' →+ K') (kmap : Kgroup →+ Kgroup') (incl : K →+ K') :
    (syntomicRegulator c' eta').comp kmap = incl.comp (syntomicRegulator c eta) := by sorry
lemma syntomicRegulator_aut (c : Kgroup →+ Syn) (eta : Syn →+ K)
    (kτ : Kgroup →+ Kgroup) (τ : K →+ K) :
    (syntomicRegulator c eta).comp kτ = τ.comp (syntomicRegulator c eta) := by sorry
lemma syntomicChernClass_deRham {DR : Type*} [AddCommGroup DR] (c : Kgroup →+ Syn)
    (forget : Syn →+ DR) (deRhamChern : Kgroup →+ DR) :
    forget.comp (syntomicChernClass c) = deRhamChern := by sorry
lemma syntomicChernClass_extensionality (c c' : Kgroup →+ Syn) (h : ∀ x, c x=c' x) :
    syntomicChernClass c = syntomicChernClass c' := by sorry

theorem syntomic_etale_regulator_comparison {H1 : Type*} [AddCommGroup H1]
    (c : Kgroup →+ Syn) (eta : Syn →+ K) (expBK : K →+ H1) (etale : Kgroup →+ H1) :
    expBK.comp (syntomicRegulator c eta) = etale := by sorry
-- Only the source's special-unit presentations are allowed in these comparisons.
theorem weight_two_dilogarithm_comparison {Presentation : Type*}
    (syn : Kgroup →+ K) (toK3 : Presentation → Kgroup) (dilogSum : Presentation → K)
    (sign : K) (hs : sign=1 ∨ sign = -1) (ξ : Presentation) :
    syn (toK3 ξ) = sign * dilogSum ξ := by sorry
theorem higher_weight_polylogarithm_comparison {NormalizedPresentation : Type*}
    (n : ℕ) (syn : Kgroup →+ K) (toK : NormalizedPresentation → Kgroup)
    (modifiedPolylogSum : NormalizedPresentation → K) (sign : K)
    (ξ : NormalizedPresentation) : syn (toK ξ) = sign * modifiedPolylogSum ξ := by sorry
theorem gros_normalisation (syn gros : Kgroup →+ K) (φ : K →+ K) (p : K) (n : ℕ) (x : Kgroup) :
    gros x = syn x - (p^n)⁻¹ * φ (syn x) := by sorry
end RigidSyntomic

section IntegralSyntomic
open CategoryTheory CategoryTheory.Limits
variable {C : Type*} [Category C] [HasZeroMorphisms C]
-- Both are imported complexes in the relevant module or sheaf category.
def logSyntomicComplex (U : CochainComplex C ℤ) : CochainComplex C ℤ := U
def logSyntomicSheaf (USheaf : CochainComplex C ℤ) : CochainComplex C ℤ := USheaf
def logSyntomicDividedComplex (D : CochainComplex C ℤ) : CochainComplex C ℤ := D
lemma logSyntomicComplex_reduction {Derived : Type*} [Category Derived] (U derivedReduction : Derived) :
    Nonempty (U ≅ derivedReduction) := by sorry
-- Rational equivalence lives after derived rationalization, not integrally.
lemma logSyntomicComplex_rational {Derived : Type*} [Category Derived] (UQ dividedQ : Derived) :
    Nonempty (UQ ≅ dividedQ) := by sorry
def logSyntomicComplex_map (U U' : CochainComplex C ℤ) (pullback : U ⟶ U') : U ⟶ U' := pullback
def logSyntomicComplex_product (tensorSource target : CochainComplex C ℤ)
    (cup : tensorSource ⟶ target) : tensorSource ⟶ target := cup
end IntegralSyntomic

section IntegralPeriod
open CategoryTheory CategoryTheory.Limits
variable (U D E : CochainComplex (ModuleCat ℤ) ℤ)
def logSyntomicToDivided (ω : U ⟶ D) : U ⟶ D := ω
lemma logSyntomicToDivided_composites (ω : U ⟶ D) (τ : D ⟶ U) (p r : ℕ) :
    ω ≫ τ = (p^r) • 𝟙 U ∧ τ ≫ ω = (p^r) • 𝟙 D := by sorry
def fmkDividedPeriodMap (directedPeriod : D ⟶ E) : D ⟶ E := directedPeriod
def fmkPeriodMap (ω : U ⟶ D) (directedPeriod : D ⟶ E) : U ⟶ E := ω ≫ directedPeriod
lemma fmkPeriodMap_local (ω : U ⟶ D) (directedPeriod : D ⟶ E) :
    fmkPeriodMap U D E ω directedPeriod = ω ≫ fmkDividedPeriodMap D E directedPeriod := by sorry
lemma fmkPeriodMap_reduction (U' D' E' : CochainComplex (ModuleCat ℤ) ℤ)
    (ω : U ⟶ D) (ω' : U' ⟶ D') (α : D ⟶ E) (α' : D' ⟶ E')
    (redU : U ⟶ U') (redE : E ⟶ E') :
    fmkPeriodMap U D E ω α ≫ redE = redU ≫ fmkPeriodMap U' D' E' ω' α' := by sorry
end IntegralPeriod
section PeriodCohomology
variable {R U1 D1 E1 : Type*} [CommRing R] [AddCommGroup U1] [Module R U1]
  [AddCommGroup D1] [Module R D1] [AddCommGroup E1] [Module R E1]
lemma fmkPeriodMap_mul (Ucup : U1 →ₗ[R] U1 →ₗ[R] U1) (Ecup : E1 →ₗ[R] E1 →ₗ[R] E1)
    (period : U1 →ₗ[R] E1) (x y : U1) : period (Ucup x y) = Ecup (period x) (period y) := by sorry
lemma fmkPeriodMap_degree_one {Units : Type*} (ω : U1 →ₗ[R] D1) (α : D1 →ₗ[R] E1)
    (unitU : Units → U1) (unitD : Units → D1) (kummer : Units → E1) (p : R) (u : Units) :
    α (unitD u) = kummer u ∧ α (ω (unitU u)) = p • kummer u := by sorry
-- The exact theorem is DIVIDED r≤p−2; no endpoint or undivided strengthening.
theorem divided_small_twist_comparison (p r i : ℕ) (hir : i≤r) (hrp : r≤p-2)
    (αdiv : D1 →ₗ[R] E1) : Function.Bijective αdiv := by sorry
-- Bounded torsion comparison is independent of m, and carries N(K,p,r).
theorem undivided_bounded_comparison (p bound : ℕ) (αund : U1 →ₗ[R] E1) :
    (∀ x ∈ αund.ker, (p^bound) • x=0) ∧
    (∀ y : E1, ∃ x : U1, αund x=(p^bound) • y) := by sorry
theorem syntomic_exponential {F Syn DR H1 : Type*} [Field F]
    [AddCommGroup Syn] [Module F Syn] [AddCommGroup DR] [Module F DR]
    [AddCommGroup H1] [Module F H1] (boundary : DR →ₗ[F] Syn)
    (edge : Syn →ₗ[F] H1) (expBK : DR →ₗ[F] H1) : edge.comp boundary=expBK := by sorry
end PeriodCohomology
end TauCeti.PadicHodgeRegulators

namespace TauCeti.PadicHodgeRegulators
/-! D.2 examples retain distinct Chern, cone, period and Kummer maps.
Geometric and representation hypotheses omitted here are supplied by the
source-specific imported interfaces, never by a fabricated Prop carrier. -/
-- TEST etaleRegulator_kummer: continuous inverse limit, not one finite level.
example {Units K1 H1 : Type*} [AddCommGroup K1] [AddCommGroup H1]
    (chern : K1 →+ H1) (unitClass : Units → K1) (continuousKummer : Units → H1) (u : Units) :
    etaleRegulator chern (unitClass u)=continuousKummer u := by sorry
-- TEST etaleRegulator_rank_q5
example [Fact (Nat.Prime 5)] {K3 H1 : Type*} [AddCommGroup K3] [Module ℤ_[5] K3]
    [AddCommGroup H1] [Module ℤ_[5] H1] (c : K3 →ₗ[ℤ_[5]] H1) :
    Function.Bijective (etaleRegulator_completed c) ∧ Module.finrank ℤ_[5] K3=1 := by sorry
-- TEST etaleRegulator_torsion_Q
example {K3 H1 : Type*} [AddCommGroup K3] [AddCommGroup H1] [Module ℚ H1]
    (c : K3 →+ H1) (x : K3) (hx : 48 • x=0) : etaleRegulator c x=0 := by sorry
-- TEST etaleRegulator_not_basis_functional: a chosen basis map can fail Frobenius.
example :
    ((LinearMap.snd ℚ ℚ ℚ).prod (LinearMap.fst ℚ ℚ ℚ)).comp
      ((LinearMap.fst ℚ ℚ ℚ).prod (-LinearMap.snd ℚ ℚ ℚ)) ≠
    ((LinearMap.fst ℚ ℚ ℚ).prod (-LinearMap.snd ℚ ℚ ℚ)).comp
      ((LinearMap.snd ℚ ℚ ℚ).prod (LinearMap.fst ℚ ℚ ℚ)) := by sorry
-- TEST rigidSyntomic_zp_two
example (A : ℚ ≃ₗ[ℚ] ℚ) (hA : ∀ x, A x=(24/25 : ℚ)*x) (c : ℚ) :
    rigidSyntomic_spec_eta A (Submodule.Quotient.mk (0,c))=(25/24 : ℚ)*c := by sorry
-- TEST rigidSyntomic_weight_zero: H⁰ comes from ker(1−σ), σ=id over Q_p.
example : (LinearMap.id - LinearMap.id : ℚ →ₗ[ℚ] ℚ).ker=⊤ := by sorry
-- TEST rigidSyntomic_monsky_washnitzer
example {F Rigid MW : Type*} [Field F] [AddCommGroup Rigid] [Module F Rigid]
    [AddCommGroup MW] [Module F MW] (comparison : Rigid ≃ₗ[F] MW) :
    Function.Bijective comparison := by sorry
-- TEST rigidSyntomic_not_de_rham: the positive-weight filtration term is zero.
example (A : ℚ ≃ₗ[ℚ] ℚ) : ¬ Subsingleton (rigidPointCohomology A.toLinearMap) ∧
    Subsingleton (⊥ : Submodule ℚ ℚ) := by sorry
section SyntomicRegulatorTests
variable {K3 Syn K : Type*} [AddCommGroup K3] [AddCommGroup Syn] [Module ℚ Syn]
    [Field K] [Algebra ℚ K] (c : K3 →+ Syn) (eta : Syn →+ K)
-- TEST syntomicRegulator_log: the imported principal-unit K₁ and series log.
example (principalUnitClass : K3) (seriesLogOnePlusP : K) :
    syntomicRegulator c eta principalUnitClass=seriesLogOnePlusP := by sorry
-- TEST syntomicRegulator_teichmuller_one
example (teichmullerClass : K3) : syntomicRegulator c eta teichmullerClass=0 := by sorry
-- TEST syntomicRegulator_cyclotomic
example (cyclotomicClass : K3) (Li₂Root sign : K) (hs : sign=1 ∨ sign = -1) :
    syntomicRegulator c eta cyclotomicClass=sign*Li₂Root := by sorry
end SyntomicRegulatorTests
-- TEST syntomicRegulator_not_gros
example : (1-((5 : ℚ)^2)⁻¹)≠1 := by norm_num
-- TEST logSyntomic_point_weight_two: r=2 is in the divided exact range at p≥5.
example (p : ℕ) (hp : 5≤p) : 2≤p-2 := by sorry
-- TEST logSyntomic_weight_zero: the two complexes and their Frobenius maps agree.
example {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]
    (φ : M →ₗ[R] M) (p : R) : (p^0) • LinearMap.id-φ=LinearMap.id-φ := by sorry
-- TEST logSyntomic_rigid_compat: equivalence after derived rationalization.
example {F LogQ RigidQ : Type*} [Field F] [AddCommGroup LogQ] [Module F LogQ]
    [AddCommGroup RigidQ] [Module F RigidQ] (comparison : LogQ ≃ₗ[F] RigidQ) :
    Function.Bijective comparison := by sorry
-- TEST logSyntomic_not_naive_twist: p=5,r=4 gives a=1, a!=1.
example : ((5 : ℚ)^1 * (Nat.factorial 1))⁻¹=1/5 ∧ ((5 : ℚ)^0)⁻¹=1 := by norm_num
-- TEST logSyntomic_division_is_not_iso: mod p, Fib(0) and Fib(id) differ already in kernel.
example (p : ℕ) [Fact p.Prime] :
    (0 : ZMod p →ₗ[ZMod p] ZMod p).ker ≠ (LinearMap.id : ZMod p →ₗ[ZMod p] ZMod p).ker := by sorry
-- TEST fmk_kummer: divided and undivided classes keep different integral scaling.
example (p : ℕ) [Fact p.Prime] (αdiv : ZMod p →ₗ[ZMod p] ZMod p) (κ : ZMod p)
    (κne : κ≠0) (hα : αdiv=LinearMap.id) : αdiv κ=κ ∧ αdiv ((p : ZMod p) • κ)=0 := by sorry
-- TEST fmk_weight_zero
example {F U E : Type*} [Field F] [AddCommGroup U] [Module F U]
    [AddCommGroup E] [Module F E] (periodZero : U ≃ₗ[F] E) : Function.Bijective periodZero := by sorry
-- TEST fmk_twist_normalisation: same lattice in the small range.
example (p r : ℕ) (hp : 2≤p) (hr : r<p-1) : r/(p-1)=0 := by sorry
-- TEST fmk_untwisted_fails: the prescribed p⁻¹ generator differs.
example : (1/5 : ℚ) ≠ 1 := by norm_num
end TauCeti.PadicHodgeRegulators

namespace TauCeti.PadicHodgeRegulators
/-! Local K₃ carriers, Chern maps and the Bloch completion are imports. They
are never defined as new abstract K-theory groups. Good unramified reduction,
p>3, special-unit presentations, tame roots and the normalized sign are omitted
where their geometric/representation definitions do not exist at the pin. -/
section UnramifiedInterface
variable {F L : Type*} [Field F] [CommRing L] [Algebra F L]
-- Only the factorization datum can be prototyped natively. The upstream
-- unramified local-field condition on each factor is omitted, not a Prop field.
structure IsUnramifiedEtaleAlgebra (F L : Type*) [Field F] [CommRing L] [Algebra F L]
    (ι : Type*) (K : ι → Type*) [∀ i, Field (K i)] [∀ i, Algebra F (K i)] where
  factorEquiv : L ≃ₐ[F] (∀ i, K i)
lemma unramifiedEtaleAlgebra_equiv_witt {WittFraction : Type*} [CommRing WittFraction]
    [Algebra F WittFraction] : Nonempty (L ≃ₐ[F] WittFraction) := by sorry
lemma unramifiedEtaleAlgebra_rank {Fp Residue : Type*} [Field Fp]
    [AddCommGroup Residue] [Module Fp Residue] [FiniteDimensional F L]
    [FiniteDimensional Fp Residue] : Module.finrank F L = Module.finrank Fp Residue := by sorry
def unramifiedEtaleAlgebra_frobenius (wittFrobenius : L ≃ₐ[F] L) : L ≃ₐ[F] L := wittFrobenius
lemma unramifiedEtaleAlgebra_prod {ι : Type*} {K : ι → Type*}
    [∀ i, Field (K i)] [∀ i, Algebra F (K i)] :
    Nonempty (IsUnramifiedEtaleAlgebra F (∀ i, K i) ι K) := by sorry
lemma unramifiedEtaleAlgebra_tensor_padic {ι : Type*} {K : ι → Type*}
    [∀ i, Field (K i)] [∀ i, Algebra F (K i)] :
    Nonempty (IsUnramifiedEtaleAlgebra F L ι K) := by sorry
end UnramifiedInterface

section LocalK3
variable {R K3 H1 LocalL Bloch : Type*} [CommRing R]
  [AddCommGroup K3] [Module R K3] [AddCommGroup H1] [Module R H1]
  [AddCommGroup LocalL] [Module R LocalL] [AddCommGroup Bloch] [Module R Bloch]
abbrev completedK3 (supplierCompletedK3 : Type*) := supplierCompletedK3
lemma completedK3_prodEquiv {ι : Type*} {K3i : ι → Type*}
    [∀ i, AddCommGroup (K3i i)] [∀ i, Module R (K3i i)] :
    Nonempty (K3 ≃ₗ[R] (∀ i, K3i i)) := by sorry
lemma completedK3_integers_equiv {IntegralK3 : Type*} [AddCommGroup IntegralK3]
    [Module R IntegralK3] : Nonempty (IntegralK3 ≃ₗ[R] K3) := by sorry
lemma completedK3_chernEquiv : Nonempty (K3 ≃ₗ[R] H1) := by sorry
lemma completedK3_free (degree : ℕ) : Module.Free R K3 ∧ Module.finrank R K3 = degree := by sorry
def completedK3_map {K3' : Type*} [AddCommGroup K3'] [Module R K3']
    (supplierMap : K3 →ₗ[R] K3') : K3 →ₗ[R] K3' := supplierMap
lemma completedK3_transfer {K3' H1' : Type*} [AddCommGroup K3'] [Module R K3']
    [AddCommGroup H1'] [Module R H1'] (transfer : K3' →ₗ[R] K3)
    (c : K3 →ₗ[R] H1) (c' : K3' →ₗ[R] H1') (cor : H1' →ₗ[R] H1) :
    c.comp transfer = cor.comp c' := by sorry
lemma completedK3_extensionality (f g : K3 →ₗ[R] H1) (h : ∀ x, f x=g x) : f=g := by sorry

def rootClassK3 {Roots : Type*} (rootBloch : Roots → Bloch) (complete : Bloch →ₗ[R] K3)
    (ζ : Roots) : K3 := complete (rootBloch ζ)
lemma rootClassK3_eq_bloch {Roots : Type*} (rootBloch : Roots → Bloch)
    (complete : Bloch →ₗ[R] K3) (ζ : Roots) : rootClassK3 rootBloch complete ζ = complete (rootBloch ζ) := by sorry
lemma rootClassK3_prod {Roots : Type*} {ι : Type*} {K3i : ι → Type*}
    [∀ i, AddCommGroup (K3i i)] [∀ i, Module R (K3i i)]
    (rootBloch : Roots → Bloch) (complete : Bloch →ₗ[R] K3)
    (prod : K3 ≃ₗ[R] (∀ i, K3i i)) (rootFactor : ∀ i, Roots → K3i i) (ζ : Roots) :
    prod (rootClassK3 rootBloch complete ζ) = fun i => rootFactor i ζ := by sorry
lemma rootClassK3_map {Roots Roots' K3' : Type*} [AddCommGroup K3'] [Module R K3']
    (rootBloch : Roots → Bloch) (complete : Bloch →ₗ[R] K3)
    (map : K3 →ₗ[R] K3') (root' : Roots' → K3') (mapRoot : Roots → Roots') (ζ : Roots) :
    map (rootClassK3 rootBloch complete ζ) = root' (mapRoot ζ) := by sorry
lemma rootClassK3_inv {Roots : Type*} (rootBloch : Roots → Bloch)
    (complete : Bloch →ₗ[R] K3) (inverseRoot : Roots → Roots) (ζ : Roots) :
    rootClassK3 rootBloch complete (inverseRoot ζ) = -rootClassK3 rootBloch complete ζ := by sorry
lemma rootClassK3_mul_ord {Roots : Type*} (rootBloch : Roots → Bloch)
    (complete : Bloch →ₗ[R] K3) (integralBlochClass : Roots → Bloch)
    (order : Roots → ℕ) (ζ : Roots) :
    order ζ • rootClassK3 rootBloch complete ζ = complete (integralBlochClass ζ) := by sorry
lemma rootClassK3_extensionality {Roots : Type*} (rootBloch : Roots → Bloch)
    (complete : Bloch →ₗ[R] K3) (ζ ζ' : Roots) (h : ζ=ζ') :
    rootClassK3 rootBloch complete ζ = rootClassK3 rootBloch complete ζ' := by sorry

def localRegulator (chern : K3 ≃ₗ[R] H1) (logBK : H1 →ₗ[R] LocalL) (sign : R) :
    K3 →ₗ[R] LocalL := sign • logBK.comp chern.toLinearMap
lemma localRegulator_eq_logBK (chern : K3 ≃ₗ[R] H1) (logBK : H1 →ₗ[R] LocalL) (sign : R) :
    localRegulator chern logBK sign = sign • logBK.comp chern.toLinearMap := by sorry
lemma localRegulator_rootClass {Roots : Type*} (chern : K3 ≃ₗ[R] H1)
    (logBK : H1 →ₗ[R] LocalL) (sign : R) (rootBloch : Roots → Bloch)
    (complete : Bloch →ₗ[R] K3) (D : Roots → LocalL) (ζ : Roots) :
    localRegulator chern logBK sign (rootClassK3 rootBloch complete ζ) = D ζ := by sorry
lemma localRegulator_specialUnits {Symbols : Type*} (chern : K3 ≃ₗ[R] H1)
    (logBK : H1 →ₗ[R] LocalL) (sign : R) (presentation : Symbols → K3)
    (dilogSum : Symbols → LocalL) (x : Symbols) :
    localRegulator chern logBK sign (presentation x) = dilogSum x := by sorry
lemma localRegulator_map {K3' H1' LocalL' : Type*} [AddCommGroup K3'] [Module R K3']
    [AddCommGroup H1'] [Module R H1'] [AddCommGroup LocalL'] [Module R LocalL']
    (c : K3 ≃ₗ[R] H1) (c' : K3' ≃ₗ[R] H1') (l : H1 →ₗ[R] LocalL)
    (l' : H1' →ₗ[R] LocalL') (s : R) (mapK : K3 →ₗ[R] K3') (mapL : LocalL →ₗ[R] LocalL') :
    (localRegulator c' l' s).comp mapK = mapL.comp (localRegulator c l s) := by sorry
lemma localRegulator_transfer (reg : K3 →ₗ[R] LocalL)
    (transferK : K3 →ₗ[R] K3) (traceL : LocalL →ₗ[R] LocalL) :
    reg.comp transferK = traceL.comp reg := by sorry
lemma localRegulator_prod {ι : Type*} (reg : ∀ i : ι, K3 →ₗ[R] LocalL)
    (productReg : (ι → K3) →ₗ[R] (ι → LocalL)) (x : ι → K3) :
    productReg x = (fun i => reg i (x i)) := by sorry
lemma localRegulator_extensionality (c : K3 ≃ₗ[R] H1) (l l' : H1 →ₗ[R] LocalL) (s : R)
    (h : ∀ x, localRegulator c l s x = localRegulator c l' s x) :
    localRegulator c l s = localRegulator c l' s := by sorry
-- Concrete integral image p²O_L is supplied as a submodule. The Orzech step
-- remains the native theorem above, not a proof of any unramified source input.
theorem unramified_regulator_theorem (reg : K3 →ₗ[R] LocalL) (lattice : Submodule R LocalL) :
    Function.Injective reg ∧ reg.range = lattice := by sorry
theorem root_classes_generate {Roots : Type*} (rootBloch : Roots → Bloch)
    (complete : Bloch →ₗ[R] K3) : Submodule.span R (Set.range (rootClassK3 rootBloch complete)) = ⊤ := by sorry
theorem completedK3_bloch_description : Nonempty (Bloch ≃ₗ[R] K3) := by sorry
end LocalK3

section GlobalK3
variable {G C L : Type*} [AddCommGroup G] [AddCommGroup C] [AddCommGroup L]
def globalPadicRegulator (completion : G →+ C) (localReg : C →+ L) : G →+ L := localReg.comp completion
lemma globalPadicRegulator_component {ι : Type*} {Li : ι → Type*}
    [∀ i, AddCommGroup (Li i)] (completion : G →+ C) (localReg : C →+ (∀ i, Li i)) (x : G) (i : ι) :
    globalPadicRegulator completion localReg x i = localReg (completion x) i := by sorry
lemma globalPadicRegulator_torsion [Module ℚ L] (completion : G →+ C) (localReg : C →+ L)
    (x : G) (m : ℕ) (hm : m≠0) (hx : m • x=0) : globalPadicRegulator completion localReg x = 0 := by sorry
lemma globalPadicRegulator_integral {R : Type*} [CommRing R] [Module R L]
    (completion : G →+ C) (localReg : C →+ L) (pSquaredIntegers : Submodule R L) (x : G) :
    globalPadicRegulator completion localReg x ∈ pSquaredIntegers := by sorry
-- GQ is imported rationalized K₃; the rationalization's universal property is omitted.
def globalPadicRegulator_rat {GQ : Type*} [AddCommGroup GQ] [Module ℚ GQ] [Module ℚ L]
    (rationalReg : GQ →ₗ[ℚ] L) : GQ →ₗ[ℚ] L := rationalReg
lemma globalPadicRegulator_galois (completion : G →+ C) (localReg : C →+ L)
    (τG : G →+ G) (τL : L →+ L) :
    (globalPadicRegulator completion localReg).comp τG = τL.comp (globalPadicRegulator completion localReg) := by sorry
lemma globalPadicRegulator_extensionality (completion : G →+ C) (localReg localReg' : C →+ L)
    (h : ∀ x, globalPadicRegulator completion localReg x = globalPadicRegulator completion localReg' x) :
    globalPadicRegulator completion localReg = globalPadicRegulator completion localReg' := by sorry
end GlobalK3

section Injectivity
variable {G L : Type*} [AddCommGroup G] [Module ℚ G] [AddCommGroup L] [Module ℚ L]
def PadicK3RegulatorInjective (reg : G →ₗ[ℚ] L) : Prop := Function.Injective reg
lemma padicK3RegulatorInjective_of_totallyReal [Subsingleton G] (reg : G →ₗ[ℚ] L) :
    PadicK3RegulatorInjective reg := by sorry
lemma padicK3RegulatorInjective_iff_rank [FiniteDimensional ℚ G] (reg : G →ₗ[ℚ] L) :
    PadicK3RegulatorInjective reg ↔ Module.finrank ℚ reg.range = Module.finrank ℚ G := by sorry
lemma padicK3RegulatorInjective_baseChange {GE LE : Type*} [AddCommGroup GE] [Module ℚ GE]
    [AddCommGroup LE] [Module ℚ LE] (reg : G →ₗ[ℚ] L) (regE : GE →ₗ[ℚ] LE)
    (res : G →ₗ[ℚ] GE) (incl : L →ₗ[ℚ] LE) (hinj : Function.Injective res)
    (hcomm : regE.comp res = incl.comp reg) (hE : PadicK3RegulatorInjective regE) :
    PadicK3RegulatorInjective reg := by sorry
-- Strong source is G⊗Q_p, not the original rational group.
def StrongPadicK3RegulatorInjective {F GP LP : Type*} [Field F]
    [AddCommGroup GP] [Module F GP] [AddCommGroup LP] [Module F LP]
    (reg : GP →ₗ[F] LP) : Prop := Function.Injective reg
lemma strongPadicK3RegulatorInjective_implies {F GP LP : Type*} [Field F]
    [AddCommGroup GP] [Module F GP] [AddCommGroup LP] [Module F LP]
    [Module ℚ GP] [Module ℚ LP] (reg : G →ₗ[ℚ] L) (regP : GP →ₗ[F] LP)
    (inclG : G →ₗ[ℚ] GP) (inclL : L →ₗ[ℚ] LP) (hinj : Function.Injective inclG)
    (hcomm : ∀ x, regP (inclG x) = inclL (reg x)) (hP : StrongPadicK3RegulatorInjective regP) :
    PadicK3RegulatorInjective reg := by sorry
lemma PadicK3RegulatorInjective_extensionality (f g : G →ₗ[ℚ] L) (h : ∀ x, f x=g x) :
    PadicK3RegulatorInjective f ↔ PadicK3RegulatorInjective g := by sorry
end Injectivity
end TauCeti.PadicHodgeRegulators

namespace TauCeti.PadicHodgeRegulators
/-! Imported period and filtered realization interfaces. Admissibility,
continuity and semilinear Galois action are omitted where not yet expressible. -/
theorem hodge_tate_and_twist_conventions {K D : Type*} [Field K]
    [AddCommGroup D] [Module K D] (φ : D →ₗ[K] D) (p : K) (r : ℤ)
    (er : D) : φ er = p^(-r) • er := by sorry
theorem fundamental_exact_sequences {F Q Be DR : Type*} [Field F]
    [AddCommGroup Q] [Module F Q] [AddCommGroup Be] [Module F Be]
    [AddCommGroup DR] [Module F DR] (incl : Q →ₗ[F] Be) (modFil : Be →ₗ[F] DR) :
    Function.Injective incl ∧ Function.Exact incl modFil ∧ Function.Surjective modFil := by sorry
theorem integral_period_interface {R D : Type*} [CommRing R]
    [AddCommGroup D] [Module R D] (flLattice : Submodule R D) (dualTateBasis : D) :
    flLattice = Submodule.span R {dualTateBasis} := by sorry

-- Remaining D.3 hypotheses are the unramified p>3 source data, not arbitrary
-- analytic maps. The native residue polynomial is used in the target formula.
theorem finite_polylogarithm_reduction (p : ℕ) [Fact p.Prime]
    (scaledDilogReduction residue : ZMod p) (h0 : residue≠0) (h1 : residue≠1) :
    scaledDilogReduction = (finitePolylog p 2).eval residue / (residue-1)^p := by sorry
theorem dilogarithm_integrality {R L : Type*} [CommRing R] [AddCommGroup L] [Module R L]
    {SpecialUnits : Type*} (D : SpecialUnits → L) (pSquaredIntegers : Submodule R L) :
    ∀ z, D z ∈ pSquaredIntegers := by sorry

section GlobalComparisons
variable {G L : Type*} [AddCommGroup G] [AddCommGroup L]
-- Source presentation, localization, units and the once-pinned sign are omitted.
theorem global_special_unit_formula {Presentation : Type*} (reg : G →+ L)
    (toK3 : Presentation → G) (combinedDilogSum : Presentation → L) (ξ : Presentation) :
    reg (toK3 ξ)=combinedDilogSum ξ := by sorry
theorem global_norm_trace_compatibility {GE LE : Type*} [AddCommGroup GE] [AddCommGroup LE]
    (reg : G →+ L) (regE : GE →+ LE) (transfer : GE →+ G) (trace : LE →+ L) :
    reg.comp transfer=trace.comp regE := by sorry
theorem global_frobenius_compatibility (reg : G →+ L) (φG : G →+ G) (φL : L →+ L) :
    reg.comp φG=φL.comp reg := by sorry
theorem global_torsion_and_denominators [Module ℚ L] (reg : G →+ L)
    (x : G) (m : ℕ) (hm : m≠0) (hx : m • x=0) : reg x=0 := by sorry
-- Habiro's target, sections and formal gluing are imports; this is its regulator export.
theorem habiro_regulator_export {R : Type*} [CommRing R] [Module R L]
    (reg : G →+ L) (pSquaredIntegers : Submodule R L) :
    Set.range reg ⊆ pSquaredIntegers := by sorry
end GlobalComparisons
-- Explicit acceptance truncation of the source's cubic example; source field,
-- symbol ξ and Frobenius embedding conditions are omitted. No numeric computation.
theorem example_cubic_field_five_two {G L : Type*} [AddCommGroup G] [CommRing L]
    (reg : G →+ L) (ξ : G) (α : L) (reduce125 : L →+* ZMod 125) :
    reduce125 (reg ξ)=reduce125 (75*α^2+25*α+50) := by sorry
end TauCeti.PadicHodgeRegulators

namespace TauCeti.PadicHodgeRegulators
/-! The tests below use named supplier realizations of local/global K₃, not
invented K-theory carriers. They omit the unexpressible field, completion,
root-of-unity and source presentation hypotheses listed in the packet. -/
-- TEST unramified_rank_cubic: Q_25×Q_5 has residue degrees 2 and 1.
example [Fact (Nat.Prime 5)] {L25 : Type*} [Field L25] [Algebra ℚ_[5] L25]
    [FiniteDimensional ℚ_[5] L25] (h : Module.finrank ℚ_[5] L25=2) :
    Module.finrank ℚ_[5] (L25 × ℚ_[5]) = 3 := by sorry
-- TEST unramified_zero
example : Module.finrank ℚ (Empty → ℚ) = 0 := by sorry
-- TEST unramified_witt_compat: the upstream Witt fraction classification map.
example {F L W : Type*} [Field F] [Field L] [Field W] [Algebra F L] [Algebra F W]
    (equiv : L ≃ₐ[F] W) (φL : L →+* L) (φW : W →+* W) (x : L) :
    equiv (φL x)=φW (equiv x) := by sorry
-- TEST unramified_not_qp_zeta_p: degree p−1 differs from residue degree 1.
example (p : ℕ) (hp : 3≤p) : p-1≠1 := by sorry
-- TEST completedK3_rank_cubic
example [Fact (Nat.Prime 5)] {K3 : Type*} [AddCommGroup K3] [Module ℤ_[5] K3] :
    Module.Free ℤ_[5] (completedK3 K3) ∧ Module.finrank ℤ_[5] (completedK3 K3)=3 := by sorry
-- TEST completedK3_zero: imported K-theory finite-product equivalence.
example {K3 : Type*} [AddCommGroup K3] (emptyEquiv : K3 ≃+ (Empty → ℤ)) :
    Subsingleton (completedK3 K3) := by sorry
-- TEST completedK3_chern_compat
example {R K3 H1 : Type*} [CommRing R] [AddCommGroup K3] [Module R K3]
    [AddCommGroup H1] [Module R H1] (chern : K3 →ₗ[R] H1)
    (supplierEquiv : K3 ≃ₗ[R] H1) : chern=supplierEquiv.toLinearMap := by sorry
-- TEST completedK3_three_torsion
example [Fact (Nat.Prime 3)] {K3 : Type*} [AddCommGroup K3] [Module ℤ_[3] K3] :
    ∃ x : completedK3 K3, x≠0 ∧ (3 : ℤ_[3]) • x=0 := by sorry
section RootTests
variable {R K3 B Roots : Type*} [CommRing R] [AddCommGroup K3] [Module R K3]
    [AddCommGroup B] [Module R B]
-- TEST rootClassK3_neg_one: p>3 unramified source conditions omitted.
example (rootBloch : Roots → B) (complete : B →ₗ[R] K3) (minusOne : Roots) :
    rootClassK3 rootBloch complete minusOne=0 := by sorry
-- TEST rootClassK3_order_two_product
example (rootBloch : Roots → B) (complete : B →ₗ[R] (K3 × K3)) (minusOnePair : Roots) :
    rootClassK3 rootBloch complete minusOnePair=(0,0) := by sorry
-- TEST rootClassK3_bloch_compat
example (rootBloch : Roots → B) (complete : B →ₗ[R] K3) (ζ : Roots) :
    rootClassK3 rootBloch complete ζ=complete (rootBloch ζ) := by sorry
end RootTests
-- TEST rootClassK3_component_one: the (−1,1) symbol is inadmissible.
example : ¬ etaleAdmissible (fun i : Fin 2 => if i=0 then (-1 : ℚ) else 1) := by sorry
-- TEST localRegulator_q5_root: unramified integral root value reduced mod 125.
example [Fact (Nat.Prime 5)] {K3 : Type*} [AddCommGroup K3] [Module ℤ_[5] K3]
    (reg : K3 →ₗ[ℤ_[5]] ℤ_[5]) (teichTwoClass : K3) (red : ℤ_[5] →+* ZMod 125) :
    red (reg teichTwoClass)=25 := by sorry
-- TEST localRegulator_zero_algebra
example (x : Empty → ℚ) : x=0 := by sorry
-- TEST localRegulator_syntomic_compat
example {R K3 H1 L : Type*} [CommRing R] [AddCommGroup K3] [Module R K3]
    [AddCommGroup H1] [Module R H1] [AddCommGroup L] [Module R L]
    (c : K3 ≃ₗ[R] H1) (logBK : H1 →ₗ[R] L) (s : R) (syn : K3 →ₗ[R] L) :
    localRegulator c logBK s=s • syn := by sorry
-- TEST localRegulator_not_gros: the normalized coefficient becomes 24 ≡ 4 mod 5.
example (scaledValue : ZMod 125)
    (h : ZMod.castHom (by decide : 5 ∣ 125) (ZMod 5) scaledValue=1) :
    ZMod.castHom (by decide : 5 ∣ 125) (ZMod 5) ((25-1)*scaledValue)=4 := by sorry
section GlobalTests
variable {G C L : Type*} [AddCommGroup G] [AddCommGroup C] [AddCommGroup L] [Module ℚ L]
-- TEST globalPadicRegulator_rat_zero: source K₃(Q)=Z/48.
example (completion : G →+ C) (localReg : C →+ L) (x : G) (hx : 48 • x=0) :
    globalPadicRegulator completion localReg x=0 := by sorry
-- TEST globalPadicRegulator_torsion_zero: totally-real rational source is zero.
example [Subsingleton G] (completion : G →+ C) (localReg : C →+ L) :
    globalPadicRegulator completion localReg=0 := by sorry
-- TEST globalPadicRegulator_bloch_compat
example (completion : G →+ C) (localReg : C →+ L) (dilog : G →+ L) (ξ : G) :
    globalPadicRegulator completion localReg ξ=blochDilog dilog ξ := by sorry
end GlobalTests
-- TEST globalPadicRegulator_not_injective_claim
example : ¬ Function.Injective (0 : ℚ →ₗ[ℚ] (ℚ × ℚ)) := by sorry
-- TEST injective_rat
example : PadicK3RegulatorInjective (0 : (⊥ : Submodule ℚ ℚ) →ₗ[ℚ] ℚ) := by sorry
-- TEST injective_totally_real
example {G L : Type*} [AddCommGroup G] [Module ℚ G] [Subsingleton G]
    [AddCommGroup L] [Module ℚ L] (reg : G →ₗ[ℚ] L) : PadicK3RegulatorInjective reg := by sorry
-- TEST injective_rank_compat: after the rank-one rational identification.
example {L : Type*} [AddCommGroup L] [Module ℚ L] (reg : ℚ →ₗ[ℚ] L) :
    PadicK3RegulatorInjective reg ↔ reg 1≠0 := by sorry
-- TEST injective_not_from_rank
example : ¬ PadicK3RegulatorInjective (0 : ℚ →ₗ[ℚ] (ℚ × ℚ)) := by sorry
end TauCeti.PadicHodgeRegulators

namespace TauCeti.PadicHodgeRegulators
/-! Curve carriers `H`, `Syn`, `MS`, `Mot`, `OpenH` are imported de Rham,
rigid syntomic, modified syntomic, Adams weight-two K₂/motivic and open de Rham
carriers. All good-reduction, cohomological, weight and symbol-presentation
hypotheses not expressible at the pin are omitted. K-linearity on Syn is the
transported structure of Θ, not native semilinear Frobenius linearity. -/
section Curves
variable {K H Syn MS Mot OpenH : Type*} [Field K]
  [AddCommGroup H] [Module K H] [AddCommGroup Syn] [Module K Syn]
  [AddCommGroup MS] [Module K MS] [AddCommGroup Mot] [Module ℚ Mot]
  [AddCommGroup OpenH] [Module K OpenH] [Algebra ℚ K]
  [Module ℚ H] [Module ℚ Syn] [Module ℚ MS] [IsScalarTower ℚ K MS] [IsScalarTower ℚ K H] [IsScalarTower ℚ K Syn]
-- Syn's K structure is supplied after transport through the normalized boundary.
abbrev curveSyntomicTarget (Syn : Type*) := Syn
-- These equivalences are derived from the actual source complexes and weights.
def curveRigidToModified (β : Syn ≃ₗ[K] MS) : Syn ≃ₗ[K] MS := β
def curveSyntomicCanIso (β : Syn ≃ₗ[K] MS) (jq : H ≃ₗ[K] MS) : H ≃ₗ[K] Syn :=
  jq.trans β.symm
def curveSyntomicNormIso (β : Syn ≃ₗ[K] MS) (jq : H ≃ₗ[K] MS)
    (B : H ≃ₗ[K] H) : Syn ≃ₗ[K] H := β.trans jq.symm |>.trans B.symm
lemma curveRigidToModified_raw (β : Syn ≃ₗ[K] MS) (jp : H →ₗ[ℚ] Syn)
    (jq : H ≃ₗ[K] MS) (norm : H →ₗ[ℚ] H) :
    ((curveRigidToModified β).toLinearMap.restrictScalars ℚ).comp jp =
      (jq.toLinearMap.restrictScalars ℚ).comp norm := by sorry
-- This identity is Q_p-linear before K transport; A represents 1−φ_p/p².
lemma curveSyntomicNormIso_p (β : Syn ≃ₗ[K] MS) (jq : H ≃ₗ[K] MS)
    (B : H ≃ₗ[K] H) (jp : H ≃ₗ[ℚ] Syn) (A : H ≃ₗ[ℚ] H) (x : Syn) :
    curveSyntomicNormIso β jq B x = A.symm (jp.symm x) := by sorry
def cupTrace (traceCup : LinearMap.BilinForm K H) : LinearMap.BilinForm K H := traceCup
lemma cupTrace_frob (traceCup : LinearMap.BilinForm K H) (Φ : H →ₗ[K] H) (q : K)
    (x y : H) : cupTrace traceCup (Φ x) (Φ y) = q * cupTrace traceCup x y := by sorry
lemma cupTrace_res_sum {Place : Type*} (traceCup : LinearMap.BilinForm K H)
    (S : Finset Place) (residue : Place → K) (a b : H) :
    cupTrace traceCup a b = ∑ x ∈ S, residue x := by sorry
lemma curveSyntomicTarget_extensionality (β β' : Syn ≃ₗ[K] MS)
    (h : ∀ x, β x = β' x) : curveRigidToModified β = curveRigidToModified β' := by sorry

def openCurveSplitting (weightProjection : OpenH →ₗ[K] H) : OpenH →ₗ[K] H := weightProjection
lemma openCurveSplitting_comp_res (pD : OpenH →ₗ[K] H) (res : H →ₗ[K] OpenH) :
    (openCurveSplitting pD).comp res = LinearMap.id := by sorry
lemma openCurveSplitting_frob (pD : OpenH →ₗ[K] H) (Φo : OpenH →ₗ[K] OpenH)
    (Φ : H →ₗ[K] H) : (openCurveSplitting pD).comp Φo = Φ.comp (openCurveSplitting pD) := by sorry
lemma openCurveSplitting_mono {OpenH' : Type*} [AddCommGroup OpenH'] [Module K OpenH']
    (pD : OpenH →ₗ[K] H) (pD' : OpenH' →ₗ[K] H) (res : OpenH →ₗ[K] OpenH') :
    (openCurveSplitting pD').comp res = openCurveSplitting pD := by sorry
lemma openCurveSplitting_extensionality (p p' : OpenH →ₗ[K] H)
    (h : ∀ x, openCurveSplitting p x = openCurveSplitting p' x) :
    openCurveSplitting p = openCurveSplitting p' := by sorry

def curveSyntomicRegulator (chern : Mot →ₗ[ℚ] Syn) : Mot →ₗ[ℚ] Syn := chern
def regSynCan (can : H ≃ₗ[K] Syn) (chern : Mot →ₗ[ℚ] Syn) : Mot →ₗ[ℚ] H :=
  (can.symm.toLinearMap.restrictScalars ℚ).comp chern
def regP (norm : Syn ≃ₗ[K] H) (chern : Mot →ₗ[ℚ] Syn) : Mot →ₗ[ℚ] H :=
  (norm.toLinearMap.restrictScalars ℚ).comp chern
lemma regSynCan_eq_frob_regP (β : Syn ≃ₗ[K] MS) (jq : H ≃ₗ[K] MS)
    (B : H ≃ₗ[K] H) (chern : Mot →ₗ[ℚ] Syn) (u : Mot) :
    regSynCan (curveSyntomicCanIso β jq) chern u =
      B (regP (curveSyntomicNormIso β jq B) chern u) := by sorry
lemma regP_symbol (norm : Syn ≃ₗ[K] H) (chern : Mot →ₗ[ℚ] Syn)
    (pD : OpenH →ₗ[K] H) (invFrob : OpenH ≃ₗ[K] OpenH)
    (symbolCocycle : OpenH) (u : Mot) :
    regP norm chern u = openCurveSplitting pD (invFrob symbolCocycle) := by sorry
lemma curveSyntomicRegulator_weight_three {K2weight3 : Type*} [AddCommGroup K2weight3]
    [Module ℚ K2weight3] (chern3 : K2weight3 →ₗ[ℚ] Syn) : chern3 = 0 := by sorry
lemma curveSyntomicRegulator_extensionality (c c' : Mot →ₗ[ℚ] Syn)
    (h : ∀ u, curveSyntomicRegulator c u = curveSyntomicRegulator c' u) :
    curveSyntomicRegulator c = curveSyntomicRegulator c' := by sorry

-- Supplied div/constant-term Vologodsky or Coleman integral with residue traces.
theorem coleman_symbol_formula (norm : Syn ≃ₗ[K] H) (chern : Mot →ₗ[ℚ] Syn)
    (pair : LinearMap.BilinForm K H) (u : Mot) (ω : H)
    {Symbol Place : Type*} (symbols : Finset Symbol) (support : Symbol → Finset Place)
    (coefficient : Symbol → K) (order : Symbol → Place → K)
    (tracedConstantTermIntegral : Symbol → Place → K) :
    pair (regP norm chern u) ω =
      ∑ i ∈ symbols, coefficient i * ∑ x ∈ support i, order i x * tracedConstantTermIntegral i x := by sorry
-- H1Et, exp and etale are continuous representation suppliers. The hypotheses
-- V crystalline, no φ-fixed part, and the normalized boundary square are omitted.
theorem curve_etale_comparison {H1Et : Type*} [AddCommGroup H1Et] [Module ℚ H1Et]
    (exp : H →ₗ[ℚ] H1Et) (he : Function.Injective exp)
    (etale : Mot →ₗ[ℚ] exp.range) (norm : Syn ≃ₗ[K] H)
    (chern : Mot →ₗ[ℚ] Syn) :
    regP norm chern = (blochKatoLog exp he).comp etale := by sorry
theorem curve_regulator_functoriality {Mot' H' : Type*} [AddCommGroup Mot'] [Module ℚ Mot']
    [AddCommGroup H'] [Module ℚ H'] (reg : Mot →ₗ[ℚ] H) (reg' : Mot' →ₗ[ℚ] H')
    (pullM : Mot →ₗ[ℚ] Mot') (pullH : H →ₗ[ℚ] H')
    (traceM : Mot' →ₗ[ℚ] Mot) (traceH : H' →ₗ[ℚ] H) :
    reg'.comp pullM = pullH.comp reg ∧ reg.comp traceM = traceH.comp reg' := by sorry
end Curves

section RelativeCurves
variable {Symbol ExtOpen ExtProper Hrelative Synrelative : Type*}
  [AddCommGroup Symbol] [AddCommGroup ExtOpen] [AddCommGroup ExtProper]
  [AddCommGroup Hrelative] [AddCommGroup Synrelative]
-- Symbol is the imported Milnor symbol/tame-kernel carrier, Ext the imported
-- filtered F-MIC extension group. The relative log-smooth, coherence, filtration
-- and truncated-complex hypotheses are omitted, as are σ and the base schemes.
def relativeCurveSyntomicRegulator (symbolExtension : Symbol →+ ExtOpen) : Symbol →+ ExtOpen :=
  symbolExtension
def relativeRegulator_frobeniusCoordinate (Rσ : ExtOpen →+ Hrelative) : ExtOpen →+ Hrelative := Rσ
lemma relativeRegulator_steinberg {UnitFunctions : Type*}
    (reg : Symbol →+ ExtOpen) (symbol : UnitFunctions → UnitFunctions → Symbol)
    (f oneMinusF : UnitFunctions) : relativeCurveSyntomicRegulator reg (symbol f oneMinusF) = 0 := by sorry
lemma relativeRegulator_tameKernel {TameKernel : Type*} [AddCommGroup TameKernel]
    (properReg : TameKernel →+ ExtProper) (openReg : Symbol →+ ExtOpen)
    (incl : TameKernel →+ Symbol) (restrict : ExtProper →+ ExtOpen) :
    restrict.comp properReg = openReg.comp incl := by sorry
lemma relativeRegulator_signedComparison (reg : Symbol →+ ExtOpen)
    (Rσ : ExtOpen →+ Hrelative) (syn : Symbol →+ Synrelative)
    (coord : Synrelative →+ Hrelative) (ξ : Symbol) :
    Rσ (relativeCurveSyntomicRegulator reg ξ) = - coord (syn ξ) := by sorry
lemma relativeRegulator_ext (reg reg' : Symbol →+ ExtOpen)
    (h : ∀ x, reg x = reg' x) : relativeCurveSyntomicRegulator reg = relativeCurveSyntomicRegulator reg' := by sorry
-- Specialization requires a σ-compatible smooth point and a surviving étale
-- boundary/tame-kernel presentation, not arbitrary evaluation with fixed σ.
theorem relativeRegulator_specialise {FibreSymbol FibreH : Type*}
    [AddCommGroup FibreSymbol] [AddCommGroup FibreH]
    (relativeNormalized : Symbol →+ Hrelative) (regFibre : FibreSymbol →+ FibreH)
    (specialiseSymbol : Symbol →+ FibreSymbol) (evaluate : Hrelative →+ FibreH) :
    evaluate.comp relativeNormalized = regFibre.comp specialiseSymbol := by sorry
end RelativeCurves

section SemistableCurves
variable {F D H Hst Mot : Type*} [Field F] [CharZero F]
  [AddCommGroup D] [Module F D] [AddCommGroup H] [Module F H]
  [AddCommGroup Hst] [Module F Hst] [AddCommGroup Mot] [Module F Mot]
-- F is Q_p. φ is restricted to Q_p-scalars; no K_0-linearity is asserted.
-- Hst is imported H¹ of C_st. Curve weights make φ−1 invertible; its complex
-- identification, class representatives and Iπ comparison are omitted inputs.
def semistableCoordinates (φ : D →ₗ[F] D) (N : D →ₗ[F] D) (Iπ : D →ₗ[F] H) (p : F) :
    Hst ≃ₗ[F] (H × (LinearMap.id - p • φ).ker) := by sorry
def semistableContinuousRegulator (φ : D →ₗ[F] D) (N : D →ₗ[F] D) (Iπ : D →ₗ[F] H)
    (p : F) (reg : Mot →ₗ[F] Hst) : Mot →ₗ[F] H :=
  (LinearMap.fst F H ((LinearMap.id - p • φ).ker)).comp
    ((semistableCoordinates φ N Iπ p).toLinearMap.comp reg)
def semistableDiscreteRegulator (φ : D →ₗ[F] D) (N : D →ₗ[F] D) (Iπ : D →ₗ[F] H)
    (p : F) (reg : Mot →ₗ[F] Hst) : Mot →ₗ[F] (LinearMap.id - p • φ).ker :=
  (LinearMap.snd F H ((LinearMap.id - p • φ).ker)).comp
    ((semistableCoordinates φ N Iπ p).toLinearMap.comp reg)
-- The representative formulas are checked before quotienting by boundaries.
def semistableRepresentativeCoordinates (invφMinusOne : D ≃ₗ[F] D)
    (N : D →ₗ[F] D) (Iπ : D →ₗ[F] H) (x y : D) (z : H) : H × D :=
  (z + Iπ (invφMinusOne x), y - N (invφMinusOne x))
lemma semistableCoordinates_boundary (φMinusOne : D ≃ₗ[F] D)
    (N : D →ₗ[F] D) (Iπ : D →ₗ[F] H) (x y a : D) (z : H) :
    semistableRepresentativeCoordinates φMinusOne.symm N Iπ
      (x + φMinusOne a) (y + N a) (z - Iπ a) =
    semistableRepresentativeCoordinates φMinusOne.symm N Iπ x y z := by sorry
-- Characteristic zero, N²=0 and source period-change law are omitted inputs.
-- N²=0 on V does not imply Nρ=0; the extension can have nilpotence length 3.
lemma semistableRegulator_branchChange (β β' : Hst →ₗ[F] H)
    (ρ : Hst →ₗ[F] D) (Iπ : D →ₗ[F] H) (N : D →ₗ[F] D) (logRatio : F) (c : Hst) :
    β' c - β c = -logRatio • Iπ (ρ c) - (logRatio^2/2) • Iπ (N (ρ c)) := by sorry
lemma semistableRegulator_ext (φ : D →ₗ[F] D) (N : D →ₗ[F] D) (Iπ : D →ₗ[F] H)
    (p : F) (x y : Hst)
    (hc : (semistableCoordinates φ N Iπ p x).1 = (semistableCoordinates φ N Iπ p y).1)
    (hd : (semistableCoordinates φ N Iπ p x).2 = (semistableCoordinates φ N Iπ p y).2) : x = y := by sorry
-- Exact quotient is H/im N, derived from skew-adjointness under the cup pairing.
-- It is distinct from the totally degenerate toric quotient.
theorem semistable_pairing_quotient (B : LinearMap.BilinForm F H) (NH : H →ₗ[F] H)
    [FiniteDimensional F H] (hB : B.Nondegenerate)
    (hN : ∀ x y, B (NH x) y = - B x (NH y)) :
    ∀ x, (∀ y ∈ NH.ker, B x y = 0) ↔ x ∈ NH.range := by sorry
-- Semistable, fixed-uniformizer, second-kind and tame-trivial symbol assumptions
-- are omitted; ker N is retained explicitly. Indices and gluing are imports.
theorem semistableRegulator_symbolFormula {Vertex Edge : Type*}
    (vertices : Finset Vertex) (orientedEdgesOnce : Finset Edge)
    (B : LinearMap.BilinForm F H) (NH : H →ₗ[F] H) (continuous : Mot →ₗ[F] H)
    (u : Mot) (ω : H) (hω : NH ω = 0)
    (globalTripleIndex : Vertex → F) (harmonicDifference doubleIndex : Edge → F) :
    B (continuous u) ω = ∑ v ∈ vertices, globalTripleIndex v -
      ∑ e ∈ orientedEdgesOnce, harmonicDifference e * doubleIndex e := by sorry
-- NN boundary: etale realization factors through imported semistable H¹.
theorem semistable_input_boundary {H1 : Type*} [AddCommGroup H1] [Module F H1]
    (syn : Mot →ₗ[F] Hst) (realise : Hst →ₗ[F] H1) (etale : Mot →ₗ[F] H1) :
    realise.comp syn = etale := by sorry
end SemistableCurves
end TauCeti.PadicHodgeRegulators

namespace TauCeti.PadicHodgeRegulators
-- TEST curveTarget_projective_line: H¹_dR(P¹)=0 identifies the syntomic target with zero.
example : Subsingleton (curveSyntomicTarget (⊥ : Submodule ℚ ℚ)) := by sorry
-- TEST curveTarget_weight_one_analogue
example (q x : ℚ) (hq : q ≠ 0) : (1 - q⁻¹) * x = x - x/q := by sorry
-- TEST curveTarget_eigen_factor
example : (1 - 1 / ((5 : ℚ) * 2)) = 9 / 10 := by norm_num
-- TEST curveTarget_h2_non_example: Φ=q on H² in weight one.
example (q : ℚ) (hq : q ≠ 0) : 1 - q/q = 0 := by sorry
-- TEST curveTarget_nontrivial_residue_degree: the f=2 norm operator is essential.
example (P : ℚ) : (1 + P) * (1 - P) = 1 - P^2 := by sorry
-- TEST curveTarget_semilinear_non_example
example {K : Type*} [Field K] (σ : K →+* K) (a : K) (h : σ a ≠ a) :
    a - σ a ≠ a * (1 - σ 1) := by sorry
-- TEST splitting_p1: the residue line maps to H¹_dR(P¹)=0.
example : openCurveSplitting (0 : ℚ →ₗ[ℚ] (⊥ : Submodule ℚ ℚ)) = 0 := by sorry
-- TEST splitting_empty_boundary
example (x : ℚ) : openCurveSplitting (LinearMap.id : ℚ →ₗ[ℚ] ℚ) x = x := by sorry
-- TEST splitting_res_compat: projection composed with inclusion.
example : (openCurveSplitting (LinearMap.fst ℚ ℚ ℚ)).comp (LinearMap.inl ℚ ℚ ℚ) = LinearMap.id := by sorry
-- TEST splitting_not_residue_free: dlog t spans the residue line on G_m.
example : openCurveSplitting (0 : ℚ →ₗ[ℚ] ℚ) 1 = 0 ∧ (1 : ℚ) ≠ 0 := by norm_num [openCurveSplitting]
-- TEST regulator_constant_symbol: the rational tame-root class is zero.
example {Mot Syn : Type*} [AddCommGroup Mot] [Module ℚ Mot]
    [AddCommGroup Syn] [Module ℚ Syn] (reg : Mot →ₗ[ℚ] Syn) (constantSymbol : Mot) :
    curveSyntomicRegulator reg constantSymbol = 0 := by sorry
-- TEST regulator_diagonal_symbol: {f,f} is torsion, hence zero in Adams weight two.
example {Mot Syn : Type*} [AddCommGroup Mot] [Module ℚ Mot]
    [AddCommGroup Syn] [Module ℚ Syn] (reg : Mot →ₗ[ℚ] Syn) (diagonalSymbol : Mot)
    (h : 2 • diagonalSymbol=0) : curveSyntomicRegulator reg diagonalSymbol = 0 := by sorry
-- TEST regulator_eigen_compat is already given in the native CupTrace section.
-- TEST regulator_canonical_not_coleman
example (x : ℚ) (hx : x ≠ 0) : (9/10 : ℚ) * x ≠ x := by sorry
-- Relative tests use the imported symbol presentation and extension regulator.
-- Smooth/log geometry, coherence, unit admissibility, tame and sign conventions
-- are omitted; the expected extension and coordinate targets remain explicit.
section RelativeTests
variable {Symbol Ext H : Type*} [AddCommGroup Symbol] [AddCommGroup Ext] [AddCommGroup H]
-- TEST relativeRegulator_steinberg_test: the domain is W[t,(t−t²)⁻¹].
example (reg : Symbol →+ Ext) (steinbergSymbol : Symbol) :
    relativeCurveSyntomicRegulator reg steinbergSymbol = 0 := by sorry
-- TEST relativeRegulator_zero_symbol
example (reg : Symbol →+ Ext) (Rσ : Ext →+ H) :
    relativeCurveSyntomicRegulator reg 0 = 0 ∧ Rσ (reg 0) = 0 := by sorry
-- TEST relativeRegulator_absolute_fibre
example (reg : Symbol →+ Ext) (Rσ : Ext →+ H) (absoluteSynCoordinate : Symbol →+ H)
    (ξ : Symbol) : Rσ (relativeCurveSyntomicRegulator reg ξ) = -absoluteSynCoordinate ξ := by sorry
-- TEST relativeRegulator_nonzero_tame
example {Tame : Type*} [AddCommGroup Tame] (tame : Symbol →+ Tame) (ξ : Symbol)
    (h : tame ξ ≠ 0) : ξ ∉ tame.ker := by sorry
-- TEST relativeRegulator_sign_test
example {F : Type*} [Field F] [CharZero F] (coordinate : F) (h : coordinate ≠ 0) :
    -coordinate ≠ coordinate := by sorry
end RelativeTests
section SemistableTests
variable {F D H : Type*} [Field F] [AddCommGroup D] [Module F D]
  [AddCommGroup H] [Module F H]
-- TEST semistableCoordinates_good_reduction: no discrete fixed-eigenvalue part.
example (φ : D →ₗ[F] D) (p : F) (h : (LinearMap.id - p • φ).ker = ⊥)
    (y : (LinearMap.id - p • φ).ker) : y = 0 := by sorry
-- TEST semistableCoordinates_zero
example (a : D ≃ₗ[F] D) (N : D →ₗ[F] D) (Iπ : D →ₗ[F] H) :
    semistableRepresentativeCoordinates a N Iπ 0 0 0 = (0,0) := by sorry
-- TEST semistableCoordinates_boundary_test
example (a : D ≃ₗ[F] D) (N : D →ₗ[F] D) (Iπ : D →ₗ[F] H) (x y w : D) (z : H) :
    semistableRepresentativeCoordinates a.symm N Iπ (x+a w) (y+N w) (z-Iπ w) =
    semistableRepresentativeCoordinates a.symm N Iπ x y z := by sorry
-- TEST semistableCoordinates_discrete_non_example
example (a : D ≃ₗ[F] D) (N : D →ₗ[F] D) (Iπ : D →ₗ[F] H) (y : D) (hy : y ≠ 0) :
    (semistableRepresentativeCoordinates a N Iπ 0 y 0).1 = 0 ∧
    (semistableRepresentativeCoordinates a N Iπ 0 y 0).2 ≠ 0 := by sorry
end SemistableTests
-- TEST semistableCoordinates_weight_non_example: a weight −2 scalar block with eigenvalue −1/5, without the fixed eigenvalue.
example : (LinearMap.id - (5 : ℚ) • (-((5 : ℚ)⁻¹) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ))).ker = ⊥ ∧
    ¬ Subsingleton ℚ := by sorry
-- TEST semistableCoordinates_branch_quadratic: N(a,b)=(b,0), ρ=(0,1).
example (logRatio : ℚ) :
    -logRatio • ((0,1) : ℚ × ℚ) - (logRatio^2/2) • ((1,0) : ℚ × ℚ) =
      (-logRatio^2/2,-logRatio) := by sorry
end TauCeti.PadicHodgeRegulators
