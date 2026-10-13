# BP-AInfCohomology: complete whole-roadmap plan

Codex, session `codex-tzz4ur`, 13 October 2026. Refs #9406. Claim confirmed by the bot on the [claim comment](https://github.com/CBirkbeck/tauceti-explorer/issues/9406#issuecomment-6149125074). Branch: `codex-tzz4ur-ainf-cohomology`.

## Delivered and coverage

The [packet](../packets/AInfCohomology.json), [definitive reader](../readmes/AInfCohomology.md) and [suggested file](../suggested/AInfCohomology.lean) replace the stale whole-roadmap assembly. The plan imports 197 targets from the accepted AI.0 and AI.6 parts and adds 29 targets. The reader states every target, hypothesis, effective prerequisite, proof outline, use, API item, definition test, acceptance check and source locator, with five worked examples. Nothing outside this job's four deliverables was changed.

The combined inventory is **226 targets: seven definitions, 48 constructions, 45 lemmas, 28 comparisons, five applications and 93 theorems**. It contains **249 API items, 190 definition tests, 44 planets and 59 baseline declarations**, with **25 supplier requests, 17 mathematical gaps and 21 inherited independently confirmed source findings**. The main packet's own `nodes` field contains the 29 additions: seven constructions, four comparisons and 18 theorems, with 28 API items, 29 tests and one additional planet. Its `inventory` field counts the full assembly.

| Stage | Targets | Planets | Status |
| --- | ---: | ---: | --- |
| AI.0 | 18 | 3 | planned |
| AI.0:integral | 6 | 2 | planned |
| AI.0:period-comparison | 2 | 1 | planned |
| AI.1 | 44 | 6 | planned |
| AI.2 | 24 | 6 | planned |
| AI.3 | 17 | 5 | planned |
| AI.4 | 18 | 5 | planned |
| AI.5 | 16 | 4 | planned |
| AI.6 | 55 | 6 | planned |
| AI.7 | 26 | 6 | planned |

All stages have a complete target-level plan; **none is closed**. Implementation statuses remain `unchecked`. The latest RS-01 review requires changes, so its proposed stage restructuring has not been applied.

## Accepted imports and effective dependencies

The accepted parts remain byte-for-byte unchanged:

- [AI.0 packet](../packets/AInfCohomology--AI.0.json): 137 targets, accepted by `independent-review-REV-AInfCohomology--AI.0~2` on 10 October; SHA-256 `c6ebdd42d57283b23bf1a2de39734408b20813b5dbe54063896ae5619d302034`.
- [AI.6 packet](../packets/AInfCohomology--AI.6.json): 60 targets, accepted by `independent-review-REV-AInfCohomology--AI.6~2` on 8 October; SHA-256 `13c6f1133e68b406f9a86cbecb2354e1459c3157902fda55b6a404a61b592948`.

The validator forbids duplicate node IDs across packets of one roadmap. Therefore the main packet uses `importedNodes`, records its import hashes/reviews in `assembly.imports`, and puts only new IDs in `nodes`. The reader and `coverage.targets` range over the union. **For every imported target, use `assembly.importedPrerequisites[id]` in place of the historical part's prerequisites when assessing or packaging this whole-roadmap plan.** `assembly.requestResolutions` resolves the earlier broad AI.0–AI.5, CP.3 and RT.6 requests to specific targets; it does not claim that these targets are implemented. `assembly.importedTextReplacements` records the corresponding owner corrections in mathematical prose.

The stock checker validates the packet and permits planned coverage supplied by same-roadmap packets. It does **not** interpret these assembly fields or certify the combined graph. The separate combined-graph and reader checks described below are necessary. A package must follow the definitive reader and explicit overrides; concatenating the historical parts would restore obsolete upward dependencies. No intake/import resolver was added by this job.

## Ownership and current library reuse

The current upstream read used TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, and its Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. AdicSpaces and AlgebraicVectorBundles readers and declaration inventories were read, along with the current Fargues–Fontaine Y, Window and Quotient declarations. The already proved analytic union-locus equality is reused. The SW analytic endpoint neighborhoods, interval rings, boundary stalks and extension theorem remain an explicit AdicSpaces extension; scheme/QCoh vector-bundle operations do not supply it. The topology bridge requires cofinality for the stated `(p,μ)` and `(p,[ϖ])` ideals and supplies no automatic ξ-adic or derived-completion identification.

