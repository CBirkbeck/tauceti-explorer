/-
Suggested Lean prototypes for the roadmap "P-adic Hodge theory and geometric comparison"
(PadicHodgeTheory), part R06.5: stages R06.5 (geometric comparison theorems) and R06.6 (arithmetic
consequences).

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/PadicHodgeTheory--R06.5.md` is definitive. The statements below suggest Lean
forms so that contributors and reviewers converge on names and signatures. Every proof of a planned
result is `sorry`, and definitions of objects the pinned libraries lack are signatures with `sorry`
bodies; nothing here is claimed to be formalised (implementationStatus = unchecked). Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Only Mathlib
is imported.

Names are relative to the namespace `TauCeti.PadicHodge` and agree with the `api` and `tests` names of
the packet `research/blueprint/packets/PadicHodgeTheory--R06.5.json`. Unit tests are `example`s whose
docstring begins "Test `<name>`". Objects of other roadmaps are never invented here: the Tate module
`V_p(A)` (ArithmeticGaloisRepresentations R01.6), the period functors `D_cris`, `D_st`, `D_dR` and
filtered `(φ, N)`-modules (PadicHodgeTheory R06.2, part P7), the Tate curve (Tau Ceti EllipticCurves
Layer 4) and crystalline cohomology (CrystallineCohomology, CohomologyComparisons CP.2) are not
available at the pinned commits, so the theorems that need them are comments naming the missing object.

What is prototyped is the linear algebra those theorems compute:
* the Kummer cocycle `c_q` and the representation `g ↦ !![χ g, c_q g; 0, 1]` of R06.6;
* the normal form of the Tate curve's filtered `(φ, N)`-module and its L-invariant;
* the ordinary/supersingular dichotomy of the Frobenius trace used in R06.5.
-/

import Mathlib.NumberTheory.Cyclotomic.CyclotomicCharacter
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Algebra.Polynomial.Basic

namespace TauCeti.PadicHodge

open Matrix

variable (p : ℕ) [Fact p.Prime]

/-! ## R06.6 — Kummer representations (`PadicHodgeTheory:R06.6/kummer-representation`) -/

/-- A compatible system of `p`-power roots of `q` in `L`: `root 0 = q` and `root (n+1) ^ p = root n`. -/
structure CompatibleRoots (L : Type*) [CommRing L] (q : L) where
  /-- The chosen `p^n`-th root of `q`. -/
  root : ℕ → L
  root_zero : root 0 = q
  root_pow : ∀ n, root (n + 1) ^ p = root n

/-- The system `(q^{(n)})^a` of `p`-power roots of `q ^ a`. -/
def CompatibleRoots.pow {L : Type*} [CommRing L] {q : L} (r : CompatibleRoots p L q) (a : ℕ) :
    CompatibleRoots p L (q ^ a) where
  root n := r.root n ^ a
  root_zero := by rw [r.root_zero]
  root_pow n := sorry

/-- A `1`-cocycle of `G` with values in `ℤ_[p]` for the action through `χ`:
`c (g * h) = c g + χ g * c h`. -/
structure KummerCocycle (G : Type*) [Monoid G] (χ : G →* ℤ_[p]ˣ) where
  /-- The underlying function. -/
  toFun : G → ℤ_[p]
  map_mul' : ∀ g h, toFun (g * h) = toFun g + (χ g : ℤ_[p]) * toFun h

namespace KummerCocycle

variable {p} {G : Type*} [Monoid G] {χ : G →* ℤ_[p]ˣ}

instance : CoeFun (KummerCocycle p G χ) (fun _ => G → ℤ_[p]) := ⟨KummerCocycle.toFun⟩

/-- `c` is a coboundary: `c g = (χ g − 1) * b` for some `b`. -/
def IsCoboundary (c : KummerCocycle p G χ) : Prop :=
  ∃ b : ℤ_[p], ∀ g, c g = ((χ g : ℤ_[p]) - 1) * b

/-- The zero cocycle (the split extension `ℚ_p(1) ⊕ ℚ_p`). -/
noncomputable def zero : KummerCocycle p G χ := ⟨fun _ => 0, fun _ _ => by simp⟩

theorem map_one (c : KummerCocycle p G χ) : c 1 = 0 := sorry

end KummerCocycle

/-- The Kummer cocycle `c_q` of `q` and a compatible system of `p`-power roots, for the cyclotomic
character of `L`: `g (root n) = root n * ζ_{p^n} ^ (c_q g)`. -/
noncomputable def kummerCocycleOf (L : Type*) [Field L] [∀ i, HasEnoughRootsOfUnity L (p ^ i)]
    {q : L} (r : CompatibleRoots p L q) : KummerCocycle p (L ≃+* L) (cyclotomicCharacter L p) :=
  sorry

/-- `c_{q^a} = a • c_q` for the system `(q^{(n)})^a`. -/
theorem kummerCocycleOf_pow (L : Type*) [Field L] [∀ i, HasEnoughRootsOfUnity L (p ^ i)]
    {q : L} (r : CompatibleRoots p L q) (a : ℕ) (g : L ≃+* L) :
    kummerCocycleOf p L (r.pow p a) g = (a : ℤ_[p]) * kummerCocycleOf p L r g :=
  sorry

variable {p}

/-- The Kummer representation in the basis `(e, f)`: `g ↦ !![χ g, c g; 0, 1]`. -/
noncomputable def kummerRep {G : Type*} [Monoid G] {χ : G →* ℤ_[p]ˣ} (c : KummerCocycle p G χ) :
    G →* Matrix (Fin 2) (Fin 2) ℚ_[p] where
  toFun g := !![(((χ g : ℤ_[p]ˣ) : ℤ_[p]) : ℚ_[p]), ((c g : ℤ_[p]) : ℚ_[p]); 0, 1]
  map_one' := sorry
  map_mul' := sorry

theorem kummerRep_apply {G : Type*} [Monoid G] {χ : G →* ℤ_[p]ˣ} (c : KummerCocycle p G χ) (g : G) :
    kummerRep c g = !![(((χ g : ℤ_[p]ˣ) : ℤ_[p]) : ℚ_[p]), ((c g : ℤ_[p]) : ℚ_[p]); 0, 1] :=
  rfl

/-- Test `kummerRep_one`: the identity acts trivially. -/
example {G : Type*} [Monoid G] {χ : G →* ℤ_[p]ˣ} (c : KummerCocycle p G χ) : kummerRep c 1 = 1 :=
  map_one _

/-- Test `kummerRep_zero`: the zero cocycle gives the split extension `diag(χ, 1)`. -/
example {G : Type*} [Monoid G] {χ : G →* ℤ_[p]ˣ} (g : G) :
    kummerRep (KummerCocycle.zero : KummerCocycle p G χ) g =
      !![(((χ g : ℤ_[p]ˣ) : ℤ_[p]) : ℚ_[p]), 0; 0, 1] :=
  sorry

/-- Test `kummerRep_sub`: `e` spans a copy of `ℚ_p(1)`, on which `G` acts by `χ`. -/
example {G : Type*} [Monoid G] {χ : G →* ℤ_[p]ˣ} (c : KummerCocycle p G χ) (g : G) :
    kummerRep c g 0 0 = (((χ g : ℤ_[p]ˣ) : ℤ_[p]) : ℚ_[p]) ∧ kummerRep c g 1 0 = 0 := by
  simp [kummerRep_apply]

/-- Test `kummerCocycleOf_root_of_unity`: a root of unity of `p`-power order has a coboundary
Kummer cocycle. -/
example (L : Type*) [Field L] [∀ i, HasEnoughRootsOfUnity L (p ^ i)] {ζ : L} {m : ℕ}
    (hζ : ζ ^ p ^ m = 1) (r : CompatibleRoots p L ζ) : (kummerCocycleOf p L r).IsCoboundary :=
  sorry

/-- Test `kummerCocycleOf_p_not_isCoboundary`: over an algebraically closed field containing `ℚ_[p]`,
the Kummer cocycle of `p` is not a coboundary (`V(p)` does not split). -/
example (L : Type*) [Field L] [Algebra ℚ_[p] L] [IsAlgClosed L] [∀ i, HasEnoughRootsOfUnity L (p ^ i)]
    (r : CompatibleRoots p L (algebraMap ℚ_[p] L p)) : ¬ (kummerCocycleOf p L r).IsCoboundary :=
  sorry

/-! ## R06.6 — the Tate curve (`PadicHodgeTheory:R06.6/tate-curve-filtered-phi-n-module`,
`PadicHodgeTheory:R06.6/tate-curve-l-invariant`)

Normal form over `ℚ_[p]` (the case `K = ℚ_p`) in the basis `(x, y)`: `φ = diag(p⁻¹, 1)`,
`N = !![0, v; 0, 0]`, `Fil⁰ = ℚ_p (y + ℓ x)`, with `v = v_p(q)` and `ℓ = log_p(q)` (`log_p(p) = 0`). -/

variable (p) in
/-- A Tate-type filtered `(φ, N)`-module in normal form: the valuation `v ≠ 0` and the value `ℓ`. -/
structure TateTypeModule where
  /-- `v_p(q)`. -/
  v : ℚ
  v_ne_zero : v ≠ 0
  /-- `log_p(q)`. -/
  ell : ℚ_[p]

namespace TateTypeModule

/-- The matrix of `φ`. -/
noncomputable def phi (_ : TateTypeModule p) : Matrix (Fin 2) (Fin 2) ℚ_[p] :=
  !![(p : ℚ_[p])⁻¹, 0; 0, 1]

/-- The matrix of `N`. -/
noncomputable def mono (D : TateTypeModule p) : Matrix (Fin 2) (Fin 2) ℚ_[p] :=
  !![0, (D.v : ℚ_[p]); 0, 0]

/-- Coordinates of the generator `y + ℓ x` of `Fil⁰`. -/
noncomputable def fil0 (D : TateTypeModule p) : Fin 2 → ℚ_[p] := ![D.ell, 1]

/-- `Nφ = pφN`. -/
theorem mono_phi (D : TateTypeModule p) : D.mono * D.phi = (p : ℚ_[p]) • (D.phi * D.mono) :=
  sorry

/-- The L-invariant `ℓ / v`. -/
noncomputable def lInvariant (D : TateTypeModule p) : ℚ_[p] := D.ell / (D.v : ℚ_[p])

/-- The module `D_q` from `v_p(q)` and `log_p(q)`. -/
def ofKummer (v : ℚ) (hv : v ≠ 0) (logq : ℚ_[p]) : TateTypeModule p := ⟨v, hv, logq⟩

/-- Isomorphism of normal forms: `x ↦ αx`, `y ↦ βy` carrying `N` and `Fil⁰` to those of `D'`. -/
def Iso (D D' : TateTypeModule p) : Prop :=
  ∃ α β : ℚ_[p], α ≠ 0 ∧ β ≠ 0 ∧ (D.v : ℚ_[p]) * α = β * (D'.v : ℚ_[p]) ∧ D.ell * α = β * D'.ell

theorem iso_iff_lInvariant (D D' : TateTypeModule p) : Iso D D' ↔ D.lInvariant = D'.lInvariant :=
  sorry

/-- Test `lInvariant_ofKummer_p`: for `q = p` (`v = 1`, `ℓ = 0`) the L-invariant is `0`. -/
example : (ofKummer 1 one_ne_zero (0 : ℚ_[p])).lInvariant = 0 := by
  simp [lInvariant, ofKummer]

/-- Test `lInvariant_pow`: the isogenous curve `E_{q^n}` has the same L-invariant. -/
example (D : TateTypeModule p) (n : ℕ) (hn : n ≠ 0) :
    (⟨n * D.v, mul_ne_zero (Nat.cast_ne_zero.mpr hn) D.v_ne_zero, n * D.ell⟩ :
      TateTypeModule p).lInvariant = D.lInvariant :=
  sorry

-- Test `lInvariant_11a1`: not stated; needs the 11-adic logarithm of the Tate parameter of 11a1
-- (v = 5, L ≡ 11·10225 mod 11^5, computed in the packet's acceptance data).

-- Test `not_wa_of_fil_eq_ker`: not stated; needs weak admissibility of filtered (φ, N)-modules
-- (PadicHodgeTheory R06.2, `FilteredPhiNModule` of part P7).

/-- Test `ell_not_invariant`: `(v, ℓ)` and `(2v, 2ℓ)` are isomorphic, yet `ℓ ≠ 2ℓ` when `ℓ ≠ 0`. -/
example (D : TateTypeModule p) (h : D.ell ≠ 0) :
    Iso D ⟨2 * D.v, mul_ne_zero two_ne_zero D.v_ne_zero, 2 * D.ell⟩ ∧ D.ell ≠ 2 * D.ell :=
  sorry

end TateTypeModule

/-! ## R06.5 — good ordinary and supersingular elliptic curves
(`PadicHodgeTheory:R06.5/elliptic-curve-ordinary-supersingular`) -/

/-- The characteristic polynomial `X² − (a/q) X + 1/q` of the linear `φ^f` on `D_cris(V_p(E))`. -/
noncomputable def frobCharpolyDcris (a : ℤ) (q : ℕ) : Polynomial ℚ :=
  Polynomial.X ^ 2 - Polynomial.C ((a : ℚ) / q) * Polynomial.X + Polynomial.C (1 / (q : ℚ))

/-- Ordinary trace at the prime `ℓ`: `ℓ ∤ a`. -/
abbrev IsOrdinaryTrace (ℓ : ℕ) (a : ℤ) : Prop := ¬ (ℓ : ℤ) ∣ a

/-- Acceptance: 11a1 at `p = 3` has `a_3 = -1`, ordinary. -/
example : IsOrdinaryTrace 3 (-1) := by decide

/-- Acceptance: 11a1 at `p = 19` has `a_19 = 0`, supersingular. -/
example : ¬ IsOrdinaryTrace 19 0 := by decide

/-- Acceptance: 11a1 at `p = 2` has `a_2 = -2`, supersingular. -/
example : ¬ IsOrdinaryTrace 2 (-2) := by decide

/-! ## Theorems needing objects of other roadmaps

* `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`: not stated; needs étale and
  crystalline cohomology of a smooth proper `𝒪_K`-scheme (CohomologyComparisons CP.2,
  CrystallineCohomology) and `D_cris` (R06.2).
* `PadicHodgeTheory:R06.5/abelian-scheme-dcris`: not stated; needs `V_p(A)` (ArithmeticGaloisRepresentations
  R01.6), abelian schemes over `𝒪_K` and `H¹_cris`.
* `PadicHodgeTheory:R06.5/abelian-variety-hodge-tate-weights`: not stated; needs `V_p(A)` for
  `TauCeti.AlgebraicGeometry.AbelianVariety` and `D_dR`.
* `PadicHodgeTheory:R06.5/weil-pairing-duality`: not stated; needs the Weil pairing
  (AbelianSchemesAndArithmeticModuli A3).
* `PadicHodgeTheory:R06.5/elliptic-curve-ordinary-supersingular`: only the trace dichotomy above; the
  slope statement needs `D_cris(V_p(E))`.
* `PadicHodgeTheory:R06.6/kummer-representations-semistable`: not stated; needs `B_st` and `D_st` (R06.1–R06.2).
* `PadicHodgeTheory:R06.6/tate-curve-tate-module`: not stated; needs the Tate curve and its
  uniformisation (Tau Ceti EllipticCurves Layer 4).
* `PadicHodgeTheory:R06.6/good-reduction-iff-crystalline`: not stated; needs `V_p(A)` and crystalline
  representations; its elliptic form would use `WeierstrassCurve.HasGoodReduction`.
* `PadicHodgeTheory:R06.6/semistable-reduction-semistable`: not stated; needs Raynaud's uniformisation
  (NeronModelsAndSemistableAbelianVarieties R11.3).
* `PadicHodgeTheory:R06.6/multiplicative-reduction-elliptic-curves`: not stated; would use
  `WeierstrassCurve.HasSplitMultiplicativeReduction` and `WeierstrassCurve.HasMultiplicativeReduction`
  with `V_p(E)` and `D_st`.
* `PadicHodgeTheory:R06.6/local-global-compatibility-good-reduction`: not stated; needs Weil–Deligne
  representations (R06.3, ArithmeticGaloisRepresentations R01.2) and `V_ℓ(A)`.
-/

end TauCeti.PadicHodge
