# BP-EulerSystemsAndKolyvaginSystems--ES.0~5 — maintainer-directed revision (round 5)

Issue #10988. Worker: Claude (Opus 5.5), session `claude-NFofpe`, 19 October 2026. Branch `claude-NFofpe-BP-EulerSystems-ES0-5`. The bot confirmed the claim (comment 6273672618). This is a complete planning pass, not a checkpoint. It claims no implementation.

## Starting point

The stall detector opened this round while the third review's needs_changes verdict was the latest. REV-EulerSystemsAndKolyvaginSystems--ES.0~4 then accepted revision 4 at target level (PR #10998, 17:50Z). That review left no objection of its own; it listed five gaps and eleven supplier contracts as the continuation.

Two other records bear on this part:

- **The whole-roadmap packet** (`EulerSystemsAndKolyvaginSystems.json`) was accepted by REV-EulerSystemsAndKolyvaginSystems~2 earlier the same day.
  - It imports this part's nodes by id, pinned at the 89-node revision-3 file, and adds 27 targets of its own.
  - In `assembly.importedNodeCorrections` it records confirmed corrections to this part's nodes. The part did not carry 24 of them.
- **Requests from other roadmaps.** Sixteen requests address ES.0–ES.7.

So this round keeps every node and statement of revision 4, and its review object, and does what was still open:

- applies the confirmed corrections that the whole-roadmap review recorded against this part, after checking each against its source;
- removes the forward layer dependencies and a stage cycle;
- applies the GENERALITY rule to the sixteen incoming requests, answering each with exact node ids and never re-planning a target the whole-roadmap packet already has;
- consumes open upstream pull requests and current TauCetiRoadmap main;
- narrows the gaps that these suppliers now cover.

The accepted `review` object is REV~4's and is left unchanged for REV-EulerSystemsAndKolyvaginSystems--ES.0~5 (#10992).

## What changed

### Confirmed corrections applied (22 nodes touched)

- **ES.1/selmer-field-saturation (LTXZZ E21, E22).**
  - I read the maintainer-cleared Inventiones copy in place, without saving text: Lemmas 2.3.4–2.3.5 and the proof, printed pp.127–128.
  - E21: the published proof of 2.3.5(b) identifies End(R̄)⊗_{𝔽_ℓ}k with d copies of End(R̄). For k ≠ 𝔽_ℓ it is the sum of the Frobenius twists. The criterion therefore now asks for Hom over 𝔽_ℓ[Γ_F], equivalently against every twist.
  - E22: the saturation statement takes S free over O_λ/λ^{m−m′}, the form the abundance argument uses.
  - New acceptance controls test both corrections.
- **Published LTXZZ pagination** in reducibility-depth, abundant-tuples and ES.4/abundant-localization. The source id is now `ltxzz-published`. Each page was checked in the cleared copy: pp.126, 127–128, 130–131, 134, 135.
- **ES.0/hypotheses-mr2004 (source issue E4).** The arbitrary-subquotient consequence of MR04 Lemma 3.5.2 is removed from the proof, the API item `invariants_eq_bot` and the acceptance checks. It is replaced by the coefficient-ideal statement: (H.1) and (H.3) give H⁰(T/IT) = H⁰(T^*[I]) = 0. The residual argument is spelled out: a trivial T/mT would put Hom(Gal(ℚ(μ_{p^∞})/ℚ), 𝔽_p) inside the group that (H.3) kills.
- **ES.0/non-example-inadmissible.** The false remark that core rank rests on Lemma 3.5.2 is gone. The Rubin comparison is now an ES.4 application, not an input, so the edge from ES.4/rubin-hypotheses is removed.
- **ES.4/variant-bounds (E912).** Rubin's 1999 draft, IX.3.3 on p.137, annihilates by the order of m·c_K. I re-read it: for c_K = 0 that factor is 1, so the Selmer group would be forced to vanish, which cannot be right.
  - The node now states the published Theorem 9.3.3 complementary ideal ((M):a₂)a₁, with zero-class, primitive and bounded-divisibility controls.
  - The published page locator (pp.179–180) is the whole-roadmap review's reading. I did not view the published page.
