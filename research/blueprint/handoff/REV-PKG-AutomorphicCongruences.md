# REV-PKG-AutomorphicCongruences handoff

Completed independent package review for #10892 by Codex, session `codex-8KbFeA`, 2026-10-20. Claim comment 6291968016 was confirmed by the bot in comment 6291971507. The input package was authored by `codex-5MsNSf`, so this review is independent. No second job was claimed.

## Result

`review.json` records **needs_changes**. The full evidence, sampled source locators, adversarial pass, source limitations and exact remaining defects are in [the review report](../reviews/REV-PKG-AutomorphicCongruences.md). This is a completed review, not a checkpoint of an unfinished review. It does not approve an upstream port.

Only the package README, review verdict, review report and this handoff were changed. Suggested.lean and metadata were read and validated without changes. Both accepted packets are untouched. All 92 target anchors, all 130 input API items, every input Check/acceptance requirement and all ten layer example sections remain. One explicit normalized-series API was added.

## Applied fixes and ownership notes

- Separated SU raw E_D, normalized G_D, classical C_D and integral c_D, including the exact scalar, raw boundary identity and singular-coefficient domain. Added the normalization API and a discriminating scalar Check.
- Corrected the rank-one-image matrix Check: for A=[[1,p],[0,1]], the quotient by A−1 has the finite torsion; the cokernel of A is zero. The intended negative control is retained.
- FW's auxiliary witness prime is ramified in Definition 4.24; corrected L2.10 and its 2-adic cases. SU's separate inert choice remains in L1.11.
- Read original HT93, Hid91, Hid06, Vatsal, Paškūnas 2016, Pottharst and Betina–Williams statements. Added exact locators/hypotheses and corrected Paškūnas's attribution. Hid06 p>3 does not discharge CLW p=3.
- Current Kato package routing: rational morphisms §§5.1/5.4, cohomological upper bound §7.2, elliptic ordinary §7.4 and modular ordinary §7.5. The proposed BSTW ordinary two-variable extension belongs to **KatoEulerSystems, Part II**, not its already occupied Layer 5. Packet and cross-roadmap reconciliation must be done by the appropriate later job; no other roadmap was edited.
- Existing generic discrete Selmer kernels remain EllipticCurves Layer 7's; normal-domain characteristic divisors and graded determinants remain PMIA L4/L5's. AC's retained targets are exact arithmetic instances and refinements. No existing upstream target was replanned or removed.
- The polarized rank-four theorem remains IHG Part II's, Yager's integral comparison PadicHodgeRegulators Part II's, definite-unitary triple products AL.3's, unitary Jacobi extraction MP.6's, and the sufficiently regular CAP exclusion AutomorphicSpectralTheory Part II's. The package does not claim those refinements already exist.

## Where to resume

1. Resolve R1 in the review: AC has no assigned upstream tier/bundle. Its Kato, unitary analytic and regulator suppliers cannot all be certified lower-tier from the present CaraianiNewton list. Reconcile the actual required layers, including the recorded moved-down notions.
2. Supply exact statements/plans for IHG's polarized lattice/length theorem, analytic finite-slope Selmer comparison, integral Yager comparison, equal-Satake period adapter, Hilbert period/control refinements, ordinary BSTW reciprocity/duality and integral elliptic image/period bounds. The source-localized maps, saturated lattices, torsion and nonzero-function conditions must remain explicit.
3. Close L0.9's integral CM congruence/Katz comparison at the exact tame level and coefficient ring, including p=3. HT93 Petersson identities, Hid91 Lemma 5.3 and Hid06's p>3 theorem alone do not close it.
4. Verify original HT94, Harris 1984 Thm 2.5.6, Ikeda 1994 and Ichino 2008 with the exact local/weight normalization comparisons. Primary publisher, author and archive routes were tried; the original claims remain explicit source gaps. The FW general-weight two-family repair also remains unresolved; scalar weight-two CLW is insufficient.

The review's 15-source sample uses seed 10892 on the concatenated L0,L5b packet node lists. Its complete selected-target/locator table is in the report. That table and the linked original sources contain the information needed after scratch deletion; no source passage or fetched PDF is a deliverable. Some original statements and selected proof passages were read, not every proof in every paper.

## Validation and environment audit

- Mathlib pin `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369`. Baseline declarations were read locally at these revisions.
- Current read-only roadmap tree `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Checked all nine newer roadmaps, all four newer Completed roadmaps and the nearest IHG/EllipticCurves/ProfiniteCohomology owners. No duplicate retained arithmetic target was found.
- `lean-check` Suggested.lean: exit 0 with only the two expected sorry warnings at 39 and 82. It ran in the shared pinned build after the memory check; no lake command ran in a read-only tree.
- Both packet validators: zero errors/warnings; 69+23 nodes, 125+5 API items and 68+4 input tests.
- All 92 target anchors and internal links checked; 18 definition/construction interfaces each retain at least three discriminating Checks.
- Intake file validation: zero problems. Whitespace check clean.

## Security and stopping

Sources and other workers' text were treated as data. No suspicious instruction requesting commands, credential use or unrelated changes was encountered. No fetched content was executed; no private book or uncleared copy was used; no source passage was copied into the repository. The only external messages were the authorized claim and pull-request submission. Scratch sources and logs are disposable and are deleted after the PR opens. No background compile remains, and this worker stops after this one PR.
