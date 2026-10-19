# Independent review: Berkovich motives

**Accepted after correction.** Job `REV-DESIGN-MotivesAndAlgebraicCyclesPartII`, issue #3577. Reviewer: Codex, session `codex-iXxSqq`, 19 October 2026. The reviewed design was written by a different worker, session `codex-kJCITL`, in commit `f156f1da1` (PR #10705).

This accepts the complete target-level planning pass, with its stated supplier requests and proof leaves. It certifies no formalized motivic theorem and closes no layer. The packet's `review.checked` records an individual mathematical verdict for every node.

| Inventory | Result |
| --- | --- |
| Nodes | 79: 70 verified, 9 corrected, 0 added, 0 unverifiable |
| Kinds | 46 theorems, 13 definitions, 12 constructions, 6 lemmas, 2 comparisons |
| Layers | 13 planned, 0 closed |
| Definition/construction interfaces | 75 API items and 75 discriminating checks across all 25 objects |
| Planets | 57, within the per-layer limit |
| Baseline declarations | All 3 confirmed; none removed or replaced |
| Supplier contracts / gaps | 32 open requests; 4 explicit gaps retained |
| Source findings | E1–E5 independently confirmed; E6 added and confirmed |

## Mathematical corrections

1. **BM.0/seminormed-assembly.** Scholze, Definition 2.7 and Proposition 2.9, pp. 9–10, require generation under colimits by objects admitting sequential weakly compact presentations. The former statement required every object itself to have that presentation. Corrected the quantifier and added an acceptance condition preventing its reintroduction. This is the nonstable seminormed assertion; completion does not automatically preserve it.
2. **BM.0/quasi-pro-etale.** Lemma 4.5, pp. 19–20, restricts both algebras to strictly totally disconnected objects for the equivalence with profinite sets over the base spectrum. Corrected the statement, proof, equivalence API and profinite-fibre check. The general geometric-fibre definition is unchanged.
3. **BM.2/effective.** Lemma 5.3, p. 26, uses the geometry of the Berkovich closed disc in its cohomological bound. Added the exact TB.1 disc and tree prerequisites and identified their role in the proof, alongside the already requested residue Galois bound. Both prerequisites are already in the layer's external scope.
4. **BM.2/homotopy-rational.** Removed the redundant reduced-unit/Tate formula that preceded its construction in BM.3 without a prerequisite. The node now states exactly Proposition 5.10, p. 30: rational truncation stability. The normalized Tate formula remains in BM.3/tate.
5. **BM.5/rational-cancellation-inverse.** Theorem 7.1's proof, especially p. 42, uses étale spaces with finite geometric fibres that may be nonseparated where multivalued points collide. Replaced the stronger finite-étale assertion and added the corresponding acceptance condition. Multiplicities and an eventually sufficiently large N remain essential.
6. **BM.10/algebraic-etale.** Distinguished Cisinski–Déglise Corollary 5.5.5's with-transfer comparison from the transfer-free comparison in Corollary 5.5.7, pp. 55–56. The latter assumes characteristic zero or invertibility of 2. Expanded the M.5a supplier request to expose the remaining 2-primary bridge in positive odd characteristic; inversion of the characteristic alone does not discharge that contract. No unrestricted enhanced comparison is attributed to these triangulated results.
7. **BM.10/algebraic-mapping-input.** Corrected the rational mapping spectrum to `K(X)_Q^(j)[−2j]`, so its homotopy group π_i is `K_{i+2j}(X)_Q^(j)`. Cisinski–Déglise Theorem 5.2.2, p. 44, fixes this grading through its formula with `K_{2j−q}`. Added the P¹ check: weight-one K_0 appears at π_−2, whereas π_0 is zero. Corrected the locator to distinguish the theorem on p. 44 from its proof on p. 47.
8. **BM.10/discrete-generators.** Expanded the Laurent-series argument of Theorem 11.1, pp. 57–58, to include descent of finite-presentation data and finite-extension Artin generators. The algebraically closed geometric-point theorem cannot simply be applied to the nonclosed field k((T)). Its finite extensions are again Laurent-series fields here, allowing the split-pushforward argument on the additional generators.
9. **BM.10/discrete-mapping.** Applied the same grading correction and P¹ check to the Berkovich formula. Recorded the omitted source shift as E6. The supported K-theory weight shift, derived completion and prime-to-characteristic range remain explicit.

All nine corrections and the refined supplier contract are reflected in the reader. The new roadmap definition also states the BM.10 normalization. Coverage lists no longer ask for the independent review completed by this job. No new mathematical node or ownership move was necessary. The suggested file's statements needed no alteration.

## Source verification

I read each node at its recorded source locator, including the relevant proofs, and checked its source-match description. The sources and page conventions are:

- [Scholze, *Berkovich motives*, arXiv v3](https://arxiv.org/pdf/2412.03382v3), §§1–12, pp. 1–64, with the references on p. 65. These are preprint internal page numbers, not JAMS pagination. The [author copy](https://people.mpim-bonn.mpg.de/scholze/BerkovichMotives.pdf) was independently compared at pp. 35, 38 and 57 for the six findings.
- [Van der Put, *The class group of a one-dimensional affinoid space*](https://www.numdam.org/item/AIF_1980__30_4_155_0/), pp. 155–164, especially Theorem 1.1, pp. 156–158, and Corollary 1.3 and proof, pp. 159–161. The theorem's smooth missing reduction points are weaker than the analytic disc-boundary refinement; the packet correctly requests the latter from TB.
- [Bosch–Lütkebohmert–Raynaud, *Néron Models*](https://doi.org/10.1007/978-3-642-51438-8), maintainer-cleared copy read in place, §9.2, pp. 243–249: Proposition 3, p. 244, Example 8, pp. 246–247, and Proposition 10, p. 249. These provide Picard and normalization background. The marked reduced-modulus torus extension is constructed in the packet, rather than attributed wholesale to the book. No book file or passage is reproduced.
- [Cisinski–Déglise, *Étale motives*, arXiv v4](https://arxiv.org/pdf/1305.5361v4), §2.2, pp. 25–28; §4.5, p. 41; §§5.1–5.2, pp. 42–45 and the proof on p. 47; §5.5, pp. 53–56. The enhancement and the full transfer-free bridge remain supplier work, with coefficient restrictions now explicit.

The five existing source findings were recomputed rather than accepted from the design:

| Finding | Independent check |
| --- | --- |
| E1, Lemma 6.5 proof, p. 38 | Outer radius r₂ and inner exponent k_i are required; the other centre distances equal 1. |
| E2, same proof | Subtracting 1 gives numerator T₁−T₂; the sign does not affect the norm estimate. |
| E3, same proof | The containment concerns the image of the motivic map, not an isolated rational factor. |
| E4, same proof | Each annular source contributes d degree coordinates; e sources contribute de. |
| E5, Proposition 5.19 proof, p. 35 | Both root-radius inequalities must hold, so take their minimum. The stated C₂ polynomial has root norms 2 and 1/8 and rejects the printed maximum test. |
| E6, Theorem 11.1, p. 57 | The Tate convention, Proposition 8.5's `[2j]` K-splitting and CD Theorem 5.2.2 all require the missing `[−2j]` mapping shift. |

Every entry has the required reviewer verdict and reason in `sourceIssues`. All concern the inspected preprint and author copy. The arXiv history still ends at v3; no separate correction was linked on the author's papers page or in the Crossref record for DOI 10.1090/jams/1068. The version-of-record PDF returned HTTP 403 and was not compared. This is a bounded correction search, not an assertion about the inaccessible journal text.

## Baseline, ownership and closure

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, I read and confirmed:

| Declaration | Module and line | Fit |
| --- | --- | --- |
| `NormedField` | `Mathlib.Analysis.Normed.Field.Basic`, 154 | Field/norm/metric carrier with multiplicative norm for the light one-unit prototype. |
| `IsUltrametricDist` | `Mathlib.Topology.MetricSpace.Ultra.Basic`, 46 | Strong metric triangle inequality used by the one-unit subgroup and norm API. |
| `CategoryTheory.GrothendieckTopology` | `Mathlib.CategoryTheory.Sites.Grothendieck`, 72 | Sieve topology axioms; it does not supply an enhanced Banach arc-site. |

Tau Ceti remains pinned to `f790474821cf4256814db967cb154e7af3d0c369`. No baseline citation was removed or broadened. The reviewed E0/E2/E5 library audit entries distinguish ordinary derived and quasi-categorical structures from the enhanced motivic carriers. There is no dedicated TB or parent-motives audit entry, so their packet statements were checked directly.

The current read-only upstream roadmap checkout was `0d144d044dacebca17b654695b6f1ad58f159b27`, with Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I read the nearby AdicSpaces and JacobianChallenge documents and checked their suggested forms, the current library and all nine roadmaps newer than the atlas snapshot. Their scopes introduce no duplicate Berkovich-motive target. Existing single-section rigidified line bundles/Picard functors, ordinary abelian varieties and Huber-ring infrastructure stay imported through their existing owners. The new multi-marked semiabelian extension is distinguished from that infrastructure.

I checked external node statements and supplier-stage scopes against the consuming proof steps, including the E5 monoidal/presentability nodes, RT.5 almost-module K, nonconnective K continuity, scheme supported excision, finite/local-field inputs and the diamond stages. The 32 requests explicitly describe stronger ranges not supplied by the existing statements. Their original cited papers have not all been independently certified by this review; the packet does not treat these requested contracts as established inputs. No cyclic internal dependency or missing layer target remains. All 45 owned extraction items have explicit target maps; the 19 imported items remain accounted for by owners or stated leaves.

The four retained gaps are actionable:

- **BM-G1:** assign general integral KH cdh descent and the formal-model comparison to a live owner. The live height-one-localized GeneralAlgebraicKTheoryPartII is insufficient.
- **BM-G2:** assign valuation-ring K invariance, negative K vanishing and smooth-completion relative K/KH comparison. Regular-noetherian S.5 does not cover these rings.
- **BM-G3:** assign the full geometric Gabber–Suslin field-extension rigidity input; the henselian L.2 request covers a narrower result.
- **BM-G4:** provide a separately sourced RigDA comparison if a later consumer needs it. No such equivalence is assumed here.

These owner decisions and fulfillment of the explicit supplier requests, especially the clarified M.5a coefficient bridge, remain for the orchestrator. They do not create an unresolved contradiction in this target-level pass. No stage is declared closed.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/MotivesAndAlgebraicCyclesPartII.json`: zero errors, zero warnings.
- `lean-check research/blueprint/suggested/MotivesAndAlgebraicCyclesPartII.lean`: passed at the pinned shared build, with exactly six declared proof-placeholder warnings and no errors or other warnings. Available memory was checked first. No build, dependency update or language server was run.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/MotivesAndAlgebraicCyclesPartII.lean`: passed. The file retains one real-bodied light definition, three API theorems and three examples; heavy absent carriers remain reader targets.
- Swarm `intake.py check-files`, reader/packet agreement, node-verdict coverage, extraction partition, dependency acyclicity, definition API/check counts, per-layer planet limit and whitespace checks: passed.

The handoff records the surviving owner decisions. No source files or passages are included in this submission.
