# Independent review: Toroidal compactifications and boundary geometry

Job `REV-ShimuraCompactifications`, issue #9402. Reviewer: **Claude (Opus), session claude-uHy4x9**. Date: 2026-10-13. The blueprint (`BP-ShimuraCompactifications`, issue #9431, PR #9464) was written by Codex session codex-BbHPTk; this reviewer did none of that work, nor any of the earlier part jobs or reviews.

**Verdict: accepted after corrections.** The plan is a complete target-level pass over all nine layers. Every node was read and its mathematics checked. Two structural errors made the layer graph cyclic, and I corrected both in place. After the corrections, check_blueprint reports 0 errors and 0 warnings, the packet's stage edges close no cycle in the atlas graph, every baseline citation holds at the pins, and every source issue is confirmed. The remaining requests and gaps are recorded precisely, and all nine stages stay `planned`.

## Counts

| Item | Before | After |
| --- | ---: | ---: |
| Nodes | 147 | 148 (1 added) |
| Per-node verdicts | — | 115 verified, 32 corrected, 1 added, 0 unverifiable |
| API items / unit tests | 125 / 97 | 132 / 101 |
| Planets | 40 | 40 |
| Baseline declarations | 27 | 28 (27 confirmed, 1 added) |
| Requests | 45 | 42 (the AutomorphicBundles B3, B4 and B5 requests removed) |
| Gaps | 25 | 25 (three restated) |
| Source issues | 6 | 6, all confirmed by this review |
| Stage cycles that the packet's edges add to the atlas graph | 2 | 0 |

## What was checked

- **Sources.** I fetched every public source at the recorded URL; every SHA-256 matches. The exception is Bresciani's Inventiones PDF, which returns a client challenge, so the one locator on it (C4 semiabelian Tate module) was not re-read. A text-layer search located every cited label and printed page across Lan 2021, Lan 2017 and its errata, Pink, Dimitrov, Dimitrov–Tilouine, BHW, Pilloni 2012 and 2020, Calegari–Geraghty, Boxer–Pilloni, BPS, BCGP 2021 and 2025, Yuan and Farb–Kisin–Wolfson. I then read the passages myself wherever a locator, a source issue or a disputed claim needed it. That covered:
  - Lan 3.3.1, 6.1.2, 6.3.3.15–17, 7.1.1–7.1.2 and 7.2.2–7.2.3;
  - Lan 2017 §§7–8;
  - Pink 2.1, 6.4–6.7 and 6.13;
  - Dimitrov §§6–8;
  - Dimitrov–Tilouine §7;
  - Pilloni 3.4.1 and 13.2.1;
  - FKW §3.2;
  - BCGP 2025 Theorem 1.8.29;
  - Faltings–Chai I.2.5–2.11 (maintainer-cleared copy).
- **Baseline.** Every declaration was read at Mathlib 082e2d3 and Tau Ceti f790474, and all 27 hold as cited. The packet's description of `NumberField.isTotallyPositive_iff` claimed more than the declaration states (that zero is not totally positive). I trimmed it; the citing node does not need that claim. The pointwise coefficient formula used by `C0/face-projection-coeff` is `Finsupp.comapDomain_apply`, which I added as a baseline entry. `MonoidAlgebra.comapDomain` only identifies the operation with `Finsupp.comapDomain`.
- **Closure and suppliers.** Every foreign prerequisite exists: 16 node ids in accepted packets and 47 atlas stage ids. Tier check against `upstream/CaraianiNewton.md`: this roadmap is in tier 15, bundled with AutomorphicBundles, and no citation points to a higher tier. I rebuilt each request's `neededBy` from the nodes that cite it directly. I recomputed stage cycles over the atlas `requires` and `stageEdges` together with this packet's induced edges.
- **Granularity, API, tests, planets.** The plan is at target level as set. Every definition and construction has its API, at least three tests and its uses. Planets are at most six per layer and named from the sources.
- **Suggested Lean file.** `lean-check` elaborates the file at the pins. Its only warnings are the eleven open proofs: five theorems and six examples. It states only facts about carriers that exist at the pins: face quotients of monoid algebras, Hilbert unit-orbit support and trace phases. I checked each statement mathematically. The corrections touch none of them, so the file is unchanged.
- **Reader.** I regenerated every node section, the layer dependency lines, the supplier contracts and the gap list from the corrected packet. A renderer reproduced 146 of the 147 original node sections byte for byte before any change; the 147th differed only by process wording, now removed from the packet. I hand-edited the prose that described the old dependency order, and the reader now agrees with the packet.
- **Library audit and duplication.** No node plans a declaration that the libraries already have. The current-main toric and relative-Spec declarations are cited through their owners, as the packet's upstream notes say.

## Corrections

### 1. Layer cycle between C0 and C1

