# REV-RT-PAPER-SHANKAR-SHANKAR-TANG-ETAL-22

Independent verification of the red team RT-PAPER-SHANKAR-SHANKAR-TANG-ETAL-22 (Codex, session `codex-rtOQ9t`, PR #5413)
on the extraction PAPER-SHANKAR-SHANKAR-TANG-ETAL-22 (Shankar–Shankar–Tang–Tayou, *Exceptional jumps of Picard ranks of
reductions of K3 surfaces over number fields*, Forum Math. Pi 10 (2022), e21), for issue #4241.

Verifier: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write:
- the extraction (`cc-fb70e5`, PR #1922);
- its review REV-PAPER-SHANKAR-SHANKAR-TANG-ETAL-22 (`cc-7b31c4`, PR #2441);
- the red team.

None of the findings cites work of mine.

**Result: all five findings confirmed.** /1, /2 and /5 are high and /3 medium. /4 is filed as high; I would grade it
medium. None refutes the main theorem.

## What I read

- **The paper.** The published open-access PDF (<https://doi.org/10.1017/fmp.2022.14>, 49 pages; printed page = PDF
  page). I read pp. 16, 22, 24–25, 28–29, 31 and 44.
- **The extraction.** Items /4, /40, /41, /56, /66, /68 and /93.
- **Mathlib at 082e2d3.** `Gamma_add_nat_div_Gamma_eq` (Gamma/Beta.lean), `Gamma_zero` and `Gamma_neg_nat_eq_zero`
  (Gamma/Basic.lean), and `ascPochhammer` (RingTheory/Polynomial/Pochhammer.lean).

## The findings

- **/1 (high): the dyadic exponent.** p. 16 defines s_i as the number of components with ν_j = i, which is wrong at p = 2,
  where components can have rank 2. I brute-forced the red team's example U ⊕ U ⊕ ⟨4⟩ (Q = ab + cd + 2t², m = 2):
  - the bad counts are 32 (mod 4) and 640 (mod 8);
  - the good counts of Q′ are 16 and 320;
  - so the rank-sum exponent fits, and the printed exponent overcounts by a factor of 4.
- **/2 (high): the dropped Laurent term.** (5.8) replaces the Gamma ratio A(s) by its value 4/b inside a limit where
  c(m)/s cancels a pole. Since FP(A·S) = A(0)·FP(S) + A′(0)·Res(S), the identity drops −c(m)[ψ(k−1) − 2ψ(k)]. This is
  nonzero (c(m)(2 − γ) for b = 4) but O(m^{b/2}), so the asymptotics survive.
- **/3 (medium): two proof slips.**
  - **p. 31:** the count drops the shell Q(λ) = 1, which makes it infinite.
  - **p. 22:** the cutoff ω_P is stated in Q(λ_x), which is never positive on the negative-definite P. The positive-plane
    cutoff also misses Q(λ_{x⊥}) ∈ (1, 1+T].
- **/4 (filed high; I would grade it medium): the Pochhammer quotient.** Mathlib's Gamma quotient theorem assumes
  z ∉ −ℕ, and Γ(0) = 0 makes the unguarded quotient wrong at a = 0, n = 0. The identity is the usual meromorphic one, and
  the paper's parameters satisfy the guard, so the defect is in the library binding.
- **/5 (high): Hodge index.** The paper applies Hodge index to a K3 surface (p. 44). As a statement on Pic of every
  surface it fails: on E × P¹, a non-torsion class of Pic⁰(E) lies in the radical of the form.
