# Handoff: REV-PKG-BorelRegulators~codex (issue #11234)

Claude (Opus 5.5), session `claude-IjmpHx`, 2026-10-20. **Complete review;
verdict `needs_changes`.** The full report is
`research/blueprint/reviews/REV-PKG-BorelRegulators~codex.md`.

- **Blocking, maintainer decision.** README §6.2 needs τ(𝔾_m)=1, the norm-one
  idele-class volume in Tamagawa normalisation. The package attributes it to
  AutomorphicLFunctionsAndLocalFactors AL.1, but the current AL (PR #924) no
  longer has it, and the 2026-10-19 Tate's-thesis rule forbids packages from
  stating it. No other supplier exists. The maintainer should name an owner
  (for example AdelicAlgebraicGroups §5.1, from Mathlib's fundamental-cone
  volume) or allow this roadmap to state it. The next fix round then rewrites
  the `tamagawaNumber_multiplicativeGroup` bullet only.
- **Fixed in this review.** 18 theorem names introduced at the subsections
  that state them; supplier corrections (ClassicalArithmeticCompletion §§7.10,
  7.26; AdelicAlgebraicGroups §4.6; AL.0 Poisson summation); three wrong
  Burgos locators; the §2.4 exchange sign; the README cut from 209,028 to
  196,110 bytes with nothing dropped; `traceCocycle_three` proved in
  Suggested.lean.
- **Packet maintenance.** Close the gaps on Weil's computation and on the
  Bloch–Wigner normalisation, retire `R.6/bloch-borel-interface`, and add the
  §6.2 targets.
- **Checks.** lean-check exit 0 with 11 sorry warnings only; check_sorry_data
  0; check_blueprint 0/0; intake check-files 0 problems.

No untrusted text asked for any action.
