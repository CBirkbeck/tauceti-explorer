# REV-RT-AUDIT-02 — independent finding verification

Complete: **1 confirmed, 0 rejected**. Finding RT-AUDIT-02/1 is a
low-severity metadata error. It does not change what is built or the verdict
for the Dirichlet-unit target or GN.1.

Agent: Codex — `codex-hjdg0j`, 2026-09-24, issue #1553. This worker did none
of AUDIT-02, REV-AUDIT-02 or RT-AUDIT-02. Claim 5805829922 was confirmed by
bot comment 5805830990 before work; the issue was reread afterward.
Input snapshot: `6d827255a8af2f260857e1fe60df4abc4ada32f5`.

## Evidence checked

Read the complete red-team result and report, prior accepted audit review,
the complete disputed unit target and its three citations, the GN.1
integrated coverage record and the exporter. The source target's note already
states that these theorems are declared in `NumberField.Units`, but its two
machine-readable names omit that prefix. Both shortened names also occur in
the exported coverage evidence.

Independently read the namespace stack, ambient assumptions, complete theorem
statements and proofs in
[DirichletTheorem.lean at the full Mathlib pin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean).
The file opens `NumberField.Units.dirichletUnitTheorem` at line 50,
closes the innermost namespace at line 350, then states the results in
`NumberField.Units`, closed at line 535. The assumptions are `Field K`
and `NumberField K`.

| Audit name | Actual declaration and content |
| --- | --- |
| `finrank_modTorsion` | `NumberField.Units.finrank_modTorsion`, line 457: the integer-module rank of ring-of-integers units modulo torsion equals `NumberField.Units.rank K`. |
| `exist_unique_eq_mul_prod` | `NumberField.Units.exist_unique_eq_mul_prod`, line 506: every unit has a unique torsion element and integer exponent vector expressing it in the chosen fundamental system. |

The line locators, library and file are correct. These are public proved
theorems. The adjacent deprecated `rank_modTorsion` alias is unrelated to
the two missing namespace prefixes. A short Lean identifier can resolve in
an opened namespace; a standalone audit citation must identify the actual
declaration independently of such a context. The namespace note makes the
intent recoverable but does not repair the `name` fields.

Fresh pinned remote bytes match the local source read, accessed 2026-09-24.
SHA-256: `05800241f09658240aaf15d8d96bf5db95134062a0c55d96964cccae20dc366c`.
Tau Ceti's paired pin remains `f790474821cf4256814db967cb154e7af3d0c369`;
no Tau Ceti declaration is needed to decide this finding. The declarations
index is not used as a substitute for reading the Lean namespace and source.

## Correct fix and its limits

Replace precisely those two `name` fields in
`research/blueprint/audit/AUDIT-02.result.json` with their full names.
Keep all other citation fields, the target text/note/library and the layer's
`partly built` verdict. Dirichlet's unit theorem remains a supplied target;
this is not evidence for downgrading it or rebuilding it.

`scripts/merge_library_audit.py` copies eligible declaration names verbatim
into evidence and caps the resulting list at twelve. Both disputed entries
currently survive, at the eighth and ninth positions in GN.1's nine-entry
evidence list. Normal audit integration will therefore carry both corrected
names into `data/library-coverage.json`. The generated file should not be
edited by hand. This review changes only its two authorized deliverables.

The confirmed verdict is confined to the one finding. It does not newly
certify the other 517 citations, every absence assertion, the four built
layers or the duplication sweep in the red-team report. No such additional
verification is implied by agreement with the two namespace corrections.

## Validation

The red-team checker passes on the result and this review; intake check-files
passes for both deliverables. Finding coverage is one-to-one. Publication
checks input immutability and exact two-file scope. No Lean file was changed
or compiled, and no new formalization is claimed.
