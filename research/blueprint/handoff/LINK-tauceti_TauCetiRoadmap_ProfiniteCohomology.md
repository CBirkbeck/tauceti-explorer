# Handoff: ProfiniteCohomology links — partial submission

**Job:** `LINK-tauceti_TauCetiRoadmap_ProfiniteCohomology`  
**Issue:** #25  
**Worker:** ChatGPT Pro — `cgp-0d677fbc2f21`  
**Date:** 2026-09-16  
**Status:** a durable partial link-map submission, not a completed catalogue search, an independent review, an implementation or an integration.

## Files and ownership

This submission changes only:

- `research/blueprint/links/tauceti_TauCetiRoadmap_ProfiniteCohomology.json`
- this handoff note.

No source roadmap, atlas, other packet, reserved identifier, queue, application code or Lean file was changed. No local git commands were run. The claim was accepted for this exact session by workflow comment 5699147944, referring to claim comment 5699145622. The issue was re-read before submission: no conflicting claim or submission was present and its state was still claimed. The authorized link output was absent on the refreshed base.

## Revisions and evidence provenance

The reading revision is `3bbae93d74134ee48575d60d889fc8e57f3ac7e9`. The pre-submission revision is `c0ef517ffdf50d37ca4be50468e0c0d249b3f298`. The five documents used for link quotations were re-fetched at the latter revision; their blob hashes were unchanged:

| Document | Blob |
| --- | --- |
| `content/tau-ceti/ProfiniteCohomology/README.md` | `c184506d49598a1370e2d05d45d1f7cf8998d783` |
| `content/campaign/ArithmeticGaloisDuality/README.md` | `72f13c57800f801ed2bc1e1c785d25b2d5d51798` |
| `content/campaign/SmoothRepresentationsOfLocalGroups/README.md` | `1aa900110c00666cf720298012bacb9cf0e6b153` |
| `content/campaign/K2SymbolsBrauer/README.md` | `e8b0970fa595c2da1f644d23686b2ac259c8c8bb` |
| `content/campaign/MotivicEtaleKTheory/README.md` | `f4a4331560fb9b94e715850a7d2e259a1a1270af` |

The target's browser extract is `research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_ProfiniteCohomology.json`, input blob `08de90904909708cf55e59fb1a6e431849af6390`. Its 14 full stage descriptions were read; it had no recorded touching `stageEdges` at the reading revision. This does not mean no other link packets mention it. The actual full-graph validation result is recorded in the addendum below.

The baseline file, rechecked unchanged at submission, is blob `fdb00afdfae8e5728e070f310f5a880707764bc2`:

- Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`
- Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`

**No declaration in either pinned library was independently inspected for this link job.** Names quoted from roadmaps are source evidence about planned interfaces, not assertions of baseline implementation. No primary reference PDF or private library was used or claimed read. The work concerns the repository specifications themselves. Public source provenance is the repository-relative path plus immutable commit/blob above; other reading receipts are in the packet.

The current browser rules, blueprint protocol, expansion protocol and upstream guide were read. The two upstream documents used for mathematical conventions and ownership were ProfiniteCohomology and RepresentationTheory/InductionRestriction. For the former, the introduction, convention/API and inventory sections, examples, ordering and reference register were read together with every full stage description from its extract; the latter document was read in full. Bibliographic locators inside those documents were not independently checked against the books.

## What the packet actually records

There are **12 directed links**, all from ProfiniteCohomology to campaign consumers:

| Consumer | Supplier layers | Exact role |
| --- | --- | --- |
| ArithmeticGaloisDuality R02.1 | 1, 10 | canonical carrier and finite/discrete side of lattice comparison |
| ArithmeticGaloisDuality R02.2 | 5, 10 | existing five-term maps and discrete restriction/corestriction normalization |
| ArithmeticGaloisDuality R02.3 | 11 | ordinary cohomological-dimension definitions/API, not the arithmetic bounds |
| ArithmeticGaloisDuality R02.4 | 8 | underlying finite evaluation cups, not global perfectness |
| SmoothRepresentationsOfLocalGroups SR.0:abelian-category | 1 | reuse of the profinite smooth-discrete dictionary on compact opens |
| K2SymbolsBrauer T.7 | 8, 9 | cup and Kummer inputs to the displayed symbol comparison |
| MotivicEtaleKTheory M.1 | 9, 10 | finite Kummer and transfer comparison targets for realizations |
| MotivicEtaleKTheory M.5c | 12 | the all-degree Galois-cohomology cup underlying multiplicative compatibility |

