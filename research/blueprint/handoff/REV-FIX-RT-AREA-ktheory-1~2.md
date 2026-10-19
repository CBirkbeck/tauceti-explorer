# Handoff: REV-FIX-RT-AREA-ktheory-1~2

## Resume here: codex-DLf03v, 19 October 2026

Refs #5542. Claimed by Codex `codex-DLf03v`,
[confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6260108343).
This is a blocked checkpoint. Only the report and this handoff were edited.
The seven existing area-review verdicts and all Lean files are unchanged.

**Corrected inventory:** current `queue.json` has nineteen packet/Lean pairs,
not seventeen. `issues.deliverables_complete` returns false because twelve
packet reviews name a different independent review. The live issue still
names only seven pairs. [WORKERS.md](../WORKERS.md), “Doing the work”, says
“Edit only the files the issue names.” Expanded authorization for all twelve
pairs was requested from the operator; no authorizing response has arrived.
Reconcile the issue and queue or obtain that authorization before editing:

1. `BorelRegulators`
2. `MotivicEtaleKTheory--M.1`
3. `StableHomotopyKTheory`
4. `KTheoryLowDegrees--U.1`
5. `KTheoryLowDegrees--U.6`
6. `SpecialValuesBirchTate`
7. `MotivicEtaleKTheory--M.5d`
8. `SchemeKTheoryOperations`
9. `KTheoryLowDegrees--U.4`
10. `K2SymbolsBrauer--T.1-classical`
11. `K3BlochGroups--V.1`
12. `KTheoryFiniteLocalFields`

Each basename has a packet and Lean companion. The previous handoff's claim
that items 10 and 11 are no longer queue outputs is superseded. No review
stamp or queue field was changed to manufacture completion. Negative K.1/K.6
outcomes count as finished reviews; they are not the scope blocker.

Fresh checks: all seven issue-listed packets pass `check_blueprint.py` with
the shared declaration index, zero errors/warnings. Their earlier source,
certificate and Lean checks were not repeated. No Lean file changed or was
elaborated in this continuation. No source was downloaded or copied.

Read-only update for resumption: the two S.4 coniveau spectral-sequence nodes
now explicitly import H.6's exact-couple, filtered-spectrum and convergence
nodes. The former missing-import complaint for /23 is stale. This does not
certify the whole SchemeKTheoryOperations packet. The H.3 rational-Hurewicz
owner and Borel R.3 imports still need assessment against the H.6 routing
contract. After scope reconciliation, assess the twelve pairs rather than
repeating the already completed seven-pair checks. Preserve the earlier
review histories and do not stamp packets without reviewing them.

Reproduce the inventory by loading this job from `queue.json`, filtering
`outputs` for packet paths, reading their top-level `review` objects and
comparing `reviewer` with `independent-review-REV-FIX-RT-AREA-ktheory-1~2`.
Call the actual `issues.deliverables_complete(job)` on the same unmodified
job. No continuation-critical information depends on scratch files.

## Previous handoff (historical inventory; current instructions above)

Refs #5542. Continuation: Codex, session `codex-jVGtcb`, 19 October 2026.
Earlier review work below remains attributable to Codex `codex-6SZXyE`,
`codex-WBAmLh` and the preceding reviewers named in the report.
The current [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6259434416)
was [confirmed](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6259435860).
No second job was claimed.

## Checkpoint blocker

The live issue still names seven packet/Lean pairs. The real queue job names
seventeen pairs (counted directly in the current queue).
[WORKERS.md](../WORKERS.md), “Doing the work”, says “Edit only the files the issue
names.” Expanded authorization was requested again from the operator in this
continuation; no authorizing reply has arrived. The live issue was re-read and
remains unchanged. The seven authorized reviews are complete,
including the negative K.1/K.6 outcomes; the real queue completion predicate
is false because ten additional pairs lack this area-review stamp.
The scratch diagnostic restricted to the issue's seven pairs returns true.
Do not alter queue outputs or stamp unchecked suppliers to bypass this.

Reconcile the issue with the queue, or obtain expanded authorization, before
editing the following ten additional basenames. Each has a packet in `packets/`
and a Lean companion in `suggested/`:

1. `BorelRegulators`
2. `MotivicEtaleKTheory--M.1`
3. `StableHomotopyKTheory`
4. `KTheoryLowDegrees--U.1`
5. `KTheoryLowDegrees--U.6`
6. `SpecialValuesBirchTate`
7. `MotivicEtaleKTheory--M.5d`
8. `SchemeKTheoryOperations`
9. `KTheoryLowDegrees--U.4`
10. `KTheoryFiniteLocalFields`

Neither the older 22-packet list nor the previous checkpoint’s 19-packet list
is the current assignment. T.1-classical and V.1 are no longer queue outputs. In particular,
N.2, N.3-finite-generation, N.5 and Z.3 are not current queue outputs.

## Verified in codex-jVGtcb

- Independently rechecked the disputed resolution, Bass-product, localization
  sign, universal-central-extension and Gaussian K₃ contracts against public
  K-book chapters III–VI. Exact theorem/section/page locators and the limits of
  each check are in the report's final continuation. Earlier restricted-source
  readings remain attributed to their original reviewers.
- Reproduced all eleven golden-field certificates, all 173 relation witnesses,
  all 23 selected determinants and their gcds with exact rational/integer
  arithmetic. A changed witness coordinate was rejected. The report's existing
  reproduction instructions suffice without the disposable script.
- Recomputed the 470-node DAG and both backwards actual-stage product
  dependencies. K.1/K.6 still need the maintainer's stage restructuring;
  their negative reviews remain valid completed review outcomes.
- Inspected current upstream ownership and read the pinned ExactK₀ and
  projective exact-structure statements supporting K.1's three examples.
