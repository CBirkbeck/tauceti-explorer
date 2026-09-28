# BP-ModularCurvesPartII--R14.3: checkpoint 1 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 28 September 2026. Refs #775; the bot confirmed the claim. **Status: partial.**

| Stage | Coverage |
|---|---|
| R14.5 | `partial` (8 nodes; only the oldform source is unread) |
| R14.6 | `partial` (3 nodes) |
| R14.3 | `partial` (4 nodes) |
| R14.4 | `not_read` |

RS-06 is accepted and followed.

## Closed in this checkpoint

**R14.5, from Conrad's appendix to Ribet–Stein.**
- A_f = J₁(N)/p_f J₁(N) and its good reduction.
- Shimura's dimension theorem, with the rank-two Tate module.
- Differentials, with the Picard/Albanese convention made explicit.
- The J₀(N) quotient.
- The nonconstant Abel–Jacobi composite.

**R14.6.**
- The Néron extension of the Hecke operators.
- The special-fibre Eichler–Shimura relation, with the w_ζ relation.
- Cusp-normalised Abel–Jacobi maps. These are what EllipticCurveModularity R29.5 requests.

**R14.3.** The Hecke-equivariant Shimura isomorphism, cup product versus Petersson, twisted self-adjointness, and
rank-two freeness (Gorenstein).

## Remaining, precisely

See the coverage `remaining` lists.
- **R14.3:** étale/integral comparisons, parabolic cohomology and higher-weight local systems.
- **R14.4:** Ihara's lemma, from Ribet–Stein §3.
- **R14.5:** a free primary source for the oldform multiplicity (gap).
- **R14.6:** character groups and monodromy, and Taylor–Wiles freeness.

## Requests made (11)

- ModularCurvesPartII R14.2, R13.2, R12.3, R12.5.
- AbelianSchemesAndArithmeticModuli A2, A6.
- NeronModelsAndSemistableAbelianVarieties R11.1.
- Tau Ceti ModularForms Layers 4, 8, 8g.
- Tau Ceti JacobianChallenge Layer F.

## Suggested Lean file

`suggested/ModularCurvesPartII--R14.3.lean` imports Mathlib only. It elaborates against Mathlib 082e2d3, run with the
pinned toolchain v4.34.0-rc2 and a single `lean` call: 0 errors, and the only warnings are for `sorry`.
- **Prototyped:** the Hecke prime as the kernel of the eigenvalue character, and the rank-two base-change lemma that is
  the algebraic core of Shimura's dimension theorem.
- **Comments only:** Jacobian-level statements, since Jacobians of modular curves are not in the pinned libraries.

## Sources

**Read:** Ribet–Stein author PDF (sha256 `e1bf2b5c…`), §2.3.1 and Conrad's appendix §§5.1–5.3.

**Not freely available:**
- Shimura, *Introduction to the arithmetic theory of automorphic functions*, §7;
- Diamond–Im.