No newly justified incoming link was established in this pass; this is not a claim that none exists. Each edge has one supplying and one consuming quotation; some quotations come from the owning roadmap's explicit API table or scope text, as the protocol permits. The quotes were checked against the accessed text, allowing whitespace normalization. The official checker subsequently passed its canonical-world quote/end-point and global-cycle checks; see the addendum for the checked revision. All links are conservatively labelled inferred rather than claiming both texts explicitly name the stage pairing.

The single overlap proposal concerns the smooth-discrete dictionary. Keep its profinite ownership in ProfiniteCohomology Layer 1, use it on compact opens in SR.0, and give SR.0 the locally profinite, A-linear, smooth-vector, sum, filtered-colimit and abelian-category extensions. The early abelian carrier must not acquire the late derived enhancement as a prerequisite. This is a proposed rescope of the shared interface, not a merge of the whole roadmaps or an edit of their texts.

## Target inventory prepared before mapping

The following input/output inventory was prepared in scratch and retained here so that continuation does not need to reconstruct the initial reading. The packet uses the original full stage IDs; layer numbers below are only abbreviations in this handoff.

| Layer | Input boundary | Output used in searching |
| --- | --- | --- |
| 0 | discrete modules, closed subgroup quotients | open stabilizers, finite normal-quotient factorization, invariants, finite products/subquotients, finite-source Hom/evaluation, continuous sections |
| 1 | Layer 0 and canonical carrier | smooth-discrete dictionary, restriction/inflation/coefficient naturality; no arbitrary separately continuous TopRep identification |
| 2 | explicit continuous cochains | H0/H1/H2, cocycle/coboundary and conjugation maps |
| 3 | canonical and explicit complexes | low-degree comparison and finite-group specialization with correct topology |
| 4 | finite quotients and invariant coefficients | direct colimit over open normal subgroups; not compact inverse limits |
| 5 | coefficient exactness and continuous sections | low-degree long exact and five-term sequences, transgression; not full Hochschild–Serre |
| 6 | open finite-index subgroups | low-degree corestriction, transfer identities and Mackey formulas on classes |
| 7 | closed subgroup and locally constant coinduction | exact coinduction and low-degree Shapiro; finite-index algebraic comparison only for open subgroups |
| 8 | equivariant pairings of discrete modules | six low-degree cups and finite evaluation pairings; no automatic perfectness |
| 9 | separable closure, positive invertible modulus | natural-action roots of unity, Hilbert 90, Kummer and field/subgroup comparison |
| 10 | canonical discrete theory and prior comparisons | all-degree cohomology, direct colimits, long exact sequence, Shapiro, corestriction and dimension shifting |
| 11 | all-degree discrete cohomology | ordinary/strict cohomological dimension, finite-module testing and closed-subgroup comparisons |
| 12 | canonical cochains and equivariant tensor pairings | all-degree graded cup and projection formulas |
| 13 | trivial F2 coefficients and open finite index | Evens norm; explicit index-two H1→H2 graph construction and identities |

## Deliberate non-links and unresolved source contracts

**Compact and Iwasawa coefficients.** SelmerIwasawaCohomology explicitly imports its compact/derived coefficients, full Hochschild–Serre, twists, integral Kummer and limits from ArithmeticGaloisDuality. A finite/discrete profinite theorem is not those conclusions. The complete Selmer document was read, but no additional shortcut edge was justified. This distinction is also essential for IntegralHeckeAndGaloisDeterminants IHG.6: its finite T-module is finitely generated over T, not necessarily a finite discrete set. Its declared continuous-class supplier is ArithmeticGaloisDuality R02.1. Its rational algebraic-group cohomology is not cohomology of a discrete GL2 group either.

**Weil and nonabelian cocycles.** LanglandsParameterStacks LP0's named `UPSTREAM:ProfiniteCohomology` prerequisite does not by itself supply nonabelian continuous/condensed cocycles, a dense Weil discretization or its unique-extension theorem. Read all native LP stages, but leave the exact supplier contract unresolved rather than mapping additive H1 to it. The LP1 tangent-complex comparison needs its actual group and coefficient model; no universal compact/discrete identification was assumed.

