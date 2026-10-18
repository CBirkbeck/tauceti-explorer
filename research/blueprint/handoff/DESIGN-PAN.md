# DESIGN-PAN — Completed cohomology and p-adic local–global compatibility over Q, Part II: locally analytic vectors

Agent: Claude (Opus 5.5), session `claude-qZ3vK6`. Issue #950. Branch `claude-qZ3vK6-design-pan`.
This is a complete target-level design pass, ready for independent review. It claims no closure and no implementation.

## Deliverables

- `research/blueprint/roadmaps/LocallyAnalyticCompletedCohomology.json`: the roadmap definition, area `langlands`, parent `CompletedCohomologyAndLocalGlobalCompatibility`, thirteen stages LA.0–LA.12. Each stage's `requires` list is generated from its nodes' direct prerequisites.
- `research/blueprint/packets/LocallyAnalyticCompletedCohomology.json`: 94 nodes (17 definitions, 13 constructions, 64 theorems), 176 API items, 123 unit tests, 33 planets, 6 baseline declarations read at the pins, 12 supplier requests, 6 gaps, 1 new source issue and 4 restructuring proposals. `scripts/check_blueprint.py` with the pinned index reports 0 errors and 0 warnings. All thirteen stages are `planned`; none is closed. Every `implementationStatus` is `unchecked`.
- `research/blueprint/readmes/LocallyAnalyticCompletedCohomology.md`: the reader document. It has the introduction, conventions, layer overview, sources and editions, a corrections table, the baseline, supplier contracts and the list of what other roadmaps own. Then comes one section per layer, giving each node's statement, hypotheses, proof route, uses, API, unit tests, acceptance, prerequisites and locator. It ends with the gaps, open questions and restructuring proposals. The reader is generated from the packet together with handwritten framing, so the two agree. Packet-derived text is escaped for the atlas Markdown renderer (`src/markdown.js`).
- `research/blueprint/suggested/LocallyAnalyticCompletedCohomology.lean`: a compact companion in the 2026-10-12 shape. It contains light real-bodied definitions over carriers at the pins: integral weights of the diagonal Cartan with the dot action, the reflection −w·(−χ) and their Harish-Chandra invariants; the infinitesimal characters χ̃_k and the Pan I Proposition 6.1.5 orbit; the generator of n⁰ and the coordinate form of θ_h, with their bracket; u₊, h, z and the trace action on t; the polynomial shadow of d̄_{k+1}; and the q-expansion shadow of θ_{k+1}. It closes with a comment block listing the README-only targets. **Compiled** with `lean-check` at Mathlib 082e2d3 / Tau Ceti f790474: the only warning is one `sorry` (`OperatorDbar.polynomial_sharp`). Every other statement is proved. `scripts/check_sorry_data.py` is clean. Names follow the packet's API and test names where the two correspond (`FlagBundle.nZeroGenerator`, `FlagBundle.nZero_sq`, `ThetaH.coordinate`, `ChiTilde.orbit`, `ChiTilde.k_one`, `OperatorDbar.polynomial`, `ThetaOp.bol`, `ModularCurve.lie_t_centre`, …).

## Brief followed

The issue brief asks for both of Pan's papers: Paper I (Forum Math. Pi 10 (2022) e7) first, as the foundation, and then Paper II (Annals 203 (2026)) with all its main theorems. It is merged with route 1 of the reviewed extraction `PAPER-PAN-26` (216 items), its ownership map for routes 2–13 and its corrections E1–E4. Layers LA.0–LA.5 are Paper I §§2–6, and LA.6–LA.12 are Paper II §§3–7. Paper II §3 refines Paper I and sits in LA.1–LA.3. Paper II §§2 and 6.1 are routed elsewhere and requested from there.

## Design decisions

