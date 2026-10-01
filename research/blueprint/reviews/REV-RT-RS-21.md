# REV-RT-RS-21

Independent verification of the red team RT-RS-21 (Codex, session `codex-a71f92`, PR #5579) on the restructuring
proposal RS-21 (smooth local representations and GL₂ automorphic representations), for issue #5113.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- RS-21 (Codex `codex-c83e7a`);
- its review REV-RS-21 (`cc-39fac3`, PR #4657);
- the red team.

Neither finding cites work of mine.

**Result: both findings confirmed, both medium.** Each is an unassigned owner, not a lost target or a cycle.

## What I read

- **The proposal.** `RS-21.result.json`: the SR.5, R16.2 and R16.5 layer records, every owner record mentioning
  Whittaker, co-Whittaker, conductor or newvectors, and the links SR.5 → L3 and AL.3 → R16.5.
- **The atlas.**
  - The stage texts of SR.5, R16.2, R16.5, AL.0, AL.3, AF.0–AF.5 and AutomorphicCongruences L3.
  - A search of every non-Tau-Ceti stage for essential vectors, newvectors and Fourier–Whittaker expansions.
  - The AutomorphicLFunctionsAndLocalFactors packet, which has no AL.3 nodes, its AL.3 gap and its requests.
- **The graph.** I applied every accepted restructuring to `data/atlas.json` (`scripts/restructure.py`) and checked
  the paths the fixes depend on.
- **Sources, read on 1 October 2026.**
  - Fouquet–Wan, arXiv 2107.13726v3 (<https://arxiv.org/pdf/2107.13726v3>): Appendix A, Propositions 6.3, 6.8 and 6.9,
    pp. 76–78.
  - Cogdell, *L-functions and converse theorems for GL_n* (<https://people.math.osu.edu/cogdell.1/pcmi-www.pdf>):
    Theorem 1.1 (p. 7) and §2.2.2 (p. 20).

## The findings

- **/1 (medium): the integral essential-vector comparison has no owner.**
  - **What L3 asks for.** L3 asks SmoothRepresentationsOfLocalGroups for "essential vectors" and must prove what FW
    Appendix A needs.
  - **What it needs.** Proposition 6.9: at the conductor-level U, the invariants π(ρ)^U are free of rank 1 and
    specialise isomorphically. This holds under the minimal-lift hypotheses.
  - **What RS-21 records.** SR.5's owner record covers derivatives and co-Whittaker families only. R16.2 owns the
    field-valued GL₂ newvector theorem. Neither gives the integral statement.
  - **The fix.** The red team's direction is right: R16.2 → SR.5 would close a cycle, since SR.5 → R16.2 is an edge. I
    also accept a narrower repair. L3's own text keeps "the specific compatibility squares and hypotheses required for
    ... FW Appendix A", and R16.2 already reaches L3. So the GL₂ minimal-lift case may be recorded as L3's explicit
    obligation, with general integral essential vectors for GL_n left to a smooth-local owner. Either way the owner
    must be recorded.
- **/2 (medium): the general GL_n Fourier–Whittaker expansion has no owner.**
  - **Who needs it.** AL.3 promises the global cuspidal unfolding, and Cogdell's unfolding begins by substituting the
    expansion of Theorem 1.1, whose convergence is absolute and uniform on compact sets.
  - **Who might own it.** No owner record or stage provides it:
    - AF.3 stops at constant terms, cuspidality and rapid decay;
    - SR.5 is local;
    - the AL packet leaves AL.3 undecomposed.
  - **R16.5's position.** R16.5 calls its GL₂ expansion "new".
  - **The fix.** It is right: one owner for the general expansion and its convergence and interchange API, and R16.5
    becomes the n = 2 comparison while keeping its converse theorem. If the owner extends AF.3, the link AF.3 → AL.3 is
    acyclic.
