# REV-FIX-RT-AREA-iwasawa-2~2 — blocked checkpoint: correct the issue scope

Codex, session `codex-StxrNw`, 10 October 2026. Refs #6219.
[Confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6099522761).
Branch `codex-StxrNw-review-iwasawa-6219`, input `cb3d5cac2`.
This session did none of fixer `claude-6ZAIEy`'s work and claimed one job.

## What is finished and what prevents completion

All six finding verdicts are recorded in the review report, with fresh bounded
source readings, source-version checks, native-library comparisons and finite
controls attributed to this session. Earlier exhaustive audits are preserved.
The two issue-named packets archive their preceding review objects whole and
refresh only review metadata: L3 accepted for its bounded source fixes, PMIA
needs_changes for the coherent current-library migration. Mathematical and
planning objects, all prior history, and suggested files are unchanged.

The queue additionally requires this review's reviewer in two packets that
the live issue omits from both its deliverables and its files under review:

- `research/blueprint/packets/DirichletPadicLFunctions--L3-2.json`
- `research/blueprint/packets/PadicHodgeRegulators--D.1.json`

WORKERS.md says: “Edit only the files the issue names, plus your own scratch
space.” Concrete review-only receipts were prepared and explicit scope
authorization requested; no authorization arrived. Those packets still name
`independent-review-REV-DirichletPadicLFunctions--L3-2` and
`independent-review-REV-PadicHodgeRegulators--D.1~2`. The actual
`issues.deliverables_complete` function returns **False** for this queue job.
The negative PMIA verdict completes its review portion and does not cause the
checkpoint. This is the same dispatch defect as preceding continuations.
**Correct the live issue scope before assigning another unchanged run.**

## Validation and evidence retained

All four packet checks pass: L3 has 26 inherited short-API warnings, the other
three have none. Fresh sequential whole-file `lean-check` results:

- L3: exit 1 at the unresolved imported `research` module prefix; its body was
  not elaborated.
- L3-2: exit 0, 111 `sorry` warnings only.
- D.1: exit 0, 307 `sorry` warnings only.
- PMIA: exit 0, 1,075 `sorry` warnings only.

Memory was sufficient and every process finished. No library build, update,
cache download or language server was used. Public source links, theorem and
page locators, exact versions and hashes are in the report. All ten fetched
PDF hashes agree with its table. No uncleared book was read and no source
passage was added to the repository. Scratch sources and logs are disposable;
no resume step depends on them.

Fresh finite controls: 204 Gamma recurrences, 60 buffered congruences and the
rejected unbuffered dyadic modulus-4 claim; 6,561 right-adjugate preimages,
including 2,673 vector checks on 891 singular submatrices; twelve syntomic
composite/rational-scaling checks; and the acyclic identity-pair raw-product
counterexample. These do not prove the analytic or arithmetic suppliers.

## Ready receipt contracts once scope is authorized

Installing the two bounded receipts does not require another exhaustive
mathematical audit. For each omitted packet, append its entire then-current
`review` object to `reviewHistory`, including every checked entry. Retain all
older history. Replace its top-level review with status `accepted`, reviewer
`independent-review-REV-FIX-RT-AREA-iwasawa-2~2`, the installing date/session,
its preceding reviewer and the bounded contract below. Cite this report as
the source evidence; do not claim its readings as the installing session's.

**L3-2, finding /2.** Zhao §1.2 p.461, §4 Theorem 4.1 and (4.1)–(4.6)
pp.471–473, Appendices A–B pp.473–474 support the seven checked nodes:

- `DirichletPadicLFunctions:L3/rjw2-fg-gamma-sum`
- `DirichletPadicLFunctions:L3/rjw2-fg-count`
- `DirichletPadicLFunctions:L3/rjw2-fg-permutation`
- `DirichletPadicLFunctions:L3/rjw2-fg-log-antidifference`
- `DirichletPadicLFunctions:L3/rjw2-fg-differentiation`
- `DirichletPadicLFunctions:L3/rjw2-ferrero-greenberg`
- `DirichletPadicLFunctions:L3/rjw2-fg-exceptional-derivative`

Retain the primitive odd prime-to-p conductor N>1, chi-omega branch including
the dyadic convention, compatible log/embeddings, literal character weights,
general correction term, strict Gamma endpoint and coefficient-limit
justification for differentiation. The short formula requires chi(p)=1.
Preserve the full 79-entry earlier audit, five gaps, eight requests and E37.
This accepts the correction and does not solve arithmetic nonvanishing,
simple-zero or external supplier obligations.

**D.1, finding /3.** Ertl–Nizioł v2 §§2.1–2.2 pp.4–8, Colmez–Nizioł v4
Corollary 3.16 p.37/Theorem 5.4 p.54, and Nekovář–Nizioł v5 Remark 2.14
p.14/Proposition 4.13 pp.53–54 support the four checked consumers:

- `PadicHodgeRegulators:D.2/log-syntomic-complex`
- `PadicHodgeRegulators:D.2/fontaine-messing-kato-period-map`
- `PadicHodgeRegulators:D.2/small-twist-comparison`
- `PadicHodgeRegulators:D.2/syntomic-exponential`

Retain distinct divided/undivided fibres, omega legs `(p^r,id)`, tau legs
`(id,p^r)`, their scalar composites, factorial-modified twist, exact divided
range `0≤i≤r≤p−2`, bounded undivided comparison and rational boundary
scaling/sign. CS.0–CS.3 remain proposed external producers; CP.4 is only a
proper rational anchor. Preserve the 72-entry earlier audit, nine gaps,
twenty requests, seventeen source issues and eight planned stages.

For each patch, assert equality of parsed original and patched objects after
removing only `review` and `reviewHistory`, equality of the entire archived
prior review, and preservation of all earlier history. Run all four packet
checks and the intake file screen. Import the actual predicate from
`research/blueprint/issues.py`, select this job from `queue.json`, and require
**True** before reporting completion. Update the report/handoff to record the
scope correction and receipt installation. Do not edit the queue, intake
code or review identities merely to bypass the completion check.

## PMIA's next coherent revision

Keep PMIA `needs_changes`. Current Tau Ceti commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` supplies `TauCeti.fittingIdeal`,
`fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_baseChange` and
`AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`. Replace generic
plans in `higher-fitting-ideal`, `relation-minors-add-generator`,
`higher-fitting-independence`, `higher-fitting-base-change` and
`transpose-stable-equivalence` with those imports and necessary adapters.
Update consumers, both StableReduction requests, L4, the reader and suggested
file together. Preserve non-generating-family and deficient-relation controls,
opposite/contragredient transport, order calculations and nonflat tests.
The report gives the native statements and scope; the newer modules are
absent from the old programme pin. This belongs to the next fix job, rather
than a partial rewrite in this review's metadata checkpoint.
