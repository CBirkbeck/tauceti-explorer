# RT-PAPER-HARPAZ-WITTENBERG-20

Red team of the extraction PAPER-HARPAZ-WITTENBERG-20: Harpaz and Wittenberg, *Zéro-cycles sur les
espaces homogènes et problème de Galois inverse*, J. Amer. Math. Soc. 33 (2020) 775–805, read in
the author manuscript. The red team is Claude Code, session `cc-c2c06b`, 30 September 2026, issue
#4270.

The extraction is by `codex-a71f92`, continued by `cc-442dc5`, and reviewed by `cc-7b31c4`. The
errata file is by `cc-442dc5`, reviewed by `codex-hjdg0j`. I did none of them.

**Result: 1 finding, medium.**

## Finding

**1. The paper's two mistakes are recorded twice, and the records disagree. (error, medium)**

The extraction's `sourceIssues` and the errata file both carry `PAPER-HARPAZ-WITTENBERG-20/E1` and
`/E2`.

The errata review (REV-ERRATA-PAPER-HARPAZ-WITTENBERG-20, 23 September, 12:34 UTC) narrowed both:
- **E1** is Remarque 4.5's use of Theorem 4.2(i) without its rational-connectedness hypothesis. It
  now affects **the proof**, not a stated result. Adding rational connectedness of X is only a
  sufficient restricted repair, because Proposition 3.3(i) supplies a geometric section without it.
- **E2** is the quaternion range m ≥ 1. The correction becomes **m ≥ 2**, in Demarche's convention
  where Q₄ ≅ C₄, instead of m ≥ 3.

Six hours later the paper review (18:28 UTC) confirmed the extraction's older versions ("a stated
result"; m ≥ 3) without reconciling them.

The consequences:
- `research/errata/REGISTER.md` (lines 8054–8057) and `data/source-issues.json` list all four
  entries: each mistake twice, with conflicting `affects` values and corrections.
- The extraction's items follow the superseded versions. Item 75's note presents rational
  connectedness as the correction, and items 104 and 105 call m ≥ 3 "the standard range".
- The extraction's E1, as "a stated result", would need the `sourceVersions` list that §18 requires.
  The extraction has none; `check_paper.py` does not enforce the rule.

**Fix.**
- Keep one record per mistake, the reviewed errata file. Point to it from the extraction through
  `sourceIssueReferences`, as PAPER-TSIMERMAN-18 does.
- Rewrite item 75's note: rational connectedness is sufficient, and the remark's full generality
  needs the section-based variant.
- Restate items 104 and 105 with m ≥ 2 (Q₄ = C₄), or say explicitly that they mean non-abelian
  groups.
- Correct the paper review's account of E1 and E2.
- Regenerate the register.

## What held

**Routes.**
- All 14 routes and all 15 cited stage ids exist in the atlas.
- Five of those stages have since been narrowed, and the routed items still fit:
  - RP.3 (RS-03) keeps torsors, twists and descent, which fits route 7's torus descent.
  - IG.0, IG.1 and IG.4 (RS-29) keep π₁ of G/H and the local constraints of embedding problems.
  - SF.4 (RS-25) keeps "proved resolution settings".

**The two Part IIs.**
- They coalesce with HW23's route 8 and HW16's route 11 under identical ids and titles.
- Every result the three papers share goes to the same Part II in each: HW16's Conjecture 9.1,
  Corollaries 8.4(1) and 9.25, Theorem 8.3(3) and Lemma 8.2.
- They depend on each other at item level:
  - Theorem A in ZeroCycles uses the universal-torsor and finite-stabilizer results in
    HomogeneousMassey.
  - Theorem 6.6 in HomogeneousMassey uses the rational-connectedness items in ZeroCycles.
- Both briefs prescribe a stage order without a cycle, and PROTOCOL asks for acyclicity only between
  stages.

**Rational connectedness.** No stage in the atlas plans it: SF.4's birational geometry was narrowed
away. So the ZeroCycles Part II is its only owner.

**Missing statuses.** I checked these against their likely owners, and they stand:
- H³(k, G_m) = 0: Tau Ceti's ClassFieldTheory Layer 10 has only the finite-level H³.
- Pic(G) = 0 and the units of simply connected groups.
- Unipotent homogeneous spaces.
- The Hasse principle for torsors under simply connected groups: AA.4 plans weak approximation
  only.

**Duplication across extractions.** No other extraction plans this material apart from HW16 and
HW23, which coalesce as above.

**The version of record.** As for the extraction and both reviews, the published PDF was not
reachable. ams.org serves a Cloudflare challenge and pubs.ams.org a login viewer.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-HARPAZ-WITTENBERG-20.result.json`: ok.
- No Lean was compiled.
