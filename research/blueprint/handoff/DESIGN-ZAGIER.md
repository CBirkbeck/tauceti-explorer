# DESIGN-ZAGIER — research checkpoint

Worker: **ChatGPT Pro — cgp-90e290474810**. Issue: **#11**.

This is an in-progress checkpoint, not a completed blueprint, submission, review, or implementation claim. The claim was accepted by the workflow in issue comment 5696748653, responding to claim comment 5696746340. Work is confined to the four files authorized by the issue.

## Revisions

- Explorer input revision: `49f74b4d2bace99a76ceff4ac2199a3384c83c57`.
- Mathlib baseline: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti baseline: `f790474821cf4256814db967cb154e7af3d0c369`.
- Isolated branch: `cgp-90e290474810/design-zagier`.
- Source access date: 2026-09-16.

## Findings already checked

1. The supplier document `content/campaign/K3BlochGroups/README.md`, V.3–V.4, distinguishes Suslin's integral antisymmetric tensor quotient from the exterior square and uses the enhanced torsion term in the infinite-field exact sequence. The Zagier roadmap must work rationally and explicitly transport between conventions; it cannot identify the integral groups from agreement of real regulators.
2. `content/campaign/Polylogarithms/README.md`, P.2–P.4, already claims the low-weight regulator comparisons, a weight-three special-value consequence, and general statement infrastructure. This overlaps the new job's assigned ownership. A concrete rescope proposal is required; no supplier files or reserved IDs will be changed by this worker.
3. `content/campaign/BorelRegulators/README.md`, R.3–R.7, separates rank, regulator lattice, zeta proportionality, and the Borel–Beilinson scalar. Rank alone is not enough to deduce a determinant formula, and a nonzero real scalar is not enough to preserve rational proportionality.
4. The source currently served as arXiv:1803.08585 is **v5, 15 July 2026, 111 pages**. Its displayed Theorems 1.1–1.2, pp. 3 and 5, absorb the rational coefficient into a determinant column. A uniform all-number-fields roadmap statement must retain a nonzero rational prefactor: for `r₂ = 0` the determinant is empty, hence equals 1 and cannot absorb a coefficient. The test `F = Q`, `ζ(4) = π⁴/90`, detects this edge case. The original Zagier article, printed p. 392, explicitly uses equality up to a rational factor and records this zeta value. The exact-equality rescaling form should therefore be restricted to positive determinant size.

Primary passages actually inspected for item 4:
- Goncharov–Rudenko, arXiv:1803.08585v5, introductory definitions and Theorems 1.1–1.3, pp. 3–7: https://arxiv.org/pdf/1803.08585 . Displayed statements on pp. 3 and 5 were visually checked.
- Zagier, *Polylogarithms, Dedekind zeta functions, and the algebraic K-theory of fields*, author-hosted scan, printed pp. 391–392: https://people.mpim-bonn.mpg.de/zagier/files/scanned/PolylogsDedekindZetaAndKTheory/fulltext.pdf . These pages were visually checked. The author's publication list dates the volume 1990, whereas the issue calls it 1991; the eventual source record must distinguish the exact edition inspected rather than silently conflate dates.

## Worklist

- Finish reading two relevant upstream roadmap documents and the exact supplier-node statements, not just their titles.
- Inspect the selected sources recursively along the proof dependencies, keeping separate the existential determinant identity, rationality for arbitrary admissible tuples, and motivic comparison isomorphisms.
- Search both pinned libraries and read the actual statements of every baseline declaration cited.
- Construct declaration-sized nodes, API outlines, coverage records, cross-roadmap requests, and a document agreeing with the packet.
- Check the rational prefactor, conjugation/row conventions, zero-rank case, and source-model comparisons explicitly.
- Re-check relevant inputs and issue ownership before durable submission.

## Validation and access status

No deliverable validator has run yet. The checker source has been inspected in part. The GitHub file reader returned an empty content field for the large `data/atlas.json` despite reporting a nonempty-file blob SHA; this is an access limitation, not evidence that the atlas is empty. Direct network download from the execution container failed. These limitations must not be hidden by reporting a fabricated full-repository validation. Further supported retrieval and CI routes remain to be checked.

No Lean code has been written and no formalization is claimed.
