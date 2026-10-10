# REV-FIX-RT-AREA-iwasawa-2~2 — scoped review and migration requirements

## Current review: codex-1TGphB, 10 October 2026

**L3 is accepted within the fix scope. PMIA needs changes because its generic
Fitting targets duplicate current Tau Ceti. The named reviews are finished;
queue completion requires a decision on the two excluded packets.**

Codex, session `codex-1TGphB`, issue
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219),
[bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6092009330).
Input atlas commit `aa80da4b321c6bcd4d8fed04b5102157998b2bd1`.
This reviewer did not author the original fix, nor the previous reviews.
Their evidence and limitations remain below and in `reviewHistory`.

Read the six original claims, verifier verdicts, round-two fix report and
merged review/handoff before inspecting the present contracts. The inherited
50-node L6 audit is preserved with its original attribution; this continuation
checks the source interfaces and migration boundary, rather than claiming a
new complete audit of either packet.

| Finding | Verdict and reason |
|---|---|
| /1: Morita Gamma / Gross–Koblitz | Scoped L3 correction accepted. The signed finite product extends continuously to units; the multiplier is minus the argument on units and minus one on nonunits. Morita §1 pp.255–256 also exposes the already recorded modulus-four exception. Robert §4 pp.165–166 retains the coefficient-decay boundary; a formal telescoping identity alone is insufficient. The normalized-root integral congruence, source-negative Gauss sum and dyadic boundaries remain explicit. L3-2 and RD.6 still own their recorded inputs. |
| /2: Ferrero–Greenberg | Assignment accepted; the theorem is still an L3-2 obligation. Preserve the general correction term, its exceptional specialization, prime range, derivative/branch coordinates and separate arithmetic nonvanishing input. No fresh Ferrero–Greenberg/Zhao source authentication or L3-2 acceptance is claimed. |
| /3: integral/open log-syntomic input | Outside-owner handoff accepted. The required early CohomologyComparisons Part II construction, modified twists and comparison ranges are stronger than the proper rational comparison. The newer D.1 independent review remains intact; this run does not overwrite or repeat it. |
| /4: Dasgupta–Kakde algebra | Source corrections remain sound: use the image character ring with congruences, square presentations, the right-sided compound/adjugate preimage and a presentation-dependent transpose. **PMIA needs changes:** generic higher Fitting construction, independence and base change are now implemented. Import them; retain only necessary concrete matrix comparisons. |
| /5: finite-slope perfect complexes | Outside-owner assignment accepted; job #641 remains responsible for representative-independent cohomological support, solid derived localization and early shared Stein inputs. This fix does not identify a raw degreewise determinant product with the derived construction. No new audit of that excluded roadmap is claimed. |
| /6: duplicate endpoint | Verifier rejection retained. The independent Hecke/congruence and Euler-system proof routes remain distinct targets; no endpoint is deleted. |

Freshly read public source copies on 10 October 2026:

