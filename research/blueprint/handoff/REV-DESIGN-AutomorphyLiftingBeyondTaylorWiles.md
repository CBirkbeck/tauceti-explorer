# REV-DESIGN-AutomorphyLiftingBeyondTaylorWiles (#7104)

Agent: Claude (Opus 5.5), session claude-uhRYhp. Date: 13 October 2026. Input: origin/main f0a6645fa.
Disposition: **complete review, accepted with corrections made in place.** The report is
`research/blueprint/reviews/REV-DESIGN-AutomorphyLiftingBeyondTaylorWiles.md`.

## Done

- All 42 nodes were checked against Calegari–Geraghty Part 2. The published-layout author copy was
  read, with the arXiv v2 TeX source for overbars and numbering. The CGH20 appendix (arXiv v1, PDF
  and TeX) and Khare–Thorne §6.6 were also read. 19 nodes are verified and 23 corrected; none was
  added.
- Every cross-roadmap prerequisite (90 distinct ids) was read in its supplier packet, and the nine
  requests were checked against the supplier stages. The packet cites no library declaration.
- Packet edits:
  - seven wrong-layer references fixed;
  - the range of the Taylor–Wiles projector made precise, with B^tw and Lemma 9.6 projecting onto
    the m_Q-part;
  - the standing datum now uses E168 characters and E164 balanced oddness, and requires
    N(v) ≡ 1 mod p only on R_triv, so Theorem 5.16 keeps the printed proviso and
    BT.5/minimal-r-equals-t covers CGH20 Theorem 1.2;
  - the Ihara amalgam is glued by diag(1, π_x);
  - U_{x²} acts on H^*(G) by N(x)^{-2};
  - four numerical acceptance checks fixed;
  - the congruence-subgroup gap closed by importing KTheoryLowDegrees U.4/cg-localized-h1-vanishing;
  - the distinct-eigenvalue node restricted to GL_n, with a new gap and a new source issue E4 for
    the Res PGL_n version;
  - planets moved off a verification node;
  - `sourceVersions` added; E1–E4 carry review verdicts.
- The roadmap definition was updated: BT.2 and BT.3 descriptions, and Khare–Thorne added to the
  sources.
- The reader was re-rendered from the packet (node sections reproduce byte for byte) and its
  hand-written parts were updated.
- Suggested file: the untyped list was brought in line, and one example was added. `lean-check`
  ran in the pinned build (Mathlib 082e2d37e8, Tau Ceti f790474): only the five admitted-proof
  warnings remain.
- `check_blueprint.py`: 0 errors, 0 warnings. `intake.py check-files`: 0 problems.

## For the next jobs

- **New gap:** the distinct-eigenvalue comparison H^i(Y_0(Q), k)_{m_α} ≅ H^i(Y, k)_m for the
  Res_{F/ℚ}PGL_n quotients. It is routed here by PAPER-CALEGARI-GERAGHTY-20 and consumed by
  AdjointSelmerGroupsFromModularityLifting (CGH20 Theorem A.4). There are two routes: SR.5's block
  theory for PGL_n(F_x), or a Leray comparison through the central torus fibrations.
- **No notion moved across upstream tiers.** BT.5/theorem-5-16 is still exported to
  ModularityAndLanglandsExtensions ML.2, a Caraiani–Newton roadmap; that is an upward citation if
  ML's package uses it (question 1 of the report).
- **A red team should read first** E4 and the relaxation of the congruence on R_reg. They are this
  review's own findings, not corrections taken from the extraction.
