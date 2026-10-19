# Handoff: REV-DESIGN-MordellLawrenceVenkateshPartII

Completed independent review for issue #3576 by Codex, session `codex-hOjy3u`, on 2026-10-19. The original designer was `codex-VNtbmR`. The packet is accepted as a complete target-level planning pass under PROTOCOL §0: **79 nodes, 43 verified and 36 corrected; eleven stages planned, zero closed**. All 61 routed targets are covered. There are 94 API entries, 92 tests and 39 planets. No node was added or removed.

The full evidence and correction inventory is in [the review report](../reviews/REV-DESIGN-MordellLawrenceVenkateshPartII.md). All fourteen source issues have individual confirmed verdicts. E1's record was corrected: LV prints binomial(n+d,d−1)−1; plane quartics distinguish 19 from the correct 14, whereas plane cubics coincide at 9. LS findings are scoped to arXiv v5, not the unobtained published article text. Public source versions, hashes and locators are in the packet. No restricted source was required.

The main mathematical fixes concern convolution in the finite coefficient algebra; rational split-torus conjugacy; the center of a disconnected group's identity component; the single-parabolic-orbit Levi construction; geometric isometry versus arithmetic similitude monodromy; finite-type models; and exact geometric/cohomological prerequisites. The roadmap and reader were synchronized. The suggested Lean file is unchanged and compiled successfully with only nine expected `sorry` warnings.

The **ten gaps and twelve requests remain required work**, not unfinished review. In particular:

- Keep relative crystalline comparison after the existing CP.3/CP.4 suffix dependencies; import general tensor-isomorphism torsors from their owner.
- Preserve disconnected rational orbit descent and the rational Frobenius-polynomial interface. Integral Weil eigenvalues alone do not supply integer Frobenius polynomials.
- Route pure integral Ax–Schanuel, the generic Eulerian CLT, higher-degree Katz–Messing/correspondence traces, curve Shafarevich via Torelli/descent, and the number-field comparison for the stronger finiteness clause to their owners.
- The additional supplier-extension gap identifies local complex analytic Nullstellensatz, Sen/Wintenberger cocharacter image, regular-sequence Hilbert series, André normality, and Eulerian variance/log-concavity/reflection/convolution. Their currently written suppliers prove weaker statements.
- Reuse LPV.5's existing conditional orthogonal alternative. Only exclusion of its finite branch for the universal family and Beauville arithmetic finite index remain extensions. Reuse current AdicSpaces §0.5 for Tate-algebra Noetherianity and Weierstrass inputs.

All four pinned baseline citations were confirmed by their bodies. The audit has no row for this roadmap or its parent; related existing foundations were checked through their actual owners. Current upstream ReductiveGroups and AlgebraicVectorBundles documents were read, all nine newer directions screened, and current Tau Ceti checked; nothing existing was re-planned. No owner was moved and no second Part II was created.

Validation: blueprint checker zero errors/warnings; Swarm changed-file check and whitespace check pass; exact arithmetic examples, routed-item coverage, internal DAG, reader statement/dependency synchronization and API/test inventories pass. No review work remains. The next programme step should use the accepted packet and its precise gap/request lists. This run opens only this review's pull request and stops.
