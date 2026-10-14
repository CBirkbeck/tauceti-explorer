# Handoff: independent R17.4 review

**Completed review, accepted after corrections.** Job
`REV-GL2AutomorphicRepresentationsAndTransfer--R17.4`,
[issue #9384](https://github.com/CBirkbeck/tauceti-explorer/issues/9384).
Reviewer: Codex (GPT-6), session `codex-SNvlIZ`; 2026-10-14.
Input: `631e908ca5ee09309bef9464da46c1abd873de60`.
Branch: `codex-SNvlIZ-review-9384`.
The input planner was Claude (`claude-aUA4oH`), not this reviewer.

The [review report](../reviews/REV-GL2AutomorphicRepresentationsAndTransfer--R17.4.md)
is the durable audit record. Packet, reader and suggested Lean file are updated
together. Twelve nodes remain: ten corrected, two verified; 29 API items,
17 definition tests, thirteen pinned baseline declarations, no new planets.
R17.4 stays **planned**, with two explicit gaps and nine supplier requests.
The pass is complete at target level; no formal implementation is claimed.

## Changes to preserve

- Geometric Artin reciprocity agrees with the actual R16.3 supplier; the
  arithmetic CFT map is explicitly inverted. The arithmetic WD degree is kept.
- Genericity preservation requires unitary input. The new Q₃(√3) example
  exhibits generic input with one-dimensional base change and corrects the
  tame-principal-series conclusion.
- Arbitrary split characters use Langlands quotients. Pair factors require
  a common real norm twist of unitary components; `(ν,1,ν⁻¹)` is the new
  nongeneric GL₃ test. Parameter APIs and cubic contragredient compatibility
  support downstream local comparisons.
- JPSS (14.2) retains its global scope and dual twisted L-functions. The
  all-place GL₂ converse sketch checks duals, real twists and convergence.
- Existing `Rep.mackeyDecomposition` and `Rep.indResAdjunction` replace the
  finite-group roadmap request. Do not plan induction or Mackey again.
- Source E19 is a published-2006 BH epsilon normalization error. Its corrected
  formula and additive-character scaling counterexample are in the packet,
  reader and review. The Steinberg root-number result itself is unchanged.

## Follow-up ownership and gaps

1. **Global Weil route:** current ClassFieldTheory Layer 11 supplies finite
   Artin reciprocity only. Assign a Part II/lower-tier owner for global Weil
   groups, arbitrary Hecke-character induction and all-place localization,
   plus the global Artin functional equation or equivalent monomial induction
   epsilon normalization. A proved direct automorphic-induction theorem with
   identical local contracts would be an alternative. Finite-image Galois
   induction and the λ-square product are insufficient for this GL₃ input.
2. **ET.6:** no packet exists. Its precise requested GL₃ LLC/pair-factor,
   duality, determinant, boundedness and Satake contracts remain conditional.
3. **Original proof:** the 1981 JPSS note and Mao–Rallis were not read; keep
   that distinct source gap. The modern route is audited subject to suppliers.
4. **Existing proposals:** retain the R17.4a split and AL.3 analytic ownership.
   Retarget R19.2's extraordinary cubic compatibility to the local/global
   nodes here; do not introduce a dependency from R17.4 to Carayol globalisation.
   Reconcile the older R17.3 arithmetic-normalization label on its next edit.

No upstream roadmap/library, atlas data, queue or other job's deliverable was
changed. Current upstream roadmap revision checked:
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti library:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Pinned declarations were checked
at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. All five source hashes match the
input. The cleared BH text was read in place, and no restricted content was
copied. The other source URLs and exact theorem/page locators are in the
packet and report; no scratch file is needed by the next worker.

Checks: blueprint validator 0 errors/0 warnings; source-issue/version checks
0 errors; suggested Lean elaborates with only twelve `sorry` warnings;
reader/packet/Lean inventory and whitespace/path checks pass. This worker
submits only this review and stops; it does not claim another job.
