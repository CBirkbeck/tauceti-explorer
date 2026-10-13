# Handoff — REV-EtaleDualityAndPerverseSheaves--EDC.5

Reviewer: Claude (session claude-cIgQD1), 2026-10-13. Issue #9380. The work under review is
BP-EtaleDualityAndPerverseSheaves--EDC.5 (session claude-4vCUBq).

## Done

The review is complete, with verdict **accepted**. The packet, reader and suggested file were corrected in place:

- 29 nodes: 15 verified, 14 corrected, 0 added. Two API items, one gap and 28 superseded-draft mappings were added, and
  E16/E17 were confirmed.
- `python3 scripts/check_blueprint.py` reports 0 errors and 0 warnings.
- `lean-check` at the pins reports no errors; its only 48 warnings are for admitted proofs.
- `scripts/check_sorry_data.py` passes.

Every correction, with its reason, is in `research/blueprint/reviews/REV-EtaleDualityAndPerverseSheaves--EDC.5.md`.
The ones that change mathematics:

- the natural-truncation form of Deligne's formula now carries its degree condition A ∈ D^{≤−d−1}(U), since BBD 2.2.4
  is a truncation relative to the boundary;
- smallness now includes the semismall inequality on the dense stratum;
- the costalk condition forces K ∈ D^{≥a−dim X} (new API item `perverseGEExt_isGE`);
- the IC product formula requires an irreducible product.

## For the next workers

- **EDC.4 round:** drop the 48 draft EDC.5 nodes and EDC.5 from the scope. `supersededDraftNodes` in the EDC.5 packet
  maps every draft id, the 28 API-lemma drafts included, to its replacement.
- **Consumer repointing (GS0, IG, SF.0):** see question 2 of the review report.
- **HodgeStructuresPartII H.5:** cite `EtaleDualityAndPerverseSheaves:EDC.5/intermediate-extension-low-degree-cohomology`
  for the H¹ comparison across a normal-crossings boundary.
- **Open, not EDC.5's to plan:** the five SF.2 requests; the gaps for the trait-relative t-structure, O_C/p models,
  relative ULA, shtuka compactifications, stacks, perfect schemes, and (new) the non-noetherian and solid coefficients
  GS0 asks for.
