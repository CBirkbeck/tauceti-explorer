# Handoff: independent review of Berkovich motives

Job `REV-DESIGN-MotivesAndAlgebraicCyclesPartII`, issue #3577; Codex session `codex-iXxSqq`; 19 October 2026. **Completed and accepted.** The input design was by session `codex-kJCITL`, commit `f156f1da1`.

The packet has all 79 individual verdicts: 70 verified and 9 corrected. The [review report](../reviews/REV-DESIGN-MotivesAndAlgebraicCyclesPartII.md) records every correction, source scope, baseline evidence and validation. The reader and roadmap definition agree with the corrected packet. The suggested Lean file needed no change and elaborated through `lean-check` at the pins, with six proof-placeholder warnings only.

The main mathematical correction is the rational mapping shift in BM.10: Map(M(X)(−j),Z)_Q is K(X)_Q^(j)[−2j], hence π_i=K_{i+2j}(X)_Q^(j). The P¹ weight-one check catches the former unshifted formula. New source finding E6 records the missing shift in the inspected Scholze preprint and author copy, p. 57. E1–E5 are independently confirmed. The journal version was inaccessible and is not covered by those verdicts.

Other corrections narrow compact-assembly generation, require both strictly totally disconnected algebras in the profinite-set equivalence, add explicit closed-disc/tree prerequisites, remove an early Tate formula, allow nonseparated étale finite-fibre spaces in cancellation, clarify CD's transfer-free coefficient range and include finite-extension Artin generators in the Laurent-series argument. No new node, ownership move or duplicate upstream target was introduced.

There is no unfinished review work or scratch dependency. The next programme work is fulfillment of the 32 supplier requests and ownership resolution of the four recorded gaps:

- BM-G1: general integral KH cdh descent and formal-model comparison; the live height-one-localized Part II does not provide it.
- BM-G2: valuation-ring K invariance/negative K and smooth-completion K/KH comparison; the live formal K/Euler Part II does not provide these contracts.
- BM-G3: full geometric algebraically closed field K-rigidity, beyond the henselian L.2 request.
- BM-G4: any future RigDA equivalence needs a separate source-checked owner; it is not asserted here.

The refined M.5a request additionally exposes the positive odd characteristic 2-primary transfer-free bridge. CD Corollary 5.5.7 assumes characteristic zero or invertibility of 2; Corollary 5.5.5 is a with-transfer comparison. The presentable enhancement and full comparison remain requested, not certified by those triangulated statements alone.

All 13 layers remain planned, none closed; `complete` means the finished target-level pass. No staged closure or implementation claim was promoted. The review used public PDFs and the maintainer-cleared BLR copy read in place, with original formulations throughout. No source file or passage survives in the repository. Current upstream/library checks found no overlap requiring a new plan. No second job is claimed in this run.
