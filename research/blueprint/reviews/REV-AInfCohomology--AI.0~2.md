# Independent review of AInfCohomology AI.0–AI.5, revision 2

**Job:** REV-AInfCohomology--AI.0~2 · **Issue:** #6983 · **Reviewer:** Codex, session codex-W596V9 · **Date:** 2026-10-10

**Verdict: accepted.** This session did none of either blueprint round. The earlier review's missing exports and three substantive API mismatches are repaired. This review corrects additional signature, geometry, source and reader discrepancies in place. Every node is verified or corrected, every baseline citation is confirmed, and no unresolved contradiction remains in the reviewed plan.

Acceptance concerns a complete **target-level pass**. All eight stages remain **planned**, every implementation status remains **unchecked**, and the nine gaps and fourteen supplier contracts remain explicit. Elaboration with `sorry` establishes types; it does not establish the mathematical results or the omitted geometric hypotheses. Neither this report nor the packet claims proof closure.

## Scope and counts

| Item | Received | Accepted |
| --- | ---: | ---: |
| Nodes | 137 | 137 |
| Definitions and constructions | 28 | 28 |
| API contracts | 118 | 118 |
| Named definition tests | 85 | 85 |
| Planets | 31 | 31 |
| Baseline declarations | 33 | 33 |
| Supplier requests | 14 | 14 |
| Explicit gaps | 9 | 9 |
| Source findings | 5 | 7 |
| Planned stages | 8 | 8 |
| Closed stages | 0 | 0 |

The packet's `review.checked` covers all 137 IDs exactly once: **112 verified, 25 corrected, 0 added, 0 unverifiable**. Twenty-three node records changed; two further verdicts record native-signature corrections without changing an already correct mathematical node. No node or baseline citation was removed. No unrelated supplier, upstream, atlas-data or campaign file was edited.

| Stage | Nodes | Planets | Coverage |
| --- | ---: | ---: | --- |
| AI.0 | 17 | 3 | planned |
| AI.0:integral | 5 | 2 | planned |
| AI.0:period-comparison | 1 | 1 | planned |
| AI.1 | 41 | 6 | planned |
| AI.2 | 24 | 6 | planned |
| AI.3 | 15 | 4 | planned |
| AI.4 | 18 | 5 | planned |
| AI.5 | 16 | 4 | planned |

The received decomposition covers the scoped targets at the assigned level, below the 300-node budget. The six new AI.2 ownership inputs are needed key theorems rather than recursive proof-interior expansion. Each definition/construction has at least three concrete tests. Planets name central objects and theorems, with no more than six per stage.

## Earlier blockers

The report [REV-AInfCohomology--AI.0](REV-AInfCohomology--AI.0.md) and the revision handoff were read before checking the revised files. All 75 previously absent named exports now have actual signatures; they are not merely comments. All 137 node names and 118 API names were checked with namespace-aware declaration matching. All 85 test labels lead to Lean `example` statements.

The repaired universal relative-Witt API constructs a compatible family of unital maps with the coefficient, differential and F/V/R requirements. The improved complex is formed from the actual décalage representative before reduction and homology, rather than from a renamed precomplex. The reconstruction modification API identifies the specified de Rham lattice under the realization map. Its standard regression is strengthened below to compare BKF objects, including Frobenius. The reader now describes those assertions and their unavailable-substrate limits consistently.

## Corrections made in this review

