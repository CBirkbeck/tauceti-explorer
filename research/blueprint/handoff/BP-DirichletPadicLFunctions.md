# BP-DirichletPadicLFunctions: tame arithmetic moments

Codex / codex-7e92bd. Same-worker issue713 follow-up after PR3269 merged
787698102dcdcb8b1d1fdf25624c8297f145f56a (head
b8e4844c5a149c6befd42d639a38f873a8ee8294). Original claim5854790528,
winning bot5854791937; no additional claim. Review390 remains unclaimed.

## Delivered and remaining

Eight L2 declarations give the finite Bernoulli generating identity, exponential
coefficients, formal Mahler moments, field-hom transport, native complex special
values, actual tame ordinary moments and two common algebraic comparisons
(before and after restriction to units). The explicit common value is
b_(η,k)=−D^k/(k+1)·Σ_aη(a)B_(k+1)(a.val/D), with native rational
Bernoulli polynomials. Separate embeddings E→ℂ and E→K give the two images.
The zero-th complex value imports the existing QSeries endpoint statement.

The actual K-valued moment theorem explicitly depends on a new PMIA L2 request:
the published ordinary-moment theorem only covers Z_p-valued measures. Bounded
inversion does not supply that missing generalization. Its signature elaborates,
but no closed proof chain or implementation is claimed for that step. Generalized
Bernoulli carriers remain with ModularForms; no shared carrier is duplicated.

Totals:198 nodes (1 definition,21 constructions,102 lemmas,52 theorems,
22 comparisons),195 API entries,183 packet tests (113 on definitions/constructions),
186 typed examples,23 planets,280 baseline citations. All190 predecessor nodes,
270 baseline records,13 findings and sourceVersions remain whole. Five gaps,
two requests,zero closed stages; all implementation statuses unchecked.

Resume by obtaining the PMIA coefficient-field moment comparison, proving the
primitive-conductor product twist and constructing the inverse-weighted tame
measure with its shifted interpolation. Composite-modulus primitive Gauss
nonvanishing retains its existing modular-forms owner. Full source extraction,
analytic interpolation and the completed-algebra comparison remain open.

## Reading and validation

Full published144–146 freshly reread from the retained hash-verified public PDF;
consumed PMIA and QSeries nodes and exact suggested signatures read. Ten new
native statements and their ambient hypotheses were read at the pinned commits
and matched to the unchanged index. Earlier full-paper/version/audit reading
provenance persists; no new whole-paper reading, correction search or finding.

Indexed blueprint: zero errors and warnings. Four-file intake: zero problems.
Whole-record preservation, versioned source findings, declaration/test parity and
scoped mutation checks pass. The dependency graph has333 reachable nodes,
1461 edges and384 baseline leaves; it is acyclic. Its two explicit request
leaves are PMIA L1 (the existing completed-algebra comparison) and PMIA L2
(the newly exposed coefficient-field ordinary-moment comparison).

The full suggested Lean file elaborates with zero errors and450 expected
placeholder warnings. It uses the verified actual265-node PMIA artifact from
PR3263/PR3269, whose source, olean and log hashes were rechecked. The current
276-node supplier preserves every consumed API; no compilation against that
newer revision is claimed. The recursive source audit covers3595 pinned Mathlib
modules,20 pinned Tau Ceti modules and the one actual supplier. Existing pinned
artifacts were reused; no Mathlib or Tau Ceti build was run.

Five complete native probe lemmas compile against2826 pinned Mathlib modules
with zero errors, warnings or proof holes. They check finite-value transport,
rational Bernoulli evaluation and three rational computed values. All55 exact
Fraction controls pass for five characters, including a nonreal quartic
character, at degrees0–10. These finite controls do not establish the measure
moment request or a complex analytic theorem.

Suggested SHA256: `df7ecb1f5d62b7b555c01eea4873605418572de3a04814744ec9f7dde95262b3`.
Native probe SHA256: `72b4737b00c73fec983321c35e727dd17ef9337cf17a15aeae5794320ea3638e`.
The live guard at5ca6172d0e2559d5343100eebc8f141d2d29ff52 verifies53 inputs, all four predecessor
outputs, the unchanged full issue, exact merged PR3269 head, original winning
claim5854791937 and blocked/unclaimed review390. One reusable worktree and one
Lean process at a time were used; both compiler runs have ended. The predecessor
Lean file is retained as a contiguous body, with two native imports and the new
signatures/tests added. No implementation or closed stage is claimed.

Retained worker evidence: MomentProbe.lean and its compiler/result/source-audit
receipts; full suggested compile/result and full-source-audit.json;
artifact-reuse.json; moment-controls.py and moment-controls.json; closure.json,
verification.json, publication-guard.json and captured input metadata; exact
submitted deliverables and submission receipt. Scratch is retired after the PR
opens, retaining only this evidence. No private path or source PDF is published.
