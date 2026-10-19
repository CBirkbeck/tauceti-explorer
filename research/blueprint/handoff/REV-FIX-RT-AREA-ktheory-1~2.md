# Handoff: REV-FIX-RT-AREA-ktheory-1~2

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
