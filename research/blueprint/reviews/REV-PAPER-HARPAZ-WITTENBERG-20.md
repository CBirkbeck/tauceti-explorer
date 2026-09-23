# Review of PAPER-HARPAZ-WITTENBERG-20

**Job** REV-PAPER-HARPAZ-WITTENBERG-20 (issue #1427) · **Date** 2026-09-23 · Claude Code, session
`cc-7b31c4` · **Verdict: accept**, with ten locator page numbers corrected. All fourteen routes
accepted; both `sourceIssues` confirmed; nothing rejected or deleted.

Paper: Yonatan Harpaz and Olivier Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de
Galois inverse*, [J. Amer. Math. Soc. **33** (2020), 775–805](https://doi.org/10.1090/jams/943),
read in the authors' 31-page PDF, whose hash reproduces as
`2e425ee63d77e6fc53ddd76aca8c8b7ab36be95b078fbcec5e2a8d7f325e6ad9`. Its printed page numbers
coincide with the PDF's, which is what makes the locator check below exact.

## Structure

150 items: 131 missing, 12 planned, 7 library. Every missing item is routed exactly once, all
fourteen routes' stages exist, all planned layer ids exist, both Part II parents exist, both areas
are galaxy ids, and `scripts/check_paper.py` passes. The planned items named inside source routes are
the provision of PROTOCOL §16.

All nine declarations behind the seven library items resolve at the pins: Tau Ceti's
`torusCommHopfAlgProperty` and `splitTorusCommHopfAlgProperty`, the two multiplicative-type
properties, `geometricCharacterGroup_fg_of_multiplicativeType`, `IsProPSylow` with
`exists_isProPSylow`, and Mathlib's `AlgebraicGeometry.AlgebraicCycle` and
`AddCommGrpCat.injective_of_divisible`.

**Coverage** is complete: all 39 numbered results of the paper are cited by items.

## Correction: ten page numbers off by one

The extraction's locators name a numbered result and a page. Ten of them name a page one away from
where the paper declares the result:

| item(s) | cited | declared |
| --- | --- | --- |
| 36–39 | Proposition 2.3 p.8 | p.9 |
| 45 | Proposition 2.6 p.10 | p.11 |
| 52 | Corollaire 2.2 p.7 | p.8 |
| 60 | Corollaire 3.2 p.14 | p.13 |
| 69, 70 | Théorème 4.2 p.15 | p.16 |
| 99 | Définition 6.4 p.23 | p.22 |

I read each declaration on its page and corrected the numbers. Two other citations that differ are
right as they stand, because they name a proof rather than a statement — "Proof of Theorem 2.1 p.11"
and "Proof Theorem 4.2 p.17" — and two more are external ("DLA19 Definition 5.1 p.22"), so they were
left untouched.

## The two findings

- **E1 (gap, a stated result) — confirmed.** The standing setting of §4, fixed on p.15, includes "un
  morphisme dominant `f : X → P^n_k` dont la fibre générique est rationnellement connexe", and
  Théorème 4.2 is stated inside it. Remarque 4.5 on p.17 then invokes "le théorème 4.2 (i) et la
  proposition 3.3 (i)" for an `X` assumed only proper and smooth with `k̄[V]* = k̄*` and torsion-free
  Picard groups. The rational-connectedness hypothesis the invoked theorem carries is missing, which
  is what the correction adds.
- **E2 (misprint) — confirmed.** Page 4 prints "si `Γ = Q_{2^m}` est le groupe quaternionique
  d'ordre `2^m` pour un entier `m ≥ 1`". The generalised quaternion group is defined for `m ≥ 3`,
  `Q_8` being the smallest; at `m = 2` the presentation gives a cyclic group of order 4.

## A note for the maintainer

Both Part II routes here have `HeightsRationalPointsAndObstructions` as parent, with distinct ids and
topics, which is fine. Across the corpus that parent now carries at least four proposed Part IIs —
these two, `HeightsRationalPointsPartIIRandomFano` from `PAPER-BROWNING-LEBOUDEC-SAWIN-23`, and
`HeightsRationalPointsAndObstructionsPartII` from the uniform-Mordell–Lang group. That is a
queue-shaping question, not a defect in this file.

## What this review did not do

I read §§1–4 and 6 around the findings and the statements of the results the routes cite, not all 31
pages line by line. I add no finding of my own, and I did not compare the published JAMS text.
