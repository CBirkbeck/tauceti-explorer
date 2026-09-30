# Verification of RT-PAPER-HE-LI-SHI-ETAL-23

Codex, session `codex-rtOQ9t`, issue #4143, 30 September 2026.
Input revision: `8044fa308f414e3f39b58636beee6f046b27ebb7`.

**Finding /1: confirmed, medium, with corrections to its scope and fix.**
The seven stated-result entries from the Krämer-model extraction are wrongly
omitted from the source-collation worklist. The proposed metadata repair would
accidentally hide them again. Also, seven published papers with 51 entries,
rather than eight with 53, are established as the wider affected set.

I did none of the three excluded jobs. The extraction is by Claude Code
`cc-fb70e5`, its review by `cc-442dc5`, and the red team by `cc-c2c06b`.
I read the complete red-team result/report, the relevant extraction provenance
and source-issue entries, the independent review's source declaration,
PROTOCOL §§17–18, the catalog entries and the actual collation implementation.

## Direct reproduction

At the input revision:

- `sourceVersions` is absent from `PAPER-HE-LI-SHI-ETAL-23.result.json`.
- `collation.stated()` returns precisely **E1, E2, E7, E9, E14, E23, E24**,
  seven of the extraction's 30 source issues.
- `collation.provenance()` returns `preprint`.
- `collation.published_exists()` returns `False` for the catalog entry. Its
  link is the author's homepage, and its citation uses “Inventiones
  Mathematicae (2023)”. The regex's `Invent` alternative requires the word to
  end there, and none of its `Math...` alternatives matches `Mathematicae`.
- `collation.exposure()` gives 70 papers and 350 stated-result entries; the
  Krämer-model paper is absent. Supplying just its DOI link in an in-memory
  copy of the catalog makes all seven entries appear.

