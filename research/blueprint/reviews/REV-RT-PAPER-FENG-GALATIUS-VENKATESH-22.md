# REV-RT-PAPER-FENG-GALATIUS-VENKATESH-22

Independent verification of the red team RT-PAPER-FENG-GALATIUS-VENKATESH-22 (Codex, session `codex-rtOQ9t`, PR #5485)
on the extraction PAPER-FENG-GALATIUS-VENKATESH-22 (Feng–Galatius–Venkatesh, *The Galois action on symplectic
K-theory*, Invent. Math. 230 (2022), 225–319), for issue #4157.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-39fac3`, PR #2007);
- its review REV-PAPER-FENG-GALATIUS-VENKATESH-22 (`cc-d67081`, PR #2536);
- the red team.

None of the findings cites work of mine.

**Result: all three findings confirmed, all high.** None disputes the paper's main theorems.

## What I read

- **The paper.** arXiv 2007.15078v3 (<https://arxiv.org/pdf/2007.15078v3>), dated 8 May 2022, the final accepted
  version. The publisher's open-access PDF refused scripted downloads (it returned a JavaScript page). I therefore matched the
  red team's published locators by section and equation number. I read:
  - §2.2–2.4, including (2.2) and the ring map of §2.4;
  - §3.4–3.5, including (3.4), (3.5) and the proof of Theorem 3.5;
  - Appendix A.1, (A.1)–(A.4).
- **The extraction.** Items /2, /17, /25 and /51.

## The findings

- **/1 (high): the hyperbolic splitting.** §3.4 says (3.5) is "canonically split" by the forgetful map c_B. The proof of
  Theorem 3.5 computes c_B ∘ H as 1 + ψ⁻¹, which is 2 on the (+) eigensummand. So c_B is twice a retraction, not a
  retraction.
  - **What the item gets wrong.** Item /25 copies "split by c_B", which is false as stated.
  - **The fix.** Since 2 is inverted, (1/2)c_B splits the sequence. Record the paper's wording as a sourceIssue.
- **/2 (high): the ring map.** Item /2 makes the group completion Σ^∞_+|𝒞| → K(𝒞) a ring map for every symmetric
  monoidal groupoid. The paper gives a ring map only for Pic(R) under ⊗ (§2.4).
  - **The counterexample.** The discrete groupoid Q/Z under addition has π_0K = Q/Z, and no unital ring has that
    additive group.
- **/3 (high): Segal's theorem.** Appendix A.1 gives the Ω-equivalences only for n ≥ 1, with 0th space Ω|X(S¹)|. Item
  /51 asserts that B^∞X with spaces |X(Sⁿ)| is an Ω-spectrum outright.
  - **The counterexample.** The special Γ-space S ↦ N^{S∖*} has level-0 map N → Z.
  - **Note.** The item keeps the group-completion clause, so the error is the unqualified level-0 claim.
