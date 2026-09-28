# BP-ModularSymbolsPadicLFunctions: modular symbols (first checkpoint)

Claude Code — session `cc-39fac3`, 28 September 2026. Refs #777. **Status: partial checkpoint.** Scope L0–L4. L0 is `partial`; L1–L4 are `not_read`.

## Contents

11 L0 nodes from Pollack–Stevens (Ann. Sci. ÉNS 2011) §2.1–2.2 and §3.4:
- `steinberg-module`, `modular-symbols` (planet);
- `unimodular-map`, `manin-surjectivity`, `manin-relations` (planet), `coset-basis`;
- `polynomial-coefficients`, `hecke-monoid`, `hecke-operators` (planet);
- `involution-at-infinity`, `plus-minus-decomposition`.

AUDIT-26 was read: L0 is not built. Mathlib supplies P¹, the GL₂ action, congruence subgroups and polynomial modules. Tau Ceti supplies the commutative Γ₀(N) Hecke ring, which the Hecke-operator node uses for commutativity.

**Design choices**
- **Right actions:** Pollack–Stevens' right action is encoded as a left representation, ρ(γ) = (·)|γ^{-1}.
- **Manin's relations over SL₂(ℤ):** they are stated there, with 1 − (−1) added, because Mathlib has SL₂(ℤ) but no convenient PSL₂(ℤ).
- **V_k:** it uses the adjugate action, so the action is defined on all integral matrices of nonzero determinant.

**Source proofs.** Pollack–Stevens cite Manin for the relations without proof. The packet gives the Farey-tessellation proof and notes the amalgam alternative, PSL₂(ℤ) ≅ ℤ/2 ∗ ℤ/3. No source mistakes were found in the sections read.

## Prototype

`suggested/ModularSymbolsPadicLFunctions.lean` has signatures for:
- Δ₀, its representation and generators;
- modular symbols;
- d, surjectivity and the kernel;
- the coset basis;
- V_k and its action;
- Σ₀(N), the slash action, T_ℓ and U_q, with preservation and commutativity;
- ι.

It also has unit-test examples. Compiled at the pins with the v4.34.0-rc2 `lean` against the prebuilt Mathlib 082e2d3 oleans (one compile at a time, at least 20 GB free, no lake): **0 errors**, `sorry` warnings only.

## Checks

- `scripts/check_blueprint.py` with the pinned declaration index: 0 errors, 0 warnings.
- `research/blueprint/intake.py check-files`: no problems.

## Next steps

1. **L0:**
   - solve the Manin relations (§§2.3–2.5, Theorem 2.6);
   - H¹_c and parabolic cohomology with boundary maps, and the comparison Symb ≅ H¹_c (Ash–Stevens Proposition 4.2);
   - diamond operators and nebentypus;
   - Eichler–Shimura period maps, with elliptic stabilisers handled through an auxiliary level; Tau Ceti's CuspForm and Newform API is the analytic carrier.
2. **L1:** periods and critical values, with the Mellin formula; Mathlib's CuspForm.Λ_eq_mellin is partial support.
3. **L2:** distributions D_k and the control theorem (Pollack–Stevens §§3–5). This needs LocallyAnalyticDistributions and PadicMeasuresIwasawaAlgebras.
4. **L3 and L4.**