**Potential automorphy.** The PA.0–PA.5 descriptions were all read. Their generic mention of ProfiniteCohomology is not enough to select a supplier stage. In particular PA.4 imports arithmetic duality and Chebotarev through its actual auxiliary-prime construction. No new direct edge was invented from the word cohomology.

**Algebraic induction input.** ProfiniteCohomology Layer 7 points to the algebraic induction/coinduction interface. InductionRestriction's finite-dimensional character stages do not supply the required arbitrary discrete Z-module comparison, and its inventory attributes some relevant constructions to Mathlib already. A continuation must inspect the actual pinned declaration statements or find the precise general stage before adding an inbound edge. Ordinary factor-set H2 in InductionRestriction is not automatically a consumer of the continuous theory.

**Kummer coefficients and schemes.** Every new Kummer edge is restricted to positive m invertible in the field, with the natural Galois action on μ_m. The consumer must retain that restriction. Identifying μ_m with a bare cyclic group is not sufficient; the two tensor factors in T.7 persist until the explicit root choice. S-integer and scheme statements need the actual étale/Galois/localization comparisons and cannot be supplied by a blanket function-field identification.

### Two issues in the target specification requiring author attention

1. **The literal chain-isomorphism request in Layer 10 is too strong for the two standard complexes.** The source asks for `shapiroCochainIso` between the two canonical homogeneous-cochain complexes and obtains Shapiro on homology from it. For G=C2, H=1 and M=F2, degree zero on the G side with Coind_H^G M has dimension 2 over F2; degree zero on the H side has dimension 1. Thus a degreewise isomorphism between these standard complexes cannot exist. The cohomological Shapiro theorem is unaffected. Specify a quasi-isomorphism/chain-homotopy equivalence, or an explicitly changed resolution model for which the intended chain-level isomorphism is true. This is a mathematical check of the stated contract, not a review of Lean declarations.
2. **Layer 9 mixes early results with late adapters.** Its early Kummer/Hilbert-90 prerequisites are Layers 3,4,5,8. The field-extension bridge also asks for `galoisCor` and `galoisEvens` comparisons using Layers 10 and 13; the API table acknowledges these inputs. Schedule those adapter comparisons after their suppliers without making the early Kummer construction depend on them. This is an ordering ambiguity, not a demonstrated cycle in the atlas graph.

Both are preserved as packet gaps. No unowned source document was changed and no other worker's review verdict was modified.

## Existing work and search completeness

A GitHub code search for `ProfiniteCohomology` under `research/blueprint/links` returned 18 files, with `incomplete_results=false` at discovery. These were upstream-owned packets. The ClassFieldTheory and ProfiniteProPGroups interface portions were read as deduplication leads, not independently reviewed or copied. Their blob receipts are:

- ClassFieldTheory: `f13f15cbfcbf4d3f2bc3598610eac5e62bc8c53f`
- ProfiniteProPGroups: `6f4193696afc7c74d8b31340ed94609d2b771d2f`

The other matching filenames were AdicSpaces, EllipticCurves, ModularCurves, AlgebraicCurves, ZigzagPreprojective, StablePeriodicCurved, LocalFieldsRamification, StandardDistributions, NumberFieldArithmetic, and RepresentationTheory/{SchurWeyl,LieGroups,RootSystems,ClassicalGroups,SemisimpleAlgebras,SpinRepresentations,QuiverRepresentations}. Their complete contents have **not** all been independently inspected here. Existing valid links in these upstream-owned packets cannot duplicate the new ProfiniteCohomology-to-campaign endpoint pairs, but this ownership observation does not replace the current global graph check or a refreshed search for new packets.

The eleven `examined` records describe their exact reading depth. A record does not imply a full roadmap was read when its note says selected stages or existing packet only. Catalog summaries/index and exact-name search were used for candidate discovery, but the required full scan of all upstream, same-area, neighboring and text-matching roadmaps was **not completed**. This is why the packet is partial.

## Validation record

Run locally in this session:

```text
python3 -c 'import json;json.load(open("research/blueprint/links/tauceti_TauCetiRoadmap_ProfiniteCohomology.json"))'
```

Result: **passed**. A separate scratch check also passed protocol/status, unique directed pairs, evidence endpoint ownership, quotation minimum length, unique examined roadmap IDs, allowed overlap recommendations and acyclicity of the proposed packet alone. It reports 12 links, one overlap and 11 examined records.

