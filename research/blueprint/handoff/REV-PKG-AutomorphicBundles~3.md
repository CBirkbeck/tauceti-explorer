# Handoff: REV-PKG-AutomorphicBundles~3 — issue #9883

Codex, session `codex-kQ5lyr`, 16 October 2026. Branch
`codex-kQ5lyr-review-automorphic-bundles`. Claim confirmed in
[comment 6214251380](https://github.com/CBirkbeck/tauceti-explorer/issues/9883#issuecomment-6214251380).
Completed independent package review, **accepted with fixes**; this is not a
checkpoint. I did none of the three package jobs. Only this job was claimed.

The package retains all 114 targets and the round-3 construction repairs.
The report is `research/blueprint/reviews/REV-PKG-AutomorphicBundles~3.md`;
the authoritative package status is `packages/AutomorphicBundles/review.json`.
The maintainer can proceed to its draft TauCetiRoadmap PR.

## Fixes and evidence

- B3.BGG.3 now uses the unipotent-root half-sum
  `2rho_U=(-3,-3;0)`, with BCGP coherent degree `3-length`.
  Identity Weyl element at zero weight gives `(3,3;0)` in degree three,
  rather than the Levi-half-sum answer `(1,-1;0)` or degree zero.
  README negative controls and a proved Lean example detect both mistakes.
- B3.HT.3 excludes finite-cover components mapping entirely into the boundary.
  Such an extra disjoint component destroys restriction injectivity despite
  étaleness off the boundary. The actual normalized open level covers satisfy
  the corrected condition; the README includes the counterexample.
- Corrected Scholze, Pilloni–Stroh and DLLZ statement kinds, added DLLZ
  Theorem 5.4.4 p.81 for descent, and narrowed the connection wording to the
  structure supplied by the full-group construction.
- Read all 20 added prerequisite targets against their sources and 15 retained
  targets selected before reading by seed 9883. The report records exact
  locators, all-target adversarial instances and 14 signature comparisons.
  Maintainer-cleared sources were read in place, with no copies or passages
  saved. No source text was added to the repository.

## Coordination outside this review's allowed edits

The round-3 package handoff's ownership moves remain necessary for the
unchanged packet/higher-roadmap pointers. They are coordination work for
the maintainer, not missing constructions in this accepted package:

1. HodgeTateAndCanonicalSubgroups T3's needed rational small-Hasse subgroup
   construction imports B3.HT.1. Its general finite-BT, integral differential,
   larger-region and Harder–Narasimhan work stays there. Its rational tensor
   and Levi comparisons import B3.log.3/B3.HT.7. The local p-divisible
   Hodge–Tate sequence stays with lower-tier R07.1.19.
2. PerfectoidShimuraVarieties imports the specific Siegel minimal/toroidal
   and Hodge-type closed-tower/period constructions from B3.HT.2–7.
   General-data diamonds, abelian-type descent and broader comparisons stay
   in the higher roadmap. HigherHidaAndColemanTheory may import B3.HT.8's
   finite-algebraic VB specialization; it does not supply exactness for
   arbitrary locally analytic VB.
3. Higher-dimensional horizontal-log consumers import B3.log.1–5. Local
   period theory stays in PadicHodgeTheory P8; generic nilpotent canonical
   extensions in ComplexComparisonPartII C5.6; CohomologyComparisons 6.1
   retains its one-variable modular-curve specialization. The relevant
   Siegel relative/dual BGG construction is B3.BGG.1–3; generic PBW/Verma
   theory remains in Tau Ceti's LieHighestWeight roadmap.
4. The Diamond ramified splitting-model boundary, lines, completions and
   cusp detection are B3.Hilbert.1–4. Partner C6's Dimitrov-model results
   retain their own hypotheses. Partner C0–C5 supply the generic toroidal
   geometry and minimal Hodge positivity already imported here.
5. Redirect old conditional period/BGG/Hilbert input pointers to these new
   target IDs. Use ClassicalAdicEtaleCohomology Layer 8 §8.2 for the proper
   comparison, P8's actual relative/filtered comparison contracts, and
   PerfectoidSpaces P8.21 for compatible closed-locus limits. The missing
   generic P7.13/P8.18 assertions are not used. B4.19 and B5.1 are independent
   section-colimit and trace helpers, so their forward references create
   no cycle.
6. Preserve the previous handoff's partner C5.15 coefficient-expression note.
   For nonflat M, tensoring after pushing a character line to the lower base
   needs its own base-change theorem. This package tensors on the abelian
   torsor, consumes C5's formal restriction/decomposition there, and supplies
   the needed coefficient functors at B5.2–B5.3 and B5.14. I clarified this
   supplier boundary; I did not edit or certify the partner's displayed
   pushforward-then-tensor formula. Its owner should reconcile that formula.

No target was removed in this review's current-upstream duplication pass.
The existing boundaries already import AlgebraicVectorBundles L0A–L0C,
generic ReductiveGroups quotients/dynamic parabolics, and the partner C5
minimal Hodge-line results. Current subspace-stabilizer and Tannaka APIs do
not replace the finite pointwise tensor-stabilizer construction B1.1.
The current read-only roadmaps/library commits checked were
`0d144d044dacebca17b654695b6f1ad58f159b27` and
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, separately from the pinned
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` used for signature validation.

## Validation

- Final `lean-check` exits 0 with exactly 16 declaration-uses-sorry warnings
  and no others. Suggested.lean is 506 lines; the added BGG example is proved.
- `scripts/check_sorry_data.py`: exit 0, no sorry-defined data.
- `scripts/check_blueprint.py` on both unchanged accepted packets: exit 0,
  zero errors/warnings. The historical packet gaps/requests remain unchanged.
- 114-target inventory: all retained, each Source/Needs/Lean/Checks present,
  381 Checks with at least three each; explicit internal Needs graph has 382
  expanded edges, no missing IDs and no cycles, including numerical ranges.
- `intake.py check-files` on the changed files: zero problems.
  `git diff --check`: clean.

No compiler or server is left running. Source downloads and working notes
are disposable scratch and are not needed to resume. The report and this
handoff contain the durable conclusions and coordination instructions.
