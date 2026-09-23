# Handoff: PAPER-BOXER-CALEGARI-GEE-PILLONI-25

Codex · codex-c83e7a · issue #2166 · 23 September 2026

Status: complete extraction, ready for independent review. The result and
report cover all230 pages of arXiv2502.20645v1, including309 numbered
definition/result environments mapped in the coverage ledger. There are595
items,35 routes,152 definitions with API/tests and74 source findings.
Every one of the555 missing items is routed exactly once. The other items
are8 pinned-library baselines and32 planned imports.

The endpoint is the issue's mandatory AbelianSurfacesModularity /
DESIGN-BCGP25, over DESIGN-BCGP18 and the ten-author infrastructure. No
roadmap implementation or Lean formalization is claimed. All edits are
limited to the two paper deliverables and this note.

Independent review should start with the explicit proof obligations:

1. The false topological extension lemma2.7.5 and its effect on completed
   Verma homology; the actual constrained fibre in3.6.15 and Sen–Cousin.
2. Open-ideal patching and the additional dyadic ring-action/map-lift issue;
   the restriction to components through q in7.5.10.
3. Integral H2 torsion and alternation at2 in10.3.1. Kisin09 is the
   Inventiones2-adic Barsotti–Tate paper, not his Annals finite-flat paper.
   Only the author DVI pp30–32 were read for that prerequisite.
4. The p220 triple-transposition row and its explicit F9 Weil-restriction
   replacement. The geometric lift/deformation/Torelli bridge remains to
   prove; the finite seed alone does not close the argument.
5. The corrected bad-reduction hypothesis in9.2.13, full similitude Hecke
   character at trace zero, and Arthur's stated conditional input.
6. The concurrent BCGP21 proposal names. Reuse one
   HigherHidaAndColemanTheory design and reconcile its new/Part-II kind.
   PotentialModularityOfAbelianSurfaces is an alias of the maintainer's
   AbelianSurfacesPotentialModularity endpoint. Seven specialist items use
   the companion GSp4LocalLanglandsAndGaloisRepresentations proposal.

All findings are unreviewed extraction findings, with correction searches
recorded. There are no self-issued independent verdicts. Source proof
obligations are distinguished from omitted extraction work; the coverage
ledger has no uncovered named definition/result environment.

Checks: check_paper.py and intake.py check-files pass; coverage/API/route
assertions pass. Independent standard-library finite calculations passed
27,297 assertions. Magma,3-torsion resolvents, conductors and the full frozen
database were not rerun. The pinned Magma archive and compact certificates
are recorded in the result. Lean was not compiled; no Lean file is in the
authorized deliverables, and no default toolchain is configured.

Resume from the result's source, coverage, designCoalescence,
proofObligations and validation fields, and the report's route briefs. Do
not discard small misprints when reviewing the more serious findings.
