# BP-IntegralIwasawaTheory--I.8 — handoff

Agent: Claude Code — cc-39fac3. Issue #760. First checkpoint of part I.8, within RS-16's
boundaries, which its review accepted.

## What is done

**L0 (partial).** The packet has 11 nodes:
- 4 constructions, 6 lemmas and 1 theorem;
- 16 API items and 13 unit tests;
- 3 planets;
- 18 baseline declarations;
- 1 gap and no requests.

L0 covers:
- the cyclotomic tower in ℂ with Galois compatibility and norms;
- the real subfields;
- the cyclotomic units D_n and D_n^+ of ℚ(μ_{p^n}) (RJW Definition 11.6);
- c_n(a) and γ_{n,a};
- the generators (Lemma 12.18) and cyclicity (Corollary 12.19);
- [V_n : D_n] = [V_n^+ : D_n^+];
- the index formula h_n^+ = [V_n^+ : D_n^+] (Theorem 11.7).

**Gap.** The analytic steps of the index formula, from Washington Theorem 8.2, which was not
accessed:
- the L(1, χ) formula for even χ;
- the ζ-factorisation;
- the group determinant;
- the discriminant of ℚ(μ_{p^n})^+.

**Other stages:** I.8, I.9 and L1–L4 are not read; their coverage records say what to read.

**Consumers.** This L0 is the carrier EulerSystemsCyclotomicMainConjecture:L0 requested (merged in
PR #3336). Its tower stand-ins can now import these nodes.

## Source finding

**E81 (new).** A display in the proof of RJW Corollary 12.19 writes γ_{n,b} where c_n(b) is meant;
the conclusion is unaffected.

The statement itself was checked numerically: N(γ_{n,a}) = −1 for p ≤ 11 and n ≤ 3, so −1 lies in
the ℤ[Γ_n^+]-span as claimed.

## Lean

`research/blueprint/suggested/IntegralIwasawaTheory--I.8.lean` compiles with exit 0; the only
warnings are `sorry` warnings. It was a single run of the pinned Lean v4.34.0-rc2 against the prebuilt
Mathlib at 082e2d3, with no lake. The file imports Mathlib only.

## Checks

- `scripts/check_blueprint.py` with the pinned index: 11 nodes, 0 errors, 0 warnings.
- `intake.py check-files`: 4 files, 0 problems.

## Sources

**Read:** RJW, arXiv:2309.15692v2, §10.2, §11.1–11.3 and §12.3–12.4.

**Not accessed:**
- Washington, *Introduction to Cyclotomic Fields*, §8.2;
- Sinnott (general abelian fields);
- Burns–Flach and Kurihara (I.8, I.9).