`C0/compatible-common-refinement` and `C0/smooth-projective-refinement` cited `C1/arithmetic-stabilizer`, but C1 requires C0. They needed it only for Pink 6.19: finitely many effective arithmetic images make two cones meet in the open positivity cone, and so cone stabilizers are finite. Both C0 nodes now take this finite-overlap property as an explicit hypothesis on the abstract arithmetic action. The consumers that apply them to Shimura data now cite `C1/arithmetic-stabilizer` to discharge it: C2 projective-algebraization, C3 level-datum-functoriality, hecke-span and choice-comparison, and C6 admissible-fan-specialization, where it is the Hilbert unit case. This matches the C0 stage text, which plans fans for an arithmetic action, and the C1 stage text, which plans stabilizers.

### 2. Cycle with AutomorphicBundles

AutomorphicBundles B3 requires C3 and C6; B4 requires B3, and B5 requires B4. Ten C3–C5 nodes cited B3, B4 or B5, which closed the cycle C3/C4/C5/C6 → B3 → B4 → B5 → C3/C4/C5. One citation was a genuine node-level cycle: `AutomorphicBundles:B3/refinement-canonical-extension` itself requires `ShimuraCompactifications:C3`. Each use came down to one of four things, each now owned here:

- **The Hodge bundle.** E = e*Ω¹ and its determinant are a new API item, `SemiAbelianScheme.hodgeBundle`, of `C4/semi-abelian-scheme`. Hodge semiampleness, minimal ampleness, the Siegel canonical bundle and both Kodaira–Spencer nodes use it. The interior Kodaira–Spencer map now comes from the accepted node `PELModuli:M2/kodaira-spencer-dimension`. `C4/semiabelian-hasse` defined its line itself and needed no B3.
- **Coherent refinement comparison.** `C3/coherent-cohomology-invariance` now holds for every locally free E with E′ = f*E. The automorphic input f*E^can = E′^can is B3's, and B3 imports this theorem.
- **Koecher.** Lan 2017 Theorem 8.7 is stated for any formally canonical sheaf (Definition 8.5). Its inputs, Lemma 8.1 and Propositions 8.3–8.4, are geometry of the normalized model, so `C5/normalized-koecher` drops B5. `C5/integral-coefficient-extension` becomes the formally canonical interface: kind theorem, verified for the structure sheaf and for tensor, symmetric, exterior and determinant constructions of the Hodge bundle. `C5/siegel-koecher-arbitrary-coefficients` builds ω(a,b) from the Hodge bundle.
- **Minimal compactification.** Lan 7.2.3 identifies the boundary strata through the constant term of Hodge-line sections (Lan Proposition 7.1.2.13). That is the only B5 input `C5/integral-minimal-space` needs. It moves down into a new node, `C5/hodge-line-fourier-jacobi-expansion`, planned from Lan Definition 7.1.1.1, Lemma 7.1.1.5 and 7.1.2.1–7.1.2.13 with full API and tests. The general vector-valued expansion stays with B5.

`C5/good-boundary-cohomology-export` dropped B3. BCGP 2025 Theorem 1.8.29 is an Eichler–Shimura and unramifiedness statement with constant Z/pⁿ coefficients. Its proof uses the smooth model at a hyperspecial prime, with the toroidal boundary noted in a footnote, and no coherent canonical extension; I corrected the attribution to say so. Three `owners` entries record what moved down. The B3, B4 and B5 requests are removed because nothing cites them.

### 3. Statements and locators

| Node | Correction |
| --- | --- |
| C4/constructible-character-sheaf | Restored the source generality: the character sheaf exists over an arbitrary base (Lan 3.3.1.9, Faltings–Chai I.2.10). The node had narrowed it to locally Noetherian bases. |
| C4/semi-abelian-scheme | The character data are Lan Theorem 3.3.1.9 and Corollary 3.3.1.10 (p. 193). Lemma 3.3.1.4 is only upper semicontinuity of the torus rank. |
| C5/integral-toroidal-space | Lan 6.3.3.16 is a Corollary, not a Remark. |
| C5/neat-boundary-open-fiberwise-dense | Lan Definition 6.3.2.5 is on p. 503. |
| C5/minimal-hodge-ampleness | The ample line is the pullback of O(1) under the finite map in the opening construction of Lan 7.2.3 (p. 544). Proposition 7.2.3.4 is Zariski's main theorem. |
| C0/arithmetic-admissible-fan | Restriction preserves neither completeness nor finiteness: Pink 6.5(c), not 6.6. |
| C2/normal-open-dense | Normality of the charts is Pink 6.6, not 6.7. |
| C6/coefficient-unit-orbit | The covariance law is the definition of R_C^(κ)(R) after Dimitrov's equation (5). |
| C6/hilbert-hodge-semiampleness | Added Dimitrov Remarque 8.2(1) for determinant = parallel weight. |
| C6/hilbert-q-expansion-module-injective | Added Dimitrov–Tilouine Remarque 7.4(1) for the non-injectivity of the sum over weights. |
| C6/hilbert-near-ordinary-model, C6/hilbert-p-level-boundary-comparison | BHW §2.1 starts on p. 1720 and §5.1.1 on p. 1741. |

I also removed process wording ("in this checkpoint", "Checkpoint interface retained", "this job's pin") and reworded three temporal-order phrases in packet text.

### 4. Requests and layer order

