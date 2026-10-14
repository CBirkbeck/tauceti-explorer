# Handoff: REV-PotentialModularityAndCompatibleSystems--R24.5

Issue #9400, Claude session `claude-EFl2bi`, 2026-10-14. This is a complete
independent review, **accepted after correction**. The work under review was
written by Codex session `codex-0Y1GxJ` (#9429, PR #9573). This pull request
changes only the four issue deliverables and this note.

What was done: every locator of the 30 reused R24.3 targets was checked in the
twelve public sources (hashes match), all 16 baseline declarations were read at
Mathlib 082e2d3, and every cited supplier node was resolved and read where it
matters. Nine targets were corrected in the packet's `importChecks` and in the
reader, which remain verbatim-consistent. Source issue E13 was added (KW I p.10:
Diamond's "i = j + 1 never occurs" fails at q = 2, p = 3; no stated result is
affected). Two coverage notes were also added. The suggested file is unchanged
and elaborates. The details are in
`research/blueprint/reviews/REV-PotentialModularityAndCompatibleSystems--R24.5.md`.

## Moves down (upstream tiers)

The roadmap is Caraiani–Newton tier 22. Its R24.5:operations generic
definitions are cited upward by lower tiers:

- WeightsInEtaleCohomology (tier 12): `weakly-compatible-system-rank-n`, `compatible-system-predicates`
- AutomorphicGaloisRepresentationsPartII (17): the operations stage, `compatible-system-predicates`, `polarized-system`, `character-system`, `linear-algebra-operations-on-systems`
- AutomorphicGaloisRepresentations (18): `character-system`, the operations stage
- GL2ModularityLifting (21): `compatible-system`, `rank-two-reducibility-independent-of-lambda`

When the lowest citing roadmap is packaged, it plans these notions and
R24.5:operations imports them. This packet's import contracts are the
specification to carry down.

## For the orchestrator

- Sync the R24.3 owner nodes, or the package README, with the R24.5 import
  checks, which are now the more exact statements of these 30 targets.
- The R23.1 owner should confirm that BCGP Proposition 9.1.12's totally real
  surjective-specialisation case is covered; the existing node is for an
  imaginary CM base.
- Nothing remains for this review. The open supplier work (R17.6 overlap
  lemma, R15.4 Savitt adapter, R19/R34.6 realisations, R01.x interfaces, the
  R23.4 extension for the full DP Theorem 1.11, and the Class field theory
  Part II proposal) is listed in the packet's requests and gaps.

Source copies and scratch logs are not retained; the hashes and locators are in
the packet.
