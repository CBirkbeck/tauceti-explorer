# Independent package review: Integral Hecke actions, determinants and interpolation

Reviewer: Codex, session `codex-cyJZVk`, 8 October 2026. Job `REV-PKG-IntegralHeckeAndGaloisDeterminants`, issue #7484. This reviewer did not author the package (`codex-LNKWpn`).

**Verdict: accepted after corrections.** This completes the independent package review. Acceptance concerns the roadmap and its suggested forms; it does not establish the proposed mathematics or discharge the accepted plan's proof obligations.

## Review against the six requirements

| Requirement | Result |
| --- | --- |
| Upstream form | Pass. Introduction, scope table, conventions, dependency order, layers, definitions with API and tests, exact theorem statements, prerequisites, and precise references follow the upstream guidance. Compared with the ClassFieldTheory and ModularForms roadmaps. Final README: **199,810 bytes**, below 200,000. |
| Fidelity to the accepted plan | Pass. All **253 targets** occur exactly once: 28 definitions, 40 constructions, 115 lemmas, 16 comparisons and 54 theorems. All 230 API entries appear, including the 228 attached to definitions/constructions, and all 207 planned test statements appear. Statements and hypotheses were compared by target, allowing equivalent mathematical paraphrases and corrected source locators. Construction paragraphs retain the mathematical content of the plan's proof obligations. |
| Own words and references | Pass after the corrections below. Every target has a source locator with pages. Read the cited public PDFs for locator and representative statement checks; the Buchsbaum scan was inspected visually. An English phrase overlap scan against the public source texts led to two further paraphrases. Remaining matches consist of mathematical symbols/formulas, not copied prose. No restricted book was used. |
| Reader has no programme process | Pass. No packet filenames, job identifiers, review/checkpoint accounts or coverage statuses in the README. Sources and prerequisites are expressed as mathematics. |
| Suggested Lean | Pass after restoring conditions that already have expressible carriers. All named theorem targets are identified in the file; all planned API names occur as declarations or structure projections, and all planned tests occur as named example comments. Final `lean-check` exits 0: **0 errors, 509 warnings**, each exactly a `sorry` warning. |
| Metadata | Pass. The entire file is `topic = "math.NT"` followed by a newline; number theory fits the roadmap. |

All reader fragment links resolve. Its construction order splits IHG.3 into polynomial/multiplier conventions and residual Galois types, so reconstruction does not acquire a forward dependency on itself. Direct internal target prerequisites precede their consumers.

The scope table agrees with the accepted plan and the reviewed link maps. In particular, CFT-L81 supplies the local arithmetic Artin convention, and CH-L14 supplies density in finite Galois quotients for uniqueness. Neither supplies determinant existence over nonreduced coefficients. The README retains the latter construction here. General Satake, completed group algebras, rational scheme invariants, continuous cohomology and Koszul complexes retain their named owners. The library audit and accepted baseline distinguish existing carriers from the additional determinant, Hecke and Ribet mathematics.

## Corrections made in place

1. `IntegralRibet.invariantSubring_eq_borel` and `RoadmapTheorem.triangular_borel_invariants` previously quantified over unrelated rings, generators and algebra maps. Their signatures now use `formalRing`, its actual coefficient/matrix generators, and `formalRing_borel` together. The helper `formalCoefficient` is the quotient image of the coefficient variable. This expresses the ring appearing in DKSW Corollary 4.17, pp.27–28; an arbitrary algebra map cannot be substituted for its conjugation coaction.
2. `IntegralRibet.relationIdeal_stable` previously asserted stability for arbitrary rows and an arbitrary algebra map. Added an explicit adjoint covariance hypothesis, using a concrete lower-Borel conjugation matrix over the existing coordinate ring. The chosen relation matrices satisfy this covariance by DKSW Lemma 4.18, p.30. The inverse matrix uses the two inverses already imposed in `lowerBorelRing`; its upper entry remains a scalar multiple of the original upper entry. This supplies a meaningful hypothesis for both ideal-stability conclusions without a placeholder proposition.
3. `ordered_determinantal_tensor_resolution` now requires regularity of each map over the quotient by the preceding maximal-minor ideals. Those ideals, quotients and `BuchsbaumRim.IsRegular` already exist in the suggested file. The reduced map uses Mathlib's `Matrix.mulVecLin`, not an untyped regularity condition. This is the ordered hypothesis of DKSW Lemma 5.4, pp.37–38; regularity only over the original ring would not suffice.
4. Corrected the relation-ideal citation to DKSW Lemma 4.18, **p.30**. Corrected Roby's Theorem IV.2 and Proposition IV.5 to **p.272**, where the free-module basis and symmetric-tensor comparison are stated, rather than pp.277–278. Linked Emerson–Morel's additional Vaccarino citation explicitly to **Theorem 1.12, p.5**.
5. Rephrased the determinant definition and coefficient-subring descent statement to remove overlapping source wording, preserving all quantifiers, multiplicativity, homogeneity and unique coefficient descent.

## Limits of the suggested forms

PROTOCOL section 13 expressly permits leaving out a condition whose carrier cannot yet be stated. The remaining documented omissions involving completed group algebras, actual reductive-group coordinate inputs, rational comodule cohomology, tensor-complex identifications and stabilization data are read under that rule. Their full statements and conditions remain in the README. They are suggested forms with omitted identifications, not unconditional mathematical results verified by compilation. The corrections above address conditions for which the requisite carriers were already present; no empty `Prop` field or `def _ : Prop := sorry` was introduced.

The plan still has seven planned stages and no closed stages. Package acceptance neither changes that status nor treats its 38 proof obligations and 19 supplier requests as solved.

## Validation and continuation

- `python3 scripts/check_blueprint.py research/blueprint/packets/IntegralHeckeAndGaloisDeterminants.json`: exit 0; 0 errors, 0 warnings. The accepted plan was not edited.
- `lean-check research/blueprint/packages/IntegralHeckeAndGaloisDeterminants/Suggested.lean`: exit 0; 0 errors, 509 warnings, all for `sorry`. Memory exceeded 20 GB before each run; checks were sequential and no build or language server was started.
- The shared Mathlib source is exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`. The file imports only individual Mathlib modules. The shared Tau Ceti checkout is newer than `f790474`; consequently this elaboration exercises no Tau Ceti API and does not verify a build at that Tau Ceti pin.
- Target/API/test inventory, internal fragment links, source-page presence, process-language scan, metadata, size and `git diff --check`: pass.

The corrected package and `review.json` are ready for automatic intake. No review work remains. Implementation starts in IHG.0 and must retain the README's full hypotheses when the supplier carriers are available. The package references and this report suffice to reproduce the checks; no scratch file is required.
