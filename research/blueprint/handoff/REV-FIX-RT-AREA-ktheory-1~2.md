# Handoff: REV-FIX-RT-AREA-ktheory-1~2

Codex, session `codex-DDV2ll`, 19 October 2026. Refs #5542.
The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6260970357)
was [confirmed](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6260972383).
No second job was claimed. This is a **blocked checkpoint**; only the review
report and this handoff change.

## Required scope decision

The live issue authorizes seven packet/Lean pairs. The checked-out
`research/blueprint/queue.json` requires nineteen. A fresh call to the actual
`issues.deliverables_complete(job)` returns false. All seven issue-listed
packets already carry this area's review, including the negative K.1/K.6
verdicts, which count as completed review outcomes. Those seven verdicts are
inherited and were not renewed in this session.

[WORKERS.md, Doing the work](../WORKERS.md) says “Edit only the files the issue
names.” Expanded authorization for the twelve additional pairs was requested
from the operator; no authorizing response has arrived. Do not alter the queue
or stamp additional packets to bypass the mismatch. Reconcile the issue's
scope with the queue, or obtain explicit authorization for these additional
basenames, each with a packet in `packets/` and a companion in `suggested/`:

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

All twelve currently retain other independent reviewers. Their existing
acceptances are evidence to inspect, not this area's verdicts. Earlier
seventeen/ten inventories are obsolete for this checkout. Reproduce the
inventory from the actual queue job rather than from an older handoff.

## New source clarification for /5 and /33

The current `H.3/rational-hurewicz-hspace` uses free rational cohomology and
Cartan–Serre, expressly avoiding Milnor–Moore. Do not reject that route solely
because its H-space hypothesis lacks homotopy associativity. Fresh reading:

- Hatcher, [Algebraic Topology](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf),
  §3.C, printed pp.283–286, Theorem 3C.4 and proof. The associative
  multiplication is the cup product; the coproduct data used there do not
  assume an associative H-space multiplication.
- Hatcher, [Spectral Sequences, Chapter 1](https://pi.math.cornell.edu/~hatcher/SSAT/SSch1.pdf),
  Theorem 1.24, proof and following paragraph, printed pp.38–39: the
  free-cohomology rationalization argument applies to the specified abelian
  spaces and hence to H-spaces under its finiteness conditions.

Read on 19 October 2026. SHA-256:

- AT: `bebb3032bf9021b956da3bd070eb6c67dc662cf849be9cdf6679f677560e5618`.
- SSAT chapter: `d34a09b4559eade18dac2c01f6718d4689c5f565d9dc252c3a67de0167520eca`.

The missing-H.6-owner concern remains: the verifier's /5 and /33 assign the
single rational comparison owner to H.6, while the actual node and Borel R.3
imports use H.3. This reading clarifies a mathematical objection; it does not
approve the ownership change, the entire primitive-image proof or the two
packets. Resolve those separately after scope authorization.

## Current /23 contract

Both `SchemeKTheoryOperations:S.4/k-coniveau-spectral-sequence` and
`S.4/g-coniveau-spectral-sequence` directly import H.6's `exact-couple`,
`filtered-spectrum-spectral-sequence` and
`spectral-sequence-convergence-exhaustive` nodes. The three supplier statements
were read; the finite-dimensional scheme filtrations use their bounded finite
case. The older missing-import objection is stale at this contract level.
No whole-packet review is certified here.

## Validation and inherited evidence

All nineteen queue packets pass `check_blueprint.py` with the shared pinned
declaration index, zero errors and zero warnings. Extra-packet checks are
read-only structural checks. The actual completion predicate remains false
for exactly the twelve unstamped packets above. The live issue was re-read
and still lists seven pairs. There are no standalone link or restructuring
outputs to check. No Lean file changed or was compiled; no library build,
update, cache download or language server ran. The current upstream
AlgebraicTopology and GrothendieckEulerForms READMEs were read without edits.

The review report preserves earlier source readings, finite-certificate
reproductions, Lean corrections and elaborations with their authorship. Those
are not new certifications by this session. In particular:

- N.7's direct golden-field route replaces the obsolete Zhang–Xu/Skalba
  objection. Its eleven exact finite certificates are described in the report.
- T.3's arbitrary-residue complete-DVR Part II remains proposed supplier work;
  keep Artin lengths, inseparable residue possibilities and the generic
  separability qualification. Field Matsumoto does not supply its distinct
  commutative-ring monomial-kernel obligation.
- K.1/K.6 retain negative reviews because actual-stage product/cofinality
  ordering needs the maintainer's proposed restructuring. A concrete-node DAG
  and a Lean elaboration do not settle that stage-order issue.
- T.1/V.1 and N.5/V.5/N.8 retain the recorded UCE and arithmetic ownership
  boundaries. The streamlined Lean companions do not implement their targets.

After scope reconciliation, assess the twelve pairs against their assigned
confirmed findings and current source/supplier contracts; preserve review
history before replacing verdicts. Use the current compact Lean shape for any
necessary companion repairs. Then validate the changed files and call the
unmodified real completion predicate. Do not repeat the completed seven-pair
checks as a substitute for resolving scope. All resumption-critical details
are in this handoff and the report; scratch files may be deleted.
