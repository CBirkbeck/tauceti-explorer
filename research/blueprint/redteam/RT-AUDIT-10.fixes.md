# RT-AUDIT-10: fixes

Fixer: Claude Code, session `cc-39fac3`, 29 September 2026 (issue #4005, job FIX-RT-AUDIT-10).
- Findings: `RT-AUDIT-10.result.json`.
- Verdicts: `RT-AUDIT-10.review.json`.
- Six findings, all confirmed.

The only edited deliverable is `research/blueprint/audit/AUDIT-10.result.json`.
- No target's `library` status and no layer verdict changed, as every finding requires.
- Each cited declaration was read in the pinned trees: Tau Ceti `f790474821cf`, Mathlib `082e2d37e8b0`, the local baseline copies of both.
- Line numbers are those of the declarations there.
- The orchestrator merges audit fixes into the library audit (PROTOCOL.md §17).

## /1 (medium): R12.5 target 3, T_p and V_d commute only away from the level

**Checked.** `HeckeRing.GL2.heckeTCuspNat_levelRaise` (TauCeti/NumberTheory/ModularForms/HeckeSlash/Degeneracy.lean:88) assumes `d * M ∣ N`, `p.Prime` and `Nat.Coprime p N`. It compares T_p at level N after V_d with V_d after T_p at level M. Its docstring explains why p ∣ N fails.

**Change.** The note's unqualified "T_p ∘ V_d = V_d ∘ T_p" now reads "T_p^(N) ∘ V_d = V_d ∘ T_p^(M) for d·M ∣ N and p prime with p ∤ N". It adds that no bad-prime relation is supplied, without claiming that every bad-prime pair fails. The declaration is added as `related` evidence, as the review asks. The target stays `partial`, and the geometric pullback/trace comparison stays absent.

## /2 (medium): R14.1 target 2, the Petersson identity changes the domain

**Checked.** `UpperHalfPlane.peterssonInner_slash_left_adjugateGL` (TauCeti/NumberTheory/ModularForms/Petersson/Adjoint.lean:160) assumes `0 < det g` and proves `peterssonInner k S (f ∣[k] g) h = peterssonInner k (g • S) f (h ∣[k] adjugateGL g)`.

**Change.** "⟪f∣α, h⟫ = ⟪f, h∣α^ι⟫" becomes "the change-of-domain slash identity ⟪f∣g, h⟫_S = ⟪f, h∣g^ι⟫_(g•S) for g with det g > 0", noted as not a same-domain adjoint identity. As the review says, no integrability premise is added.

The statement that T_n* = ⟨n⟩⁻¹T_n is not proved, the `related` citation, the `partial` target and the unbuilt layer are all unchanged.

## /3 (medium): M5 target 1, the kernel count needs n invertible

**Checked.** `TauCeti.Isogeny.card_ker_mulByIntIsogeny` (KernelCard.lean:117) assumes `[IsAlgClosed F]`, the elliptic Weierstrass setup, `psiFunctionField W n ≠ 0` and `(n : F) ≠ 0`. It gives `Nat.card (mulByIntIsogeny W hn).ker = n.natAbs ^ 2`.

**Change.** The note now says: for an elliptic Weierstrass curve over an algebraically closed F and n invertible in F, the multiplication-by-n kernel has |n|² points. It adds that this is a point count, not a rank statement about the kernel scheme. The genus-one moduli comparison stays absent.

## /4 (medium, missing): C0 target 5, Gordan's lemma in equalizer form exists

**Checked.** `Submonoid.fg_eqLocusM` (Mathlib/GroupTheory/Finiteness.lean:627) and its `to_additive` form state that equalizers of maps from a canonically ordered, well-quasi-ordered (additive) monoid to a cancellative one are finitely generated. The additive docstring calls the ℕ^k case "a version of Gordan's lemma". The proof uses `Submonoid.fg_of_divisive`, whose declaration is at line 586.

**Change.** The sentence "its lattice points σ^∨ ∩ M and Gordan's lemma are not [in Mathlib]" is replaced by the review's limited form:
- the equalizer / nonnegative-integer-solution form of Gordan's lemma exists;
- still to be connected are the integral dual-character monoid σ^∨ ∩ M, its identification with a solution monoid, and the cone-specific finite-generation and localization API.

`Submonoid.fg_eqLocusM` is added as `related`. The target stays `partial` and C0 stays partly built; no affine toric scheme U_σ is claimed.

## /5 (medium): D3 target 0, holomorphic vector bundles exist

**Checked.** `ContMDiffVectorBundle` (Mathlib/Geometry/Manifold/VectorBundle/Basic.lean:305) is over an arbitrary nontrivially normed field 𝕜, with transition maps `ContMDiffOn IB 𝓘(𝕜, F →L[𝕜] F) n`. With 𝕜 = ℂ and n = ω these are complex-analytic transition maps. Transition data yields such a bundle through `VectorBundleCore.IsContMDiff` (line 586) and `VectorBundleCore.instContMDiffVectorBundle` (598); trivial examples are at 610.

**Change.** "smooth vector bundles … no holomorphic bundles" is replaced by an entry crediting complex-analytic vector bundles on complex manifolds, through the class over ℂ at order ω and the transition-data construction. It keeps the missing items:
- the local-system-to-holomorphic-bundle comparison;
- filtrations by holomorphic subbundles;
- flat connections;
- Griffiths transversality;
- any theory on singular analytic spaces.

`VectorBundleCore.instContMDiffVectorBundle` is added as `related`. The VHS target stays `absent` and D3 not built.

## /6 (low): D1 target 0, diagonal map versus weight cocharacter

**Checked.** content/campaign/ShimuraData/README.md fixes h(z) acting on V^(p,q) by z^(−p) z̄^(−q). It calls h restricted to the real diagonal the central restriction, and its inverse the weight cocharacter.

**Change.** In the target, "its weight (diagonal) and norm maps" becomes "its diagonal map G_m → S (h composed with it is the central restriction, whose inverse is the weight cocharacter) and norm map". The absence classification and every other note are unchanged.

## Checks

- `python3 research/blueprint/intake.py check-files` on both deliverables: 0 problems.
- The unit suite passes.
- The JSON keeps its original one-space indentation. Every edited string was changed by exact replacement, so nothing else moved.
