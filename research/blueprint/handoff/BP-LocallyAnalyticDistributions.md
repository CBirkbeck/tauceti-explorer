# BP-LocallyAnalyticDistributions — adjugate coefficient bounds

Codex — codex-7e92bd. Refs #641. Claim5853317954 confirmed by bot5853318725;
the whole issue was read before claiming and again after confirmation.

**67 nodes**: 3 definitions,9 constructions,32 lemmas,16 theorems,7 comparisons.
**46 API entries**, **56 packet tests and typed examples**, **6 planets**,
**66 baseline declarations**, **8 gaps**, **5 requests**, **0 closed stages**.
Definitions/constructions account for42 API entries and38 tests. Every
implementation remains unchecked; no independent review is claimed.

## What changed

Thirteen L4 nodes supply the explicit analytic adjugate estimate: native
finite-coordinate projection, evaluation and contractivity; basis detection
of operator norm; finite adjugate recurrence and distinct-column estimate;
finite-coordinate comparison and finite-output bound; arbitrary-filter
recurrence continuity; the finite-subset limit; a uniform geometric tail;
actual retraction compression; and (Pr) entireness. Fifteen new named signatures
and seven typed examples extend the seed. The already present projection
helper and its norm signature now have precise packet ownership.

For finite output support J, the norm argument tests each input i on
L=J∪{i}. Restricting only to J is insufficient, as diag(a,0) shows. Bounds
use products of distinct output-column majorants, without factorial loss.
Intermediate recurrence signatures assume neither the desired bound nor
entireness. Their dependency chain precedes the resolvent/Hasse/Riesz nodes.
The (Pr) comparison uses actual maps i,r and the fixed factor‖r‖‖i‖;
finite approximation proves complete continuity of iur directly from the
existing range-FG epsilon predicate. No new compactness predicate is added.

All54 preceding statements and hypotheses,49 whole node objects,54 prior
baseline records,13 integrated reviewed IDs,19 links,6 planets,stage statuses
and5 requests are retained. The five metadata changes refine c0-lift,
orthonormalizable-modules, compact-matrix-criterion, resolvent-series and
resolvent-hasse-evaluation. Generic matrix, polynomial and native C0 APIs stay
in Mathlib. The existing AdicSpacesPartII:R3 supplier stub and generality
request remain; no theorem-assuming substitute is used.

## Evidence and checks

Read all five reviewed LAD audit rows, the current stage/edge descriptions,
all54 predecessor statements/hypotheses, reader and handoff. Instructions,
upstream examples, accepted RS-16 contracts, decomposition and touching links
match earlier fully read snapshots. PMIA's current packet is our merged
PR3190 output. Both pinned library trees were searched and all12 added
baseline statements read at the actual pin. The generated additive
ultrametric sum lemma cites its indexed multiplicative generator; the
baseline index is unmodified.

Fresh full source reads: Buzzard manuscript p.22 and Serre printed pp.78–79
(PDF11–12); p.79 was rendered and visually checked. Public PDF SHA256:
Buzzard `0c54243868e2da8849452c4cc5a3d4e7b118cf17dd04487d4af137ab167ef57d`;
Serre `67a032c129ad2a36adeeadc4b4ccb3c0ab17c5a1ef8de83f7dda85f2115fe402`.
Earlier source reads are retained as historical provenance. No new source
finding; sourceIssues remains empty.

The full suggested file compiles with Lean4.34.0-rc2: **0 errors,150 expected
proof-placeholder warnings only**. All **1,890 Mathlib sources** match the
pin/cache. No actual Tau Ceti or planned supplier module is imported.

Seven complete scratch lemmas and one polynomial-pencil helper compile with
**0 errors,0 warnings,0 placeholders**, reaching1,635 verified Mathlib modules.
They prove the two-dimensional adjugate, degree-zero/one/higher coefficients,
determinant, second recurrence and the general native retraction recurrence.
**56,192 exact arithmetic assertions** pass over2,190 systems, primes2,3,5 and
dimensions1,2,3, with coefficients Q_p[ε]/ε². They include11,235 recurrence,
11,235 column-bound and33,705 tail-bound checks. Nonisometric compression
shows that omitting‖r‖‖i‖ can fail. Other controls cover missing input support,
nilpotence, nonreduced coefficients and degree-zero empty products. These
finite checks are not proofs of infinite convergence, rank or this roadmap.

Unmodified-index blueprint: **zero errors and warnings**. Exact four-file
intake: **zero problems**. Errata wrapper, preservation, reader/signature/test
parity and scoped mutation checks pass. The230-edge dependency graph is
acyclic, with140 internal edges,63 distinct baseline leaves and exactly the
recorded AdicSpacesPartII:R3 stage request. The entire analytic estimate chain
is independent of its resolvent-series consumer.

Suggested-file SHA256: `69ae6ffedf1ddf481cb1b854c1f1a5b07e07e6731bd53449d0dd1611eb17edac`.
Complete scratch-proof SHA256: `801382a1b43e6767f3d2a8224486ff270fd23d35427e60968467e4bd149686a9`.

All 48 captured input blobs and the four predecessor outputs match
main `68a8ef428abed4c02305d7654bb080c0001a9e3b`; the issue body and winning claim are
unchanged. The source register retains7,545 records; the complete changed
record and register diff show only an unrelated QSeries/E207 citation reread
date. These snapshots were refreshed after reading, without claiming a new
independent source review. Exactly the four authorized files are published
through Git Data REST.

## Where to resume

The next source paragraph is Buzzard Proposition3.2's finite generation and
projectivity of the root summand: use the actual Riesz splitting, a geometric
inverse for u on that kernel and finite-image approximations for its identity.
Then supply finite-projective determinant/rank, constant-rank and exact-slope
arguments. Do not infer polynomial equality from residue-field images over a
nonreduced algebra. No stage is closed by the adjugate estimate.

Acquire and decompose BGR finite-module topology, inverse norm bounds and
completed tensors. Complete the (Pr) exercises and Coleman spectral-resultant
transport. Audit inherited prototype assumptions as missing signatures are
filled. L0–L3 sources and L4's actual distribution families, uniform character
actions and specialization remain open. Preserve PMIA suppliers, RS-16
boundaries, PadicFamilies consumers and the six planets.
