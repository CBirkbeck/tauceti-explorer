# REV-DESIGN-PadicDifferentialEquationsAndRigidCohomologyPartII

Independent review of the new roadmap *P-adic differential equations, rigid cohomology and p-adic weights, Part II: PBQ filtrations and minimal slopes* (design job `DESIGN-PadicDifferentialEquationsAndRigidCohomologyPartII`, Codex, PR #10688). Reviewed by Claude, session claude-EWNTYZ, on 2026-10-19. The design was done by a different agent.

**Verdict: accepted.** The plan is right once the corrections below are made: every node is verified, corrected or added, every baseline citation is confirmed, and the open requests and gaps are recorded honestly. The questions for the orchestrator are at the end.

## What was checked

- **Sources.** All five sources were opened at every node's locator, and their SHA-256 hashes match the packet:
  - Tsuzuki, arXiv:1910.03871v3, read in full;
  - D'Addezio, arXiv:2012.12879v4, §§4.1–4.4, with the overlined hull formulas checked in the arXiv TeX source because pdftotext drops the bars;
  - Chiarellotto–Tsuzuki, Doc. Math. 16, §§2, 4 and 5;
  - Ohkubo, arXiv:1809.04065v1, §§1–2, 5, 7–10 and 12;
  - Abe–Esnault, author PDF, §§2–3.

  Kedlaya, arXiv:math/0303382v3, Theorem 1, was added as a sixth source for the affine-line reduction. Every `match` had simply repeated the node statement. Each was rewritten in the reviewer's own words to say what the locator states. No source text was copied.
- **Baseline.** All 8 `baseline.declarations` were read at Mathlib 082e2d37e8. They exist with the stated content:
  - `LinearMap.quotKerEquivRange`;
  - `Representation.averageMap`, `averageMap_invariant`, `averageMap_id`;
  - `LinearMap.trace`, `LinearMap.trace_one`;
  - `Padic.norm_p_pow`;
  - the class `WittVector.Isocrystal`.

  No citation was removed. The 41 parent nodes cited exist and are accepted in the parent packets. Their statements were read against each use.
- **Closure, granularity, API, tests, planets.** These were checked node by node. `scripts/check_blueprint.py` reports 0 errors and 0 warnings, both with and without the declaration index. Each layer has at most 6 planets.
- **Suggested Lean file.** It elaborates with `lean-check` at Mathlib 082e2d3 / Tau Ceti f790474: exit 0, with eight placeholder-proof warnings only. It was not changed. The targets the review added have no carriers at the pins, so they stay README targets.
- **Reader and roadmap definition.** Every node section was re-rendered from the corrected packet. The renderer first reproduced all 66 original sections byte for byte, and the tail sections likewise. The stage descriptions of the roadmap definition were regenerated from the packet in the same way.

## Counts

| | Before | After |
| --- | --- | --- |
| Nodes | 66 | 70 (4 added) |
| Review verdicts | — | 25 verified, 41 corrected, 4 added |
| API items / unit tests | 51 / 51 | 60 / 58 |
| Requests | 7 | 5 |
| Gaps | 3 (G1–G3) | 3 (G1, G3, G4; G2 closed) |
| Source issues | 31 | 35 (all confirmed) |

## Main corrections

1. **Missing generic-field carrier.** Tsuzuki's curve theory (§§3.3–3.8) works over the completed generic field E_η of a smooth affine curve lift, which has residue field k(C), and over the local fields E_α. The plan stated everything over the Laurent Amice field. It then measured curve PBQ "at the completed generic point" without defining that field or proving the generic case of the splitting theorem. The review made these changes:
   - Added the construction **MS.0/curve-generic-field** (Tsuzuki §3.1, §3.3, Proposition 3.6).
   - Extended generic-solutions, bounded-quotient, pbq, pbq-quotients and unit-root-tensor to E_η and E_α, as Tsuzuki states them.
   - Added the E_η case of **bounded-splitting**: Tsuzuki Theorem 3.10, through Lemma 3.11, E_η = Ê^perf_η ∩ E_α.
2. **Bounded base change, and G2 closed.** The node cited Proposition 3.14/Corollary 3.15 for finite coefficient extension and for "completed perfect/algebraic residue carriers". The source actually proves the generic-to-local comparison E_η ⊂ E_α. It does so by an argument that works for any extension of complete differential fields sharing a coordinate: finite-dimensional subspaces carry the product topology. The node is restated in that form. It covers E ⊂ E_L, E_η ⊂ E_α, and the finite unramified extension of generic fields of a finite étale cover. The last case proves the pullback half of **finite-etale-pbq** directly. That closes former gap G2 and bypasses the circular proof of Tsuzuki Lemma 3.31 (E12). **pbq-filtration-base-change** is restated as Tsuzuki Theorem 3.21 accordingly.
3. **Opposite rank bound.** The node is used on two carriers. Lemma 4.2.7 of D'Addezio covers the k(t) generic pair; Tsuzuki Theorems 2.13–2.14 cover the Laurent pair. The node now states both. It gives the inequality from injectivity and the equality from surjectivity, and needs only φ-structures. The parent's Laurent reverse-filtration node (RD.1/generic-slope-decomposition-and-descent (c)) was added as a prerequisite. The node cited before is the k(t) one.
4. **Requests for material proved in Part II's own sources.** Three requests to the parent asked for results that Tsuzuki proves himself. They are replaced by owned nodes:
   - **MS.2/dagger-section-intersection**: Tsuzuki Lemmas 3.1–3.2, with the module version in the proof of Lemma 3.33.
   - **MS.0/fixed-field-normalisation**: Tsuzuki Lemma A.1(1)–(2), the value-group normalisation used for the rank-one twist (E25).
   - **MS.6/padic-coefficient-objects**: Tsuzuki §§7.1–7.3 and Appendix B, covering L-structures, the Q̄_p 2-colimit, Q̄_p-rank, constant-field pullback and pushforward, and fibres.

   The part of the RD.0 request about D'Addezio's A_n models (routine localisation and completion algebra) was dropped. So was the RD.3 request for separating functions on curves. The RD.3 Katz–Crew request was sharpened to what remains after the fixed-field normalisation.
5. **Étale affine-line reduction.** The node claimed a finite étale map onto a nonempty open of A¹. D'Addezio's reduction needs a finite étale map from a dense open of the curve onto A¹ itself, because MS is proved only for objects over A¹. Kedlaya 2005 Theorem 1 gives that, over any field of characteristic p, by sending the boundary to infinity. The statement is corrected and Kedlaya is added as a source. Kedlaya's theorem has no owner, so it is recorded as **gap G4**. The node is off the main curve route.
6. **Wrong locators and attributions.**
   - generic-solutions: §3.2 → §3.3, Definition 3.5.
   - pbq-quotients: Tsuzuki has Lemma 3.17, not Proposition 3.17.
   - pbq-filtration-base-change: Theorem 3.21, not Proposition 3.21.
   - log-growth: Ohkubo §2.1 starts on p.11, not pp.9–11.
   - log-growth-comparison and log-growth: Tsuzuki and Ohkubo locators were merged under one source id; they are now separate entries.
   - finite-field-inputs: "Theorems 7.18–7.19, p.37" are Tsuzuki's, not Abe–Esnault's.
   - docile-lefschetz: "Lemma 4.4.2" is D'Addezio Theorem 4.4.2, p.19.
   - bounded-splitting: now cites Tsuzuki Theorem 3.10 and CT11 Theorem 4.1, p.46.
7. **Docile Lefschetz statement.** The node required an algebraically closed field while also saying "any base tuple". Abe–Esnault Remark 2.5 allows any base tuple, so the restriction is removed. The node also carried the curve hypothesis although it concerns varieties of dimension ≥ 2. Its statement and acceptance disagreed on the curve condition; both now use "complete intersection of ample divisors in good position with respect to Z".
8. **Hypotheses.** The curve hypothesis had been attached to every node of MS.3 and MS.5.
   - The local E† nodes of MS.3 (local-saturation, quasi-saturation, pbq-submodule-slope, saturated-quotient, quasi-saturated-rank, local-graded-recovery, local-reconstruction) now carry the local hypothesis.
   - The variety-level nodes (global-saturation, saturation-transport, global-saturated-quotient, dagger-hull, minimal-slope-property, ms-reductions) now carry a smooth-variety hypothesis.
   - The pushforward clause of saturation-transport is not in Tsuzuki Proposition 5.6. Its match says so and gives the justification: finite étale pushforward is exact and matches sections and top quotients.
9. **Convention note.** Ohkubo Definition 5.10 counts the zero module as PBQ; Tsuzuki excludes it. The pbq node now says which convention is used.

## Source issues

All 31 recorded issues were checked at their locators and **confirmed**. Each entry carries the reviewer's reason in its `review` object.

- **E1–E26 (Tsuzuki) and E27–E30 (D'Addezio).** These agree with the reviewed paper extractions. E27, E28 and E30 were rechecked in the arXiv TeX source. For E29, an explicit element of A_n shows that the compactness bound fails: ū_n^j is not in pA_n but has norm p^(−j).
- **E31 (Ohkubo Proposition 5.9).** Confirmed: boundedness means M⁰ = 0, not M⁰ = M.

Four further Tsuzuki misprints were added, with `known: new` (none is in PAPER-TSUZUKI-23):

- **E32:** "Proposition 3.10" for Theorem 3.10, in the proof of Theorem 3.19.
- **E33:** z_{i,s} for z_{i,1}, and "Lemma 2.9" for Proposition 2.9, p.9.
- **E34:** a tensor power for a direct sum, in the proof of Theorem 2.14.
- **E35:** "Corollary 6.5 (1)" for case (i), in the proof of Corollary 6.8.

## Baseline citations removed or fixed

None removed or replaced: all 8 are correct at the pin. No Tau Ceti declaration is cited.

## Nodes added (each marked `addedBy`)

| Node | Kind | Source |
| --- | --- | --- |
| MS.0/curve-generic-field | construction (planet) | Tsuzuki §3.1, §3.3, Prop. 3.6 |
| MS.0/fixed-field-normalisation | lemma | Tsuzuki Lemma A.1(1)–(2) |
| MS.2/dagger-section-intersection | theorem | Tsuzuki Lemmas 3.1–3.2; proof of Lemma 3.33 |
| MS.6/padic-coefficient-objects | definition (planet) | Tsuzuki §§7.1–7.3, Appendix B |

## Questions for the orchestrator

1. **Requests to an upstream-bound parent.** The parent has an open Tau Ceti pull request (#1002). The five remaining requests to its stages are:
   - RD.0: Ohkubo's extended logarithmic Robba carrier;
   - RD.1: de Jong's bounded-disc/bounded-Robba submodule comparison;
   - RD.3: the general-coefficient Katz–Crew–Tsuzuki correspondence;
   - RD.4 and RD.6: the Legendre–Kummer example's inputs.

   These are precise and in the parent's direction, but the parent package does not contain them. Should they be absorbed by the open parent PR, or turned into Part II targets when this roadmap is packaged? The review converted only the requests whose content is proved in Part II's own sources.
2. **The `known` field of E1–E30.** It cites the atlas extractions ("Previously recorded in PAPER-…"), a convention used in about 1,400 entries across the atlas. `scripts/errata.py` treats every `known` value other than `new` as "already corrected in print". These findings would therefore be filed as corrected in print, which they are not.
3. **G4.** Kedlaya's finite étale covers of affine space in positive characteristic have no owner in the atlas. Only the alternate affine-line reduction needs them, so a foundational algebraic-geometry roadmap could own them.
