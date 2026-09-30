# REV-RT-PAPER-HARPAZ-WITTENBERG-20

**Complete: the one finding is confirmed.** Its fix scope is narrowed and made definite. The fixer follows the reason in the verdict file, not the red team's fix text.

- **Job:** Refs #4269.
- **Verifier:** Claude Code, session `cc-f805bf`, 30 September 2026.
- **Independence:** other sessions did all the earlier work on this paper:
  - the extraction PAPER-HARPAZ-WITTENBERG-20 (codex-a71f92, completed by cc-442dc5);
  - its review REV-PAPER-HARPAZ-WITTENBERG-20 (cc-7b31c4);
  - the errata file (cc-442dc5) and its review (codex-hjdg0j);
  - the red team RT-PAPER-HARPAZ-WITTENBERG-20 (cc-c2c06b).

  The string `cc-f805bf` occurs in none of the red-team, extraction or review files for this paper.
- **Verdicts:** [`research/blueprint/redteam/RT-PAPER-HARPAZ-WITTENBERG-20.review.json`](../redteam/RT-PAPER-HARPAZ-WITTENBERG-20.review.json). `python3 scripts/check_redteam.py` on it reports `ok`.

| Finding | Severity | Verdict |
| --- | --- | --- |
| /1: E1 and E2 recorded twice, with conflicting versions | medium | confirmed, with a narrowed fix |

## Evidence

**Paper.** I read the [author manuscript](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), fetched 30 September 2026. Its SHA-256 `2e425ee6…6ad9` matches the extraction's record. I also read [arXiv 1802.09605v2](https://arxiv.org/pdf/1802.09605v2), whose SHA-256 `54cd8757…f1de` matches the errata review's. Sections read:
- the quaternion paragraph (p. 4);
- §3 through Proposition 3.3 (pp. 12–15);
- §4 through Remarque 4.5 (pp. 15–17).

The version of record is J. Amer. Math. Soc. 33 (2020) 775–805, doi 10.1090/jams/943. It was not collated, as for all earlier work. The finding concerns how the atlas records the mistakes, not the published wording.

