# PKG-AbelianVarietiesIsogenousToNoJacobian

Issue #7532. Agent: Codex; session: `codex-WAMoyJ`; date: 2026-10-10.
Branch: `codex-WAMoyJ-package-masser-zannier`.

## Deliverables and review scope

The three package files are ready for independent package review. The README
contains all 95 accepted targets in twelve ordered layers, all 85 API items and
all 57 unit-test specifications. Its approximately 89 KB retain the hypotheses,
source locators and direct prerequisites, while replacing the proof-step
catalogue with mathematical introductions, conventions and supplier contracts.
`metadata.toml` assigns `math.NT`. Only these three files and this handoff changed.

The source of truth is the accepted
`packets/AbelianVarietiesIsogenousToNoJacobian.json`, its reader document and its
suggested file. The independent design review dated 2026-10-05 explicitly
accepted a complete planning pass, with 27 gaps and twelve planned stages;
it did not certify proof closure or either supplementary research problem.
Those qualifications are preserved. No input packet, reader or suggested file
was edited, and no implementation or proof closure is claimed here.

**Lean scope:** the joined suggested file has the same three native targets as
the accepted input: `MZ0/period-matrix-correspondence`,
`I0/denominator-invertible` and `X0/newton-series`. They use actual Mathlib
matrix, derivative, polynomial and infinite-sum carriers. The other 92 targets
remain explicitly labelled omissions, with their mathematical statements,
prerequisites, API names and tests in comments. These are not elaborated
geometric signatures. This follows the honest-omission rule of PROTOCOL §13;
no artificial moduli carrier or replacement `Prop` field was introduced.
Package review must assess this inherited limitation explicitly against §20.
The README is the definitive mathematical specification.

## Mathematical boundaries preserved

- The main theorem requires `g ≥ 2`; no-Jacobian avoidance requires `g ≥ 4`.
  Isogenies are unpolarized, and compact-type products are handled through the
  Torelli closure inside the open moduli space.
- Rational Rosati trace is twice the real part of complex trace. The real
  rational Gram determinant, covolume and four entry estimates retain that
  convention. Short independent vectors are not asserted to be an integral
  basis, and product periods need not have ordered diagonals.
- The horizontal-offset estimate proved by the available union-bound argument
  is `2d⁴+1`. The sharper `2d³+1` bound and a horizontal exceptional-count
  theorem remain separate problems.
- Block counting concerns projected periods, not the algebraic part of the
  ambient matrix fibre. Constants retain their fixed-data dependence.
- Model fields, moduli fields, theta-coordinate fields and torsion fields
  remain distinct. The Fourier cutoff is strict, the common theta multiplier
  is required, and the explicit degree bound includes the quadratic allowance.
- Layer T1 is an arithmetic full-level comparison and total-degree research
  problem, independent of the main avoidance theorem. Cyclotomic containment
  alone does not trivialize the whole torsion module.
- Layer X1 proves the singular-space Satake/Remmert–Stein/Chow obstruction and
  records a local replacement specification. Compactness does not establish
  its existence. Source-context labels distinguish derived diagnostics and
  research problems from assertions of the original paper.

## Existing owners and upstream ordering

Read the current upstream Differential Geometry and Real Algebraic Geometry
READMEs in full. Checked the suggested files of all nine roadmaps newer than
the atlas snapshot, the Completed inventory, the current Tau Ceti library and
the relevant reviewed library-coverage records. The upstream roadmap checkout
was at `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`; current Tau Ceti was at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These were read-only inspections.
All fifteen baseline declarations cited by the input were checked at Mathlib
`082e2d3` or Tau Ceti `f790474` before relying on them.

Two prerequisites formerly pointing to
`GeometryOfNumbersAndQuadraticArithmetic:GN.1` minimum witnesses and
Minkowski's second theorem now point to existing **Integral Lattices, Layer
2F**, rather than planning that mathematics again. Its squared-length minima
must be converted to lengths in the Rosati application. Real Algebraic
Geometry owns generic semialgebraic projection; the denominator-clearing
specialization remains here. Existing Cholesky and native positivity APIs are
imported as existing results. No upstream file was edited.

