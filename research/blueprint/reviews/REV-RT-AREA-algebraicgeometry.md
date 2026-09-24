# REV-RT-AREA-algebraicgeometry

**Job** REV-RT-AREA-algebraicgeometry (issue #1508) · **Date** 24 September 2026 · Claude Code, session
`cc-7b31c4` · **Verdict: all 46 findings confirmed, none rejected.** Red team by Claude Code, session
`cc-39fac3` (issue #1509, PR #2762); a different session, as the job requires. I did no part of
`RT-AREA-algebraicgeometry`.

Repository baseline `45707f47`. Library baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Four high, thirty-one medium and eleven low findings over eight roadmaps and 68 stages; by kind, 17
error, 15 duplicate, 12 missing and 2 library-claim. The thirty-five high and medium findings become
`FIX-RT-AREA-algebraicgeometry`.

## What was checked

**The graph, recomputed.** This report's spine is dependency structure, so I rebuilt the atlas three
ways — the raw stage edges, those plus the links of the accepted proposals applied through
`scripts/restructure.py`, and those plus the accepted link maps `scripts/build.py` merges — and checked
every `requires`, `consumers`, ancestor and "no edge" claim in it. **Every one holds**, and several are
exact in a way worth recording:

- **No stage edge joins `SchemeAndStackFoundations` to `AlgebraicModuliForArithmeticGeometry`** in any
  of the three graphs (finding 1). `SF.1` requires LI.3, SF.0 and two Tau Ceti layers; `R09.3` requires
  only `R09.2` and `R09.4` only `R09.3`.
- **Finding 15's count is exact.** `SF.5` has 57 ancestors in the restructured atlas, and deleting the
  `SF.4` edge together with the five links RS-25 forwarded leaves exactly one — StableReduction Layer 4.
- **`StableReduction` has one incoming edge in total**, EllipticCurves Layer 4 → Layer 5 (findings 19,
  20, 21, 23), and **no `JacobianChallenge` stage has an edge into it at all**, although the document
  records four contracts in that direction.
- **`HodgeStructures` has no outgoing stage edge** from any of its four stages (finding 27).
- `C0` requires nothing, `R09.1` requires nothing, `C4`'s only in-edge is `C2`, `MC.2`'s in-edges are
  `MC.1`, `SF.6` and `SF.2`, `SF.6`'s only in-edge is `SF.5`, and `C5` reaches `MC.2` by no path
  (findings 3, 6, 12, 31, 33).

**Every declaration citation, at the pins.** All 29 `file:line` citations into Mathlib `082e2d3` and
Tau Ceti `f790474` resolve in local checkouts at those commits. I re-ran the library claims myself:
Mathlib has **no projective morphisms and no ampleness**, only `ProjectiveSpectrum` (finding 6); its
proper-group-scheme theorem is stated for a **proper geometrically integral** group scheme over a field
(`AlgebraicGeometry/Group/Abelian.lean`), so the inventory line finding 36 corrects is indeed false as
written; and the filtration API of finding 44 **has landed** —
`CategoryTheory/Filtration/Basic.lean` defines `Filtration` as a functor into `MonoOver X`,
`FilteredObject`, and `IsStrictHom` at line 144 as "each compatibility square is a pullback", which is
not Deligne's strictness.

**Every quoted repository string.** 292 of the quoted fragments matched verbatim across the roadmap
documents, `data/atlas.json`, the extracts, the restructurings, the link maps, the paper extractions
and the audits; the rest are quotations from the Stacks Project, Deligne, de Jong and Mathlib pull
requests. All eight restructurings the report relies on (RS-02, RS-05, RS-06, RS-18, RS-22, RS-25,
RS-31, RS-32) are in `data/restructure`, i.e. accepted, and AUDIT-01 does record the pairs findings 16,
31 and 38 cite.

**The "planned nowhere" searches**, re-run over all 1968 stage descriptions. None of *Artin
approximation*, *Popescu*, *Néron desingularization* (finding 2), the *Hodge–de Rham degeneration*
(4), *F. K. Schmidt* (7), *Picard number* (8), the *moduli stack of stable pointed curves* (17),
*Ehresmann* (30) or *Serre's theorems A and B* (32) occurs in any stage; *Néron–Severi* occurs in
exactly one, `NC.5`, which consumes it.

**The routes.** The three extractions that finding 2 turns on carry an item `P10`, "Formal moduli and
Artin approximation", with status `planned`, and the two the finding names are among them.
`PAPER-LAWRENCE-SAWIN-25/82` is status `missing` with the note "Neither library has Weil restriction
… and no layer of the atlas plans it", which is the misstatement finding 11 identifies, since `R09.3`
and `RG2.0a` both plan it. `PAPER-QIAN-23/130` is status `missing` with the note "No atlas stage plans
the relative statement", and its route sends it to `C2`, `C3` and `C5` (finding 4).
`PAPER-LAWRENCE-SAWIN-25/72` is status `planned` with the note finding 46 quotes.

## The findings that carry the most weight

**Finding 15, `SF.5`'s prerequisites.** The whole of Chow groups, Chern classes,
Grothendieck–Riemann–Roch, surface Riemann–Roch and the Hodge index theorem hangs off `SF.4`
(deformation theory, formal schemes, algebraization, alterations), which none of them uses, plus five
links RS-25 forwarded for a different purpose; and the count above shows that this is not a
technicality but the whole ancestor set.

**Finding 1, two carriers for stacks.** The two roadmaps plan algebraic spaces and algebraic stacks
independently, with no edge between them and two accepted restructurings pointing different ways. This
is the single largest duplication in the area.

**Findings 2, 3 and 4, three missing foundations.** Artin approximation (which the chosen route to
Artin's criterion needs, and which two routes already record as planned), complex analytic spaces with
analytification (the carrier of an entire roadmap, leaning on an unmerged pull request the atlas
records only as an external), and Kähler Hodge theory with the degeneration of the Hodge–de Rham
spectral sequence (needed by two accepted routes, which place it in two different homes).

**Finding 36, the inventory line.** "A proper group scheme is commutative" is false — the constant
group scheme of `S₃` over a field is finite, hence proper, and not commutative — and the pinned theorem
carries the geometric integrality hypothesis. Only the supplier's statement is wrong; the use is sound.

**Finding 45, the Tate-twist gloss.** A Tate twist shifts `p` and `q` together and so preserves
`p − q`; a structure of types `(3,0)` and `(0,3)` has `p − q = ±3` and is recovered by its complex
structure just as well. The first half of the document's sentence is right, which is why the finding is
low rather than medium.

## Limits of this check

I did not read the eight roadmap documents end to end, only the stages and sections the findings name
and their neighbours. The quotations from the Stacks Project, Deligne's *Théorème de Lefschetz*, de
Jong's alterations paper, Bosch–Lütkebohmert, Milne and Stichtenoth are the report's reading, not mine;
I checked their mathematical content against what I know of those results and found nothing that
weakens a finding, and every repository-side and library-side fact that each of them rests on I checked
myself. I add no finding of my own.

## Checks

    python3 scripts/check_redteam.py research/blueprint/redteam/RT-AREA-algebraicgeometry.result.json \
                                     research/blueprint/redteam/RT-AREA-algebraicgeometry.review.json

Both report no errors. Findings 1, 10, 11, 12, 13 and 14 are one cluster — `AlgebraicModuli` re-planning
what `SchemeAndStackFoundations` and the Tau Ceti roadmaps already own — and a fixer should settle the
ownership once rather than six times. Findings 19 to 26 are a second cluster: `StableReduction`'s
contracts exist in its document and nowhere in the atlas, and the missing edges there are the same edges
findings 24, 25 and 26 need from the other side.
