# FIX-PKG-IntegralIwasawaTheory~adv — handoff

Job: `FIX-PKG-IntegralIwasawaTheory~adv` (issue #11339). Worker: Claude (Opus 5.5),
session `claude-zB21Ht`, 20 October 2026. The job is complete. The verdict stays
**accepted**; `review.json` names this fix round.

## What the job was

The independent review `REV-PKG-IntegralIwasawaTheory~adv` (Codex, #11095) accepted
the package after making its corrections in place. It left no open finding. This
round carries out the maintainer's de-cycling directive of 2026-10-20 and nothing
else. SpecialValuesBirchTate comes after this roadmap. The dependency parser read the
Layer 12 Dependencies sentence "SpecialValuesBirchTate supplies their K-theory
interpretation" as a supplier citation, which created a cycle. Every such mention now
names that roadmap only as a downstream consumer. The README was also checked
for PeriodsAndSpecialValues, Polylogarithms and ArithmeticKTheory.

## Review corrections re-checked

All eleven corrections listed in `reviews/REV-PKG-IntegralIwasawaTheory~adv.md` are
present in the files on main. I checked each one by grepping for its object:

- κ versus κ_Γ in Conventions.
- `integralMainConjecture_of_finiteSelmerFitting` no longer appears in Suggested.lean.
- `IsPrimitiveRoot.geom_sum_isUnit`, the CM `indexRealUnits_eq_one_or_two`, and Tau
  Ceti's `Global.RayClass.Exact` are imported in the supplier contracts.
- `sRayUnitExactSequence`, `weightedRibet_distinctLocal` and
  `eisensteinFractionLattice_bound` are present.
- The `(2,T)` transpose control is present.

Nothing from that review is reopened here.

## Finding → change

| Finding (directive) | Where | Change |
|---|---|---|
| The Layer 12 Dependencies sentence is read as a supplier citation of SpecialValuesBirchTate. | `## Layer 12` → `### Dependencies` | "The special-value statements stop at étale cohomology and the Iwasawa norm-minus class module. SpecialValuesBirchTate supplies their K-theory interpretation." becomes "…norm-minus class module; their K-theory interpretation is given downstream by SpecialValuesBirchTate." This is the maintainer's wording. |
| Same pattern: an ownership claim for the downstream roadmap. | Scope and ownership, last paragraph | "The endpoint in algebraic K-theory belongs to **SpecialValuesBirchTate**: this roadmap gives its cohomological and Iwasawa inputs." becomes "The special-value statements here stop at étale cohomology and Iwasawa modules; their algebraic K-theory interpretation is given downstream by SpecialValuesBirchTate, which consumes the cohomological and Iwasawa inputs proved here." The roadmap name is no longer bold, since bold marks suppliers in that paragraph. |
| Same pattern: "supplied by" a downstream roadmap. | §12.4, after the n=2 comparison | "…whose K-theory proof is supplied by SpecialValuesBirchTate." becomes "…; the K-theory side of that formula is not a target here, and its proof is given downstream by SpecialValuesBirchTate." |
| Same pattern, for a different downstream roadmap. EulerSystemsCyclotomicMainConjecture cites this roadmap (§§1.5, 1.8, 2.2, 2.4, 2.7, 3.1, 4.1–4.2, 7.2 and Layers 0, 2, 4 in its *Needs:* and Dependencies lines), so it comes after this one. | Scope and ownership, last sentence | "The rational cyclotomic main conjecture also has an Euler-system proof in **EulerSystemsCyclotomicMainConjecture** §3; …" becomes "A second, Euler-system proof of the rational cyclotomic main conjecture is given downstream by EulerSystemsCyclotomicMainConjecture, which consumes this roadmap; …". The rest of the sentence is unchanged. |
| PeriodsAndSpecialValues, Polylogarithms, ArithmeticKTheory | README.md, Suggested.lean, metadata.toml | Not mentioned anywhere (grep), so no change. The phrase "relative K-theory" in §10.1 and the Rognes–Weibel title are mathematics and a reference, not roadmap citations. |

The entries for SpecialValuesBirchTate and EulerSystemsCyclotomicMainConjecture under
`## Downstream consumers` were already worded as consumers and are unchanged.
No statement, hypothesis, locator, Check, example, anchor or Lean declaration changed.
`Suggested.lean` and `metadata.toml` are byte-identical to main.

## Pass table (touched statements)

The edits only reword ownership sentences. The one mathematical claim they make is
the scope claim "the special-value statements here stop at étale cohomology and Iwasawa
modules". I checked it against the targets.

| Statement | Instances checked | Result | Change |
|---|---|---|---|
| Scope: special values stop at étale cohomology and Iwasawa modules | §12.3 `oddPrime_specialValueEuler` (eigenspace orders of `X_ψ(−n)_Γ`, finite étale H²) and `dyadic_specialValueEuler` (`#H²_et(O_F[1/2],ℤ₂(n))`, `w_n(F)₂`); §12.4 `kolster_moduleDictionary` and the n=2 finite comparison | True. No K-group appears as a target. §12.3 already says that the comparison to K₂ and Birch–Tate is the downstream K-theory theorem. | Wording only |
| §12.4: Kolster's K₂ formula is not a target here | The displayed targets of §12.4: the characteristic-ideal dictionary, `#X(−2)_Γ = 2^d #(ℤ₂(1)⊗A^−)^Γ` and `#(ℤ₂(1)⊗A^−)^Γ = \|f_F(u⁻¹)\|₂⁻¹` | True. The K₂ formula appears only as the downstream use of this comparison. | Wording only |
| Layer 12 Dependencies | Layers 0–11 and the supplied algebra listed there; SpecialValuesBirchTate is no longer a dependency | Consistent with Downstream consumers ("SpecialValuesBirchTate consumes §§12.3–12.4") | Maintainer's wording |
| Scope: second proof downstream in EulerSystemsCyclotomicMainConjecture | That package cites this one in its *Needs:* and Dependencies lines (see above); this README's Downstream consumers says the two proofs reach the same rational endpoint | Consistent. The theorem is still shared, not declared twice. | Wording only |

## Checks run

- `lean-check research/blueprint/packages/IntegralIwasawaTheory/Suggested.lean`:
  **exit 0**, exactly ten `declaration uses sorry` warnings (lines 68, 87, 108, 115,
  126, 133, 156, 175, 218, 262), no other warning or error; 298 lines. This is the
  same result the review recorded. Memory was checked first (81 GB available).
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0.
- The gate's mechanical README/Lean check (`mech_check.py`, read first and run with
  `python3 -I` from scratch) gives identical output before and after the edit. There
  are 21 Lean declarations and 59 bold targets. Its pre-existing hits are unchanged and
  outside this directive:
  - two light README API names with no Lean declaration (`cyclotomicRatio_norm`,
    `dyadicCorrection_zero`);
  - the word "continuation" (Hecke continuation), flagged as a round-like label;
  - four bold paragraphs with no backticked name (two supplier headings and two
    consumer paragraphs).
- `git diff --check` passes. `python3 research/blueprint/intake.py check-files` on the
  four deliverables reports 0 problems.
- No packet, other package, ORDER file, `content/` or `data/` file was edited. No
  language server, `lake build`, `lake update` or cache command was run, and nothing
  is left running.

## Note for the maintainer (not changed here)

ColemanPowerSeries and this roadmap cite each other:

- This README takes the Coleman map, its kernel and its image ideal from
  "**ColemanPowerSeries** §4".
- The ColemanPowerSeries README takes "IntegralIwasawaTheory, Layer 0" (global
  cyclotomic fields, cyclotomic-unit groups and cyclic generation) as a supplier, in
  its supplier list and several *Needs:* lines.
- Its Downstream section also says that IntegralIwasawaTheory consumes its principal
  sequence.

At the layer level this is not a cycle: Layer 0 here feeds its §4, which feeds Layers 6
and 7 here. At the package level, however, it is a two-way citation. Your parser
flagged only SpecialValuesBirchTate here, which suggests your order puts
ColemanPowerSeries first. In that case the Layer 0 inputs it takes from this roadmap
move down to it, or are restated there, and this README needs no change. The directive
said nothing else changes, so I left both READMEs as they are.

EulerSystemsAndKolyvaginSystems is named here as the owner of broader Euler-system
contraction theory. Its own README mentions this roadmap in three ways: as the owner of the
prime-to-2 Dasgupta–Kakde Rubin–Stark integrality, as the constructor of the regulator
elements whose properties its Layer 7.6 assumes as explicit hypotheses, and as a
downstream user. It proves nothing from a target here. Its open TauCetiRoadmap pull
request #1272 waits only on #858 and #869. So that mention stays a
citation of an earlier roadmap, and I did not change it.

## Untrusted text

None of the issue text, comments or files I read asked for anything outside the job. A
handoff in the repository (FIX-PKG-K2SymbolsBrauer~adv2) records an earlier
agent-directed instruction in an API reply. I only read that note; nothing was fetched
or acted on in this job.

## Where to resume

Nothing remains for this job. Scratch files (worklist, mech_check output, lean log)
are not needed by anyone.