| Location | Correction and justification |
| --- | --- |
| Five analytic AI.2 nodes; AdicSpaces request; fourth gap; AI.2 remaining list; upstreamNotes | Distinguished the punctured analytic locus of SW §12.2, pp.101–102 from current Tau Ceti `spaY`. The former is D(p) union D([varpi-flat]), retaining radius-zero and infinity endpoints; the latter is the intersection, with radii strictly between zero and infinity. SW's Robba/no-leg, infinity-extension and finite-free bundle theorems need those endpoints. The packet reuses the interior and requests its endpoint carrier, interval section rings, boundary stalks and sheaf extension from AdicSpaces Layer 6. It does not assert that the existing interior already supplies them. |
| `AI.0/witt-etale-base-change`, native export | Restored the étale conclusion of BMS1 Theorem 10.4, p.81, and fixed the algebra structures to the canonical finite-Witt maps. The base-change equivalence now has the actual pure-tensor formula; an unspecified equivalence alone would not state the promised natural map. |
| `AI.0:integral/integral-crystalline-ring-interface` | Replaced the broad source locator with Definition 3.22(i), p.27, and §12.1, pp.96–97, together with its CR.0 owner. The native conclusion retains augmentation, residue and Frobenius extension maps and their commuting squares. Available p-completeness of the targets and theta(xi)=0 remain explicit hypotheses. The actual p-completed PD envelope and coefficient identifications remain precisely documented omissions. |
| `AI.2/fargues-essential-surjectivity`, standard test | Replaced an underlying-module comparison by inverse BKF morphisms, whose maps commute with linearized Frobenius. This prevents the unit test from admitting a wrong Frobenius on the reconstructed module. The actual geometric equivalence remains the reader's full contract. |
| `AI.5/adjacent-degree-freeness`, native export | Restored perfectness as bounded finite-projective representative data, rather than silently dropping an expressible hypothesis of Corollary 4.17, p.39. The conclusion now includes finite presentation in all degrees and the adjacent-degree integral base-change bijection, in addition to degree-i finite freeness. All p-local freeness and torsion hypotheses are retained. |
| `AI.1/unrelated-completion-counterexample` | Corrected the motivation to BMS1's warning after Lemma 6.19, p.55. The restricted-sequence shift-minus-x example is independent work, not BMS1 Example 6.5. Its canonical comparison is a quotient by newly appearing torsion, not a claim that its source and target are abstractly nonisomorphic. |
| `AI.1/bockstein-comparison-map`, zero-differential test | Matched the mathematical fixture to the native two-term complex in degrees 0 and 1. Both quotient cohomologies are R/f; it no longer describes a one-term fixture while testing two terms. |
| Corrected-site request and reader introduction | Specified the finite étale surjective pullback condition at every positive ordinal, including limit ordinals, over the limit of preceding stages. The corrigendum is not restricted to successors. Deleted point and splitting assertions remain excluded. |
| Twenty test-kind values | Replaced sixteen `comparison` values by `compatibility`; classified the four former `boundary` values as two computations, one non-example and one compatibility. Required mathematical behavior is unchanged. |
| Reader throughout | Synchronized hypotheses, geometry, test tables, source locators, supplier contracts, baseline recheck, source findings and accepted-review status. Removed the stale instruction to await this review and corrected the source-reading metadata to call SW 12.4.6 a proposition. |

The SW classification is kept at its exact scope: Theorem 13.4.1, pp.111–113 supplies an isocrystal representative for a phi-bundle on the appropriate interval; it is not promoted to an equivalence of isocrystal categories. Theorem 13.2.1, pp.109–111 is extension across infinity. Theorem 14.2.1, pp.116–117 concerns the punctured analytic locus, distinct from the algebraic punctured spectrum and from the interior cover used for the Fargues–Fontaine curve.

## Sources and baseline

Every node was checked against its primary-source locator, with its hypotheses, proof sketch, direct suppliers, export, API and examples. This was a targeted reading of the relevant results and proof passages, not a claim to have read every page of every paper. Public versions, URLs and original reading provenance are retained in `sources` and `sourceVersions`; all ten downloaded PDF digests match those records. No source excerpt or section-by-section source summary was added.

The checks include BMS1 §§3–4, 6–12 and 13–14 at the scoped coefficient, décalage, BKF, local comparison and proper-comparison locators; BMS2 Proposition 5.8, Remark 5.9, Corollary 5.10 and the conormal normalization in Proposition 6.5/Remark 6.6; SW's patching and analytic reconstruction chain; Zavyalov Theorem 3.3.3, pp.35–36; Anschütz–Le Bras Definition 4.1.24 and Proposition 4.3.5 with its erratum; Scholze's integral period-sheaf inputs and complete three-page corrigendum; and BLM's relevant completion, fixed-point and filtered interfaces. The Stacks completion/K-flat references were checked as supplier leads. The ALB erratum concerns the later divided-Frobenius nilpotence argument, not the crystalline triple used here.

All **33** baseline declarations were independently re-read at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174**. The exact names and modules are listed in the packet and the reader's baseline table. None required replacement or removal. In particular:

- ModuleCat and Z-indexed cochain complexes supply ordinary carriers and chain-map constructors; the adjacent-map conventions raise degree.
- DerivedCategory and Q use the existing chosen localization and its HasDerivedCategory hypotheses; they do not supply a coherent enhancement.
- Witt Frobenius and p-adic completeness use perfect characteristic-p rings. Fontaine theta needs prime p, p-adic completeness and p nonunit; its root-namespace surjectivity theorem additionally needs surjective Frobenius modulo p.
- PreTilt is the existing Frobenius limit, not by itself a perfectoid field. BDeRhamPlus/BDeRham are existing completion/localization carriers, with no automatic principal-kernel, DVR or topology theorem.
- continuousCohomology uses N-indexed TopModuleCat cochains; the completed Z-indexed forgetful comparison is still requested. KaehlerDifferential is ordinary cotangent data, not the full cotangent complex.
- WittVector.Isocrystal and FractionRing.frobenius already provide isocrystal data; the analytic realization theorem is new. AdicCompletion and TensorProduct provide ordinary completion and tensor, not their derived counterparts.

The reviewed AUDIT-35 and its accepted review were read; the generated library-coverage file has no AInf rows. Existing Witt, tilt, theta, period, isocrystal and completion carriers are reused. The current read-only AdicSpaces and DGAInfinity documents and relevant current Tau Ceti declarations were inspected for duplication. The packet records upstream main **0a56d1b5303c26887a4042db834f46d9079ac593** and current Tau Ceti **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039** at inspection. Neither checkout was modified or built.

