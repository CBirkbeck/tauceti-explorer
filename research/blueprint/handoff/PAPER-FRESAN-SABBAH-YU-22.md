# Handoff — PAPER-FRESAN-SABBAH-YU-22

Claude Code, session `cc-7b31c4`; issue #1316; 22 September 2026.

Partial extraction: 65 items (1 library, 7 planned, 57 missing), every missing item routed exactly once,
across two new roadmaps and two source routes. Four named gaps. Read the report first, then the JSON's
`source.readSections` and `gaps`.

## What is done

- The version question is settled. Read **arXiv:1810.06454v5**, which the authors label the final
  published version; v1–v2 predate a substantial revision after referee reports in which the whole
  construction moved into the setting of exponential mixed Hodge structures, so they must not be used.
  Hashes and file names are in `source.readSections`.
- The numbering is settled and verified. All environments share the equation counter, so statement and
  equation numbers interleave; the reconstruction was pinned against the printed equation tags of the
  compiled PDF and agrees with all 43 statement cross-references, with no type mismatch. 58 numbered
  statements: 3, 9, 5, 10, 14 in the five sections and 17 in the appendix.
- Read at proof level: §1 in full, §2.1 including the proofs of Proposition 2.4 and Lemma 2.5, and §3.1
  including the proof of Theorem 3.2. Read at statement level: everything else.
- The routing is decided and should not be redone: a new roadmap for the general machinery
  (`MixedHodgeModulesAndIrregularHodgeTheory`) and a second for the application
  (`KloostermanMomentsAndPotentialAutomorphy`), with source routes to
  `ModularityAndLanglandsExtensions` ML.2 for Patrikis–Taylor and to
  `PadicDifferentialEquationsAndRigidCohomology` RD.6/RD.7 for the rigid-cohomology comparison. The
  atlas searches behind that decision are written out in the report.

## Resume order

1. **G-PROOFS-4-5.** Read §4 and §5 line by line. §4 is the computational heart: the formal structure of
   `Sym^k Kl₂` at infinity, the intermediate extensions and the exceptional case `4 | k`, the inverse
   Fourier transform and its singularities at `τ = 2(2j−k)`, the dimension formula, the explicit bases
   and the Hodge filtration in them. §5 needs the quadric appearing in Theorem 5.8 and the vanishing-cycle
   description in Theorem 5.17 to be named as separate items, together with the local `L`- and
   `ε`-factors of §5.6. Split the items where the proofs use inputs not yet named.
2. **G-APPENDIX-PROOFS.** Read the appendix's proofs and the points of Saito's two papers they cite, and
   then decide how much of the mixed-Hodge-module theory the new roadmap must build rather than import.
   This is the decision that fixes the size of `MixedHodgeModulesAndIrregularHodgeTheory`.
3. **G-SOURCE-ISSUES.** `sourceIssues` is an empty list recording that nothing was found in the parts
   read at proof level. It must be revisited once 1 and 2 are done; do not leave it empty by default.
4. **G-LIBRARY.** Confirm at the pinned commits that Mathlib and Tau Ceti contain nothing for D-modules,
   perverse sheaves, Hodge modules or étale cohomology, rather than relying on the atlas search.

## Safeguards

- Do not fold the machinery into the application or the other way round: the point of the two-roadmap
  split is that the appendix's theory is reusable, and the brief of each names what it imports from the
  other.
- `HodgeStructuresPartII` (PAPER-LANDESMAN-LITT-24) is a different extension of the Tau Ceti
  Hodge-structures roadmap — variations, period maps, non-abelian Hodge theory — and must not be
  conflated with mixed Hodge modules.
- The remaining part of the Broadhurst–Roberts conjecture (`r_k = ⌊k/6⌋`, `ε_k = (−1)^{t_k}`) and the
  Bessel-moment relation of the sequel are boundaries, not theorem targets.
- Follow the live WORKERS claim protocol and re-read the issue before resuming; never reuse an old claim.

## Checks at submission

`scripts/check_paper.py` passes and `intake.py check-files` reports no problems. No Lean file is a
deliverable and no compilation is claimed. Only this job's result, report and handoff are changed.
