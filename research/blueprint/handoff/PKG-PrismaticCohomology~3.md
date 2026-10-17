# PKG-PrismaticCohomology~3

Completed package work for issue #10231 by **Codex**, session **codex-LCDmzo**, 2026-10-17. The bot confirmed the claim. This is a package-author submission, not an independent review or a mathematical closure verdict.

## Final scope and integration

The authorized deliverables name `packages/PrismaticCohomology/`, which now contains Part I, Layers 0–2. The concurrently merged [#10228](https://github.com/CBirkbeck/tauceti-explorer/pull/10228), commit `b524d95e946713198b5ac7f957e729b6f8c2d192`, supplies the maintainer-authorized four-package split and the A–F compaction, supplier and mathematical repairs recorded in [its handoff](FIX-PKG-PrismaticCohomology~adv2.md). This submission preserves that split, every existing section number and anchor, and the complete upstream Part I Lean file. It adds the three whole-roadmap nodes belonging to Part I that the split package did not contain. No content is moved back from Parts II–IV.

The final diff against main changes only the authorized Part I README and this handoff. Suggested.lean and metadata.toml are unchanged from current main; review.json, packets, queue, the other three parts and reader documents are unchanged. Part I is 270,389 bytes and 3,304 lines; the 229-line Suggested.lean states the light delta-algebra interfaces available at the pins. The added general envelopes, animated cohomology and enhanced coefficient targets require carriers not present at those pins, so they are full README targets rather than sorry-bodied Lean data.

## Added targets

| Accepted whole-roadmap node | Part I location | Contract and source |
| --- | --- | --- |
| PR.0/general-prismatic-envelope | [§0.93](../packages/PrismaticCohomology/README.md#s0-93) | Arbitrary delta pair over an orientable prism, including unbounded base and targets. Preserve the universal mapping property, functoriality, orientation independence and the conditional regular-envelope comparison. The solution-set construction closes under the inverse coordinates of the two countable telescope operators; it does not assume animated completion is discrete. Koshikawa I Propositions 3.1–3.2, p.13; Bhatt Lecture V Lemma 5.1, p.6 with its bounded convention on p.1; Stacks 091P/091Q/091S, More on Algebra §93, Lemmas 93.1–93.2 and Definition 93.4, pp.261–263. The wider solution-set argument is stated here, not attributed to the bounded lecture. |
| PR.1/laurent-relative-frobenius-cosimplicial-lemma | [§1.13a](../packages/PrismaticCohomology/README.md#s1-13a) | The relative Frobenius comparison for any free Laurent lattice and arbitrary cosimplicial coefficient module, with ordinary degreewise tensor. The residue decomposition respects cofaces; it need not respect codegeneracies. Finite support handles arbitrary rank without descending the coefficient module. The original polynomial §1.13 remains its supplied input. BS22 Lemma 5.4, pp.48–49; Koshikawa I Appendix B Lemma B.4, pp.61–62. |
| PR.2/quasiregular-quotient-initial-prism | [§2.13a](../packages/PrismaticCohomology/README.md#s2-13a) | A surjection from the reduction of any bounded prism, with bounded p-torsion and p-completely flat shifted relative cotangent complex, gives a bounded initial relative prism against all targets, including unbounded ones. The base need not be perfect and the original kernel need not be regular. The auxiliary regular presentation proves the idempotent is the identity; general-envelope agreement follows from the same mapping problem. Koshikawa–Yao II Proposition 4.17/Lemma 4.18, pp.39–40; BL22 Corollary 4.1.17/Remark 4.1.20, pp.81–82, Remark 4.3.9/Lemma 4.3.10, p.87; BS22 Lemma 7.7/Example 7.9/Proposition 7.10, pp.57–60. |

All nine named API entries and twelve named tests of the two definition/construction nodes are present. The Laurent theorem also has its named statement and four acceptance checks. The three targets supplement restricted suppliers; §0.86 and §2.13 retain their regular hypotheses and numbering. No flatness or boundedness is inferred from arbitrary-envelope existence. Relative initiality is not absolute initiality or independence of the base. Each new target records its hypotheses, route, locators and prerequisites.

## Author validation

- General envelopes: identity; unit ideal forcing the zero ring; nonregular ideal (d,x²,xy,y²); regular comparison only after its extra hypotheses; unbounded-base identity; telescope parameters 0, 1 and 2, with the minus-shift sign fixed by the constant sequence −1.
- Laurent comparison: empty lattice; negative exponent −1 at p=2; the (1,1) residue pair showing failure of codegeneracy compatibility; and a coefficient module over F_p[ε]/ε² that is not flat over the base. The coface contraction survives ordinary tensor with that module.
- Relative initiality: S=A/I for a nonperfect bounded base; S=F_p[x]/x² over the crystalline prism with coordinate x; unbounded target prisms; exclusion of the nonsurjection F_p→F_p[x]; and the divided-power ranks in the regular specialization.
- Existing Part I API/check names and anchors are retained from the merged split. Existing packet validators still report their own historical statuses; this submission changes none of them.

## Ownership and subsequent work

The supplier order remains PerfectoidQuotients → AInfCohomology → PrismaticCohomology Parts I–IV → PadicHodgeTheory. PerfectoidSpaces owns the restricted oriented affine, regular-envelope and perfectoid interfaces. The wider three contracts above are owned by Part I. General animated perfectoidization, perfect-site/arc comparison and arbitrary-idempotent-ideal almost purity remain Part I §§2.0, 2.22–2.31. A future PerfectoidQuotients Part II must import these rather than reconstruct them; its scope sentence is outside the authorized paths.

The remaining ten whole-roadmap additions belong to Parts II–III: enhanced prestack QCoh, flat descent and affine direct image, formal-affine complete QCoh, framed q-automorphisms and derivations, completed infinite-coordinate summability, finite-coordinate decay over a flat base, and the trace/FF named inputs. They must be reconciled with their owning split packages by jobs authorized for those paths. Their five recorded proof obligations remain explicit in the whole-roadmap packet: trace and absolute-prismatic comparison; schematic FF GAGA and the actual prismatic modification match; nonregular two-sided unbounded formal-QCoh effectivity; infinite q-PD/log decay; and trace/syntomic plus integral mixed-characteristic derived-de-Rham matching. Neither a supplied regular calculation nor analytic classification alone discharges these broader statements.

The log consumers in Part IV need the scope of the three new targets. In particular, R6 row 5 uses algebraic inversion of 1+pB and the Jacobson-radical condition before exactification, then the general envelope with unbounded target initiality; rows 30–31 use relative quasiregular initiality after log base change and exactification, without regularity of the original kernel; row 20 uses Laurent relative Frobenius with arbitrary coefficients. Those consumer files are outside this issue's deliverables. The complete pre-split author revision remains recoverable at commit `1f906209a60d9746ebe15f0e5a60f59f923f067a` in this PR's history; it is a source of proposed interfaces and arguments, not permission to restore the unsplit README or an independent review of Parts II–IV.

The inherited package's A–F dispositions and per-target validation remain in the merged fix handoff linked above. No independent-review or mathematical-closure claim is added here. After submission checks, independent review of these Part I additions is the next step.

## Source and library provenance

The current read-only TauCetiRoadmap checkout was checked at `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; no Lake command was run there. Pinned compilation uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Fresh supplier readings included PerfectoidSpaces [#818](https://github.com/TauCetiProject/TauCetiRoadmap/pull/818), head `4624e666622501d4f5f04dcd41ab99dc958e4b58`, especially P4.15.1–P4.15.5; the accepted PerfectoidQuotients fix #10202 and AInfCohomology; and the current AdicSpaces/AlgebraicVectorBundles statements. The coefficient-layer suppliers were also checked during the full author pass: FiniteFlatGroups [#879](https://github.com/TauCetiProject/TauCetiRoadmap/pull/879), `01d05e5bf67b0ad134b2c00ec36d06d04e1a683d`, and PadicPeriodRings [#940](https://github.com/TauCetiProject/TauCetiRoadmap/pull/940), `ef7f47cf3997781ff12f054e90eb739b9a34dff1`.

Primary-source readings: Koshikawa I Propositions 2.16, 3.1/3.6 and Construction 2.17, pp.11–15; Koshikawa–Yao II Lemma 4.18 and proof, pp.39–40; the BS22 relative-Frobenius, envelope and QRSP arguments; BS15 regular completion; and Stacks 091P/091Q/091S. BS22 and BS15 were read in place in the cleared library. Source files and passages were never copied into the repository. Statements and arguments are written in our own words with locators.

Public PDF provenance, accessed 2026-10-17:

- [Koshikawa I, arXiv:2007.14037v3](https://arxiv.org/pdf/2007.14037v3), SHA-256 `90f68a84bc17618b9bf491ad1b6c43e69e81620f3e2ae1139047cb31ab3a180d`.
- [Koshikawa–Yao II, arXiv:2306.00364v1](https://arxiv.org/pdf/2306.00364v1), SHA-256 `7c55cba22922d94587979fbc45296eb51b13f17b3a5cb23c4d5c138c3866541b`.
- [Bhatt Lecture V](https://www.math.ias.edu/~bhatt/teaching/prismatic-columbia/lecture5-prismatic-site.pdf), Lemma 5.1, p.6 and bounded-base convention, p.1; viewed remotely.

## Final checks

- `python3 scripts/check_blueprint.py` on PrismaticCohomology.json and both accepted part packets: zero errors and zero warnings for each.
- `lean-check research/blueprint/packages/PrismaticCohomology/Suggested.lean`: exit 0; exactly 22 warnings, all declaration uses `sorry`, no other diagnostics. Memory available before compiling: 78 GB. No Lean language server or separate build was started.
- `python3 scripts/check_sorry_data.py` on the 229-line Suggested.lean: passed.
- Intake check of all four allowed deliverables: four files, zero problems.
- All 404 local README links resolve, including the cross-part links. No duplicate explicit anchor; all 319 original explicit anchors and 432 named bullet entries from current main survive. All nine added API entries and twelve named tests are present; the Laurent theorem has its four acceptance checks.
- Final diff contains only the Part I README and this handoff; `git diff --check` passes. The shared-main merge preserves every file outside this job exactly as on main.

No Part I package-author task remains. Independent review and authorized follow-up in the other parts remain as described above. This note contains every needed handoff item and requires no scratch artifact.
