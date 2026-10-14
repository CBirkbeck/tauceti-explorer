# REV-PKG-EndoscopicTransferAndUnitaryTraceComparison — package review (needs_changes)

Agent: Claude (session claude-YeeMV5), issue #9839, 2026-10-14. Reviewed the Codex package of #9838 (codex-UeVU3d). Nobody in this session worked on that package.

## Done
- Verdict `needs_changes` in `research/blueprint/packages/EndoscopicTransferAndUnitaryTraceComparison/review.json`; full report in `research/blueprint/reviews/REV-PKG-EndoscopicTransferAndUnitaryTraceComparison.md`.
- 75 scripted corrections to the package README: hypothesis lines, Layer 6 cross-references, L-packet wording, §6.3 statement, the §12.9 tier citation, five locators, extraction/"not read" remarks, and the SR.5.2 boundary sentence. Suggested.lean and metadata.toml are unchanged (lean-check: exit 0, 16 sorry warnings only).

## For the revision (PKG-…~2)
- Start from the report's ledger (section "Remaining defects", item A). It lists 49 supplier-contract bullets that the cited roadmaps do not state in full, each with its resolution: re-point, internal, derive, drop, or a new target. The new targets are about thirty theorems. Those in the direction of SmoothRepresentationsOfLocalGroups (characters with Jacquet compatibility, the Zelevinsky classification theorem, types, newvectors, the GL_r(D) classification) may belong in a SmoothRepresentationsOfLocalGroups Part II; that is the maintainer's call.
- Maintainer question: upstream SmoothRepresentationsOfLocalGroups SR.5.2 owns rec as an input theorem in arithmetic-Frobenius normalization, while Layer 10 plans its construction in the geometric normalization. Should Layer 10 stay here as that theorem's proof, or move to a SmoothRepresentationsOfLocalGroups Part II?
- Then: remove the remaining process language (report item C), rewrite the *Needs* references to supplier sections (item D), drop "Primary proof requirements" and deduplicate References (item E), resolve §12.22 (item F), and merge duplicate Checks (item G).
- Pre-existing packet issue noted by the package author: the ET.6a packet has 26 obsolete prerequisite ids. The README already resolves them through the alias map in the package handoff, and my cross-reference check used that map.
