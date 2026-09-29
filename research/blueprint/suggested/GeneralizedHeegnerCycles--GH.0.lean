/-
Suggested Lean prototypes for the roadmap "Generalized Heegner cycles and their Iwasawa variation"
(GeneralizedHeegnerCycles), part GH.0 (stages GH.0–GH.7); checkpoints 1–2 plan stage GH.0 and the core of GH.1.

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/GeneralizedHeegnerCycles--GH.0.md` is definitive. The statements below suggest Lean forms so
that contributors and reviewers converge on names and signatures. A planned result whose proof is not short is
`sorry`, and nothing here is claimed to be formalised (implementationStatus = unchecked). Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Only Mathlib is imported.

The geometric carriers — the CM elliptic curve A over the Hilbert class field, the Kuga–Sato variety W_r
(ModularCurvesPartII R14.3), X_r = W_r × A^r and the ring of correspondences (MotivicEtaleKTheory M.4) — are not
available at the pinned commits. The compiled part prototypes the group-ring algebra of the projectors and the
dimension counts. Names are relative to `TauCeti.GeneralizedHeegner` and agree with the packet.

Suggested signatures on the geometric carriers:

  structure CMCurve (K : Type) [Field K] [NumberField K] (H : Type) [Field H] [Algebra K H] where ...
  def epsA (A : CMCurve K H) (r : ℕ) : Correspondence (A ^ r) (A ^ r) ⊗ ℚ
  theorem epsA_image (j : ℕ) : (epsA A r).action (deRham (A ^ r) j) = if j = r then Sym^r (deRham A 1) else ⊥
  def X (r : ℕ) := W r ×ˢ (A ^ r)
  def epsX (r : ℕ) := epsW r * epsA A r
  theorem epsX_image : (epsX r).action (deRham (X r)) = H1par C (L r) ⊗ Sym^r (deRham A 1)
-/

import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.GroupTheory.Perm.Sign

namespace TauCeti.GeneralizedHeegner

open MonoidAlgebra

/-! ## Character idempotents (`GeneralizedHeegnerCycles:GH.0/cm-projector-and-symmetric-power`) -/

/-- The idempotent `(1/|G|) Σ χ(g) g` of a character `χ : G → ℚˣ` of a finite group, in `ℚ[G]`. For
`G = μ₂^r ⋊ S_r` and `χ = j` this is `ε_A`. -/
noncomputable def charIdempotent {G : Type*} [Group G] [Fintype G] (χ : G →* ℚˣ) : MonoidAlgebra ℚ G :=
  (Fintype.card G : ℚ)⁻¹ • ∑ g : G, single g ((χ g : ℚ))

/-- Idempotence of a character idempotent (`epsA_idem`). -/
theorem charIdempotent_mul_self {G : Type*} [Group G] [Fintype G] (χ : G →* ℚˣ) :
    charIdempotent χ * charIdempotent χ = charIdempotent χ := by
  sorry

/-! ## Dimension counts -/

/-- Test `epsA_dim`: `dim Sym^r H¹(A) = r + 1`, the binomial coefficient `C(r + 1, r)` for a 2-dimensional `H¹`. -/
example (r : ℕ) : Nat.choose (r + 1) r = r + 1 := Nat.choose_succ_self_right r

/-- Test `X_dim`: `dim X_r = (r + 1) + r = 2r + 1`. -/
example (r : ℕ) : (r + 1) + r = 2 * r + 1 := by omega

/-- The order of `Ξ_r = μ₂^r ⋊ S_r` is `2^r · r!`, the denominator of `ε_A` (`epsA_denominator`); as a set `Ξ_r` is
`μ₂^r × S_r`, modelled here with `μ₂ ≃ Bool`. -/
example (r : ℕ) : Fintype.card ((Fin r → Bool) × Equiv.Perm (Fin r)) = 2 ^ r * r.factorial := by
  simp [Fintype.card_prod, Fintype.card_perm]

/-! ## GH.1: cycles and Abel–Jacobi maps (`GeneralizedHeegnerCycles:GH.1/…`)

Suggested signatures on the geometric carriers (not importable here):

  structure IsogPair (A : CMCurve K H) where (A' : EllipticCurve K̄) (φ : A ⟶ A')
  def gHC (p : IsogPair A) (h : p.IsPrimeToN N) : CH (X r) (r + 1) ⊗ ℚ := (epsX r).act (upsilon p h)
  theorem gHC_homologically_trivial (hr : 1 ≤ r) : cycleClass (gHC p h) = 0
  def ajEt (F) : CH0 (X r) (r + 1) F →ₗ[ℚ] H1 (G F) (epsX • H (2*r+1) (X r) (r+1))
  def ajP (F) [IsUnramified ℚ_[p] F] : CH0 (X r) (r + 1) F →ₗ[ℚ] Module.Dual F (S (r+2) Γ F ⊗ Sym r (H1dR A F))
-/

/-- Test `upsilon_codim`: `Υ_φ` has dimension `r` in `X_r` of dimension `2r + 1`, hence codimension `r + 1`. -/
example (r : ℕ) : (2 * r + 1) - r = r + 1 := by omega

end TauCeti.GeneralizedHeegner