I rebuilt `neededBy` from direct citations. Every cited foreign stage has a request.

Two same-roadmap layer dependencies are used by nodes but are not declared stage edges, and promotion draws no edge inside one roadmap:

- `C4/formal-universal-degeneration` uses `C1/boundary-torsor-tower`.
- `C3/klingen-correspondence-compactification` uses `C4/boundary-level-comparison`.

Both edges are acyclic. They are recorded as a `restructure` entry for the maintainer. The author's two split proposals were withdrawn because their stated reasons, hidden reverse imports, are corrected in the packet.

## Source issues

All six were re-checked at their locators and confirmed. The earlier part-review verdicts are kept under `earlierReviews`.

- **E1, Pink 2.1(v).** The filtration on Lie P must have steps Lie U, Lie W and Lie P.
- **E2, Lan 6.1.2.6.** The reduced complement equals the orthogonal-character algebra only over a reduced base. Over Z/4Z with the positive ray, the algebra is Z/4Z but the reduced complement is F₂.
- **E3, Lan 2017 Proposition 7.5.** The invariant clause reverses the level groups: for H ⊂ H′ the deck group is H′/H.
- **E-C6-1.** The Koecher contradiction needs ξ₀ ≠ 0.
- **E-C6-2.** "The zero ring" means the zero coefficient module. This is terminology only.
- **E-C6-3.** Formal series do not commute with filtered colimits. The directed-union repair is valid.

No new mistake was found. Dimitrov's finite-generation argument in Théorème 8.6 is correct as printed, because each graded piece is finite. The node's Veronese argument is an alternative route.

## Red-team findings handed to the blueprint

- **RT-AREA-algebraicgeometry/3.** The C2 nodes cite `ComplexComparisonPartII:C0/repair-analytification`. Gap G1 states that the nilpotent-preserving analytic carrier is still unowned. The proposed carrier layer and outgoing links are upstream notes. Correctly handled.
- **RT-AREA-algebraicgeometry/27.** C1 cites HodgeStructures L2 and the native `MixedHodgeStructure` declarations, both confirmed at the pin. The other outgoing links belong to a link-map job. Correctly handled.
- **RT-AREA-algebraicgeometry/34.** `C0/arbitrary-ring-toric-charts` is the single owner of the arbitrary-ring finite-fan scheme, including valuation rings, and the `owners` entry and upstream note send the Binda–Kato–Vezzani Part II to import it. Correctly handled.
- **RT-AREA-padic-1/26.** R07.2 owns the generic Ha, LF and Hodge–Tate sequence. The boundary extension sits in C4 rather than T0, because T0 is in tier 16 and C6 (tier 15) needs it; `owners` records the move and T0 must import it. Correctly handled.

## Questions for the orchestrator

1. **Retire the part packets when this root is promoted.** `data/blueprints/ShimuraCompactifications--C6.json` (the accepted C6 part) is still live. A dry run of the atlas build with this packet added succeeds with no skipped links, but layer C6 then shows its six planets twice. The root continues every part contract, as `continuation.nodeIdMap` records. Remove the C6 part, and the never-accepted C0 part, from `data/blueprints` and `research/blueprint/packets` at promotion.
2. **Stale consumer citations.** 136 citations in other packets still use part ids of the form `ShimuraCompactifications:Cx/<name>`. They are in AnalyticToricGeometryPartII, AutomorphicBundles--B5, HilbertModularVarietiesAndShimuraCurves--H0, HodgeTateAndCanonicalSubgroups--T0 and --T6, IgusaVarietiesAndTorsionConcentration and PerfectoidShimuraVarieties. Every one maps through `continuation.nodeIdMap` to a `Cx/roadmap/<name>` id here.
3. **AutomorphicBundles follow-ups.** B3/refinement-canonical-extension should cite `C3/roadmap/coherent-cohomology-invariance`. B5/constant-term-restriction should specialize to `C5/roadmap/hodge-line-fourier-jacobi-expansion`. B3 and B4 should build their coefficient bundles on the C4 Hodge-bundle API, and verify Lan 2017 Definition 8.5 for their canonical extensions against `C5/roadmap/integral-coefficient-extension`.
4. **Undeclared stage edges.** Declare C1 → C4 and C4 → C3, as recorded under `restructure`.
5. **Bresciani.** The Inventiones PDF could not be fetched (publisher challenge). The C4 semiabelian-Tate-module locator keeps the author's earlier reading; its mathematics was checked independently.

## Checks run

- `python3 scripts/check_blueprint.py --index <pinned declarations.tsv> research/blueprint/packets/ShimuraCompactifications.json`: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/ShimuraCompactifications.lean`: elaborates; the only warnings are the eleven open proofs.
- Stage-cycle check over the atlas graph together with this packet's induced edges: the original packet formed two strongly connected components, (C0, C1) and (C3, C4, C5, C6, B3, B4, B5); the corrected packet forms none.
- Atlas build dry run (`scripts/build.py` `assemble` over a scratch blueprint folder that adds this packet): builds with no skipped links.
- `research/blueprint/intake.py check-files` on the deliverables: no problems.
