# REV-FIX-RT-AREA-iwasawa-2~2 — blocked: live issue scope mismatch

Codex, session `codex-5QRLqC`, 10 October 2026. Refs #6219.
[Confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6099767639).
Branch `codex-5QRLqC-review-iwasawa-6219`.
This session did none of fixer `claude-6ZAIEy`'s work and claimed one job.

## Completed work and blocker

The existing report contains all six finding verdicts, source locators,
source-version hashes, exhaustive earlier audits and bounded continuations.
Those source readings remain attributed to the reviewers who performed them.
This continuation verified the live issue, queue, actual completion predicate,
current native Fitting/transpose declarations, and all four packet checkers.
Only the report and this handoff change. No packet, previous review history,
mathematical statement or suggested file changes.

The issue-named packets already have this job's reviewer: L3 accepted, PMIA
needs_changes. PMIA's negative verdict completes that review portion.
The queue additionally requires this job's reviewer in two packets absent
from the live issue's deliverables and files under review:

- `research/blueprint/packets/DirichletPadicLFunctions--L3-2.json`;
- `research/blueprint/packets/PadicHodgeRegulators--D.1.json`.

WORKERS.md says: “Edit only the files the issue names, plus your own scratch
space.” Concrete receipt patches were prepared and explicit authorization
requested from this run's user. No authorization has arrived, so they were
not installed. The actual `issues.deliverables_complete` predicate returns
**False**; a dry run substituting only the two prepared candidates returns
**True**. This dispatch defect is the sole completion blocker.
**Correct the issue scope before assigning another unchanged continuation.**
Do not change queue logic, fabricate an approval, or replace review identities
merely to bypass the predicate.

## Resume once scope is corrected or explicitly authorized

No fresh whole-source audit is needed to install the already reviewed bounded
receipts. For each omitted packet, append its entire then-current `review`
object to `reviewHistory`, preserving all previous history and every checked
entry. Replace its top-level review with an accepted receipt naming
`independent-review-REV-FIX-RT-AREA-iwasawa-2~2`, the installing date/session,
and the preceding reviewer. Cite this report's bounded source evidence without
claiming another session's source readings as your own.

**L3-2, finding /2.** The report checks Zhao §1.2 p.461, Theorem 4.1 and
(4.1)–(4.6) pp.471–473, Appendices A–B pp.473–474 against seven consumers:
`rjw2-fg-gamma-sum`, `rjw2-fg-count`, `rjw2-fg-permutation`,
`rjw2-fg-log-antidifference`, `rjw2-fg-differentiation`,
`rjw2-ferrero-greenberg`, `rjw2-fg-exceptional-derivative`, all under
`DirichletPadicLFunctions:L3/`.
Retain primitive odd chi with conductor N>1 prime to p, the chi-omega branch
and dyadic convention, compatible logarithm/embeddings, literal character
weights, the general correction term, strict Gamma endpoint, and coefficient
bounds/limits for differentiation. The shortened formula requires chi(p)=1.
Archive the complete 79-entry preceding audit; retain five gaps, eight requests
and E37. Acceptance concerns the correction, not arithmetic nonvanishing,
simple-zero or external supplier closure.

**D.1, finding /3.** The report checks Ertl–Nizioł v2 §§2.1–2.2 pp.4–8,
Colmez–Nizioł v4 Corollary 3.16 p.37/Theorem 5.4 p.54, and Nekovář–Nizioł
v5 Remark 2.14 p.14/Proposition 4.13 pp.53–54 against four consumers under
`PadicHodgeRegulators:D.2/`: `log-syntomic-complex`,
`fontaine-messing-kato-period-map`, `small-twist-comparison`,
`syntomic-exponential`. Retain distinct divided/undivided fibres, omega legs
`(p^r,id)`, tau legs `(id,p^r)`, scalar composites, factorial-modified twist,
exact divided range `0≤i≤r≤p−2`, bounded undivided comparison and rational
boundary scaling/sign. CS.0–CS.3 remain external proposed producers and CP.4
only the proper rational anchor. Archive the complete 72-entry preceding
audit; retain nine gaps, twenty requests, seventeen source issues and eight
planned stages. Acceptance certifies the correction contracts, not closure.

For both patches, assert parsed original/patched equality after removing only
`review` and `reviewHistory`, complete archived-review equality, and preservation
of every earlier history entry. Run all four packet checks and the intake file
screen. Import the actual predicate from `research/blueprint/issues.py`, select
this job from `queue.json`, and require **True** before reporting completion.
The prepared scratch files are disposable; this note contains their contracts.

## Validation and PMIA's next revision

Fresh packet checks: all four have zero errors; L3 has 26 inherited short-API
warnings, the others none. No Lean file changed and no Lean check was repeated.
The report preserves earlier whole-file results with their original attribution:
L3 fails at the unresolved shared `research` import; L3-2, D.1 and PMIA pass
with only `sorry` warnings. No process remains running.

Keep PMIA needs_changes. Current Tau Ceti commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` supplies `TauCeti.fittingIdeal`,
`fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_baseChange`, and
`AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`. Replace generic
plans in `higher-fitting-ideal`, `relation-minors-add-generator`,
`higher-fitting-independence`, `higher-fitting-base-change`, and
`transpose-stable-equivalence` with those imports and necessary adapters.
Update consumers, both StableReduction requests, L4, the reader and suggested
interfaces together in the next coherent fix job. Preserve non-generating-family
and deficient-relation controls, opposite/contragredient transport, order
calculations and nonflat tests. These newer native modules are absent from the
old programme pin and must not be attributed to it.
