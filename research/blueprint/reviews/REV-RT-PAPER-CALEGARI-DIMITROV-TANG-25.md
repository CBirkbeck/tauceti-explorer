# REV-RT-PAPER-CALEGARI-DIMITROV-TANG-25

Independent verification of the red team RT-PAPER-CALEGARI-DIMITROV-TANG-25 (Codex, session `codex-rtOQ9t`, PR #5475)
on the extraction PAPER-CALEGARI-DIMITROV-TANG-25 (Calegari–Dimitrov–Tang, *The unbounded denominators conjecture*,
J. Amer. Math. Soc. 38 (2025), 627–702), for issue #4259.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-d67081`, PR #1902);
- its review REV-PAPER-CALEGARI-DIMITROV-TANG-25 (`cc-7b31c4`, PR #2415);
- the red team.

None of the findings cites work of mine.

**Result: all six findings confirmed.**
- /1–/5 are high.
- /2's counterexample is wrong and is replaced below; the finding stands.
- /6 is filed as medium; I would grade it low.

None disputes the main theorem.

## What I read

- **The paper.** The publisher's offprint on the first author's page
  (<https://www.math.uchicago.edu/~fcale/papers/UDC.pdf>), 76 pages, SHA-256 `867026fb…290ee1e`, equal to the
  extraction's; printed page = PDF page + 626. I read:
  - p. 631 and the proof of Lemma 2.1.2 (pp. 637–638);
  - the proof of Lemma 2.3.1 (pp. 640–641);
  - §4.1 (pp. 652–653) and the end of the proof of Lemma 4.4.1 (p. 659);
  - §7.3 (pp. 688–691).
- **The extraction.** The items eisenstein-theorem, inverse-series-denominators, cusp-width, wohlfahrt-theorem,
  jacobi-hypergeometric-theta, modular-forms-finite-index, def-7.3.1, vvmf-connection, thm-7.3.3, cor-7.3.4 and
  lemma-2.3.1; sourceIssues E1–E11.
- **Mathlib** at 082e2d3: `jacobiTheta_T_sq_smul` and `jacobiTheta_S_smul` in `JacobiTheta/OneVariable.lean`.

## The findings

- **/1 (high): Eisenstein's theorem.** The item puts every algebraic branch in ℤ̄[[x^{1/N}/M₁]]; y = 1/2 refutes it. The
  paper applies Eisenstein only to the inverse branch, whose constant term is zero.
- **/2 (high): Wohlfahrt's theorem.** With the extraction's ± cusp widths, "level N implies Γ(N) ⊆ G" fails
  without −I ∈ G.
  - **The red team's example fails.** Its H = Γ(2) ∩ Γ₁(4) is not a counterexample: (1 0; 2 1) ∈ Γ(2) and its negative
    both lie outside H, so ±H ≠ Γ(2), the level is 4, and H ⊇ Γ(4).
  - **A correct example.** H′ = {γ ∈ Γ(2) : a ≡ 1 mod 4}, the kernel of the character γ ↦ a mod 4 on Γ(2), has ±H′ =
    Γ(2), so its level is 2, yet Γ(2) ⊄ H′.
- **/3 (high): θ₃² on Γ(2).** A weight-one form without character on Γ(2) vanishes, because −I acts by −1. With
  Mathlib's theta transformations, θ₃² has character χ₋₄(d) on Γ(2) = ⟨T², U₂, −I⟩.
- **/4 (high): the bundle with connection.** The "rank-6n free" module of p. 690 has rank one for F = 1, and a rank-6n
  bundle cannot have the n-dimensional monodromy ρ|_{Γ(2)}. Theorem 7.3.3 is not disputed.
- **/5 (high): Mason's corollary.** I checked the example exactly. σ(S) = diag(1, −1) and σ(R) = (2 1; −7 −3) give
  σ(T) = (2 1; 7 3), which is semisimple of infinite order. With ρ = 1 ⊕ σ and F = (1, 0, 0), every hypothesis of
  Corollary 7.3.4 holds, yet ρ has infinite image. The corollary needs the values of F to span.
- **/6 (I would grade it low): two slips in the proof of Lemma 2.3.1.**
  - (2.3.2) loses the phase G(0)/|G(0)|.
  - p. 641 writes sup|h| for sup log|h|.

  Neither affects the lemma's statement.
