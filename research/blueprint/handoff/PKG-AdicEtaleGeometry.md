# PKG-AdicEtaleGeometry — checkpoint

Issue: #7455. Worker: Codex (GPT-6), session `codex-eh6QSZ`. Date: 2026-10-09.
The bot confirmed claim comment 6074010865. This is a blocked checkpoint, **not a
completed or compiled roadmap package**.

## What is saved

- `research/blueprint/packages/AdicEtaleGeometry/README.md`: a standalone
  194,499-byte draft in five layers, adapted from the accepted reader's mathematical
  body. It includes all 153 target labels, definition APIs and discriminating
  examples, conventions, neighbouring-roadmap interfaces, and a bibliography.
  T001–T153 connect the targets to a table with a principal source locator and
  their prerequisites. Internal prerequisites name individual targets; imported
  roadmap prerequisites name their supplying layers; library prerequisites retain
  declaration names. Additional clause-specific references remain in the prose.
  The repeated declaration index and editorial source-history sections were
  removed. The mathematics is stated without source excerpts.
- `research/blueprint/packages/AdicEtaleGeometry/Suggested.lean`: one header note
  and one block of 91 distinct imports, followed by the accepted suggested file's
  active declarations and examples. Its active token stream is unchanged from
  the input. Comments were edited for the package. The input's honest commented
  interfaces for unavailable geometric categories and sheafiness were retained;
  no arbitrary predicates were added to make those interfaces appear available.
- `metadata.toml` is deliberately **absent**. Its eventual contents should be
  `topic = "math.NT"`. Do not add it merely to satisfy the existence check: all
  three package files would then be treated as a complete submission although the
  mandatory Lean validation has not passed.

The authoritative inputs are unchanged:
`research/blueprint/packets/AdicEtaleGeometry.json`,
`research/blueprint/readmes/AdicEtaleGeometry.md`, and
`research/blueprint/suggested/AdicEtaleGeometry.lean`.

## Checks and the external blocker

`python3 scripts/check_blueprint.py research/blueprint/packets/AdicEtaleGeometry.json`
passed with **0 errors and 0 warnings**, for 153 targets (A0: 8, A1: 70, A2: 13,
A3: 41, A4: 21). This checks the unchanged input, not elaboration of the package.

A static correspondence check found every one of the input's **332 API names and
150 test names** in the suggested file, resolving namespace-local declaration
names as well as fully written comment names. It also compared both suggested
files with nested Lean comments removed: their active token streams agree.
The README has exactly 153 unique target anchors and 153 reference/prerequisite
rows. These checks are deliberately weaker than Lean elaboration.

After checking available memory (over 100 GB), the required command was run:

```text
lean-check research/blueprint/packages/AdicEtaleGeometry/Suggested.lean
```

It exited **1 at line 7**, before elaborating the body: the compiled object for
`TauCeti.AlgebraicGeometry.AdicSpace.Spa.Analytic` was absent. The default shared
build is also missing compiled objects for three other explicit imports:

```text
TauCeti.AlgebraicGeometry.AdicSpace.Spa.Analytic
TauCeti.AlgebraicGeometry.AdicSpace.Spa.HuberPair
TauCeti.AlgebraicGeometry.AdicSpace.Spa.Polydisc
TauCeti.RingTheory.Huber.Padic.Field
```

