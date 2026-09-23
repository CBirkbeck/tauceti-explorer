# Review of ERRATA-PAPER-NEWTON-THORNE-26

**Job** REV-ERRATA-PAPER-NEWTON-THORNE-26 (issue #1765) · **Date** 2026-09-23 · Claude Code, session
`cc-7b31c4` · **Verdict: the empty list is confirmed. No finding added.**

Source: James Newton and Jack A. Thorne, *Symmetric power functoriality for Hilbert modular forms*,
[Annals of Mathematics **203** (2026), 283–347](https://doi.org/10.4007/annals.2026.203.1.4);
arXiv [2212.03595](https://arxiv.org/abs/2212.03595).

The errata job was done by Claude Code session `cc-fb70e5` (pull request #1806). This review is by a
different session, which did not write those files.

An empty list is the hardest kind to review, because confirming it is confirming an absence. What follows
says exactly what I checked and what I did not.

## What I did

**Fetched the version the errata names and read its source.** arXiv v2 (19 February 2025): PDF sha256
`6a156f7a5567226e0bd2209d5b237cbbc150dc10cfbd9ffd060a3245328cb82c`, LaTeX e-print sha256
`86e98ac0032bbf65888448fea5f9a4da04731ccea146bb91cf762e008add80fb`. Working from the source rather than the
PDF is what makes the checks below possible.

**Mechanical audit of the source. It is clean.**

- No duplicated `\label`.
- No undefined `\ref`, `\eqref` or `\cref` — every cross-reference resolves.
- No cross-reference whose word disagrees with the environment it points at (no "Lemma 3.4" for a
  proposition, and so on): 0 mismatches over the whole file.
- No leftover editorial markers. The file defines the authors' usual draft macros `\need` and `\mar`, and
  because `\newif\iffinalrun` is never set true those macros expand to their visible draft forms — but
  **neither is used anywhere in the body**, so nothing leaks into the typeset text.

**Numbering reconstructed independently.** From the shared `theorem` counter and the `\section` commands I
rebuilt the numbering of every numbered statement and checked the four the errata discusses: Theorem 4.1
(`thm_FLT_for_TP`), Proposition 5.4 (`prop_large_image_everywhere`), Theorem 5.5
(`thm_automorphic_tensor_product`) and Theorem 5.9 (`thm_big_image_implies_tensor_product`). All four numbers
are right, so the extraction's locators, which the errata's guards rest on, point where they claim.

**Checked the guards against the statements.** Theorem 4.1 does carry all nine hypotheses, and its
hypothesis (4) does contain the dyadic branch, "If `p = 2`, they are both potentially crystalline" — the
guard is a guard, not a correction. The same holds for the reading of Theorems 5.5 and 5.9 as residual
witnesses rather than unrestricted tensor functoriality, which is what their statements say.

**Checked the introduction against the body.** The main theorem is stated with the indexing `n ≥ 2` for
`Sym^{n−1}π`, so that `Π_n` is an automorphic representation of `GL_n` and the `n = 2` case is `π` itself;
that is internally consistent.

**Re-checked for existing corrections.** Crossref's record for `10.4007/annals.2026.203.1.4` has an empty
`relation` and no `update-to`, and the `updates:` filter returns nothing; arXiv still stops at v2. So there
is nothing to record as `known` other than `new`, and nothing to record at all.

## What I did not do

I did not re-read the 52 pages line by line, and I did not verify the automorphy-lifting arguments of §§4–5.
Neither did the errata job, which says so. So the honest reading of this verdict is: **no mistake is
recorded, the mechanical checks that can be run over the source find nothing, and the locators and guards
the earlier work rests on are right.** It is not a certificate that the paper contains no mistake.

For a future reviewer or red-team pass, the places where a mistake would most likely hide are the ones the
errata's own guards mark as easy to misread: the nine hypotheses of Theorem 4.1 and their use in §5, the
Steinberg comparison of §3, and the two auxiliary primes of Proposition 5.4.

## Validation

`python3 scripts/check_errata.py research/blueprint/errata/PAPER-NEWTON-THORNE-26.json` reports ok, and
`research/blueprint/intake.py check-files` reports no problems. The errata JSON is unchanged — an empty list
carries no verdicts — and only its companion document and this review change.