- Validated all seventeen queue packets read-only. Re-elaborated all seven
  issue-listed companions serially with `lean-check`: all exit zero, with only
  sorry warnings (10, 0, 30, 27, 3, 8, 10 in the report's order). Available
  memory was 72–76 GB before each invocation. No Lean file was changed.
- Called the real queue completion predicate again: false, with precisely the
  ten outstanding area reviews listed above. Re-read the live issue before
  submission: it still authorizes seven pairs. Expanded authorization was
  requested, with no authorizing response. Only this handoff and the report
  were edited; no extra review was stamped.

This is a blocked checkpoint. Do not repeat the completed seven-pair checks as
a substitute for resolving the scope mismatch. The next substantive step is
authorization of the ten pairs, followed by their actual independent reviews.

## Completed in codex-6SZXyE

- Corrected the stale count to seventeen queue pairs and ten outstanding area
  verdicts in the report, handoff and the seven issue-listed review notes.
  Those inherited mathematical verdicts were preserved, not renewed.
- Reduced K.1’s Lean companion from 817 to 45 lines: one import block and
  standard note, the same three examples over pinned carriers, no future-carrier
  pseudocode. Its full plan remains in the existing reader and packet.
- Read the five pinned ExactK₀/projective exact-structure statements supporting
  those examples; inspected current upstream ownership read-only.
- Recompiled only the changed K.1 file with `lean-check`: exit zero, no warnings
  or errors, after checking 78 GB memory available.
- Ran `check_blueprint.py` on all seventeen current queue packets: zero errors
  or warnings. Extra packet checks remain read-only schema validation.
- Recomputed the real queue completion predicate: false because exactly the ten
  packets above lack this job’s review. No negative verdict was treated as an
  incomplete review. No queue scope or external verdict was altered.

The previously downloaded source texts and exploratory notes are disposable.
No continuation-critical result depends on scratch. Extra Lean companions were
inventoried read-only: U.1 has 9,098 lines, SchemeKTheoryOperations 20,089 and
KTheoryFiniteLocalFields 5,900. All exceed the current 5,000-line shape limit;
this is a resumption lead, not a completed source/Lean review of those files.

## Work inherited from the previous checkpoint

- Reviewed all 38 confirmed area findings (/1–/37 and /39), distinguishing
  acceptance of a correction contract from an unfinished supplier.
- Preserved the seven previous review objects verbatim in history and
  wrote current scoped verdicts: accepted N.1, T.3, N.7, T.1 and K3;
  needs changes K.1 and K.6 because of actual stage ordering.
- Corrected the four binding Lean-shape failures. N.1 now has 124 lines,
  K.6 65, T.1 95 and K3 101. Removed admitted construction data and auxiliary
  developments; retained light definitions, milestones and examples over
  pinned carriers. The full targets/APIs/checks already exist in the readers,
  which were inspected but not edited. No target node was removed or weakened.
- All seven authorized companions elaborate serially with `lean-check` at
  the shared pins, with sorry as their only warning. Counts: N.1 10,
  K.1 0, T.3 30, N.7 27, K.6 3, T.1 8, K3 10. K.1's commented future
  signatures were not type checked and have now been removed. Comment-stripped data-body diagnostics
  give zero hits for all seven; changed definitions were inspected manually.
- The previous checkpoint reported schema checks of its nineteen-pair inventory.
  The fresh seventeen-pair check is recorded above; supplier schema checks are
  not independent review acceptances.
- Independently verified all eleven golden-field finite certificates,
  173 relation witnesses, 23 selected determinants and residue generation;
  a corrupted witness was rejected. The report records exact arithmetic
  and the packet fields needed to reproduce the check without scratch.
- Recomputed the acyclic graph on 470 concrete nodes and both backward
  actual stage dependencies. Fresh source checks include K-book III's UCE
  package and Stacks 02MJ/09EM/00PD; current Tau Ceti's norm-reduction theorem
  was read separately from the pin. No restricted-book certification was
  renewed or source passage copied.
- No reader, extra supplier, queue, atlas or upstream file was changed.
  No library build/update/cache download or language server ran.

## Preserve these mathematical boundaries

**N.7:** do not revive the obsolete missing Zhang–Xu/Skalba objection. Its
current direct golden-field route uses tied-prime descent and the exact
finite certificates. Its independent upper and lower bounds do not use
Birch–Tate. The earlier Gaussian K₃ title/w₂ correction remains. Three
unrelated gaps and ten requests remain open.

**T.3:** the arbitrary-residue complete-DVR requirement now has a four-contract
LocalFieldsRamification Part II routing brief. It is still unregistered and
unimplemented, and five other gaps remain. Reuse current Tau Ceti's
`Algebra.norm_quotient_mk`; do not pretend it belongs to the older pin.
Keep Artin component lengths, inseparable residue possibilities and the
separability qualification for the generic product-of-fields assertion.
The commutative-ring monomial-kernel supplier is distinct from field Matsumoto.
Earlier Milnor/Gille–Szamuely source readings remain attributed to their readers.

**K.1/K.6:** the maintainer must apply the early-product and late-cofinality
restructuring. Actual K.7 products feed K.6/nonconnective-spectrum and
K.3/localization-product-boundary against atlas order. Merely proposing
`K.7:products` and `K.3:cofinality` does not register stages. A negative review
is the completed review outcome for these current files.

**T.1/K3:** the full bar, transgression, Steinberg, field-Bloch and higher-K
constructions remain reader targets. The streamlined Lean statements prove
none of them. The odd-order Heisenberg control detects the sign; the actual
comparison and CFT6 character-evaluation proof remain obligations.

Read-only supplier observations from prior sessions remain useful leads,
not fresh whole-supplier verdicts: R.3's rational Hurewicz destination is H.6,
not H.3; M.7's Dedekind étale result does not supply the entire requested
Zariski truncation/naturality API. The previous U.1 elaboration had nine errors
and exceeded 5,000 lines; this run did not repair or rerun that extra file.

## Resume

After scope reconciliation, review the ten pairs against the findings
mapped in the report and their latest independent reviews, then replace each
review only after actual assessment. Apply the current Lean shape rule from
the start: unsupported carriers/constructions stay in the reader; Lean has
light real definitions and target statements over pinned carriers. Do not
turn a successful elaboration into a claim of proved mathematics.
Run required packet checks, relevant Lean elaborations serially after the
memory check, and the actual queue completion predicate. Scratch is disposable;
all resumption-critical facts and reproduction steps are recorded here and
in the report.
