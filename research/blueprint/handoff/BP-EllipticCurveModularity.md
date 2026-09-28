# BP-EllipticCurveModularity: checkpoint 1 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 28 September 2026. Refs #714; the bot confirmed the claim. **Status: partial.**
- All six stages R29.1–R29.6 are `source_decomposed`, with 20 nodes.
- The packet is partial because the 16 supplier requests are open.

RS-06 is accepted and followed: this roadmap keeps only the application to E/ℚ.

## Closed

**R29.1.**
- The explicit exceptional set Σ_E. It is finite by R28.6, without Mazur's theorem.
- Lemme 5, with the conductor criterion proved: Tate curve at multiplicative places, the inertia-order bound at additive
  places.

**R29.2.**
- Weight two and trivial character from finite flatness.
- Serre witnesses at level exactly N via R27.6. This is non-circular: R20.6's elliptic export assumes modularity and is
  not used.
- The φ(N) nebentypus lemma, kept distinct from the direct route.

**R29.3.**
- The pigeonhole and the algebraic-integer norm argument.
- F_E, with rational integer coefficients by conjugation and strong multiplicity one.

**R29.4.**
- Tate-module comparison.
- Exact conductor (Carayol).
- All bad Euler factors against Mathlib's `WeierstrassCurve.localPolynomial`.

**R29.5.**
- The ℚ-isogeny A_{F_E} → E.
- The nonconstant parametrisation X₀(N) → E.

**R29.6.**
- The modularity theorem in three formulations.
- L(E, s) = L(F_E, s), with continuation and functional equation.
- The scope of Théorèmes 4 and 5.

## Changes to the reviewed decomposition

- Four of the six node ids are kept.
- `absolute-irreducibility-from-oddness-at-odd-p` is replaced by a request to R01.4 (RS-06 owner).
- `isogeny-from-faltings-and-exact-conductor` is split into R29.4/exact-conductor and R29.5/isogeny-to-E.
- All excerpts were re-copied from the PDF text layers. Most earlier excerpts were typed normalisations, for example
  "ρ_p" where the OCR has "pp".

## Remaining

The 16 requests:
- FaltingsFinitenessAndIsogenyTheorems R28.6: End_ℚ(E) = ℤ and finite prime degrees.
- ArithmeticGaloisRepresentations R01.4, R01.5, R01.6.
- Tau Ceti EllipticCurves Layer 4 (Tate curve).
- FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6.
- AlgebraicModularFormsAndSerreWeights R15.4.
- ClassicalSerreModularity R27.6.
- Tau Ceti ModularForms Layers 4, 7, 8g.
- AutomorphicGaloisRepresentations R19.4, R19.6.
- ModularCurvesPartII R14.5, R14.6.
- Tau Ceti JacobianChallenge Layer F.

Serre's Théorème 5 (real multiplication) is recorded but not planned. Mazur's p > 163 bound is an unread refinement
(gap kept).

## Suggested Lean file

`suggested/EllipticCurveModularity.lean` imports Mathlib only. It elaborates against Mathlib 082e2d3, run with the
pinned toolchain v4.34.0-rc2 and a single `lean` call: 0 errors, and the only warnings are for `sorry`.
- **Prototyped:** `exceptionalPrimes` and its API, the root-of-unity reduction lemma, the pigeonhole, and the integer and
  algebraic-integer norm lemmas.
- **Comments only:** newform, Jacobian and L-series statements, which need unbuilt suppliers.

## Sources

**Read:** Serre (Collège de France PDF), Faltings, Carayol (Numdam), Deligne–Serre (Numdam) and Cremona Chapter II.
The first four hashes match the decomposition.

**Not read:**
- Mazur, Invent. Math. 44 (1978);
- Mazur–Swinnerton-Dyer (1974);
- Diamond–Shurman.
