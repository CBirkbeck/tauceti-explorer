# REV-FIX-RT-AREA-iwasawa-2~2 — blocked by live issue scope

Codex, session `codex-A8IfeO`, 10 October 2026. Refs #6219.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6100114306).
Branch `codex-A8IfeO-review-iwasawa-6219`. This session did none of fixer
`claude-6ZAIEy`'s work and claimed only this job.

## Done and sole completion blocker

Fresh bounded source checks for /1–/4 support the corrections; current LAD
contracts and RS-16 routing preserve /5 and the rejected /6. See the final
report section for exact source versions, theorem/section/page locators and
attribution. Replaced the issue-named L3 and PMIA reviews, retaining accepted
and needs_changes. Complete preceding reviews and all existing history are
preserved in `reviewHistory`; parsed equality checks preserve every other
field. No mathematical node, gap, API, test or Lean source changed.

The queue additionally requires this job's reviewer in two packets omitted
from both the live issue's deliverables and files under review:

- `research/blueprint/packets/DirichletPadicLFunctions--L3-2.json`;
- `research/blueprint/packets/PadicHodgeRegulators--D.1.json`.

WORKERS.md says: “Edit only the files the issue names, plus your own scratch
space.” Prepared concrete review-only records and requested explicit user
authorization. No answer arrived; neither was installed. Actual
`issues.deliverables_complete` is **False**. A dry run substituting only those
records through a path adapter is **True**. PMIA's negative verdict completes
its review portion and is not the blocker. Correct the live issue scope before
assigning another unchanged continuation. Scratch candidates will be deleted;
the installation recipe below contains everything needed to reconstruct them.

## Finish after scope correction or explicit authorization

For each omitted packet, append its entire then-current `review` to
`reviewHistory`, retaining all existing history. Replace only the top-level
review with status `accepted`, reviewer
`independent-review-REV-FIX-RT-AREA-iwasawa-2~2`, installing date/session,
and notes identifying the complete preceding audit and the bounded correction.
Cite this report's checks with their original attribution. Do not claim
another worker's exhaustive audit as your own.

**L3-2, finding /2.** Previous reviewer:
`independent-review-REV-DirichletPadicLFunctions--L3-2`.
Archive the full 79-entry audit. Zhao §1.2 p.461, Theorem 4.1 and (4.1)–(4.6)
pp.471–473, Appendices A–B pp.473–474 were checked against
`rjw2-fg-gamma-sum`, `rjw2-fg-count`, `rjw2-fg-permutation`,
`rjw2-fg-log-antidifference`, `rjw2-fg-differentiation`,
`rjw2-ferrero-greenberg`, `rjw2-fg-exceptional-derivative`.
Retain primitive odd chi, conductor N>1 prime to p, compatible embeddings/logs,
chi-omega branch including p=2, literal character weights, general correction
term, strict Gamma endpoint and coefficient bounds/limits. Shortening the
formula requires chi(p)=1. Preserve five gaps, eight requests and E37.
Acceptance concerns these corrections, not arithmetic nonvanishing, a simple
zero, supplier closure or a repeated full-packet audit.

**D.1, finding /3.** Previous reviewer:
`independent-review-REV-PadicHodgeRegulators--D.1~2`.
Archive the full 72-entry audit. EN v2 §§2.1–2.2 pp.4–8, CN v4 Corollary 3.16
p.37/Theorem 5.4 p.54, NN v5 Remark 2.14 p.14/Proposition 4.13 pp.53–54 were
checked against `log-syntomic-complex`, `fontaine-messing-kato-period-map`,
`small-twist-comparison`, `syntomic-exponential`. Retain distinct fibres,
omega legs (p^r,id), tau legs (id,p^r), scalar composites, factorial-modified
twist, exact divided range 0≤i≤r≤p−2, bounded undivided comparison and rational
boundary scaling/sign. CS.0–CS.3 remain external proposed producers; CP.4 is
the proper rational anchor. Preserve nine gaps, twenty requests, seventeen
source issues and eight planned stages. Acceptance concerns the correction
contracts rather than producer closure or a repeated full-packet audit.

Assert parsed original/patched equality after removing only `review` and
`reviewHistory`, complete archived-review equality and retention of all
preceding history. Run all four packet checks and intake file screening.
Import the actual predicate from `research/blueprint/issues.py`, select this
job from `queue.json`, and require **True** before reporting completion.
Do not change queue logic, invent authorization or erase previous audits.

## Validation and coherent PMIA revision

All four packet checks report zero errors. L3 has 26 inherited short-API
warnings; the other three have none. Eight fresh public PDF hashes match the
source-version table. All four packets have zero `excerpt` fields. Intake
file screening and diff checks pass. No book or source passage was copied into
the repository. No fresh Lean compilation or finite falsification run was
done in this metadata/report continuation. The preceding session's sequential
Lean checks remain attributed in the report: L3 failed before body elaboration
at the unresolved shared `research` import; L3-2, D.1 and PMIA passed with 111,
307 and 1,075 `sorry` warnings respectively and no other diagnostics. No source
file changed or process remains running.

Keep PMIA needs_changes. Current Tau Ceti commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` supplies `TauCeti.fittingIdeal`,
`fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_baseChange` and
`AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`.
Migrate `higher-fitting-ideal`, `relation-minors-add-generator`,
`higher-fitting-independence`, `higher-fitting-base-change` and
`transpose-stable-equivalence` to native imports/necessary adapters.
Synchronize consumers, both StableReduction requests, L4, reader and suggested
interfaces in one coherent revision. Preserve non-generating-family and
deficient-relation controls, order calculations, opposite/contragredient
transport and nonflat tests. The native kernel theorem requires a surjection
onto the intended module. Newer modules must not be attributed to programme
pin f790474. Current roadmap commit remains
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`.