The default build's Mathlib is exactly
`082e2d37e8b0463410cdb532e111cd43d5a66174`, but its Tau Ceti checkout is
`cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than the required
`f790474821cf4256814db967cb154e7af3d0c369`. Other installed builds inspected
read-only either lack needed modules or use different Mathlib commits
(`dc4b8d60d5…`, `f6090c7095…`, or `30a58f795a…`). No existing usable build at
both pins was found. No library build, Lake project, cache download, update or
language server was started. The failed check finished; this worker has no
Lean process running.

The missing imports are used by the native analytic-locus, pair-morphism,
polydisc and p-adic examples. Deleting them, changing pins or substituting an
invented geometric interface would not validate the required package.
**The Lean body remains unvalidated.** Its unchanged origin is not evidence that
it has no errors once the imports become available.

The submission file check passed for the three changed files (0 problems), and
`git diff --cached --check` passed. No metadata file is staged. These checks do
not resolve the compilation blocker.

## Input boundaries that a continuation must retain

The input says `status: partial`; its 2026-10-02 accepted review is a scoped
review of the removal of the PerfectoidQuotients Q4 dependency from A3. That
review explicitly retains the older source gaps and says it is not a fresh
check of all 153 targets or 177 library citations. Do not describe this package
as closing those gaps. The 15 gap records and 12 requested interfaces remain in
the authoritative input; they were not edited or marked solved.

In particular:

- A1's affinoid-system approximation still needs the Banach-ring estimates in
  Kedlaya–Liu 2.2.3–2.2.4 and 2.6.6, and the Gel'fand-spectrum compactness input
  to 2.6.8. These are not supplied merely by the target that uses them.
- The higher-rank strict-localisation homeomorphism still requires its shrinking
  argument. Classification of all étale-topos points is outside the scope.
- T064 (pro-étale fibre conservativity) is a separate proof obligation under the
  corrected coverings. The printed proof uses a surjection that need not be a
  corrected covering. No downstream target uses T064. Abstract enough points
  come from coherence and Deligne's theorem, not from that proof.
- The non-section open surjection of profinite sets is inherited from the
  erratum's reference to Ribes–Zalesskii Example 5.6.9; this run did not read or
  reconstruct that example.
- Huber 1996's local structure, strict-localisation, dimension and relative-chart
  arguments remain inherited inputs. The private-library index does **not**
  clear that book; this run did not obtain or read any copy of it.
- A3 treats the étale, perfectoid-base specialisations needed for ECD 6.4(iv),
  not all smooth statements of Fargues–Scholze IV.4.13–IV.4.19. It does not
  import Q4, ECD 5.8, ECD 11.30 or ECD 15.6 to justify that approximation.
- The topologically henselian finite étale comparison is an imported
  PerfectoidSpaces P3 interface in the required field-free generality. The
  Gabber–Ramero proof was not newly read here. The uniformization case has the
  separate Kedlaya–Liu 2.8.16 reference.

The README exposes the mathematical limits rather than editorial history:
strong sheafiness wherever finite étale stability is needed; all valuation
ranks for geometric points; an explicit plus ring; adicness for completed tensor
formulas; separate uniformization; and complete base rings plus topological
nilpotence of p/ϖ^p in the perfectoid tower argument.

## Where to resume

1. Make an **existing** shared build with both required pins and the four native
   compiled imports available through the maintainer's build provisioning.
   Follow WORKERS.md: do not build libraries or change pins within this job.
2. Run `lean-check` on the package file and fix genuine declaration errors in
   this package only. Recheck the namespace-aware correspondence against all
   332 APIs and 150 tests after any code changes. Keep comments for conditions
   whose actual carriers cannot be stated; do not invent `Prop` stand-ins.
3. Finish the semantic comparison against the complete input, especially short
   A1 support lemmas and hypotheses inherited from the layer conventions. The
   current identifier/reference checks do not certify every theorem clause or
   independently establish the source proofs. Keep the README under 200 KB.
4. Add `metadata.toml` only when the final required validation has passed, update
   this handoff with the successful result, and submit the completed package.

For orientation, the upstream AdicSpaces and UniversalCovers READMEs were read
in full, as were the binding protocols and guide. The reviewed library audit
was inspected; it has no direct layer rows for this roadmap. Existing pinned
library statements were inspected from git objects. No public primary paper was
newly reread in this run: source versions and locators in this draft are inherited
from the authoritative plan, not a claim of a new source audit. No correction was
made to a packet, queue, atlas edge or neighbouring roadmap.

Everything needed for continuation is in the committed deliverables and this
note; the worker's scratch directory is disposable.
