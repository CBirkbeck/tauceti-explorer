# BP-MetaplecticAutomorphicForms — #10223

Claude (Opus 5.5), session claude-BTXvI0, 17 October 2026. This is the complete whole-roadmap planning pass, submitted for independent review. It is not a checkpoint. Every node is `unchecked`; all nine layers MP.0–MP.8 are `planned` and none is closed.

## What the packet is

- **Starting point.** Both parts of the roadmap already had accepted plans, last accepted by REV-FIX-RT-AREA-automorphic-1~5 on 8 October and promoted to `data/blueprints`:
  - `MetaplecticAutomorphicForms--MP.0`: layers MP.0–MP.7, 176 nodes.
  - `MetaplecticAutomorphicForms--MP.8`: layer MP.8, 85 nodes.
- **Form.** `research/blueprint/packets/MetaplecticAutomorphicForms.json` follows the parts, as `PrismaticCohomology.json` (PR #10185) did for its roadmap.
  - Its `imports` record the parts as provenance only. `scripts/blueprints.py` takes the nodes of every promoted packet of a roadmap, and `check_blueprint.py` forbids a node id shared with a part.
  - A dry `build.assemble` with the three packets gives 266 declarations, 48 planets, nine layers and no skipped links. The parts are not edited.
- **New nodes (5).** Two definitions, two constructions and one theorem, with 28 API items, 17 unit tests and no planets; every layer keeps its part's planets.
  - `MP.6/metaplectic-modular-group`: Mp(2,ℤ) as pairs (A, w) with w² = cτ + d, the half-integral-weight slash, the principal-branch cocycle, and vector-valued forms of unitary type.
  - `MP.6/classical-jacobi-forms`: Jacobi forms of half-integral weight and positive definite lattice index F of type (Γ, V), the theta functions ϑ_{F,x}, and the theta decomposition J_{k,F}(Γ, V) ≅ (M_{k−n/2} ⊗ W(F)^*) ⊗ Ind V (Skoruppa, arXiv:0707.0718, §4).
  - `MP.6/unitary-jacobi-group`: J_U(W) = H(W₀) ⋊ U(W) for a skew-Hermitian W, and its Schrödinger–Weil representation through the splitting into the scalar extension S_ψ attached to µ with µ|_{k₀^×} = ω_{k/k₀} (GGP §§12, 22, 23).
  - `MP.6/fourier-jacobi-period`: the theta-paired Fourier–Jacobi coefficient and period along Heisenberg parabolics, in the symplectic and skew-Hermitian cases (GGP §23).
  - `MP.7/jacobi-theta-nonvanishing`: jacobiTheta τ = ∏(1 − w^{2n})(1 + w^{2n−1})², hence jacobiTheta τ ≠ 0 on the upper half plane.
- **Why these nodes.**
  - The four MP.6 nodes complete RT-AREA-automorphic-1/20. The finding asked for the Jacobi group with its unitary analogue, Jacobi forms of given weight and index with multiplier systems in QM.1's generality, Fourier–Jacobi coefficients and the theta decomposition. The part planned only the symplectic adelic case, and its own restructure record on /20 proposed adding the classical lattice-index instance (Skoruppa §4) and the unitary instance; these are they.
  - The MP.7 node moves theta nonvanishing down from QSeriesPartitionsAndMockModularForms QM.1, which requires MP.7 (see R4).

## Restructure records (routed edits; no part packet modified)

| Record | What it fixes | Status |
|---|---|---|
| R1 | Layer order: 15 prerequisites ran from a later layer to an earlier one (adversarial package review, blocker B3), and MP.1 ⇄ MP.2 were mutually dependent. Eight targets move layer: rao-factor-set, metaplectic-double-cover and genuine-oscillator to MP.2; the two Hermitian targets to MP.3; ideal-lattice-poisson to MP.5; the two BFH interfaces to MP.8. The planet of MP.2/weil-index-identities is dropped (MP.2 stays at six). Two BSD.2 nodes should cite the moved interfaces by id. | routed to MP.0 part; stage texts for the maintainer |
| R2 | Latent stage cycle MP.3 ⇄ ML.4. ML.4/gan-takeda-llc-gsp4 and ML.5/local-descent-mp2n cite bare MP.3, while three MP.3 targets cite bare ML.4. The three MP.3 citations are re-pointed to exact suppliers: ET.4/tempered-unitary-local-packets with R01.2/local-epsilon-factor; R17.1/local-quaternionic-comparison; ML.4/extended-langlands-parameter. ModularityAndLanglandsExtensions is asked to move its theta-dependent GSp₄ targets into a sub-layer that requires MP.3. | routed to MP.0 part; proposal for the ML owner |
| R3 | MP.8's whole-stage citation of GL₂ R16.2 (blocker B2): dropped from bfh-seed, where it is unused; replaced by R16.6/primitive-classical-bijection in genuine-induced-comparison. | routed to MP.8 part |
| R4 | Latent cycle with QSeries (QM.1 requires MP.7, while seven MP.7 citations point to QM.1–QM.3). Theta nonvanishing becomes the new MP.7 node; Bessel I_ν and J_ν are requested from AL.0, beside AL.0/bessel-k; the weight-k Laplacian is requested from AS.0. AutomorphicSpectralTheory needs the same functions, so their owner must be below it. | routed to MP.0 part; two requests |
| R5 | MP.8's 16 bare citations of MP.1, MP.2, MP.4 and MP.6, each mapped to node ids; row 16 is dropped. | routed to MP.8 part |
| R6 | Gaussian norm (blocker B4). MP.8/theta-pairing and MP.8/theta-components use √det Y/(2a); the correct value is √det Y/(4a), by direct computation. The unfolding prefactor 1/(2mN³) of MP.8/fourier-unfolding-kernel is verified unchanged: it comes from BFH (2.3) and the Gaussian integral on p. 581, not from Proposition 2.1. | routed to MP.8 part |
| R7 | MP.4/function-field-metaplectic-programme pulls GS3 and GS.5 into the ancestry of MP.4–MP.8 and has no consumer. Kept, as the maintainer routed it; propose moving it to the function-field Part II when that is designed. | for the maintainer |
| R8 | The open upstream Theta Series roadmap (TauCetiRoadmap PR #286) contains the binary ideal-class instance of MP.5: θ_A = (1/w)Θ_{L_𝔞} with L_𝔞 even of rank 2 and level \|D\|, so Hecke–Schoeneberg applies. To be re-pointed once the atlas tracks that roadmap. | for the maintainer |

Simulating R1 and R5 over the 266 targets gives three results:
- no prerequisite runs backwards;
- no bare citation of a stage of this roadmap remains;
- no layer has more than six planets.

## Maintainer-added sources and red-team findings

- **Added sources.** All 111 items of the fifteen sources in the issue are planned by targets of the accepted MP.0 part (its `sourceItems`). The packet repeats the map under `maintainerSources`, and the document has it as a table. No item is planned in MP.8, and no new node was needed for them.
- **Red-team findings.**
  - /19 (Siegel–Weil for GZ.5), /21 (SR and AF.1 before MP.3), /22 (QFI 6C in MP.2) and /23 (AA.3, AF.2, AF.3 before MP.5) are handled in the accepted part. I re-read the nodes on 17 October; the packet's `redTeamFindings` lists them.
  - /20 was handled only in part (symplectic, adelic). This packet completes it with the four MP.6 nodes, and R5 makes MP.8's nine bare MP.6 citations exact.

## Source issue

`MetaplecticAutomorphicForms/E-WR-1`: BFH Proposition 2.1 (p. 551) prints the squared norm √det Y/(2N₀); the correct value is √det Y/(4N₀).
- Affects: nothing in BFH. The proposition is used only once, on p. 554, to deduce (2.7), and that step needs only orthogonality.
- Known: new (web search; the EuDML record lists no erratum).
- The accepted MP.8 part copied the constant (R6).

## What remains

- **Part revisions:** apply R1–R6 to the part packets, and the stage-text rescopes of R1 (MP.1, MP.2, MP.7, MP.8).
- **Other roadmaps:**
  - ModularityAndLanglandsExtensions: split the GSp₄ theta-dependent targets of ML.4 (R2).
  - AL.0 and AS.0: answer the two requests (R4).
  - QSeriesPartitionsAndMockModularForms: re-point QM.1 to the new MP.6/MP.7 nodes and to AL.0/AS.0, and keep only the weak/weakly holomorphic Jacobi forms, Rankin–Cohen brackets and q-series.
  - RankZeroOneBSD: cite the BFH interfaces by id (R1).
- **Gaps (2 new):**
  - the MP.3 ⇄ ML.4 stage cycle until ML is split;
  - Kudla's global splitting theorem, an unread input that the unitary Jacobi and Fourier–Jacobi nodes inherit from MP.3/unitary-splitting.
- **Inherited gaps:** the parts' 168 + 9 gaps and 31 + 15 requests stand.
- **Not done:** the bare citations of other roadmaps' stages in the parts (SR 41, AS 23, AF 20, AL 17, AA 14) were not mapped to node ids. That is the next refinement, in the style of R5.

## Files

- **Packet** `research/blueprint/packets/MetaplecticAutomorphicForms.json`:
  - `check_blueprint.py` with the pinned declaration index reports 0 errors and 0 warnings;
  - the 8 Mathlib declarations it cites were read at 082e2d3 in the shared build.
- **Document** `research/blueprint/readmes/MetaplecticAutomorphicForms.md` (≈ 890 KB) replaces the 7 October assembly reader, which predated the accepted revisions and still quoted source passages.
  - Hand-written front matter: purpose and scope, boundaries (including the upstream Theta Series and IntegralLattices borders), conventions, and the dependency order.
  - One section per layer: layer statement, status and remaining work, planets, dependencies, consumers and layer acceptance tests, then every target generated from the three packets. Each target shows its statement, hypotheses, proof outline, sources (locator and what the place states), uses, API, Checks, acceptance, prerequisites and its routed edits.
  - Then the restructure records, requests, gaps, the maintainer source map, the red-team findings, all source issues, the upstream notes and the references.
  - It contains no source excerpts and no local paths; `intake.py check-files` reports 0 problems.
  - The two part readers (`--MP.0.md`, `--MP.8.md`) still quote source passages. They are not deliverables of this job, so they are left for the maintainer.
- **Lean** `research/blueprint/suggested/MetaplecticAutomorphicForms.lean` (339 lines) replaces the 2,946-line assembled file and follows the 2026-10-12 shape:
  - real-bodied light definitions: the bilinear factor set, Mp(2,ℤ) and its product and slash, the principal cocycle, the Weil-representation operators on ℂ[D], the theta functions ϑ_{F,x} and the Heisenberg slash, the unitary theta seed and multiplier, and the genus-two theta series;
  - milestones: the Heisenberg centre, S̃² = (S̃T̃)³ and S̃⁸ = 1, Milgram's formula for D_m, S̃² on ℂ[D_m], elliptic invariance of ϑ_{F,x}, the theta product formula and nonvanishing, unitarity of the theta multiplier on Γ₀(4), and the corrected genus-two Gaussian pairing;
  - discriminating examples, and a closing list of every packet name not typed here, grouped by missing carrier.
  - Checks: `lean-check` at Mathlib 082e2d3 / Tau Ceti f790474 exits 0, with 26 warnings, all `declaration uses 'sorry'`. `check_sorry_data.py` passes. Every API and test name of the five new nodes appears in the file.

## Sources read for this pass (17 October 2026)

| Source | Read | SHA-256 |
| --- | --- | --- |
| Gan–Gross–Prasad, arXiv:0909.2999v1 | §12 (pp. 46–52), §22 (pp. 84–85), §23 (pp. 86–89) | `97c28b21ece4…` |
| Skoruppa, arXiv:0707.0718v1 | §§2–4 (pp. 4–16) | `a4cc378e16a7…` |
| Kong–Teo, arXiv:2302.03280v1 | §3, Theorem 3.1 and Corollary 3.2 (pp. 4–6) | `36407e362a6b…` |
| Bump–Friedberg–Hoffstein, Invent. Math. 102 (1990), published scan | printed pp. 550–554 and 580–581, rendered | `d50ad2f11c99…` |

- **BFH page offset.** In this scan the PDF page is the printed page minus 541; the earlier assembled reader said 542.
- **Upstream checkout.** The read-only TauCetiRoadmap checkout on the worker machine is still a feature branch, so I read main (350e970) and the open pull requests #286 and #248 through the GitHub API.
- **Restricted books.** None was used.
