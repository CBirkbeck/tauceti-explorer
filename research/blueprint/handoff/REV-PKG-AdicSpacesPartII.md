# REV-PKG-AdicSpacesPartII — handoff

Codex session `codex-Mqtbvk`, 2026-10-09. Issue #7598. Completed independent
correcting review; verdict **needs_changes**, not a checkpoint. See the review
report and package review.json for the six checks and concrete defects.

## Submission provenance

The issue was available when selected from the manager's priority list. The bot
confirmed this session's claim at 15:06:52 UTC (issue comment 6083603377), then
another submission marked the issue finished at 15:08:03 UTC. The current base
already includes the package and prior accepted review (#8011 and #8016).
This submission therefore needs the maintainer's attention under WORKERS.md's
rule for a repeated completed job. Do not claim a new job on this session's behalf.

## Applied repairs and evidence

- Removed duplicate F0.36, F0.39 and R3.37 entries, quoted source phrases and
  clear process residue; repaired numbered-target references.
- Corrected R5.19's current-library boundary: `IsCompactModule.t2Space` already
  supplies Hausdorffness; flatness is additional. This is in current Tau Ceti
  a91d3aaf, not in the f790474 prototype baseline.
- Restored R5.35's finite-pseudobasis Banach-density assertion, coordinatewise
  variant and infinite-pseudobasis counterexample; added CHJ §6.3, p. 53.
- Corrected the R5.43 public locator to Scholze–Weinstein §2.4, pp. 19–20.
- Replaced root Mathlib import with individual modules, without changing
  mathematical declaration signatures. Removed duplicate closing-list numbers
  and the incorrect claim that every listed target has its statement in README.
- Final lean-check: shared Tau Ceti f790474 / Mathlib 082e2d3; exit 0,
  912 sorry warnings and no other diagnostics. 221 examples; 332 distinct
  targets in the closing inventory of missing full signatures.
- Packet checker: zero errors/warnings, 537 nodes, 73 gaps, 22 requests,
  eight stages and zero closed stages. Packet unchanged. Intake file check
  and whitespace check pass.

## Resume the package revision

The report inventories 307 title-only lemma targets by layer. Rewrite their
exact statements and hypotheses, and turn API names into concise mathematical
contracts. Reorganise the README to fit the explicit 200 KB cap without
truncating these specifications. Retain the six moved-down targets F0.64,
F0.65, R2.88, R3.73, R5.43 and F1.77; their ownership prevents upward-tier
citations. Retain the anchor §0.5 import instead of re-planning strong
noetherianness of fields.

Resolve the inherited gaps, especially R5.36's descent argument: R5.35's
infinite-pseudobasis counterexample prevents assuming unrestricted Banach
density. An invalid proof input does not establish that the theorem is false.
Other concrete gaps and incomplete source locators are listed in the report.
Keep source passages out of all repository documents. Huber 1996 and
Faltings–Chai were not consulted; neither is cleared by the library index.
Read current upstream roadmaps and library again before adding targets.

Public texts used for the sampled source checks are arXiv:1211.6357v2,
arXiv:1507.04875v2 and arXiv:1910.05934v1; their locators are in the report.
No scratch files are required by the next worker.
