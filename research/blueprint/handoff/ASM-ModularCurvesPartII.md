# ASM-ModularCurvesPartII handoff

Job: ASM-ModularCurvesPartII · Refs #246

Agent: Claude (Opus 5.5), session claude-bGVvDJ, 14 October 2026. The claim bot confirmed this session's claim on #246 (comment 6165903325) before work began. This is a complete assembly submission, not a checkpoint.

## Delivered

- [`research/blueprint/readmes/ModularCurvesPartII.md`](../readmes/ModularCurvesPartII.md): the assembled roadmap document. It opens with purpose and end theorems, the base roadmap (TauCetiRoadmap ModularCurves) and exactly which of its layers are imported, a supplier table for every other owner, the out-of-scope owners and the downstream consumers, one set of conventions reconciled across the parts, and the construction order where layers interlock. Then the twenty layers R12.1–R14.6 in order (R13.4 as the interface of R13.4a and R13.4b), each with an introduction and all its targets: **160 targets** (all nodes of the four node-bearing packets), **348 API items, 205 unit tests, 86 planets**, every hypothesis, proof step, use, prerequisite, consumer, acceptance check and source locator. It closes with the supplier contracts (102, grouped by owner), the nine open proof obligations, the finite bad-level case list, paper routing, all 26 source corrections, notes for existing Tau Ceti roadmaps, the source register with versions and hashes, the 50 pinned library declarations, the requests routed to R13.4b that still need targets, a table of the roadmap's required checks and where they are tested, and a description of the suggested file.
- [`research/blueprint/suggested/ModularCurvesPartII.lean`](../suggested/ModularCurvesPartII.lean): the six part files joined into one file (1,192 lines) with one standard note, one import block and one namespace `TauCeti.ModularCurves`, ending with the proposed names of the API items and tests of every target whose carriers are not at the pins (156 targets).
- Reference repairs in two part packets (below), and this note.

## Which text governs

The packets are definitive. The reviews of R12.1, R13.3 and R14.3 each say their part reader lags the corrected packet (R12.1: the Weil-pairing sign, the SF.2 integration request and supplier routing; R13.3: whole-curve Tate flatness, the algebraization gap, the full-symbol equality, the six-vertical API, root equivalence and locators; R14.3: the Picard/Albanese quotient convention, the full-symbol lattice, the higher-weight boundary model, suppliers and locators). So the node sections are generated from the packets, not copied from the part readers, and none of that stale prose enters the document. The hand-written framing was written from the packets and reviews; it reuses the reviewed R13.4 interface checks, the R13.4b layer introductions and the R13.4b per-layer worked examples (all recomputed by REV-ModularCurvesPartII--R13.4b). For R13.4b–R14.6 the R13.4b packet's 35 dependency resolutions and its one dependency addition are applied in the rendered prerequisites, as its review requires.

A script (kept in scratch, not committed) checked that every packet field occurs in the document after undoing the Markdown escaping: 3,832 fields (ids, titles, statements, hypotheses, proof steps, acceptance checks, API names and statements, test names and statements, uses, locators, matches and external prerequisites), none missing; all 1,431 internal links resolve to the 186 anchors.

## Cross-part prerequisites

No packet cites a node id that does not exist. 37 (consumer, own-stage) citations used a whole layer of this roadmap instead of exact targets:

- 30 have consumers in the R14.3 packet. The R13.4b packet's accepted `dependencyResolutions` give their exact targets; the document applies them. The R14.3 packet is not a deliverable of this job (its queue outputs omit it), so it is unchanged; its next revision should materialize these 30 resolutions.
- 5 have consumers in the R13.3 packet and were already resolved by the R13.4b review; this job wrote them into the R13.3 packet (marked `materializedIn` in the R13.4b packet).
- 2 were unresolved anywhere: `R13.3/formal-level-cusp-charts` and `R13.4a/integral-coarse-curves` cited the layer R13.2. Both now cite exact targets (below).

The node graph over all six packets (stage citations expanded, resolutions applied) has no cycle, before and after the edits. At the level of layers the plan is not ordered: R12.3, R12.5, R12.6, R13.3, R13.4a, R13.4b and R14.1 form one strongly connected set, and R12.2 uses R13.1 and R13.2 uses R12.4. The document's "construction order" section gives the node-level order, and 36 citations of a later-numbered layer are flagged *(later layer)* where they occur.

## Packet edits

Both edited packets keep their review objects and verdicts unchanged and pass `check_blueprint.py` with 0 errors and 0 warnings.

**R13.3 packet** (recorded in its new `assemblyEdits` field):

