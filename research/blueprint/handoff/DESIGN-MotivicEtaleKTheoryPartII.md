# Handoff: DESIGN-MotivicEtaleKTheoryPartII (issue #11335)

Worker: Claude (Opus 5.5), session claude-iQpMDn, 2026-10-20.

## What was done

New roadmap **MotivicEtaleKTheoryPartII** — "Motivic and étale K-theory, Part II: fundamental lines and special-value factors" (area `automorphic`, parent `MotivicEtaleKTheory`), inserted after PeriodsAndSpecialValues.

- `research/blueprint/roadmaps/MotivicEtaleKTheoryPartII.json`: four stages FL.1–FL.4.
- `research/blueprint/packets/MotivicEtaleKTheoryPartII.json`: status `complete`, 23 nodes (5 definitions, 5 constructions, 12 theorems, 1 application), 64 API items, 39 unit tests, 14 planets, 14 baseline declarations (all read in the pinned Mathlib 082e2d3), 9 requests, 3 gaps, 2 restructure proposals, `sourceIssues: []` (none found). `scripts/check_blueprint.py`: 0 errors, 0 warnings. All four stages `planned`.
- `research/blueprint/readmes/MotivicEtaleKTheoryPartII.md`: the reader document (Layers 1–4, with every API and Check).
- `research/blueprint/suggested/MotivicEtaleKTheoryPartII.lean`: **compiled** with `lean-check` at Mathlib 082e2d3 / Tau Ceti f790474; the only warnings are two `sorry`s (theorems `artinFactorRank_rat`, `tendsto_mul_dedekindZeta_one_add`). It holds only light real-bodied definitions over pinned carriers (`motiveWeight`, `dualDegree`, `dualTwist`, `tatePlusDim`, `artinFactorRank`, `IsLatticeGenerator`), two proved dimension theorems (`artinFactorRank_add_tatePlusDim`, `artinFactorRank_one_add`) and proved examples (including `¬ IsLatticeGenerator (span ℤ_p {1}) p` in ℚ_p). The K-theoretic factors, regulator sequence, comparisons and Tamagawa condition have no carriers at the pins and are README targets, listed in the closing comment.

## The boundary chosen (please read)

The issue asks to move the MotivicEtaleKTheory subsections that consume PeriodsAndSpecialValues (README line 1382, Layer 12 dependencies) "in full", while "MotivicEtaleKTheory keeps everything that does not consume PSV". Only §12.7 consumes PSV, and only partly:

- **Moved here (and generalized):** the rational fundamental line of Tate/elliptic motives from motivic K factors and realizations, `fundamentalLineRealComparison`, `fundamentalLinePadicComparison`, the Tamagawa assertion (rational zeta element with real leading-value image and integral basis image in Δ_p(T)), the fundamental-line half of the packet node `M.8/regulator-determinant-comparison`, and the "local correction in the Tate/elliptic Tamagawa statement" use of `M.8/selmer-local-determinant-comparison`. The §12.7 Checks on swapping odd factors and on rational versus integral bases are kept (FL.2/fundamental-line-real-comparison, FL.4/tamagawa-condition); the zero-complex and two-term inversion Checks are repeated in FL.4/tamagawa-condition.
- **Kept in MotivicEtaleKTheory:** `arithmeticDeterminantLine` Δ_p(T) = det⁻¹ RΓ_c(T) and `selmerLocalDeterminant` (pure homological algebra over AGD D7, SIC L2 and the determinant functor), §12.8 (Chern lattice index) and the Deligne–Borel lattice half of `M.8/regulator-determinant-comparison`. Reason: PeriodsAndSpecialValues PS.4.1 imports Δ_λ(T) from MotivicEtaleKTheory Layer 12; moving Δ_p(T) into the Part II would make PSV consume the Part II, which consumes PSV — the cycle again.
- **Generality:** MEK §12.7 was stated for "a chosen Tate or elliptic motive"; following the 2026-10-19 rule the Part II states everything for K-theoretic motive data h^i(X)(j) over number fields (with a recorded regular model and a Chow–Künneth projector) and proves the comparison hypotheses for all Tate twists of all Artin motives (Borel, Dirichlet, Soulé, Kummer) and for h¹(E)(1) (Néron–Tate; Sha[p^∞] finite). Tate and elliptic cases are theorems/Checks, not the scope.

## Follow-up edits needed elsewhere (recorded in `restructure` and `requests`)

