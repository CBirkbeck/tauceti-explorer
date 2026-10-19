# Handoff: REV-FIX-RT-AREA-ktheory-1~2

## Current checkpoint: Codex codex-cIShm2, 19 October 2026

Refs #5542. Claim comment 6265192509 was confirmed by the bot at 10:33:05 UTC.
This session did none of the original fixes and claimed no second job.
Only this handoff and the review report change.

**Still blocked on authorization for the twelve queue-only pairs.** The live
issue names seven pairs, the queue nineteen; the unmodified completion
predicate is false. The seven existing area verdicts are already terminal.
The twelve exact additional pairs and a ready-to-use issue amendment remain
below. WORKERS.md's instruction “Edit only the files the issue names” prevents
stamping or repairing those pairs without expanded authorization. An operator
question was submitted, with no authorizing reply. No scope, queue, label or
extra review object was changed.

New work is in the report's first continuation; do not repeat it merely to
produce another scope audit:

- Eight additional companions have manually confirmed admitted data bodies:
  BorelRegulators, M.1, StableHomotopyKTheory, U.1, M.5d, SchemeKTheoryOperations,
  V.1 and KTheoryFiniteLocalFields. Exact declarations and line numbers are
  in the report. U.1 (9,098), SchemeKTheoryOperations (20,089) and
  KTheoryFiniteLocalFields (5,900) also exceed the 5,000-line limit.
- A fresh serial `lean-check` of unchanged U.1 exits 1: eleven error
  diagnostics, comprising one finite-index proof failure, six smallness
  universe diagnostics and four diagnostics from two determinant controls
  that infer ℚ in place of ℚˣ. It also emits 946 admitted-proof warnings.
  The report gives the original line numbers and repair direction.
- The raw data checker sees comments and mistakes `Subgroup.Normal` proof
  instances for data. After comment removal, the four other additional
  companions do not have a confirmed data-body violation. This is not a
  mathematical acceptance verdict for them.
- Geisser 2004 Theorem 1.2, pp.774–775, and §5, pp.787–789 support the
  existing Dedekind hypotheses. Do not add a perfect-residue-field restriction.
  The missing explicit finite Zariski truncation/naturality interface should
  be stated; the source check does not close the distinct tower gap.
- The Birch–Tate golden-field consumer's “lower bound only” supplier-status
  sentence is obsolete. After authorization, cite N.8's independent
  certificate instead, preserving the application's conditional nature and
  the prohibition on using Birch–Tate to manufacture its input order.

All nineteen packet checks freshly pass with zero errors/warnings using the
shared pinned declaration index. The seven issue-listed companions have no
data-checker hits after comment removal; their earlier compilations were not
rerun. Current upstream smallness and homotopy ownership were read without
edits. Scratch has no resumption-critical material: all results needed by
the next worker are recorded in this handoff and the report.

The next action is scope reconciliation, then actual correction/review of the
twelve additional pairs. Prefer terminal `needs_changes` verdicts with precise
reasons to an unsupported acceptance; the job does not require all mathematics
to be accepted. Do not rerun the seven completed reviews to try to satisfy the
completion predicate.

## Previous checkpoint: Codex codex-RflGpa, 19 October 2026

Refs #5542. Claim comment 6263900238 was confirmed by bot comment
6263903165. This session did none of the original fixes and claimed no
second job. Only the review report and this handoff change.

**The job is blocked on edit scope, not on another mathematical check.**
The live issue, re-read after the claim, names seven packet/Lean pairs.
The actual queue entry has nineteen pairs. I independently compared the
paths and called the unmodified `issues.deliverables_complete`: false.
All seven issue-listed packets already satisfy its review predicate,
including the two negative K.1/K.6 verdicts. Exactly the twelve additional
packet verdicts below fail its reviewer-identity condition; none of their
existing independent reviews can stand in for this area-fix review.

[WORKERS.md, Doing the work](../WORKERS.md) says “Edit only the files the issue
names.” Authorization for the additional pairs was requested from the
operator; no authorizing response has arrived. The issue body and queue
were not changed. No additional verdict was stamped. No source reading,
mathematical review or Lean compilation is newly certified here.

### Concrete maintainer action

Add the following paths to issue #5542's Deliverables and to its full
instructions' files-under-review list, or explicitly authorize these exact
additional packet/Lean pairs. The corresponding work instruction is:

> Review the area-fix dispositions affecting each additional packet against
> the confirmed findings, read the relevant sources and actual supplier
> statements, correct clear errors within these files, preserve review
> history, and record this job's independent verdict. Check changed packets
> and changed Lean companions under the standing protocol. A prior review
> of another job is evidence to assess, not authorization to copy its verdict.

Additional deliverables:

- `research/blueprint/packets/BorelRegulators.json`
- `research/blueprint/packets/K2SymbolsBrauer--T.1-classical.json`
- `research/blueprint/packets/K3BlochGroups--V.1.json`
- `research/blueprint/packets/KTheoryFiniteLocalFields.json`
- `research/blueprint/packets/KTheoryLowDegrees--U.1.json`
- `research/blueprint/packets/KTheoryLowDegrees--U.4.json`
- `research/blueprint/packets/KTheoryLowDegrees--U.6.json`
- `research/blueprint/packets/MotivicEtaleKTheory--M.1.json`
- `research/blueprint/packets/MotivicEtaleKTheory--M.5d.json`
- `research/blueprint/packets/SchemeKTheoryOperations.json`
- `research/blueprint/packets/SpecialValuesBirchTate.json`
- `research/blueprint/packets/StableHomotopyKTheory.json`
- `research/blueprint/suggested/BorelRegulators.lean`
- `research/blueprint/suggested/K2SymbolsBrauer--T.1-classical.lean`
- `research/blueprint/suggested/K3BlochGroups--V.1.lean`
- `research/blueprint/suggested/KTheoryFiniteLocalFields.lean`
- `research/blueprint/suggested/KTheoryLowDegrees--U.1.lean`
- `research/blueprint/suggested/KTheoryLowDegrees--U.4.lean`
- `research/blueprint/suggested/KTheoryLowDegrees--U.6.lean`
- `research/blueprint/suggested/MotivicEtaleKTheory--M.1.lean`
- `research/blueprint/suggested/MotivicEtaleKTheory--M.5d.lean`
- `research/blueprint/suggested/SchemeKTheoryOperations.lean`
- `research/blueprint/suggested/SpecialValuesBirchTate.lean`
- `research/blueprint/suggested/StableHomotopyKTheory.lean`

After scope is resolved, perform the twelve reviews and call the actual
completion predicate again. A scope update is not a substitute for those
reviews. Do not change the queue, labels, completion predicate or other
reviewers' identities merely to obtain a successful completion result.

### Verification in this continuation

- Live issue/queue comparison: 14 packet/Lean paths versus 38; the 24-path
  difference is listed above.
- Actual completion predicate: false; all seven issue-listed packet verdicts
  pass, all twelve queue-only packet verdicts fail the area reviewer identity.
- Intake file validation and `git diff --check` apply to this report/handoff
  change. No packet or Lean companion changed, so their preceding validation
  results remain attributed to the workers below and were not repeated.

The previous handoff follows in full for its mathematical resumption notes.
Scratch contains no material needed by the next worker.

## Previous checkpoint: Codex codex-KwyvX3

Codex, session `codex-KwyvX3`, 19 October 2026. Refs #5542.
The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5542#issuecomment-6262919229)
was confirmed by the bot at 08:23:47 UTC. No second job was claimed. This is a
**blocked checkpoint**; only the review report and this handoff change.

## Resolve scope before another review continuation

The live issue names seven packet/Lean pairs. The actual queue requires
nineteen. Calling the unmodified `issues.deliverables_complete` with the
actual queue job returns false for exactly the twelve additional packets
below. All seven issue-listed packets already carry this area's verdicts,
including the negative K.1/K.6 outcomes, which count as completed reviews.
This session did not renew those inherited verdicts. Historical seventeen/ten
counts in their review notes are obsolete.

[WORKERS.md, Doing the work](../WORKERS.md) says “Edit only the files the issue
names.” Expanded authorization for all twelve additional packet/Lean pairs
was requested from the operator; no authorizing response arrived. Do not
change the queue or stamp extra packets to bypass the discrepancy. The next
useful action is a maintainer/operator scope reconciliation, followed by the
remaining reviews; repeating the completed seven-pair checks cannot finish
this job.

The extra basenames each have a packet in `packets/` and a companion in
`suggested/`:

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

All twelve retain different independent reviewers. Reproduce this inventory
from the current queue rather than relying on an older handoff.

## New /37 work: explicit general-target factorization argument

The current report's first continuation records a six-step proof
reconstruction, its precise hypotheses, source locations and three controls.
It develops the pushout route already suggested but unused in
`H.3/plus-construction-universal-property`:

- Replace the square by a double mapping cylinder W = Y ∪ (X × I) ∪ Z.
- Van Kampen makes Z → W a fundamental-group isomorphism when g kills P.
- Relative excision **with local coefficients** transports the vanishing
  relative homology of the plus map to (W,Z).
- Regular-module homology identifies the universal-cover homology maps.
  Apply simply connected homological Whitehead there, then ordinary
  Whitehead downstairs. This avoids assuming the target is abelian.
- A homotopy inverse W → Z gives the factorization. Each competing
  factorization extends over W to a left inverse of Z → W; uniqueness of
  that inverse up to homotopy proves free homotopy uniqueness.

The missing explicit supplier interface is the cylinder-gluing excision
isomorphism for a variable local coefficient system, with its naturality.
Do not replace it by ordinary homology excision. The report includes the
nonabelian B(S₃) identity control, the two-plus-model uniqueness control,
and Hatcher Example 4.35's failure with constant coefficients.
This is a report-level proof reconstruction, not an edit or new review of the
extra supplier packet, and not a complete review of finding /37.