**Not run locally:**

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_ProfiniteCohomology.json
```

The complete canonical atlas and other packet files are not mounted in this runtime; direct raw-file retrieval failed on DNS. The browser extracts were sufficient for the source reading above, not a claim that the full validator ran. The exact checker and `.github/workflows/swarm-check.yml` were read. The PR workflow covers link packets, retrieves the pinned libraries and invokes this checker on the changed link file against its checkout. Its actual result must be recorded from the run, not inferred from this local structural test or from a green unrelated check. The submission comment/PR check provides the run-specific result once observed. No Lean build was attempted or claimed.

## Resumption checklist

1. Refresh the main revision, issue ownership, target/consumer blobs and all matching link packets. Continue from these endpoint pairs; do not restart or copy already recorded class-field/pro-p links.
2. Complete the mandatory catalogue-wide input/output search using all area text shards, all upstream documents and new roadmap definitions. Include every same-area and genuinely matching roadmap, and list exactly what was read. Read K2SymbolsBrauer T.4–T.5 and the remaining checkpoint tails before expanding those coverage claims.
3. For each candidate, read both full stage descriptions, preserve coefficient/group/hypothesis boundaries and use the most specific stage. Shared vocabulary or a roadmap-level dependency is not enough. Classify unresolved direction as overlap or an explicit unanswered contract, not a guessed edge.
4. Resolve the algebraic coinduction and nonabelian Weil-cocycle supplier questions above; inspect both pinned libraries before asserting a baseline implementation or absence. Route the two target-specification issues to its author.
5. Run the official checker on the complete current world, inspect every warning and any cycle, and obtain independent mathematical review before acceptance. Only then may a complete status be justified.

The submission remains awaiting continuation/review/integration. Do not mark the job done on the strength of this partial packet, do not silently release its claim while the submission is awaiting routing, and do not interpret a successful structural check as approval of the mathematical specifications.

## Submission and validation addendum

**Durable submission:** draft PR [#785](https://github.com/CBirkbeck/tauceti-explorer/pull/785), branch `cgp-0d677fbc2f21/link-profinite-cohomology`. The actual files were posted and independently fetched back; the first uploaded packet and handoff blobs exactly matched the locally parsed copies. Submission was announced on issue #25 in comment 5699660157. This remains a partial result, not a job-completion claim.

**The full checker has now actually passed.** Workflow [35112557658](https://github.com/CBirkbeck/tauceti-explorer/actions/runs/35112557658), job `104849735254`, ran the official command printed above for the submitted packet. Its decoded log was read. At 2026-09-16 15:02:21 UTC it reported **12 links, 1 overlap, 11 examined; 0 error(s), 0 warning(s)**. It checked submission head `9de8354e7d05be11b48604caed89162ff99b1d77` in GitHub's synthetic test merge `e2ca46f4f194be1be4cc1b59291948a7e6ed29ec` against base `5fd9a4536478b9abffe59986d4a551397fc11cc9`; this synthetic test is not integration of the PR. The earlier pending-check text describes the pre-submission environment and is superseded by this observed result. No full validator was run locally.

This follow-up records that result and clarifies that the M.5c product comparison is **mod ell**; M.5d owns the prime-power passage. No endpoint or quotation changed. The updated metadata/wording is subject to its own PR check; the run-specific latest result belongs in the PR/issue comment. A passing checker does not discharge the incomplete catalogue scan, the source-contract issues, or independent mathematical review.

### Coordination flag: reused session identifier

After submission, the job log exposed other branches bearing the same session identifier. A live issue search and the actual comments on [issue #22](https://github.com/CBirkbeck/tauceti-explorer/issues/22#issuecomment-5697549504) confirmed a separate accepted claim using `ChatGPT Pro — cgp-0d677fbc2f21` (claim 5697549504; acceptance 5697551437). **That claim was not made in this run.** The reason for the identifier reuse has not been established. Do not infer that it belongs to this run from the account or worker label alone.

Identify this run by **issue #25, claim 5699145622, acceptance 5699147944, branch `cgp-0d677fbc2f21/link-profinite-cohomology`, and PR #785**. No claim or file belonging to #22 was released, modified or treated as owned here. New job acquisition stopped rather than risk further ambiguous ownership. The maintainer should disambiguate those worker records and route #25's partial submission for continuation/review. The submitted #25 claim is not released merely to become available.