1. **MotivicEtaleKTheory (packet M.5d/M.6b and package README):** drop `PeriodsAndSpecialValues:PS.0` from `M.8/arithmetic-fundamental-line`, `M.8/regulator-determinant-comparison`, `M.8/selmer-local-determinant-comparison`; cut the second paragraph of README §12.7 (fundamental line, real/p-adic comparison, Tamagawa assertion) and its Checks 3 and the second half of 4; restate the Layer 12 Dependencies sentence naming PSV and the Downstream-consumers sentence on PSV (it now consumes Δ_λ(T) and the regulators only); split `M.8/regulator-determinant-comparison` so `M.8/number-field-chern-lattice-index` rests only on its Deligne–Borel half.
2. **PeriodsAndSpecialValues:** PS.3.1, PS.3.2, `PS.3/regulator-specializations`, PS.4.1, PS.6.1, PS.6.5 must drop their prerequisites `M.8/arithmetic-fundamental-line` and `M.8/regulator-determinant-comparison` and state the comparisons as hypotheses (their existing "otherwise" clauses); PS.4.1 keeps Δ_λ(T) from MEK. The README's "Two boundaries" paragraph must be rewritten. PS.5.4 `abelianTate_ETNC` needs the K-theoretic θ_∞, θ_λ of h⁰(Spec L)(r): restate it with comparisons characterized by Borel's regulator and Soulé's Chern classes, or move it after this Part II.
3. **Consumers named in the issue:** SpecialValuesBirchTate can consume FL.4/cohomological-lichtenbaum-form and FL.2/fundamental-line-real-comparison. I found **no** current citation of the moved material in K3BlochGroups or ArithmeticKTheory: both consume MEK Part I's Chern classes/regulators only (ArithmeticKTheory N.1/N.5 requests to M.8 are about étale Chern classes; K3BlochGroups V.6 about Soulé's c̄₂,₁). No change needed there.
4. **HodgeStructuresPartII** (named as a supplier in the issue) is not used: Part II only treats smooth projective X, whose Deligne cohomology is handled with TauCetiRoadmap HodgeStructures L2 and MEK §12.2. The logarithmic Deligne–Beilinson supplier gap stays with MEK §12.2.

## Gaps (in the packet)

- G1: the Beilinson–Bloch height in weight −1 beyond elliptic curves — no roadmap constructs it (MotivesAndAlgebraicCycles MC.7 takes it as a datum).
- G2: independence of the K-theoretic integral part of the regular model, and Scholl's definition without a regular model — unplanned anywhere; not needed for Artin motives or elliptic curves with a chosen model.
- G3: the p-adic realization of the integral part lands in H¹_f in general (Gros; Nekovář–Nizioł give H¹_g) — a hypothesis outside Artin motives, h¹(E)(1) and weights ≤ −3 at good p.

## Coverage remaining (refinements, all stages `planned`)

FL.1: projectivity of the factors over orders (BF coherence) for noncommutative coefficients. FL.2: G1. FL.3: G3. FL.4: the general functional-equation compatibility of the condition (Huber–Kings Proposition 2.2.3) needs NE.7's local epsilon isomorphisms; it is used here only in the class number formula case. The Huber–Kings theorem for abelian Artin motives (their Theorem 1.3.1, via the main conjecture) is not planned here; it belongs with the Iwasawa roadmaps / PSV PS.5.4.

## Sources read (free, fetched 2026-10-20; SHA-256 in the packet)

- Burns–Flach, Doc. Math. 6 (2001), EMS Press PDF: §§3.1–3.4 (pp. 517–529), §4 (pp. 535–537).
- Kato, arXiv:math/0304233v1 (printed pp. 163–171): §1.2, §2.1.
- Huber–Kings, arXiv:math/0101071v2: §§1.1–1.5, 2.2–2.3.
- Fontaine, Bourbaki 751 (Numdam; printed page = PDF page + 203): §§6–10. The Numdam OCR loses many formulas; statements were checked against the structure and against Huber–Kings/Burns–Flach, which reproduce them.
- Bloch–Kato 1990 (Stanford BSD-seminar scan): §3.7–3.10, §5.1–5.4.
- Not available: Fontaine–Perrin-Riou (Motives, PSPM 55) and Kato's LNM 1553 lectures are not free and not in the cleared library; the FPR formulation is cited through Fontaine's Bourbaki exposé, which presents it, and through Huber–Kings §1 and Burns–Flach §3, which cite FPR III.3.2.5 and 4.4 explicitly.

No suspicious instructions were found in any fetched text or issue comment.
