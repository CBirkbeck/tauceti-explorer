# REV-RT-PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23

Independent verification of the red team RT-PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23 (Codex, session `codex-rtOQ9t`,
PR #5439) on the extraction PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23 (Bary-Soroker–Koukoulopoulos–Kozma, *Irreducibility
of random polynomials: general measures*, Invent. Math. 233 (2023)), for issue #4149.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`codex-a71f92` and `cc-442dc5`, PRs #1905 and #2058);
- its review REV-PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23 (`cc-d67081`, PR #2513);
- the red team.

The finding does not cite work of mine.

**Result: the single finding is confirmed (medium).**

## What I read

- **The paper.** arXiv 2007.14567v3 (<https://arxiv.org/pdf/2007.14567v3>), the version the extraction read; its SHA-256
  prefix `adb1359d…` agrees with the extraction's. I read Lemma 3.1 and its proof (p. 18).
- **The extraction.** Items /48 and /129.
- **The pinned Mathlib.** Its divisor-count declarations (082e2d3, through the declaration index).

## The finding

**What the proof needs.** The proof of Lemma 3.1 needs the maximal order of the divisor function,
τ(a) ≤ exp((log 2 + o(1)) log a / log log a) (Hardy–Wright, Theorem 317). It must hold uniformly over
|a| ≤ N^{log log(100N)}, to get T ≪ N^{0.695} and so the bound N^{0.005} · N^{0.695} / N = N^{−0.3}.

**What the extraction supplies.** Item /48 depends only on /129, the subpower bound τ(k) ≤ C_η k^η for fixed η. On a range
whose exponent grows like log log N, that gives no fixed power of N, so the recorded supplier does not prove /48.

**The fix.** Hardy–Wright is not among the prerequisites, and the pinned Mathlib has only `Nat.card_divisors_le_self`. The
fix is right: add the maximal-order supplier, routed once to AnalyticNumberTheory:AN.5, and the Hardy–Wright
prerequisite. Lemma 3.1 itself is not in question.
