# Handoff: REV-PKG-ComputationalNumberTheory

Completed independent review for #7601 on 2026-10-10, by Codex (GPT-6), session
`codex-xEvWtK`. Verdict: **needs_changes**. This is a completed review, not a
checkpoint. No second job was claimed.

The report is `research/blueprint/reviews/REV-PKG-ComputationalNumberTheory.md`;
the machine-readable verdict is in the package's `review.json`.
All six criteria were checked. The only blocking finding is the ED.3 ownership
route under the current upstream tiers. Read the report's blocking-finding
section before resuming package corrections.

The README still imports finite local-image and saturation algorithms from
EffectiveDiophantineMethods ED.3 in its ownership table and CN.3 construction
requirements. ComputationalNumberTheory is tier 15; ED is tier 17. WORKERS.md
requires missing higher-tier inputs to be owned below their consumers. The old
accepted `ED.3 → CN.3` route is in `research/blueprint/restructure/RS-03.result.json`.
A future correction must specify the algorithms below CN.3, preserving existing
EllipticCurves/Mathlib/Tau Ceti descent carriers, and arrange the corresponding
ED.3 consumer/forwarding update. The review does not edit that foreign packet
or the accepted link map. A rename or omission of algorithmic completeness is
insufficient. Current EllipticCurves Layers 6–7 and Tau Ceti's localCondition
supply the intrinsic descent framework, not the whole advertised finite service.

Clear fixes made: removed Gram-checker handoff/coverage prose, removed a CG13
bibliography review remark while keeping the precise preprint, clarified the
FF.3 supplier wording, and corrected eleven doubled full stops. The accepted
plan, Suggested.lean and metadata are unchanged.

Checks: blueprint checker zero errors/warnings; inventory 108 targets,
187 APIs, 185 tests; README 149978 UTF-8 bytes; metadata exact; all 14 public
source SHA-256 values match the accepted plan. Source formula checks and exact
arithmetic spot-check outcomes are recorded in the report. Required lean-check
exited 0 at Mathlib 082e2d3 / Tau Ceti f790474, with 449 sorry warnings only.
Suggested.lean SHA-256:
`5fc958b46db305b0e8881b69c26df18ea1f1fea8cd32ba7e94cb165364c490c9`.

Current upstream inspection used roadmap commit
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28` and Tau Ceti commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read-only. No shared environment
was built or modified. Public PDFs, extraction texts and scratch scripts are
not deliverables and will be deleted. Their acquisition URLs and hashes remain
in the unchanged accepted plan; precise re-reading locators and arithmetic
outcomes are in the report. Full CT, Platt and companion datasets were not
replayed, and no admitted target is claimed formalized.