The absence of a published edition is not in doubt for this paper:
[Springer's article page](https://link.springer.com/article/10.1007/s00222-023-01209-1)
identifies the version of record as 21 July 2023, Inventiones mathematicae 234,
721–817. The [author's homepage](https://www.math.columbia.edu/~chaoli/)
also records that citation and DOI. Both pages were opened on 30 September
2026. The publisher's page supplied bibliographic metadata and an abstract,
with the mathematical body behind its access prompt; it was not a collation
of the printed statements.

The two accessible PDFs were independently fetched on the same date:

| Version | Read scope in this verification | SHA-256 |
|---|---|---|
| [Author's Kramer.pdf](https://www.math.columbia.edu/~chaoli/Kramer.pdf) | Identity/date, 82-page count, and Lemma 9.6's locator on pp. 74–75; p. 74 also viewed as an image | `a29d282011c4972663376d1dd86c40d8dc494d259c82d6d652e23bd1fffc8623` |
| [arXiv 2208.07988v2 PDF](https://arxiv.org/pdf/2208.07988v2) | Identity, first page and 82-page count; the [version record](https://arxiv.org/abs/2208.07988v2) gives submission on 25 June 2023 | `00e096d6e9b511934382db1e41dc4cf22419a021df06af58d2689dfb60b98b17` |

Both hashes match the extraction. This verifies which documents its records
identify. It does not make an author manuscript the version of record, nor
does it independently confirm the mathematical counterexamples in E1–E30.
The red-team finding is about failure to route those claims for collation,
not a request to repeat the complete mathematical extraction review.

## Correct the wider count

All eight named records reproduce the reported boolean failure and their
stated-result counts sum to 53. However, one is not established as published.

| Paper ID suffix | Stated-result entries | Publication evidence checked |
|---|---:|---|
| HE-LI-SHI-ETAL-23 | 7 | [Invent. Math. 234 (2023), 721–817](https://link.springer.com/article/10.1007/s00222-023-01209-1) |
| LI-ZHANG-22 | 5 | [Invent. Math. 228 (2022), 1353–1460](https://link.springer.com/article/10.1007/s00222-022-01106-z) |
| CLAUSEN-MATHEW-21 | 6 | [Invent. Math. 225 (2021), 981–1076](https://link.springer.com/article/10.1007/s00222-021-01043-3) |
| CALEGARI-GERAGHTY-18 | 27 | [Invent. Math. 211 (2018), 297–433](https://doi.org/10.1007/s00222-017-0749-x) |
| ESNAULT-GROECHENIG-20 | 4 | [Publisher-deposited Crossref record: Acta 225 (2020), 103–158](https://api.crossref.org/works/10.4310/ACTA.2020.v225.n1.a2) |
| NELSON-VENKATESH-21 | 1 | [Publisher-deposited Crossref record: Acta 226 (2021), 1–209](https://api.crossref.org/works/10.4310/ACTA.2021.v226.n1.a1) |
| NIKOLAUS-SCHOLZE-18 | 1 | [Publisher-deposited Crossref record: Acta 221 (2018), 203–409](https://api.crossref.org/works/10.4310/ACTA.2018.v221.n2.a1) |
| KOYMANS-PAGANO | 2 | [Author's publication list](https://webspace.science.uu.nl/~koyma001/publications.html) still says **“To Appear in Acta Mathematica”** |

The first seven give **51 entries**. The Koymans–Pagano extraction likewise
records an accepted/to-appear paper, no volume or issue and no DOI. Its catalog
citation has no year, so expanding the journal-name alternatives alone would
not match it anyway. A version of record was not established in this check;
do not count these two entries as confirmed omissions from a worklist that
requires one. This does not prove that no later publication can be found.

An in-memory expansion for `Inventiones`, `Acta` and `Mathematica` produced
exactly seven additional rows: **77 papers, 401 entries**, preserving the
exclusion of Koymans–Pagano. The diagnosis and medium severity for the Krämer
paper remain valid after this correction.

## Correct the proposed fix

The result's proposed `sourceVersions` array includes this conceptual entry:

```json
{"kind": "published", "citation": "not read (Springer blocks automated fetching)", "read": "2026-09-22"}
```

That entry must **not** be added to the list of readings. In the current
`provenance()` implementation, the presence of any `kind: published` wins
immediately; neither the citation's disclaimer nor an access-status field is
examined. I reproduced that it yields `published` and suppresses the row even
after the DOI/catalog repair. It would turn an honest access failure into a
machine-readable assertion that collation was complete.

The correct repair is:

1. Add only the author-copy and preprint entries actually read. Preserve the
   extraction's historical date, 22 September 2026, and the hashes above.
   Record the unsuccessful publisher attempt as a note, without a published
   entry in the current readings schema. Keep the findings scoped to those
   texts until the actual version of record is collated.
2. Correct the catalog citation and link for this paper to its established
   journal record/DOI. A DOI identifies the publication; it does not establish
   that its text has been read.
3. Repair recognition of the full journal names in the appropriately scoped
   tooling fix, while keeping genuine arXiv-only and to-appear records out of
   this publication-required queue. A structured publication-status/DOI
   approach is also possible. If access attempts are later made structured,
   their handling must explicitly distinguish unsuccessful attempts from
   completed published-text readings.
4. Add regressions for all seven recognized publications, the to-appear
   control, and a failed publisher attempt. Check that the Krämer extraction
   stays `preprint` and remains exposed after adding its actual reading
   records. Regenerate the worklist only in the authorized fix scope.

These recommendations are recorded for the fix worker/maintainer. This
verification changes neither the extraction/catalog nor the collation tool.

## Reproduction and validation

The following essential assertions were run without mutating repository data;
the expanded-pattern check was also run separately against all catalog records.

```python
import copy, json, sys
sys.path.insert(0, "scripts")
import collation

papers = {x["id"]: x for x in json.loads(
    (collation.PAPERS / "papers.json").read_text())["papers"]}
records = collation.records()
k = "PAPER-HE-LI-SHI-ETAL-23"
r = records[k]
assert not collation.published_exists(papers[k])
assert collation.provenance(r) == "preprint"
assert [x["id"].split("/")[-1] for x in collation.stated(r)] == [
    "E1", "E2", "E7", "E9", "E14", "E23", "E24"]
assert k not in {x["paper"] for x in collation.exposure(records, papers)}

fixed = copy.deepcopy(papers)
fixed[k]["link"] = "https://doi.org/10.1007/s00222-023-01209-1"
assert k in {x["paper"] for x in collation.exposure(records, fixed)}
bad = copy.deepcopy(r)
bad["sourceVersions"] = [{
    "kind": "published", "citation": "not read", "read": "2026-09-22"}]
assert collation.provenance(bad) == "published"
assert not collation.exposure({k: bad}, fixed)
good = copy.deepcopy(r)
good["sourceVersions"] = [{
    "kind": "author copy", "url": "https://www.math.columbia.edu/~chaoli/Kramer.pdf",
    "read": "2026-09-22"}]
assert collation.provenance(good) == "preprint"
assert collation.exposure({k: good}, fixed)[0]["stated"] == 7
```

Input SHA-256 fingerprints:

- Red-team result: `c689e84966ca521ec6a45576ea4ebd6e1308628b2a02b12053a1639edb2720bf`.
- Extraction result: `b3149ecd1452e8b8ccd0ca5bbd493213e1db5454e15ae9a95f025a64a148d225`.
- `scripts/collation.py`: `28ef5ab00bc800ae024bae4d345c47f93521365dd1d9c0d9e8772c92e2e9b9c5`.
- `papers/papers.json`: `23e223d9e2c26cbd65abf5eba001ecae6d1213d6660423b085df544f2597334b`.

The review JSON passes `scripts/check_redteam.py`; both deliverables pass
`research/blueprint/intake.py check-files` and the staged whitespace check.
No Lean declaration is disputed by this finding, no Lean file is required,
and no Lean compilation or library build was run.
