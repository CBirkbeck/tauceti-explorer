# DESIGN-CMRankZeroConverse — handoff

Issue [#1885](https://github.com/CBirkbeck/tauceti-explorer/issues/1885), worker Codex, session `codex-7y17D8`, 2026-10-18. Branch `codex-7y17D8-cm-rank-zero`. The bot confirmed the claim in [comment 6244319788](https://github.com/CBirkbeck/tauceti-explorer/issues/1885#issuecomment-6244319788). This run submits one complete design job and claims no second job.

## Result and status

The five deliverables are the new roadmap definition, complete target-level packet, full reader document, compact suggested Lean file and this note. All seven stages C.0–C.6 are **planned**, none is closed. Every implementation status is `unchecked`. The job is a finished planning pass, with explicit supplier obligations; it is not a checkpoint or a claim of formal implementation.

The packet has 30 nodes: 5 definitions, 1 construction, 1 lemma, 20 theorems and 3 comparisons. Its 6 definition/construction nodes have 29 use-derived API items and 21 discriminating tests. There are 17 planets, no more than 6 in any layer, 6 source-checked baseline declarations, 10 supplier requests and 2 explicit gaps. The reader contains every target, hypothesis, dependency, proof route, API/test and source locator.

The main proof makes the following points explicit:

- Rational Poitou–Tate is applied first to the Tate dual and then to the original representation. The global Euler identity and modular local dimensions are necessary between these applications.
- Derived specialization retains both degree-one and degree-two Tor terms until rational amplitude, finite-level H² vanishing and Nakayama remove them.
- The central evaluation is σ_c↦c^(−k/2), and the surviving zeta sign is (−1)^(k/2−1). A wrong-parity nonzero vector specializes to zero.
- H_g=H_f at the central twist requires the crystalline eigenvalue check, including bad p, before applying the dual exponential.
- The elliptic comparison uses completed coefficients, Kummer Tate modules, CM idempotents, the dual realization and the weight-two Tate twist. The supplier’s existing E/ℚ induction theorem does not suffice for arbitrary E/K.
- Rational Selmer-corank doubling and analytic-order doubling are separate statements. Dyadic integral kernels/cokernels are retained until rationalization, and the CM self-twist is an isogeny.
- Congruent-number half-density is exact after a root-number upper bound. A separate calculation transfers it to both-sign fundamental discriminants ordered by absolute value. CM twist nonvanishing and the non-descent consequence assert a lower proportion at least 1/2.
- The cube-sum model is Y²=X³−27n², with discriminant −314928n⁴. The displayed invertible projective linear maps have both composites 18n times the identity. The statistical variable is a quadratic-twist squareclass over K, with n fixed.

## What remains before closure

The packet's `requests` give the precise interfaces and their consumer node ids. They have not been sent as comments to other workers.

1. **ModularForms Layer 7:** actual arithmetic analytic continuation, conjugation, finite analytic order, omitted Euler factors, and theta L-function agreement.
2. **EllipticCurves Layer 7:** generic isogeny invariance of p∞ Selmer corank for every prime and of all actual Euler factors without a rank restriction. This stays imported; no generic isogeny theorem is planned here.
3. **EllipticCurves Layer 5:** exceptional-j twist classification and the pointed projective cubic/model comparison.
4. **ArithmeticGaloisDuality R02.4:** Kato-compatible rational Poitou–Tate, rational Euler characteristic and amplitude, retaining real-place errors integrally at 2. The finite-module Euler-characteristic node alone is insufficient.
5. **KatoEulerSystems L4:** Proposition 14.12 local dimensions at every prime, including the non-exceptional central character, and independent early CM Iwasawa rank/torsion structure.
6. **SelmerIwasawaCohomology L3:** Kato-complex instantiation of derived control, full finite-character components including p=2, character evaluation and the DVR/residue statement.
7. **SelmerIwasawaCohomology L4:** bad-prime finite local conditions, faithful coefficient extension and finite-condition Shapiro compatibility.
8. **ComplexMultiplicationAndExplicitReciprocity CM.4:** extend theta induction from E/ℚ to arbitrary E/K with CM by an order of K, including every conductor factor. Existing character/decomposition/factorization nodes are reused.
9. **ComplexMultiplicationAndExplicitReciprocity CM.1:** verify the cube model’s ℤ[ζ₃] action, maximality and ramification of 3 using the existing CM/endomorphism interfaces.
10. **ArithmeticStatistics ST.0:** expose the existing fundamental-discriminant family and export a positive linear asymptotic for the support-norm squareclass height over imaginary quadratic K. Its proof must count squarefree support ideals in the square ideal-class subgroup, with the existing finite Selmer fibers.

**GAP-CM:** `CMAllPrimeMainConjectures` has no registered roadmap definition, stage or reserved node in the checked snapshot. Once it exists, replace the gap by its exact all-prime rational Kato-equality endpoint (BT Theorem 2.6). This includes the conductor factors and the exceptional cyclotomic-field cases K=ℚ(i), p=2 and K=ℚ(ζ₃), p=3. Kato Proposition 15.17 alone is an inequality. This design does not duplicate its supplier’s proof.

**GAP-SMITH:** `ArithmeticStatisticsPartIISmithMethod` also lacks a registered endpoint. Cite its unconditional relative-density-one 2∞ corank-zero theorem for positive squarefree n≡1,2,3 mod 8 once published. The current ST.5 helper is conditional on the Smith law and cannot alone discharge this input. The deep distribution theorem and its parity/subfamily transfer remain with that owner.

Registration is needed to replace these two gaps by actual dependency edges. The absent owner names are listed prospectively in the roadmap prerequisites; no invented stage or node identifier is used. All existing stage and node references resolve.

## Ownership and downstream notes

This is the first registered design of the shared rank-r p-converse proposition; `RankOneConverse` issue #951 should import `CMRankZeroConverse:C.0/p-converse-property`. Its rank-one theorem stays with that roadmap. The new definition asserts no unrestricted rank-r converse.

ArithmeticStatistics ST.5's generic isogeny-corank request should use EllipticCurves Layer 7, which this issue specifies as the owner. This packet only applies that input. No other packet, reserved-id file or upstream roadmap was edited.

## Sources and library audit

The packet and reader record URLs, SHA-256 hashes, versions and access date. All results and corrections are written in our own words; no source passages are included.

- Burungale–Tian, public arXiv:2506.03465v2 (11 October 2025), **all seven pages read**. Every BT page locator refers to that author version, not to the thirteen-page published version.
- Kato, Astérisque 295 (2004), public Numdam scan: Theorems 12.4–12.5, printed pp. 221–222; §§14.8–14.13, pp. 238–242; §15.6 and §§15.13–15.17, pp. 253–255 and 264–265. The local dimensions, Tate-dual sequence, Euler formula and central specialization were read directly.
- Bhargava–Klagsbrun–Lemke Oliver–Shnidman, public 25-page author version: §2, pp. 2–5; §9.2, p. 14; §11, pp. 18–19. The corank-strength statistical route, support height and maximal-order reduction were checked. Their full distribution proof is an import from ST.5.

Six existing extraction corrections are carried as `sourceIssues`; the legacy `printed` fields are paraphrases. There is no claim of a newly verified published erratum. The full Smith distribution proof and the equivariant all-prime CM proof were not independently reconstructed; the exact missing supplier endpoints are recorded above. No inaccessible book is needed for the owned argument. The maintainer-cleared reference index was read, and no restricted file or passage was copied.

Read `data/library-coverage.json` for the parent and all relevant supplier stages before planning. Read pinned declarations for the actual `HeckeRing.GL2.Newform` and existing Weierstrass model, discriminant, ellipticity, j and coefficient map. The pinned Newform file's hash matches the public raw file at the pin.

Also checked the newer read-only upstream roadmap/library environment: the nine post-snapshot roadmap directions were screened, with relevant LocalGaloisGroups and ProfiniteArithmetic suggested files inspected. Current Tau Ceti commit was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Existing completed group algebra Basic/Map/PowerSeries/DyadicCoordinate is infrastructure imported through SI. No build command was run in that environment. Nearby ModularForms and EllipticCurves reader documents were read for conventions and density.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/CMRankZeroConverse.json`: **0 errors, 0 warnings**, with the available pinned declaration index.
- The 46 stage edges projected from this node DAG introduce **no new cycle** into the atlas stage graph.
- Reader/packet catalogue consistency: every node, API/test name, source locator and supplier request is rendered from the packet and checked against the final files.
- Exact polynomial arithmetic over ℤ[x,y,z,n] verifies both cube-model equation substitutions, with factors 108n² and 54n, and both composite maps, with scalar 18n.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/CMRankZeroConverse.lean`: passes.
- `lean-check research/blueprint/suggested/CMRankZeroConverse.lean`: **passes at the pins**, only 17 permitted proof-placeholder warnings. Memory was above 20 GB before checking. No Lean language server or project build was started.

The suggested file is 119 lines: 2 real-bodied light definitions, 10 API theorem signatures and 7 examples on actual pinned carriers. The other 19 API items, their definition/construction carriers and the main converse/density theorems remain fully specified README targets because the necessary supplier carriers are not present at the pins. The projective cubic isomorphism is likewise a reader target. This follows the current compact-file shape in WORKERS.md; no mock cohomology or predicate carrier is introduced.

Independent review should start with the six mathematical proof comparisons listed above, then discharge/route the ten interfaces and register the two missing endpoints. No continuation of this design pass is required. Scratch source files and worklists can be deleted after the PR is opened: all durable locators, obligations and checks are in the deliverables.
