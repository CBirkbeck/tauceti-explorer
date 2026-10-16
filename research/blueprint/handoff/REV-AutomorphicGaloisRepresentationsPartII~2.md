# Handoff: REV-AutomorphicGaloisRepresentationsPartII~2

Issue #10008. Claude, session `claude-4kbXWw`, 2026-10-16. This is a finished review, not a checkpoint. It replaces the earlier checkpoint handoff of this job by codex-P5lc4w, which gave no verdict.

## Outcome

The plan is **accepted**, and the packet's `review` object names `independent-review-REV-AutomorphicGaloisRepresentationsPartII~2`. Packet status is now `complete`. The [report](../reviews/REV-AutomorphicGaloisRepresentationsPartII~2.md) lists every check and correction.

Main corrections:

- **Dual normalization.** Shin's and Caraiani's L_n applies rec to the contragredient (Shin §2.3 p.10; Caraiani ANT Theorem 1.1 pp.1597–1598; CH p.5). A source representation R_ℓ(Π) is therefore attached, in the AG2.0 sense, to Π^∨. This is fixed in the AG2.5 dictionary node and in two proof steps.
- **Caraiani numbering.** Caraiani's "Proposition 5.8" is Lemma 5.7 and Theorem 5.8 in arXiv v1. Two contracts and request 20 are fixed.
- **New source record.** A record for the published Caraiani author copy was added.
- **Locators and matches.** Sixteen further contracts had locator or match slips, now fixed.
- **Source issues.** All 16 are confirmed; EAG27-1 is added.
- **Lean names.** Five theorems in the suggested file are renamed to the packet's API names. It elaborates with placeholder-proof warnings only.

## For the maintainer

Gap 18 is the only open integration step: install the importChecks contracts, the parent moves and the five exclusions over the AG2.0 and AG2.6 part packets, and redirect the six external prerequisites of IG.7 (two targets) and PL.2 (one target) to IHG.3 Layer 3b. The report's "Questions for the orchestrator" give the details.

The executable probe in the [revision-2 handoff](BP-AutomorphicGaloisRepresentationsPartII~2.md) still reproduces the current difference, 129/54 against 124/46 with 35 semantic contract differences, after this review's corrections.

The L_n correction should also be checked against the upstream README in TauCetiRoadmap pull request #1006.

## Nothing left for a worker in this job

No scratch file is needed to resume. Sources were read from the URLs and hashes recorded in the packet; the cleared ACC+, LTXZZ and Pilloni PDFs were read in place and not copied.