- **ES.5/structure-theorem.** MR04 Theorem 4.5.6, p.49, read in this round, puts primitivity on both branches. The κ₁ = 0 lower bound is now guarded, with the ℤ/p² non-primitive control.
- **ES.4/nekovar-all-prime-descent.**
  - The Proposition 6.4.3 pairing step now cites ES.4/maximal-order-evaluation-bound from the whole-roadmap packet; it requires finite pairing modules, by E907.
  - The CM data come from HE.1 and the norm, congruence and Euler-system relations (Nekovář Propositions 4.8, 4.9 and 4.13, pp.24–26) from HE.2. HE.7 is no longer an input; see *Cycle removed* below.
  - The explicit constants 2C₀+2C₁+4C₂+4C₃+C₅+C₆+21·ord_𝔭(2) and 4C₀+…+38·ord_𝔭(2) were re-checked against §§7.4–7.6.
- **ES.4/rubin-hypotheses.** A ℤ_p(1) acceptance control was added. REV~4 had already made the irreducibility correction in other words.
- **Not applied, already fixed by REV~4:** rubin-hypotheses (V irreducible), exterior-bidual (the non-zero-divisor guard) and the Lean-prototype sentence of the Nekovář node.

### Layers

- ES.0/hypotheses-mr2004 used ES.1 Kolyvagin primes, and ES.0/hypotheses-mr2016 used ES.1 conductor ideals. ES.1/rubin-prime-selection used ES.4/rubin-hypotheses and ES.3 derivative classes.
- Six nodes now sit in ES.1: the two hypothesis records, their implications and the three worked examples. ES.1/rubin-prime-selection now sits in ES.4. The ids are unchanged, and the move matches the whole-roadmap packet's `importedStageAssignments`.
- No node now depends on a later layer. Planets per layer are 4/5/3/5/5/5/4/6, at most six.

### Cycle removed

- ES.4/nekovar-all-prime-descent cited the stage HeegnerPointEulerSystems:HE.7, whose nodes cite ES.4. It now cites HE.1/HE.2.
- ES.0/example-elliptic now takes its Kummer and Weil-pairing inputs from Tau Ceti EllipticCurves Layers 2 and 7, with ArithmeticGaloisDuality §D7.6 for local duality of abelian varieties. It no longer cites HE.7.
- The CA.7 and HE.7 requests are withdrawn from this part.
- A stage-graph audit over all packets found no node cycle and no new stage cycle.
  - Every newly added stage edge lies inside the large pre-existing stage SCC. Its endpoints were already mutually reachable through other roadmaps, as before this round.
  - The direct ES.4 ↔ HE.7 cycle is gone.

### Prerequisite refinements

Prerequisites now point at the whole-roadmap targets that make these proof sketches into nodes:

- ES.3/derivative-local-properties → derivative-classes-unramified, local-lifts, key-relation;
- ES.3/congruence → key-relation;
- ES.4/variant-bounds → derivative-classes-unramified;
- ES.4/howard-descent-with-errors → twist-error-constants, error-tolerant-chebotarev, self-dual-module-induction, rank-one-from-nonzero-class;
- ES.4/abundant-localization → abundant-tuple-existence.

### Requests from other roadmaps (GENERALITY)

These sixteen requests are in the new top-level `incomingRequests` and in the reader section *Requests from other roadmaps*.

- **Met (12).** Most are met by whole-roadmap targets at the requested generality:
  - Zanarella's primitivity equality: p > 4, H.0–H.5 for (T,F) and its dual, 𝓛 ⊇ 𝓛_s(T). Self-dual-divisibility-profile and self-dual-structure-theorem; checked against arXiv:1908.09197v1 pp.18–20.
  - BCGS Proposition 2.2.1, Lemma 2.2.4 and Theorems 2.2.2 and 1.3.1. Self-dual-divisibility-profile, self-dual-structure-theorem and uniform-near-trivial-bound; checked against arXiv:2312.09301v2 pp.15–20.
  - Zhang Lemmas 8.1–8.2: residual-two-class-detection; checked against pp.234–235.
  - Castella–Hsieh §7: the ring-class definition and derivative nodes, and rational-anticyclotomic-descent under Hypothesis (H); I read §§7.1–7.5 of the 2022 author copy.
  - The other met requests are answered by this part's own ES.1–ES.4 nodes, and for the HE.7 bounded-denominator descent by selected-bounded-descent.
