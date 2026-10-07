# ASM-HeegnerPointEulerSystems handoff

Issue: #238. Agent: Codex. Session: `codex-F4j4xK`. This is a completed assembly submission, not a checkpoint. The underlying source/supplier gaps remain open and the revised norm-family signatures require independent review.

## Deliverables and preserved inputs

The [assembled reader](../readmes/HeegnerPointEulerSystems.md) contains the purpose, ownership boundaries, conventions, source register, pinned baseline, all 138 node statements with hypotheses/proof routes/prerequisites/acceptance criteria, all 60 API items and 45 tests, 54 planets, all 32 gaps and the 13 source-issue corrections. The [assembled suggested file](../suggested/HeegnerPointEulerSystems.lean) has one import block, one standard note and the existing `TauCeti.Heegner` and `TauCeti.Heegner.Anticyclotomic` namespaces.

Inputs are [HE.0 packet](../packets/HeegnerPointEulerSystems--HE.0.json) and [HE.7s packet](../packets/HeegnerPointEulerSystems--HE.7s.json), their readers and suggested files, and the final [HE.0 review](../reviews/REV-HeegnerPointEulerSystems--HE.0~2.md) and [HE.7s review](../reviews/REV-HeegnerPointEulerSystems--HE.7s.md). The assembly uses the current packets where historical part readers lag review/red-team corrections. Source IDs and source-issue IDs are qualified by part in the reader to avoid collisions. The legacy HE.8c Cornut–Vatsal node keeps its ID and its recorded HE.8 mathematical parent.

No part packet, part reader, part suggested file, review verdict, node ID, source receipt, atlas record or supplier file was changed. The HE.0 packet remains `complete`/accepted with its later source fixes; HE.7s remains `complete`/`needs_changes`. No mathematical-closure or implementation claim is made. All cross-part prerequisites already identify exact nodes, so no packet reference replacement was necessary.

## Changes requiring independent review

The assembled file repairs the expressible R1 coherence defect identified by the HE.7s review. It does not treat compilation as verification of an arithmetic theorem.

1. `universalNormFamily` now takes compact Hausdorff additive L, Hausdorff P, continuous projection/auxiliary-trace maps, an explicit allowed-edge set and finite simultaneous lifts. The lift hypothesis is for every pair of finite sets of bottom indices and auxiliary edges, not an assumed infinite family. The new admitted `universalNormFamily_exists` helper expresses the compactness conclusion. Closed bottom/trace equalizers in the compact product L^ℕ give a finite-intersection proof route. Howard §2.3, Lemmas 2.3.2–2.3.3, constructs the finite compatible families from a common-conductor formal module; CGLS Theorem 4.1.1 and the stabilization proof retain the weaker torsion hypothesis and class-number shifts. These passages were additionally checked during assembly. Production arithmetic still needs the dependent H[n] modules, their topology, recurrence and conductor identifications; this common-carrier prototype does not replace them.
2. `universalNormFamily_level_zero` and the promoted `universal-norm-level-zero` node use the same constructor data. `universalNormFamily_trace` requires an allowed edge of the same family. `universalNormFamily_corestriction` uses a projection/corestriction square holding on every supplied inverse-limit element. `universalNormFamily_choice` proves both zero bottom difference and homogeneous auxiliary relations for two choices. Thus zero projection with a nonzero bottom datum, independently chosen trace maps and arbitrary noncommuting transitions cannot enter these APIs.
3. The three named norm-family tests are retained. The bottom test uses compact ℤ₅ and Φ=5, the auxiliary test requires both an allowed edge and a_ℓ=0, and the kernel test retains distinct compatible homogeneous choices in compact ℤ₅. An extra rejection example states that zero projection/nonzero bottom data cannot provide even the singleton finite lift. The compact instance is the existing `PadicInt.compactSpace` at the Mathlib pin, in `Mathlib/NumberTheory/Padics/ProperSpace.lean`, whose statement and proof context were read.
4. `stabilized_corestriction` now applies to `stabilizedPoint α raw initial` and linear transition maps. It takes the ordinary unit-root polynomial, the positive-level raw recurrence, the degree-p trace of the embedded predecessor and the separate corrected first raw trace. Expanding stabilization uses a_p−pα⁻¹=α; the first raw trace gives the prescribed initial point. Field norms, the Artin corrections and d(k) shifts remain explicit supplier omissions. This signature no longer asserts corestriction for arbitrary unrelated y and cor.

These are assembled signature/API/test refinements of the existing arithmetic targets. There are no changes to packet mathematics or new arithmetic endpoints. The aggregate reader explains the refined prototype and preserves the packet R1 gap and verdict until review. In particular the p=3 exact-length proof gap, the general weak-torsion p=3 integral comparison gap, the general F_P dynamics acquisition gap and the global χ localization gap remain open.

## Checks and baseline

- `python3 scripts/check_blueprint.py research/blueprint/packets/HeegnerPointEulerSystems--HE.0.json`: 78 nodes, zero errors, zero warnings.
- `python3 scripts/check_blueprint.py research/blueprint/packets/HeegnerPointEulerSystems--HE.7s.json`: 60 nodes, zero errors, zero warnings.
- Assembly audit: 138 distinct nodes; combined internal fine-node graph acyclic; no missing or coarse Heegner prerequisites; every declaration/API name and every test marker present in the Lean file; every node statement, hypothesis, proof step, acceptance item, API/test statement and source locator present in the reader; unique anchors and valid local reader links. The exact cross-part imports are listed below.
- `lean-check research/blueprint/suggested/HeegnerPointEulerSystems.lean`: elaborated successfully, exit 0, 234 warnings, all `declaration uses sorry`. Mathlib-only at `082e2d37e8b0463410cdb532e111cd43d5a66174`; no Tau Ceti module imported. Available memory exceeded 20 GB before elaboration. No library build, update, cache download or Lean language server was started.
- The reviewed library audit and the exact positive Mathlib declaration statements were read. Existing algebraic modules are reused; typed arithmetic geometry and continuous Tate/Selmer objects remain supplier requests. Upstream GlobalNumberFields and Multiquadratic roadmaps were read as density/ownership examples; neighboring link maps and packet supplier contracts informed the opening boundary section.

- `git diff --check`: no whitespace errors. The three aggregate deliverables are the only repository changes. The handoff retains all 93 request contracts, their consuming node lists, and all 11 proposal details/stage assignments unchanged.
- `python3 research/blueprint/intake.py check-files` on the three deliverables: three files, zero problems.

## Promotion and maintainer decisions

The fine-node graph is acyclic; the coarse atlas graph is not certified by this assembly. Resolve the proposed HE.6z split and independent BSD.3a period export before promotion, otherwise the Zhang main-conjecture and BSD return edges can impose cycles on the unrelated clean descent branch. Early HE.8 families and geometric nonvanishing must precede independent BSD.7a and late HE.8b equality. Preserve the different strong Howard, weak localized, irreducible rational, surjective integral and restricted Eisenstein branches. CS's inert-prime result remains a conditional equivalence.

The process-only HE.7s/HE.8c notes have been integrated in the mathematical/source narrative, but the proposed removal of their stages and correction of the duplicated HE.8/HE.8b extraction are not applied here. The following collection preserves every proposal and every supplier request from both current packets, including requests addressed to already-planned declarations whose exact stronger export is still absent. Counts are current (63+30 requests), not historical review counts. Scratch data is not required for the next reviewer or maintainer.

## Cross-part prerequisite audit

All 25 cross-part prerequisite edges resolve. Direction is supplier → consumer. None are coarse-stage references.

