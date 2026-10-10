# REV-FIX-RT-AREA-iwasawa-2~2 — checkpoint: dispatch scope remains blocked

Codex, session `codex-eh5SHn`, 10 October 2026. Refs #6219.
[Confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6099006386).
Branch `codex-eh5SHn-review-iwasawa`, input `e9e4af08c`.
One job claimed; the session did not write fixer `claude-6ZAIEy`'s work.

## State and blocker

The mathematical fix review already has verdicts for all six findings.
L3 is accepted; PMIA needs changes for the current-library migration specified
in the report. A negative verdict finishes a review when it names precisely
what to revise. It is not the reason this job remains incomplete.

The live issue's deliverables and “Files under review” omit these two packets
which the queue lists as outputs:

- `research/blueprint/packets/DirichletPadicLFunctions--L3-2.json`
- `research/blueprint/packets/PadicHodgeRegulators--D.1.json`

WORKERS.md says: “Edit only the files the issue names, plus your own scratch
space.” The actual `research/blueprint/issues.py` completion predicate
requires this job's reviewer in every output packet. It returns **False**:
L3-2 currently names `independent-review-REV-DirichletPadicLFunctions--L3-2`,
and D.1 names `independent-review-REV-PadicHodgeRegulators--D.1~2`.
Both are accepted under their independent original reviews. L3 and PMIA
already name this fix review's reviewer and need no receipt refresh.

**Correct the live dispatch before assigning this unchanged blocker again.**
The run's user was asked for explicit authorization for two concrete
review-only patches. No authorization arrived. The patches remained in
scratch; this checkpoint changes only the report and handoff. No packet,
suggested file, queue record, issue body or label was edited by the worker.

## Work completed in this continuation

The report preserves the previous complete finding verdicts and source-version
hashes, and adds a separately attributed continuation. Fresh focused readings
checked Morita/Gross–Koblitz, Zhao, Ertl–Nizioł, Colmez–Nizioł,
Nekovář–Nizioł and Dasgupta–Kakde at the numbered locators in the report.
Eight public PDF hashes agree with the previous report. The current read-only
Tau Ceti Fitting and stable-transpose declarations were read; their modules
are absent from the old pin. The reviewed library audit, current upstream
interfaces, LAD gap preservation and RS-16's independent proof-route decision
were also checked.

Fresh finite controls passed: 132 buffered Gamma congruences with an explicit
modulus-4 rejection, 60 strict permutation/filtration controls, 6,561
rectangular adjugate preimages including 891 singular submatrices,
non-generating-family relations and directed syntomic maps/rational scaling.
They do not establish infinite analytic or arithmetic supplier theorems.

All four packet checkers pass without errors. L3 has 26 inherited API-outline
warnings; the other three have none. No Lean file changed, so the previous
session's checks were preserved with their attribution and not repeated.
L3's previous check fails at missing `research` prototype imports;
L3-2, D.1 and PMIA previously elaborate with only proof-placeholder warnings.
No library build, update, cache download or language server was run.

## Exact resume action once scope is authorized

No new exhaustive audit or mathematical rewrite is needed for the receipts.
For each omitted packet, append its entire then-current `review` object to
`reviewHistory`, preserving every `checked` entry. Install a top-level review:

- `status`: `accepted`;
- `reviewer`: `independent-review-REV-FIX-RT-AREA-iwasawa-2~2`;
- `date`: the installation date;
- `notes`: identify the installing session, preceding independent review,
  bounded finding contract and validation. Do not claim fresh exhaustive
  review or supplier closure.

L3-2 notes cover finding /2: Zhao §1.2 p.461, Theorem 4.1 and
(4.1)–(4.6) pp.471–473, Appendices A–B pp.473–474; primitive odd character,
prime-to-p conductor, chi-omega branch, common logarithm/embeddings, general
conductor correction, strict Gamma endpoint and coefficient-limit
differentiation. Preserve the 79-entry audit, five gaps, eight requests and
E37; nonvanishing/simple-zero suppliers remain separate.

D.1 notes cover finding /3 and its four D.2 consumers: Ertl–Nizioł v2
§§2.1–2.2 pp.4–8, Colmez–Nizioł v4 Corollary 3.16 p.37/Theorem 5.4 p.54,
Nekovář–Nizioł v5 Remark 2.14 p.14/Proposition 4.13 pp.53–54. Preserve the
divided/undivided distinction, directed omega/tau maps, factorial twist,
exact divided range through p−2, bounded undivided comparison and rational
boundary scaling/sign. CS.0–CS.3 are external proposed producers; CP.4 is
only a proper rational anchor. Preserve the 72-entry audit, nine gaps,
twenty requests, seventeen source issues and eight planned stages.

Assert that removing only `review` and `reviewHistory` from both original
and patched objects gives equal objects, and that each preceding review was
archived whole. Run all four packet checkers and the intake file screen.
Import the actual `issues.deliverables_complete` function, select this job
from the queue and require **True** before reporting completion.

Keep PMIA `needs_changes`. Its coherent revision replaces generic plans in
`higher-fitting-ideal`, `relation-minors-add-generator`,
`higher-fitting-independence`, `higher-fitting-base-change` and
`transpose-stable-equivalence` by the current native imports/adapters, updating
consumers, both StableReduction requests, L4, the reader and suggested file
together. Retain non-generating-family and opposite/contragredient adapters,
order calculations and nonflat controls. That revision belongs to the next
fix job; it does not hold up completion of this negative review.

The report records public links, exact source locators and hashes. All scratch
PDFs, rendered pages, logs, finite controls and prepared receipt patches are
disposable. Everything needed by the next worker is recorded here.
