# Handoff: independent R17.5 review

Issue [#9385](https://github.com/CBirkbeck/tauceti-explorer/issues/9385); reviewer Codex, session `codex-4vHwNC`; branch `codex-4vHwNC-review-r17-5`; 14 October 2026. The [bot confirmed the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9385#issuecomment-6158636316). This reviewer did none of the original blueprint work.

The review is complete with **needs_changes**, not a checkpoint. The [report](../reviews/REV-GL2AutomorphicRepresentationsAndTransfer--R17.5.md) contains the counts, all corrections, baseline verification, source verdicts and next actions. The packet, reader and suggested file are corrected together. All 15 nodes have verdicts: 4 verified, 10 corrected, 1 unverifiable. Nine baseline declarations remain confirmed. No nodes were added or removed.

The most consequential changes are unitary/geometric LLC with an explicit dual adapter for arithmetic Frobenius in the residual/classical applications; U⁰ = O× and the missing valuation(u) = 1 in the Lean isolation witness; local twists instead of an unsupported global Weil carrier; a split-spectrum hypothesis in the Brauer reduction API; and descent up to conjugacy over arbitrary algebraically closed k. E16 and E17 are rejected source-error allegations; E18 is confirmed for Webb's prepublication remarks only.

Resume with the packet's exact gaps:

1. G1: closed-subgroup character extension and the topology needed in JL70 Lemma 12.5. GlobalNumberFields does not plan this harmonic-analysis theorem.
2. G2: preliminary Brauer/Hecke global functional equation before local ε existence, then the final product formula; repair the R01.2 proof order.
3. G3: projective Brauer Hom formula, projective lifting/vanishing, class count, and the precise projective-cover imports.
4. G4: modular Clifford and Isaacs's extension inputs with the strengthened Fong–Swan induction. Current InductionRestriction Layer 5 is Maschke only.
5. G5: finite splitting-field/simple-module descent up to isomorphism for arbitrary algebraically closed characteristic-p k. Finitely many displayed entries need not generate a finite field.
6. G6: independently read Tunnell (1981), pp. 173–175. The AMS endpoint returned HTTP 403 during this run; the original author hash and locators are preserved, explicitly uncollated by this reviewer. This prevents acceptance under the job's every-node verification criterion.

Both R17.3 gaps stay open; `closesGaps` is empty and supersessions are conditional. Preserve the R17.4a/AL.3b and JPSS boundaries and same-roadmap R16.3–R16.6 stage links. Existing upstream documents were read without running lake. Current upstream/library duplication checks and supplier-scope findings are in the report and packet `upstreamNotes`.

Checks: blueprint checker with pinned declaration index **0 errors, 0 warnings**; `lean-check` **exit 0**, 17 expected placeholder-proof warnings only; suggested file 415 lines, no placeholder data. Field consistency and whitespace checks pass. The review report contains all information needed for the next worker; no scratch file is required after submission.
