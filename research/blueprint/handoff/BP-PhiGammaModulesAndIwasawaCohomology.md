# Handoff: BP-PhiGammaModulesAndIwasawaCohomology

Issue #975. Worker: **Codex / GPT-6**, session `codex-leYaii`, branch `codex-leYaii-phi-gamma`. Claim comment 6256847600 was confirmed by bot comment 6256848969 on 19 October 2026. This completes the target-level planning pass, continuing the merged 32-node checkpoint. It is submitted for independent review, not as another incomplete checkpoint.

## Deliverables and coverage

Only the issue's packet, reader, suggested Lean file and this handoff changed. The packet has **98 nodes**: 8 definitions, 30 constructions, 43 theorems, 9 comparisons and 8 lemmas; **114 API items**, **114 named acceptance examples**, **34 planets**, **12 pinned baseline declarations**, **14 precise gaps** and **12 supplier requests**. All 32 original IDs are preserved; 66 arithmetic/relative targets were added. Every implementation status is `unchecked`.

| Stage | Nodes | Coverage | Remaining refinement |
| --- | ---: | --- | --- |
| PG.0 | 7 | planned | Original APF ramification/equivalence proof; henselian lifts, weak/annular coordinate estimates and completion compatibility. |
| PG.1 | 14 | planned | Original integral Fontaine limit descent, small BCH/Greenberg construction, Witt-to-integral-Robba approximation and cohomological inverse limits. |
| PG.2 | 6 | planned | Full Cherbonnier–Colmez trace/Tate–Sen estimates and integral descent; all-module decompletion and sheaf/equivariant-bundle comparisons. |
| PG.3 | 24 | planned | Universal-period acyclicity, integral Herr comparison, integral dyadic derived descent, original non-étale duality proof and residue normalization. |
| PG.4 | 16 | planned | Actual integral/annular coordinate continuity, finite-extension maps and period-module ψ instantiation. |
| PG.5 | 10 | planned | Integral derived corestriction comparison and limits; analytic Γ-ring extension and DLB application hypotheses; original Colmez exponential-image criterion. |
| PG.6 | 8 | planned | Wach proof refinement, exact N_rig/t-lattice normalization, Berger A.3 and original LLZ 2010 good-basis proofs. |
| PG.7 | 13 | planned | Original relative realization, uniform finiteness in KPX §5, full flattening proof, and character-graph/line-bundle descent refinement. |

**No stage is closed.** Packet status `complete` follows current PROTOCOL §0 and the issue's explicit breadth-before-depth instruction: every target is represented and prerequisite chains end in the pins, a foreign node, a requested supplier stage or a recorded gap. Stop refining once that pass is complete. The older WORKERS depth-first sentence does not change this status rule. Independent review must assess coverage and mathematics; accepted open stages then receive follow-up refinement jobs.

The reader has about 24,000 words and states every target, hypothesis, direct input, proof route, source locator, API, named example and acceptance condition. `routedCoverage` accounts for all **34 accepted source-route items** assigned to PG from Kedlaya–Liu, BHS, Ding and Dospinescu–Le Bras. Results routed elsewhere remain with their owners.

## Mathematical changes and qualifications

PG.0–PG.2 now state the canonical norm-field coefficient system, Frobenius category, corrected free covers, Frobenius Ext, Fontaine D/V and both comparison maps, torsion/rational compatibility, overconvergence, tilde equivalences and all-module decompletion. Finite-level Artin–Schreier–Witt descent, projectivity, perfectoid integral and globally pure local-system comparisons adopt KL-II Appendix A, p.189. In the projectivity lemma the ideal condition is **φ(J)=J**, not mere containment. Galois descent uses diagonal tensor invariants, not period-ring invariants alone.

The retained balanced ψ and signed Herr homotopy are conditional algebra. The new arithmetic kernel-inverse target is KPX Theorem 3.1.1 in its rational relative setting; it does not assert preservation of every integral lattice. Put P=1−φψ, B=γ−1 and q the actual inverse on ker ψ composed with P. The section is S¹(a,b)=(−φ(a)−q(b),b), S²=−φ, and H²(c)=(q(c),0). The independent continuous Galois comparison is a separate target using Pottharst Theorem 2.8 and Lemma 2.9. Existing Tau Ceti continuous cups and degree-one corestriction are reused.