After authorization, the finite-field consumer still needs the repair already
identified by codex-FcWva7:

1. Import `H.3/plus-hspace-recognition` and `H.4/plus-hspace-block-sum`
   explicitly in `L.1/quillen-fibration`.
2. Supply perfectness of E(F_q) through U.1, the abelian plus source via
   block sum and `H.3/hspace-is-abelian`, the connected H-space target via
   `L.1/fpsi`, and the integral homology hypothesis via
   `L.1/quillen-homology-iso`.
3. Correct the claim that the restricted universal property gives the
   equivalence, and remove the stale assertion that its abelian proof was
   unread. Preserve the independent representation-theoretic/homology gaps.
4. Decide whether the reconstructed general-target argument closes the
   supplier's recorded gap after adding its exact missing interface. An
   import substitution alone does not do this.

## Source and current-library provenance

Public sources directly read in this session:

- Weibel, [*The K-book*, Chapter IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf),
  Theorem 1.5 and preceding proof-reference paragraph, Lemma 1.6 with proof,
  printed p. IV.5; Theorem 1.8 and Remark 1.8.1, printed p. IV.6.
  SHA-256: `9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248`.
- Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf),
  Theorem 1.20, printed p.43; §3.H, Example 3H.2, printed p.329, and the
  relative/excision discussion, printed p.333; Corollary 4.33 with proof,
  printed pp.367–368; Example 4.35, printed pp.368–369.
  SHA-256: `bebb3032bf9021b956da3bd070eb6c67dc662cf849be9cdf6679f677560e5618`.
- Haine, [*On the K-theory of finite fields*](https://math.berkeley.edu/~phaine/files/KFF.pdf),
  §6, Theorem 6.5, Goal 6.6 and Lemma 6.8, printed p.10. Factorization and
  the subsequent simplicity/equivalence checks are separate.
  SHA-256: `88edeb5faa10102d70034802892daa820395d38d395b7ad861c76dd114758805`.

Read the current upstream AlgebraicTopology and GrothendieckEulerForms
READMEs without edits (roadmap checkout commit
`0d144d044dacebca17b654695b6f1ad58f159b27`). AlgebraicTopology Stage 8's
homological Whitehead has simply connected hypotheses. Those hypotheses
suffice on the universal covers in the new argument, not directly on BGL(F_q)⁺.

At current Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`,
`AlgebraicTopology/LocalCoefficient.lean` and
`AlgebraicTopology/Singular/Twisted/Relative.lean` already supply
`LocalCoefficientSystem`, pullback, relative twisted chains, their short
exact sequence and the three homology exactness lemmas. Their actual
statements were read. Consume them; do not plan them again. The relative
file does not exist at the older f790474 pin, so this is a current-library
observation rather than a pinned-baseline citation. The actual
`TopPair.isIso_singularHomologyMap_of_open_cover` in
`AlgebraicTopology/Singular/Excision.lean` has a single coefficient object;
it does not state twisted excision. No twisted-excision declaration was
found in the current tree. No lake command was run in either read-only tree.

## Inherited findings and validation

The report preserves earlier reviews and corrections with authorship:

- /5 and /33: the rational-Hurewicz node uses Hatcher's free-cohomology
  Cartan–Serre route, expressly avoiding Milnor–Moore. Missing homotopy
  associativity alone does not refute that route. The verifier's H.6 owner
  still disagrees with the actual H.3 node and Borel imports. Assess
  ownership and the entire proof separately after scope authorization.
- /23: both scheme coniveau nodes already import H.6's exact-couple,
  filtered-spectrum and convergence contracts. The old missing-import
  complaint is stale; no entire scheme packet is certified here.
- N.7's direct golden-field Tate argument and eleven exact finite
  certificates replace the obsolete cyclotomic-representative objection.
- T.3 retains arbitrary-residue complete-DVR Part II supplier work, Artin
  lengths, inseparable residue possibilities and generic separability.
  Field Matsumoto does not prove the commutative-ring monomial-kernel claim.
- K.1/K.6 remain negative because the proposed early-product and
  late-cofinality splits have not been applied to the actual stage graph.
- T.1/V.1 and N.5/V.5/N.8 retain the UCE and arithmetic ownership boundaries.
  The compact Lean companions are statements, not implementations.

All nineteen queue packets pass `scripts/check_blueprint.py` with the shared
pinned declaration index: zero errors and zero warnings. Extra-packet checks
are read-only structural checks, not independent mathematical reviews.
There are no standalone link-map or restructuring outputs. No Lean file
changed or was compiled, and inherited compilations were not repeated.
No library build, update, cache download or language server ran.

After scope reconciliation, review the twelve extra pairs against the
confirmed findings and current suppliers, preserving review history before
replacing verdicts. Correct clear errors and retain precise negative verdicts
where needed. Validate changed deliverables and call the unmodified actual
completion predicate. All resumption-critical details are in this handoff
and the report; scratch may be deleted after the pull request opens.
