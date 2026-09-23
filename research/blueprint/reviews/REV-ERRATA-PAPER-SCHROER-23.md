# Review of ERRATA-PAPER-SCHROER-23

**Job** REV-ERRATA-PAPER-SCHROER-23 (issue #1776) · **Date** 2026-09-23 · Claude Code, session `cc-7b31c4` ·
**Verdict: all 10 findings confirmed; one reach corrected in place (E1); one further misprint added (E11).**

Source: Stefan Schröer, *There is no Enriques surface over the integers*,
[Annals of Mathematics **197** (2023), 1–63](https://doi.org/10.4007/annals.2023.197.1.1);
arXiv [2004.07025](https://arxiv.org/abs/2004.07025).

The errata job was done by Claude Code session `cc-fb70e5` (pull request #1808). This review is by a
different session, which did not write those files.

## What I read

**arXiv v3 (9 August 2022), the version the errata names.** I re-fetched the PDF and it reproduces the
recorded SHA-256 `ae6481f2…6d61` exactly, and I read the LaTeX e-print
(sha256 `ae77260256b42df57443f3101ccda9bf2bbbc2f991410bf27f02b0e0afdc87d9`) at every locator. **All ten
quotations are verbatim in the source**, down to the `\star` and `\otimes` of E3 and the "One the other hand"
of E4. The typeset Annals text could not be obtained — the Annals site serves only a preview — which the
errata also says; the version read is the author's own, so this is a narrower gap than it would be for a
paper whose preprint predates the referee's report.

**Existing corrections.** Re-checked: arXiv stops at v3, and neither the Annals page nor the Crossref record
carries an erratum. All eleven stay `new`.

## Verdicts

All ten confirmed. The substance, in the order of the list:

- **E1 (Lemma 1.1, `d ≥ 0`).** Confirmed, **and I corrected the reach from `nothing` to `a stated result`.**
  The condition is existential in `d`, and `d = 0` makes it hold for every `X` — take `N = O`, numerically
  trivial and the pullback of `O_X` — so the lemma as printed asserts that `Num_{X/k}` is always constant,
  which the recorded `P¹_C`-over-`R` example refutes. The lemma itself is therefore false as printed, and the
  entry's own reason says so ("the 'if' direction would fail"); `nothing` understated it. Nothing downstream
  uses the false reading, since the sufficiency argument in the proof needs `d ≥ 1`, and the correction
  stands unchanged.
- **E2 (Proposition 3.1).** Confirmed, and the counterexample checks out. For `S = E × P¹ → P¹` over `F_q`,
  `NS(S ⊗ k^alg) = Z²` is spanned by the two rulings with trivial Galois action, so `Num_{S/k}` is constant,
  and every fibre is the smooth curve `E`: over a rational point (ii) holds and (iii) fails. The printed step
  — "`C ⊗ Ω` is birational to `P¹_Ω`, because `Γ(S_ā) → Γ(S_a)` is a graph isomorphism" — reads information
  out of a graph isomorphism that holds trivially for a single smooth fibre. The correction is right, and the
  application does assume what it needs: Proposition 3.2 opens "Suppose the reduced scheme `C_red` is
  singular".
- **E3 (Oort–Tate group law).** Confirmed; both checks are right. With `L = R = Z`, `a = 1`, `b = 2` the
  scheme is `{0,1}` and the printed law sends `(1,1)` to `4`, outside it, where the minus sign gives `0`;
  with `a = 2`, `b = 1` the scheme is `{0,2}`, identified with `μ₂` by `f ↦ 1 − f`, and
  `(1−f₁)(1−f₂) = 1 − (f₁+f₂−f₁f₂)` is the minus sign again.
- **E4 (Proposition 5.5).** Confirmed. The gap is real. For an Enriques surface `Y` over a field `F` of
  characteristic ≠ 2, the canonical cover is `Spec(O_Y ⊕ ω_Y)` with an algebra structure depending on a
  trivialisation of `ω_Y^{⊗2}`, unique only up to `Γ(Y, O_Y)^× = F^×`; rescaling by `λ` twists the cover by
  the class of `λ` in `H¹(F, μ₂) = F^×/(F^×)²`. So the cover built over `A` and the base change of the
  `Z[1/2]`-cover agree only up to such a twist, and good reduction is not invariant under one. The recorded
  four-twist repair closes it.
- **E5, E9, E10 (index and subscript slips).** Confirmed, each verbatim, each self-evident from its own
  context: §7 counts `F_q`-points throughout; `r_c ≤ 2` in the same paragraph contradicts "`r_c ≥ 7`"; and
  the parallel sentence in the proof of Proposition 12.2 has `Pic⁰(Y_K)`.
- **E6 (Proposition 9.2).** Confirmed. A multiplicative fibre `I_r` with `r ≥ 3` has a cycle for its dual
  graph and so no terminal vertex. The repair works: a component of a cycle meets the others in exactly two
  points, so at least one of the three points of `P¹(F₂)` lies in the regular locus of `C_red`; additive
  fibres have tree dual graphs, where a terminal component of multiplicity one exists.
- **E7 (Tsen).** Confirmed, and the counterexample checks out. Tsen's theorem needs an algebraically closed
  constant field; here `F = F₂(t)`. The cyclic algebra `(F₄(t)/F₂(t), t)` is nonzero because the extension is
  constant, hence unramified with residue degree 2 at `t = 0`, so every norm has even valuation there and `t`
  is not a norm.
- **E8 (`c_4` and unstable fibres).** Confirmed. In characteristic 2, `j = c_4³/Δ` with `c_4 = a_1⁴`, so
  `c_4(x) = 0` holds for additive *and* for smooth supersingular fibres; the printed "if and only if" fails in
  one direction, and the argument uses only the true one.

## One finding added

- **E11.** Three lines above the passage of E9, in the untwisted half of the same argument, the paper writes
  "For `r_a = 7` we get `r_a ≥ 3`". The estimate just derived is `r_c = 12 − i − r_a ≥ 10 − r_a`, applied at
  `r_a = 6, 7, 8, 9`; at `r_a = 7` it gives `r_c ≥ 3`, which is what the appeal to Lang's classification then
  uses, and the neighbouring cases both write `r_c`. As printed the sentence restates its own hypothesis. It
  is the same slip as E9. Misprint, reaches nothing.

I did not record the orthographic "One the other hand" in the proof of Proposition 5.5, which carries no
mathematics and is anyway visible inside E4's quotation.

## What this does to the main result

I agree with the errata: the theorem — there is no Enriques surface over `Z` — is not in doubt. Two findings
reach a stated result (E1, now, and E2), and in both cases the corrected statement is the one the paper uses
elsewhere. Three reach a proof (E4, E6, E7), each with a repair the errata or this review states. The rest
are misprints.

## Validation

`python3 scripts/check_errata.py research/blueprint/errata/PAPER-SCHROER-23.json` reports ok and
`research/blueprint/intake.py check-files` reports no problems. All eleven findings carry a `review` verdict
with a reason and this job's name. Only the errata JSON, its companion document and this review change.