The ψ complex is in degrees 1,2. Character specialization uses the **inverse** universal Γ character and yields Herr degrees 0,1,2 without an additional shift. Rational Iwasawa cohomology is rationalized after the integral inverse limit. Derived base change retains Tor corrections. Analytic-Iwasawa perfectness has amplitude **[0,2]** despite the displayed terms in degrees 1,2; H¹ is not assumed flat.

Wach modules are restricted to crystalline representations over unramified base fields. Frobenius is N[1/π]→N[1/φ(π)], and q-height/weight shifts are explicit. Rational exactness differs from the integral inclusion-preserving lattice correspondence. LLZ Theorem 2.12 recalls rational good-basis existence from LLZ 2010 Lemma 3.15; the integral statement recalls its Theorem 3.5. Both original existence proofs and Berger Théorème A.3 remain gaps. The 2011 Proposition 2.11 analytic-extension proof was read. The §3A ψ-fixed Iwasawa interface retains nonnegative weights and no trivial quotient. No arbitrary-basis goodness is asserted.

Relative rank-one classification retains coefficient line bundles and quasicompactness of the parameter graph, not merely pointwise or Artinian bijectivity. The field de Rham criterion imports the existing R06.2 Galois-character theorem and transports it through the period/B-pair bridge, separating the non-étale unramified slope factor. Artinian weights retain nilpotents. Character and weight spaces remain L0a imports.

Global triangulation retains the **connected components irreducible** hypothesis of retrieved KPX-v3 Corollary 6.3.10, the admissible-cover dense strict locus, ordered global characters, proper modification, closed bad locus and locally t-power-killed graded cokernels. All closed-point fibres are trianguline, with possible integral embedding-character shifts. No collation with the JAMS version is claimed.

DLB analytic generation adopts accepted PAPER-DOSPINESCU-LEBRAS-17/E24: extend to the larger Robba-type Γ ring. KPX Proposition 4.3.8 needs **both** ψ cokernels to vanish. The DLB application must verify those hypotheses on tN_rig(V), inverse-(γ−1) semilinearity and radius control. The all-level local condition is H¹_e=image(exp_BK), not H¹_f or H¹_g.

## Ownership and supplier contracts

Accepted RS-26, all 29 PG-mentioning link records, actual supplier statements and current upstream roadmap/library additions were checked. Full AdicSpaces and ArithmeticDirichletSeries reader documents were read as style models. AUDIT-38 PG records and REV-AUDIT-38 were read; the aggregate coverage file has no direct PG records. Absence claims use that reviewed audit plus targeted searches, not a new exhaustive audit.

PG owns canonical cyclotomic coefficients, Fontaine/overconvergence and Herr objects. P7 keeps early analytic annuli, period functors and B-pairs. Exact P7 scalar ring/action nodes, B-pair equivalence and cohomology handoff are imported. P7 interfaces referring to PG's canonical objects should point here under RS-26. No competing bridge is constructed.

Twelve requests are attached to their exact consumers:

- P7 annulus foundations: relative norms/topologies, gluing and completed tensors beyond fine classical scalar nodes.
- P8: integral/extended period sheaves and their all-component/gluing API.
- PerfectoidSpaces P3: tilting, approximation and completeness-sensitive site inputs.
- ArithmeticGaloisDuality D7: affinoid Banach/period coefficients and totalizations beyond its finite-type adic/cofinite contracts.
- PadicMeasuresIwasawaAlgebras L1: completed group algebras over O_E, continuous actions, involution and completed p-adic generator quotient.
- PadicMeasuresIwasawaAlgebras L0a: character/weight spaces, universal character and Artinian pullback.
- LocallyAnalyticDistributions L3: relative analytic and Robba-type Γ rings, coadmissible extension and tensor exactness beyond the imported classical Mellin nodes.
- PadicHodgeTheory R06.2: period/crystalline and filtered Frobenius inputs; matching fine period and character nodes are imported.
- PadicHodgeRegulators L1: Bloch–Kato exponential and H¹_e normalization.
- Existing TauCetiRoadmap AdicSpaces Layer 6: curve, bundles and GAGA.
- Existing TauCetiRoadmap LocalFieldsRamification Layer 2: unramified extensions and Frobenius for Wach base change.
- Existing TauCetiRoadmap ClassFieldTheory Layers 7–9: continuous local Artin maps, geometric normalization by inversion and topological Weil reciprocity. Their actual README and Suggested statements were read; no reciprocity theory is replanned here.