The pinned audit registry has no AInf entry. The accepted AUDIT-35 AInf entry and REV-AUDIT-35 report were read instead. Existing Witt, PreTilt, Fontaine theta, BDeRham, module, complex and polynomial carriers are reused; baseline references were checked against pinned sources and the real declaration index.

Under WORKERS' upstream ordering, AInf is in tier 13 with PadicHodgeTheory, PerfectoidQuotients and PrismaticCohomology. The effective dependencies and request owners are exclusively existing libraries, lower tiers or that bundle. Maintainers should redirect the following higher-owner references, recorded in `assembly.moves`:

- CP.3's ten required canonical B_dR⁺ deformation inputs → AI.6, from finite Tate thickenings and full embedding-ideal envelopes to contraction, spreading, finite freeness, the explicit étale map and smooth integral map agreement.
- RT.6's nine required trace inputs → AI.7, from sphere-monoid relative traces and perfectoid coefficients to QRSP unfolding, base change, relative coefficients and Bott Frobenius.
- CP.0 Witt coherence → `AI.0/witt-coherence`; CP.5 generic perfectness/Tor control → `AI.2/ainf-module-perfectness`; CP.5 module structure → `AI.2/ainf-module-structure`. The accepted earlier ownership is preserved before geometric cohomology.

No other owner's packet was edited. Generic Koszul and derived foundations remain in DD, PD/log foundations in CR, period-ring structure in R06.1, and spectral carriers/norms/Tate infrastructure in E5:abstract. The actual Bökstedt F_p coefficient calculation is an AI.7 proof input, not a claim that the existing abstract algebra-object node supplies it. P8:local-rational's primitive proper integral child must precede the comparisons that use it, independently of its later rational proper consumers.

## Sources and reading limits

New direct reading on 13 October is recorded separately from inherited part provenance in `sourceVersions`:

- BMS1 arXiv v3: Remark 4.31; Definition 5.4, Remark 5.5 and Lemma 5.6; canonical deformation §13, especially Construction 13.6's full embedding ideal, Lemmas 13.12–13.13 and Theorems 13.19/13.23; Theorem 14.5(i)'s explicit-map proof. Printed pp.43–44, 46–47, 104–117 and 121 distinguish this edition from the published pagination. The cleared reference was read in place.
- CK arXiv v3: Lemmas 3.6, 3.13, 3.18, 3.24; Lemmas 3.29/3.33; §§6.1–6.2 and §7.10/Lemma 7.11. In particular Lemma 3.24 is on printed p.19 and §7.10/Lemma 7.11 on p.71. These supply the explicit regularity, completed-sum, nonflat décalage, coefficient-flatness and normalized-length inputs.
- Published BMS2: pp.201–205, 230, 243–248, 253–259, 276–280, 286–289 and 299–306, for the required trace foundations, graded coefficients, QRSP unfolding and relative Breuil–Kisin descent. Corollary 8.18's graded Segal map retains the truncation statement. Degree-two Bott inversion is distinguished from the degree-zero power-series parameter.
- BS22 arXiv v4: Proposition 15.7, printed p.105, read in the cleared reference. Its Nygaard-completed Frobenius-pullback identification is retained in the relative trace contract.

The packet records edition URLs and hashes. The accepted parts supply the wider BMS1/BMS2, Scholze-plus-corrigendum, SW, Zavyalov, Anschütz–Le Bras and BLM readings and source corrections. This pass is not a new independent review of all those proofs or findings. CK's published interior and the complete published BLM interior were not read; findings remain limited to the identified accessible editions. External EGA, GR, Beilinson, formal-GAGA and coherent-finiteness inputs retain their exact locators and explicit gaps; no blanket reading or verification of those works is claimed. No source passage or restricted source file is committed.

## Verification and reproduction

