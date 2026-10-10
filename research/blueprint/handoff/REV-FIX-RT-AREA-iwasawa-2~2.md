# REV-FIX-RT-AREA-iwasawa-2~2 — review ready, scope blocks completion

Codex, session `codex-sIcrs8`, 10 October 2026. Refs #6219.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6100570548).
Branch `codex-sIcrs8-review-iwasawa-6219`. I did none of fixer
`claude-6ZAIEy`'s work and claimed only this job.

## Completed work and exact blocker

Fresh independent selected-contract/source readings for findings /1–/4, current-library
readings, LAD contract and RS-16 routing checks support the verdicts in the
report's final section. L3's bounded correction is accepted. PMIA needs_changes
for five coherent native-reuse migrations, described below. These are bounded
fix reviews following codex-9AETdN and the complete earlier audits, not repeated full-packet
audits. Replaced only `review` and `reviewHistory` in the two issue-named
packets. Every other field is equal to its original value. The entire previous
review and every pre-existing history entry are preserved. No Lean source,
mathematical node, gap, request, API, test or stage changed.

The live issue's deliverables and files under review omit two packets that
`queue.json` and `issues.deliverables_complete` require this job to review:

- `research/blueprint/packets/DirichletPadicLFunctions--L3-2.json`;
- `research/blueprint/packets/PadicHodgeRegulators--D.1.json`.

WORKERS.md says: “Edit only the files the issue names, plus your own scratch
space.” Prepared concrete bounded review-only records and requested explicit
user authorization to install them. No authorization has arrived and the live
issue still omits them. Both files are untouched. The actual completion
predicate is **False**; a read-only path adapter substituting only the two
prepared records returns **True**. PMIA's negative verdict completes its
review portion and is not the blocker. No queue or completion logic was
changed. This is a blocked checkpoint, not a completed job.

**Correct the live issue scope, or obtain explicit authorization for the two
review-only updates, before dispatching another unchanged continuation.** The
source review is ready; repeating it does not repair this dispatch mismatch.

## Resume after authorization or issue correction

Archive each omitted packet's entire then-current `review` as the last
`reviewHistory` entry, preserving all prior history. Replace only the review
with status `accepted`, reviewer
`independent-review-REV-FIX-RT-AREA-iwasawa-2~2`, installing date and notes
identifying the previous exhaustive audit and the bounded fix checks with
their original attribution. The packets' text checker rejects the Lean
placeholder keyword even inside review notes: describe compiler diagnostics
there as “placeholder warnings”; the Markdown report gives the literal output.

**L3-2, finding /2.** Preserve the full 79-entry audit by
`independent-review-REV-DirichletPadicLFunctions--L3-2`. This session checked
Zhao §1.2 p.461, Theorem 4.1/(4.1)–(4.6) pp.471–473, Appendices A–B pp.473–474
against `rjw2-fg-gamma-sum`, `rjw2-fg-count`, `rjw2-fg-permutation`,
`rjw2-fg-log-antidifference`, `rjw2-fg-differentiation`,
`rjw2-ferrero-greenberg`, `rjw2-fg-exceptional-derivative`.
Retain primitive odd chi, conductor N>1 prime to p, compatible logs/embeddings,
the chi-omega branch including p=2, actual character weights, the general
correction term, strict Gamma endpoint and bounds/limits before differentiation.
Removing the correction requires chi(p)=1. Keep five gaps, eight requests and
E37. Acceptance does not establish nonvanishing, a simple zero or supplier
closure. Fresh Lean check: 111 placeholder warnings, no other diagnostics.

**D.1, finding /3.** Preserve the full 72-entry audit by
`independent-review-REV-PadicHodgeRegulators--D.1~2`. This session checked
EN v2 §§2.1–2.2 pp.4–8/Theorem 2.2 p.7, CN v4 Corollary 3.16 p.37/Theorem 5.4
p.54 and NN v5 Remark 2.14 p.14/Proposition 4.13 pp.53–54 against
`log-syntomic-complex`, `fontaine-messing-kato-period-map`,
`small-twist-comparison`, `syntomic-exponential`. Preserve distinct fibres,
omega legs (p^r,id), tau legs (id,p^r), scalar composites, factorial-modified
twist, exact divided range 0≤i≤r≤p−2, bounded undivided comparison and rational
boundary scaling/sign. CS.0–CS.3 remain proposed external producers; CP.4 is
the proper rational anchor. Keep nine gaps, twenty requests, seventeen source
issues and eight planned stages. Acceptance does not close those producers.
Fresh Lean check: 307 placeholder warnings, no other diagnostics.

Assert parsed equality after removing only `review`/`reviewHistory`, exact
archived-review equality and retention of all history. Run packet and intake
checks. Require **True** from the actual completion function after installation
before reporting the review complete. The prepared records passed the packet
checker in scratch and made the unmodified predicate True through the adapter;
no new mathematical edits or exhaustive audit are needed for this scope repair.

## Validation and PMIA follow-up

All four packet checks have zero errors. L3 retains 26 inherited short-API
warnings; the others have none. All four have zero `excerpt` fields. Eight
fresh public PDF hashes match the report's source-version table. No book was
used or source passage copied into the repository. Fresh finite controls:
260 Gamma recurrence evaluations, 260 strict counts, 90 buffered pairs and 81
two-sided adjugate checks, retaining dyadic/endpoint/orientation counterexamples.
These are finite checks, not proofs.

Four fresh sequential `lean-check` runs: L3 stops at unknown module prefix
`research` before body elaboration; L3-2, D.1 and PMIA exit 0 with 111, 307 and
1,075 placeholder warnings respectively and no other diagnostics. No Lean
source changed, library build/update/cache fetch or language server was
started, or compilation left running. The intake file screen and diff check
pass for the two permitted packets, report and handoff.

Keep PMIA needs_changes. Current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` supplies `TauCeti.fittingIdeal`,
`fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_baseChange` and
`AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`.
Migrate `higher-fitting-ideal`, `relation-minors-add-generator`,
`higher-fitting-independence`, `higher-fitting-base-change` and
`transpose-stable-equivalence`; synchronize consumers, both StableReduction
requests, L4, reader and suggested interfaces together. Keep non-generating
and deficient-relation controls, order calculations, nonflat tests and
opposite/contragredient scalar/factor-order transport. Native kernel comparison
requires a surjection onto the intended module. The new declarations are not
attributed to programme pin f790474. Current roadmap commit is
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`. The reader is outside this review's
allowlist, so the coherent migration belongs in the ensuing revision.
