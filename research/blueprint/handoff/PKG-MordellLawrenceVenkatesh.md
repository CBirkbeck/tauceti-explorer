# PKG-MordellLawrenceVenkatesh — complete package

Issue: #7493. Agent: Codex (GPT-6), session `codex-oRvPfM`.
Branch: `codex-oRvPfM-mordell-lawrence-venkatesh-package`.
The winning claim is confirmed in issue comment `6072709376`.

## Deliverables

- `research/blueprint/packages/MordellLawrenceVenkatesh/README.md`
- `research/blueprint/packages/MordellLawrenceVenkatesh/Suggested.lean`
- `research/blueprint/packages/MordellLawrenceVenkatesh/metadata.toml`
- this handoff

The README is a mathematical roadmap assembled from the accepted
`research/blueprint/packets/MordellLawrenceVenkatesh.json`, its reader and its
suggested file. No input or atlas data was changed. The upstream models read
in full were HodgeStructures and RepresentationTheory/SemisimpleAlgebras,
in `content/tau-ceti/`.

The roadmap covers all twelve layers LV.0–LV.11 and all 146 targets: 22
definitions, 11 constructions, 82 lemmas, 30 theorems and one comparison.
It retains 261 distinct API names (256 on definitions and constructions, plus
five on surface homology), 100 mathematical examples and all 39 named
milestones. Every target has a descriptive label matching the input, a short
theorem number, source locators and prerequisites. External inputs are grouped
at the start of each layer; dependencies inside this roadmap are given by
short theorem number at each target. The 76 supplier contracts are consolidated
under their 52 owning layers, with general proof interfaces stated explicitly.
The README is 197,673 UTF-8 bytes, below the 200,000-byte limit.

The introduction explains the centralizer/period-dimension argument and the
Kodaira–Parshin construction. The boundaries retain the existing and Part II
owners for cohomology, algebraic groups, topology, Jacobians, normalization,
continuous induction and comparisons. Common settings P, Q and C avoid
repeating whole family and surface hypotheses. Componentwise rank, opposite
fundamental-group transport, negative Hodge jumps, the twist sign and the
strict short-orbit cutoff are explicit.

## Verification

The pinned libraries are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.
The statements of all 95 cited baseline declarations were read at those
commits, and `data/library-coverage.json` was consulted. The README highlights
particularly delicate interfaces and names the remaining declarations at
consuming layers. Quotient Grassmannians, algebraic Mackey decomposition,
coordinate symplectic groups and the normalization carrier are not treated
as supplying their additional geometric or continuous comparisons.

All ten public source downloads matched the SHA-256 hashes in the accepted
input. The main Lawrence–Venkatesh citations use arXiv 1807.02721v3, not the
journal's pagination. Selected primary passages were checked, including the
period-dimension argument, the affine-cover monodromy construction and the
short-orbit arithmetic. This packaging job does not claim a new independent
line-by-line audit of all ten references or of the published journal version.
No source PDF or source passage is included in the deliverables.

Checks performed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/MordellLawrenceVenkatesh.json`: zero errors and warnings.
- `lean-check research/blueprint/packages/MordellLawrenceVenkatesh/Suggested.lean`: exit 0; zero errors; 136 warnings, all declaration-uses-`sorry` warnings. The final file was checked after comment reconciliation. Available memory before the check was 111 GB.
- Structural comparison with the accepted input: all 146 target labels, all 261 API names, all 100 examples, every target's source locator, all prerequisites and all 39 milestones retained; bibliography anchors resolve.
- Lean comparison after removing comments and normalizing whitespace: executable content identical to the accepted suggested file, with 18 distinct individual Mathlib imports in one import block.
- Submission-path/local-path check and whitespace check on the four deliverables.

The metadata is exactly `topic = "math.NT"`.

## Suggested-file scope and review notes

The complete suggested file compiles. Its concrete declarations use Mathlib;
it imports no Tau Ceti modules. This result verifies those signatures and
examples, rather than the supplier interfaces described in comments. The
accepted input explicitly records 79 gaps, including named theorem signatures
and missing comparisons. Those are not discharged by this packaging job:
the README specifies the mathematical inputs, and the suggested file retains
its explicit catalogue of partial or omitted signatures. No missing condition
was replaced by an arbitrary proposition, an axiom or a theorem assumed as
structure data. Nothing is claimed implemented or proved.

Stale owner labels in the input's suggested-file comments were reconciled
with its current target prerequisites: relative abelian-scheme cohomology
uses AbelianSchemesAndArithmeticModuli:A4; crystalline comparison uses
CrystallineCohomology:CR.1–CR.3/CR.7 and PadicHodgeTheory:R06.5; the relevant
scheme, group-orbit and local-field interfaces use their explicit owners.
The general Hurwitz local model is written with exponent n, and the reduced
Prym uses the integral-endomorphism kernel. No Lean declaration was changed.

The corrected mathematical statements recorded in the accepted source-issue
list are retained. In particular, the ramification set includes p-places;
local character identities are on units; the auxiliary place has odd residue
characteristic; the bad subspace is nonzero and proper and Frobenius is a
semilinear similitude; twist rank requires a nonseparating curve and a positive
sufficiently divisible power; the lifted twist uses the (q−1)-st power; distinct
symplectic factors are compared; and the counting union uses exponents 1–7.
The finite étale Hurwitz parameter scheme may be disconnected or empty.

The next step is the independent package review under PROTOCOL.md §20:
compare all labelled targets and supplier contracts with the accepted input,
check source hypotheses, and rerun the full `lean-check` command above.
There is no unfinished package assembly and no second job has been claimed.
