# Handoff: BP-SmallRamificationAndAbelianVarietyBaseCases (fourth checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #995.

- Checkpoints 1–3 merged in #3812 (R25.1, R25.2), #3814 (R25.3) and #3819 (R25.4).
- This checkpoint adds R25.5 and R25.6. **All six stages are now closed.**

## What this checkpoint delivers

- **Packet** `research/blueprint/packets/SmallRamificationAndAbelianVarietyBaseCases.json`, status `partial`, because requests to other roadmaps remain open:
  - 55 nodes: 7 definitions, 29 lemmas, 18 theorems and 1 application;
  - 41 API items, 29 unit tests, 16 planets;
  - 42 baseline declarations and 4 source issues;
  - `scripts/check_blueprint.py` reports 0 errors and 0 warnings against the pinned declaration index.
- **Roadmap document**, regenerated with the introduction revised.
- **Suggested Lean file**, extended with the Terminal and BaseCases sections.

RS-06 narrows R25.5: it owns the Snowden/source realisation and the source-specific ordinary checks, and imports R21.5, R21.6 and R24.6. It keeps R25.6. The plan follows both.

## R25.5 (closed)

- **R25.5/gl2-type-abelian-variety:** GL₂(K)-type abelian varieties over ℚ and their λ-adic representations.
- **R25.5/snowden-realisation:** Snowden's Proposition 9.4.1 over ℚ. The route is potential modularity (R23.4), solvable descent to a field of odd degree (R17.4), Jacquet–Langlands and Shimura-curve Jacobians (R17.3, R18.6), and the descent lemma R25.5/descent-of-gl2-type-realisation (Faltings, R28.4). It needs only (A1), not a non-solvable image, and it does not use Serre's conjecture.
- **R25.5/reduction-of-the-realisation:** the reduction type (good, or semistable), read off the λ-adic representation through Néron–Ogg–Shafarevich and the λ-independence of Weil–Deligne parameters (R11.5), with dim A ≥ 1.
- **R25.5/level-one-dihedral-classification** (Wintenberger, Khare Lemma 5.1, with DP23 Lemma 1.13). A level-one dihedral ρ̄ needs p ≡ 3 (mod 4) and h(ℚ(√−p)) > 1, and has twist-normalised weight (p + 1)/2. So (A1) holds automatically at p ∈ {5, 7, 13} and for weights 2, 4, 6, 8, 14. This is proved here, so the plan does not import the bad-dihedral analysis of ClassicalSerreModularity R27.1/R33.2, which would create a cycle: that roadmap consumes R25.6.
- **R25.5/ordinary-reducible-terminal-weights** at (p, k) = (3, 2), (3, 4), (5, 6), (7, 8), (13, 14):
  - crystalline with reducible reduction implies ordinary (Fontaine–Laffaille or Berger–Li–Zhu, via R21.5);
  - the residual shape is 1 ⊕ ω^{k−1}, which is p-distinguished;
  - Skinner–Wiles then applies;
  - S_k(SL₂(ℤ)) = 0 (Mathlib), so no such representation exists.
- **R25.5/weight-two-level-one-excluded:** via Fontaine's theorem.
- **R25.5/weight-p-plus-one-excluded-at-schoof-primes:** via Schoof's theorem at p ∈ {5, 7, 13}.
- **R25.5/weight-fourteen-at-eleven-is-a-twist:** the θ-shift in Serre's recipe, R15.4.
- **R25.5/small-weight-level-one-exclusion:** KW04 Theorem 4.3 and Corollary 4.4.
- **R25.5/paso-six-terminal-cases:** DP23 Paso 6.

## R25.6 (closed)

- **R25.6/base-case-table:** the nine rows, with characteristic, weights, level, image, coefficients, supplier, consumer and local check, and the degenerate branches with their outside suppliers (R17.5, R17.6, R21.5, R27.1/R33.2).
- **R25.6/base-case-table-holds:** every row holds, independently of Serre's conjecture.
- **Local checks at the exceptional transitions:**
  - ordinarity at 3 for k = 2, 4;
  - Steinberg at p implies semistable reduction;
  - the twist at p = 11, weight 14;
  - (A1) at level one from Wintenberger's lemma.

## Requests added in this checkpoint

- R23.4: potential modularity in Snowden's form.
- R17.3 and R17.4: Jacquet–Langlands and solvable descent.
- R18.6: the Shimura-curve realisation.
- R28.4: Faltings's isogeny theorem.
- R11.5: Néron–Ogg–Shafarevich and λ-independence.
- R21.5: the crystalline-to-ordinary criterion at the listed (p, k), Skinner–Wiles, and the residual weights of crystalline reductions.
- R24.3 and R24.5: the lifts and compatible systems.
- R15.4: Serre's weight recipe.
- A6: End⁰ and freeness of V_p.
- R01.4: DP23 Lemma 1.13.
- Tau Ceti ClassFieldTheory Layer 12: unramified abelian extensions and genus theory.

## Source notes

DP23 justifies the nontriviality of the residual representation on D₃ in Paso 6 by "Serre's weight is not 3". In the plan it follows directly from ω^{k−1}|I₃ ≠ 1. This is recorded in an acceptance note, not as an error.

No new source issues in this checkpoint. The four issues in Schoof 2005 (E1–E4) stand.

## Lean

The suggested file was not compiled. No pinned build is available, and the shared-machine rules forbid builds.

## Sources

Read in this checkpoint:

- Snowden, arXiv:0905.4266v1: the abstract, §3.1 and §9.4.
- Khare–Wintenberger, arXiv:math/0412076v1: §§3–4.
- Khare, arXiv:math/0504080v1: §§5 and 6.1.
- DP23: §§1.2–1.3 and Paso 6.

Earlier sources are listed in the packet. Not accessible: Fontaine 1985, Tate 1994, Serre's Œuvres III note, and Martinet's tables.

## What a continuation could do

All stages are closed; what remains are the requests.

- If Fontaine's and Tate's papers become accessible, compare their prime choices and discriminant rows with R25.2 and R25.3. The sharpened local bounds δ ≤ 2 at 2 and δ ≤ 13/6 − 1/|P| at 3 are this plan's own derivations.
