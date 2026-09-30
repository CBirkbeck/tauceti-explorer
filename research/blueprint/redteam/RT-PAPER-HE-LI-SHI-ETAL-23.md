# RT-PAPER-HE-LI-SHI-ETAL-23

Red team of the extraction PAPER-HE-LI-SHI-ETAL-23: He, Li, Shi and Yang, *A proof of the
Kudla–Rapoport conjecture for Krämer models*, Invent. Math. 234 (2023) 721–817. The red team is
Claude Code, session `cc-c2c06b`, 30 September 2026, issue #4144. The extraction is by `cc-fb70e5`
and its review by `cc-442dc5`. I did neither.

**Result: 1 finding, medium.**

## Finding

**1. Seven stated-result findings escape the version-of-record check. (other, medium)**

**What is exposed.**
- Seven of the 30 source issues affect a stated result: E1, E2, E7, E9, E14, E23 and E24.
- They include E7, the review's finding that Lemma 9.6 fails in a configuration that leaves a gap in
  the main theorem's proof.
- All seven were read against the authors' final version and arXiv v2, not the Invent. Math. version
  of record, and the file has no `sourceVersions`.

**Why the safeguard misses it.**
- §18 relies on the collation worklist (`scripts/collation.py`) to send such findings to the version
  of record. The worklist does not list this paper.
- `published_exists()` decides from `papers.json` whether a published version exists. This entry links
  only to the author's homepage, and its citation says "Inventiones Mathematicae (2023)".
- The `JOURNAL` pattern requires a word boundary after `Invent` and accepts only
  `Math(ematische|ematics|\.)`, so it matches neither "Inventiones" nor "Mathematicae".
- The tool therefore concludes that no version of record exists and drops all seven findings.

**Wider effect.** The same pattern hides seven other published papers, with 53 stated findings among
all eight:
- three more in Inventiones (Li–Zhang 22, Clausen–Mathew, Calegari–Geraghty 18);
- four in Acta Mathematica (Esnault–Groechenig, Nelson–Venkatesh, Nikolaus–Scholze,
  Koymans–Pagano).

**Fix.**
- Add `sourceVersions` here: the author copy with its hash, and arXiv v2. Record that the published
  version was not read, and keep the seven findings scoped to the author version.
- Correct the `papers.json` citation and point its link at the DOI.
- Ask the maintainer to widen the pattern to `Invent\w*`, `Acta` and `Mathematic\w*`, or to test by
  DOI instead.

## What held

**Stages.**
- All five cited stage ids exist.
- S.6 and S.7, narrowed by RS-18 before the review, still keep K-theory with supports, the gamma
  filtration and the Chow comparison, so item 10 stays planned.
- AL.0, QM.0 and GN.3 are unchanged. Neither library has the q-binomial theorem.

**The two Part IIs.** UnitaryKudlaRapoportCycles and UnitaryRapoportZinkSpacesAndRSZModels are shared
with five other extractions under identical ids and titles, and both titles match their parents'
current titles.

**Local densities.** The local-density items go to GN.3, as the Feng–Yun–Zhang extraction's do.

**The mathematics.** I did not re-verify the 30 source issues. The review checked them by
computation and re-derived E7.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-HE-LI-SHI-ETAL-23.result.json`: ok.
- No Lean was compiled.
