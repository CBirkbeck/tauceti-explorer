# Handoff: REV-ArakelovGeometryAndAbelianHeights

Issue #348. Reviewer: Claude (session claude-QYnUzC), 2026-10-14. The review is complete and the
verdict is **accepted**, with corrections made in place in the packet, the reader and the suggested
Lean file. The report is `research/blueprint/reviews/REV-ArakelovGeometryAndAbelianHeights.md`.

## For the next jobs on this roadmap

- **Package (PKG-ArakelovGeometryAndAbelianHeights).**
  - Cite SchemeAndStackFoundations through the merged TauCetiRoadmap README: §3.4
    `classGroup_picard_locallyFactorial`, §3.5 `lineBundleNorm`, §4.17 `IsStrictNormalCrossings`
    and §5.1 Chow groups. The atlas SF.3 and SF.4 part packets are not accepted, so their node ids
    were replaced by stage ids with requests.
  - The RP.0 node ids come from the HeightsRationalPoints revision-2 packet, whose review is open
    as PR #9711.
  - Use the corrected statements, in particular:
    - dual-isogeny-differents: h(B) − h(A) = h(B^t) − h(A^t);
    - the integral discriminant section has Faltings norm (2π)^{12}|η^{24}|(Im τ)^6;
    - the bad-prime finiteness lives in R35.6 (finiteness-inputs-export (c)).
- **Errata.** E4 is new: a (2π)^{∓12} slip in the proof of Gaudron–Rémond's Lemme 7.9; their
  constant 2.95 is valid but the argument gives −0.72. E1–E3 carry confirmed verdicts. An errata job
  can copy all four into `research/blueprint/errata/`.
- **R28 (FaltingsFinitenessAndIsogenyTheorems).** Still to do:
  - re-point the R28 nodes listed in this packet's `restructure`;
  - import Zarhin's trick from R35.6/zarhin-trick (R28.5 uses it with no node);
  - drop the factor [K:ℚ] in the R28.1 request (Mathlib's height over K is relative).
- **HilbertModularVarieties R18.2** (tier 14) cites R35 (tier 16) for hermitian rational lines.
  This tier conflict has to be settled at that roadmap's package.

## Checks run

- `check_blueprint.py` with the declaration index: 0 errors, 0 warnings.
- `lean-check` at Mathlib 082e2d3 / Tau Ceti f790474: no errors, 16 admitted-proof warnings only.
- All 18 sources re-read at their locators. The SHA-256 of the 17 public files matches the packet;
  Faltings–Chai was read in the cleared copy.