1. **Imports, not duplicates.** Several accepted packets already plan statements whose source is Pan's work. This plan imports them by node id and does not restate them:
   - CohomologyComparisons CP.6: Pan II Proposition 6.3.9, Proposition 7.2.3 and Lemmas 7.2.4–7.2.6.
   - EndoscopicTransferAndUnitaryTraceComparison ET.6a/analytic-vectors-under-duality: Pan II Corollary 5.3.9 and Theorem 5.3.20.
   - PerfectoidShimuraVarieties S3: Pan II §§3.1.1, 3.2.1 and 4.2.3.
   - PadicDifferentialEquationsAndRigidCohomology RD.4/RD.5: Pan II Definition 5.1.6, Proposition 5.1.7 and the log-rigid comparison.
   - GL2AutomorphicRepresentationsAndTransfer R17.3: Pan II §5.4.10 and §5.5.5.
   - SmoothRepresentationsOfLocalGroups SR.2/l-sheaf-model: Pan II §5.1.9.
   - LocallyAnalyticDistributions L4/pan-tate-compactness: Pan II Example 2.2.2.
   - AlgebraicModularFormsAndSerreWeights R15.1/logarithmic-kodaira-spencer.
   - CompletedCohomologyPartII CC.2/complete-torsion-free-complex-control (Pan I Lemma 4.4.4) and CC.4/completed-coefficient-interchange.

   The CP.6 and ET.6a nodes rest on objects and theorems this roadmap constructs, so the dependency is inverted. Restructuring proposals 1–2 ask for it to be put right.
