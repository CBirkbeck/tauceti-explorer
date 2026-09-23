# Review of ERRATA-PAPER-YUAN-26

**Job** REV-ERRATA-PAPER-YUAN-26 (issue #1763) · **Date** 2026-09-23 · Claude Code, session `cc-7b31c4` ·
**Verdict: all 4 findings confirmed, none rejected, none amended, none added.**

Source: Xinyi Yuan, *Arithmetic bigness and a uniform Bogomolov-type result*,
[Annals of Mathematics **203** (2026), no. 1, 15–119](https://doi.org/10.4007/annals.2026.203.1.2);
arXiv [2108.05625](https://arxiv.org/abs/2108.05625).

The errata job was done by Claude Code session `cc-fb70e5` (pull request #1801). This review is by a
different session, which did not write those files.

## What I read

**The same author manuscript the errata names.** I re-fetched it from the author's page,
`.../preprints/bigness_and_bogomolov.pdf`, and its SHA-256 is
`b36f4860cc0f098ef062523e8a5147e8172d1e4e357fc76a63cd7c0d782a813e` — the recorded hash — with "August 21,
2024" on its title page. So the version under review is fixed beyond doubt, and **all four quotations are
verbatim in it**, at the recorded pages: §1.6 on p. 16, §4.6.3 on p. 100, Theorem 4.19 on p. 101 and §A.1 on
p. 102. The final typeset Annals text was not accessible, as the errata also says; and I did not re-check the
arXiv v4 comparison the errata reports for E1, which is peripheral to the finding.

**Existing corrections.** Re-checked: no erratum on the Annals page, no later arXiv version, nothing on the
author's page. All four stay `new`.

## Verdicts

- **E1 (Theorem 4.19, function-field case).** Confirmed, and the counterexample stands. With `S = Spec K` for
  `K = k(t)`, the moduli morphism `S → M_{g,K}` is a `K`-point, quasi-finite on the dense open `U = S`, so
  §1.6's definition of maximal variation — "the moduli morphism is generically finite; i.e. there is an open
  and dense subscheme `U` of `S` such that the induced morphism `U → M_{g,R}` is quasi-finite" — is met
  vacuously. Taking `X = C₀ ×_k K` with `C₀/k` of genus `g > 1` and `α` of degree 1, every point of `C₀(k)`
  has canonical height zero in the constant Jacobian and `C₀(k)` is Zariski dense, so part (1) fails at
  `m = 1 = dim S + 1`. What settles the diagnosis is the paper's own proof on the same page: "Similar to
  Proposition 4.18, we need the bigness of the adelic line bundles over `k` instead of over `K`, where
  `k = Z` if `K` is a number field and `k` is the field of constants if `K` is a function field of one
  variable." A constant family does not have that bigness. So the function-field case is false as printed and
  `a stated result` is the right reach; the correction — maximal variation of a model over `k`, excluding
  isotrivial families — is exactly what the proof requires.
- **E2 (the recalled relative Bogomolov conjecture).** Confirmed. The passage is verbatim at the head of
  §4.6.3 (the words elided in the quotation are "Let `S` be a quasi-projective normal variety over `K`" and
  the rest of the set-up). Over a function field the statement does fail without excluding the constant part:
  for `A = A₀ ×_k S` and a constant `Y` generating it with `dim Y < g`, the constant points have canonical
  height zero and are Zariski dense. [DGH2] states the conjecture over number fields, and nothing in the paper
  rests on the conjecture as recalled — its function-field instances are Theorem 4.19, which is E1 — so
  `affects nothing` is right.
- **E3 (admissible Green functions).** Confirmed. The sentence is verbatim, and so is the definition three
  lines above it: "A smooth hermitian metric `‖·‖` on a line bundle `L` on `C` is called admissible if the
  Chern form satisfies `c₁(L, ‖·‖) = deg(L) dµ_Ar`." Since `c₁` of `‖1‖ = exp(−g_D)` on `O(D)` is
  `(i/π)∂∂̄ g_D + δ_D`, admissibility reads `(i/π)∂∂̄ g_D = deg(D) dµ_Ar − δ_D`, and the printed equation is
  the case `deg D = 1`.
- **E4 (stable curves).** Confirmed, and the counterexample checks out. The Deligne–Mumford condition counts
  special points on the normalisation, both branches of a self-node included, which the printed condition
  ignores. The recorded example is stable in the standard sense and fails the printed one: a nodal rational
  curve meeting a smooth genus-one curve at one point has arithmetic genus `1 + 1 + 1 − 2 + 1 = 2 > 1`, its
  rational component carries three special points — two branches of the self-node and the attaching point —
  and it meets the other component only once. Since the paper uses stable reduction and the moduli of stable
  curves from the literature, the intended notion is the standard one, so `affects nothing` is right.

## Nothing added

I looked for further slips around the four locators and found none worth recording. The one transcription
difference I noticed is inside an ellipsis and changes nothing: §4.6.3 says "quasi-projective **normal**
variety", and E2's quotation elides the word.

## What this does to the main results

I agree with the errata. The uniform Bogomolov-type theorem, which is the paper's main result, excludes
isotrivial families, so E1 and E2 — both about the constant case over function fields — leave it untouched.
E3 and E4 are a normalisation slip and a definitional slip in material quoted from the literature.

## Validation

`python3 scripts/check_errata.py research/blueprint/errata/PAPER-YUAN-26.json` reports ok and
`research/blueprint/intake.py check-files` reports no problems. All four findings carry a `review` verdict
with a reason and this job's name. Only the errata JSON, its companion document and this review change.
