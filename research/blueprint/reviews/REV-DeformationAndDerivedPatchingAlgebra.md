# Independent review: deformation and derived patching algebra

Accepted as a complete target-level planning pass under PROTOCOL §0. All nine stages remain `planned`, with six explicit proof/source refinements and seventeen supplier requests; none is marked closed or implemented. The recorded refinements do not contradict the conditional target statements. This is an acceptance of the plan, not certification of every primary proof or of the future supplier implementations.

Reviewer: Codex, session `codex-PwybZ2`, job REV-DeformationAndDerivedPatchingAlgebra (#9373), 13 October 2026. Input: BP-DeformationAndDerivedPatchingAlgebra (#9405), PR #9453, written by session `codex-Hq4gV1`. The reviewer did not write that input.

The [packet](../packets/DeformationAndDerivedPatchingAlgebra.json) records an individual verdict for every target: 96 verified, 33 corrected, zero added and zero unverifiable. Its 129 nodes comprise 28 definitions, 12 constructions and 89 theorem targets, with 212 API items, 134 unit tests and 35 planets. All 40 definitions/constructions have at least three tests. The accepted reserved Hilbert–Samuel definition is imported from the P7 packet, with its ten API contracts and fourteen tests retained as an existing contract rather than counted as new work. The 181 routed identities from 22 papers were checked against their target/import/arithmetic-consumer assignments. Every implementation status remains unchecked.

**Mathematical corrections.**

- Completing quotients now states PQ26 Lemma 5.15, p. 34: maximal-adic completion, a Noetherian completed ring, and a finitely generated quotient ideal. It does not extend this result to arbitrary adic completion or arbitrary ideals.
- Completed tensor domains now require both factors to have regular generic fibres and O-valued points for KWII Proposition 2.2(ii), pp. 9–10. Thorne’s distinct geometric-integrality result, Lemma 1.4(1),(2),(4), pp. 5–6, supplies the dimension and component-pair alternative. Component pairs may split without the geometric hypothesis.
- The regular-base criterion explicitly requires a nonzero module finite over both compatible local rings, `0≤l≤d`, a free resolution of length at most l and the stated dimension bound. It concludes the full chain of depth/support-dimension equalities. A domain gives nearly faithful support; regularity gives freeness. Equal dimension alone does not give full support on a reducible ring.
- Characteristic-zero patching now has actual S_N-algebras and actions restricting to scalar multiplication, a fixed free rank and specified augmentation diagrams. Commutation with coefficients alone is insufficient. Whole-maximal-ideal open quotients, rather than π and group augmentation alone, supply finite sets for stabilization. P8’s coefficient quotients are explicitly module-finite over Λ, not finite sets before truncation.
- Cartier specialization uses generic lengths. These become generic ranks only when the ambient ring is generically reduced. The added check A=O[ε]/ε², M=A distinguishes generic length two from free rank one. Nearly faithful completion comparisons are explicitly Noetherian local maximal-adic comparisons.
- General finite-flat local O-order canonical modules follow from R03.3 finite transitivity and Gorenstein criteria. The actual PadicMeasuresIwasawaAlgebras L6 group-ring pairing is imported; its contragredient construction does not supply arbitrary finite-order duality.

The reader was synchronized with all corrected statements, hypotheses, prerequisites, proof sketches, source matches and Checks. Its numerical examples, supplier table, baseline ledger, source record and bibliography were checked separately. No source passage or source-section summary was added. The suggested file was reviewed and retained unchanged: seven light real-bodied definitions, thirteen milestone statements and five examples over carriers available at the pins.

**Target edit ledger.** The following fields changed relative to the reviewed input; unchanged targets have their individual verification notes in the packet. No targets were added or removed.

| Target | Fields corrected |
|---|---|
| `R03.1/complete-local-coefficient-category` | sources |
| `R03.1/artinian-limit-and-quotient-cofinality` | sources |
| `R03.1/continuous-power-series-evaluation` | proofSteps, prerequisites, sources |
| `R03.1/cohen-structure-and-compatible-coefficients` | sources |
| `R03.1/quotient-completion-noetherian-limit` | statement, hypotheses, proofSteps |
| `R03.1/adic-pro-comparison` | sources |
| `R03.1/adic-hom-completion-and-limit` | sources |
| `R03.3/krull-parameter-dimension-bounds` | sources |
| `R03.3/depth-auslander-buchsbaum-and-dimension-bounds` | sources |
| `R03.3/regularity-localization-and-descent` | sources |
| `R03.3/associated-prime-localization-detection` | sources |
| `R03.3/normal-height-one-intersection` | sources |
| `R03.3/dualizing-existence-and-finite-transitivity` | sources |
| `R03.3/local-duality-completed-ext` | sources |
| `R03.3/canonical-type-and-base-change` | statement, prerequisites |
| `R03.3/excellence-normalization-and-formal-fibres` | sources |
| `R03.3/f-finite-rings` | sources |
| `R03.3/kunz-and-henselian-f-finite` | sources |
| `R03.4/completed-tensor-domains-and-components` | statement, hypotheses, proofSteps, sources |
| `R03.5/kisin-patching-criterion` | statement, hypotheses, sources |
| `R03.5/characteristic-zero-open-quotient-patching` | statement, acceptance |
| `R03.5/uniform-cotangent-annihilator` | sources |
| `R03.6/nearly-faithful-modules` | api |
| `R03.6/connectedness-dimension` | sources |
| `R03.6/completion-generic-special-components` | sources |
| `R03.6/cycle-specialization-multiplicity` | statement, hypotheses, proofSteps, acceptance, sources |
| `P7/perfect-complexes-tor-amplitude-and-minimal-models` | sources |
| `P7/minimal-perfect-complexes` | prerequisites |
| `P7/pseudo-coherent-filtered-hom` | sources |
| `P7/finite-perfect-limit` | proofSteps, prerequisites |
| `P8/finite-patching-systems` | statement |
| `R03.4/characteristic-zero-points-from-finiteness-and-dimension` | sources |
| `P7/finite-perfect-derived-completion` | sources |

**Sources and findings.**

The exact node locators were read in the recorded public or maintainer-cleared editions. Cleared documents were read in place. The bibliography and source-version ledger identify 41 inspected sources; this review adds Stacks More on Algebra, Stacks Duality for Schemes and the BKM version actually cited by IKM. The refreshed EG14 hash identifies the bytes inspected in this review, without claiming a different mathematical version.

Twenty of the twenty-one source findings are confirmed, with precise scope qualifications. Finding E-W9405-13 is rejected: BP26 Proposition 2.3.13, pp. 16–17, uses invertible twists of one fixed exceptional pullback of a coherent sheaf. Stacks Duality Lemma 3.5 and Lemmas 17.5–17.6, tags 0A9I and 0AU1, pp. 6 and 47–48, supply the common lower bound. The general unbounded-target counterexample does not apply to that proof. The bounded pseudo-coherent Hom adapter remains useful and now has its own More on Algebra source.

Finding E-W9405-20 is confirmed only as a uniform coefficient-map proof obligation. IKM24 p. 47 explicitly invokes BKM Lemmas 3.6–3.7, arXiv:2108.09729v2 pp. 11–12, to adjust a lift through one finite action image. Those proofs were read. The finding now acknowledges this argument and isolates the remaining comparison with the original map through Q for every object and morphism of PaSy. No counterexample to the theorem or to the single-object lifting argument is asserted. The current targets use the common lift and finite action images without silently assuming whole-ring finiteness.

The Hochster12 finding now points to the hypersurface calculation on p. 35 and corrects the missing factor d in the leading coefficient of P(n)−P(n−μ). This review adds a harmless Stone notation finding: Example 10, printed p. 15, uses formal-series notation where the associated graded ring is k[X,Y], with cusp quotient k[X,Y]/(X²). The targets already use graded direct sums.

Citation repairs include Stacks Formal Deformation Theory Definition 4.1 on p. 9 and Lemmas 4.7–4.8 on p. 12; Stacks Algebra Propositions 110.1 and 110.5 on pp. 265–266, Lemmas 110.6 and 110.9 on p. 267; Stacks Dualizing Theorem 18.3 and Proposition 15.11; BCGP25 Lemma 7.2.2; EG14 Proposition 2.2.10 and Lemmas 2.2.13–2.2.14; BM23 §4.4, Corollary 4.20 on pp. 20–21; Bhatt18 Lemma 5.3 on pp. 9–10; IKM24 Lemma 3.1 on p. 17; EGA IV.2 7.4.4 on pp. 199–202; and the KWII valued-point argument in the proof of Proposition 2.2(i), p. 9, rather than nonexistent Lemma 2.5. Unsupported CS24/NT26 annotations were removed. PQ26 is Forum Math. Pi, DOI 10.1017/fmp.2026.10030. Exact versions and unread publisher revisions remain distinguished in the packet.

**Baseline and ownership.**

All seventeen original baseline citations were independently read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, including their instances and hypotheses. None was removed. Five reusable Mathlib references were added and resolved in Lean:

| Existing declaration | Use here |
|---|---|
| `MvPowerSeries.eval₂Hom` | Continuous formal evaluation after proving the adic HasEval hypotheses |
| `MvPowerSeries.eval₂_unique` | Uniqueness; the local cotangent/surjectivity adapter remains new |
| `CochainComplex.isKProjective_of_projective` | Bounded projective models are K-projective |
| `CochainComplex.IsKProjective.quasiIso_iff` | Homotopy-equivalence comparison in minimal-model arguments |
| `CochainComplex.IsKProjective.Qh_map_bijective` | Derived/homotopy Hom comparison for finite perfect inverse systems |

The existing local-cohomology Ext-colimit carrier is not represented as a Čech/local-duality theorem; the existing injective-envelope predicate is not represented as an existence theorem. Ordinary finite-type tensor dimension does not supply completed-tensor dimension.

The reviewed library audit was checked against these adapters. Current upstream roadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were separately checked for duplication. Lean targets in all nine newer roadmaps and the four Completed roadmaps were searched. AlgebraicVectorBundles L0C determinant signatures, GrothendieckEulerForms Layer 5 and ModularCurves 4D interfaces were read directly and imported. Group dualizing modules are distinct from ring dualizing complexes. The upstream checkout and library were not built or edited. Presence at the pinned baseline is never inferred from newer upstream work.

The reserved geometric coherent-duality definition remains SchemeAndStackFoundations:key/coherent-duality, in SF.2; ring duality is R03.3. Full cotangent complexes, Koszul carriers, enhanced derived operations and derived completion are imported from their owners. In particular, DD.1’s derived-completion, Koszul-completion-tower and ordinary-quotient-completion nodes supply the existing completion interfaces.

**Orchestrator follow-ups.**

The existing six proof/source refinements remain, with the IKM refinement narrowed as above: complete obstruction-space relation bound; mixed-characteristic formally unmixed multiplicity-one proof; Martsinkovsky stable-Ext injectivity; Brodmann–Rung connectedness proof plus capped-convention comparison; pointed cotangent inverse-limit comparison; and uniform whole-ring finite coefficient-map comparison.

Three requests must become explicit additional supplier work before closure: SF.3 parafactoriality/punctured-spectrum Picard theory, absent from its current 26-node packet; SF.4 geometric lci/syntomic definitions, absent from its current 56-node packet; and PadicMeasuresIwasawaAlgebras L0 arbitrary complete-flat-module topological bases. Their contracts now say they are required additions, not existing results. No other job’s packet was edited. Higher CoherentCohomologyAndDualityII consumers must continue to import the elementary coefficient dual moved down to P7.

**Validation.** The packet checker passes with zero errors and zero warnings, using the declaration index. All 129 review entries and all 21 finding verdicts have the required reviewer identity. Reader/packet field comparison passes. `lean-check` exits zero on the 184-line suggested file, with fourteen proof-placeholder warnings and no other warning; an additional run with temporary import/name checks resolves the five added references and was restored to the same final file. `check_sorry_data.py` and `git diff --check` pass. The submission file check passes for the packet, reader, review and handoff. No implementation tests or source copies were added to the repository.