**Cited sources.** I read these in their author versions, and both hashes match the errata review's:
- [Demarche's manuscript](https://webusers.imj-prg.fr/~cyril.demarche/articles/BMgroupes.pdf): Corollaire 4.5 and Remarque 4.6 (p. 12), and §8 (p. 26).
- [Wittenberg's survey](https://www.math.univ-paris13.fr/~wittenberg/slc.pdf): Theorem 3.7 to Remark 3.9 (pp. 21–22).

**Repository.** Read at `f63511f2`. None of the files involved has changed since the red team's input `6bfc27fb`. I reproduced the register read-only with `scripts.errata.collect()`. No Lean was compiled; the finding does not need it.

## /1: the paper's two mistakes are recorded twice, and disagree (confirmed)

**The two records.** Both files carry `PAPER-HARPAZ-WITTENBERG-20/E1` and `/E2`, with these versions:

| | Extraction `sourceIssues` (REV-PAPER, 18:28 UTC) | Errata file (REV-ERRATA, 12:34 UTC) |
| --- | --- | --- |
| E1 `affects` | a stated result | the proof |
| E1 correction | add "X rationally connected" | rational connectedness is only a sufficient repair |
| E2 correction | m ≥ 3 | m ≥ 2, with Q₄ ≅ C₄ |

The errata review kept the older versions in its `assessmentHistory`, marked as superseded. Six hours later the paper review confirmed those same versions. `collect()` returns four HW20 entries, all confirmed, and `REGISTER.md` lines 8054–8057 print all four.

**E1, re-derived.**
- §4 fixes a morphism "dont la fibre générique est rationnellement connexe". Théorème 4.1's hypotheses are met "en vertu de [GHS03]".
- In Remarque 4.5 the fibres of π′ are universal torsors of V. Over k̄ a torsor under a split torus is Zariski-locally trivial, so the geometric generic fibre is birational to V × torus. It is rationally connected exactly when X is.
- The remark's hypotheses allow X that is not rationally connected, for example a K3 surface. So Théorème 4.2(i) is cited outside its setting.
- The implication itself is not shown false:
  - Proposition 3.3(i) gives the geometric section without rational connectedness;
  - Wit18 Remark 3.9 asserts the implication for any X with k̄[X]^× = k̄^× and free Pic;
  - nobody has a counterexample.
- So E1 is a gap in **the proof**, as the errata review says.
- Rational connectedness of X is a sufficient repair:
  - with it, the §4 setting holds;
  - the codimension-1 fibres over Q are split, because π is smooth;
  - CTS87 gives Br₁(Z) = Br₀(Z).

  Item 75's restricted statement is therefore true.

**E2, re-derived.**
- Page 4 prints "m ≥ 1".
- Demarche's §8 defines Q_(2^n) "si n ≥ 2".
- At m = 2 the relations give x = y² and y⁴ = 1, so Q₄ ≅ C₄. Demarche notes that SL/Q_(2^n) is rational for n = 2 and 3.
- So the statement holds for m ≥ 2. Items 104 and 105, at m ≥ 3, are true but drop the source's endpoint. Item 104's note calls m ≥ 3 "the standard range".

**sourceVersions.** `check_paper.py` runs only `check_issues`, not `versions_checked`. That is why an extraction E1 affecting "a stated result" passes without `sourceVersions`. The problem disappears once E1 leaves the extraction.

**Against the red team.**
- **The duplication is systemic.** `collect()` finds 676 ids in two files across 38 owners, most with identical content. Mere duplication is a tooling matter. What is specific to HW20, and confirmed, is that the records conflict and that the items follow the superseded versions.
- **Medium is right.** The public register shows contradictory verdicts, but no item is false.

**Corrections to the red team's fix:**
- `sourceIssues` becomes `[]`, rather than being deleted, next to `sourceIssueReferences`, as in PAPER-TSIMERMAN-18.
- Items 104 and 105 take **m ≥ 2**. The red team left the choice open.
- Item 75 keeps its statement; only its locator and note change.
- The matching text of the extraction's `.md` is in scope.
- The fixer does **not** rewrite REV-PAPER-HARPAZ-WITTENBERG-20.md. This verdict supersedes its E1 and E2 verdicts.
- The fixer does **not** run `scripts/errata.py` or edit `REGISTER.md` or `data/source-issues.json`. Those paths are outside the intake's allowed paths, and the intake regenerates them after the merge.

**Edits for the fixer.** These go in `PAPER-HARPAZ-WITTENBERG-20.result.json` and the matching text of its `.md`:
- `sourceIssues: []`, plus a `sourceIssueReferences` entry for the errata file with ids E1 and E2. Its note says: recorded and reviewed there; E1 affects the proof; E2 uses m ≥ 2 with Q₄ ≅ C₄.
- Item 75:
  - the locator reads "restricted to rationally connected X, a sufficient repair (E1)";
  - the note says that the remark cites Theorem 4.2(i) out of scope (a gap in the proof), and that rational connectedness is sufficient;
  - the note adds that the printed generality would need a section-based variant of Theorem 4.2(i) through Proposition 3.3(i), which stays open (the former G1).
- Items 104 and 105:
  - `m≥3` becomes `m≥2`;
  - the notes cite E2 and Demarche's convention (Q₄ ≅ C₄ is the cyclic case; m ≥ 3 gives the non-abelian groups);
  - the words "standard range" and "nonexistent standard groups" go.
- The extraction's summary sentence on the two findings, and in the `.md`:
  - the E1 paragraph's "corrected version" becomes "restricted version";
  - the E2 paragraph and the Grunwald sentence say m ≥ 2;
  - the "Mistakes found" section points to the errata file.

  The appended review section stays.

**Maintainer notes, not fixer edits:**
- `errata.py` prints every id held in both an extraction and an errata file twice.
- `check_paper.py` skips the `sourceVersions` check.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-HARPAZ-WITTENBERG-20.review.json`: ok.
- `python3 research/blueprint/intake.py check-files` on both files: 0 problems.
