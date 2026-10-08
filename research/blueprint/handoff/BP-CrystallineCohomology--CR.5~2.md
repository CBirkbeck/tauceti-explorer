# Handoff: BP-CrystallineCohomology--CR.5, revision 2

Completed target-level revision by **Codex — codex-bTg5jr**, 8 October 2026, for issue #6952. The packet has status **complete**, implementation status **unchecked**, and four **planned** stages. No stage is closed. This is the completed revision pass, with the source and supplier gaps recorded below; it is not a checkpoint or an acceptance review.

Deliverables are the [packet](../packets/CrystallineCohomology--CR.5.json), [reader](../readmes/CrystallineCohomology--CR.5.md) and [suggested signatures](../suggested/CrystallineCohomology--CR.5.lean). The existing [independent review](../reviews/REV-CrystallineCohomology--CR.5.md) was read together with every checked row. Its entire packet review object remains unchanged for the next independent reviewer.

## Inventory and preserved corrections

All 88 node identifiers are retained: **22 definitions, 33 constructions, 27 theorems and 6 comparisons**. There are **165 named API statements, 165 named tests, 19 planets and 25 cited baseline declarations**. The suggested file also has five supplementary examples. The planets remain distributed 6/5/5/3 across log-algebra/CR.5/CR.6/CR.7. Each node’s new suggestedNotes describes its repaired prototype slice; the reader gives the corresponding statement, proof outline, prerequisites, APIs, tests and acceptance conditions.

The reviewer’s corrections are preserved: integrality of the characteristic is a consequence, rather than a converse; the groupification quotient uses the image of ring units; fixed-source PD envelopes retain base extensions on source and ambient; compatible thickenings use a common extension on J+IO_T. Ordinary products/Künneth stay CR.3-owned. The R06.5 dependency cycle stays removed, AI.0:integral remains the exact period prefix, generic derived limits are explicitly requested from DD.1, and analytic coefficients remain the completed K̆₀. The four independently confirmed source issues E7051–E7054 and their verdicts are unchanged.

## What this round changed

- **Log geometry.** Actual schemes and monoid sheaves on their small étale sites now constrain geometric morphisms. Strictness uses the pulled-back log sheaf, and exact/integral/Kummer conditions use actual geometric stalk maps. Ordinary, integralized and fs products have separate universal properties. The full Kato chart equivalences use strict étale source and target neighborhoods, group kernel/cokernel conditions and the canonical toric map. The square-zero lifting tests require closed log immersions, including log-stalk surjectivity: a closed scheme map alone would admit obstructed Kummer roots. The SNC and tame-cover views refer to the supplied regular parameter charts and canonical inertia groups. Fine models of quasi-coherent log smooth maps contain actual log smoothness and source/base localization.
- **PD geometry and crystals.** Thickenings contain the actual closed log map and compatible PD structures. Named coordinate envelopes, the mod-p diagonal and dual-number tests exercise those constructions. Crystalline covers are strict étale and have cartesian source squares. Crystals are module sheaves with cartesian transitions, and the trivial-log equivalence is the actual forgetful functor. Exactification, PD stratification, the crystal/connection equivalence, Poincaré and descent compare objects indexed by the same geometric source.
- **Connections and limits.** The full exterior differential determines curvature and the coefficient complex. The nonintegrable example computes the curvature of d+x dy. Quasi-nilpotence uses full ordinary/logarithmic Taylor multiindices. Formal reductions and Witt quotients form coherent chain-level towers with their actual transition maps. DD.1 supplies a fixed derived-limit functor; the ordinary continuous-limit comparison explicitly requires degreewise-surjective transitions of a chosen resolution. The point and zero tests refer to these towers, and the Roos example detects the additional derived contribution.
- **Hyodo–Kato.** The special-fiber geometry determines integral/rational cohomology, raw Frobenius and raw right-wedge monodromy before their relation is proved. Properness appears in finiteness and nilpotence. One semistable model determines both sides of the uniformizer comparison, including the actual point map, good-reduction independence and product compatibilities. The Tate tests are tied to its geometric HK basis, with the unscaled valuation coefficient retained as a proof gap. Qian’s family includes properness. The ramified DVR comparison prototype also retains properness and the normalized raw monodromy factor.
- **Analytic branch.** Tube complexes and support use the RD.4 source site and specialization; support is applied before derived pushforward. The relative/absolute triangle has its actual connecting map and sigma-pulled Frobenius. Sato and log-rigid comparisons retain strict semistability/admissibility. Stein inputs contain a semistable weak formal model, special-fiber cover and admissible affinoid exhaustion with radius and Runge witnesses. The complete Hausdorff metrizable seminorm carrier has continuous maps and an actual countable limit cone. Tower transitions are geometric HK pullbacks. Linear symmetry actions and coefficient-semilinear arithmetic Galois transport are distinct; full Galois cocycle and continuity exports remain with the suppliers.
- **Coefficients.** Actual finite-projective crystal evaluations determine tensor/dual and PD connection maps. The rational arithmetic package uses the R06.2 horizontal category and the correctly oriented Nφ=pφN relation. R07.2 Dieudonné tests use the constant and multiplicative groups, both F and V, and the −1 dual twist. A chosen lifted group determines its Messing filtration. Relative direct image and BO base change refer to the actual family and PD maps. Gauss–Manin uses its canonical boundary and specified degreewise projectivity/base-change hypotheses. Identity and constant-family tests compute those connections; the two-term multiplication-by-p complex detects torsion. PD coefficient compatibility differentiates the actual stratification instead of assuming the identity being proved.

