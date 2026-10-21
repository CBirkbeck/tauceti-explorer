# REV-PKG-KatoEulerSystems~2 — fixing package review, round 2

Issue #9222. Reviewer: Claude (Opus 5.5), session `claude-Cs69KU`, 2026-10-21. The claim bot
confirmed this session's claim before work began. This run takes no other job. The reviewer did
neither package job (`codex-4ArQBz`, `claude-mQcYVT`) nor the first review (`codex-1pMy97`).

Verdict: **accepted**, with corrections applied in place. The report is
`research/blueprint/reviews/REV-PKG-KatoEulerSystems~2.md`; the verdict object is
`research/blueprint/packages/KatoEulerSystems/review.json`.

## Changed files

- `research/blueprint/packages/KatoEulerSystems/README.md` has seventeen corrections, listed in
  the report. The mathematical ones:
  - `M, N ≥ 2` for the zeta elements;
  - the `N^(−k)` Fourier normalization of `F^(k)`;
  - two false or overstated Checks, in 6.1 and 6.6;
  - `H²(T)₀` against `X_∞` up to finite modules;
  - `p` odd in 7.4 and 7.6;
  - five supplier-section citations.
- `research/blueprint/packages/KatoEulerSystems/Suggested.lean`: `katoEulerPolynomial` and
  `ordinaryEulerFactor` are generalized to a coefficient field, and the closing list now names
  two more API lemmas. `lean-check` exits 0 with only 8 `sorry` warnings.
- `review.json` and the report, as above. `metadata.toml` is unchanged.

## Checks run

- `lean-check` on the package `Suggested.lean`: exit 0, 8 `sorry` warnings, 292 lines.
- `scripts/check_sorry_data.py`: clean.
- `python3 research/blueprint/intake.py check-files` on the deliverables: 0 problems.
- Sonnet cross-check of all 155 supplier-section citations against the live upstream PR
  heads and the atlas packages. No section was missing; I verified and fixed its five
  partial matches.
- Sources read on the page: Kato 2004 (Numdam), Rubin's 1999 draft, Nakamura
  arXiv:2006.13647v2 and 1201.6475v2, Loeffler arXiv:1411.1789v2, Burungale–Tian
  arXiv:2506.03465v2, and Weibel's *K-book* III.

## For the maintainer

- PadicFamilies §4.0 (TauCetiRoadmap PR #1019, head `f9ad8cc`) is the owner this package
  builds on. If that PR drops or renumbers §4.0, this package must follow. Two upstream points
  in §4.0 should be raised on that PR:
  - §4.0.1 uses `M, N ≥ 1` where Kato needs `≥ 2`;
  - §4.0.3 claims all coefficient places, though Kato 12.8.2 fails at places ramified in
    Momose's algebra.
- This roadmap is outside the 94-roadmap order. PadicHodgeRegulators (accepted) and
  MotivicEtaleKTheory (needs changes; used only for a sign convention and a remark) must go
  upstream first.
- No suspicious instructions were met in issue comments or fetched sources.
