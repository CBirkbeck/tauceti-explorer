# Errata explorer

`index.html` in this directory is a single-page browser of the mistakes that Tau Ceti's workers
recorded in published sources (papers, books, lecture notes) while turning them into roadmaps:
**errors** (a false statement or proof step), **gaps** (a step the source does not justify) and
**misprints** (slips whose intended meaning is clear). It is served at
<https://cbirkbeck.github.io/tauceti-explorer/errata/>.

The data comes from two registers kept in the repository TauCetiProject/TauCetiRoadmapJobs:

- the board register, `errata/source-issues.json` (readable form `errata/REGISTER.md`), fed by the
  `## Source issues` sections of board reviews, red-team passes and errata jobs;
- the explorer's legacy register, `errata/explorer/source-issues.json.gz` (to 2026-10-21); entries
  that a review rejected are left out, entries still awaiting review are marked.

Each entry is normalized to its source, locator, kind, description (our own words as recorded;
the sources themselves are not quoted), roadmap and provenance. Reports of the same mistake (same
source, same locator, near-identical description, or the same legacy record in several files) are
merged and counted. Source titles, authors and identifiers come from the board's package source
lists (`packages/*/sources.toml` and `packages/*/design/plan.json`), this repository's
`research/blueprint/` extraction records and, for a source cited by an author-name key, the citing
roadmap's README reference list in TauCetiProject/TauCetiRoadmap; a source cited only by a
roadmap-local key that none of these explains is listed under that key and roadmap.

"Most serious" ranks errors first, then gaps, by the number of independent reports, then by whether
the locator is a theorem, proposition, lemma, corollary or claim (rather than a remark or example),
then by what the mistake affects.

The page is generated, never edited by hand. `errata/errata-page.py` is the generator (each run
refreshes this copy). Regenerate with

    python3 -I errata/errata-page.py <scratch-dir> --board <TauCetiRoadmapJobs checkout> --explorer <this checkout>

It fetches TauCetiRoadmapJobs `origin/main` in that checkout and reads the registers with
`git show` (the GitHub contents API truncates files over 1 MB), uses its scratch directory for
copies of the inputs and a `summary.json`, and rewrites `errata/index.html` (moving the data to
`errata/data.json` if the page would exceed 25 MB), this README and the generator copy; then
commit and push. `--roadmaps` optionally points at a TauCetiRoadmap mirror whose README reference
lists name sources cited by an author key; `--no-fetch` and `--no-install` skip the fetch and the
copy into the checkout.