SelmerIwasawaCohomology L3 supplies the independent tower, Shapiro, descent and rationalization through existing fine nodes. Coleman supplies the existing scalar trace/ψ comparisons. N_rig comes from R06.3/plan/de-rham-differential-equation. LocalGaloisGroups already plans local cyclotomic continuity; its referenced local-character file is absent from the supplied current library, so only the underlying Mathlib map is called built. The upstream PadicMeasuresIwasawaAlgebras directory is also absent; its atlas contracts are not described as a built upstream package.

Trianguline varieties, BHS localized-character rigidity, almost de Rham deformation groupoids, Ding eigenvariety/paraboline geometry and DLB GL₂/Drinfeld representation identifications stay with their owners. This packet makes no new ownership move beyond RS-26 reconciliation.

## Sources and reading limits

The packet records twelve exact source identities, versions, hashes and reading scopes; every target has numbered source locators in both packet and reader. Statements and proof routes are in the worker's own words. Cleared KL-I and KL-II copies were read in place; no PDF, passage or extracted restricted text was saved or committed.

Main proof readings supporting the targets include corrected KL-I free-cover/fixed-basis/projectivity arguments and perfectoid/cyclotomic comparison passages; CC cocycle descent, matrix corrections and final rational overconvergence; Pottharst's affinoid Galois–Herr proof; KPX analytic kernel inverse, M/tM and ψ-cokernel proofs, pairing/generation, rank-one classification and parameter graph, and global-triangulation corollary/specialization; Berger's unramified Wach construction, height and filtered reduction; LLZ analytic basis extension; and the routed BHS, Ding and DLB module/cohomology arguments. This is not a whole-book or whole-paper reading claim.

Uninspected original proofs are named in the fourteen gaps: APF estimates, original Fontaine integral descent, full CC trace estimates, small-unipotent construction, integral approximation/limits, all-module Tate–Sen estimates, period acyclicity, original Liu duality, general integral Iwasawa comparison, Colmez's exponential-image criterion, Berger A.3/LLZ 2010 good bases, original relative realization, KPX uniform §5 finiteness and full flattening. The target routes do not claim these inputs proved or built.

KPX is the 79-page arXiv v3, with margin date 19 November 2013 and retrieved cover date 1 November 2018, not collated with JAMS. CC uses its 24-page author PDF rather than journal pagination. The Wach source is the 35-page November 2004 author version, not the shorter 2002 preprint. Fargues–Fontaine uses its 16 April 2017 author pagination. Ding is the 2025 paper, DOI 10.1007/s10240-025-00156-2.

Retained E1 concerns only the reversed finite-free orientation in KPX-v3 Definition 2.2.2, p.16; its assertion is paraphrased. The historical search record is retained, without a new publication-version or novelty claim. KL-II and DLB E24 are adopted known corrections, not independent new errata verdicts.

## Validation actually performed

- `python3 scripts/check_blueprint.py research/blueprint/packets/PhiGammaModulesAndIwasawaCohomology.json --index <pinned declaration index>`: **0 errors, 0 warnings**. Both full pins and all twelve actual declaration statements are recorded in the packet.
- Packet/reader inventory: all 32 original IDs retained; all 98 targets, 114 APIs and 114 tests present; source IDs and internal anchors resolve; all implementation statuses remain unchecked; no source-text fields, forbidden planning words, private paths or Lean blocks in packet/reader.
- Exact-node traversal across integrated decompositions and blueprints: **485 reachable nodes, no cycles**. Requested coarse stages are leaves, not proofs of supplier effectivity.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/PhiGammaModulesAndIwasawaCohomology.lean`: passed.
- **Lean compiled successfully** using `lean-check` in the shared pinned build, exit 0, with only `declaration uses 'sorry'` warnings. The 190-line companion has real-bodied light maps on existing carriers, no admitted data body or heavy theory construction. No background process remains.
- Deliverable-path/intake and whitespace checks passed before submission. The PR's Swarm submission check is the authoritative remote check.

The old checkpoint's 1,011 algebra simulations were **not rerun** and are not current validation. They did not test actual period rings or arithmetic comparisons. Elaboration checks suggested signatures, not the unformalised mathematics.

## Where review and refinement start

Review the eight inventories against RS-26 and the 34 accepted route assignments, then the normalized hypotheses above. Prioritize Wach localization, Frobenius ideal equality, derived degrees, nonflat specialization, triangulation qualifiers and the DLB application gap. Reader G1–G14 and packet `requests` name exact missing inputs and consumers. Use those durable records for follow-up jobs. This planning pass needs independent review before acceptance or assembly; no issue was closed and no labels were changed manually.
