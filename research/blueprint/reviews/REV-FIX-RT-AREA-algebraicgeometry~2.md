# Independent review of FIX-RT-AREA-algebraicgeometry~2

**Blocked checkpoint: five issue-listed packet verdicts are accepted; the eleven-packet queue review is incomplete.** Reviewer `independent-review-REV-FIX-RT-AREA-algebraicgeometry~2`, Codex session `codex-C7DgOu`, 10 October 2026. Refs [#5702](https://github.com/CBirkbeck/tauceti-explorer/issues/5702), reviewing [#5701](https://github.com/CBirkbeck/tauceti-explorer/issues/5701). This follows the bounded checkpoints [#8057](https://github.com/CBirkbeck/tauceti-explorer/pull/8057), [#8118](https://github.com/CBirkbeck/tauceti-explorer/pull/8118), [#8134](https://github.com/CBirkbeck/tauceti-explorer/pull/8134) and [#8144](https://github.com/CBirkbeck/tauceti-explorer/pull/8144). I did none of the red team, verification, fixes or preceding reviews.

## Scope and completion blocker

[WORKERS.md](../WORKERS.md), Doing the work, says “Edit only the files the issue names, plus your own scratch space.” The issue's deliverables and full instructions still list five packet/suggested-file pairs: MotivesAndAlgebraicCycles, AlgebraicModuliForArithmeticGeometry--A0-extension, SchemeAndStackFoundations, AnabelianGeometryAndNonabelianChabauty and NeronModelsAndSemistableAbelianVarieties. The queue additionally requires PELModuli, ShimuraCompactifications--C0, ShimuraVarieties--V0, AdicCoefficientsAndComparisons, GrossZagierAndArithmeticHeights--GZ.0 and ShimuraData. The queue's generated prompt is absent.

I requested authorization to complete all eleven pairs during this run. It remains outstanding; a fresh issue read after the bot confirmed my claim still names only five. I edited only their review records, this report and the handoff. All six additional pairs were read-only evidence. `issues.py:deliverables_complete` requires this job's marker in all eleven packets and remains false. The maintainer must authorize the six additional pairs in both issue sections, or reconcile the queue to five. The six packets must not receive blanket acceptance: Adic still has a false cycle claim, and ShimuraData still fails Lean. This is an edit-scope blocker, not a time-limit checkpoint.

## Review method and changes

I read every high/medium finding and its verifier disposition, both fix ledgers, the preceding reviews/handoff, and the affected nodes, supplier requests, coverage, gaps, embedded ownership proposals and suggested interfaces. Round 2 covers 32 findings: /1–/4, /6–/18, /20, /21 and /23–/35. Findings /5, /19 and /22 are earlier upstream-only notes; low findings /36–/46 are outside this review.

The five accepted verdicts concern the recorded area-fix corrections and explicit handoffs. They do not establish supplier implementations, discharge inherited gaps, install edges, certify whole blueprints anew or supersede other queued independent reviews. Their preceding review objects are preserved in `reviewHistory`. No mathematical node, source match, request, Lean signature or test needed further correction in these five packets.

The reviewed baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. I checked the affected library-coverage records and pinned stack-descent and Hodge-conjugation interfaces. Generic categorical stack descent does not supply geometric algebraic spaces or stack representability. Native `Hodge.Conjugation` bundles `toEquiv` and involutivity; it has no function coercion, which explains the first ShimuraData failures. No new baseline citation was introduced; unrelated inherited citations were not all re-audited.

I read the full current AlgebraicVectorBundles and Completed/HodgeStructures READMEs, their relevant suggested interfaces, and the affected StableReduction and ReductiveGroupsPartII README/Suggested sections. RG2.0a already plans Weil restriction for arbitrary affine targets along finite locally free extensions; R09.3 extends to algebraic spaces. StableReduction Layer 2 already plans general proper coherent cohomology over locally Noetherian bases, without a relative-dimension bound. Current HodgeStructures uses native library carriers and is completed; geometric Hodge theory remains distinct. AlgebraicVectorBundles L1A already owns relative Spec, with `relativeSpec`, its universal property and base-change interfaces; the current Tau Ceti library also has RelativeSpec modules. Later foundations/consumer work must import that supplier rather than plan it again. A search of the new DifferentialGeometry roadmap did not find the requested Ehresmann/relative holomorphic supplier. These current documents and libraries were read-only evidence, and no Lake command was run there.

## Finding verdicts

“Recorded” accepts the packet-side ownership correction or explicit request, not a proof of the requested theorem. “Handoff” means the remaining job is identified and its mathematical boundary is retained.

| Finding | Verdict and reason |
|---|---|
| /1 | Recorded. SF.1 owns general spaces, diagonals and stacks; A0 imports those interfaces and retains moduli-specific descent/gerbes. The unfinished stack targets stay visible. |
| /2 | Recorded; preceding correction verified. The accepted A0-extension-2 leaves `g-ring-finite-type`, `polynomial-approximation`, `common-etale-neighbourhood` and `formal-object-approximation` precede the criterion and R09.6. A new R09.6 approximation owner would duplicate them. Noetherian/G-ring assumptions, original Artin base restrictions and henselian versus pointed-etale conclusions remain explicit. |
| /3 | Consumer handoff adequate in the six-pair read-only scope. PEL and both Shimura consumers request the same nilpotent-preserving analytic carrier from C0 and retain its gap. SGA 1 XII 1.1–1.2 requires locally finite-type complex schemes, including nonreduced ones, and compatible morphisms/products; reduced manifolds alone cannot supply this. |
| /4 | Recorded. Motives requests a geometric Hodge layer after C5 and explicitly says its owner is not accepted. Completed abstract HodgeStructures does not provide degeneration or geometric Hodge decomposition. |
| /6 | Upstream handoff. AlgebraicCurves 12B imports projectivity from StableReduction 2 rather than relying on a nonexistent general pinned projective-morphism API. |
| /7 | Handoff adequate. FA.5 must supply F. K. Schmidt with exact finite constants; the upstream zeta-free curve scope does not prove the degree-one-divisor input. |
| /8 | Recorded. SF.3 leaves abelian Neron-Severi theory to A2. NC.5 requests Pic/Pic0, its map into symmetric Hom, finite generation and Picard rank. A6's finiteness input is not a second definition. |
| /9 | Handoff adequate. C4 imports AlgebraicCurves 12B/12C completion and Layer 6's open-immersion/function-field dictionary. It does not construct a second smooth completion. |
| /10 | Recorded. R09.3 imports finite locally free quotients from ModularCurves 0C and object/polarized descent from 0E and StableReduction 2. Compatibility with SF.1 is still requested. |
| /11 | Recorded against current upstream. SF.0 does not plan Weil restriction. ModularCurves 0F, existing RG2.0a and R09.3 respectively supply the initial affine case, affine extension and algebraic-space extension. Do not recreate RG2.0a. |
| /12 | Recorded. R09.1 imports ModularCurves 0G and StableReduction 2's Proj/projectivity/ampleness. Flags, twists and broader applications remain extensions, coordinated with the current AlgebraicVectorBundles successor boundary. |
| /13 | Handoff recorded. R09.7a imports StableReduction 4 blowups and flat/smooth base change; marked-ideal transforms remain its own extension. |
| /14 | Recorded. Proper coherent cohomology over locally Noetherian bases is imported in all relative dimensions. A0 retains only its specified non-Noetherian/perfect/Tor-amplitude extension. |
| /15 | Preceding correction verified. The SF.5 rescope removes unnecessary formal/Neron forwarding inputs, but a longer SF.4-to-MC.4 path survives. It does not license the reverse cover edge. |
| /16 | SF-side disposition accepted; Adic needs correction. SF.4 is the single schematic-alteration owner and L5 retains comparison descent/local calculations. Adic's G-owners and rescope still imply that deleting SF.4-to-SF.5 permits MC.4-to-SF.4. The reproduced graph disproves that sufficiency claim. RD.5 retargeting from L5 remains its own job's action. |
| /17 | Preceding SF correction verified. StableReductionPartII MC.0/MC.2 owns pointed moduli and the proper-DM theorem; MC.4 owns projective covers. Its unpointed genus-at-least-two range must extend to every genus and at least three marks for de Jong 2.24. The level cover is finite etale on the smooth open; normalization across the boundary is only asserted finite/dominant/projective. The node-level supplier split and longer cycle remain open. |
| /18 | Recorded. SF.2 `key/coherent-duality` is the general owner and A0 imports it. Upstream curve duality is a specialization, not another general f! construction. |
| /20 | Historical upstream handoff checked against current main. The current J-E contract already names multiplication finite etale of degree ell^(2g) and geometric torsion. Its supplier is the Jacobian/abelian-variety theory, with A3 supplying the general torsion interface. Do not report these words as still absent from current upstream, or confuse roadmap targets with pinned implementations. |
| /21 | Prior correction verified against Tate section 6, printed p.46. I0, I1 and II have one geometric component; positive I_n has n, III 2, IV 3, I0* 5, positive I_n* n+5, IV* 7, III* 8 and II* 9. The positive-index conditions and distinction between components, component groups and rational Tamagawa factors remain. The discriminant/conductor rows below the characteristic line have extra restrictions. Actual regular-model/resolution comparisons remain G-Kodaira-resolution. |
| /23 | Bounded upstream note adequate. The curve-Jacobian criterion requests R11.1/R11.3/R11.4 and Jacobian D, retaining excellence and residue-field hypotheses. Node-level placement is necessary in the broader research graph. |
| /24 | Handoff adequate. TB.2 needs the rank-one Bosch–Lutkebohmert theorem or a discretely valued-model restriction; a DVR result alone cannot supply the general valuation claim. |
| /25 | Handoff adequate. TB.2 imports nodal dual graphs/genus and adds metric lengths, skeleton and retraction. It does not own a second combinatorial graph theory. |
| /26 | Read-only consumer correction adequate. GZ.2 requests StableReduction 1/4/5/7 for dual graphs, intersection matrices, models and semistable base change. Green/admissible measures and global arithmetic gluing remain GZ-owned. Its broader negative blueprint review remains relevant. |
| /27 | Read-only imports adequate. ShimuraData D1/D3 request native Hodge L0/L1; compactifications C1 requests L2. These abstract imports do not repair ShimuraData's failed elaboration or inherited D0 bridge defects. Other consumers/atlas links remain handoffs. |
| /28 | Read-only consumer handoff adequate. V1 retains the holomorphic-gluing gap and requests PR279 Milestones 5–7 or the same atlas-owned carrier. A fresh check of TauCetiRoadmap PR279 shows open/unmerged, not a pinned implementation. |
| /29 | Handoff adequate. C5 still requires the additive constant-sheaf/singular comparison and coefficient/product laws; a finite-coefficient local-system contract does not replace integral/rational/complex comparison. |
| /30 | Handoff adequate. Relative proper GAGA, relative Poincare/Gauss-Manin and an applicable Ehresmann supplier remain tasks. SGA 1 XII 4.2 retains properness, coherent coefficients and locally finite-type complex schemes; absolute projective GAGA alone is insufficient. |
| /31 | Prior typed correction verified. C5 supplies Betti-de Rham and SF.6 supplies etale-Betti transport. Motives carries both diagram-edge laws, unit/product laws, ProductCompatible and explicit Tate rank-one homology. The period point takes the witnesses; doubling a comparison fails its unit requirement. The arbitrary-pair geometric supplier remains requested. |
| /32 | Recorded on the algebraic side. R09.1 names O(n), projective-space cohomology with multiplication and absolute/relative Serre A/B, importing general proper cohomology. C1–C3 analytic suppliers remain handoffs; SGA 1 XII 4.2's proof uses projective-space computations before reducing proper morphisms to projective ones. |
| /33 | Handoff adequate. C4 imports the AlgebraicCurves function-field/completion dictionary, not R09.3 quotient theory. |
| /34 | Read-only ownership correction adequate. C0 has one arbitrary-ring finite-fan toric owner, including valuation-ring bases; the nonarchimedean sibling imports it before formal/adic/perfectoid extensions. Its API/tests name base change, face localizations, torus action, the complex anchor, nilpotent bases and the zero cone. Compilation checks only the represented slice, not omitted geometric contracts. |
| /35 | Handoff adequate. SGA 1 XII remains a source for nonreduced analytification (1.1–1.2), proper relative pushforward (4.2), proper coherent GAGA (4.4) and proper full faithfulness (4.5). Campaign reconciliation remains outside this review's edit scope. |

Findings /5, /19 and /22 are outside round 2. Their earlier upstream notes distinguish divisor-degree from Euler-characteristic comparison, identify Jacobian/ModularCurves suppliers and retain rational-point/Picard-torsion/multicross/Gorenstein inputs. Current StableReduction already spells out several of these numerical inputs; historical notes are not current absence claims. No verdict is assigned to /36–/46.

## Dependency reproduction and concrete Adic correction

I assembled the promoted atlas with `scripts.build.assemble(require_distances=False)`, then added each stage's requires and the research roadmap definitions' requires as supplier-to-consumer edges. This union has 15,601 edges and is acyclic. Removing SF.4-to-SF.5 and the five R11.1/R11.3/StableReduction 7/8/9 forwarding edges leaves it acyclic, but preserves:

```text
SchemeAndStackFoundations:SF.4
 -> DerivedDeRhamCohomology:DD.5
 -> PerfectoidQuotients:Q3 -> PerfectoidQuotients:Q4
 -> AdicEtaleGeometry:A3
 -> RelativeFarguesFontaine:RF0:integral-Y
 -> VectorBundlesAndIsocrystals:VB0
 -> AbelianSchemesAndArithmeticModuli:A4
 -> PELModuli:M2 -> PELModuli:M6
 -> StableReductionPartII:MC.4
```

Adding the nine other proposed edges jointly remains acyclic: SF.3/R09.1 to SF.5, SF.4 to L5/RD.5, MC.2 to SF.4 and R11.1/R11.3/R11.4/Jacobian D to StableReduction 7. Adding MC.4-to-SF.4 then makes a cycle. These are read-only checks of proposals, not installed edges or a certification of every unreviewed packet.

Once authorized, replace the sufficiency claim in Adic `G-owners.detail` and the first rescope `proposal` with this boundary: SF.4 stays the schematic-alteration owner; the SF.5 rescope is necessary for the displayed short cycle but does not remove the longer path above. Keep MC.4's pointed-cover extension as a request attached to alteration nodes. Split or reroute formal/cohomological consumers before approving a whole-stage MC.4 import. L5 and RD.5 consume the schematic supplier; RD.5 retargeting remains its own job. No competing L5:alterations owner should be introduced. This is a concrete repair specification, not a silently edited extra packet.

## Additional six-pair review conclusions

The table records read-only evidence for the next authorized review. It is not a substitute for the required top-level review markers.

| Additional packet | Fix-region conclusion and acceptance limitation |
|---|---|
| PELModuli | /3 imports/gap are correct. Preserve the preceding needs_changes review: full-node carriers/signatures omit or weaken the geometry; successful Lean elaboration does not repair that mismatch. |
| ShimuraCompactifications--C0 | /3, /27 and /34 ownership is correct. The full suggested file now elaborates, so the old missing-olean limitation is obsolete. The substantive objection remains: 83 geometric declarations, 109 API items and 84 packet tests are comment contracts rather than actual Lean signatures/examples. |
| ShimuraVarieties--V0 | /3 and /28 handoffs are correct. Preserve the unresolved all-type automorphic boundary predicate and reader specification contradictions from its preceding negative review; the suggested file represents only two genuine Mathlib-level slices. |
| AdicCoefficientsAndComparisons | /16 has the correct owner but the incorrect cycle boundary specified above. Needs_changes until G-owners/rescope agree with SF's corrected longer-path boundary. |
| GrossZagierAndArithmeticHeights--GZ.0 | /26 supplier imports are correct. Preserve the preceding broader source-version, supplier and carrier/API/test correspondence objections; this area review does not certify the exact YZZ book pagination. |
| ShimuraData | /27 native imports are correct, but the full Lean file exits 1. Its five inherited D0 bridge prototypes also remain unverifiable. Preserve needs_changes rather than accepting the full packet for its Hodge import alone. |

## Public source receipts

The following public files were fetched and the listed passages read on 10 October 2026. Descriptions are my own words. No source passage, downloaded PDF or restricted book is committed.

| Source | Locators used | SHA-256 |
|---|---|---|
| [de Jong, Smoothness, semi-stability and alterations](https://www.numdam.org/item/PMIHES_1996__83__51_0.pdf) | Section 2.12, pp.56–57 (trait means spectrum of a complete DVR); Section 2.24, printed p.62 (pointed finite projective cover); Theorem 4.1/Remark 4.2, pp.66–67 (alteration and ground-field scope); Sections 6.1–6.3 and Theorem 6.5, pp.82–83 (trait base extension and strict semistable pair). | `9e4e7dab2525e9a0fb0820752434c5a168914873b6118f5a967fcccae257ffb7` |
| [Tate, Algorithm for determining the type of a singular fiber in an elliptic pencil](https://wstein.org/Tables/antwerp/tate/tate.pdf) | Section 6, printed p.46, visually read table: counts/groups/configurations and characteristic restriction. Section 7's complete resolution proof was not newly decomposed. | `8650805838f84ad1bc9afa169b1797bd345fb7d9ea4628cdf995c83a10aaccfc` |
| [Huber–Muller-Stach, arXiv:1105.0865v5](https://arxiv.org/pdf/1105.0865v5) | Theorem 1.6 proof, p.5; Theorem 2.10, p.11; Definition B.14/Proposition B.16, pp.20–22; Assumption B.20/Lemma B.21/Proposition B.22, pp.24–25. | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` |
| [Artin, Algebraic approximation of structures over complete local rings](https://www.numdam.org/item/PMIHES_1969__36__23_0.pdf) | Section 2's finite-type base convention, p.27; Corollary 2.6 and proof, pp.28–29. | `38beaf58d5c557675c3783b6f25a68cfb1bbdbec84882e996f9d7d4b4cc6b434` |
| [SGA 1, arXiv:math/0206203v2](https://arxiv.org/pdf/math/0206203v2) | Expose XII 1.1–1.2, re-edition pp.239–241; 4.2, p.248; 4.4, pp.249–250; 4.5, pp.250–251. The PDF also prints original pagination in the margin: 312–315 and 327–332 respectively. | `8e64218d356456c534eebf996940f0f957e43b54f1a080241debe12cbaf60d3c` |

Stacks [16.13.1 (07QY)](https://stacks.math.columbia.edu/tag/07QY) gives an R-valued approximation for Noetherian local henselian G-rings. [16.13.2 (07QZ)](https://stacks.math.columbia.edu/tag/07QZ) gives a pointed etale neighbourhood without henselianity. Those conclusions must remain distinct. The freshly checked [TauCetiRoadmap PR279](https://github.com/TauCetiProject/TauCetiRoadmap/pull/279) remains open/unmerged at head `581f66fed0f12fe49b8f5dd96aa18d3e435c190a`; it is the roadmap proposal, not TauCeti's unrelated pull request with the same number.

## Validation

All eleven packets pass `scripts/check_blueprint.py` against the pinned declaration index, zero errors and zero warnings. Every suggested file was freshly checked sequentially with `lean-check` in the shared pinned build. The ten successful files have zero errors and only declaration-uses-sorry warnings:

| File | Sorry warnings |
|---|---:|
| MotivesAndAlgebraicCycles | 805 |
| AlgebraicModuliForArithmeticGeometry--A0-extension | 1040 |
| SchemeAndStackFoundations | 362 |
| PELModuli | 274 |
| ShimuraCompactifications--C0 | 28 |
| ShimuraVarieties--V0 | 23 |
| AnabelianGeometryAndNonabelianChabauty | 699 |
| AdicCoefficientsAndComparisons | 53 |
| NeronModelsAndSemistableAbelianVarieties | 53 |
| GrossZagierAndArithmeticHeights--GZ.0 | 443 |

ShimuraData exits 1 and reaches `maxErrors=100` at line 883: 100 error diagnostics plus the error-limit diagnostic, 110 sorry warnings and three other warnings. This reproduces #8144's error-limit result; it is not an exhaustive count of all remaining defects. Initial failures are the unsupported application of `Hodge.Conjugation` at lines 186/210/218, a stuck comodule at 213, the gradedRealHodge carrier mismatch at 285 and the reserved GL parser collision at 363. The non-sorry warnings concern SRep universes at 176 and class-valued definitions at 261/440. Later failures cascade. The extra file is unedited. Repair actual native carriers/instance transport and identifier binding, retaining D0's substantive bridge objections; placeholders or assumed conclusions are not repairs.

The five metadata-only changes introduce no test or Lean code change. All eleven checker and Lean results above were freshly reproduced by session `codex-C7DgOu`; none is merely inherited from #8144. Intake file checks and `git diff --check` pass. No link map or standalone restructuring result is changed; embedded proposals received the graph check described above. No promotion, upstream edit, build or library update was performed, and no process remains running. The queue completion predicate remains false because the six extra marker writes are outside the issue's edit list. The handoff contains all continuation facts; no scratch file is needed.
