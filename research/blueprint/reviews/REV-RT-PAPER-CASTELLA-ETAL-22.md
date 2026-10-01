# REV-RT-PAPER-CASTELLA-ETAL-22

Independent verification of the red team RT-PAPER-CASTELLA-ETAL-22 (Codex, session `codex-rtOQ9t`, PR #5468) on the
extraction PAPER-CASTELLA-ETAL-22 (Castella–Grossi–Lee–Skinner, *On the anticyclotomic Iwasawa theory of rational
elliptic curves at Eisenstein primes*, Invent. Math. 227 (2022)), for issue #4167.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-39fac3`, PR #2017);
- its review REV-PAPER-CASTELLA-ETAL-22 (`cc-442dc5`, PR #2510);
- the later edit by the Burungale–Tian fix (`cc-fb70e5`, PR #4477);
- the red team.

None of the findings cites work of mine.

**Result: all four findings confirmed.**
- /1 and /2 are high: general items that copy statements of the paper which fail in edge cases outside the paper's
  applications.
- /3 and /4 are medium.

## What I read

- **The paper.** arXiv 2008.02571v2 (<https://arxiv.org/pdf/2008.02571v2>), the version the extraction read. I read:
  - §1.2 (pp. 8–9);
  - the proof of Theorem 2.1.1 (pp. 12–13);
  - §3.1 with (3.1) (p. 16);
  - §3.3.2 with Proposition 3.3.11 (pp. 22–23).
- **The extraction.** Items /11, /13, /15, /17 and /22, and E18.
- **The pinned Mathlib.** `NumberTheory/Padics/MahlerBasis.lean` and `NumberTheory/Padics/Measure/AmiceTransform.lean`.

## The findings

- **/1 (high): the finite–singular comparison (3.1).** The comparison identifies the p-parts of G_ℓ and k_λ^×/F_ℓ^×,
  ignoring the global units.
  - **The example.** For ℚ(√−3) with ℓ = 2 and p = 3, G₂ = 1 but F₄^×/F₂^× has order 3.
  - **The fix.** Add p ∤ [O_K^× : O_ℓ^×]. §3.2's hypotheses exclude this case.
- **/2 (high): Proposition 3.3.11(i).** "There exists 1 ⩽ i₀ ⩽ 2s" fails when s = 0. The paper's proof handles that case
  separately.
- **/3 (medium): the measure construction.** The Serre–Tate measure μ_{f,a}, θ and the p-depletion used in Theorem 2.1.1
  have no items.
  - **What the library has.** Mathlib has the Mahler basis, but its Amice-transform equivalence covers only ℤ_p-valued
    measures.
- **/4 (medium): item /11's index set.** The item still sums over w ∈ Σ, w ∤ p, although the confirmed E18 corrects this
  to S.
