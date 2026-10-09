# REV-FIX-RT-AREA-iwasawa-2~2 — blocked continuation

## Continuation receipt: codex-SOsCZg

Codex, session `codex-SOsCZg`, 9 October 2026; input commit
`457a6c2c24bf0731da73a90417da2fa350edcef6`.
The bot confirmed this session's claim in
[comment 6091229794](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6091229794).
This session did none of the original fixes. **Blocked checkpoint: the required
review scope still exceeds the live issue's authorized deliverables.**

Read the complete live issue and claim confirmation, both protocols, WORKERS.md,
UPSTREAM_GUIDE.md, all six finding/verifier records, the round-two fix report,
and the existing review and handoff. Reproduced `issues.deliverables_complete`
against the actual queue entry: **nine-output queue `False`; five-output live
issue `True`**. L3-2 still lacks a review object; D.1 still carries the accepted
`independent-review-REV-PadicHodgeRegulators--D.1~2`. Requested explicit
authorization for those two additional packet and suggested-file reviews from
the manager. No response had arrived at this checkpoint. No unlisted file or
review verdict was changed.

The finding-by-finding verdicts below remain the previous reviewers' work.
This continuation freshly checked /4's central source contracts and pinned
transpose reuse; it did not redo their all-node audits or review L3-2/D.1.
The read-only current upstream StableReduction and QuiverRepresentations
READMEs and suggested files, plus the reviewed L3/L6 library-coverage entries,
were checked for the Fitting/transpose ownership boundary. The current Tau Ceti
checkout differs from the baseline, so the transpose statement was read using
its Git object at `f790474821cf4256814db967cb154e7af3d0c369`.

