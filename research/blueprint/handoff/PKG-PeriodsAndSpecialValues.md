# PKG-PeriodsAndSpecialValues — roadmap package (complete)

Issue #10775. Worker: Claude (Opus 5.5), session `claude-RbFn0X`. Branch `claude-RbFn0X-PKG-PeriodsAndSpecialValues`. The bot confirmed the claim on the issue. This run took no other job.

## Deliverables

- `research/blueprint/packages/PeriodsAndSpecialValues/README.md`: about 222 KB, in TauCetiRoadmap form. It has a **Summary**, scope and ownership with prerequisites and boundaries, a list of which statements are predicates, conventions with normalization checks, exact supplier contracts (Mathlib, Tau Ceti, seven TauCetiRoadmap roadmaps, 22 atlas roadmaps), and how to read the build. Layers PS.0–PS.9 follow, with 79 numbered subsections. These are exactly the 79 targets of the accepted plan (5, 8, 3, 4, 4, 4, 7, 4, 17 and 23 per layer). Each subsection carries its statement, hypotheses, locators, proof route, API, a **Checks.** block and *Needs:*, and every layer ends with Examples and Dependencies. After the layers come corrections to the sources, worked examples, downstream consumers and references.
- `research/blueprint/packages/PeriodsAndSpecialValues/Suggested.lean`: 620 lines, `import Mathlib` plus `TauCeti.Geometry.Hodge.Tate.Basic`, in namespace `TauCetiRoadmap.PeriodsAndSpecialValues`. It holds light real-bodied definitions and milestone theorems with `sorry` proofs, and its closing comment lists the README targets that have no carrier at the pins. It follows the maintainer rule of 2026-10-19: every `example` is proved, none is about a library object, and no kept definition has more than two. The proved examples cover `CoordinatePeriodEquivalent`, `tatePeriod`, `tateInfinitySign`, `UnitCritical`, `OffDiagonalCritical`, `FixedPeriodAlgebraic`, `tateTorsorEvaluation`, `arctanPartial`, `legendreRadicand`, `quarticPolynomial`, `quarticPulledOperatorCoefficients`, `quarticGram`, `quarticA` and `quarticG`, `Admissible`, `mzvEncode`, `mzvDecode`, `stuffles`, `shuffles`, `zagierCoeff` and `hoffmanDim`. Boundary facts that cannot yet be proved are named theorems listed in the README APIs: `gammaComplexBCGP_one`, `quarticMonodromy_infinity_unipotent`, `quarticMirrorCoordinate_coeff`, `quinticResidue_nilpotent`, `dworkCoeff_two`, `multipleZeta_nil`, `multipleZeta_two` and `mzvTerm_one_not_summable`.
- `research/blueprint/packages/PeriodsAndSpecialValues/metadata.toml`: `topic = "math.NT"`.

## Checks run

- `lean-check` on `Suggested.lean`: exit 0, 44 warnings, all `declaration uses 'sorry'`, no errors (Mathlib 082e2d37e8, pinned Tau Ceti build; about 78 GB of memory was available).
- `python3 scripts/check_sorry_data.py`: passes, with no sorry'd data definition.
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.
- Coverage: 79 `### PS.k.n` subsections and 79 **Checks.** blocks, with each layer's count matching the accepted plan.
- Exact rational checks with Python `fractions`, in a scratch script:
  - All five quartic monodromy matrices preserve G₀, and M∞M₄M₃M₂M₁ = 1; (M∞ − 1)² ≠ 0 and (M∞ − 1)³ = 0.
  - A₁, A₂, A₃ and g₁, g₂ match the README, and the recurrence for A_n holds.
  - The mirror coordinate q and its inverse Z agree through order 4.
  - P(1/j, Z) = 0 through q⁵, using the standard expansion of j.
  - The Zagier coefficients and the weight-five determinant 5/2 are correct, and d_N equals the number of {2, 3}-words for N ≤ 9.
  - The Dwork coefficients B_n for p = 3, 5, 7 satisfy B_p = 1/p! + 1/p.
  - NF = pFN and FᵀJF = p³J hold for the quintic boundary matrix with arbitrary C.
  - The valuation bound v_p(B_n) ≥ −n(2p − 1)/((p − 1)p²) holds for p = 3, 7, 11 and n < 160.