| Supplier in HE.0 packet | Consumer in HE.7s packet |
| --- | --- |
| [HE.0/ring-class-tower-quotients](../readmes/HeegnerPointEulerSystems.md#he-0-ring-class-tower-quotients) | [HE.8/initial-euler-factor](../readmes/HeegnerPointEulerSystems.md#he-8-initial-euler-factor) |
| [HE.2/repeated-conductor-predecessor-recurrence](../readmes/HeegnerPointEulerSystems.md#he-2-repeated-conductor-predecessor-recurrence) | [HE.8/ordinary-stabilized-point](../readmes/HeegnerPointEulerSystems.md#he-8-ordinary-stabilized-point) |
| [HE.2/split-ramified-first-step-recurrence](../readmes/HeegnerPointEulerSystems.md#he-2-split-ramified-first-step-recurrence) | [HE.8/ordinary-stabilized-point](../readmes/HeegnerPointEulerSystems.md#he-8-ordinary-stabilized-point) |
| [HE.0/norm-reciprocity-level-compatibility](../readmes/HeegnerPointEulerSystems.md#he-0-norm-reciprocity-level-compatibility) | [HE.8/stabilized-corestriction](../readmes/HeegnerPointEulerSystems.md#he-8-stabilized-corestriction) |
| [HE.2/norm-relation-and-reduction-congruence](../readmes/HeegnerPointEulerSystems.md#he-2-norm-relation-and-reduction-congruence) | [HE.8/universal-norm-heegner-family](../readmes/HeegnerPointEulerSystems.md#he-8-universal-norm-heegner-family) |
| [HE.3/kummer-classes-and-the-modified-selmer-conditions](../readmes/HeegnerPointEulerSystems.md#he-3-kummer-classes-and-the-modified-selmer-conditions) | [HE.8/anticyclotomic-heegner-class](../readmes/HeegnerPointEulerSystems.md#he-8-anticyclotomic-heegner-class) |
| [HE.0/relative-cm-conductor-tower](../readmes/HeegnerPointEulerSystems.md#he-0-relative-cm-conductor-tower) | [HE.8/cm-character-stratum](../readmes/HeegnerPointEulerSystems.md#he-8-cm-character-stratum) |
| [HE.0/norm-reciprocity-level-compatibility](../readmes/HeegnerPointEulerSystems.md#he-0-norm-reciprocity-level-compatibility) | [HE.8/cm-character-stratum](../readmes/HeegnerPointEulerSystems.md#he-8-cm-character-stratum) |
| [HE.0/relative-cm-conductor-tower](../readmes/HeegnerPointEulerSystems.md#he-0-relative-cm-conductor-tower) | [HE.8/joint-cm-equidistribution](../readmes/HeegnerPointEulerSystems.md#he-8-joint-cm-equidistribution) |
| [HE.1/optimal-embedding-cm-points](../readmes/HeegnerPointEulerSystems.md#he-1-optimal-embedding-cm-points) | [HE.8/joint-cm-equidistribution](../readmes/HeegnerPointEulerSystems.md#he-8-joint-cm-equidistribution) |
| [HE.2/nonmaximal-level-distribution](../readmes/HeegnerPointEulerSystems.md#he-2-nonmaximal-level-distribution) | [HE.8/indefinite-cm-character-point](../readmes/HeegnerPointEulerSystems.md#he-8-indefinite-cm-character-point) |
| [HE.2/nonmaximal-level-distribution](../readmes/HeegnerPointEulerSystems.md#he-2-nonmaximal-level-distribution) | [HE.8/definite-cm-character-period](../readmes/HeegnerPointEulerSystems.md#he-8-definite-cm-character-period) |
| [HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation](../readmes/HeegnerPointEulerSystems.md#he-1-heegner-points-of-conductor-m-and-the-modular-parametrisation) | [HE.8/cornut-tower-trace-nontorsion](../readmes/HeegnerPointEulerSystems.md#he-8-cornut-tower-trace-nontorsion) |
| [HE.4/kolyvagin-derivative-classes-and-descent-to-K](../readmes/HeegnerPointEulerSystems.md#he-4-kolyvagin-derivative-classes-and-descent-to-k) | [HE.8/lambda-heegner-derivative-class](../readmes/HeegnerPointEulerSystems.md#he-8-lambda-heegner-derivative-class) |
| [HE.4/generator-tensor-choice-independence](../readmes/HeegnerPointEulerSystems.md#he-4-generator-tensor-choice-independence) | [HE.8/lambda-heegner-derivative-class](../readmes/HeegnerPointEulerSystems.md#he-8-lambda-heegner-derivative-class) |
| [HE.5/heegner-transverse-local-condition](../readmes/HeegnerPointEulerSystems.md#he-5-heegner-transverse-local-condition) | [HE.8/lambda-heegner-local-conditions](../readmes/HeegnerPointEulerSystems.md#he-8-lambda-heegner-local-conditions) |
| [HE.5/local-heegner-chi-automorphism](../readmes/HeegnerPointEulerSystems.md#he-5-local-heegner-chi-automorphism) | [HE.8/lambda-finite-singular-relation](../readmes/HeegnerPointEulerSystems.md#he-8-lambda-finite-singular-relation) |
| [HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system](../readmes/HeegnerPointEulerSystems.md#he-5-finite-singular-comparison-and-the-corrected-kolyvagin-system) | [HE.8/lambda-finite-singular-relation](../readmes/HeegnerPointEulerSystems.md#he-8-lambda-finite-singular-relation) |
| [HE.0/norm-reciprocity-level-compatibility](../readmes/HeegnerPointEulerSystems.md#he-0-norm-reciprocity-level-compatibility) | [HE.8/crystalline-near-trivial-character](../readmes/HeegnerPointEulerSystems.md#he-8-crystalline-near-trivial-character) |
| [HE.4/coefficient-and-prime-set-compatibility](../readmes/HeegnerPointEulerSystems.md#he-4-coefficient-and-prime-set-compatibility) | [HE.8/near-trivial-heegner-specialization](../readmes/HeegnerPointEulerSystems.md#he-8-near-trivial-heegner-specialization) |
| [HE.4/heegner-coefficient-ideal](../readmes/HeegnerPointEulerSystems.md#he-4-heegner-coefficient-ideal) | [HE.8/heegner-divisibility-profile](../readmes/HeegnerPointEulerSystems.md#he-8-heegner-divisibility-profile) |
| [HE.3/bad-place-component-obstruction](../readmes/HeegnerPointEulerSystems.md#he-3-bad-place-component-obstruction) | [HE.8/near-trivial-tamagawa-stability](../readmes/HeegnerPointEulerSystems.md#he-8-near-trivial-tamagawa-stability) |
| [HE.7/integral-tate-image-errors](../readmes/HeegnerPointEulerSystems.md#he-7-integral-tate-image-errors) | [HE.8/arithmetic-rescaled-kolyvagin-bound](../readmes/HeegnerPointEulerSystems.md#he-8-arithmetic-rescaled-kolyvagin-bound) |
| [HE.0/relative-cm-conductor-tower](../readmes/HeegnerPointEulerSystems.md#he-0-relative-cm-conductor-tower) | [HE.8/relative-ring-class-tower-torsion-finite](../readmes/HeegnerPointEulerSystems.md#he-8-relative-ring-class-tower-torsion-finite) |
| [HE.0/ring-class-tower-quotients](../readmes/HeegnerPointEulerSystems.md#he-0-ring-class-tower-quotients) | [HE.8/relative-ring-class-tower-torsion-finite](../readmes/HeegnerPointEulerSystems.md#he-8-relative-ring-class-tower-torsion-finite) |

## Restructuring proposals (all eleven)

### HE.0/S1: rescope

**Roadmaps:** `SerreWeightAndLevelOptimisation`.

RT-AREA-iwasawa-1/2: no declaration supplies Ribet/Diamond–Taylor level raising in the form used as Zhang2.1. R20.2/level-raising-diamond is Diamond’s criterion and is weaker.

**Proposal.** Add a stage beside R20.2, “Raising the level with prescribed local types, and its quaternionic transports”. It states Zhang2.1 (exact level Nq, trivial nebentypus, same residual representation; Diamond–Taylor, Duke Math. J.74, Theorem1 and Invent. Math.115, TheoremB) and the transports of Zhang §§3–4 (Helm Corollary8.11, Mazur’s principle on the Shimura set, Bertolini–Darmon Theorem9.2 with Ihara’s lemma for Shimura curves). It requires R20.2, GL2AutomorphicRepresentationsAndTransfer R17.3 and R17.6, and HilbertModularVarietiesAndShimuraCurves R18.6, and its consumer is the Zhang branch of HE.6 (HE.6z below). It imports R20.2/level-raising-diamond for the q-new step, and it should import or be compared with GL2ModularityLifting:R22.1/prescribed-level-raising-step and OrdinaryAutomorphicFormsAndModularityLifting:R21.2/ihara-lemma-quaternionic rather than repeat them. This packet requests it through R20.2 and does not modify that roadmap.

### HE.0/S2: rescope

**Roadmaps:** `FaltingsFinitenessAndIsogenyTheorems`, `ArithmeticGaloisRepresentations`.

RT-AREA-iwasawa-1/9: neither the Tate isogeny theorem nor the Heegner error verification owns Serre’s open-image theorem. Its owner is now decided: the Part II of FaltingsFinitenessAndIsogenyTheorems on ℓ-adic and residual images (accepted route 5 of PAPER-CALEGARI-GERAGHTY-20, which names the roadmap OpenImageTheoremsForAbelianVarieties, joined by the Qian and Boxer–Calegari–Gee–Pilloni routes). The design job DESIGN-FaltingsFinitenessAndIsogenyTheoremsPartII carries these routes together with the quantitative-isogeny ones. The brief expects HE.7 to import the large-p theorems and to keep the rest; HE.7 plans none of the general theorems.

**Proposal.** Withdraw the stage R28.7 proposed earlier. Add to the Part II what HE.7 uses and its brief leaves out: the open p-adic image at every p and the finite adelic index, which AbelianVarietiesIsogenousToNoJacobian:G0/serre-open-image now states as a cited leaf and should import from there; homotheties (Bogomolov, Serre) for GL₂-type quotients with index bounded across coefficient primes; Ribet’s GL₂-type big-image theorem and the residual-irreducibility/endomorphism exports of Nekovář6.1–6.2. The CM semilinear branch stays with ComplexMultiplicationAndExplicitReciprocity CM.4. Link the Part II’s elliptic-curve layer to HE.7 when it exists; HE.7 owns only the application to uniform Heegner error constants. Until then the requests use R28.4 and R01.4.

### HE.0/S3: rescope

**Roadmaps:** `EulerSystemsAndKolyvaginSystems`, `HeegnerPointEulerSystems`.

RT-AREA-iwasawa-1/10: the generic Howard H0–H5 self-dual argument is not a Heegner theorem. It now has its owner: ES.5/howard-hypotheses, ES.5/cassels-structure, ES.5/howard-stub and ES.5/howard-dvr-theorem, and ES.8/self-dual-lambda-adic-kolyvagin-bound for Howard Theorem2.2.10. HE.5–HE.6 verify H0–H5 for T_pE and cite those declarations.

**Proposal.** Two links remain for the maintainer: ES.5 → GeneralizedHeegnerCycles:GH.5 and ES.8 → GeneralizedHeegnerCycles:GH.5, absent from the stage graph. The third edge the finding asked for, HE.6 → HE.8, is not needed with the present declarations: what Howard Proposition2.1.3 reuses is the verification of H.0–H.5, which is planned in HE.5, and HE.5 → HE.8 is an edge of the atlas. No declaration of HE.8, HE.8b or HE.8c in the roadmap’s other packet has a prerequisite in HE.6. If the edge is added nevertheless, because HE.8’s text lists HE.3–HE.7, it closes the cycle HE.8 → GeneralizedHeegnerCycles:GH.8 → AutomorphicCongruences:L2 → ModularIwasawaMainConjectures:L1 → HE.6 unless the sub-layer HE.6z proposed below exists. No Λ or HE.8 target is planned in this part.

### HE.0/S4: rescope

**Roadmaps:** `HeegnerPointEulerSystems`, `GL2AutomorphicRepresentationsAndTransfer`.

RT-AREA-iwasawa-1/8: R17.5 Langlands–Tunnell is the wrong Zhang supplier; BSD.6 would be circular and over the wrong base/variety.

**Proposal.** The Zhang nodes use R17.3/global-jl and R17.3/multiplicity-one, ModularIwasawaMainConjectures:L1, KatoEulerSystems:L4, GZ.5 and the exact GL₂-type rank-zero/degree contracts in this packet. Remove the stage edge R17.5 → HE.6 of the base atlas, and with it the link from the Tau Ceti InductionRestriction layer 7 to HE.6 that accepted RS-21 added as a component of that edge: no HE.6 declaration uses either. No atlas or link-map file is edited here.

### HE.0/S5: rescope

**Roadmaps:** `RankZeroOneBSD`, `HeegnerPointEulerSystems`.

BSD.5, as well as BSD.6, consumes HE.6, while HE.6 needs the definite congruence-period identity that the BSD roadmap owns. The BSD packet now plans it as RankZeroOneBSD:BSD.3a/definite-congruence-period under BSD.5 and proposes the sub-layer BSD.3a; HE.6/ribet-takahashi-tamagawa-comparison cites that declaration.

**Proposal.** Create the sub-layer RankZeroOneBSD:BSD.3a as the BSD packet proposes, requiring NeronModelsAndSemistableAbelianVarieties R11.4 and R11.6, GL2AutomorphicRepresentationsAndTransfer R17.3 and GrossZagierAndArithmeticHeights GZ.3, with consumers the Zhang branch of HE.6 (HE.6z) and BSD.5. Without BSD.3a or HE.6z, once both packets are live, promotion derives BSD.5 → HE.6 from this packet and HE.6 → BSD.5 from the BSD packet, and skips whichever comes second. The final Heegner-index formula stays in BSD.5, downstream of HE.6. No supplier file is edited.

### HE.0/S6: rescope

**Roadmaps:** `HeegnerPointEulerSystems`, `ComplexMultiplicationAndExplicitReciprocity`.

The classical CM integral proof must run over the disjoint Heegner field, not a field over which CM is defined.

**Proposal.** Clarify HE.7’s CM-character sentence: compare the characters over KM, retain the degree-two integral errors, and recombine over K to verify condition(?) before the actual explicit-cocycle descent. Replace the unsourced plan to apply non-CM descent over the CM field with this Nekovář3.2/6.2/7.5 specialization.

### HE.0/S7: split

**Roadmaps:** `HeegnerPointEulerSystems`.

RT-AREA-iwasawa-1/8: HE.6 holds two developments with different suppliers. Howard’s TheoremA applies the self-dual theorem of the Euler-system roadmap to the corrected system of HE.5, and Gross’s clean descent is a direct argument modulo p from HE.5’s class detection; HE.7, HE.8b and the BSD roadmap build on them. Zhang’s indivisibility theorem rests on the main conjecture, Kato, the Gross formula, level raising and the definite period identity, and no other declaration uses it. Kept in one layer, Zhang’s import ModularIwasawaMainConjectures:L1 → HE.6 places all of HE.6 after HE.8, GeneralizedHeegnerCycles:GH.8 and AutomorphicCongruences:L2 in the stage order, and its import of the period identity conflicts with BSD.5’s use of HE.6.

**Proposal.** Two sub-layers of HE.6. HE.6 “Clean rank-one descent and index bounds” keeps clean-rank-one-descent-theorem-A, gross-clean-mod-p-descent, gross-opposite-eigenspace-vanishing, gross-same-eigenspace-generation, sha-square-index-bound, primitivity-versus-nonzero. HE.6z “Zhang’s indivisibility of Heegner points” takes zhang-cohomological-congruence, zhang-local-conditions-rank-lowering, zhang-rank-zero-over-K, zhang-jochnowitz-special-value, ribet-takahashi-tamagawa-comparison, zhang-triangular-selmer-basis, zhang-indivisibility, heegner-vanishing-order, heegner-base-locus, zhang-residual-local-pairing, zhang-residual-heegner-relations, zhang-two-class-prime-detection, zhang-prescribed-ramification-class. HE.6z requires HE.2, HE.3 and HE.4 inside the roadmap, and from other roadmaps SerreWeightAndLevelOptimisation R20.2 (or the level-raising stage proposed above), GL2AutomorphicRepresentationsAndTransfer R17.3, HilbertModularVarietiesAndShimuraCurves R18.3, ModularIwasawaMainConjectures L1, KatoEulerSystems L4, SelmerIwasawaCohomology L1 and L4, GrossZagierAndArithmeticHeights GZ.0, GZ.3 and GZ.5, NeronModelsAndSemistableAbelianVarieties R11.4, EulerSystemsAndKolyvaginSystems ES.1 and ES.3, ArithmeticGaloisDuality R02.2, the Tau Ceti Chebotarev layer 10, and RankZeroOneBSD BSD.5 (BSD.3a once that sub-layer exists). No declaration outside HE.6z has a prerequisite in it. After the split the supplier layers of HE.6 proper are not reachable from HE.8, and the links BSD.5 → HE.6z and HE.6 → BSD.5 do not conflict. The declaration ids do not change; the declarations keep HE.6 as parent until the sub-layer is a stage.

### HE.7s/S1: rescope

**Roadmaps:** `HeegnerPointEulerSystems`, `RankZeroOneBSD`.

RT-AREA-iwasawa-1/13: HE.8 and HE.8b atlas extracts are identical and include neighbouring process notes, obscuring the early-family → BSD.7a → HE.8b order. BSD.6/6a and 7/7a have the same extraction defect.

**Proposal.** Re-extract HE.8 from its README lines 102–108, HE.8b from 110–116 and HE.8c/HE.7s separately; re-extract BSD anchor sections likewise. Keep early family/geometric nonvanishing in HE.8. Keep conditional BCGS A/B and CS C there with MC hypotheses; unconditional discharge lives in HE.8b. Preserve the legacy CV node ID but move its parent to HE.8, with distinct definite theorem. Remove HE.8→HE.8c and HE.8b→HE.8c; remove process layers HE.8c/HE.7s after migrating their notes into mathematical statements/source inventory. BSD.7a may consume y∞/early local/nonvanishing nodes only; no late equality. Enumerate any genuine HE.6/HE.7 prerequisites by fine node, not the duplicated blanket text.

### HE.7s/S2: rescope

**Roadmaps:** `GeometryOfNumbersAndQuadraticArithmetic`, `HeegnerPointEulerSystems`.

RT-AREA-iwasawa-1/1: real Ratner nodes do not cover the non-Archimedean theorem required by CV.

**Proposal.** Extend GN.4 with distinct S-arithmetic orbit-closure, measure classification, uniform distribution and twisted-diagonal/commensurability exports over finite extensions of Q_p. Import the verified Q_p theorem without claiming the unacquired general extension. Add GN.4→HE.8 joint CM distribution; the arithmetic reciprocity/component reduction remains HE-owned. If GN.4 size requires a Part II, retain this exact contract there, never plan generic dynamics twice.

### HE.7s/S3: split

**Roadmaps:** `ComplexMultiplicationAndExplicitReciprocity`, `AutomorphicPadicLFunctions`, `RankZeroOneBSD`, `KatoEulerSystems`, `HeegnerPointEulerSystems`.

RT-AREA-iwasawa-1/5: imaginary-quadratic elliptic units and their main conjectures have no existing owner.

**Proposal.** Create “Elliptic units and the Iwasawa main conjectures for imaginary quadratic fields”: EU.0 integral elliptic-unit distributions and norm/conductor relations; EU.1 their rank-one Euler system and unit/class-group modules; EU.2 Rubin 1991/1994 two-variable CM main conjecture with exact prime/coefficient hypotheses; EU.3 Hida–Tilouine Invent.117(1994) Theorem 0.3 anticyclotomic form and specialization; EU.4 Hida Annals2010 Katz anticyclotomic μ=0 with exact hypotheses. Import Katz from AutomorphicPadicLFunctions L3, generic Euler-system/Iwasawa maps from ES.3/ES.8 and CM.1–CM.4 reciprocity. Acquire these proofs before claiming closure. Add KatoL4 Wüthrich distinguished E_• integral zeta/divisibility nodes, using IntegralIwasawaTheory L4 Ferrero–Washington. Link both suppliers to independent BSD.7a, and record them as suppliers of HE.7s’s Rubin/Iwasawa CM source alternative; retain the reviewed Nekovář direct HE.7 route without an artificial unit dependency.

### HE.7s/S4: rescope

**Roadmaps:** `AutomorphicCongruences`.

The current L5a scope cites BCSv2 Theorem 4.2.1 as the two-variable comparison, but that theorem is the anticyclotomic Euler-system bound.

**Proposal.** Correct the shared two-variable locator to BCSv2 Theorem 4.1.3/Corollary 4.1.4; retain Lemmas 5.1.1/5.1.2 in L5a and Wan/Fujiwara in L5w. The anticyclotomic arithmetic return is HE.8b, the cyclotomic return L5b is downstream and cannot be its input.


## Supplier requests (all ninety-three)

### HE.0/R1: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups`

Full local/global order carriers, proper invertible fractional ideal/idele comparison, order Picard extension exact sequence, unit indices, lattice trace duals and admissible ideal norm maps; instantiate existing Pic, never introduce another Picard group.

**Needed by:** [HE.0/local-toral-order](../readmes/HeegnerPointEulerSystems.md#he-0-local-toral-order), [HE.0/transported-global-order](../readmes/HeegnerPointEulerSystems.md#he-0-transported-global-order), [HE.0/idele-ideal-class-comparison](../readmes/HeegnerPointEulerSystems.md#he-0-idele-ideal-class-comparison), [HE.0/conductor-change-kernel](../readmes/HeegnerPointEulerSystems.md#he-0-conductor-change-kernel), [HE.0/ring-class-tower-quotients](../readmes/HeegnerPointEulerSystems.md#he-0-ring-class-tower-quotients), [HE.0/relative-cm-conductor-tower](../readmes/HeegnerPointEulerSystems.md#he-0-relative-cm-conductor-tower), [HE.0/local-different-discriminant](../readmes/HeegnerPointEulerSystems.md#he-0-local-different-discriminant).

### HE.0/R2: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`

Ring-class existence in a fixed separable closure, Artin isomorphism for the order-unit quotient, conductor tower restriction/norm compatibility and local splitting/inertia description. An Artin map for an already given extension does not supply this.

**Needed by:** [HE.0/ring-class-tower-quotients](../readmes/HeegnerPointEulerSystems.md#he-0-ring-class-tower-quotients), [HE.0/dihedral-conjugation](../readmes/HeegnerPointEulerSystems.md#he-0-dihedral-conjugation), [HE.0/norm-reciprocity-level-compatibility](../readmes/HeegnerPointEulerSystems.md#he-0-norm-reciprocity-level-compatibility).

### HE.0/R3: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`

Relative CM class fields for O_F+C O_K and quaternionic admissible open levels, with actual norm and tower maps.

**Needed by:** [HE.0/relative-cm-conductor-tower](../readmes/HeegnerPointEulerSystems.md#he-0-relative-cm-conductor-tower).

### HE.0/R4: `HilbertModularVarietiesAndShimuraCurves:R18.1`

Quaternionic admissible level subgroups for the specified CM embedding and Eichler order. Independent review: this is an exact quaternionic export request to R18, replacing the unrelated H4/H5 Hilbert contracts; the full optimal-embedding application remains HE.1 work.

**Needed by:** [HE.0/relative-cm-conductor-tower](../readmes/HeegnerPointEulerSystems.md#he-0-relative-cm-conductor-tower).

### HE.0/R5: `ComplexMultiplicationAndExplicitReciprocity:CM.1`

CM elliptic curve from proper invertible ideal, cyclic isogeny from the specified invertible level ideal, and ideal action on the pair.

**Needed by:** [HE.1/cm-cyclic-isogeny-pair](../readmes/HeegnerPointEulerSystems.md#he-1-cm-cyclic-isogeny-pair).

### HE.0/R6: `ComplexMultiplicationAndExplicitReciprocity:CM.2`

Main CM reciprocity on level-structured elliptic pairs, with arithmetic/geometric reciprocity convention comparison.

**Needed by:** [HE.1/canonical-model-cm-descent](../readmes/HeegnerPointEulerSystems.md#he-1-canonical-model-cm-descent).

### HE.0/R7: `ShimuraVarieties:V5`

Canonical model and CM reciprocity descent for these quaternionic level points; not merely a complex double coset.

**Needed by:** [HE.1/optimal-embedding-cm-points](../readmes/HeegnerPointEulerSystems.md#he-1-optimal-embedding-cm-points), [HE.1/canonical-model-cm-descent](../readmes/HeegnerPointEulerSystems.md#he-1-canonical-model-cm-descent).

### HE.0/R8: `HilbertModularVarietiesAndShimuraCurves:R18.4`

Local optimal-embedding conditions for the order and Eichler level, including ramified quaternion places and a fixed archimedean CM type. Independent review: this is an exact quaternionic export request to R18, replacing the unrelated H4/H5 Hilbert contracts; the full optimal-embedding application remains HE.1 work.

**Needed by:** [HE.1/optimal-embedding-cm-points](../readmes/HeegnerPointEulerSystems.md#he-1-optimal-embedding-cm-points).

### HE.0/R9: `HilbertModularVarietiesAndShimuraCurves:R18.1`

Optimal-order embedding/local level conditions for the relative CM quaternionic curve. Independent review: this is an exact quaternionic export request to R18, replacing the unrelated H4/H5 Hilbert contracts; the full optimal-embedding application remains HE.1 work.

**Needed by:** [HE.1/optimal-embedding-cm-points](../readmes/HeegnerPointEulerSystems.md#he-1-optimal-embedding-cm-points).

### HE.0/R10: `ModularCurvesPartII:R14.1`

Existing X₀(N) cyclic-isogeny moduli object and complex/rational comparison for the specified integral level.

**Needed by:** [HE.1/cm-cyclic-isogeny-pair](../readmes/HeegnerPointEulerSystems.md#he-1-cm-cyclic-isogeny-pair).

### HE.0/R11: `GrossZagierAndArithmeticHeights:GZ.3`

Only normalized rational Hodge class, denominator clearing, modular quotient and degree comparison; not the Gross–Zagier height formula.

**Needed by:** [HE.1/jacobian-basepoint-denominators](../readmes/HeegnerPointEulerSystems.md#he-1-jacobian-basepoint-denominators), [HE.1/parameter-choice-and-degree](../readmes/HeegnerPointEulerSystems.md#he-1-parameter-choice-and-degree).

### HE.0/R12: `EllipticCurveModularity:R29.5`

Defined modular quotient and Hecke/Fricke equivariance, including integral differential and Manin constant normalization.

**Needed by:** [HE.1/jacobian-basepoint-denominators](../readmes/HeegnerPointEulerSystems.md#he-1-jacobian-basepoint-denominators), [HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation](../readmes/HeegnerPointEulerSystems.md#he-1-heegner-points-of-conductor-m-and-the-modular-parametrisation), [HE.1/parameter-choice-and-degree](../readmes/HeegnerPointEulerSystems.md#he-1-parameter-choice-and-degree).

### HE.0/R13: `EllipticCurveModularity:R29.5`

Hecke eigenquotient transport of the actual divisor identities, with torsion basepoint terms and degree normalization.

**Needed by:** [HE.2/norm-relation-and-reduction-congruence](../readmes/HeegnerPointEulerSystems.md#he-2-norm-relation-and-reduction-congruence).

### HE.0/R14: `HilbertModularVarietiesAndShimuraCurves:R18.4`

Local lattice interpretation, P-new quotient and good/semistable quaternionic models with matched CM embeddings. Independent review: this is an exact quaternionic export request to R18, replacing the unrelated H4/H5 Hilbert contracts; the full optimal-embedding application remains HE.1 work.

**Needed by:** [HE.2/cm-hecke-conductor-classification](../readmes/HeegnerPointEulerSystems.md#he-2-cm-hecke-conductor-classification), [HE.2/nonmaximal-level-distribution](../readmes/HeegnerPointEulerSystems.md#he-2-nonmaximal-level-distribution), [HE.2/quaternionic-reduction-specialization](../readmes/HeegnerPointEulerSystems.md#he-2-quaternionic-reduction-specialization).

### HE.0/R15: `NeronModelsAndSemistableAbelianVarieties:R11.2`

Integral specialization of the fixed modular quotient, connected-part unramified H¹ vanishing, component sequence and exact Kummer defect.

**Needed by:** [HE.2/inert-reduction-frobenius-congruence](../readmes/HeegnerPointEulerSystems.md#he-2-inert-reduction-frobenius-congruence), [HE.3/bad-place-component-obstruction](../readmes/HeegnerPointEulerSystems.md#he-3-bad-place-component-obstruction).

### HE.0/R16: `NeronModelsAndSemistableAbelianVarieties:R11.6`

Quaternionic semistable integral model and specialization to the correct reduction-graph vertex, with Frobenius/Atkin–Lehner actions.

**Needed by:** [HE.2/quaternionic-reduction-specialization](../readmes/HeegnerPointEulerSystems.md#he-2-quaternionic-reduction-specialization).

### HE.0/R17: `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`

Elliptic finite/p-adic Kummer maps, naturality with restriction/corestriction, continuous Tate-module coefficients, exact Selmer/Sha sequences and integral local comparison.

**Needed by:** [HE.3/kummer-classes-and-the-modified-selmer-conditions](../readmes/HeegnerPointEulerSystems.md#he-3-kummer-classes-and-the-modified-selmer-conditions), [HE.3/good-place-kummer-unramified](../readmes/HeegnerPointEulerSystems.md#he-3-good-place-kummer-unramified), [HE.3/bad-place-component-obstruction](../readmes/HeegnerPointEulerSystems.md#he-3-bad-place-component-obstruction), [HE.3/coefficient-prime-local-condition](../readmes/HeegnerPointEulerSystems.md#he-3-coefficient-prime-local-condition), [HE.3/saturated-integral-kummer-lattice](../readmes/HeegnerPointEulerSystems.md#he-3-saturated-integral-kummer-lattice).

### HE.0/R18: `SelmerIwasawaCohomology:L0`

Continuous inverse-limit cohomology with compact T_pE, finite discrete reductions, lim¹/invariants and saturated integral-to-rational comparison.

**Needed by:** [HE.3/kummer-classes-and-the-modified-selmer-conditions](../readmes/HeegnerPointEulerSystems.md#he-3-kummer-classes-and-the-modified-selmer-conditions), [HE.3/saturated-integral-kummer-lattice](../readmes/HeegnerPointEulerSystems.md#he-3-saturated-integral-kummer-lattice).

### HE.0/R19: `SelmerIwasawaCohomology:L1`

Local good-reduction Kummer/unramified comparison and Weil/Tate self-duality.

**Needed by:** [HE.3/good-place-kummer-unramified](../readmes/HeegnerPointEulerSystems.md#he-3-good-place-kummer-unramified).

### HE.0/R20: `SelmerIwasawaCohomology:L2`

Precise ordinary-versus-finite integral local conditions and local-torsion defects.

**Needed by:** [HE.3/coefficient-prime-local-condition](../readmes/HeegnerPointEulerSystems.md#he-3-coefficient-prime-local-condition).

### HE.0/R21: `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`

Good-reduction crystalline/Bloch–Kato Kummer comparison at v|p and integral lattice compatibility; finite-flat group definitions or a Hodge–Tate decomposition alone do not supply this. Use the Breuil–Kisin/integral comparison owner.

**Needed by:** [HE.3/coefficient-prime-local-condition](../readmes/HeegnerPointEulerSystems.md#he-3-coefficient-prime-local-condition).

### HE.0/R22: `ArithmeticGaloisDuality:R02.4`

Real-place Tate local conditions for E[p^m] and integral dyadic comparison.

**Needed by:** [HE.3/archimedean-tate-correction](../readmes/HeegnerPointEulerSystems.md#he-3-archimedean-tate-correction).

### HE.0/R23: `EulerSystemsAndKolyvaginSystems:ES.3`

Existing cyclic derivative, product identities, intrinsic cyclic tensor coefficients, choice transformation and descent/error interface. Do not replan these generic constructions here.

**Needed by:** [HE.4/heegner-coefficient-ideal](../readmes/HeegnerPointEulerSystems.md#he-4-heegner-coefficient-ideal), [HE.4/differentiated-point-invariance](../readmes/HeegnerPointEulerSystems.md#he-4-differentiated-point-invariance), [HE.4/kolyvagin-derivative-classes-and-descent-to-K](../readmes/HeegnerPointEulerSystems.md#he-4-kolyvagin-derivative-classes-and-descent-to-k), [HE.4/generator-tensor-choice-independence](../readmes/HeegnerPointEulerSystems.md#he-4-generator-tensor-choice-independence), [HE.4/coefficient-and-prime-set-compatibility](../readmes/HeegnerPointEulerSystems.md#he-4-coefficient-and-prime-set-compatibility), [HE.4/complex-conjugation-parity](../readmes/HeegnerPointEulerSystems.md#he-4-complex-conjugation-parity).

### HE.0/R24: `ArithmeticGaloisRepresentations:R01.4`

Residual representation and image subgroup operations for the elliptic torsion/dihedral quotient argument.

**Needed by:** [HE.4/ring-class-torsion-invariants](../readmes/HeegnerPointEulerSystems.md#he-4-ring-class-torsion-invariants).

### HE.0/R25: `EulerSystemsAndKolyvaginSystems:ES.2`

Indexing-family and coefficient-change maps for the conductor presentation, with the Heegner normalization dictionary.

**Needed by:** [HE.4/coefficient-and-prime-set-compatibility](../readmes/HeegnerPointEulerSystems.md#he-4-coefficient-and-prime-set-compatibility).

### HE.0/R26: `EulerSystemsAndKolyvaginSystems:ES.1`

Generic finite/singular and transverse carriers, cyclic tensor factor, simultaneous prime selection and localization detection for the actual Heegner finite fields.

**Needed by:** [HE.5/heegner-transverse-local-condition](../readmes/HeegnerPointEulerSystems.md#he-5-heegner-transverse-local-condition), [HE.5/local-heegner-chi-automorphism](../readmes/HeegnerPointEulerSystems.md#he-5-local-heegner-chi-automorphism), [HE.5/residual-kummer-field-pairing](../readmes/HeegnerPointEulerSystems.md#he-5-residual-kummer-field-pairing), [HE.5/chebotarev-heegner-class-detection](../readmes/HeegnerPointEulerSystems.md#he-5-chebotarev-heegner-class-detection).

### HE.0/R27: `EulerSystemsAndKolyvaginSystems:ES.3`

Strong-system correction interface and cyclic tensor target; the Howard arithmetic χ action is verified in this packet.

**Needed by:** [HE.5/finite-singular-comparison-and-the-corrected-kolyvagin-system](../readmes/HeegnerPointEulerSystems.md#he-5-finite-singular-comparison-and-the-corrected-kolyvagin-system).

### HE.0/R28: `ArithmeticGaloisDuality:R02.2`

Continuous change-of-group/conjugation and central-scalar vanishing for the actual T_pE residual representation; finite Kummer field restriction and evaluation.

**Needed by:** [HE.5/actual-tate-hypotheses-h0-h2](../readmes/HeegnerPointEulerSystems.md#he-5-actual-tate-hypotheses-h0-h2), [HE.5/residual-kummer-field-pairing](../readmes/HeegnerPointEulerSystems.md#he-5-residual-kummer-field-pairing).

### HE.0/R29: `SelmerIwasawaCohomology:L1`

Exact local duality/orthogonality and conjugate-place transport of the twisted Weil pairing.

**Needed by:** [HE.5/actual-local-hypotheses-h3-h5](../readmes/HeegnerPointEulerSystems.md#he-5-actual-local-hypotheses-h3-h5).

### HE.0/R30: `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`

Existing elliptic torsion, Weil pairing and integral Tate module with Galois action; Heegner never owns their general definition.

**Needed by:** [HE.5/actual-tate-hypotheses-h0-h2](../readmes/HeegnerPointEulerSystems.md#he-5-actual-tate-hypotheses-h0-h2).

### HE.0/R31: `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`

Tate uniformization, local torsion and component order v(q) for the stated local examples.

**Needed by:** [HE.5/tamagawa-and-local-torsion-tests](../readmes/HeegnerPointEulerSystems.md#he-5-tamagawa-and-local-torsion-tests).

### HE.0/R32: `EulerSystemsAndKolyvaginSystems:ES.4`

Distinct restriction/invariant/local error constants with an exact finite-level descent inequality, allowing nonzero defects.

**Needed by:** [HE.5/arithmetic-local-error-comparison](../readmes/HeegnerPointEulerSystems.md#he-5-arithmetic-local-error-comparison).

### HE.0/R33: `NeronModelsAndSemistableAbelianVarieties:R11.2`

Integral component-group/Kummer error comparison for the actual Heegner points and local torsion.

**Needed by:** [HE.5/arithmetic-local-error-comparison](../readmes/HeegnerPointEulerSystems.md#he-5-arithmetic-local-error-comparison).

### HE.0/R34: `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

Qualitative Chebotarev with positive-density conjugacy class and exclusion of a finite prime set for Gross’s actual finite Kummer composites.

**Needed by:** [HE.5/chebotarev-heegner-class-detection](../readmes/HeegnerPointEulerSystems.md#he-5-chebotarev-heegner-class-detection).

### HE.0/R35: `EulerSystemsAndKolyvaginSystems:ES.5`

The self-dual primitivity equality. For a Selmer triple satisfying H.0–H.5 of ES.5/howard-hypotheses, with its dual, p≥5 and 𝓛⊇𝓛_s(T), and a Kolyvagin system κ with κ_1≠0: length M=length(H¹_F(K,T)/Rκ_1)−d(κ) for an integer d(κ)≥0 that vanishes exactly when κ is primitive, that is has nonzero image in KS(T/mT) as in ES.5/divisibility-invariants (Zanarella, arXiv:1908.09197v1, Theorem2.3.6 with Proposition2.3.3). Howard’s Theorem1.6.1 gives only the inequality, and ES.5’s Mazur–Rubin rank-one and structure theorems assume core rank one over Q. The hypothesis record and the DVR theorem themselves are now ES.5 nodes and are cited by id (RT-AREA-iwasawa-1/10).

**Needed by:** [HE.6/primitivity-versus-nonzero](../readmes/HeegnerPointEulerSystems.md#he-6-primitivity-versus-nonzero).

### HE.0/R36: `EulerSystemsAndKolyvaginSystems:ES.1`

Local one-dimensional eigenspace pairings, strict/relaxed rank comparison, simultaneous prime detection and auxiliary singular-class existence as used in Gross/Zhang.

**Needed by:** [HE.6/gross-opposite-eigenspace-vanishing](../readmes/HeegnerPointEulerSystems.md#he-6-gross-opposite-eigenspace-vanishing), [HE.6/zhang-local-conditions-rank-lowering](../readmes/HeegnerPointEulerSystems.md#he-6-zhang-local-conditions-rank-lowering), [HE.6/zhang-triangular-selmer-basis](../readmes/HeegnerPointEulerSystems.md#he-6-zhang-triangular-selmer-basis).

### HE.0/R37: `SelmerIwasawaCohomology:L1`

Local Tate/global reciprocity for Gross eigenspaces and full-place duality/parity comparison for Zhang’s rank-lowering.

**Needed by:** [HE.6/gross-opposite-eigenspace-vanishing](../readmes/HeegnerPointEulerSystems.md#he-6-gross-opposite-eigenspace-vanishing), [HE.6/zhang-local-conditions-rank-lowering](../readmes/HeegnerPointEulerSystems.md#he-6-zhang-local-conditions-rank-lowering).

### HE.0/R38: `SerreWeightAndLevelOptimisation:R20.2`

Level raising in the form of Zhang Theorem2.1, with its quaternionic transports (RT-AREA-iwasawa-1/2). (i) For a weight-two newform g of level N and trivial nebentypus, a prime 𝔭|p≥5 with ρ̄_g irreducible, and a prime q∤Np with p∤q²−1 and a_q(g)≡±(q+1) mod 𝔭: a newform g′ of exact level Nq and trivial nebentypus with ρ̄_g′≃ρ̄_g over a common residue field; iterate over squarefree products m. The proof prescribes the inertial type at every ℓ≠p, an unramified twist of Steinberg at q (Diamond–Taylor, Duke Math. J.74 (1994), Theorem1; Invent. Math.115 (1994), TheoremB), and reads off the exact level and the trivial nebentypus. R20.2/level-raising-diamond is imported for the q-new step and does not give the exact level or the local types. (ii) For the definite and indefinite quaternion algebras of discriminant N⁻m: J(X_m)[𝔪]≃V of dimension two over k₀ (Zhang Lemma3.3; Mazur, Ribet and Wiles for modular curves, Helm, Israel J. Math.160 (2007), Corollary8.11 for Shimura curves under Hypothesis♥); multiplicity one for the Hecke module of the Shimura set by Mazur’s principle (Zhang (4.8), by the proof of Pollack–Weston Theorem6.2); and the identity (4.9): on points of the Shimura curve reducing to supersingular points at q, the reduced Jacquet–Langlands eigenfunction composed with reduction is the local Kummer map into H¹(K_q,k₀) (Zhang states it for Heegner points, from Bertolini–Darmon, Ann. of Math.162 (2005), Theorem9.2), which rests on Ihara’s lemma for Shimura curves over Q (Diamond–Taylor, Invent. Math.115). The transfer of automorphic representations is GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl. Conditions that involve K, such as q inert in K, stay in HE.6.

**Needed by:** [HE.6/zhang-cohomological-congruence](../readmes/HeegnerPointEulerSystems.md#he-6-zhang-cohomological-congruence), [HE.6/zhang-jochnowitz-special-value](../readmes/HeegnerPointEulerSystems.md#he-6-zhang-jochnowitz-special-value).

### HE.0/R39: `ModularIwasawaMainConjectures:L1`

The Skinner–Urban form of the weight-two cyclotomic main conjecture, with equality in the Iwasawa algebra over O: for p≥3 and a newform f of weight two, trivial character and level M prime to p, ordinary at 𝔭|p, with ρ̄_f irreducible and ramified at some prime q||M, the dual Selmer group over the cyclotomic Z_p-extension is torsion and its characteristic ideal is generated by the p-adic L-function (Skinner, Pacific J. Math.283 (2016), Theorem A for p∤N, that is Theorem2.5.2; Skinner–Urban Theorem1 with the integrality of Skinner §2.5). It is applied to g and to its quadratic twist g_K of level N·D_K². This is not the Fouquet–Wan Theorem1.6 form now in the layer’s text, whose auxiliary prime must also have no invariants under the decomposition group (RT-AREA-iwasawa-1/14). HE.6 derives Zhang7.1 over K from it; an image containing SL₂(Z_p) is not assumed.

**Needed by:** [HE.6/zhang-rank-zero-over-K](../readmes/HeegnerPointEulerSystems.md#he-6-zhang-rank-zero-over-k).

### HE.0/R40: `KatoEulerSystems:L4`

Kato’s integral divisibility under Skinner’s conditions. KatoEulerSystems:L4/ordinary-selmer-divisibility is cited for Kato Theorem17.4; its integral part assumes condition (12.5.2), an image containing SL₂(Z_p). Requested: the same integral bound with (12.5.2) replaced by (a) ρ̄_f irreducible and (b) an element of Gal(Q̄/Q(μ_p∞)) acting on the lattice with free rank-one coinvariants (Skinner §2.5, through Kato Theorem15.5(4)), for the newform g with coefficient prime 𝔭 and for its twist g_K. It is needed where a residual image containing SL₂(F_p) does not give (12.5.2): at p=3, and at p=5 for a ramified coefficient ring.

**Needed by:** [HE.6/zhang-rank-zero-over-K](../readmes/HeegnerPointEulerSystems.md#he-6-zhang-rank-zero-over-k).

### HE.0/R41: `SelmerIwasawaCohomology:L4`

The rank-zero special-value formula for GL₂-type coefficients, by control at the trivial character. For p≥3 and a newform f of weight two, trivial character and level M prime to p, ordinary at 𝔭, with ρ̄_f irreducible and ramified at some q||M: #O/(L^alg(f,1))=#Sel_L(f)·∏_ℓ c_ℓ(T_f), where L^alg(f,1)=L(f,1)/(−2πiΩ_f⁺), Sel_L(f) is the Bloch–Kato Selmer group of the lattice T_f and c_ℓ(T_f) its Tamagawa factors (Skinner, TheoremB; proved in his §3.2 from the main conjecture by Greenberg’s method, using surjectivity of the global-to-local map and the absence of finite submodules). HE.6 applies it to g and g_K and compares with Selmer groups and component groups over K; an E/Q-only BSD endpoint is not this statement.

**Needed by:** [HE.6/zhang-rank-zero-over-K](../readmes/HeegnerPointEulerSystems.md#he-6-zhang-rank-zero-over-k).

### HE.0/R42: `GrossZagierAndArithmeticHeights:GZ.0`

Canonical period as product of ± periods up to a proved 𝔭-adic unit, and normalization of the quadratic-base rank-zero special value.

**Needed by:** [HE.6/zhang-rank-zero-over-K](../readmes/HeegnerPointEulerSystems.md#he-6-zhang-rank-zero-over-k).

### HE.0/R43: `GrossZagierAndArithmeticHeights:GZ.5`

Explicit definite Waldspurger/Gross special-value formula with primitive integral eigenfunction, u_K, discriminant, Petersson and congruence-period factors (Zhang6.1–6.2).

**Needed by:** [HE.6/zhang-jochnowitz-special-value](../readmes/HeegnerPointEulerSystems.md#he-6-zhang-jochnowitz-special-value).

### HE.0/R44: `RankZeroOneBSD:BSD.5`

Addressed to the declaration RankZeroOneBSD:BSD.3a/definite-congruence-period, which now exists under this layer and is cited as the prerequisite. Three things remain. (i) Its statement writes t_g(ℓ)=length Φ(A_g/Q_ℓ)_𝔭 and calls it the Tamagawa factor; state it as the length of the 𝔭-part of the geometric component group, equivalently of Φ over the unramified quadratic extension of Q_ℓ, as Zhang (6.7) does. At a non-split multiplicative prime the Q_ℓ-rational points of the component group are killed by 2, so their 𝔭-part vanishes. (ii) Its statement covers nonsquarefree N, but its proof route is Pollack–Weston’s, which assumes N squarefree; plan the nonsquarefree case as Zhang’s proof of Theorem6.4 indicates: Helm’s multiplicity one without squarefreeness, and the modular-degree comparison of Ribet–Takahashi (second assertion of their Theorem1) and Khare under Hypothesis♥(2). (iii) Keep its prerequisites free of HE.6, the final Heegner-index formula, Jochnowitz congruences and rank-zero BSD.

**Needed by:** [HE.6/ribet-takahashi-tamagawa-comparison](../readmes/HeegnerPointEulerSystems.md#he-6-ribet-takahashi-tamagawa-comparison).

### HE.0/R45: `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`

Mordell–Weil finite generation and the free quotient of E(K), before using a finite rank-one Heegner index.

**Needed by:** [HE.7/non-torsion-point-prime-divisibility](../readmes/HeegnerPointEulerSystems.md#he-7-non-torsion-point-prime-divisibility).

### HE.0/R46: `FaltingsFinitenessAndIsogenyTheorems:R28.4`

Serre’s open-image theorems, owned by the Part II of FaltingsFinitenessAndIsogenyTheorems on ℓ-adic and residual images of abelian varieties (Serre’s open-image theorems): accepted route 5 of PAPER-CALEGARI-GERAGHTY-20, carried by the design job DESIGN-FaltingsFinitenessAndIsogenyTheoremsPartII. R28.4 is only the routing identifier until that roadmap exists; no R28.7 is proposed any longer (RT-AREA-iwasawa-1/9). Needed for a non-CM elliptic curve over a number field: (i) ρ̄_{E,p} surjective for all but finitely many p, and then image GL₂(Z_p) on T_pE, which the route’s brief plans; (ii) the p-adic image open for every p and the adelic image of finite index, with the cyclotomic determinant (Serre, Invent. Math.15 (1972)), which the brief puts out of scope as “small ℓ” and which is stated in the atlas only as a cited leaf, AbelianVarietiesIsogenousToNoJacobian:G0/serre-open-image; (iii) Ribet’s big-image theorem for the non-CM GL₂-type quotients used by the Kolyvagin–Logachev branch. The Tate isogeny theorem alone is not this supplier.

**Needed by:** [HE.7/non-cm-open-image-application](../readmes/HeegnerPointEulerSystems.md#he-7-non-cm-open-image-application).

### HE.0/R47: `ArithmeticGaloisRepresentations:R01.4`

Residual/Tate image and determinant comparison required to apply the requested Serre/Ribet theorem to the actual Heegner representation.

**Needed by:** [HE.7/non-cm-open-image-application](../readmes/HeegnerPointEulerSystems.md#he-7-non-cm-open-image-application).

### HE.0/R48: `EulerSystemsAndKolyvaginSystems:ES.3`

Error-tolerant derivative/descent construction retaining invariants and bounded denominator input; arithmetic uniformity is verified by HE.7.

**Needed by:** [HE.7/bounded-arithmetic-derivative-denominators](../readmes/HeegnerPointEulerSystems.md#he-7-bounded-arithmetic-derivative-denominators).

### HE.0/R49: `EulerSystemsAndKolyvaginSystems:ES.4`

Reusable integral error-tolerant two-prime descent of Nekovář7.5, with fixed C₀,C₁,C₂,C₃,C₅,C₆ and factor2²¹; HE supplies the actual CM-point classes, geometric component errors, image/evaluation estimates and reciprocity input. Also export Nekovář6.4.3’s general maximal-order pairing bound cd·Coker(j)=0. These generic arguments are not replanned as Heegner lemmas.

**Needed by:** [HE.7/bounded-arithmetic-derivative-denominators](../readmes/HeegnerPointEulerSystems.md#he-7-bounded-arithmetic-derivative-denominators), [HE.7/dyadic-integral-conjugation-descent](../readmes/HeegnerPointEulerSystems.md#he-7-dyadic-integral-conjugation-descent), [HE.7/cm-character-error-descent](../readmes/HeegnerPointEulerSystems.md#he-7-cm-character-error-descent), [HE.7/exceptional-primary-sha-bound](../readmes/HeegnerPointEulerSystems.md#he-7-exceptional-primary-sha-bound), [HE.7/admissible-rm-kolyvagin-logachev](../readmes/HeegnerPointEulerSystems.md#he-7-admissible-rm-kolyvagin-logachev).

### HE.0/R50: `ArithmeticGaloisDuality:R02.4`

Dyadic real/Tate correction and integral 1±τ, restriction/corestriction kernels with explicit exponents.

**Needed by:** [HE.7/dyadic-integral-conjugation-descent](../readmes/HeegnerPointEulerSystems.md#he-7-dyadic-integral-conjugation-descent).

### HE.0/R51: `ComplexMultiplicationAndExplicitReciprocity:CM.4`

CM elliptic induced Tate-character realization, two distinct conjugate components over the CM field, exact endomorphism field, and the conductor comparison |D_M| divides N. Provide integral finite-extension comparison with degree2; the HE application recombines the characters over the disjoint Heegner field and does not demand full GL₂ image.

**Needed by:** [HE.7/cm-character-error-descent](../readmes/HeegnerPointEulerSystems.md#he-7-cm-character-error-descent), [HE.7/cm-heegner-field-disjointness](../readmes/HeegnerPointEulerSystems.md#he-7-cm-heegner-field-disjointness), [HE.7/integral-tate-image-errors](../readmes/HeegnerPointEulerSystems.md#he-7-integral-tate-image-errors).

### HE.0/R52: `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`

Finite finite-level Selmer groups and the actual torsion-primary Sha carrier/decomposition and Kummer quotient.

**Needed by:** [HE.7/almost-all-primary-sha-vanishing](../readmes/HeegnerPointEulerSystems.md#he-7-almost-all-primary-sha-vanishing), [HE.7/exceptional-primary-sha-bound](../readmes/HeegnerPointEulerSystems.md#he-7-exceptional-primary-sha-bound), [HE.7/classical-full-sha-finiteness](../readmes/HeegnerPointEulerSystems.md#he-7-classical-full-sha-finiteness).

### HE.0/R53: `GrossZagierAndArithmeticHeights:GZ.8`

Exact height/nonvanishing formula for the specified simple RM quaternionic Jacobian quotient over F, CM field K and trace of m(P−δ). When using analytic rank dim A for L(A/K,s), certify non-torsion of this particular y; it is additional to the geometric descent theorem, not a generic unrestricted BSD assertion.

**Needed by:** [HE.7/admissible-rm-kolyvagin-logachev](../readmes/HeegnerPointEulerSystems.md#he-7-admissible-rm-kolyvagin-logachev).

### HE.0/R54: `HilbertModularVarietiesAndShimuraCurves:R18.2`

The chosen quaternionic canonical curve has the good/semistable integral model, CM reduction map, and compatible quotient/specialization at q; retain the discriminant, level and basepoint.

**Needed by:** [HE.2/quaternionic-reduction-specialization](../readmes/HeegnerPointEulerSystems.md#he-2-quaternionic-reduction-specialization).

### HE.0/R55: `HilbertModularVarietiesAndShimuraCurves:R18.3`

The actual definite Shimura class-set carrier and the matched optimal embedding receiving good-prime CM reductions; a definite quaternion algebra does not supply a curve.

**Needed by:** [HE.2/quaternionic-reduction-specialization](../readmes/HeegnerPointEulerSystems.md#he-2-quaternionic-reduction-specialization).

### HE.0/R56: `HilbertModularVarietiesAndShimuraCurves:R18.5`

Čerednik–Drinfeld uniformization identifies the two vertex copies and CM specialization with the specified Frobenius/Atkin–Lehner convention.

**Needed by:** [HE.2/quaternionic-reduction-specialization](../readmes/HeegnerPointEulerSystems.md#he-2-quaternionic-reduction-specialization).

### HE.0/R57: `NeronModelsAndSemistableAbelianVarieties:R11.4`

For Zhang’s definite quaternionic newform and the adjacent indefinite Shimura curve, expose the regular semistable Jacobian character lattice, graph monodromy pairing and component-group presentation with the exact level and localization hypotheses. It is used here to identify t_g(ℓ) over K_ℓ with the geometric component group and for the additive-prime component argument; the period/congruence identity itself is the cited declaration RankZeroOneBSD:BSD.3a/definite-congruence-period.

**Needed by:** [HE.6/ribet-takahashi-tamagawa-comparison](../readmes/HeegnerPointEulerSystems.md#he-6-ribet-takahashi-tamagawa-comparison).

### HE.0/R58: `EulerSystemsAndKolyvaginSystems:ES.1`

Zhang8.1–8.2 exact generic evaluation/prime selection and strict/relaxed duality over a finite field k₀ with two-dimensional surjective GL₂(k₀) residual representation: two independent global classes simultaneously detected, and nonzero classes in both signs with condition omitted at one prime. HE.6 verifies the actual V/k₀ local conditions and Heegner relation, so the Gross E[p]/F_p theorem is not this export.

**Needed by:** [HE.6/zhang-residual-local-pairing](../readmes/HeegnerPointEulerSystems.md#he-6-zhang-residual-local-pairing), [HE.6/zhang-two-class-prime-detection](../readmes/HeegnerPointEulerSystems.md#he-6-zhang-two-class-prime-detection), [HE.6/zhang-prescribed-ramification-class](../readmes/HeegnerPointEulerSystems.md#he-6-zhang-prescribed-ramification-class).

### HE.0/R59: `ArithmeticGaloisRepresentations:R01.3`

Artin conductor induction formula for the CM-character realization: conductor of Ind_GM^GQ ψ equals |D_M|Norm(f_ψ), at all primes including ramified/dyadic ones. Together with CM.4 identify it with the elliptic conductor N; HE needs only the divisibility |D_M| divides N.

**Needed by:** [HE.7/cm-heegner-field-disjointness](../readmes/HeegnerPointEulerSystems.md#he-7-cm-heegner-field-disjointness).

### HE.0/R60: `FaltingsFinitenessAndIsogenyTheorems:R28.4`

Integral GL₂-type image exports, to be owned with Serre’s theorems by the open-image Part II of FaltingsFinitenessAndIsogenyTheorems and routed through R28.4 until it exists (its brief plans Bogomolov’s homothety theorem on one route for abelian surfaces, and puts uniformity out of scope): Bogomolov/Serre homothety openness with bounded indices across coefficient primes; condition(?) absolute-irreducibility/self-twist dictionary via Faltings and CM; residual absolute irreducibility almost everywhere (Dimitrov in the Hilbert case), Clifford and trace comparison over the specified quadratic K. Exact consequences are C₂,C₃ of Nekovář6.1–6.2. Full GL₂ residual surjectivity is neither required nor asserted for CM.

**Needed by:** [HE.7/integral-tate-image-errors](../readmes/HeegnerPointEulerSystems.md#he-7-integral-tate-image-errors), [HE.7/integral-cm-prime-detection](../readmes/HeegnerPointEulerSystems.md#he-7-integral-cm-prime-detection).

### HE.0/R61: `SelmerIwasawaCohomology:L0`

Finite/p∞ Kummer exact sequences, finite finite-level Selmer groups, finite generation of Mordell–Weil and torsion-primary decomposition for the specified GL₂-type abelian variety A/F over K, not just an elliptic E/Q. The cofinal principal powers of a coefficient prime must suffice for the uniform-bound limit and Sha finiteness.

**Needed by:** [HE.7/exceptional-primary-sha-bound](../readmes/HeegnerPointEulerSystems.md#he-7-exceptional-primary-sha-bound), [HE.7/admissible-rm-kolyvagin-logachev](../readmes/HeegnerPointEulerSystems.md#he-7-admissible-rm-kolyvagin-logachev).

### HE.0/R62: `EulerSystemsAndKolyvaginSystems:ES.4`

Classical cardinality/square-index theorem of Kolyvagin Euler Systems, TheoremA quoted in Kolyvagin1991 p.95: #Sha divides d_E·[E(K):Zy_K]², d_E independent of K and supported outside the precisely defined full O_ℓ-linear Tate-image B(E) over Q_O=End_overlineQ(E)⊗Q. Distinguish the CM field from Q and full Tate from residual image, especially at3. The original proof, not obtained from the public Springer endpoint, must be read for this generic size export; Nekovář’s uniform exponent bound alone is insufficient.

**Needed by:** [HE.7/classical-square-index-error-bound](../readmes/HeegnerPointEulerSystems.md#he-7-classical-square-index-error-bound).

### HE.0/R63: `HilbertModularVarietiesAndShimuraCurves:R18.3`

For the definite quaternion algebra over Q of discriminant N⁻m and an Eichler order of level N⁺: the identification of its automorphic forms of trivial weight, norm-factor forms removed, with functions on the Shimura set X_m, compatibly with Hecke operators, so that the transfer of a weight-two newform by R17.3/global-jl and R17.3/multiplicity-one is an eigenfunction on X_m, unique up to a scalar, with values in the ring of integers. R17.3/definite-infinity assigns this identification to this layer.

**Needed by:** [HE.6/zhang-cohomological-congruence](../readmes/HeegnerPointEulerSystems.md#he-6-zhang-cohomological-congruence), [HE.6/zhang-jochnowitz-special-value](../readmes/HeegnerPointEulerSystems.md#he-6-zhang-jochnowitz-special-value).

### HE.7s/R1: `PadicMeasuresIwasawaAlgebras:L1`

Completed group-ring inverse limits and the actual compact Λ-modules H_k[n], retaining finite Δ and class-group p-parts.

**Needed by:** [HE.8/universal-norm-heegner-family](../readmes/HeegnerPointEulerSystems.md#he-8-universal-norm-heegner-family).

### HE.7s/R2: `PadicMeasuresIwasawaAlgebras:L5`

Compact inverse-limit lifting with compatible auxiliary norm maps; determinant/base-change exactness for a perfect ordinary Selmer complex, including non-flat specialization correction terms.

**Needed by:** [HE.8/universal-norm-heegner-family](../readmes/HeegnerPointEulerSystems.md#he-8-universal-norm-heegner-family), [HE.8/determinantal-heegner-element](../readmes/HeegnerPointEulerSystems.md#he-8-determinantal-heegner-element), [HE.8/determinant-characteristic-ideal-comparison](../readmes/HeegnerPointEulerSystems.md#he-8-determinant-characteristic-ideal-comparison), [HE.8/determinant-specialization-lattice](../readmes/HeegnerPointEulerSystems.md#he-8-determinant-specialization-lattice).

### HE.7s/R3: `PadicMeasuresIwasawaAlgebras:L4`

One-variable Weierstrass zero isolation, pseudo-isomorphism/characteristic ideals with ι, and the exact near-trivial specialization separation criterion used by CS via SU Lemma 3.2. Infinitely many accumulating evaluations alone do not justify an integral unit assertion.

**Needed by:** [HE.8/lambda-bottom-class-nontorsion](../readmes/HeegnerPointEulerSystems.md#he-8-lambda-bottom-class-nontorsion), [HE.8/lambda-adic-heegner-kolyvagin-system-and-theorem-B](../readmes/HeegnerPointEulerSystems.md#he-8-lambda-adic-heegner-kolyvagin-system-and-theorem-b), [HE.8/near-trivial-bottom-nonvanishing](../readmes/HeegnerPointEulerSystems.md#he-8-near-trivial-bottom-nonvanishing), [HE.8/determinant-characteristic-ideal-comparison](../readmes/HeegnerPointEulerSystems.md#he-8-determinant-characteristic-ideal-comparison), [HE.8/castella-sano-refined-equivalence](../readmes/HeegnerPointEulerSystems.md#he-8-castella-sano-refined-equivalence), [HE.8b/anticyclotomic-reverse-product-divisibility](../readmes/HeegnerPointEulerSystems.md#he-8b-anticyclotomic-reverse-product-divisibility).

### HE.7s/R4: `PadicMeasuresIwasawaAlgebras:L0a`

Continuous arithmetic anticyclotomic character spaces and evaluation with the chosen γ,u,h; the crystalline algebraic-Hecke characters α_m must retain infinity type (h(p−1)p^(m−1),−h(p−1)p^(m−1)). Separately export continuous nontrivial Γ≃ℤ_p characters tending to 1, with α≡1 modulo p^m, for CS §3.3–§3.4 at every unramified p. This sequence does not assert algebraic-Hecke origin or crystallinity at inert p.

**Needed by:** [HE.8/crystalline-near-trivial-character](../readmes/HeegnerPointEulerSystems.md#he-8-crystalline-near-trivial-character), [HE.8/near-trivial-heegner-specialization](../readmes/HeegnerPointEulerSystems.md#he-8-near-trivial-heegner-specialization), [HE.8/near-trivial-bottom-nonvanishing](../readmes/HeegnerPointEulerSystems.md#he-8-near-trivial-bottom-nonvanishing), [HE.8/near-trivial-tamagawa-stability](../readmes/HeegnerPointEulerSystems.md#he-8-near-trivial-tamagawa-stability), [HE.8/ordinary-local-specialization-defect](../readmes/HeegnerPointEulerSystems.md#he-8-ordinary-local-specialization-defect), [HE.8/determinant-specialization-lattice](../readmes/HeegnerPointEulerSystems.md#he-8-determinant-specialization-lattice).

### HE.7s/R5: `PadicHodgeRegulators:L3`

Ordinary filtration and unit root; integral family big logarithm with explicit finite cokernel and CH2018 Theorem 5.7 Heegner reciprocity, at the exact anticyclotomic coefficients and chosen lattice. Do not infer the full family law from a finite point formula. Certify the BCGS local invariant/unit-root normalization on the distinguished lattice, distinguishing full T/A invariants from the ordinary unramified quotient and reduction torsion.

**Needed by:** [HE.8/ordinary-stabilized-point](../readmes/HeegnerPointEulerSystems.md#he-8-ordinary-stabilized-point), [HE.8/crystalline-near-trivial-character](../readmes/HeegnerPointEulerSystems.md#he-8-crystalline-near-trivial-character), [HE.8/twisted-logarithm-index-formula](../readmes/HeegnerPointEulerSystems.md#he-8-twisted-logarithm-index-formula), [HE.8b/anticyclotomic-formulation-comparison](../readmes/HeegnerPointEulerSystems.md#he-8b-anticyclotomic-formulation-comparison).

### HE.7s/R6: `EulerSystemsAndKolyvaginSystems:ES.3`

The general Λ-adic derivative/finite-singular system with cyclic Galois tensor, actual coefficient quotients and change-of-generator functoriality. HE supplies the arithmetic family and verifies the relations.

**Needed by:** [HE.8/lambda-heegner-derivative-class](../readmes/HeegnerPointEulerSystems.md#he-8-lambda-heegner-derivative-class), [HE.8/lambda-finite-singular-relation](../readmes/HeegnerPointEulerSystems.md#he-8-lambda-finite-singular-relation).

### HE.7s/R7: `EulerSystemsAndKolyvaginSystems:ES.4`

BCGS Proposition 2.2.1 prime-restriction rigidity, Lemma 2.2.4 uniform stub structure and Theorem 2.2.2 exact paired Sha length, with finite DVR, p>3 for the Lemma 2.2.4/exact-length proof; Proposition 2.2.1 separately states p≥3, residual surjectivity and self-dual/cartesian hypotheses; also the rescaling-stable bounded-error variant used in Theorem 1.3.1. These generic proofs are owned here, not copied into HE.

**Needed by:** [HE.8/heegner-divisibility-profile](../readmes/HeegnerPointEulerSystems.md#he-8-heegner-divisibility-profile), [HE.8/arithmetic-rescaled-kolyvagin-bound](../readmes/HeegnerPointEulerSystems.md#he-8-arithmetic-rescaled-kolyvagin-bound), [HE.8/heegner-exact-sha-length](../readmes/HeegnerPointEulerSystems.md#he-8-heegner-exact-sha-length).

### HE.7s/R8: `EulerSystemsAndKolyvaginSystems:ES.8`

Height-one Λ-adic Kolyvagin specialization and uniform control errors, paired torsion and anticyclotomic functional equation. Export distinct clean Howard and weaker CGS/BCS residual branches; the latter has rational p-errors unless surjectivity gives integral control.

**Needed by:** [HE.8/lambda-heegner-derivative-class](../readmes/HeegnerPointEulerSystems.md#he-8-lambda-heegner-derivative-class), [HE.8/lambda-adic-heegner-kolyvagin-system-and-theorem-B](../readmes/HeegnerPointEulerSystems.md#he-8-lambda-adic-heegner-kolyvagin-system-and-theorem-b), [HE.8/weak-torsion-localized-divisibility](../readmes/HeegnerPointEulerSystems.md#he-8-weak-torsion-localized-divisibility), [HE.8b/anticyclotomic-euler-system-divisibility](../readmes/HeegnerPointEulerSystems.md#he-8b-anticyclotomic-euler-system-divisibility).

### HE.7s/R9: `HilbertModularVarietiesAndShimuraCurves:R18.1`

Admissible quaternionic CM moduli and component maps in CV-dynamics §§2.1–2.2, including the definite/indefinite datum and exact reciprocity action.

**Needed by:** [HE.8/joint-cm-equidistribution](../readmes/HeegnerPointEulerSystems.md#he-8-joint-cm-equidistribution).

### HE.7s/R10: `HilbertModularVarietiesAndShimuraCurves:R18.2`

Quaternionic CM reduction maps at the actual auxiliary supersingular places and compatibility with component/reciprocity maps in CV-dynamics Theorem 2.9.

**Needed by:** [HE.8/joint-cm-equidistribution](../readmes/HeegnerPointEulerSystems.md#he-8-joint-cm-equidistribution).

### HE.7s/R11: `HilbertModularVarietiesAndShimuraCurves:R18.3`

Definite finite double-coset realization and P-new vectors at the admissible level in CV §5; retain central character, stabilizers and nonexceptionality.

**Needed by:** [HE.8/definite-cm-character-period](../readmes/HeegnerPointEulerSystems.md#he-8-definite-cm-character-period).

### HE.7s/R12: `HilbertModularVarietiesAndShimuraCurves:R18.4`

Weighted P-new and ramified-prime degeneracy injectivity on the precise cuspidal quotient/vector in CV §§4.3–4.5 and §5. Arithmetic character/conductor projections remain HE-owned.

**Needed by:** [HE.8/indefinite-cm-character-point](../readmes/HeegnerPointEulerSystems.md#he-8-indefinite-cm-character-point), [HE.8/definite-cm-character-period](../readmes/HeegnerPointEulerSystems.md#he-8-definite-cm-character-period).

### HE.7s/R13: `GeometryOfNumbersAndQuadraticArithmetic:GN.4`

Extend beyond current real Lie-group Ratner nodes: over F_P, classify/average unipotent orbits in products of cocompact SL₂(F_P) quotients as CV-dynamics Theorem 2.29 (Margulis–Tomanov11.2/Ratner3); give twisted-diagonal stabilizers as Lemma 2.30 and partition/commensurability criterion2.31–2.35. Q_p is the directly referenced Ratner case; general finite F_P requires a precise acquired theorem, not extrapolation.

**Needed by:** [HE.8/joint-cm-equidistribution](../readmes/HeegnerPointEulerSystems.md#he-8-joint-cm-equidistribution).

### HE.7s/R14: `GL2AutomorphicRepresentationsAndTransfer:R17.3`

Jacquet–Langlands transfer and P-new test vectors with CV(H1),(H2), admissible definite parity and nonexceptionality. Retain local conductor conditions, not merely existence of a transferred representation.

**Needed by:** [HE.8/definite-cm-character-period](../readmes/HeegnerPointEulerSystems.md#he-8-definite-cm-character-period).

### HE.7s/R15: `GrossZagierAndArithmeticHeights:GZ.4`

The exact parallel-weight-two CM local sign formula used in CV Lemma 1.1, retaining N′ coprime to D and the moving P-character factor before stabilization.

**Needed by:** [HE.8/cm-generic-root-number](../readmes/HeegnerPointEulerSystems.md#he-8-cm-generic-root-number).

### HE.7s/R16: `KatoEulerSystems:L4`

Add Wüthrich 2014 Theorem 4/Proposition 8 distinguished E_• integral modular-symbol Tate lattice and étale isogeny comparison; also Theorem 13 integral Kato class and Theorem 3/16 reducible-residual integral divisibility, using IntegralIwasawaTheory L4 Ferrero–Washington. Do not export arbitrary-isogeny integral lattice equality or retain only a rational divisibility. HE uses the lattice comparison, BSD.7a the integral Euler-system branch.

**Needed by:** [HE.8/optimal-lattice-isogeny-comparison](../readmes/HeegnerPointEulerSystems.md#he-8-optimal-lattice-isogeny-comparison).

### HE.7s/R17: `AutomorphicCongruences:L5a`

BCS v2 Theorem 4.1.3/Corollary 4.1.4 two-variable ordinary/Greenberg four-term comparison (current stage locator4.2.1 is the anticyclotomic Euler-system bound); Lemma 5.1.1 Selmer restriction and Lemma 5.1.2 p-adic L-function factorization with compatible primitive periods and coefficient extension. The anticyclotomic return proof is HE.8b; completed L5b is not an input.

**Needed by:** [HE.8b/anticyclotomic-reverse-product-divisibility](../readmes/HeegnerPointEulerSystems.md#he-8b-anticyclotomic-reverse-product-divisibility).

### HE.7s/R18: `AutomorphicCongruences:L5w`

Wan2015 GU(2,2) Hilbert/quartic-CM congruence divisibility with all Fujiwara(H1)–(H3), residual restriction, ramification and period hypotheses of BCS Proposition 5.2.1. The p>3 restriction and p=5 exclusion remain until explicitly removed by an acquired source.

**Needed by:** [HE.8b/auxiliary-quadratic-field-verification](../readmes/HeegnerPointEulerSystems.md#he-8b-auxiliary-quadratic-field-verification), [HE.8b/anticyclotomic-reverse-product-divisibility](../readmes/HeegnerPointEulerSystems.md#he-8b-anticyclotomic-reverse-product-divisibility).

### HE.7s/R19: `AutomorphicPadicLFunctions:L3h`

Hsieh2014 TheoremB anticyclotomic toric μ=0 and the BCS Proposition 4.2.2 projection/comparison, at the exact ordinary irreducible branch and chosen primitive/imprimitive factors. Katz’s CM μ theorem for the Eisenstein branch is a different new-owner request.

**Needed by:** [HE.8b/bdp-function-convention-comparison](../readmes/HeegnerPointEulerSystems.md#he-8b-bdp-function-convention-comparison), [HE.8b/anticyclotomic-reverse-product-divisibility](../readmes/HeegnerPointEulerSystems.md#he-8b-anticyclotomic-reverse-product-divisibility).

### HE.7s/R20: `RankZeroOneBSD:BSD.7a`

Export the independent early CGS2025 TheoremsA/C anticyclotomic Eisenstein equality for E/ℚ with a rational p-isogeny of kernel character φ, p∤2N, K satisfying (disc),(Heeg),(spl), and φ|G_p≠1,ω, without the older (Sel) hypothesis. It may use only early HE.8 classes, never HE.8b equality or late BCGS/CS applications. Add the missing imaginary-quadratic elliptic-unit IMC owner (Rubin 1991/1994, Hida–Tilouine0.3, Hida 2010 μ=0) and integral Wüthrich KatoL4 suppliers before certifying this branch.

**Needed by:** [HE.8b/eisenstein-main-conjecture-adapter](../readmes/HeegnerPointEulerSystems.md#he-8b-eisenstein-main-conjecture-adapter).

### HE.7s/R21: `ArithmeticGaloisDuality:R02.4`

Local duality and exact Poitou–Tate with ordinary/finite/strict local conditions, integral finite cokernels and paired Selmer quotient lengths; retain real/Tate corrections when used by HE.7 imports.

**Needed by:** [HE.8/lambda-heegner-local-conditions](../readmes/HeegnerPointEulerSystems.md#he-8-lambda-heegner-local-conditions), [HE.8/ordinary-local-specialization-defect](../readmes/HeegnerPointEulerSystems.md#he-8-ordinary-local-specialization-defect), [HE.8/determinant-specialization-lattice](../readmes/HeegnerPointEulerSystems.md#he-8-determinant-specialization-lattice).

### HE.7s/R22: `ArithmeticGaloisDuality:D7`

Continuous derived Selmer complexes over Λ, perfectness under the stated finite cohomology hypotheses, duality and compatibility with derived specialization. Generic derived constructions are not recreated in the Heegner packet.

**Needed by:** [HE.8/strict-ordinary-selmer-complex](../readmes/HeegnerPointEulerSystems.md#he-8-strict-ordinary-selmer-complex).

### HE.7s/R23: `ModularIwasawaMainConjectures:L0`

Generic determinant and characteristic-ideal formulations for the exact ordinary Selmer complex, rank-one free rational factors and torsion cohomology. This is a formulation supplier, not a cyclotomic equality or proof of the inert anticyclotomic conjecture. For the integral anticyclotomic comparison use BCK Theorem 5.2 with its standing p>3 hypotheses; the CGLS weak-torsion p=3 rational comparison does not give an unrestricted integral export.

**Needed by:** [HE.8/integral-main-conjecture-index-square](../readmes/HeegnerPointEulerSystems.md#he-8-integral-main-conjecture-index-square), [HE.8/strict-ordinary-selmer-complex](../readmes/HeegnerPointEulerSystems.md#he-8-strict-ordinary-selmer-complex), [HE.8/determinantal-heegner-element](../readmes/HeegnerPointEulerSystems.md#he-8-determinantal-heegner-element), [HE.8b/anticyclotomic-formulation-comparison](../readmes/HeegnerPointEulerSystems.md#he-8b-anticyclotomic-formulation-comparison).

### HE.7s/R24: `NeronModelsAndSemistableAbelianVarieties:R11.2`

Actual rational component groups and p-primary local Kummer/Tamagawa comparison under sufficiently near-trivial unramified twists, as BCGS Lemma 1.2.8; distinguish geometric and residue-field points.

**Needed by:** [HE.8/near-trivial-tamagawa-stability](../readmes/HeegnerPointEulerSystems.md#he-8-near-trivial-tamagawa-stability).

### HE.7s/R25: `NeronModelsAndSemistableAbelianVarieties:R11.5`

Good ordinary reduction, ordinary unramified quotient and finite local comparison for CS Lemma 3.3.3; identify #Ẽ(F_v)[p∞] for both twist signs. Also export prime-to-residue-characteristic torsion injection into the finite reduction group over bounded unramified extensions for the CV tower torsion argument, for general abelian varieties.

**Needed by:** [HE.8/ordinary-local-specialization-defect](../readmes/HeegnerPointEulerSystems.md#he-8-ordinary-local-specialization-defect), [HE.8/relative-ring-class-tower-torsion-finite](../readmes/HeegnerPointEulerSystems.md#he-8-relative-ring-class-tower-torsion-finite).

### HE.7s/R26: `SelmerIwasawaCohomology:L3/iwasawa-descent`

The generic derived descent exists, but BCGS Theorem 1.2.7 needs the integral JSW specialization formula at (0,empty) local conditions with exact C², Tamagawa and H⁰ torsion factors. CS Proposition 3.3.2 needs strict all-p ordinary complex base change; these two interfaces are distinct. Certify the BCGS local invariant/unit-root normalization on the distinguished lattice, distinguishing full T/A invariants from the ordinary unramified quotient and reduction torsion.

**Needed by:** [HE.8/twisted-anticyclotomic-control](../readmes/HeegnerPointEulerSystems.md#he-8-twisted-anticyclotomic-control), [HE.8/determinant-specialization-lattice](../readmes/HeegnerPointEulerSystems.md#he-8-determinant-specialization-lattice).

### HE.7s/R27: `GrossZagierAndArithmeticHeights:GZ.9/bloch-kato-logarithm-of-heegner-class`

Existing finite weight-two logarithm comparison is imported. Extend GZ.9 to the actual Λ-adic family explicit reciprocity law CH2018 Theorem 5.7 with integral E_• normalization, finite regulator cokernel and the stated BDP coefficient ring; do not substitute a rational finite-level law.

**Needed by:** [HE.8/twisted-logarithm-index-formula](../readmes/HeegnerPointEulerSystems.md#he-8-twisted-logarithm-index-formula).

### HE.7s/R28: `SelmerIwasawaCohomology:L2/greenberg-condition`

Existing condition uses inertia-kernel Greenberg data. Certify the comparison with the image of H¹(Fil⁺) and with CS strict ordinary cochain cones, retaining H⁰/H² and finite local quotient terms rather than equating these conventions unconditionally.

**Needed by:** [HE.8/lambda-heegner-local-conditions](../readmes/HeegnerPointEulerSystems.md#he-8-lambda-heegner-local-conditions), [HE.8/strict-ordinary-selmer-complex](../readmes/HeegnerPointEulerSystems.md#he-8-strict-ordinary-selmer-complex).

### HE.7s/R29: `GrossZagierAndArithmeticHeights:GZ.5`

General F definite Waldspurger pairing for finite-order primitive ring-class characters of growing P-conductor, with CV central character and admissible local vector hypotheses. The existing GZ.9 Brooks unramified classical infinity-type formula is a near miss, not this supplier.

**Needed by:** [HE.8/definite-rankin-nonvanishing](../readmes/HeegnerPointEulerSystems.md#he-8-definite-rankin-nonvanishing).

### HE.7s/R30: `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`

Use upstream Chebotarev for finitely many prescribed simultaneous splitting/avoidance conditions in the auxiliary real quadratic F; no new upstream plan is proposed. HE verifies the BCS residual restriction and disjointness conditions. Also choose two nonsplit good-reduction places of distinct residue characteristics in the CV relative CM tower; combine finite avoidance with the nontrivial Frobenius class for K/F.

**Needed by:** [HE.8b/auxiliary-quadratic-field-verification](../readmes/HeegnerPointEulerSystems.md#he-8b-auxiliary-quadratic-field-verification), [HE.8/relative-ring-class-tower-torsion-finite](../readmes/HeegnerPointEulerSystems.md#he-8-relative-ring-class-tower-torsion-finite).