Freshly read [Dasgupta–Kakde, arXiv:2010.00657v3](https://arxiv.org/pdf/2010.00657v3),
§§2.2–2.3, pp.15–18; Lemma 3.9, pp.25–26; §6.1 and Lemma 6.1, p.40.
Accessed 9 October 2026; PDF SHA-256
`c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099`.
The published Annals version was not read.

| Contract freshly checked | Result |
|---|---|
| Character ring and cardinality | Image of character evaluation; sufficient coefficient roots, regular element, finite quotient and square-presentation assumptions retained. Finite PID factors use the packet's separate finite-ideal reduction. |
| Compound-image preimage | The packet uses `ι_J(adj_r(A_J)x)` and the right-sided compound/adjugate identity. For its two-row, three-column example, `(2,1,0)` maps to `(2,2)`; rank-zero and top exterior degree conventions agree. |
| Transpose and sharp | The cokernel of the dual presentation depends on the presentation; the scalar transport is between inverse character sets. The pinned transpose carrier requires no minimality. For the zero module, the identity presentation gives zero transpose, whereas adding a free relation gives a free transpose; the Fitting formula retains the square-presentation condition. |

| Fresh check | Result |
|---|---|
| PMIA packet checker | 487 nodes; zero errors, zero warnings |
| L3 packet checker | 1,663 nodes; zero errors, 26 inherited short-API warnings outside this fix's scope |
| PMIA native `lean-check` | Exit 0; 1,075 warnings, all uses of `sorry`; no errors or other warnings |
| L3 native `lean-check` | Exit 1 at unresolved `research` import; declarations did not elaborate |
| Source-excerpt inventory | Neither issue-named packet contains a node-source `excerpt` key |

Checks ran sequentially with over 20 GB available; no library build or language
server was started, and no compile remains running. Elaboration proves no
admitted assertion. The named packets, Lean files, coverage, gaps and existing
accepted reviews are unchanged. Only this receipt and the handoff changed.
The exact administrative remedies in the preserved report below remain valid:
authorize and perform the additional reviews, or reconcile the queue outputs
with the live issue. Another identical two-packet dispatch cannot finish the
nine-output completion check.

## Fresh source and compilation receipt from codex-p9uw1D

Codex, session `codex-p9uw1D`, 9 October 2026, input commit
`dfd35f2a06b8d9f4268196ed46bf680027032b72`. The bot confirmed
[claim comment 6090968337](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6090968337).
This session did none of the original fixes. It holds only issue #6219.

**The named reviews remain accepted; the job remains administratively blocked.**
The complete live issue and its embedded instructions still name only the L3
and PMIA packets. The queue requires L3-2 and D.1 too. Fresh calls to
`issues.deliverables_complete` return `False` for the nine queue outputs and
`True` for the five live-issue outputs. All paths exist. L3-2 has no review;
D.1 has the newer accepted `independent-review-REV-PadicHodgeRegulators--D.1~2`.
Neither verdict is replaced to satisfy an administrative predicate.

The issue-named-file restriction in WORKERS.md still applies. An explicit
request for authorization to conduct the two additional reviews was sent to
the manager in this session; no answer was received before this checkpoint.
The concrete five-output queue remedy below remains applicable if the live
issue scope is intended. If the larger scope is intended, first authorize the
additional packet reviews and refresh the issue. This submission is a blocked
checkpoint, not completion of the two additional reviews.

### Fresh checks and their limits

| Check | Result in this session |
|---|---|
| PMIA packet checker | 487 nodes; zero errors, zero warnings |
| L3 packet checker | 1,663 nodes; zero errors, 26 inherited short-API warnings |
| Full PMIA native `lean-check` | Exit 0; 1,075 warnings, all declaration uses of `sorry`; zero errors and other warnings |
| Full L3 native `lean-check` | Exit 1: unknown module prefix `research`; stopped at import resolution before elaborating declarations |
| Completion predicate | Nine-output queue: `False`; five-output live issue: `True` |

Both Lean checks ran sequentially with more than 20 GB available. No library
build or language server was started. The L3 import failure is an environment
boundary, not evidence that its declarations elaborate. PMIA's successful
signature check does not prove any admitted assertion.

Freshly read [Dasgupta–Kakde, arXiv:2010.00657v3](https://arxiv.org/pdf/2010.00657v3),
accessed 9 October 2026, SHA-256
`c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099`:
§§2.2–2.3, pp. 15–18; Lemma 3.9 and its proof, pp. 25–26; §6.1 and
Lemma 6.1, p. 40. These confirm the central /4 contracts in the existing
review: evaluation-image character rings; finite-index, non-zerodivisor and
finite-quotient hypotheses; square presentations; transpose dependence on
the chosen presentation; and transport between the inverse character sets.
The current `compound-image-determinant` node supplies the required preimage
by applying the higher adjugate before embedding into the larger source
module. The proof correction remains attributed to the previous workers.
The published Annals text was not read in this session.

Freshly read the corresponding statements at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, through Git objects rather than
assuming the current source tree is the pinned one:
`TauCeti.AuslanderReitenTranspose`, its quotient map and zero criterion;
`TauCeti.DiagonalizableGroup.point` and its generator evaluations; and
`CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`. The transpose carrier does
not require minimality; orthogonality retains the finite commutative-group,
domain and sufficient-root hypotheses. Read the reviewed L3/L4/L6 library
coverage and the current upstream StableReduction Layer 1 and
QuiverRepresentations Layer 6 ownership boundaries, including their suggested
files. These are scoped fresh checks, not a new audit of every node or baseline.

The existing per-finding mathematical verdicts, audit ledger and authorship are
preserved below. No packet, suggested file, source record, reader, coverage or
review verdict is changed. The report and handoff are the only changed files.

## Reproduction by codex-7PpFhN

Codex, session `codex-7PpFhN`, 9 October 2026, input commit
`0dd979cd4dbf3dd27e761bd581e724a7f45ed155`. The bot confirmed
[claim comment 6086683565](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6086683565).
This continuation independently reproduced the administrative blocker described
below. It preserves the earlier mathematical review and its authorship; it does
not claim a new source audit or replace any packet verdict.

The complete live issue still names five deliverables, while the queue still
names nine. Both named packets already have this job's accepted review identity.
L3-2 has no review object; D.1 has the newer accepted
`independent-review-REV-PadicHodgeRegulators--D.1~2`. Every queue path exists.
The following read-only reproduction, run from the repository root, checks the
actual completion predicate rather than inferring completion from path presence:

```python
import json
import sys
from pathlib import Path

sys.path.insert(0, "research/blueprint")
from issues import deliverables_complete

queue = json.loads(Path("research/blueprint/queue.json").read_text())
job = next(j for j in queue["jobs"]
           if j["id"] == "REV-FIX-RT-AREA-iwasawa-2~2")
issue_outputs = [
    "research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md",
    "research/blueprint/packets/DirichletPadicLFunctions--L3.json",
    "research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json",
    "research/blueprint/suggested/DirichletPadicLFunctions--L3.lean",
    "research/blueprint/suggested/PadicMeasuresIwasawaAlgebras.lean",
]
print("queue:", deliverables_complete(job))
print("issue:", deliverables_complete({**job, "outputs": issue_outputs}))
```

Actual output: `queue: False`, `issue: True`. Inspection of
`intake.py::merge` confirms that this false result releases a merged submission
as another checkpoint. Changing a report cannot finish the nine-output job.
The queue's referenced prompt file is absent from this checkout and supplies no
additional instruction or authorization.

Fresh packet checks: PMIA has 487 nodes, zero errors and zero warnings; L3 has
1,663 nodes, zero errors and 26 inherited short-API warnings. Neither packet has
a source `excerpt` key. No packet or suggested file was modified, and Lean was
not rerun for this report/handoff-only continuation. The earlier compilation
receipts and their limitations remain below.

An explicit scope decision was requested from the manager. Pending a reply,
WORKERS.md's issue-named-file restriction remains binding. The concrete
five-output remedy below is ready for the maintainer; the alternative is explicit
authorization for the two additional reviews. This continuation is blocked and
must not be represented as completion of those reviews.

## Preserved report from codex-SlZ1UM

Codex, session `codex-SlZ1UM`, 9 October 2026. Issue [#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219); input commit `6908ce6c38ce72997bfd1c44c481d4ba09d1299f`. The bot confirmed [claim comment 6086448301](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6086448301). This session did none of the original fixes and holds no other job.

**Blocked by the issue/queue scope mismatch.** The previous continuation completed the review of the two issue-named packets. This continuation preserves that work and supplies an executable diagnosis and an exact administrative remedy. It does not repeat the source audit or replace another independent review merely to satisfy the completion predicate. The earlier report below remains attributed to its authors.

## Current completion receipt

Read the entire live issue, its comments, WORKERS.md, both protocols, UPSTREAM_GUIDE.md, the previous handoff/report, the confirmed findings, the round-two fix report, the queue entry and `research/blueprint/issues.py::deliverables_complete`.

At the input commit, direct calls to the completion predicate gave:

| Job description supplied to the predicate | Result |
|---|---|
| Current queue entry, all nine outputs | `False` |
| Same entry, the five outputs actually named in issue #6219 | `True` |

All nine paths exist. The failure is specifically the required top-level reviewer identity on two packets omitted from the issue:

| Packet | Current verdict | Current reviewer |
|---|---|---|
| DirichletPadicLFunctions--L3 | accepted | independent-review-REV-FIX-RT-AREA-iwasawa-2~2 |
| PadicMeasuresIwasawaAlgebras | accepted | independent-review-REV-FIX-RT-AREA-iwasawa-2~2 |
| DirichletPadicLFunctions--L3-2 | no review object | none |
| PadicHodgeRegulators--D.1 | accepted | independent-review-REV-PadicHodgeRegulators--D.1~2 |

`deliverables_complete` checks every packet listed in the queue outputs, including packets unchanged by a submission. A review report cannot override that check. Its accepted/needs_changes/rejected alternatives do not remove the requirement to conduct and record the omitted reviews. The D.1 review must not be silently relabelled.

WORKERS.md restricts edits to files named by the issue. A scope question was submitted to the manager in this run and remains pending. Neither the queue nor the two omitted packets is changed. This is an authorization boundary, not a mathematical rejection or a claim that the expanded review was performed.

## Concrete remedy for the maintainer

If the live issue is the intended scope, replace **only** the `outputs` value of queue job `REV-FIX-RT-AREA-iwasawa-2~2` with:

```json
[
  "research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md",
  "research/blueprint/packets/DirichletPadicLFunctions--L3.json",
  "research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json",
  "research/blueprint/suggested/DirichletPadicLFunctions--L3.lean",
  "research/blueprint/suggested/PadicMeasuresIwasawaAlgebras.lean"
]
```

The job then meets the existing completion predicate without changing any review verdict. Regenerate/refresh the issue and sync its state through the normal orchestration; the worker does not change labels or close it. Retain /1–/3's unresolved mathematical obligations with their independent owner jobs.

If the nine-output queue scope is intended instead, explicitly extend the live issue to name both omitted packets and suggested files. Its next worker must independently review the relevant /1–/3 contracts, preserve the newer D.1 review in history if replacing its current review, and record actual verdicts. A reviewer may record `needs_changes` for source or contract errors; it must not accept those packets solely because paths exist. Do not schedule another two-packet review before this scope decision: the current predicate will still release that submission as a checkpoint.

This remedy is recorded here for the maintainer; no unlisted orchestration file is edited.

## Checks in this continuation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json`: 487 nodes, zero errors and warnings.
- `python3 scripts/check_blueprint.py research/blueprint/packets/DirichletPadicLFunctions--L3.json`: 1,663 nodes, zero errors and 26 inherited short-API warnings, unchanged from the previous review.
- Completion-predicate checks: queue scope incomplete, live issue scope complete, as above.
- No packet, reader, suggested Lean file, review verdict, source text or source metadata is modified. The previous native Lean results below are inherited evidence, not fresh compilations. No Lean process was started for this report-only continuation.

## Preserved mathematical review from codex-7UQW2R


Codex, session `codex-7UQW2R`, 9 October 2026, issue [#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219). Input commit `b65dedeec52845a846eea49bc135c8609e047200`. The bot confirmed [claim comment 6085903650](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6085903650). This session did none of Claude Code's original fix (`claude-6ZAIEy`, [PR #6786](https://github.com/CBirkbeck/tauceti-explorer/pull/6786)) or the previous reviews.

**Both named packets are accepted within this fix review's scope.** The PMIA objection in the previous checkpoint is resolved by the newer accepted revision review, `independent-review-REV-PadicMeasuresIwasawaAlgebras~2`. This submission remains a **checkpoint for the queue/issue scope mismatch**, not a request for another duplicate L6 audit. All named mathematical review work is complete.

## Continuation and inherited evidence

Read the confirmed findings, round-two fix report, previous fix-review report/handoff and the newer revision-review report. The earlier fix reviews corrected and independently checked 50 L6 nodes, their 172 API items and 57 tests, including 174 direct baseline references. That completed work is retained; its receipts and limitations remain in packet `reviewHistory` and the ledger below. No claim is made that this continuation reread all 487 PMIA nodes, all 537 PMIA baselines or all 1,663 L3 nodes.

The newer PMIA revision review resolves the fourteen missing L4 declarations and eight missing examples (twelve packet test records), authenticates NSW and records the remaining eighteen proof/stage gaps. The current interfaces and test examples were inspected. In particular, generator change preserves μ and λ while changing the polynomial from T−p to T−(2p+p²); the ramified coefficient test normalizes μ at the uniformizer; the norm test gives T²+p²; and Λ/(p,T) has unit characteristic ideal and a proper initial Fitting ideal. These distinguish the intended definitions. The review's source authentication is inherited evidence, not a new NSW reading. Bourbaki and Coates–Sujatha proof-input gaps remain recorded. Nothing now warrants retaining the previous scoped `needs_changes` verdict solely for absent interfaces or NSW authentication.

The current accepted comprehensive PMIA review is preserved intact in `reviewHistory` before the current scoped review is written. Its 487-row audit is not relabeled as this session's work. L4 and the remaining partial layers keep their coverage and precise gaps.

## Finding verdicts

| Finding | Verdict on the fix | Reason and remaining owner obligation |
|---|---|---|
| /1: Morita Gamma and Gross–Koblitz | Correct scoped handoff; partially discharged | L3 retains unit-valued continuous Gamma, uniqueness and both recurrence branches. Normalized roots keep the integral second-order congruence, the Gauss sum has the source-negative sign, and the exponent-zero value is +1. Robert's comparison explicitly requires RD.6's coefficient bound and chosen-root splitting-value identity. L3-2 owns root-ideal, congruence and dyadic interfaces; none is newly accepted here. |
| /2: Ferrero–Greenberg | Correct assignment; still open | L3 explicitly points to L3-2's derivative declarations, rather than treating Gamma or a value-at-one formula as the derivative theorem. The general correction term, exceptional specialization, branch/derivative coordinates, source prime range and separate nonvanishing input remain obligations of that owner. This continuation does not authenticate Ferrero–Greenberg/Zhao or accept L3-2. |
| /3: classical log-syntomic input | Correct outside-owner handoff | D.1's newer accepted independent review is preserved. Its requested early CohomologyComparisons Part II producers, not proper rational CP.4 alone, must supply the integral/open construction, modified twists and correct comparison ranges. No D.1 review object is overwritten to satisfy bookkeeping. |
| /4: Dasgupta–Kakde algebra | Accepted after inherited corrections | L6 supplies image character rings, the square-presentation/Fitting algebra, compound matrices and presentation-dependent transpose. Central contracts freshly match the public v3 source; details below. Initial Fitting stays with StableReduction Layer 1, the transpose uses Tau Ceti's existing carrier, and I.6/I.7 remain arithmetic consumers. |
| /5: finite-slope perfect complexes | Correct outside-owner assignment; still open | Job #641 retains representative-independent cohomological spectral support, the separate solid derived localization and early shared Stein foundations. The fix does not claim that degreewise Fredholm data or merely inverting the monoid supplies the 2025 construction. No new functional-analysis source audit is claimed. |
| /6: duplicate endpoint | Verifier rejection retained | Accepted RS-16 deliberately keeps the independent Hecke/congruence and cyclotomic Euler-system proof routes. No endpoint deletion or new dependency is justified. |

## Fresh source and library checks for /4

Read [Dasgupta–Kakde, arXiv:2010.00657v3](https://arxiv.org/pdf/2010.00657v3), accessed 9 October 2026, PDF SHA-256 `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099`: §§2.2–2.3, printed/PDF pp. 15–18; Lemma 3.9 and proof, pp. 25–26; §6.1 and Lemma 6.1, p. 40. The published Annals full text was not read. No claim is newly attributed to that version.

The source's odd prime, finite abelian group and sufficient coefficient-root setting remains explicit. R_Ψ is the image of evaluation, with its congruences; it is not replaced by the product or assumed Gorenstein. The norm-element kernel and component quotient retain the stated character subset. Lemmas 2.4–2.5 keep regularity and finite quotients. The repaired finite-ideal reduction covers finite PID factors, where regularity on a subring alone need not imply regularity on the ambient product. Lemmas 2.6–2.7 use square presentations and the imported finite-presentation Fitting carrier.

For Lemma 3.9 the corrected preimage is ι_J(adj_r(A_J)x). Applying the rectangular compound matrix gives C_r(A_J)adj_r(A_J)x = det(A_J)x. The source's displayed left multiplication alone does not construct that preimage. The supplied proof also treats r above the number of generators and an insufficient number of relations explicitly. For §6.1 the map reverses the presentation under duality; inversion transports scalars from R_Ψ to R_(Ψ⁻¹). Adding a free relation changes the transpose, so the zeroth Fitting equality concerns the stated quadratic presentation. The higher-Fitting/projective-localization proof remains supported by the earlier independent Appendix B audit.

Freshly read the central Tau Ceti source modules for `DiagonalizableGroup.point` and its generator evaluations, `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`, and `AuslanderReitenTranspose` with its quotient and presentation-equivalence API. Their shared-build source bytes match Git objects at `f790474821cf4256814db967cb154e7af3d0c369`. The character orthogonality statement has exactly the finite commutative-group/domain/enough-roots hypotheses; the transpose carrier is available without a minimality assumption. Other L6 baseline checks are the retained prior audit. Mathlib's shared checkout is `082e2d37e8b0463410cdb532e111cd43d5a66174`.

Read the reviewed library-coverage entries for L3, L4 and L6, and current upstream StableReduction and QuiverRepresentations documents and relevant suggested signatures. No new carrier or node was planned. The upstream Fitting and transpose ownership boundaries remain intact. All 57 L6 test names are present in the current suggested file; that inventory complements the retained signature audit and is not a proof of the tests.

## Validation and exact changes

| Check | Fresh result |
|---|---|
| PMIA `check_blueprint.py` | 487 nodes, 537 baseline entries, 18 gaps, 3 requests; zero errors and warnings |
| L3 `check_blueprint.py` | 1,663 nodes; zero errors, 26 inherited short-API warnings |
| PMIA native `lean-check` | Exit 0; 1,075 warnings, all `sorry`; no errors or other warnings |
| L3 native `lean-check` | Exit 1 at import resolution: the existing shared build lacks the planned `research` dependency artifacts; no declarations elaborated |
| Standing source-text rule | No `excerpt` key in either edited packet; no source passage introduced |

L3's 26 warnings concern inherited short API outlines outside the /1-/2 fix scope, chiefly Kubert/Cartan auxiliary constructions. They are reported, not silently presented as a clean warning-free packet. Both packets' mathematical records, source findings, coverage, gaps, requests, readers and Lean files are unchanged. Only their current `review` objects/history, this report and the handoff change. The verdict is a planning/fix verdict, not a claim of implementation or proof completion.

## Administrative blocker

The live issue's deliverables and full instructions name only L3 and PMIA packets/suggested files plus this report. The queue also requires L3-2 and D.1 packets/suggested files. `issues.deliverables_complete` requires this exact review identifier on all four packets, so completing the two explicitly named reviews still produces a checkpoint. WORKERS.md's rule is “Edit only the files the issue names, plus your own scratch space.”

Additional scope was requested from the maintainer during this continuation; no answer has been received. No extra packet, queue entry, issue body or label is changed. D.1 already has a newer accepted review, which is preserved. To finish this job administratively, reconcile the queue to the two named packets or explicitly authorize the additional independent scoped reviews. Do not replace those reviews merely to make the predicate pass. The named work needs no further duplicate L6 audit.

## Retained prior L6 audit ledger

Each node has prefix `PadicMeasuresIwasawaAlgebras:L6/`. The following ledger is retained from Codex session codex-KQjyXV's independent audit, not claimed as a new full audit by this continuation. Implementation remains unchecked.

| Node | Current verdict | Source locator / supplied proof boundary |
|---|---|---|
| `character-evaluation` | correct | §2.2, arXiv v3 PDF p. 15 |
| `joint-evaluation-injective` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring-scaled-idempotent` | correct | Proof of Lemma 2.5, arXiv v3 PDF p. 17 |
| `character-group-ring-lattice` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring-finite-index` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring-nonzerodivisor` | correct | Proof of Lemma 2.5, arXiv v3 PDF p. 17 |
| `norm-element-kernel` | correct | Lemma 2.2 and proof, arXiv v3 PDF p. 16 |
| `character-idempotent-evaluation` | correct | §2.2, arXiv v3 PDF p. 15 |
| `component-character-group-ring` | correct | §2.2, arXiv v3 PDF p. 15 |
| `component-group-ring-equiv` | correct | §2.2, arXiv v3 PDF p. 15 |
| `group-ring-component-decomposition` | correct | §2.2, arXiv v3 PDF p. 15 |
| `component-norm-quotient` | correct | Corollary 2.3, arXiv v3 PDF p. 16 |
| `character-group-ring-unit-criterion` | correct | §2.3, arXiv v3 PDF p. 18 |
| `character-group-ring-unit-one-character` | correct | §5.2, arXiv v3 PDF p. 34 |
| `character-group-ring-local` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring-maximal-ideal-power` | correct | §7.2.9, arXiv v3 PDF p. 49 |
| `character-group-ring-eval-local-hom` | correct | §5.1, arXiv v3 PDF p. 34 |
| `character-group-ring-residue-field` | correct | Proof of Lemma 8.22, arXiv v3 PDF p. 64 |
| `character-group-ring-adic-complete` | correct | §7.2.9, arXiv v3 PDF p. 49 |
| `character-group-ring-index` | correct | Lemma 2.5, arXiv v3 PDF p. 17 |
| `sharp-involution` | correct | §6.1, arXiv v3 PDF p. 40 |
| `contragredient-dual` | correct | §6.1, equation (80), arXiv v3 PDF p. 40 |
| `quadratic-presentation` | correct | §2.3, arXiv v3 PDF p. 16 |
| `fitting-quadratic` | correct | §2.3, arXiv v3 PDF p. 16 |
| `higher-fitting-ideal` | correct | Appendix B.2, first paragraph, arXiv v3 PDF p. 93 |
| `relation-minors-add-generator` | correct | Appendix B.2, the paragraph before Lemma B.5, arXiv v3 PDF p. 94 |
| `higher-fitting-independence` | correct | Appendix B.2, first paragraph, arXiv v3 PDF p. 93 |
| `higher-fitting-base-change` | correct | Appendix B.2, after (172), arXiv v3 PDF p. 93 |
| `locally-quadratic-presentation` | correct | Remark A.7, arXiv v3 PDF p. 86 |
| `extension-relation-matrix` | correct | Lemma 2.6, arXiv v3 PDF p. 18 |
| `quadratic-presentation-extension` | correct | Lemma 2.6, arXiv v3 PDF p. 18 |
| `fitting-extension` | correct | Lemma 2.6, arXiv v3 PDF p. 18 |
| `fitting-fibre-product` | correct | Lemma 2.7 and proof, arXiv v3 PDF p. 18 |
| `pid-cokernel-cardinality` | correct | Proof of Lemma 2.4, the case of a PID, arXiv v3 PDF pp. 16–17 |
| `finite-index-cokernel-descent` | correct | Proof of Lemma 2.4, displays (27) and (28), arXiv v3 PDF p. 17 |
| `cokernel-modulo-finite-ideal` | correct | Proof of Lemma 2.4, arXiv v3 PDF p. 17 |
| `finite-index-subring-nonzerodivisor` | correct | Proof of Lemma 2.4, arXiv v3 PDF p. 17 |
| `quadratic-cardinality` | correct | Lemma 2.4, arXiv v3 PDF p. 16–17 |
| `compound-matrix` | correct | Proof of Lemma 3.9, arXiv v3 PDF p. 26 |
| `complement-shuffle-sign` | correct | Proof of Lemma 3.9, arXiv v3 PDF p. 26 |
| `generalised-laplace-expansion` | correct | Proof of Lemma 3.9, arXiv v3 PDF p. 26 |
| `higher-adjugate` | correct | Proof of Lemma 3.9, arXiv v3 PDF p. 26 |
| `compound-image-determinant` | correct | Proof of Lemma 3.9, last step, arXiv v3 PDF p. 26 |
| `exterior-cokernel-annihilator` | correct | Lemma 3.9, arXiv v3 PDF p. 25–26 |
| `presentation-transpose` | correct | §6.1, (81), arXiv v3 PDF p. 40 |
| `transpose-stable-equivalence` | correct | §6.1, arXiv v3 PDF p. 40 |
| `transpose-fitting` | correct | Lemma 6.1, arXiv v3 PDF p. 40 |
| `transpose-higher-fitting-free` | correct | Proof of Kurihara's conjecture after Lemma B.4, arXiv v3 PDF p. 94 |
| `transpose-higher-fitting` | correct | Proof of Lemma B.4, equation (171), arXiv v3 PDF p. 93 |