## Duplication check against current TauCetiRoadmap and Tau Ceti

The current TauCetiRoadmap checkout (origin/main) and Tau Ceti a91d3aaf were read only; lake was not run in either.

What exists upstream is cited and not re-planned:

- **PadicMeasuresIwasawaAlgebras** is on TauCetiRoadmap main. Its Layer 5 §5.1 (determinant lines of perfect complexes, the acyclic trivialization and the characteristic divisor) replaces the plan's citation of the atlas stage `PadicMeasuresIwasawaAlgebras:L5`. Its convention matches PS.4.2: [A --a--> A] in degrees 0, 1 has determinant lattice aA, and in degrees −1, 0 it has a⁻¹A.
- **ClassicalArithmeticCompletion** §7.10 (reduced norm of a semisimple number-field algebra) and §7.60 (local and global reduced-norm images, Hasse–Schilling–Maass) supply the rational norm-image and sign theorem that the plan left open for BF Lemma 9. The plan routed that theorem to "the central-simple-algebra direction". The extended boundary δ̂ is now a target in PS.5.1, using §7.60 together with GeneralAlgebraicKTheory §§4.15–4.17.
- **SchemeAndStackFoundations** §§1.17, 1.23 and 4.11 supply the finite quotient and blow-ups for the quartic family; this was plan gap G4. The explicit resolution of the six A₃ sections stays in PS.8.1.
- **IntegralLattices** Layers 5H and 6A are cited for PS.8.4; this was plan gap G5 (catalogue link).
- **NumberFieldArithmetic**: the Dirichlet regulator and the class number formula at s = 1 are cited as a boundary; PS.3.4 starts at degree j ≥ 2.
- **ModularForms**: the newform L-function and Layer 8 modular symbols are cited as a boundary in PS.1.6.
- **EllipticCurves** Layers 1, 2, 4, 6 and 7 are cited; the BSD quotient over ℚ in PS.6.3 is EllipticCurves Layer 7's.
- **Mathlib already has** the Dirichlet functional equation (`DirichletCharacter.IsPrimitive.completedLFunction_one_sub`, `rootNumber`), Hurwitz and ζ values at negative integers, `Complex.Gammaℂ`, which is Deligne's normalization, `Complex.Gammaℝ_eq_zero_iff`, and `LaurentPolynomial.eval₂`. They are now consumed directly in PS.1.2–PS.1.5 and PS.2.3. AL.1 is still cited for local epsilon conventions.

No target was removed for duplication: none of the 79 targets is stated upstream.

## How the plan's open obligations are handled in the package

