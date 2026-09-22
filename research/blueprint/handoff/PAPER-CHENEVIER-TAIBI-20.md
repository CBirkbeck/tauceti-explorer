# Handoff: PAPER-CHENEVIER-TAIBI-20

Claude Code, session `cc-d67081`, 22 September 2026 (issue #1452).

## Done

The extraction is complete. The whole published article (Publ. Math. IHÉS 131 (2020) 261–323, open-access PDF) was read, and compared with arXiv v1, the only arXiv version. Every missing item is routed exactly once, and `scripts/check_paper.py` reports ok.

Deliverables:
- `research/blueprint/papers/PAPER-CHENEVIER-TAIBI-20.result.json` (151 items, 12 routes, 11 source issues);
- the report `research/blueprint/papers/PAPER-CHENEVIER-TAIBI-20.md`.

## Judgement calls for the reviewer

**One new roadmap.** `LevelOneAutomorphicFormsForClassicalGroups` takes 116 items. The alternative was to spread them over Part IIs of four roadmaps:
- ModularityAndLanglandsExtensions, for the multiplicity formula;
- AutomorphicSpectralTheory, for the masses;
- AutomorphicBundles, for Siegel forms;
- GeometryOfNumbersAndQuadraticArithmetic, for theta series.

I chose one roadmap because every step feeds the next: the classification gives the vanishing results, the vanishing results give the masses, and the masses give the Siegel dimensions. The programme (Chenevier–Lannes, Chenevier–Renard, Taïbi) is one body of work, and nothing in the atlas starts it. The general inputs go to their owners as 18 source items.

**The Chenevier–Lannes book is the foundation.** Like Pan's first paper in the maintainer's guides, it should be covered first. It is listed as a prerequisite; the brief names the results of the book that the roadmap uses.

**One owner for Miller's theorem.** PAPER-BOXER-CALEGARI-GEE-25 (my earlier job) routes the same theorem to its proposed Part II LevelOneCuspidalCohomologyGLn, in the form of the Fermigier–Miller vanishing. It is item `miller-theorem` here. If both routes are accepted, the explicit-formula layer of this roadmap should own it, and the Part II should import it. The brief says so.

**Borderline statuses.**
- **Siegel modular forms** are marked planned by AutomorphicBundles B4, which defines classical forms as sections and names the Siegel Hodge bundle and Schur weights.
- **X_n and ϑ_g** are marked planned by GN.3, because it plans "arithmetic quotients" and "theta-series interfaces", and ϑ_g also by MP.5.

A stricter reading would make these three items missing, routed to the new roadmap.

## Source issues

E3 and E6 matter most. Both were found with the authors' own data and code ([CT19b], `levelone_src_data.tar.gz`).

- **E3.** The normalisation (2.4.4) of β_Q, the one the code uses, is inconsistent with the 1/√m weights of Corollary 2.9 and of the output of Algorithm 2.4.5.
  - The displayed element in §4.1 has C(x, x) ≈ +0.078.
  - The theorems stand, because every certificate is a negative value of β_Q, and that gives a valid element with weights 1/m.
- **E6.** The parameter of Proposition 4.1(1) is in the list V, according to the authors' certificate file. So the paper does not prove the non-self-duality clause.
  - One extra certificate (δ = 1, m = 2) closes the gap. My floating-point run finds −0.175 at ℓ = 7.75 with S′ = {1, Δ_21, Sym²Δ_11, Δ_{23,7}}.
  - It still has to be certified in interval arithmetic before a formalisation uses it.

The other nine are small, listed in the report.

## Reproducing the checks

None of these scripts is in the repository.
- I ported the authors' PARI functions for F_ℓ (`without_GRH.gp`, `testfin.gp`) to Python with mpmath. The port reproduces seven of their certificate values to six digits.
- I recounted Tables 2–3 and the Lemma 4.3 candidates, and redid the enumeration of §5.3.1.
- I checked Remark 3.10 against the twenty mass files, and the §4 counts against the certificate files and the log.

A reviewer who wants to redo these checks needs the authors' archive (URL and SHA-256 in `source.readSections`) and any arbitrary-precision library.

## Remaining

Nothing for this job. The cited inputs other than Mestre 1986 were not read: Arthur, Chenevier–Lannes, Taïbi, Moeglin–Renard, Arancibia–Moeglin–Renard, Böcherer, Rallis and others. The items that rest on them say so. The book is paywalled; Taïbi 2017, Moeglin–Renard and Arancibia–Moeglin–Renard are on arXiv, should a reviewer want to check the quoted statements.