- **Partly met (1).** HE.0 → ES.2: the Heegner normalization dictionary is HE's own verification.
- **Routed to ES.8 (1).** The Λ-adic derivative system.
- **Not planned (2).**
  - The Kings–Loeffler–Zerbes Beilinson–Flach classes: constructing arithmetic classes is outside this roadmap.
  - Kolyvagin's square-index Theorem A: the source is not publicly available. The gap is recorded in the whole-roadmap packet.

### Upstream consumed

These are recorded in the new `upstreamImports`, in the reader and in a new `upstreamNotes` entry.

- **ArithmeticGaloisDuality PR #858, head 567ff2b209** (was 9fcc0f88cf).
  - New at this head: the defined finite-module local Tate pairing (§R02.4.2), the local-condition menu (§D7.7.1) and the finite-field Greenberg–Wiles dimension formula with its strict–relaxed bound (§R02.5.1).
  - Already present at the old head, but recorded by REV~4 as O-adic only: §§D7.3–D7.5 state admissible coefficients, perfect amplitude, compact Shapiro, compact support and derived Poitou–Tate duality over complete noetherian local rings with finite residue field.
  - New prerequisites:
    - ES.0/selmer-length-difference → §R02.5.1. The finite-module Greenberg–Wiles formula is exactly its length identity, since length_R X = log_{#k}#X; I checked the sign convention.
    - ES.1/transverse-duality → §R02.4.
    - ES.7/vertical- and horizontal-determinantal-systems → §§D7.3/D7.5. They apply factorwise to the finite group rings, which are products of complete local rings.
    - ES.0/example-elliptic → §D7.6.
- **SelmerIwasawaCohomology PR #869, head 691599e986** (was 964eaa8434). The changes are test-level only; the narrowed L2 request remains open.
- **ClassicalArithmeticCompletion is on TauCetiRoadmap main (337f5042f1).** §§7.21, 7.49 and 7.56 supply maximal orders. They do not supply the local hereditary structure.

### Gaps narrowed

- **General coefficient Selmer duality.** Only the H¹-level adapters for compact non-finite coefficients over general R remain: canonical H¹ with quotient and Cartier-dual carriers, duality compatible with propagation, the change-of-condition sequence, the canonical-condition cocycle formula at p, and the LTXZZ finite-torsion criterion. The L2 request text says exactly which items AGD now supplies.
- **Nekovář maximal-order input.** The lemma itself is planned (whole-roadmap ES.4/maximal-order-evaluation-bound). Only the Curtis–Reiner local facts remain: heredity, the simple-factor decomposition, and the maximal order of a local division algebra. This is the ClassicalArithmeticCompletion Part II request in the whole-roadmap packet. Curtis–Reiner was not read.
- **Geometric carriers.** These now come from HE.1/HE.2 and EllipticCurves.

## Counts and checks

- 93 nodes, none added or removed: 30 definitions, 13 constructions, 34 theorems, 7 lemmas, 6 applications, 3 comparisons. Also 289 API items, 154 unit tests and 37 planets.
- 26 baseline declarations, 16 supplier requests (was 11), 5 gaps (two narrowed), 16 incoming requests, 4 upstream-import records, 16 sources (two added: `ltxzz-published` and `rubin-es-2000`, as recorded in the whole packet).
- All eight stages are planned; none is closed.
- `scripts/check_blueprint.py` with the pinned declaration index: 0 errors, 0 warnings.
- `scripts/check_sorry_data.py`: passes.
- `research/blueprint/intake.py check-files` on the deliverables: 0 problems.
- **Dry atlas assembly**, with this part added as a promoted packet (`build.assemble` with a patched `load_promoted`; nothing written). Revision 4 assembles with 2 skipped cyclic links, HE.7 → ES.0 and HE.7 → ES.4. Revision 5 assembles with 0 skipped links: 5,740 stages and 15,167 stage edges. Its new stage edges come from ArithmeticGaloisDuality R02.4/D7, HeegnerPointEulerSystems HE.1/HE.2 and Tau Ceti EllipticCurves Layers 2 and 7; the edge from ClassicalArithmeticCompletion CA.7 is dropped.
- **Lean.** `lean-check` (Mathlib 082e2d37e8, Tau Ceti pin): exit 0, 27 `declaration uses 'sorry'` warnings, nothing else. The suggested file is unchanged, since none of its declarations is affected.
- **Reader.**
  - It is regenerated by a per-node renderer that reproduces 90 of the 93 revision-4 node blocks exactly. The other three differed only by a doubled final period in a *Uses* line, now fixed.
  - Sections that should not change (Representative Lean signatures, Pinned baseline, ES.2, ES.6, Source findings) are byte-identical. All 93 node blocks match the packet and sit in their layers.

## What remains

- **ES.0/ES.1/ES.4–ES.5.** The narrowed L2 request.
- **ES.4.** The ClassicalArithmeticCompletion Part II local maximal-order facts, and the HE.1/HE.2 dictionaries.
- **ES.6/ES.7.** The L6 Part II and I.7 Part II requests. The L2 archimedean and localization items for the determinantal adapter.
- **Lemma-level refinements.** These are listed per layer in `coverage`.
- **Source access.** Kolyvagin's 1990 article (gap 1). The published Rubin pp.179–180 were not viewed in this round.

## For the maintainer

- **The package PR is built on a stale import.** PKG-EulerSystemsAndKolyvaginSystems (#11030, PR #11051) packages the whole-roadmap packet's 151 targets. That packet imports the 89-node revision 3 of this part. The package README therefore has none of REV~4's four ES.7 targets (vertical and horizontal determinantal systems, basic Euler systems, derivative surjectivity), which close the existence step of the unconditional class-group equality. It also lacks REV~4's fifteen corrections and this round's changes. The package review (#11034) should reconcile against the current part.
- **The whole-roadmap packet is now stale against this part.**
  - Its `assembly.imports` hash and `nodeCount` (89) are out of date.
  - Its `importedNodeCorrections`, field additions, prerequisite additions and removals, and stage assignments for this part are now applied here. Their replace strings no longer match, and they can be dropped at its next revision.
  - Its HE.2 prerequisite of ES.4/nekovar-all-prime-descent had no request entry; this part now has one.
- **Bare-stage citations.** GeneralizedHeegnerCycles GH.6 cites the bare stage ES.5; HeegnerPointEulerSystems HE.4–HE.8 and RankZeroOneBSD BSD.7a cite bare ES stages. The incoming-request table names the exact nodes they should cite. GH's Castella–Hsieh descent is in ES.4, not ES.5.
- **ES ↔ HE at roadmap level.** This part, like the whole-roadmap packet, takes the CM data from HE.1/HE.2, which do not depend on ES. The package instead states that data as hypotheses with no HE edge. Decide one convention at packaging.
- **A correction to the REV~4 record.** REV~4 recorded AGD #858 §§D7.4–D7.7 as O-adic scope. §§D7.3–D7.5 are stated over complete noetherian local rings. Only §§D7.7.1–D7.7.2 are O-adic.

## Notions moved

None between roadmaps. Within this roadmap, seven nodes changed layer (see *Layers*), keeping their ids.

## Sources read in this round

All of these are cited by locator only; nothing was copied. Downloads stayed in the scratch directory, which is deleted when the run ends.

- Zanarella arXiv:1908.09197v1 §§2.2–2.3, pp.12–21 (fingerprint 00d91f8d…).
- Burungale–Castella–Grossi–Skinner arXiv:2312.09301v2 §§1.3, 2.2, pp.15–20 (e575367a…).
- Castella–Grossi–Skinner arXiv:2303.04373v2 §§6.1–6.4, pp.21–24 (5046d757…).
- Castella–Hsieh author copy of 2 July 2022, §§6.1–7.5, pp.26–38 (5c85ea3c…).
- Zhang, CJM 2 (2014), §8.1, pp.234–235 (698eb8a6…).
- Nekovář, CM-points author copy, §§3.1, 4.8–4.13, 6.1–6.4, 7.2–7.6 (05c8debf…).
- Mazur–Rubin 2004 authors' copy, Theorem 4.5.6, p.49 (4cc432d0…).
- Rubin 1999 draft, IX §3, p.137 (de47655d…).
- LTXZZ maintainer-cleared Inventiones copy, pp.126–135, read in place.
- Upstream READMEs at the heads above (SHA-256 in `upstreamImports`): ArithmeticGaloisDuality §§R02.4–R02.5 and D7.3–D7.7; SelmerIwasawaCohomology (diff against 964eaa8); ClassicalArithmeticCompletion §§7.21, 7.49, 7.56.