2. **Undesigned owners.** Three needs have routed owners whose designs have not run. Each is requested at the nearest existing layer and recorded as a gap:
   - Locally analytic vectors and R^iLA (LocallyAnalyticRepresentationsOfLocalGroups, #3411), requested at LocallyAnalyticDistributions L0.
   - Fontaine's almost de Rham theory for Banach and LB modules (PadicHodgeTheory Part II, #3426), requested at PadicHodgeTheory R06.2.
   - Scholze's lattice comparison, requested at PadicHodgeTheory P8.

   The compactly supported de Rham cohomology of the Drinfeld tower is defined here (Pan II Definition 5.6.5, extraction item /433). Its comparison with Colmez–Dospinescu–Nizioł (/437, routed to ProetaleCohomologyOfPAdicCurvesAndTowers) is only explanatory and is not needed by any target.
3. **A route-3 item missing from its owner.** The supersingular uniformization at infinite level (Pan II Theorem 5.4.2, Lemma 5.4.4) is routed to PerfectoidShimuraVarieties S3/S5 (route 3, accepted), but the accepted packet has no node for it. It is requested at S5 and recorded as a gap.
4. **Pan's route, not the shortcut.** The differential operators are built as in Pan II §§4 and 6. Rodriguez Camargo's simpler B⁺_dR/(t²) construction (§1.3.3) is recorded as an open question, since it is not carried out in the source.
5. **Conditional inputs.** p-adic local Langlands enters in three places, and the classicality theorem uses none of them (Pan's point):
   - Pan I §6 (Paškūnas–Tung local–global compatibility and Colmez's Kirillov model), for weight one and Gouvêa.
   - The comparison remarks of Pan II §7.3 (Dospinescu–Le Bras, Liu–Xie–Zhang, Colmez).
   - The special-case claim (Remark 7.3.11).

   The special case is recorded as an explicitly conditional claim (LA.12/special-case-claim) and as a gap.

## Findings for the maintainer

1. **New source issue LocallyAnalyticCompletedCohomology/E1.** Pan I Theorem 5.4.2(1), p. 64, prints "unless k ≠ 2" where "unless k = 2" is meant (compare Theorem 1.0.1(1)). It is a misprint that affects nothing, and arXiv v3 has the same text.
2. **Inverted ownership** at ET.6a/analytic-vectors-under-duality and CP.6/pan-* (restructure proposals 1–2).
3. **Route 1 also feeds DESIGN-CompletedCohomologyAndLocalGlobalCompatibilityPartII (#3459).** That design should import this roadmap and not re-plan Pan's items (restructure proposal 3; the extraction's fix report raised the same point).
4. **Requests to re-point** once LocallyAnalyticRepresentationsOfLocalGroups and the PadicHodgeTheory Part II are designed (restructure proposal 4).
5. **Upstream check.** Current TauCetiRoadmap main and the Tau Ceti library were searched for locally analytic vectors, completed cohomology, perfectoid Shimura varieties and the Harish-Chandra isomorphism. Only RepresentationTheory/LieHighestWeight layer 7 (Harish-Chandra) is relevant; it is cited through a request. SmoothRepresentationsOfLocalGroups is now upstream; its atlas nodes SR.2/l-sheaf-model and smooth-induction are cited as they stand.

## Sources read

- Pan I, Forum of Mathematics, Pi 10 (2022) e7, open-access version of record (sha256 61549f3a…, matching CompletedCohomologyPartII's citation), read 2026-10-18. §§1–4 were read in full. §5 was read for its statements and the arguments of §§5.1–5.4, and §6 for its statements and the proofs of Theorems 6.2.2 and 6.4.7. arXiv:2008.07099v3 (sha256 c2fed4f1…) was compared at Theorem 5.4.2.
- Pan II, arXiv:2209.06366v1 (sha256 0873b61a…, matching the extraction), read 2026-10-18. §1, §§4 and 7 and the statements of §§3, 5 and 6 were read directly; everything else was read through the reviewed extraction. All 271 numbered labels cited in node locators were checked automatically against the PDF text (label found on the cited pages). The one flag is a parsing artefact of a two-range locator, and it is correct.
- Independent mechanical cross-check: two Sonnet agents compared every node's statement and hypotheses with the cited pages (49 Pan I nodes, 45 Pan II nodes). Fifteen findings came back, and I checked each against the source myself, viewing page images where the text extraction was ambiguous. Corrected:
  - the n-invariant/n-coinvariant notation in LA.4 (Pan I Theorems 5.2.15, 5.3.11–5.3.18 print superscript n for invariants);
  - Ω¹^{⊗(k−1)} in LA.11/second-comparison;
  - the smooth (not locally analytic) induction in the vanishing-cycle sequence;
  - the LB-module (not Banach) status of the χ̃_k period module;
  - the full hypotheses of Pan II Lemma 6.3.3;
  - the k = 1 scope of the D_cris identification;
  - the hypotheses of Pan I Theorem 6.3.5;
  - the closed-embedding/strictness claims for period sheaves;
  - 'filtered groups' for the Kodaira–Spencer presentation;
  - several hypothesis wordings;
  - one extra locator (Pan I §4.2, p. 33).

## Item map (PAPER-PAN-26 route 1, 216 items → nodes)

The map was produced automatically from the locators and then completed by hand for the expository items (§1.1.9, §1.2.5, §1.2.8, §§1.2.11–1.3.3, the notation, and the section introductions of §§4.1, 4.4, 5, 5.2 and 5.3). It is approximate where Pan's equation numbers coincide with section numbers.

| Node | Extraction items (PAPER-PAN-26/…) |
| --- | --- |
| LA.0/acyclicity-of-locally-analytic-vectors | 41 |
| LA.1/automorphic-twists | 202, 310, 319 |
| LA.1/fake-hasse-invariants | 203, 209 |
| LA.1/horizontal-cartan-action | 24, 201, 202, 203, 209 |
| LA.1/locally-analytic-sheaf | 24, 25, 202 |
| LA.2/analytic-banach-algebras | 203, 205, 209 |
| LA.2/cech-cohomology-essentially-zero | 211, 212, 213, 214 |
| LA.2/cohomology-of-weight-sheaves | 225, 237, 560 |
| LA.2/locally-algebraic-subsheaves | 208, 210, 371 |
| LA.2/power-series-expansion | 203, 205, 209, 561 |
| LA.2/weight-sheaves | 203, 205, 206, 207, 209 |
| LA.3/analytic-vectors-are-hodge-tate | 222, 233 |
| LA.3/banach-sen-operator | 216, 217, 218, 219, 220, 221 |
| LA.3/cohomology-is-hausdorff-lb | 225, 234, 235, 236, 237, 238, 560 |
| LA.3/decompleted-restriction-is-compact | 223, 224 |
| LA.3/lb-topology-on-cohomology | 225, 226, 227, 228, 229, 230, 231, 232, 237, 560 |
| LA.3/theta-h-is-the-sen-operator | 215, 563 |
| LA.4/overconvergent-modular-forms | 326 |
| LA.6/dbar-is-surjective-with-locally-algebraic-kernel | 317, 318 |
| LA.6/intertwining-operator | 28, 320, 321, 322 |
| LA.6/operator-d | 26, 302, 303, 304, 305 |
| LA.6/operator-d (stage text) | 306 |
| LA.6/operator-dbar | 26, 310, 312, 313, 314, 315, 316, 319 |
| LA.6/smooth-de-rham-bundle | 301, 330, 558 |
| LA.6/smooth-tensor-flag-is-dense | 26, 206 |
| LA.6/theta-operators | 558 |
| LA.7/finiteness-of-analytic-n-invariants | 336, 337, 338, 339, 340 |
| LA.7/kernel-n-invariants-decomposition | 331, 332 |
| LA.7/kernel-of-i-is-kernel-of-hd | 323, 324, 325 |
| LA.7/n-invariants-are-classical | 333, 334, 335, 341 |
| LA.7/n-invariants-of-weight-sheaves | 327, 328, 329 |
| LA.8/cokernel-of-d-on-rational-points | 9, 355, 358 |
| LA.8/kernel-of-d-on-rational-points | 352 |
| LA.8/newton-stratification | 31, 350, 351 |
| LA.9/global-kernel-of-d | 408, 409 |
| LA.9/kernel-of-d-on-omega | 380, 395 |
| LA.9/kernel-on-omega-is-quaternionic | 400, 403, 404, 405, 407 |
| LA.9/lubin-tate-and-drinfeld-power-series | 367, 369, 387, 389, 391 |
| LA.9/lubin-tate-differential-equation | 41, 364, 365, 384, 385 |
| LA.9/lubin-tate-locally-analytic-sheaves | 360, 364, 366, 370, 371, 372, 384, 386, 390, 392 |
| LA.9/supersingular-differential-operators | 373, 374, 375, 393, 394, 433 |
| LA.10/compactly-supported-de-rham-drinfeld | 433, 438 |
| LA.10/de-rham-cohomology-and-eigenspaces | 13, 420, 421, 422, 423 |
| LA.10/de-rham-complex-drk | 30, 418, 419, 430, 431, 440 |
| LA.10/hecke-eigensystems | 424 |
| LA.10/spectral-decomposition | 22, 415, 416, 417 |
| LA.10/three-step-filtration | 410, 411, 412, 413 |
| LA.10/vanishing-cycle-sequence | 421, 431, 432, 434, 435, 436, 439 |
| LA.11/first-comparison | 516, 517, 518, 519 |
| LA.11/infinitesimal-character-chi-k | 21, 472 |
| LA.11/intertwining-operator-is-fontaine-operator | 29, 474, 478 |
| LA.11/log-period-sheaf-presentation | 491, 492, 559 |
| LA.11/p-adic-legendre-relation | 510, 511, 512, 513, 514, 515 |
| LA.11/reduction-to-two-comparisons | 490, 492, 497, 498, 499, 500 |
| LA.11/relative-period-sheaves-on-the-flag-variety | 470, 471, 475, 476, 477 |
| LA.11/second-comparison | 206, 474, 525, 526, 527, 528, 529, 530, 531, 532, 562, 563 |
| LA.11/sheaf-fontaine-operator | 473, 478, 479 |
| LA.12/classicality-theorem | 2, 3, 4, 13, 14, 541, 542, 544 |
| LA.12/multiplicity-space-pi-rho | 5, 544, 550 |
| LA.12/period-cohomology-comparison | 13, 21, 544, 548 |
| LA.12/principal-series-description | 10, 11, 553, 554, 565 |
| LA.12/special-case-claim | 12, 13, 23, 422, 556, 565, 566 |
| LA.12/supercuspidal-description | 7, 8, 550, 551, 552 |
| LA.12/uniform-de-rham-description | 12, 13, 422, 423, 555 |
| imported: ET.6a/analytic-vectors-under-duality (used in LA.9/kernel-of-d-on-omega) | 388 |
| reader: LA.6 introduction | 27 |
| reader: conventions | 45 |
| reader: layer overview | 40 |
| reader: open questions | 42 |


## What a follow-up does

All thirteen stages are planned. The review should check the following:
- the statements against the papers, especially the weight and twist bookkeeping in LA.4, LA.6 and LA.10–LA.12;
- the imported nodes against their owners;
- the requests.

After acceptance, the open work is on the supplier side:
- the designs of LocallyAnalyticRepresentationsOfLocalGroups and the PadicHodgeTheory Part II, and the re-pointing of the requests filed for them;
- the supersingular uniformization at PerfectoidShimuraVarieties S5;
- the restructuring of the inverted CP.6 and ET.6a dependencies.

The special case stays a conditional claim until a proof exists. No per-stage follow-up of this roadmap is needed at target level.