- **G1** (quintic Dwork–crystalline bridge) is now the explicit target PS.8.17, to be proved here with suppliers CrystallineCohomology CR.5–CR.7 and PadicDifferentialEquationsAndRigidCohomology RD.3. The README says that SS and SH do not prove it.
- **G2** (convergence of the Dwork sums) is resolved in PS.8.15 by an argument of my own: the Artin–Hasse factorization exp(z + z^p/p) = E_p(z)·∏_{k≥2} exp(−z^{p^k}/p^k) gives v_p(B_n) ≥ −n(2p − 1)/((p − 1)p²). With Legendre's formula this yields v_p(B_n (n − 1)!) ≥ n(p − 1)/p² − O(log n). Artin–Hasse integrality is cited from PadicDifferentialEquationsAndRigidCohomology RD.1.63, whose own "Dwork bound" paragraph uses the same estimate. **The reviewer should check this argument**: it is not taken from Shapiro.
- **G3** (convergent motivic stuffle in Brown's H, via Soudères) is part of target PS.9.15.
- **Supplier extensions** the plan recorded are stated inside "Exact supplier contracts" as part of each contract. These cover C5 relative pairs and the elliptic second-kind identification, the R01.3 conductor, AL.5 Rankin–Selberg, R11.5 all-degree compatibility, WC.2 global duality, the NE.7 shifted-determinant comparison, the I.7 Burns–Greither theorem, SelmerIwasawaCohomology L4 (LTXZZ theorem witnesses) and CR.5–CR.7 for the quintic.
- **Source findings E1–E7 and H E1–E4** are restated in the README's "Corrections to the sources" in my own words, without process labels.
- **Deligne original-version collation** is not in the README, because it is process. The README says that its locators refer to the Ghate–Beineke translation. The French original is still uncollated.

## Adversarial mathematics pass (summary)

| Statement | Instances tried | Outcome |
| --- | --- | --- |
| Comparison covariance C⁻¹PA | rank 0, rank 1 with A = 2 or C = 2 | kept; added the A⁻¹PC non-example |
| Period class | ℚ(√2) with (√2, −√2) and (√2, √2); i versus 1 | kept |
| F∞ and the Tate scalars | ℚ(0), ℚ(1), ℚ(−1), ℚ(2) | c⁻(ℚ(1)) = 2πi and c⁺(ℚ(2)) = (2πi)², consistent with the twist formula |
| Criticality | m = 0, 1, −1, 2 for ℚ(0); weight-one pair | kept |
| Deligne ratio | ζ(2)/(2πi)² = −1/24; completed value gives −1/(24π) | check sharpened |
| Γ conventions | Γ_ℂ(1) = 1/π (Mathlib `Gammaℂ` is Deligne's); BCGP 1/(2π) | added Mathlib identification |
| Ξ exponent of H_f¹(M^∨(1))^* | plan check used the unit motive, where the space is 0 | replaced by real quadratic h⁰(F) and ζ_F^*(0) = −hR/w |
| ETNC order term | M = ℚ(1): order −1 | made explicit |
| Finite lattice exponent | [O --π³--> O] in degrees 0, 1 and −1, 0 | consistent with PMIA Layer 5 |
| Nonperfect torsion | 𝔽₂ over ℤ₂[C₂] (infinite projective dimension) | concrete example added |
| v \| p tangent term | ℚ_p(1): dim H¹_f = 1 = 0 + dim t_V | made explicit |
| δ̂ | Hamilton quaternions, x = −1 | λ = −1 correction; no explicit δ̂ formula is asserted beyond BF Lemma 9 |
| Quartic group | product-one condition gives 16, without it 64 | added |
| Modular relation | q³ coefficient forces Z₂ = −744 + 640 = −104 | added as a check; verified by computer through q⁵ |
| Integrality multiplier m | P = 2y − 2x − x² gives y = q + q²/2 | replaces a vague check |
| Quintic boundary | NF = pFN; FᵀJF = p³J for every C | noted that C is invisible to the pairing test |
| Dwork sums | p = 3 bound −5n/18; the bare series Σ 1/n diverges p-adically | convergence proved (G2) |
| Hoffman | d_N up to N = 9 equals the count; weight-5 determinant 5/2 | kept |
| 2-adic criterion | [[1,1],[2,1]] (det −1) versus [[1,1],[1,1]] (det 0) | added |

## Not done, or for the reviewer

- **Locators.** I did not reopen any source; all locators come from the accepted plan.
  - New citations are Mathlib and Tau Ceti names, all confirmed at the pins, and TauCetiRoadmap section numbers, all read in origin/main.
  - Supplier section numbers for atlas packages were taken from a mechanical lookup and spot-read.
- **Supplier packages not yet accepted.** SelmerIwasawaCohomology and ArithmeticGaloisRepresentations are at needs_changes, and GeneralAlgebraicKTheory has no review yet. If their section numbering changes, the contracts here need updating.
- **BF Lemma 9.** δ̂ is described at the level of the accepted plan: it extends ∂∘Nrd⁻¹, with a rational multiplier and independence of that multiplier. No explicit formula was invented. A reviewer with BF open could add the exact construction.
- **Scratch files.** None are needed to interpret this submission.
