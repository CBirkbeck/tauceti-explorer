# REV-RT-AREA-iwasawa-1

**Job** REV-RT-AREA-iwasawa-1 (issue #1494) · **Date** 24 September 2026 · Claude Code, session
`cc-7b31c4` · **Verdict: all 39 findings confirmed, none rejected.** Red team by Claude Code, session
`cc-39fac3` (issue #1495, PR #2766); a different session, as the job requires. I did no part of
`RT-AREA-iwasawa-1`.

Repository baseline `45707f47`. Library baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Seven high, twenty-nine medium and three low findings over eight roadmaps and 74 stages; by kind, 15
error, 13 missing, 7 duplicate, 3 other and 1 library-claim. The thirty-six high and medium findings
become `FIX-RT-AREA-iwasawa-1`. Three findings — 5, 19 and 23 — are confirmed with a correction to the
scope of their reasoning, stated in their verdicts and repeated below; in each the defect and the fix
survive the correction.

**Disclosure.** I extracted `PAPER-DISEGNI-22` in an earlier job of this session. The red team's
`checked` list records that it read that extraction's routes, as one of the non-excluded papers, but
**no finding cites it**: I searched the whole result file, and the only three occurrences of the name
are in `checked`. Nothing in this verification turns on my own earlier work.

## What was checked

**The graph, recomputed.** This report is mostly about dependency structure, so I rebuilt the atlas
three ways — the raw stage edges, those plus the links of the accepted proposals applied through
`scripts/restructure.py`, and those plus the accepted link maps — and checked every `requires`,
ancestor and "no edge" claim. Every one holds, and several are exact:

- **`HE.8` and `HE.8b` have byte-identical descriptions**, 5951 characters each, and both edges the
  finding names exist (`HE.8 → BSD.7a` and `BSD.7a → HE.8b`) — finding 13.
- **`BSD.6` and `BSD.6a` have identical descriptions, as do `BSD.7` and `BSD.7a`**, while in each pair
  the `requires` differ and the accepted RS-30 gives the "a" stage a distinct role — finding 39.
- **The only `AutomorphicGaloisRepresentationsPartII` ancestors of `AC` `L1`, `L2`, `L2s` and `L5w` are
  `AG2.0` and `AG2.1a`** in every graph — finding 6.
- `GZ.1` reaches neither `RP.0` nor `RP.1` (3); `HE.8` has no edge from `GN.4` (1); `HE.6`'s requires
  are `ES.5`, `R17.5`, `HE.5` and `R17.3` is only transitive (8); `GZ.9` requires neither `L3h` nor any
  `GH` stage (11); `L5a` and `BSD.6a` are unjoined (30); `L5b` requires `L5a` and `HE.8b` and no Kato
  supplier (31); `SIC L4` is not an ancestor of `ESCMC L3` (21); `ES.2` is an ancestor of neither
  `ECMC L0` nor `Kato L2` (36); and **no stage of `CompletedCohomologyAndLocalGlobalCompatibility` or
  `PadicLocalLanglandsForGL2Qp` is an ancestor of `AC L3`** (28).

**Finding 19's counts are exact on the graph the report used.** On the raw atlas `SIC L2` has **39**
ancestors with the `PadicHodgeRegulators L1` edge and **14** without it — the finding's "39 instead of
14". On the restructured graph the numbers are 77 and 45, and with the accepted link maps 97 and 65.
The substance holds in all three: `PadicHodgeTheory R06.1`/`R06.2`, `PerfectoidSpaces P0`,
`AInfCohomology AI.0` and `CrystallineCohomology CR.0` enter a generic Selmer layer's ancestry through
that single edge, which the layer's own text says it does not need before `L4`.

**The library claim, read at the pin.** Finding 12 is the one library-claim finding and it is decisive.
`TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean:124` defines the canonical height as the
limit of the naïve height of `2ⁿP` divided by `2·4ⁿ`, and its docstring says in terms: *"The `2` is the
standard normalisation: `h` is the height of the `x`-coordinate, which has a double pole at infinity, so
`h` is attached to `2(O)` and the Néron–Tate height to `(O)` is half of it."* So the pinned height is the
one attached to `(O)`, not twice it, `GZ.0`'s premise is false, and the Gram-determinant consequence the
finding draws follows.

**Sources.** All seven declaration citations resolve at the pins, and 119 of the quoted repository
fragments matched verbatim across the roadmap documents, `data/atlas.json`, the extracts, the
restructurings and the audits; the rest are quotations from papers. All seven restructurings the report
relies on (RS-03, RS-06, RS-08, RS-14, RS-16, RS-30 accepted; RS-11 pending) have the status it gives
them, and `AUDIT-27` does carry the separate `BSD.6a` target that finding 39 cites.

**One source check in full.** Finding 37 says that "LLZ Theorem 5.10/5.13" is ambiguous between two
Lei–Loeffler–Zerbes papers. I read both e-prints. In *Coleman maps and the p-adic regulator*
(arXiv:1006.5163v2) **5.10 and 5.13 are both Theorems** — the integral-images statement and the basis
statement, verbatim as quoted. In *Wach modules and Iwasawa theory for modular forms* (arXiv:0912.1263v3)
**5.10 is a Proposition** on the logarithm matrix in the `a_p = 0` case and **5.13 is a Lemma** on the
kernels of the Coleman maps. The finding is exactly right, and so is its observation that an external
packet already sends a worker to the wrong paper.

## The findings that carry the most weight

**Finding 13, the duplicated stage record.** `HE.8` and `HE.8b` are the same 5951 bytes. The prose that
keeps `BSD.7a`'s import acyclic — "BSD.7a consumes only early HE.8 classes, never this completed
equality" — is therefore inside a record that also contains the completed equality, and the two edges
run in both directions between the pair and `BSD.7a`. A reader of the atlas cannot see the separation.

**Finding 6, the unitary Galois representations.** All three unitary routes of `AutomorphicCongruences`
argue with the Galois representations of `GU(2,2)` and `U(3,1)` cusp forms and their local–global
compatibility, and the stages that plan them reach none of those routes. This is the largest missing
edge in the area.

**Finding 12, the height normalisation.** A whole layer rests on a false premise about the pinned
library, and the correction changes the comparison of the library pairing with the source's by a factor
of two — which is exactly the kind of error a Gram determinant of rank `r` multiplies by `2^r`.

**Finding 14, a hypothesis that does not cover the case.** The Fouquet–Wan auxiliary-prime condition is
strictly stronger than the Skinner–Urban one, and the finding exhibits the family where the extra
condition fails, so the rank-zero ordinary branch imports a theorem that does not reach the cases it
claims.

## Three corrections to the scope of a finding's reasoning

- **Finding 5** lists `BSD.7a`'s suppliers as eight stages. Its `requires` are wider: also `BSD.5`,
  `BSD.1`, `GZ.0` and four Tau Ceti `EllipticCurves` layers. None of those contains Rubin's main
  conjecture for imaginary quadratic fields, the Hida–Tilouine anticyclotomic main conjecture, Hida's
  vanishing of the anticyclotomic `μ`, or Wüthrich's integral form of Kato's divisibility, so the
  finding's conclusion is untouched.
- **Finding 19**'s counts are right on the raw atlas and different on the other two graphs, as recorded
  above; its substance holds in all three.
- **Finding 23** says neither `R29.5` nor `R29.6` is an ancestor of `MIMC L3`. That is true of the raw
  atlas. Once the accepted restructurings are applied both become ancestors, but only along six-step
  incidental paths — `R29.5 → HE.1 → L3h → L5a → L5b → L5 → L3`, and `R29.6 → BSD.5 → BSD.7a → HE.8b →
  L5b → L5 → L3` — which carry Heegner and BSD material, not the modular parametrization `L3` asks for.
  There is still no direct edge and no roadmap-level prerequisite, so the defect stands.

## Limits of this check

The sources behind most of these findings are research papers in Iwasawa theory — Fouquet–Wan,
Skinner–Urban, Castella and the erratum, Castella–Liu–Wan, Burungale–Castella–Skinner, Jetchev–Skinner–Wan,
Hsieh, Eischen–Wan, Barrera–Dimitrov–Williams — and I did not read them. For those findings the
quotations and theorem numbers are the red team's reading; what I verified independently is every
repository-side and library-side fact each of them rests on, the internal consistency of each argument,
and, in full, the one locator finding (37) that could be settled from public e-prints. I did not read
the eight roadmap documents end to end, only the stages the findings name and their neighbours, and I
add no finding of my own.

## Checks

    python3 scripts/check_redteam.py research/blueprint/redteam/RT-AREA-iwasawa-1.result.json \
                                     research/blueprint/redteam/RT-AREA-iwasawa-1.review.json

Both report no errors. Findings 13 and 39 are one defect seen twice — an atlas record that carries two
stages' text — and a fixer should split all three pairs together. Findings 29, 30 and 31 are a second
cluster: `AC L5a` and `L5b` name the wrong theorems of one source, and the right ones are owned by
`BSD.6a` and by `KatoEulerSystems`, so the three should be repaired in one pass.