| Source | Locators actually checked | SHA-256 |
|---|---|---|
| [Morita 1975](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf) | Complete page images, §1 pp.255–256, Lemma 1, Theorem 1 and following recurrence | `cad5af477bc19847e46d5af98c294a289f30096128b9e799799dfdb88ce05912` |
| [Robert 2001](https://www.numdam.org/item/RSMUP_2001__105__157_0.pdf) | Complete page images, §4 pp.165–166, Theorem 3 telescoping and subsequent decay lemma | `2229b561a4f93da503e7264b90d552306d64114e018ff4de3488e7b1b01e2581` |
| [Dasgupta–Kakde v3](https://arxiv.org/pdf/2010.00657v3) | Text layer: §§2.2–2.3 pp.15–18, Lemma 3.9 pp.25–26, §6.1 p.40, Appendix A pp.85–86, Appendix B.2 pp.93–94 | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` |

The published Annals version was not freshly read. No restricted source,
verbatim passage, new erratum or new historical priority claim is introduced.
The existing source findings and version records are preserved.

### Concrete corrections and remaining migration

Read current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`
and current TauCetiRoadmap at `37769f03c170a7bc3e1082df70522a0ad59c5ffd`,
without modifying or building either tree. The preceding exact declaration
map remains valid. In particular, Basic.lean:343 supplies all degrees;
:349 computes from any finite-free surjection; Generators.lean:109 computes
from any generating set of its kernel; BaseChange.lean:134 needs no flatness;
and :159 also covers localization. These statements require a finite module,
so finite presentation is not a missing prerequisite for the native carrier.

Corrected both StableReduction supplier notes in PMIA: the old ownership
narrative is explicitly historical, and their open status denotes an
unresolved baseline/interface migration, not a request to implement a second
carrier. Added a precise migration inventory to `upstreamNotes`:

- Replace `higher-fitting-ideal`, `relation-minors-add-generator`,
  `higher-fitting-independence` and `higher-fitting-base-change` with native
  definitions/theorems; the previous report below gives names and line numbers.
- Retarget their direct local consumers, particularly
  `transpose-higher-fitting-free` and `transpose-higher-fitting`, plus both
  degree-zero supplier requests and L4's characteristic-ideal comparison.
- Retain the concrete adapter from a column relation matrix to kernel
  generators and native functional-evaluation minors. Account explicitly for
  the transpose and the degree `n-k`; do not recreate generic independence.
- Carry the existing deficient-relation, high-degree, nonprincipal two-cyclic
  and nonflat base-change tests to the native vocabulary. Specialized cyclic
  direct-sum computations may still need matrix lemmas.

The older f790474 Git object tree has no FittingIdeal modules. Consequently
this review does not add false pinned citations, silently change the baseline,
or import unavailable modules to claim a successful migration. The four
inherited generic nodes, their suggested signatures and the unauthorized
reader require coordinated reconciliation. PMIA remains `needs_changes` until
that happens. All mathematical nodes, API/test records, gaps, coverage,
source findings and baseline pins are preserved. No Lean file was changed.
Both preceding top-level review objects were archived before replacement.

### Validation and scope blocker

Three central shared-build Tau Ceti source modules were compared byte for byte
against f790474 Git objects: diagonalizable-group evaluation, character
orthogonality and the Auslander–Reiten transpose. All match. Their statements
retain the needed group/domain/root hypotheses; the transpose cokernel itself
does not require a minimal presentation. The earlier full baseline audit is
inherited evidence, not newly relabelled work.

| Fresh check | Result |
|---|---|
| L3 packet checker | Zero errors; 26 inherited short-API warnings outside this fix scope |
| PMIA packet checker | Zero errors and warnings |
| Full PMIA `lean-check` | Exit 0; 1,075 warnings, all `sorry`; no other warning or error |
| Full L3 `lean-check` | Exit 1 at the missing `research` module prefix; no declaration elaborated |
| Source-text inventory | No `excerpt` key in either packet; no passage added |
| `issues.deliverables_complete` | Live five-output scope: True; queue nine-output scope: False |

Compiles ran sequentially with over 100 GB available memory. No dependency
build, language server or background Lean process remains. This is a review
of planning contracts, not a proof-completion claim.

The live issue authorizes L3 and PMIA packets/suggested files plus this report.
The queue also requires L3-2 and D.1 packets/suggested files, and its predicate
requires this exact review identifier on every packet. A completed
`needs_changes` verdict counts; changing PMIA's verdict cannot resolve that
scope discrepancy. WORKERS.md requires: “Edit only the files the issue names,
plus your own scratch space.” Additional authorization was requested during
this run; no answer has arrived. No excluded review identity, queue entry,
issue body or label was changed.

This submission is a checkpoint for that scope blocker. The next action is a
scope decision: authorize the additional independent reviews, or reconcile
the queue to the live deliverables. Another unchanged two-packet review cannot
complete it. Separately, the PMIA owner must perform the native Fitting
migration above. No disposable scratch artifact is needed to resume.

## Preserved preceding review

## Current review: codex-Jk8aAy, 10 October 2026

**L3 is accepted for the scoped handoff. PMIA needs changes to reuse the
Fitting-ideal implementation now present in current Tau Ceti. Queue completion
also remains blocked by the live issue's narrower authorization.**

Codex, session `codex-Jk8aAy`; issue
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219);
[confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6091703225).
Input atlas commit `5b5bafaba00862daa870e24e1303c1f1c8f179f3`.
This session did none of the author fix and claimed no second job.
The historical reviews below retain their authorship and dates. Their PMIA
acceptance is superseded by the current-library reuse objection below, not by
a new objection to the source algebra.

### Findings and fresh evidence

| Finding | Current disposition |
|---|---|
| /1 | L3's Morita construction and handoff remain correct. Fresh visual reading of Morita §1, Lemma 1, Theorem 1 and recurrence, printed pp.255–256, confirms the signed values, continuity and modulus-four exception. Robert §4, printed p.166, retains a coefficient-decay input; RD.6's coefficient/splitting obligations remain explicit. Normalized-root and dyadic additions belong to the unreviewed L3-2 input. |
| /2 | The derivative-formula assignment remains correct. The general correction term, prime range, branch/derivative coordinates and separate arithmetic nonvanishing input are still L3-2's obligations. This run does not authenticate Ferrero–Greenberg or Zhao or give L3-2 a verdict. |
| /3 | The early integral/open log-syntomic supplier assignment remains a handoff. D.1's newer independent review is preserved; its review identity is not changed to satisfy the queue. |
| /4 | The order-specific algebra agrees with the source corrections. **Needs changes:** current Tau Ceti supplies the generic higher Fitting carrier, independence and base change; the four inherited generic nodes must import it. Exact mapping below. |
| /5 | The complex-level and solid/Stein supplier assignment remains a handoff. No excluded functional-analysis packet is reviewed. |
| /6 | The verifier's rejection remains binding: the two independent main-conjecture proof routes stay. |

Freshly read Dasgupta–Kakde v3 §§2.2–2.3 pp.15–18, Lemma 3.9 and proof
pp.25–26, §6.1 p.40, Appendix A pp.85–86 and Appendix B.2 pp.93–94.
The image character ring, nonzerodivisor/finite-quotient hypotheses, square
presentations and presentation-dependent transpose remain correct. The
right-sided higher-adjugate identity constructs the required preimage; it
avoids assuming preservation of the rectangular compound image.
This is a focused fix review, not a fresh 487-node or 1,663-node audit.

Public copies fetched on 10 October 2026:

| Source | Freshly read scope | SHA-256 |
|---|---|---|
| [Morita, 1975](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf) | §1, pp.255–256, complete page images | `cad5af477bc19847e46d5af98c294a289f30096128b9e799799dfdb88ce05912` |
| [Robert, 2001](https://www.numdam.org/item/RSMUP_2001__105__157_0.pdf) | §4, p.166, complete page image | `2229b561a4f93da503e7264b90d552306d64114e018ff4de3488e7b1b01e2581` |
| [Dasgupta–Kakde v3](https://arxiv.org/pdf/2010.00657v3) | Locators above, text layer | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` |

No restricted book was fetched or read. No source passage or excerpt is added.

### Current-library reuse required for /4

Read current upstream StableReduction and QuiverRepresentations READMEs and
relevant interfaces at roadmap commit `37769f03c170a7bc3e1082df70522a0ad59c5ffd`.
Read current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
The [FittingIdeal modules](https://github.com/TauCetiProject/TauCeti/tree/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RingTheory/FittingIdeal)
already provide:

| Existing declaration and locator | Reuse in PMIA |
|---|---|
| `TauCeti.fittingIdeal`, Basic.lean:343 | One carrier for every degree, under `Module.Finite`; the packet's finite-presentation scope is a specialization. |
| `TauCeti.fittingIdeal_eq_minorsIdeal_ker`, Basic.lean:349; `TauCeti.fittingIdeal_eq_minorsIdealOfSet`, Generators.lean:109 | Presentation independence and computation from a generating set of relations. Retain only the concrete matrix-minor comparison adapter needed by the DK presentations. |
| `Submodule.minorsIdeal_prod_top`, Basic.lean:242; `Submodule.minorsIdeal_ker_eq_of_surjective`, Basic.lean:304 | The generic redundant-generator and independence machinery already exists. |
| `TauCeti.fittingIdeal_monotone`, Basic.lean:360; `fittingIdeal_le_of_surjective`, :372; `fittingIdeal_congr`, :381 | Chain, surjection and isomorphism API. |
| `TauCeti.fittingIdeal_prod_add_finrank`, Basic.lean:389; `fittingIdeal_eq_bot_of_lt_finrank`, :401; `fittingIdeal_eq_top_iff_finrank_le`, :409; `fittingIdeal_quotient_zero`, :418 | Free-summand shift, free-module jump and quotient computations. |
| `TauCeti.fittingIdeal_baseChange`, BaseChange.lean:134; `IsBaseChange.fittingIdeal_eq_map`, :159 | Arbitrary base change without flatness, and localization via the existing base-change interface. |

`L6/higher-fitting-ideal`, `relation-minors-add-generator`,
`higher-fitting-independence` and `higher-fitting-base-change` therefore cannot
remain generic new implementation work. Reuse the native vocabulary, carry the
order-specific comparisons and tests over to it, and reconcile the two
StableReduction Fitting-carrier requests. The modules are absent at the
recorded f790474 pin: verified against the Git object tree. They cannot honestly
be added as f790474 baseline citations. A pinned compile cannot certify imports
of these newer modules. The full reader is not an authorized deliverable here;
the note records the necessary baseline/reader/interface reconciliation rather
than silently changing the baseline or claiming to have completed a migration.

Added this exact reuse boundary to PMIA's `upstreamNotes` and its suggested-file
introduction. Preserved every mathematical node, API, test and prerequisite,
and preserved both previous review objects in `reviewHistory`. PMIA's current
verdict is `needs_changes`; no package should rebuild these generic objects.

### Pinned checks and completion blocker

Read the reviewed L3/L4/L6 library-audit entries. Freshly read the pinned
character-evaluation, tagged orthogonality and transpose interfaces; the three
shared-build source modules match the f790474 Git objects byte for byte.
The transpose needs no minimality to form its cokernel; tagged orthogonality
retains finite commutative-group/domain/enough-roots hypotheses.

| Check | Result |
|---|---|
| L3 packet checker | 1,663 nodes; zero errors, 26 inherited short-API warnings |
| PMIA packet checker | 487 nodes; zero errors and warnings |
| Native PMIA `lean-check` | Exit 0; 1,075 warnings, all `sorry`; no other warnings or errors |
| Native L3 `lean-check` | Exit 1: unknown research-module prefix; no declaration elaboration |
| Current-library screen | New Fitting implementation found; current library was read, never built |
| Source-text inventory | No `excerpt` key in either packet |

Compiled sequentially after checking available memory (104 GB). PMIA's only
Lean edit afterward is its explanatory comment; no signature or proof changed.
No background compile, language server or dependency build remains.

Fresh `issues.deliverables_complete` gives `True` for the live issue's five
outputs and `False` for the queue's nine. The completion predicate permits a
finished `needs_changes` review: PMIA's new verdict does not cause this scope
failure. The queue additionally requires L3-2 and D.1 packets and suggested
files, neither authorized by the complete live issue. WORKERS.md requires edits
to issue-named files only. A scope decision was requested; no answer has arrived.
No excluded review identity or queue entry is changed.

To complete the queue, either authorize independent reviews of those two
additional inputs, or reconcile the queue to the five live-issue deliverables.
The existing mathematical review must not be relabelled or repeated as a
substitute. This PR is a checkpoint for that authorization blocker; it also
leaves the new native-Fitting reuse objection for the PMIA owner.

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
