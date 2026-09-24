# RT-LINK-tauceti_TauCetiRoadmap_EllipticCurves

Red team of [LINK-tauceti_TauCetiRoadmap_EllipticCurves](https://github.com/CBirkbeck/tauceti-explorer/blob/c961a097c7f7fb416cae20ea12b244a43a3821d7/research/blueprint/links/tauceti_TauCetiRoadmap_EllipticCurves.json), accepted after [PR #1045](https://github.com/CBirkbeck/tauceti-explorer/pull/1045). Read 2026-09-24; refreshed atlas revision `c961a097c7f7fb416cae20ea12b244a43a3821d7`. Worker: codex-c83e7a. Refs #1741.

## Result

82 recorded links survive the evidence, scope and graph checks. Found one medium omission in the Tate-uniformization overlap inventory and one low-severity stale-screening-note inconsistency. No high-severity finding; no target files edited.

The medium finding concerns an omitted overlap/comparison, not a false Tate-uniformization theorem and not a request to replace analytic geometry by field-valued points. The independent verifier should assess it at the two exact roadmap contracts below. The low finding concerns the screening history only.

## Independence and scope

Independence: original link commit 3bbae93d74134ee48575d60d889fc8e57f3ac7e9 (Claude session 01LyKFDWpehc4bVvmBWzVFPQ) and independent review PR #1045, commit 7f7471b2b81fde94bcc9fb0c97530d0f1dafac3e (codex-a71f92); this worker codex-c83e7a participated in neither. Claimed issue #1741, bot-confirmed 2026-09-24.

This is an attack on the accepted link map, not a new review of all elliptic mathematics, every cited paper, or the complete Lean libraries. Supplier milestones remain planned mathematical contracts unless pinned declarations were separately inspected. The target packet, its review and all roadmap texts are unchanged.

## Findings

### RT-LINK-tauceti_TauCetiRoadmap_EllipticCurves/1 — medium / missing

The map omits TB.7's actual Tate-uniformization construction from its overlap/comparison inventory. Its screening note says the Tate curve appears only in acceptance tests. TB.7 instead explicitly constructs Tate uniformization. Layer 4 independently constructs the Tate equation and its field-valued uniformization. The analytic quotient is additional work, but the common Tate curve, parameter and induced point uniformization need an explicit comparison in the overlap inventory. The existing Layer 4 -> TB.6 measure-example edge does not record this repeated construction or its reconciliation.

**Where:** research/blueprint/links/tauceti_TauCetiRoadmap_EllipticCurves.json; overlaps; examined[roadmapId=TropicalAndBerkovichArithmetic]; tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv and TropicalAndBerkovichArithmetic:TB.7

**Evidence:** https://github.com/CBirkbeck/tauceti-explorer/blob/c961a097c7f7fb416cae20ea12b244a43a3821d7/content/campaign/TropicalAndBerkovichArithmetic/README.md#L85: TB.7, Construction and export: "Construct Tate uniformization and the Schottky/Mumford-curve quotient in its totally degenerate range; record descent and the period lattice." Its acceptance also says "For a Tate elliptic curve compare the q-period, skeleton length and logarithm branch". https://github.com/CBirkbeck/tauceti-explorer/blob/c961a097c7f7fb416cae20ea12b244a43a3821d7/content/tau-ceti/EllipticCurves/README.md#L836: Layer 4, lines 836–853, fixes a complete rank-one valued field and q in K^× with |q|<1, then "a group isomorphism `L^× / q^ℤ ≅ E_q(L)`, compatible in `L` and Galois-equivariant"; it explicitly says "no rigid-space quotient is in scope". In the target, the sole TropicalAndBerkovichArithmetic link is links[66] (one-based 67), to TB.6; no overlap mentions TB.7. All other link packets were checked for this pair and contain no such overlap. The examined note in the target nevertheless says "The Tate elliptic curve appears only in TB.2, TB.5 and TB.7 acceptance tests. No stage uses or develops an Elliptic curves object."

**Fix:** Add a keep overlap between EllipticCurves Layer 4 and TropicalAndBerkovichArithmetic:TB.7. Preserve the immutable upstream anchor and retain TB.7's analytic quotient, Schottky/Mumford generalization, descent, skeleton and integration work. Specify comparison of TB.7's Tate curve and q-parameter with Layer 4's equation and, on finite extensions in their common scope, agreement of the induced point-uniformization map, kernel q^Z and Galois action. Update the Tropical screening note to describe that construction as well as the TB.6 measure edge. Do not replace the analytic theorem with a point-set group isomorphism or assert an unproved direction; a new dependency edge is optional only after its precise supplier contract is settled.

### RT-LINK-tauceti_TauCetiRoadmap_EllipticCurves/2 — low / other

Several catalogue-screen notes still state the pre-review decisions and contradict the final links array. This is a presentation/provenance error, not evidence that those added edges are invalid.

**Where:** research/blueprint/links/tauceti_TauCetiRoadmap_EllipticCurves.json; examined entries for EffectiveDiophantineMethods, FiniteFlatGroupsAndIntegralPadicHodgeTheory and RankZeroOneBSD

**Evidence:** Within the target at https://github.com/CBirkbeck/tauceti-explorer/blob/c961a097c7f7fb416cae20ea12b244a43a3821d7/research/blueprint/links/tauceti_TauCetiRoadmap_EllipticCurves.json, examined[EffectiveDiophantineMethods] says the elliptic rank computation is 'an acceptance test only' and 'No stage uses or develops an Elliptic curves object', but links[73] and links[74] add Layer 7/Layer 6 -> ED.3. examined[FiniteFlatGroupsAndIntegralPadicHodgeTheory] ends with the same no-use assertion, but links[63] and links[64] add Layer 2/Layer 4 -> R07.5. examined[RankZeroOneBSD] says 'BSD.6a and BSD.7a repeat the BSD.6 and BSD.7 text and are not linked separately', but links[69] and links[77] explicitly target BSD.6a. These indices are zero-based. Each added edge is attributed to REV-LINK-tauceti_TauCetiRoadmap_EllipticCurves.

**Fix:** Rewrite those three examined notes to describe the final accepted decisions, including the limited elliptic acceptance-case use at ED.3, generic-fibre torsion and reduction-predicate use at R07.5, and the two separately recorded BSD.6a imports. Preserve the existing evidence-backed links. Do not infer from the old note that BSD.7a needs a new edge.

## Link and overlap audit

Indices below are one-based positions in the unchanged links array. Every row was checked against both quoted passages and the complete endpoint stage, including its field, topology and additional construction obligations.

| Links | Scope checked | Result |
|---|---|---|
| 1–12 | Quadratic twists, Q-BSD arithmetic, local indices, finite descent and acceptance examples | Retain; local arithmetic does not prove analytic nonvanishing or Sha finiteness. |
| 13–17 | Height, pairing, real-period and formal-logarithm inputs to Gross–Zagier | Retain with explicit normalization comparisons. |
| 18–24 | Finite/adic Kummer classes, Weil self-duality, all-prime Sha descent and ordinary Heegner families | Retain; compact classes and exceptional-prime arguments remain consumer work. |
| 25–30 | Rational endomorphisms, conductor and point-count imports to modularity | Retain; Ogg–Artin and Euler-factor comparisons remain explicit. |
| 31–37 | Galois actions, Tate module, Frobenius, conductor and Neron model comparisons | Retain; equation-level and scheme-level objects are compared, not identified by name. |
| 38–45 | Scheme/function-field K-theory, Picard, torsion divisors, Hasse compatibility, Kodaira geometry, analytic differential, Hom and Tate-curve Hodge example | Retain; independent geometric constructions remain required. |
| 46–49 | Ordinary Iwasawa and period/special-value imports | Retain with the stated Q-only period and exact theorem hypotheses. |
| 50–61 | Places, orders, continuous cohomology, Kummer, local/global duality and decomposition groups | Retain; finite residue fields, coefficient actions and degree ranges are respected. |
| 62–67 | Added function-field/analytic/finite-flat/Kummer/measure comparisons | Retain; the separate TB.7 overlap is missing (finding 1). |
| 68–80 | Twist branches, index/height, certified descent, statement-only BSD, semistability and integral Iwasawa input | Retain; no blanket supersingular, Eisenstein or all-prime theorem is inferred. |
| 81–82 | All-degree colimit and discrete Selmer ownership handoff | Retain; generic abelian cohomology is not nonabelian H1, and mapping-fibre H1 retains H0 assumptions. |

The ten overlap recommendations were separately checked: elliptic Tate modules, Neron–Ogg–Shafarevich, zeta/Hasse, forced-discrete cohomology, Selmer carriers, general Mordell–Weil, heights, geometric torsion, Rosati/Weil bounds and the BSD statement. Their seven keep and three rescope decisions preserve upstream anchors. Finding 1 adds a missing pair; it does not reverse these ten decisions.

## Catalogue omissions and rejected candidates

The fresh screen covered every current roadmap, not only those already linked. The 218-entry examined list contains all 216 other active roadmaps, plus the focal document and the retired integration roadmap. The screen matched both direct elliptic terms and supplier vocabulary for cohomology, duality, orders, approximation, heights and reduction. Candidate contexts were read; mathematical-looking false hits such as elliptic PDEs, elliptic conjugacy classes, Weierstrass preparation and Kummer covers were separated from elliptic-curve contracts.

The existing AlgebraicCurves and ModularCurves packets already record the function-field, multiplication-degree, pairing and scheme-point comparisons. Those pairs are not omissions here. The LV.6 Legendre family is an elliptic scheme with explicitly named abelian-scheme and Galois-representation suppliers. NC.3 uses unipotent torsors, whereas Layer 5 owns continuous nonabelian H1 for Aut(E,O). ST.4 has not fixed Layer 8's precise minimal-pair height; its descent uses RP.1. R35.2 builds a complex-place Hodge metric, which does not by itself identify Layer 7's Q-real period. ER.5 retains CM/Hecke-character conductor and Deuring comparisons. None supplies grounds for an additional exact edge solely from a shared name.

For TB.7 the distinction cuts the other way: its construction explicitly names Tate uniformization, so calling it only an acceptance example misses an actual construction. A keep overlap with a named agreement on the common field-valued part preserves both scopes. A direct edge is not forced, since the current texts do not settle the construction direction. In particular, the already existing path through TB.6 is not being reported as a missing graph-reachability path.

## Pinned declarations inspected

| Library/file | Declarations and boundary |
|---|---|
| Mathlib `AlgebraicGeometry/EllipticCurve/LFunction.lean`, lines 35–85 | `localPolynomial`, `localEulerFactor`, `LFunction`, `LSeries`: formal/series objects; good/split/nonsplit/additive local factors. This file does not supply analytic continuation. |
| Tau Ceti `RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean`, lines 212–237, 250–258, 301–328 | `ofDiscreteModule` requires an existing discrete topology; smoothness separately requires continuous action. It does not impose a new topology on a bare carrier. |
| Tau Ceti `AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean`, lines 114–125, 338–391 | `Point.canonicalHeight` uses denominator `2 * 4^n`; `neronTatePairing` is the halved polar form. The prose full-x-height cannot be substituted without transport. |
| Tau Ceti `AlgebraicGeometry/EllipticCurve/MordellWeil/Regulator.lean`, lines 65–109 | Basis change, `regulator`, and rank-zero `regulator_eq_one_of_finrank_eq_zero`; finite-index sublattices are not two bases of one lattice. |
| Tau Ceti `AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean`, lines 118–139 | `fg_point_of_numberField` applies to any elliptic model over a number field, with internal variable-change reduction. |
| Tau Ceti `AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean`, lines 797–814, 918–940 | `quadraticTwistPointEquiv` and `quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map` support general extension fields in the tower, not only finite M. |

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All six file blob hashes were verified against their pinned repository trees. All twelve integrated AUDIT-11 target inventories were consulted; their absence judgements were not silently upgraded into a fresh exhaustive absence proof.

## Verification

All 219 quotations are literal matches, including 203 stage-local quotations. The 82 ordered pairs are unique and have no retired endpoints or cross-packet duplicates. The conservative graph includes 4,358 pairs before the target and 4,440 after it, with no target-to-source return path for any link. This is stronger than merely running the link checker, but does not certify that every unrelated atlas edge is correct.

The input refresh changed none of the 323 tracked inputs. `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_EllipticCurves.json` reports zero errors and zero warnings. The red-team checker and intake file check both passed on the two deliverables, with zero errors/problems. No Lean source is changed and no Lean build is claimed.

## Checked ledger

- Read the entire focal README, all twelve focal layer descriptions, all 82 links with both-sided evidence, all ten overlaps, all 218 examined entries and the accepted review. Read the full descriptions of the 61 distinct non-focal stages touched by a link or overlap; contextual roadmap ownership passages were also checked.

- Catalogue screen: all 218 documents and 2007 stage descriptions, covering 216 other active roadmaps. No active roadmap is missing from examined. The two extra entries are the focal roadmap and retired FoundationsAndLibraryIntegration. Independent term/context searches inspected 175 additional elliptic/Tate/Weierstrass and related candidate stages, plus 115 general cohomology/descent/duality candidates; these counts describe a screen, not full readings of every atlas stage.

- All 219 evidence quotations match literal source text; 203 occur in their named stage description and 16 require the containing roadmap. Checked each stage identity and the actual context rather than treating document-level substring membership as sufficient evidence.

- All 82 links have live, non-retired endpoints and the prerequisite-to-consumer direction; no repeated pair in the packet or in another link packet. Reconstructed the conservative graph from atlas edges, stage requires/consumers, proposed roadmap edges and every other link packet: 4358 pairs before this packet, 4440 after it, and no return path from any target to its source.

- Checked equation/function-field versus scheme interfaces; zero maps versus function-field embeddings; geometric torsion with N invertible versus finite-flat kernels; arithmetic/geometric Frobenius; algorithmic Ogg conductor versus Artin comparison; finite-residue-field reduction predicates; finite-point Tate uniformization versus analytic quotients.

- Checked pointed twists versus genus-one torsors; nonabelian H1 ownership in Layer 5; forced-discrete coefficients versus ofDiscreteModule; low-degree versus all-degree finite-quotient colimits; Kummer surjectivity with m invertible; local Tate duality versus global Poitou–Tate; finite versus compact/rational Selmer coefficients and the H0 qualifications on mapping fibres.

- Checked the Q-only real period and BSD quotient, real components and sign-independent differential, Sha-finiteness hypothesis, full-x-height prose versus half-x-height at the library pin, pairing and regulator normalization, rank-zero determinant, and proper finite-index versus basis-change formulas.

- Consulted the accepted AUDIT-11 records for all twelve layers; independently opened actual declarations in six hash-verified source files at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369: LFunction, SmoothDiscrete, CanonicalHeight, MordellWeil/Regulator, MordellWeil/FinitelyGenerated and QuadraticTwist. No claim is made to have repeated the entire library audit or built Lean.

- Rechecked existing AlgebraicCurves and ModularCurves pairs before considering omissions. Examined the additional TB.7 construction, R35.2 metric, ER.5 CM example, ST.4 statistics, NC.3 nonabelian Chabauty, DY.6 Lattes example, R07 scope, L5b descent and LV.6 Legendre family; retained their distinct carriers and the already-named intermediate owners.

- Inputs refreshed at c961a097c7f7fb416cae20ea12b244a43a3821d7 on 2026-09-24: all 323 tracked inputs unchanged from acquisition, including target and accepted review. Target check_links passed with zero errors and zero warnings. Red-team checker and intake check-files passed with zero errors/problems; only the two red-team deliverables are changed.
