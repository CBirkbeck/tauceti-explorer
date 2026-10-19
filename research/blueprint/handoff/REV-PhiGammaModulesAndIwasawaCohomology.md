# Handoff: REV-PhiGammaModulesAndIwasawaCohomology

Issue #472. Reviewer: Claude, session claude-3oe87N, 19 October 2026. The review is complete and the packet is accepted with corrections. The full account is in [the review report](../reviews/REV-PhiGammaModulesAndIwasawaCohomology.md).

## Ownership: what moved and where

No notion moved down in this job. The review applied moves that had already happened.

- **PadicHodgeTheory package (16 October).** It moved PG.0–PG.3 and PG.6 material down. In the atlas, PG now imports these owner nodes:
  - PadicHodgeTheory.json: P7/cyclotomic-field-of-norms-interface, /phi-gamma-module-interface, /etale-realization-and-overconvergence, /herr-complex-interface, /plan/robba-ring-of-p-adic-field, /plan/robba-realisation-comparison, /plan/wach-dcris-comparison, P8/relative-local-systems-and-frobenius-modules and P8/relative-frobenius-cohomology-comparison.
  - PadicHodgeTheory--P7.json: P8/relative-all-module-bundle-b-pair-equivalence.
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory: R07.4/etale-phi-modules-cohen-ring and /etale-phi-modules-with-coefficients.
- **Node changes in PG.** Nine PG nodes are comparison receipts and twelve are narrowed (packet `restructure` entry 1).
- **Packaging.** When PG is packaged, cite PadicHodgeTheory §§1.4–1.5 and 4.1–4.5 and LocalGaloisDeformationRings §0.4 for this material.

## Open items for other roadmaps

These are packet `restructure` entries 2–4.

- **PadicHodgeTheory.**
  - Drop the legacy P7 stage requires on PG.3 and PG.6.
  - Repoint the --P7 packet's bare-stage PG citations to its own interfaces.
  - Remove the ids that two packets share.
- **Atlas nodes still missing.**
  - Wach existence, height and reconstruction (PadicHodgeTheory package §4.4).
  - Herr cohomology over Artinian coefficients (LocalGaloisDeformationRings §0.4).

  When these nodes exist, turn PG.6/wach-module, /wach-existence, /wach-height, /wach-reconstruction and PG.3/herr-ext into receipts.
- **Placement decisions for the maintainer.**
  - Kedlaya–Liu Witt-vector descent: probably PadicHodgeTheory P8, whose proofs use it.
  - (c,d)-pure local systems: PG or VectorBundlesAndIsocrystals VB4.

## Follow-up refinement (stages stay planned)

These are the 12 gaps in the packet.

- The trace estimates of Cherbonnier–Colmez §III.2, for integral overconvergent lattices.
- Universal-period H_K-acyclicity, for affinoid and integral Herr comparison.
- Integral dyadic descent.
- The residue constant C_p.
- The cochain-level Iwasawa comparison. CC 1999 Théorème II.1.3 states the degree-one isomorphism; its proof was not read.
- Berger Théorème A.3 and the LLZ 2010 good-basis proofs.
- KPX §5 uniform finiteness.
- The KPX Theorem 6.3.9 flattening.

## Notes for a later worker

The scratch scripts that rebuild the packet from `git show HEAD:` and re-render the reader were not kept. The reader is a deterministic rendering of the packet: node blocks, gaps, requests, the routed table and the references. If you edit the packet, re-render the reader from it rather than hand-editing.

The reader's escape rule for `src/markdown.js`:
- Escape `_` unless the preceding character is ASCII alphanumeric or `_`.
- Escape single `*`; keep `**`.
- Escape `$`.
- Escape `[` that would form a link to a non-anchor, non-URL target.
- Leave code spans, link targets and `<a id>` lines untouched.
