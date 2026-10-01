# REV-RT-RS-05

Independent verification of the red team RT-RS-05 (Codex, session `codex-rtOQ9t`, PR #5577) on the restructuring
proposal RS-05 (adic spaces, perfectoid spaces and diamonds), for issue #4392.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- RS-05 (Codex `codex-c83e7a`);
- its review REV-RS-05 (`cc-442dc5`);
- the red team.

The finding cites no work of mine. One related piece of my work: my fix to RS-27 (#5573) relies on RS-05's assignment of
ordinary stackification to DiamondsAndVStacks D0. This finding concerns VS4 and does not touch that assignment.

**Result: the one finding is confirmed, high.**

## What I read

- **The proposal.** `RS-05.result.json`, the VS4 and VS5 layer records, and `RS-05.md`, the VS4 row of the
  retained-layer table and the overlap rows for VS4 and VS5.
- **The atlas.**
  - The VS4 and VS5 stage texts.
  - The packet nodes `VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects` and
    `VS5/ula-equals-admissibility`.
- **The source.** Fargues–Scholze, *Geometrization of the local Langlands correspondence*, from
  <https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf>, 356 pages, SHA-256 `9ab9efbd0df251bf…`, read on 1
  October 2026. I read:
  - Theorem V.4.1 (p. 177) and its proof (p. 179);
  - Theorem V.7.1 (p. 183) and its proof (p. 184);
  - Propositions VII.7.4 (p. 273) and VII.7.9 (p. 275).

## The finding

**/1 (high): VS4 conflates compactness with the ULA criterion.** RS-05 keeps for VS4 "compact objects of finite HN
support and perfect compact-open invariants". The source has two separate criteria:

- **Compactness (V.4.1, and VII.7.4 for D_lis).** An object is compact when every stratum restriction is compact, that
  is, in the thick closure of the c-Ind_K Λ with K pro-p, and the object vanishes on almost all strata.
- **ULA (V.7.1, and VII.7.9 for D_lis).** An object is ULA when every M_b^K is perfect.

**The counterexample is right.** On the degree-0 stratum of Bun_{GL_1} over Q_5 with Λ = F_3, the generator
c-Ind_{1+5Z_5} F_3 is compact. Its invariants are F_3[Z × F_5^×], which is infinite-dimensional, and since K is pro-5
they are not perfect.

**Only RS-05 is wrong.** The VS4 stage and its packet node state V.4.1 correctly, and VS5 states V.7.1. The fix should
change only the two RS-05 files, as the red team says.