- The stock `scripts/check_blueprint.py` passed on the main packet and both accepted parts with the pinned declaration index: **zero errors and zero warnings for each**. Its count for the main packet is 29; the combined count is 226.
- A separate check loaded both imports, verified their hashes/reviews and inventory, substituted every explicit imported prerequisite list, and ran a depth-first cycle check over all 226 nodes. Every internal dependency and use resolves; all request/gap consumers resolve. A check against the actual upstream tier table confirmed the lower-tier/bundle rule. Coverage is exactly the combined node set; each stage has at most six planets; all definitions/constructions have at least three API items and tests; API/test names are unique.
- Reader comparison checked every target's statement, hypotheses, effective dependencies, proof steps, API/test names and statements, uses, acceptance checks and locators, allowing only the recorded owner wording replacements. It also checked supplier contracts, gap details, baseline descriptions and all 21 reviewed source findings. There are exactly 226 target register entries.
- `research/blueprint/intake.py check-files` passed on all four deliverables. `scripts/check_sorry_data.py` and `git diff --check` passed.
- `lean-check research/blueprint/suggested/AInfCohomology.lean` exited **0** at the pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Lean 4.34.0-rc2. Its only warnings were **16 declarations using `sorry`**. The Tau Ceti baseline is `f790474821cf4256814db967cb154e7af3d0c369`. The file has **164 lines, ten real-bodied light definitions, nine milestone theorem statements and seven examples**. It uses Mathlib carriers and contains no data placeholder. No geometric or spectral comparison is certified by this elaboration.

Run the stock checks from the repository root with the existing pinned index:

```sh
python3 scripts/check_blueprint.py research/blueprint/packets/AInfCohomology.json research/blueprint/packets/AInfCohomology--AI.0.json research/blueprint/packets/AInfCohomology--AI.6.json --index "$TAUCETI_BASELINE/declarations.tsv"
python3 research/blueprint/intake.py check-files research/blueprint/packets/AInfCohomology.json research/blueprint/readmes/AInfCohomology.md research/blueprint/suggested/AInfCohomology.lean research/blueprint/handoff/BP-AInfCohomology.md
python3 scripts/check_sorry_data.py research/blueprint/suggested/AInfCohomology.lean
```

To reproduce the combined closure check without worker scratch, load each JSON named by `assembly.imports`; verify `sha256` and `nodeCount`; form a unique ID dictionary from their `nodes` plus the main `nodes`. Build an adjacency list using `assembly.importedPrerequisites.get(id, node['prerequisites'])`. Traverse only edges in that dictionary for cycles; require every other `AInfCohomology:` reference to be a scope stage with a supplier contract or gap. Compare the union of `coverage.targets` with the dictionary keys. Resolve every `uses.where` and every request/gap `neededBy`; one historical use joins two IDs with ` and `. Count `api`, `tests` and `planet` over this same union, rather than counting `importedNodes` as newly defined nodes. The definitive target register provides the effective text and dependency comparison for the reader.

## Remaining work and where to resume

This job's whole-roadmap planning pass is complete and ready for independent review. The reviewer should start with the 29 additions and the 197 explicit dependency overrides, then check the source-normalized comparison maps and the import workflow. The reviewer must be independent of `codex-tzz4ur`. Packaging follows acceptance and must use the effective assembly described above.

Stage closure still requires the 25 exact supplier contracts in the packet/reader: E1, E4, E5 and E5:abstract; DD.0 and DD.1; R06.1 and P8:local-rational; A1; P1 and P3; R07.2 and R07.4; PR.0 and PR.3; CR.0, CR.3, CR.4, CR.5, CR.5:log-algebra and CR.6; AdicSpaces R0, R2, R3 and the current Layer 6 extension. Requests distinguish an existing import from the extra hypotheses or compatibility it must supply.

The 17 gaps specify the work before closure:

- G-01–G-04: enhanced ringed-topos/invertible-line signatures, continuous completed cochains, perfectoid minuscule windows and analytic endpoint reconstruction.
- G-05–G-08: crystalline map agreement, integral Frobenius-descent proof refinement, early primitive integral comparison and the nonnoetherian rational crystalline bridge.
- G-09–G-12: rank-one formal GAGA/coherent finiteness, the enumerated external inputs with no located supplier, nodal-conic coherent cohomology, and relative trace/specialization comparison-map agreement.
- G-TRACE-FOUNDATIONS: spectral carrier extension and the AI.7-owned Bökstedt coefficient proof input.
- G-BDR-SPREAD, G-BDR-ALGEBRA and G-BDR-MAPS: formal versal descent/spreading, finite-thickening topology and flat/free lifts, and the normalized smooth integral/canonical comparison diagram.
- G-LENGTH: rank-one valuation presentations and Fitting multiplicativity, retaining the adjacent-degree ξ-Tor correction in specialization.

The earlier suggested-file omissions are no longer counted as mathematical gaps: unavailable geometric/enhanced/spectral carriers have their full targets in the reader, as the current WORKERS shape requires. Actual constructions and proofs still need the stated suppliers. All disposable reading texts, generators and validation scripts are removed after the PR opens; this note and the four deliverables contain the continuation record.