## Source findings

E1–E5 were independently rechecked and remain confirmed under this review's job ID. E1's full-term quotient in the proof of BMS1 Lemma 6.9 fails for Z in degree zero with I=(2); the good-truncation boundary argument proves the unchanged comparison. BLM E2–E5 concern a boundary index, the domain of a completion map, the direction recovering an underlying filtered complex, and truncation of an associated graded piece. Those findings remain confined to the December 2019 author copy because the published interior was unavailable.

Added E6 and E7 record two misprints already confirmed in the accepted BMS1 paper extraction, independently checked here in both the journal PDF and arXiv v3. Remark 7.8, published p.302/v3 p.58 must apply décalage to E2, rather than self-reference E1. Lemma 7.9's two divisibility checks, published p.303/v3 p.59 must use g*x in the second differential component; g*y has the wrong degree. These affect no intended result, and the node contracts already use the corrected mathematics. The findings are in our own words and are marked as already recorded, not newly discovered errata.

## Ownership, suppliers and assigned red-team findings

Supplier statements and all fourteen requests were compared to their actual needed scope. The internal graph is acyclic. Finite-Witt specialization precedes its relative-Witt consumer; full faithfulness precedes proper-cohomology lattice extraction. AI.0 owns finite Witt coherence/coefficient algebra, AI.2 the module/Tor and analytic reconstruction inputs, and AI.5 the generic specialization estimates. CP.0 and CP.5 import those generic results and keep their geometric applications. CR.4 imports coefficients. Proper de Rham perfectness uses the exact lower-tier DD.5 result. The six AI.2 ownership additions replace backwards RF4/VB prerequisites under the current upstream order.

| Assigned finding | Review outcome |
| --- | --- |
| RT-AREA-padic-1/19 | Full faithfulness uses BMS1 Remark 4.29 and the coefficient intersection; essential surjectivity has the explicit SW reconstruction chain. Added the endpoint-extension distinction above. |
| RT-AREA-padic-2/1 | Integral coefficients precede the rational-period consumer. The native period carriers are reused, with kernel/topology/DVR extensions explicitly requested. |
| RT-AREA-padic-2/3 | Proper étale finiteness and primitive integral comparison are an early P8 child request. Existing local rational period sheaves are not asserted to supply them. |
| RT-AREA-padic-2/9 | AI.3 uses corrected completed integral, tilt and derived Witt sheaves on the corrected site; no deleted splitting argument enters. |
| RT-AREA-padic-2/10 | Rational B_dR acyclicity is absent from the integral AI.3 prerequisite chain. |
| RT-AREA-padic-2/11 | Rational crystalline freeness needs the precise section-dependent non-Noetherian A_crys bridge, BMS1 Proposition 13.21, pp.116–117, requested as an early CR.3 extension. The existing Noetherian-base isogeny alone does not establish it. |
| RT-AREA-padic-2/15 | Commuting-endomorphism Koszul/cochain extensions remain with DD.1; signs and inverse-limit hypotheses are explicit. AI.1 applies them rather than duplicating their owner. |
| RT-AREA-padic-2/17 | Existing Witt, PreTilt, theta and B_dR carriers are cited, not planned again; missing comparison structure is separated from their existence. |

The nine gaps accurately separate unavailable enhancement/site/signature infrastructure, continuous completed cochains, the early minuscule-window dictionary, punctured analytic endpoint interfaces, crystalline map agreement, geometric hypotheses, integral descent proof refinement, primitive proper comparison and the non-Noetherian crystalline bridge. These are source-supported planning endpoints, not implemented inputs. They do not contradict acceptance of this target-level pass.

## Validation and orchestrator follow-up

- `python3 scripts/check_blueprint.py research/blueprint/packets/AInfCohomology--AI.0.json`: **0 errors, 0 warnings**.
- Namespace-aware export audit: **137/137 node signatures, 118/118 API signatures, 85/85 labeled examples**. Every node has exactly one review verdict; all test kinds belong to the protocol vocabulary.
- Source-finding schema/version checks: **7 confirmed findings**, with required version and lookup provenance; ten PDF hashes match.
- `lean-check research/blueprint/suggested/AInfCohomology--AI.0.lean`: **exit 0; 481 warnings, all `declaration uses sorry`**. No errors or other warnings. The file imports individual Mathlib modules and no Tau Ceti module. The shared build's Tau Ceti revision differs from the historical packet pin, so this is a compilation claim at the stated Mathlib pin, not at that Tau Ceti pin.
- Reader/packet consistency and allowed-file intake checks passed; no private paths or copied source passages were added.

No decision blocks this review. The orchestrator should carry the fourteen named supplier contracts into subsequent planning, particularly the newly precise AdicSpaces endpoint extension and the early P8, CR.3 and R07.2 bridges. RF4/VB and CP consumers should retain the recorded AI.2/AI.5 ownership directions. The accepted packet is ready for the next programme step; no additional job is claimed by this session.
