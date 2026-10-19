# REV-DESIGN-AutomorphicSpectralTheoryPartII

Completed independent review for issue #3503 by Codex, session
`codex-s4ZlSf`, on 19 October 2026. The swarm bot confirmed this session's
claim at issue comment 6263053339. The design's author was another session,
`codex-SwqWWZ`. Branch: `codex-s4ZlSf-review-spectral-multipliers`.

The packet is accepted after correction: 63 reviewed nodes, comprising
54 verified and 9 corrected; no new nodes. All six stages remain planned,
none closed, with 16 gaps and 15 open supplier requests. The 87 API items,
87 planned unit tests, 32 planets, seven baseline anchors and 99 input routes
were checked. Every implementation status is unchecked.

The [review report](../reviews/REV-DESIGN-AutomorphicSpectralTheoryPartII.md)
records the complete changes and source decisions. The packet, roadmap
stage descriptions and reader are reconciled. The suggested Lean file is
unchanged and was independently elaborated at the required pins.

Resume from the corrected packet and this review, rather than the old
design handoff's descriptions of R1/R9/R11:

- R1 uses compact-isotypical Fréchet direct sums and averaging projections,
  not an arbitrary strict-LF closed-subspace theorem.
- R9 compares the compact norm-one character lattice with the allowed
  affine relative central parameter coset after fixing ω and normalizing
  twists. Its rank can be zero.
- R11 requests the existing compact-data inner-product and constant-term
  formulas with matched normalizations. SM.3 derives regular-support L²
  boundedness and weighted holomorphy; importing those conclusions from
  AS.3 would duplicate the new target.

Other corrections restrict subgroup depth to strict intersected parabolics,
fix the circle kernel test's Fourier sign, replace adelic compact generation
by the actual split-torus/Siegel argument, and correct the quasi-cuspidality
locator to BPLZZ p.22. Affine-lattice interpolation is explicit. No mathematics
was moved between owners, and no supplier/upstream files were edited.

All 36 inherited source issues have verdicts: 25 confirmed, 11 rejected.
Seven separately confirmed findings were added, for 43 entries overall
(32 confirmed, 11 rejected). The rejected findings must not be propagated
as errata. BPLZZ findings concern arXiv v3 only; the Annals full text was
not obtained. E10 is only an omitted simultaneous-normalization argument,
not a disproved projection statement. See each review reason and the two
explicit sourceVersions records in the packet.

Checks completed:

- Packet checker: 0 errors, 0 warnings.
- Independent packet/reader/stage consistency, review coverage, local DAG,
  supplier back edges, input routes, planet bounds and source-verdict checks.
- `git diff --check`.
- `lean-check` at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` /
  Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: exit 0, only 23
  expected proof-placeholder warnings; 156 lines, no data placeholders.

No review work remains for this issue. Future supplier/source and packaging
jobs must resolve the recorded contracts, especially the original analytic
inputs not obtained here. Generic operator ideals, spectral calculus and
reductive-group structure remain with current upstream owners. Current
upstream comparisons use TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. CongruenceSpectralGap retains
its routed Bakker–Tsimerman item. This acceptance does not close a stage or
claim a proof. No scratch files are needed to continue.