Affine PD bases/evaluations and finite semistable chart calculations are explicit suggested-file specializations. Named DD.1, RD.4/RD.5, R06.1/R06.2 and R07.2 clients identify the required exports; they do not claim those exports are implemented. The full mathematical targets remain in the packet and reader.

## What remains and where to resume

| Stage | Status | Required acceptance work |
| --- | --- | --- |
| CrystallineCohomology:CR.5:log-algebra | planned | Complete the log Abhyankar/local log-regularity proof inputs and the finite-model nonnoetherian boundary chain; obtain the SNC/tame supplier exports. |
| CrystallineCohomology:CR.5 | planned | Supply CR.0 envelope/canonical-base exports, DD.1 coherent derived limits, and the complete O_C/A_cris lift proof chain; apply the proposed quasi-coherent substage through restructuring. |
| CrystallineCohomology:CR.6 | planned | Supply CR.4 log Witt/Sato objects, analytic/topological exports and the geometric Tate valuation/sign calculation. |
| CrystallineCohomology:CR.7 | planned | Supply R07.2 crystalline Dieudonné/Messing maps, R06.2 coefficient transport, and CR.3 degreewise projectivity/base-change criteria. |

Four recorded gaps remain:

1. Full logarithmic Abhyankar descent and the local log-smooth/log-regular proof. Thompson Theorem 3.14, p.32, points to Kato’s Toric singularities Theorem 8.2; that local completed-ring proof remains unobtained.
2. A public geometric Tate-curve residue/valuation proof with the chosen orientation. The prototype specifies the intended identification; it does not close this proof gap or import downstream R06.5.
3. The complete non-fine O_C formal-boundary and period-lift approximation chain beyond the read finite-model statements. Arbitrary non-fine log regularity is not asserted.
4. DD.1’s generic coherent countable derived-limit export, projections and Milnor comparison. Its current derived-completion localization is insufficient as a substitute.

Nine requests retain their sole owners: R09.7a for SNC boundary charts; LPV.5 for tame Abhyankar input; AI.0:integral for tilt/sharp/Teichmüller; R06.1 for complete arithmetic coefficients, unit log and Galois action; RD.4 Part II for logarithmic tube/support/weak-formal/exhaustion foundations; RD.5 Part II for continuous limits, completed tensors and semilinear Galois transport; R07.2 for Dieudonné and Messing; R06.2 for filtered arithmetic coefficients; DD.1 for generic derived limits. Their exact consumers and exports are in the packet.

RT-AREA-padic-2/14 remains addressed by the Beilinson finite-level integral quasi-coherent PD branch and its proposed **CR.5:qc-crystalline** successor, with **AI.6** requiring it. Common A_cris remains CR.0-owned. The RD Part II proposal remains explicit. No atlas, upstream roadmap or supplier packet was edited. RS-01 has an accepted earlier review in its history, but its latest review of 7 October is pending; this job follows the currently integrated scope.

## Sources and validation

All 18 exact public source-file hashes were reproduced. The packet records the 8 October passage reading separately from the preserved 6 October independent audit. Kato’s chart proof, Cartier, PD, connection and final Künneth passages and BO Theorem 7.8 were checked visually. Targeted rereading covered Hyodo–Kato §§2.16–2.24, 3.1–3.6, 4.19–4.20 and 5.1–5.5; Beilinson §§1.1–1.8, 1.12 and 1.17; BKV §§2–3; Qian Theorem 3.2 and its properness-dependent proof; DL Appendix B; the Stein/exhaustion and ind-Fréchet passages of the two CDN sources; the cited GK/Sato residue comparisons; CK/Koshikawa finite-model inputs; and de Jong’s Dieudonné/Messing passages. Detailed section/page locators are in the reader’s source ledger. All repository statements are paraphrases; no source files or passages were added.

All 25 baseline declaration statements were reread at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. The reviewed coverage file has no CR entries, so absence there is not an absence proof. The upstream AdicSpaces and HodgeStructures roadmap documents and the exact supplier scope were read.

Validation:

- Packet checker: **0 errors, 0 warnings**.
- Suggested file: **lean-check exited 0**, with only declaration-uses-sorry warnings, in the existing pinned Mathlib build. This establishes elaboration only. The unbuilt Tau Ceti exponential wrapper was read at its pin; the file uses its underlying Mathlib operation.
- Name audit: all **88 primary declarations, 165 APIs and 165 named tests** occur; there are five additional examples.
- Preservation audit: all node identifiers, the entire existing independent review and the four confirmed source-issue records are unchanged; all 18 hashes match.
- Reader reconciliation and **git diff --check** passed. Only the four issue-authorized deliverables changed. No build/update/cache command or language server was used, and memory availability exceeded 20 GB for every check.

The next action is a fresh independent review of this revision, especially the geometry-bound comparisons, canonical maps and supplier slices. Its verdict must replace the retained review object before any acceptance. Subsequent workers should use the precise gap/request/coverage endpoints above, rather than reconstructing this run’s scratch files.
