# Independent review: Analytic toric geometry, Part II — revision round 2

Issue [#8934](https://github.com/CBirkbeck/tauceti-explorer/issues/8934), job `REV-DESIGN-AnalyticToricGeometryPartII~2`. Reviewer: Claude (Opus 5.5), session `claude-9Zw89e`, 2026-10-17. The bot confirmed the claim in [comment 6241602959](https://github.com/CBirkbeck/tauceti-explorer/issues/8934#issuecomment-6241602959). The design was written by `codex-BtPquw` (#4583) and revised by `codex-17drGS` (#8920); the first review was `codex-y9u2mW` (#4591). This session did none of that work.

**Verdict: accepted.** The first review's only blocker is resolved: the reader now agrees with the corrected packet. A full independent pass found six nodes to correct and nothing to send back. All seven stages stay `planned`, none `closed`, and every `implementationStatus` stays `unchecked`.

| Item | Result |
|---|---:|
| Nodes checked | 29 |
| Verified / corrected / added / unverifiable | 23 / 6 / 0 / 0 |
| Definitions and constructions | 12, each with at least three tests |
| API items | 62 (1 added) |
| Unit tests | 39 (1 reworded) |
| Planets | 28, at most six per layer |
| Baseline declarations | 8 confirmed, 0 removed |
| Supplier requests | 8 (SF.2 narrowed) |
| New source findings | 5 misprints, E1–E5, all confirmed |
| Stage coverage | 7 planned, 0 closed |

## The first review's corrections

The round-1 report asked for the reader to be synchronised: the introduction (sharp and geometric reduction), `NT.0/divisor-sections`, `NT.1/unit-toric-space`, `NT.2/perfected-divisor-sections`, `NT.2/graded-divisor-algebra`, `NT.3/projection`, `NT.5/dense-field-approximation`, `NT.6/complete-intersection-approximation`, the changed inputs, the C0 request, the current-main AdicSpace note and the Stacks source. I checked these two ways.

- **By script, field by field.** For every one of the 29 nodes, the reader contains the exact statement, every hypothesis, proof step, input, API item, test, use, acceptance check, source locator and match, and the declaration name. Before my edits and after them, no field is missing.
- **By reading.** I read the introduction, the closing sections, the supplier contracts and the specific places the report named. The mixed-characteristic line test now uses residue characteristic 2. The endpoint keeps a closed model over k₀, and its geometric reduction is a separate object. The convolution APIs and tests are present, as are the nonzero approximation at a finer Gauss-point threshold and the O(p^N D) object.

## Corrections made in this review

1. **`NT.4/power-cohomology`: exact supplier nodes instead of a request.** The special-fibre step needs two things: that relative Frobenius is a universal homeomorphism, and that pulling back along a universal homeomorphism is an equivalence of étale topoi. The packet requested both from the stage SF.2. SchemeAndStackFoundations already plans both exactly: `SF.0/relative-frobenius` (iii) and `SF.0/universal-homeomorphism-etale-site`. PROTOCOL §3 says to cite such a node directly. I added both as prerequisites and rewrote the step. It now says that X_{Σ,κ} is a base change from F_p, so the identification X^{(p)}≅X turns relative Frobenius into the coefficient-linear φ_p. I narrowed the SF.2 request to smooth proper base change.
2. **Naturality in the perfectoid field (`NT.3/projection`, `NT.3/etale-topos`, `NT.3/open-topos`, `NT.4/projection-cohomology`).** The accepted consumer DeligneWeightsAndPurityPartII uses two things here. `WM.4/tilted-approximation` base-changes the inclusion |Z^an|⊂π⁻¹(Ỹ) to a finite extension L♭. `WM.4/comparison-map` needs π and the torsion comparison to be Galois-equivariant over C. It records both as a request to NT.3, and no node stated them. PROTOCOL §4 derives the API from such uses. I added the API item `toricProjection_baseChange` (functoriality in continuous isometric embeddings of perfectoid fields, including automorphisms of C) to `NT.3/projection`, with a proof step, the inputs `NT.1/unit-toric-space`, `NT.2/perfectoid-toric-space` and `P2/perfectoid-spaces-and-glued-tilting`, and the consumer's use. I added matching naturality clauses, with proof steps, to the two NT.3 topos theorems and to `NT.4/projection-cohomology`. These are routine functoriality statements of the constructions already planned. They change no hypothesis, and they discharge the consumer's request.
3. **`NT.6/intersection-weights`, test `toricIntersectionWeights_product`.** The phrase "equal opposite values" could be read as values of opposite sign. The test now says that each pair of opposite rays carries equal values, which is what the balancing rows and the Lean example state.
4. **Stage `requires` in the roadmap definition.** Several stages omitted direct dependencies that their own nodes use. I added C0 and the parent's Layer 0 to NT.1, the parent's Layer 0 to NT.2, and P2 to NT.3. NT.4 gains NT.1, P7, C0 and SF.0; NT.5 gains NT.1 and R2; NT.6 gains NT.0 and C0. A script now finds no node dependency missing from its stage's list, and no node cites a later layer. The reader's per-layer dependency lines follow.
5. **NT.6 boundary.** TauCetiRoadmap main 350e970 now contains SchemeAndStackFoundations. It has Chow groups, Chern classes, refined Gysin maps and the intersection product on smooth schemes, but no bivariant (operational) Chow classes and no Kronecker duality. NT.6 requests both from SF.5. I added a `remaining` item to NT.6 and a sentence to the SF.5 contract. If SF.5 does not export these, the Minkowski-weight identification is stated for regular complete fans, where A^j is A_{n−j} with the smooth intersection product. That is all that `intersection-degree` and the endpoint use.
6. **Reader closing section.** It said duplication was checked against "TauCetiRoadmap current main 0d144d04". That is a local feature-branch commit, not GitHub main. It now records this review's recheck (below), and the packet's `currentLibraryCheck.reviewRecheck` records the commits.
7. **Suggested file.** The 21 `example`s now carry a one-line label naming the packet test or acceptance check they realise. No declaration changed.

## Sources

I fetched all three PDFs from the packet's URLs; their SHA-256 hashes match the records. I also read arXiv v1 of Scholze (1111.4914v1, SHA-256 `065441a8…18e7b`) to see whether the slips below are in the preprint too. The Stacks tags 035U, 020I and 035X were read online. No private book was used, and no source text is in the repository.

- **Scholze, *Perfectoid spaces*, IHÉS 116 (2012), published pagination.** Every node locator was checked at its printed page:
  - §1: Theorem 1.5 (p. 247), Theorem 1.13 and its discussion (pp. 249–250), Lemma 1.16 (p. 251);
  - Proposition 5.20 (p. 280); Lemma 6.5 and Remark 6.6 (pp. 288–290);
  - Definition 7.14, Proposition 7.16 and Theorem 7.17 (p. 302), and Corollaries 7.18–7.19 (p. 303);
  - all of §8 (pp. 303–307).

  Theorem 8.5 is stated for the unit-model space (calligraphic 𝒳^ad, the packet's A_{Σ,K}), and Proposition 8.6 for the analytification of a proper smooth variety. The packet keeps this distinction. Part (v) of 8.5 asserts only a morphism of étale topoi with a commuting square, and `NT.3/open-topos` asserts exactly that. The hypotheses of 8.6 (proper smooth, K algebraically closed, ℓ≠p), 8.7 (proper smooth) and 8.8 (projective smooth) are carried exactly. The integrality, homogeneity and threshold conditions of Lemma 6.5 match the P2 request.
- **Fulton–Sturmfels, arXiv:alg-geom/9403002v1.** Read:
  - (1.1) and Proposition 1.1 (p. 4), the degree map (p. 5);
  - Proposition 1.4 and Theorem 2.1 (p. 6), Lemma 2.3 and Corollary 2.4 (p. 7);
  - Proposition 3.1 (p. 10), Theorem 3.2 (p. 11) and its proof (pp. 12–13).

  The balancing relation (2.1) and the multiplicity [N:N_σ+N_τ] match the packet. On the wall sign, I checked O(1) on P¹ directly. With section-generator weights, m_ρ′−m_ρ=c(σ)b_{ρ,σ}, as the packet states. This agrees with (2.3) when u(ρ) there is read as the local-equation weight, as the node's match says.
- **Fujino–Sato, author version 0.27, Example 4.1 (pp. 7–8).** Seven rays and ten maximal cones. A script confirms that every maximal cone has determinant ±1 and that 20,000 random vectors each lie in exactly one cone, so the fan is smooth and complete. The source's argument gives nonprojectivity.
- **Stacks 020I and 035X**: reduced over a perfect field implies geometrically reduced, and the purely inseparable criteria. Both support the distinction at the endpoint.

### Source findings (`sourceIssues`)

The packet had none. E11 of the paper extraction is used through `sourceIssueReferences`. None of the following five appears in the extraction or in `data/source-issues.json`. Each is a misprint that affects nothing, and each is confirmed by this review.

| Id | Locator | What is wrong, and the correction |
|---|---|---|
| E1 | Scholze, proof of Proposition 8.7, p. 306 (arXiv v1 p. 47) | The display putting g's coefficients in the dense subfield bounds the weights by −j a_i. g has degree one, so the bound is −a_i. |
| E2 | same place | Two integral trivializations of O(D) are said to differ by a unit of K°. They differ by a unit of the integral structure sheaf (on P¹ with D₋, by t^{±1}); its absolute value is still one. |
| E3 | Scholze, Definition 8.1 and Definition/Proposition 8.4, pp. 303–304 (arXiv v1 pp. 44–45) | The torus and the ray charts are written with exponents k and k−1, while k is the base field. The rank of N is meant. |
| E4 | Fulton–Sturmfels, Theorem 3.2, p. 11 | Genericity is described in N_γ⊗R, but the displacement lives in (N/N_γ)⊗R, as in the proof on p. 13. |
| E5 | Fulton–Sturmfels, proof of Lemma 3.4, p. 12 | The proof refers to itself as Lemma 3.3. The paper has no Lemma 3.3. |

E4 and E5 were checked only against the preprint. The packet now lists `sourceVersions` for all four PDFs read.

## Baseline

All eight declarations were read at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The six Tau Ceti modules in the shared build are byte-identical to the pinned commit. Each provides what its citing nodes need, with the recorded hypotheses:

- `WeilDivisor.OrderSystem.ofScheme`: integral noetherian schemes.
- `Toric.Fan`: may be empty; a nonempty fan contains ⊥ by face closure.
- `Toric.IsToricCone`: a Prop structure with rationality and salience.
- `Toric.primitiveGenerator`: needs the integral-lattice and toric-cone hypotheses.
- `SchemeWeilDivisor`: an abbrev over `CodimensionOnePoint`.
- `SchemeWeilDivisor.sheaf`: needs `IsIntegral`, `IsLocallyNoetherian` and DVR stalks at codimension-one points.
- `AddMonoidAlgebra`: a structure at this Mathlib pin.
- `ZeroAtInftyContinuousMap`.

Nothing was removed or replaced.

## Closure, suppliers and ownership

Every external node id resolves (38 ids in nine supplier packets). I read each cited node's statement against its use:

- **R2:** admissible formal schemes; the good-reduction locus, whose open embedding onto the integral locus is an isomorphism for proper models; the Raynaud generic fibre with plus ring A_K°; section-valuation domains.
- **A1:** the étale site.
- **H0:** derived direct image; module and abelian cohomology agree.
- **P2:** open subspaces, glued tilting, rational localization.
- **P3:** site tilting.
- **P7:** tilde-limits from completed colimits, gluing, perfection, residue-field tilde-limits, the étale topos comparison with continuity, inseparable towers, rational restriction and étale base change.
- **SF.0:** dimension, Cohen–Macaulay schemes, relative Frobenius, topological invariance.
- **SF.5:** Chow groups, bivariant classes, first Chern classes, the regular-section formula, refined Gysin maps, degree, ample.
- **C0:** arbitrary-ring toric charts and face opens.

The étale-topos chain (P7 comparison, then P3 tilting, then inseparable-tower invariance) applies because the finite-level spaces are qcqs and locally noetherian. Three supplier packets are not yet accepted: C0, the PerfectoidSpaces packet that holds the P2/P3/P7 nodes, and SF.0. The H0 packet is accepted but not yet promoted. Their nodes draw no atlas edge until they are promoted.

A script over all packets, accepted or not, finds no latent cycle. Only DeligneWeightsAndPurityPartII cites this roadmap.

Each request is precise, with the eight now as follows:

- the parent's Layer 0 import;
- C0's normal field fibres and properness over every ring, including nonnoetherian K°;
- P2's perfected cone algebras with lineality and the homogeneous Lemma 6.5;
- SF.0's Laurent UFD and the dimension facts;
- SF.2's smooth proper base change;
- SF.5's Chow operations;
- H5's proper comparison;
- H0's pullback and cup products.

**Duplication.** The local checkout of TauCetiRoadmap (0d144d04) is a feature branch, so I rechecked against GitHub main 350e970 (2026-10-17) and Tau Ceti main dd46906 (2026-10-17).

- The parent AnalyticToricGeometry is the complex theory of finite regular fans. It puts coherent toric sheaves, intersection theory and general analytification out of scope, and its Layer 0 works over ℂ. So the divisor modules of NT.0, the nonarchimedean and perfectoid spaces of NT.1–NT.3 and the intersection weights of NT.6 are not the parent's.
- Arbitrary-ring toric schemes are C0's.
- No other TauCetiRoadmap roadmap mentions toric geometry beyond the étale toric charts of AdicSpacesPartII (Scholze 2013, Lemma 5.2), which are a different object.
- Tau Ceti main has only the algebraic and complex toric directories and no perfectoid, tilting or Chow modules.
- The reviewed library audit has no entries for this new roadmap, and its parent and C0 entries plan none of these targets.

**Layers and scope.** NT.0 to NT.6 are correctly ordered, with no backward edge. The scope is honest. Theorem 8.5 holds for every fan. Propositions 8.6 and 8.7 need complete regular fans; Corollary 8.8 needs a projective one. The Fujino–Sato fan tests the absence of projectivity before NT.6, and connectedness and irreducibility are left to the consumer.

**Granularity and API.** The plan is at target level as `detail.json` sets it. Every target and every definition or key theorem a target needs is a node with direct inputs and a sound proof sketch. The API outlines cover the constructors, coefficients, base change, products, norms, gradings and comparisons the consumers use. I added the field-naturality item (correction 2). Each definition and construction has at least three tests, which I recomputed:

- the P¹ sign and weight sets;
- the empty and negative divisors;
- the nilpotent and zero coefficient rings;
- the c₀ non-example;
- both convolution tests;
- the P¹ cone identification;
- the residue-two line test;
- the P¹×P¹ balancing rows and degree.

The planets name the layers' key objects and named theorems, at most six per layer. `NT.3/affine-line` (Theorem 1.5) has no planet because NT.3 is full. I left it so.

## Suggested Lean file

`lean-check research/blueprint/suggested/AnalyticToricGeometryPartII.lean` (shared build, Tau Ceti f790474 with Mathlib 082e2d3) exits 0 with 31 `declaration uses 'sorry'` warnings and no other message, both before and after the label edit. `scripts/check_sorry_data.py` passes: every data definition has a real body, and admissions occur only in proof fields and theorem proofs.

I read every statement for truth, since a false statement would be the worst defect here, and all of them hold:

- the principal shift of section weights;
- membership of monomials;
- convolution of section modules;
- the power map on monomials;
- the c₀ non-example, which holds because the weight set Z[1/p]∩[0,1] is infinite and discrete, so the cofinite filter is nontrivial;
- the real cone tests;
- the tower-projection formula, which holds because φ^n(x_n)=x_0;
- the residue-two line test;
- the compactness lemma, which holds because closed subsets of a compact set are compact;
- the dense-field coefficient step, which holds by truncation at a finite set plus density with one retained nonzero coefficient;
- the balancing kernels.

The file is in the 2026-10-12 shape (WORKERS.md): light real-bodied definitions on pinned carriers, representative theorems and examples. The 19 reader-only targets need geometric carriers that are absent at the pins, so they stay in the reader and the packet, as the design handoff lists.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AnalyticToricGeometryPartII.json`: 0 errors, 0 warnings, before and after the edits.
- A field-by-field reader script finds no mismatch.
- A dry `build.assemble` with this packet, reader and definition promoted succeeds: 35 new stages and 66 stage edges, with no skipped (cyclic) links.
- `lean-check` and `check_sorry_data.py` pass, as above.

## Questions for the orchestrator

1. **The consumer's request to NT.3 is discharged.** `DeligneWeightsAndPurityPartII` asks NT.3 for field naturality of π and of the topos comparisons. It is now `toricProjection_baseChange` together with the naturality clauses of `NT.3/etale-topos`, `NT.3/open-topos` and `NT.4/projection-cohomology`. The consumer's request can be marked as answered by these ids.
2. **Packaging must cite the upstream roadmaps.** AdicSpacesPartII and SchemeAndStackFoundations are now TauCetiRoadmap roadmaps, so their `AdicSpacesPartII:R2/…` and `SchemeAndStackFoundations:SF.*/…` citations become Tau Ceti roadmap references. Upstream SchemeAndStackFoundations has no bivariant Chow classes or Kronecker duality, and NT.6 asks SF.5 for both. Either a SchemeAndStackFoundations Part II supplies them, or the package uses the regular-fan route recorded in NT.6's `remaining`.
3. **Unaccepted suppliers.** The cited suppliers C0, PerfectoidSpaces P2/P3/P7 (in `PerfectoidSpaces--P0.json`) and SF.0 are in packets not yet accepted, and the accepted H0 packet is not yet promoted. Their nodes link in the atlas only once those packets are promoted.
