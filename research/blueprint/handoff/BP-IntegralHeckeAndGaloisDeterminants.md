# BP-IntegralHeckeAndGaloisDeterminants: polynomial laws and determinants (first checkpoint)

Claude Code — session `cc-39fac3`, 28 September 2026. Refs #758. **Status: partial checkpoint.** Scope IHG.0–IHG.6. IHG.0 and IHG.1 are `partial`; IHG.2–IHG.6 are `not_read`.

## Second checkpoint (same session, 28 September 2026)

19 more nodes from Chenevier §1.17–1.21, Corollary 1.14 and §2.30–2.33:
- **IHG.0:**
  - `law-of-linear-map`;
  - `polynomial-law-kernel`, with `polynomial-law-factors-through-kernel`, `kernel-quotient-faithful` and `kernel-base-change` (Lemma 1.18);
  - `determinant-kernel-characterisation` and `determinant-kernel-ideal` (Lemma 1.19);
  - `characteristic-polynomial-law` and `cayley-hamilton-identity` (Lemma 1.12(iv), via Vaccarino's theorem, a new gap);
  - `determinant-coefficient-subring` (Corollary 1.14);
  - `continuous-determinant`, `continuous-determinant-dense` (Example 2.31) and `continuous-iff-open-kernel` (Lemma 2.33).
- **IHG.1 (now `partial`):**
  - `cayley-hamilton-ideal` and `cayley-hamilton` (planet);
  - `cayley-hamilton-base-change` and `cayley-hamilton-subalgebra`;
  - `kernel-contains-cayley-hamilton` and `faithful-cayley-hamilton` (Lemma 1.21).

**Coefficients.** χ_α is extracted through `MvPolynomial.basisMonomials` and `TensorProduct.finsuppScalarLeft`, since R may be noncommutative. The linear `MvPolynomial.scalarRTensor` is not at the pin.

**New source issue.** E2 (misprint): Lemma 1.18(ii) prints R/ker(P) → S for M/ker(P) → N.

**Checks for this checkpoint.**
- The suggested file compiled at the pins: 0 errors, `sorry` warnings only.
- `scripts/check_blueprint.py`: 0 errors.
- `intake.py check-files`: 0 problems.

**Next.**
- IHG.1: Cayley–Hamilton representations and R(G, d) (needs IHG.0's representability), generalized matrix algebras, and reconstruction (Theorems 2.12, 2.16 and 2.22).
- The IHG.0 remainder listed in the coverage record.

## Contents

17 IHG.0 nodes from Chenevier §1 and Lemma 2.2:

| Group | Nodes |
| --- | --- |
| Laws | `homogeneous-polynomial-law`, `multiplicative-polynomial-law` |
| Determinants | `determinant` (planet), `characteristic-polynomial`, `determinant-one-add-mul-comm` |
| Constructions | `determinant-of-matrix-representation`, `determinant-direct-sum`, `determinant-restriction`, `determinant-base-change` |
| Small dimension | `determinant-dimension-one`, `determinant-dimension-two` |
| Pseudocharacters | `pseudocharacter` (planet), `amitsur-formula`, `trace-pseudocharacter` |
| Comparison | `determinant-trace-injective` (d! invertible), `determinant-trace-bijective-rational` (planet; ℚ-algebras), `determinant-trace-bijective-small` ((2d)! invertible, or d = 2) |

**Gaps.** Neither of these is in the libraries or planned by any layer:
- the Lyndon factorisation theorem, for Amitsur's formula;
- Procesi's theorem, that pseudocharacters over ℚ-algebras are traces of representations.

**AUDIT-33 was read.** Mathlib's `PolynomialLaw` is the carrier. `DividedPowerAlgebra` exists without its grading or representability, and everything planned here is absent.

## Source issue

**E1 (error, a stated result).** Chenevier's Proposition 1.27 states that D ↦ Tr is injective for every coefficient ring, but the proof needs d! ∈ A^×.
- Counterexample: over 𝔽_p[X], the representations Y ↦ I_p and Y ↦ X·I_p have trace 0 and determinants 1 and X^p.
- The same statement appears in arXiv v2 and in the Durham preprint; the published LMS version was not accessed.
- Downstream, only the ℚ_p-affinoid case is used, where the corrected statement holds.

## Prototype

`suggested/IntegralHeckeAndGaloisDeterminants.lean` has signatures for all nodes except Amitsur's formula, whose Lyndon-word statement awaits the gap. It also has API lemmas and unit-test examples.

Compiled at the pins with the v4.34.0-rc2 `lean` against the prebuilt Mathlib 082e2d3 oleans (one compile at a time, at least 20 GB free, no lake): **0 errors**, `sorry` warnings only.

## Checks

- `scripts/check_blueprint.py` with the pinned declaration index: 0 errors.
- `research/blueprint/intake.py check-files`: no problems.

## Next steps

1. **IHG.0:**
   - representability by Γ^d_A(R)^ab: grade Mathlib's DividedPowerAlgebra, prove Roby's representability and base change, and Γ ≅ TS for free modules;
   - duality and the reduced norm of Azumaya algebras;
   - Corollary 1.14 and Lemma 2.2(iii);
   - continuity (§2.30, Lemma 2.31);
   - finite projective representations;
   - Lemma 1.12(iv), the Cayley–Hamilton identity, via Vaccarino's Theorem 1.15.
2. **IHG.1:** Cayley–Hamilton quotient, faithful descent and reconstruction (Chenevier §§1.17–2, Theorems 2.12 and 2.22). RS-12 makes IHG.1 the owner. Procesi's theorem belongs there if it is stated over ℚ-algebras.
3. **IHG.2–IHG.6** in order.
