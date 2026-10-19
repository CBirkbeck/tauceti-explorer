# DESIGN-ArithmeticLocallySymmetricSpacesPartII

Agent: Codex. Session: codex-y4I9ML. Issue: #3375. Date: 2026-10-19.

## Result

Complete target-level design of the first independent continuation allowed by the issue: Fu’s weight-aspect multiplicity bounds. The other three routes are covered by the concrete split proposal below, not asserted planned. The deliverables are the roadmap definition, packet, full reader and compact suggested file named ArithmeticLocallySymmetricSpacesPartII, plus this note. No application data, supplier packet, upstream tree, queue or reserved identifier was edited.

The packet has 30 nodes: 3 definitions, 3 constructions and 24 theorems; 29 API items, 22 discriminating unit tests, 25 planets and 7 checked baseline declarations. Every definition/construction has at least three tests and recorded consumers. All 25 PAPER-FU-24 items assigned to this route have an explicit routeCoverage mapping. WM.0–WM.5 are each planned; zero stages are closed. Packet status is complete, meaning the design pass is finished. All implementation statuses remain unchecked. Two analytic supplier gaps and seven adopted-stage requests prevent dependency closure.

The reader contains the full hypotheses, target statements, proof routes, prerequisites, API, tests, source locators and support/weight conventions. The 115-line suggested file has three real-bodied light scalar definitions, five milestones and ten examples over carriers present at the pins. It deliberately contains no substitute arithmetic quotient, completed module or enveloping algebra. The heavy targets and their tests remain in the reader as the current WORKERS shape requires.

## Mathematical decisions

- Use the bounded-denominator algebra A=ℚ_p⊗ℤ_p[[G]], odd p and m first-congruence SL₂ factors. Homology means the supplier’s rational completed Iwasawa homology. Ordinary discrete group-ring Tor is a near miss, not a baseline substitute.
- Use nonnegative proper-face polynomials in k+1. This makes the minimum-weight inequality explicit, retains the all-weight quantifier, and covers infinite strips with a small coordinate. Finite exceptional weights do not repair those strips.
- Prove rank-upper and rank-lower before the absolute rank estimate. The degree-one exact dimension identity then cancels the two rank terms. There is no circular use of higher-homology bounds in rank-lower.
- Keep place weights and embedding weights distinct. A complex κ contributes two local weights κ/2−1, not κ−2. At signature (1,1) and weights (4,6), the coefficient dimension is 27 and the archimedean size is 144.
- Use the supplied completed ordinary homology torsion theorem and finite homological descent, without degeneration or a middle-degree conjecture. Compare the same algebraic local system through a finite number field and flat scalar extension.
- H_c means compact support; H_! is the image in ordinary cohomology. The specialized cuspidal dimension identity and Bianchi interior comparison are owned targets, with their nontrivial/trivial coefficient cases distinguished.
- The Bianchi boundary calculation uses the actual two commuting unipotent logarithms. Its dimensions are 1,2,1 per neat cusp, independent of n. Non-neat stabilizers require invariants. The trivial-coefficient top compact-support term is retained.
- The general compact-open upper bound uses a split auxiliary prime and a fixed neat refinement. The lower bound uses the FGT base-change subspace at SL₂(O_F), then injective finite-index restriction. It is stated only for neat congruence subgroups contained in that maximal arithmetic group. No lower bound at arbitrary adelic level, asymptotic equivalent or totally real saving is claimed.
- The fixed-type equivariant classical dimension calculation is an explicit target before the base-change summation; ordinary modular-form dimensions alone do not supply it.

## Exact work needed for closure

G1: adopt/design NoncommutativeAnalyticDistributions. Supply the flat microlocal map from bounded-denominator A to the rational completed enveloping algebra, the natural algebraic-annihilator quotient comparisons and the integral central-faithfulness contract consumed by WM.1/cyclic-torsion-bound. Match the deformation index and Casimir normalization. AW14 §§4.6 and 5.4 provide the proposed route; §5.4 admits deformation index zero. When integral central parameters require a finite coefficient extension to realize a highest weight, prove the extension/descent steps. Fu’s induced-character argument alone does not cover all integral central parameters, and its large-radius separatedness argument is not treated as proved here.

G2: adopt/design PadicEnvelopingAlgebras. Supply the completed PBW rectangle/image-lattice comparison and the uniform generic-element estimate for all nonnegative k, including low-coordinate strips. Its exact bound and Casimir eigenvalue are recorded in the packet gap. Use the integral image lattice in End(W_k), not the full integral endomorphism lattice. Ordinary PBW and sl₂ theory remain upstream LieHighestWeight.

Seven requests are present in the packet and reader:

