# Verification: representation-theory index red team

Codex — `codex-a71f92`; 2026-09-30. Refs #4367.

## Disposition

The submitted red-team result contains **zero findings**. There is therefore
nothing to mark confirmed or rejected, and no confirmed finding to send to a
fix job. The review JSON deliberately contains an empty findings array; it is
not an approval of the twelve child roadmaps or their mathematical proofs.

I am independent of the original map's author `cgp-212bf5d92a8b`, its reviewer
`codex-c83e7a`, and red-team worker `codex-rtOQ9t`. My earlier work on the
separate SpinRepresentations child is not work on any of the three index jobs
excluded by this issue. Claim comment 5912193316 was confirmed by bot comment
5912196325; I reread the issue before beginning.

## Inputs and independent checks

Base commit: `6480cbe61a8cc144b1e67a6d23a8faad23a5aa39`.

| Input | Git blob |
| --- | --- |
| Red-team result | `49f4cf138b0c029dbd1dc29964222589313464ca` |
| Red-team report | `dfdc4e9c2d09d68867d165bde21c89071702d942` |
| Accepted index link packet | `58118e06ddf24b8e34ba4c0ac8312e1316c4f523` |

I read the complete result and report, accepted packet, producer handoff,
original independent review, complete 119-line index README, and empty subject
extract. I also read PROTOCOL sections 10 and 17 and the cited projective-
representation passage in the induction child.

The central justification is reproducible, not a keyword inference. Exact-owner
and exact-stage-prefix tests give:

| World | Roadmaps | Stages | Exact index-owned stages |
| --- | --- | --- | --- |
| Raw atlas at the base | 212 | 1,968 | 0 |
| Validator world including all nine supplemental definitions | 221 | 2,028 | 0 |

All twelve children retain distinct owner IDs and exactly the recorded 105
stages. The subject extract has no stages or touching stage edges. The accepted
packet itself has no links or overlaps and nine examined entries.

The index calls itself an index; its child lists do not make their stages
parent-owned. The link checker requires a subject-owned endpoint, so the empty
ownership set rules out an admissible stage link for every possible partner.
That supports the narrow clean result without establishing anything about all
representation-theory dependencies.

I separately inspected `UPSTREAM:RepresentationTheory`: its four placeholder
edges lead to AF.1, AF.1a, AS.0 and QM.6, while its alias metadata explicitly
leaves exact theorem availability and signature matching unverified. It is not
an index-owned mathematical stage. Those placeholders remain unresolved; zero
owned stages must not be restated as zero representation-related dependencies.

All nine source README Git blobs match the accepted packet. The eight literal
source quotations match their recorded documents. The packet SHA-256 remains
`25465cbe6da416772ffe36bd3acebeb50aad1a9f6095a73080b5f84dd62c16f9`;
the physical index SHA-256 remains
`e757a62b95fb39a930dba604bf09a1e657555ab52641c8589850e39e5c09324e`.
These identity checks do not certify every claim inside those documents.

Public source locators inspected on 2026-09-30 include the
[index](https://github.com/CBirkbeck/tauceti-explorer/blob/6480cbe61a8cc144b1e67a6d23a8faad23a5aa39/content/tau-ceti/RepresentationTheory/README.md)
and [InductionRestriction Layer 7](https://github.com/CBirkbeck/tauceti-explorer/blob/6480cbe61a8cc144b1e67a6d23a8faad23a5aa39/content/tau-ceti/RepresentationTheory/InductionRestriction/README.md#L436).
The latter still has the contradictory factor-set classification sentence.
The accepted packet already supplies the correction, which the red team
correctly distinguishes from a new defect in the map.

I recomputed its elementary diagnostic with exact integer matrices: the two
C2 representations on a two-dimensional space send the generator to I or
diag(1,-1). All four group products agree in each representation, so both
factor sets are constantly one. Their projective kernels have sizes two and
one, since the second matrix is not scalar. Projective conjugacy preserves the
kernel, so equal factor sets do not classify projective representations. This
checks the existing counterexample, not a new finding or an authorization to
edit the child.

## Validation and limits

Executed the actual `check_links.check` against the accepted packet and the
base-commit raw-plus-supplemental world: zero links, zero overlaps, nine examined,
zero errors and zero warnings. The supplied red-team result passes
`check_redteam.check`. Ownership, all child counts, nine blobs, eight quotations,
four alias edges and the matrix diagnostic passed explicit assertions.

The prescribed `check_redteam.py` review check is run with the exact target
result as its scratch sibling, followed by the submission file checks. Only
the review JSON and this report are published; the target and accepted map are
unchanged.

This is verification of an empty finding set with independent checks of its
central scope argument, not a repeat of the entire red-team survey. I did not
rerun production assembly or re-audit every consumer's source proof; the
red-team report's corresponding observations remain its bounded evidence, not
new certifications by this verifier. No external monograph audit or fresh
library presence/absence claim is made. Mathlib 082e2d3 and Tau Ceti f790474
remain the specified baseline; no Lean deliverable was required or compiled.