This roadmap is outside the Caraiani–Newton tier list, so no tier or bundle was
invented and no notion was moved between tiers. Several geometric suppliers
are still proposed roadmap contracts. In particular the exact quantitative
isogeny/endomorphism, uniform Pila-block/functional-transcendence and
quantitative CM inputs require the named Part II interfaces. Those Part II
roadmaps have no registered stage identifiers in the inspected baseline; the
README specifies their mathematical obligations and does not manufacture
identifiers or derive them from qualitative parent stages. The maintainer must
resolve supplier availability and upstream ordering before an external
TauCetiRoadmap submission. This PR is the atlas package submission.

## Sources read and attribution limits

Rechecked the public published Masser–Zannier article and the three public
comparison sources below. Read the main-result statements and the passages
used for genericity, theta degree, density and interpolation in MZ20; this run
does not claim a new full proof audit of every cited external paper. Read
Demailly's singular-space extension and Chow statements with their intervening
proofs, Le Fourn's compactification statements, and BCCR's subgroup definition.
Source files were used only in scratch; no source file or verbatim passage was
added to the repository.

| Source | Read scope and public identity | SHA-256 |
| --- | --- | --- |
| MZ20 | [Published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf); main statements pp.635–640; targeted checks in §§3–5, especially pp.658–670 | `8b76bfac88374180701992e242d88f5d38fbe0b0cdb39c6c40c3c3fbbb874b60` |
| Demailly | [Author manuscript](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf); Chapter II (8.7)–(8.10), pp.118–121 | `d7c7654a7417e8322e5dcf8fe8ec818b4c1a18cf280b41f2df5a871b776d89a1` |
| Le Fourn | [Published PDF](https://msp.org/ant/2019/13-1/ant-v13-n1-p04-s.pdf); §6, Definition–Proposition 6.3, 6.4(a,b), Definition 6.5, printed pp.180–182 | `12e8666d4a8cdf2b865000021d79582f6a4dc30ecf4c574a9831b26f1e7b82f0` |
| BCCR17 | [Author manuscript](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/paper1.pdf); §2, p.3, Igusa diagonal conditions | `002d79a072f1accbfe2089853e3eb92f77abc7742f88227618594c916f19cf90` |

Igusa and Lekkerkerker page references remain indirect contracts identified
through MZ20, not claims that their original proofs were read here. The cleared
library index was consulted; no uncleared restricted book was obtained.
The original theta, Schottky, specialization and quantitative supplier proof
obligations remain as recorded by the accepted design.

## Validation and next action

- `python3 scripts/check_blueprint.py research/blueprint/packets/AbelianVarietiesIsogenousToNoJacobian.json`:
  zero errors, zero warnings; 95 targets, 85 API items, 57 tests, 27 gaps and
  27 requests. Input was checked without modification.
- An exhaustive package check matched every target, API name and test name to
  both deliverables, checked at least three tests for every definition and
  construction, and checked internal dependency order. No missing entries.
  README size is below 200 KB, has no programme-process vocabulary or private
  paths, and retains no `FoundationsAndLibraryIntegration` or `UPSTREAM:` alias.
- `lean-check research/blueprint/packages/AbelianVarietiesIsogenousToNoJacobian/Suggested.lean`:
  exit 0, zero errors, **17 warnings, all `declaration uses sorry`**. Memory was
  checked before compilation; no build or language server was started.
- The four deliverable paths pass the local swarm file check and
  `git diff --check`.

Resume with the independent package review: compare all twelve layers against
the accepted design, assess the documented native/prose boundary, and rerun
`lean-check`. No packaging work is reserved for a successor, and this worker
will not claim another issue in this run.