1. `R13.3/formal-level-cusp-charts`: the layer citation R13.2 is replaced by `R13.2/gamma-level-structures`, `moduli-stacks-are-proper-flat-artin`, `coherent-cyclic-decontractions`, `refined-gamma-zero-moduli` and `contraction-maps-between-levels`.
2. `R13.4a/integral-coarse-curves`: the layer citation R13.2 is replaced by `R13.4a/deligne-rapoport-level-stack`, `R13.4a/standard-level-stack-identifications`, `R13.2/moduli-stacks-are-proper-flat-artin` and `R13.2/refined-gamma-zero-moduli`; and the statement's "level stack supplied by R13.2" now names its actual owner (𝒳_H of R13.4a for general open H, equal to R13.2's stack at the standard levels). This applies the R13.4a packet's fourth restructure entry and REV-ModularCurvesPartII--R13.4a's question 1.
3. `R13.4a/coarse-normalization-comparisons`: adds `R13.4a/affine-open-identification` and `R13.4a/prime-diamond-agreement` as prerequisites and a first proof step saying it collects their conclusions (same restructure entry and review question).
4. The five R13.4b-review resolutions for `R13.4b/generic-component-comparison` (R12.3, R12.6), `R14.1/analytic-comparison-of-correspondences` (R12.6), `R14.2/rational-coefficient-pairing` (R12.5) and `R14.1/degeneracy-maps-and-hecke-correspondence` (R13.2) are written into the prerequisites.
5. The four requests to this roadmap's own layers (R13.2, R12.3, R12.6, R12.5) are withdrawn, since every consumer now cites exact targets (as the R13.4b review did for the same consumers).
6. Source issues E1–E7 are renumbered **E301–E307** (and the one node reference, in the `tate-power-isogeny` source match, updated). The R14.3 packet numbers its findings E1–E3, so E1–E3 named two different findings in the register; REV-ModularCurvesPartII--R12.1 (question 4) and --R13.4b (question 1) asked for this. The R13.3 review object keeps its historical numbers: read its E2, E5, E6, E7 as E302, E305, E306, E307.

**Re-review.** Edits 2 and 3 change wording in a reviewed node (the owner of an input; a citing proof step), not any asserted property; the other edits are references. A light re-review of those two nodes is enough.

**R13.4b packet**: the R13.3 import record now carries the new SHA-256 (`2f2c4964…`) with the reviewed one kept as `sha256AtReview`; `inheritedSourceIssues` uses E301–E307; the five resolutions above are marked `materializedIn`; two `assemblyNotes` replace the one about the number clash.

R12.1, R13.4, R13.4a and R14.3 packets are unchanged.

## Notation reconciled

The document fixes one set of conventions (levels and the row action, the Weil-pairing sign e_N(τ/N,1/N)=ζ_N as corrected by the R12.1 review, the distinct moduli problems, stacks versus coarse curves, degrees, cusp widths and the Hodge frame, the Picard/Albanese Hecke conventions with A_f Albanese, cohomology, graphs, Taylor–Wiles data). Node texts are kept as reviewed; where they spell the same object differently the conventions section says so: Z/Q/C/H in the R12 and R13.1–R13.2 nodes; X_s(ℓ) for the normalizer curve in the R13.3-packet split-Cartan targets against X_s⁺(ℓ) in R13.4a; the abbreviations MC…, MF…, "the anchor" and "native". Assembly notes on eleven nodes point out the remaining cross-part couplings (the imported pairing perfection in `R14.2/rational-coefficient-pairing`, the X_s notation, the R13.4a/R14.1 and R13.4b/R14.1 interleavings, the two-part content of `R13.2/fixed-pairing-integral-components`, the R13.2/R13.4a normalization overlap, the R19.1 import of the Eichler–Shimura relation).

## Suggested Lean file

`lean-check research/blueprint/suggested/ModularCurvesPartII.lean` at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: exit 0, no errors, 83 `declaration uses sorry` warnings and no other warning. `scripts/check_sorry_data.py`: no sorry'd data definition. No language server, build, update or cache command was run. Changes relative to the part files:

- One namespace `TauCeti.ModularCurves`, matching the packets' API names; the R13.4b file's `TauCetiRoadmap.ModularCurvesPartII` namespace is dropped.
- The R13.4b file restated the R13.3 file's correspondence counts, degeneracy degrees and Fricke formula and a subset of the R14.3 file's algebraic core; each appears once (the R13.3 copies, whose Fricke involution is proved, and the R14.3 core with its fuller API), and the R13.4b-only items are kept: the split-Cartan ramification index and fibre genus, the norm-matrix determinant, and five extra tests.
- The R13.3 file's three numeral-only split-Cartan examples are dropped; the R13.4b review replaced them by the real-bodied `splitCartanRamificationIndex` and `splitCartanFibreGenus`, which are kept.
- `parabolicH1_map` had a `sorry` body in the R14.3 file (a sorry'd data definition); it now has a real body, the restriction of `b` to the images.
- `open AlgebraicGeometry` in the recognition criterion became `open _root_.AlgebraicGeometry`, needed once Tau Ceti's `TauCeti.AlgebraicGeometry` is imported in the same namespace.
- The long commented registries of the R13.4a and R14.3 files (statements and sources, duplicated from the document) are replaced by one closing list of proposed names per target; the statements are in the document.

## Restructuring proposals collected from the parts

1. **R13.4 is process-only** (R13.4 packet): keep the stable id as the interface of R13.4a and R13.4b, with no separate planning or planets; R12.3 depends on R13.4a, not on R13.4.
2. **R13.6 uses LPV.7, not Weights R34.3** (R13.3 and R13.4b packets): the upward prerequisite is replaced by the lower-tier LefschetzPencilsAndVanishingCycles LPV.7 semistable-curve targets; WeightsInEtaleCohomology imports the modular instance. The atlas still records `WeightsInEtaleCohomology:R34.3` as a requirement of R13.6; that edge should go.
3. **Split `R13.2/fixed-pairing-integral-components`** (R13.4a packet): the determinant extension to ℤ[ζ_N] (no analytic input) stays in R13.2; the geometric connectedness of the fibres moves to R12.4 or R12.6.
4. **Generic-fibre requests to R13.4b** (R13.4a packet): X_ρ(5)≅ℙ¹_ℚ (W3.6), the genera of X₀(4), X₀(9), X₀(25), X₀(49) and the fixed points of w₄₉ (ED.6(e)), the genus-zero coordinates of Caraiani–Newton §7.1.3 (IQ.4), and ED's generic comparison for its Cartan, S₄(13) and X₀(N)/⟨w_N⟩ curves. **Not yet planned:** the R13.4b packet imports only the three R13.3-packet R13.4b targets, which cover components, determinant data and cusp fields but not these rationality, genus and coordinate statements. The document lists them in "Requests from other roadmaps that need generic-fibre targets". A follow-up R13.4b refinement should add them as targets on the R13.4a carriers.
5. **Two general statements to SchemeAndStackFoundations** (R13.4a packet): `finite-normal-recognition` and `fibrewise-coarse-base-change` move to a SchemeAndStackFoundations Part II if one is opened; until then they stay in R13.4a.
6. **R13.3 cites the refined R13.4a targets** (R13.4a packet): applied by this job (edits 2–3 above).

Further proposals from the assembly:

7. **Atlas layer edges.** R13.5 and R14.1 require the aggregate R13.4 in the atlas, and R13.4 requires R13.4b, while R13.4b uses R14.1 targets, so the atlas layer graph has a loop that the target graph does not. Make R13.5 and R14.1 require R13.4a instead of the aggregate R13.4, matching their targets' prerequisites.
8. **Atkin–Lehner placement** (REV-…--R13.4a question 3): `R13.4a/split-cartan-quotient` and `R13.4a/atkin-lehner-quotient-curves` use `R14.1/exact-divisor-atkin-lehner`, which R14.1 builds on the R13.4a curve. No target-level cycle; if the layer loop matters, move the generic-fibre involution w_N into R13.4a.
9. **Normalization identifications** (REV-…--R13.4a question 2): `R13.2/refined-gamma-zero-moduli` and `R13.2/agreement-with-katz-mazur-schemes` state the normalization descriptions on the moduli side, and `R13.4a/standard-level-stack-identifications` states the identification with 𝒳_H and cites them. This is a restatement, not a conflict; at the next R12.1-packet revision the R13.2 statements can cite the R13.4a target for the 𝒳_H form, or drop it.

## Requests collected from the parts

The document's "Supplier contracts" section lists all 102 exact contracts with their consumers: TauCetiRoadmap ModularCurves 51, SchemeAndStackFoundations 10, TauCetiRoadmap ModularForms 10, TauCetiRoadmap StableReduction 7, AlgebraicModuliForArithmeticGeometry 4, AbelianSchemesAndArithmeticModuli 4, NeronModelsAndSemistableAbelianVarieties 4, EtaleDualityAndPerverseSheaves 4, TauCetiRoadmap AlgebraicTopology 3, TauCetiRoadmap JacobianChallenge 2, and one each to FiniteFlatGroupsAndIntegralPadicHodgeTheory, TauCetiRoadmap AlgebraicCurves and TauCetiRoadmap FuchsianOrbifolds. It takes the R12.1 and R13.4a requests, the R13.3 requests for R13.3/R13.4a consumers, and the reviewed R13.4b list for R13.4b–R14.6 (which supersedes the R13.3 and R14.3 requests for those layers; the two the R13.4b review withdrew as redundant stay withdrawn). Those needing an owner's attention:

- **SF.3**: the trace f_*Ω¹_X→Ω¹_Y on regular differentials for finite maps of smooth projective curves in characteristic zero (R12.5). Neither the SF.3 packet nor the SchemeAndStackFoundations package states it (REV-…--R12.1 question 1); if SF.3 does not take it, plan it at R12.5.
- **SF.5**: the projection formula and numerical degree for curve cycles on a product of proper curves (R14.1/projective-boundary-hecke-and-degree).
- **SF.1**: the étale-local structure of DM stacks over their coarse spaces and quasi-coherent cohomology through flat covers (R13.4a); the SF.1 packet is still partial.
- **AbelianSchemesAndArithmeticModuli A2 / AlgebraicModuli A0-extension**: the relative curve norm and canonical principal polarization over ℤ[1/N] (R14.2), also recorded as a gap.
- **EtaleDualityAndPerverseSheaves EDC.6**: the integral complex comparison for curve traces; EDC.6 targets exist but none of their packets is accepted, so the request stays at layer level (REV-…--R13.4b question 4).
- **AlgebraicModuliForArithmeticGeometry R09.5**: the tame pseudo-reflection/completion criterion, an additional request beyond R09.5's planned targets (REV-…--R13.3).

## Open obligations carried forward

The nine gaps of the R13.4b packet (the union of R13.3's three and R14.3's six, with the tree gap narrowed by the R13.4b review) are in the document's "Open proof obligations": wild level-dividing 2/3 coarse models; the relative curve norm and polarization; the integral cuspidal-symbol realization; the higher-weight integral boundary and lattice range; the deep inputs of Serre's S-arithmetic congruence kernel theorem; the tree fundamental edge (Serre's segment-amalgam theorem, which ReductiveGroupsPartII uses but does not state) and congruence-invariance inputs; the integral quaternionic pivot J′_(pq); further Ihara consumer ranges; and the post-pin Tau Ceti group-ring locality to integrate when the pin moves.

The R14.3 packet still needs, at its next revision: the 30 resolutions written into its prerequisites; the `modular-amalgam` proof steps 1–2 narrowed to the imported RG2.2/AA.4 targets (the document shows them as imported steps). The R13.3 packet's `R14.2/rational-coefficient-pairing` proof steps still re-prove the perfection that `R12.5/perfect-hecke-pairing` supplies (the document carries an assembly note); trim them at its next revision.

## Source issues

All 26 are in the document: E101–E114 (R12.1), E301–E307 (R13.3, renumbered), E115 (R13.4), E401 (R13.4a), E1–E3 (R14.3). All are confirmed by their reviews. Ids are now distinct roadmap-wide.

## Upstream notes for the maintainer

From the R12.1 packet: ModularCurves 5C lists three external comparison contracts for Y(ρ) and says no roadmap owns them; this roadmap plans all three at R12.4 (Layer 0E does not state the first). ModularCurves 2E's Weil-pairing normalization gives e_N(τ/N,1/N)=e^{2πi/N} on ℂ/(ℤ+ℤτ). From the R14.3 packet: R19.1 should import the weight-two special-fibre Eichler–Shimura relation from R14.6 (RT-AREA-langlands-2/9). Bakker–Tsimerman's published PDF at the recorded R12.1 URL returned 404 at review; E111/E112 are confirmed against arXiv v2 and need collation with the Annals text before they are sent anywhere.

## Checks run

- `python3 scripts/check_blueprint.py --index <pinned declarations.tsv>` on all six part packets: 0 errors, 0 warnings each.
- `lean-check` on the joined suggested file: exit 0, only `sorry` warnings (83); `scripts/check_sorry_data.py`: passes.
- `python3 research/blueprint/intake.py check-files` on the five changed paths: no problems.
- Reader integrity: 3,832 packet fields present, 1,431 internal links resolve, no unescaped emphasis risk.
- `git diff --check`: clean.

## Where to resume

Next is the independent review of this assembly, then the package (PKG-ModularCurvesPartII), which should take the README targets from this document and the compact subset of the joined Lean file. Before packaging, the owners of items 2, 4 and 7 above and of the SF.3 contract should act. Scratch files (generator, join and integrity scripts) are not needed: the document and Lean file are the deliverables, and every decision is recorded here.