1. NoncommutativeAndEquivariantIwasawa:NE.0 — two-sided Ore/skew-rank calculus, the specified uniform group, canonical topology and continuous Hom.
2. The same stage — AW13 canonical dimension zero iff finite coefficient-field dimension, with its precise standing hypotheses.
3. Upstream LieHighestWeight layer zero — existing symmetric-power irreducibility, self-duality and raising-operator kernel/cokernel specialization.
4. Upstream Chebotarev layer ten — identity Frobenius outside a finite prime set.
5. Upstream ModularForms 10C — finite-level modular-form/cohomology infrastructure with its finite quotient action; this continuation owns the equivariant refinement.
6. GL2AutomorphicRepresentationsAndTransfer:R17.4 — exact quadratic base-change cuspidality/descent fibres and the SL₂ finite-level packet count, including CM corrections.
7. GL2AutomorphicRepresentationsAndTransfer:R16.2 — the ramified types, dimensions, newvectors, unipotent invariants and elliptic traces, including the dyadic cases.

A follow-up should first allocate the two unadopted suppliers, replace G1/G2 by verified exact node imports, and discharge/refine the seven requests. No generic quotient, boundary, duality, completed homology, ordinary PBW or symmetric-power development should move into this continuation. Packaging follows independent review and the programme’s supplier order. There is no further target discovery needed to finish this design pass.

## Independent continuation split

The issue explicitly permits planning the first direction and proposing a restructure for independent directions. The packet records a split of the other routes into three design jobs:

- SmithTheoryAndModPFunctoriality, titled Part III: Smith theory and mod p functoriality. Route all 37 items from PAPER-TREUMANN-VENKATESH-16; endpoints are Theorems 4.4, 5.8 and 6.5. It owns Smith/Tate/fixed-point comparisons and imports the parent quotient and coefficient infrastructure.
- DerivedHeckeReciprocity, titled Part IV: derived Hecke operators and reciprocity. Redirect the 45 PAPER-VENKATESH-19 items currently routed to this Part II id. Preserve the strict global derived Hecke convention and the full hypotheses of generation Theorem 7.6, exterior Selmer action Theorem 8.5 and rank-one Proposition 8.6. Conjecture 8.8 remains conjectural; no unconditional motivic rationality is claimed.
- ArithmeticQuotientDefinability, titled Part V: tame arithmetic quotients. Route the 22 items from PAPER-BAKKER-KLINGLER-TSIMERMAN-20. Import ALS.0/ALS.2, AA.3, LD.0/LD.6 and upstream LieGroups layer nine. Retain fixed-K Siegel charts, the condition M⊂K, and Cartan-compatible maps preserving the specified compact subgroups. Preserve the extraction’s unresolved proof gates. Do not reconstruct the parent’s Borel–Serre functoriality or assert general K independence.

The shared arithmetic quotient remains in the parent. These proposals create no issue, queue entry or reserved id in this change.

## Sources and baseline inspection

All repository statements are mathematical paraphrases with locators. No source passages or section-by-section summaries are included. The maintainer’s library index was inspected; no restricted book was needed or copied.

Read Fu arXiv:2201.11190v2 in full, §§1–7 and references, pp. 1–25. The published Annals/NSF PDF fetch timed out, so no independent published-version collation is claimed. Read the relevant author-PDF parts of AW14, including §§4.6 and 5.4; the page-16 image was checked to resolve the index-zero hypothesis. Read AW13 §§10.12–10.13, Marshall §§1–2.1, and FGT §1 and §§4.2–4.4 through Corollary 4.20. URLs, versions, hashes and precise reading scopes are recorded in the packet/reader. General transfer papers behind the imported GL₂ requests were not read in full and are not claimed as such.

Nine source-issue records carry their prior PAPER-FU-24 provenance: support notation, induced versus integral parameters, larger-radius separatedness, place indexing and growth convention, unrestricted central quotients, low-coordinate strips, arbitrary-level refinement, weighted completion tails and ramified denominator sets. These are inherited corrections checked against the stated v2 passages, not newly discovered published errata. Packet E numbers are local; each provenance field gives its original extraction identifier.

Read actual baseline statements at Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Inspected the reviewed ALS/CC coverage audit and exact supplier node statements. Read current upstream ProfiniteArithmetic and LieHighestWeight documents in full and their relevant suggested declarations; checked ProfiniteProPGroups ownership, the newer roadmap inventory and current Tau Ceti sources to exclude duplication. Current upstream revisions were roadmap 0d144d044dacebca17b654695b6f1ad58f159b27 and library a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Newer APIs are not attributed to the atlas pins.

## Verification

- Blueprint checker: 0 errors, 0 warnings for this packet; all six stages planned, zero closed, two gaps and seven requests.
- lean-check on the suggested file at the pinned shared build: exit 0, with 15 declaration-uses-placeholder warnings and no other warnings or errors. Available memory was 85 GB before the successful run. No library build, dependency update, cache download or language server was used.
- Suggested file shape: 115 lines, three real-bodied scalar definitions, no data placeholders, five theorem forms and ten examples. Compilation verifies elaboration of these forms; it proves none of the roadmap’s mathematics.
- Intake file validation, whitespace checks and the final deliverable-only diff are checked before submission.

This is a completed design submission, not a time-limit checkpoint. The source scratch files are disposable; all statements, locators, unresolved contracts and next actions needed for review are in the deliverables.
