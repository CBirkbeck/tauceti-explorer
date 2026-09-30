# REV-RT-RS-03 — independent verification

Verifier: Codex, session `codex-a71f92`, 30 September 2026.
Issue #4390. Explorer snapshot `3bfc4ea55d3e26ea61b01778f93766be4fe89bbe`.

## Outcome and scope

The submitted RT-RS-03 result is complete and contains **zero findings**.
The verification therefore contains zero verdicts. No fix job is warranted
by this finding set. This is not a certification that the eight member
roadmaps have no defects, and does not close previously confirmed area findings.

I did none of RS-03 (ChatGPT, `gpt6-20260921-r7c42a`), REV-RS-03
(Claude Code, `cc-442dc5`), or RT-RS-03 (Codex, `codex-rtOQ9t`).
Read the complete target result and report and the accepted REV-RS-03 report.
Checked the current proposal's structure, selected scope and provenance
records, the graph behavior below, and the particular existing-defect
exception that explains the empty finding set. This is verification under
PROTOCOL section 17, not a repeat of the entire eight-roadmap red-team survey.

Target Git blobs:

- `research/blueprint/redteam/RT-RS-03.result.json`:
  `63f4d655a76c986f2447800fc18dded0a430dd31`.
- `research/blueprint/redteam/RT-RS-03.md`:
  `708a2059a8b46ba83e68b238b1c230100f3c9c0e`.
- `research/blueprint/restructure/RS-03.result.json`:
  `fd9d5f192b17dc1c8e5fc2f875b6aeda89fab8cf`.

## Independent checks

**Version boundary.** The research proposal is byte-identical to its version
at the red team's audit snapshot `046729cdda0f7089f43ba13fea6d9be4542db0c9`.
It keeps eight roadmaps and contains 23 layer entries (22 narrow, one keep),
25 owners and 64 distinct directed links. The older promoted copy has 22
layer entries and 63 links. I read commit `a219414`'s proposal diff and
the computational and combinatorics fix records at their relevant sections.
The added AC.2 narrowing, AC.0 → ER.4 link, ER.4 former-owner entry and
AUDIT-16 identifier correction are exactly the later combinatorics changes.
The fixes explicitly defer the mirror to promotion and specify outstanding
README/report edits. The old review's 21-narrow count is historical, not
evidence that the current proposal erases Roth's theorem.

**Coverage and application.** The raw atlas has 1,968 stages and 3,508 edges.
The target report's 52 preservation-ledger rows match the 52 member-stage
keys exactly; this checks ledger coverage, not every row's mathematical proof.
Ran the actual `check_restructure.check` against the pinned family, atlas
and new-roadmap registry: no errors. Independently applied just the current
RS-03 proposal with `apply_restructurings` to the raw atlas in memory:
all 64 proposed pairs were added, none skipped, no prior edge lost, and all
stage IDs and original descriptions preserved. No hidden stage was produced.

**Graph falsification.** Checked each proposed pair for a target-to-source
return path in two explicitly bounded graphs:

- Raw atlas plus the 64 proposal pairs: 3,572 distinct edges.
- That graph plus in-registry declared requirements, 25 accepted research
  link maps, 31 accepted research restructurings and 27 promoted
  restructurings: 7,460 distinct edges.

Neither graph has a reverse path for an RS-03 pair. All 31 concrete
supplier/layer pairs in `suppliedBy` are reachable in the second graph.
This independently supports the relevant cycle and supplier claims; it is
not a global acyclicity certificate. It is also **not** the red team's
production-assembly experiment: I did not rerun `build.assemble`, its
8,007/8,008-edge calculation, or its larger union including unaccepted links.

**The already-tracked CN.3 defect.** Read CN.3's actual README and narrowing,
ModularForms Layer 8's symbol/Manin/Hecke and dual-period-map contracts,
`RT-AREA-computational/3`, its confirmed verdict, and its fixes report §/3.
The finding explicitly covers RS-03's generic UPSTREAM Hecke/Sturm supplier,
so this is not merely an unrelated area issue. Independently, Layer 8 has
no path to CN.3 even in the accepted union above. A generic UPSTREAM string
does not supply the missing concrete edge. The red team correctly leaves
this existing repair open rather than issuing it again.

The prior verifier's restriction remains binding: add Layer 11 only for a
selected computation that actually uses its level-one trace formula.
The older fixes report lists Layer 11 without that qualification; its edit
must be read with the confirmed verdict, not as a new unconditional supplier
requirement. This review does not amend or re-verify that separate fix job.

Read the actual declarations, with namespace and typeclass context, at the
clean pinned library checkouts:

- [Tau Ceti SturmBound.lean, lines 79–113](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/SturmBound.lean#L79):
  `sturm_bound_finiteIndex` and `eq_of_sturm_bound` require finite relative
  index, discrete strict periods and the specified cusp width/coefficient
  cutoff. They prove characteristic-zero vanishing/equality, not modular-symbol
  construction or congruence modulo a prime.
- [Mathlib DimensionFormula.lean, lines 307–313](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean#L307):
  `ModularForm.sturm_bound_levelOne` has the level-one q-expansion-order
  hypothesis, with negative weights handled separately in its proof.

Sources accessed 30 September 2026. The local pinned statements were read
directly; the Tau Ceti file was also opened at its public pinned GitHub URL.
These targeted checks support the report's stated boundary, not a new
library-wide absence search or a blanket re-audit of its other citations.

## Validation and limitations

- `check_redteam.py` on the exact target result and this review: both pass.
- Proposal checker and independent in-memory graph/application assertions: pass.
- Intake file checks on only the two authorized deliverables: zero problems.
- `git diff --check`: pass.

No Lean file is required or supplied, and no Lean elaboration was performed.
No Lake project, cache download, library build or language server was started.
The existing area defects, pending maintainer edits and unread mathematical
proof obligations remain open in their original records.
