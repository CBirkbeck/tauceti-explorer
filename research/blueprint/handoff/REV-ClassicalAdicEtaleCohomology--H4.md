# Handoff: REV-ClassicalAdicEtaleCohomology--H4

Issue #368. Reviewer: Claude (Opus 5.5), session `claude-t7fgMY`, 6 October 2026. Input: `BP-ClassicalAdicEtaleCohomology--H4` by Codex, session `codex-aFUJt5` (PR #6672). The review is finished; the verdict is **accepted** and is recorded in the packet's `review` object. The report is `research/blueprint/reviews/REV-ClassicalAdicEtaleCohomology--H4.md`.

## What was done

- All 39 nodes checked against the public sources and corrected in place; none added or removed. The 52 one-word excerpts are replaced by 81 literal ones. The packet's `review.checked` list says, node by node, what was verified and what changed.
- 9 baseline declarations confirmed at the pins; 5 pinned declarations added (`comap`, `comap_mem_spa`, `comap_preimage_rationalSubset_inter_spa`, `isOpen_val_preimage_rationalSubset`, `rationalSubset_image_mul_right`).
- 10 API items added, 1 API statement and 2 tests corrected; the suggested file has the matching declarations.
- Requests reduced from 15 to 11 and gaps from 7 to 6, because existing nodes of other packets supply several of the needs (details in the report, items 3, 4, 7 and 8).
- Source issue `E1` confirmed, corrected and renamed `E-H4-1` (its id collided with the H0–H3 packet); one misprint added as `E-H4-2`.
- `python3 scripts/check_blueprint.py` on the packet: 0 errors, 0 warnings. `research/blueprint/intake.py check-files` on the changed files: 0 problems.
- `lean-check` on the suggested file: exit 0, 61 warnings, all "declaration uses `sorry`". The shared build has the pinned Mathlib and a newer Tau Ceti checkout; the two signatures that need the pinned `Spa.Polydisc` module remain in comments and were elaborated against a scratch copy of that module's pinned source.

## What remains, for later jobs

1. **Reader document.** `research/blueprint/readmes/ClassicalAdicEtaleCohomology--H4.md` was not editable by this review and no longer agrees with the packet. The divergences are listed in the report under question 1.
2. **Huber's book.** Nobody has read Hub96 §§3.7–3.9 and 6.1–6.2 for this packet. The statements of 3.7.2, 3.7.3, 3.8.1 and 3.8.2 are those of the reviewed decomposition; 6.2.2 is Ito's Theorem 6.8; 6.1.1 is known through Mieda and ECD.
3. **H3:smooth-duality** (RT-AREA-etale/5): requested, not yet in the atlas.
4. **Lütkebohmert's Theorem 5.3 over a nondiscretely valued field**, in its local form. His Remark 6.7 (p. 211) asserts the generalisation without proof. Only the local form is needed.
5. **The characteristic-zero route of Huber 3.8.1** (purity 3.9.1(b)). ECD uses 3.8.1 only in characteristic p.
6. The requests to H0, H3, E1, A2, R2, SF.2 and EDC.2:trace-purity, as rewritten in the packet.

## Sources, for whoever continues

All public, with URLs and hashes in the packet's `sources`:

- Scholze's author PDF of 14 April 2026: the biduality theorem is **Theorem 25.1**, proof on pp. 159–160.
- Berkovich's IHÉS paper: read the page images, not the text layer; printed page = PDF page + 3.
- Lütkebohmert on GDZ: page text at `https://gdz.sub.uni-goettingen.de/fulltext/PPN243919689_0468/00000NNN.txt` with NNN = printed page + 4, and IIIF images at the URLs in the packet.
- Ito arXiv:2008.07794: K is algebraically closed throughout §6; B(a,b) p. 31, Theorem 6.8 p. 35, D(ε) p. 37, Example A.1 p. 47.
