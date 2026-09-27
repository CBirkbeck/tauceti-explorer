# BP-PadicMeasuresIwasawaAlgebras: inverse from finite unit coordinates

Codex — codex-7e92bd. Issue #555; fresh claim 5858975945 was confirmed by exact
bot comment 5858977458. The whole issue was read before and after confirmation.
Partial checkpoint; every node remains unchecked.

## Delivered

294 unchecked nodes: 2 definitions, 40 constructions, 190 lemmas, 37 theorems and 25 comparisons; 208 API items, 201 packet tests (148 on definitions/constructions), 212 typed examples, 17 planets and 297 baseline citations. Eight gaps, no outgoing requests, fourteen inherited source findings and zero closed stages remain.

Twelve L1 nodes supply finite pairing refinement and independence, the native
locally constant linear functional and its uniform bound, its extension to an
actual native measure, coordinate recovery, reconstruction and unique existence.
All 282 prior whole nodes, 289 baseline records, fourteen findings and seventeen
planets are preserved. Two native imports and the new declarations surround
the unchanged prior suggested-file bytes. Only L1 and its L2 cross-reference
are narrowed in the outstanding work.

## Recovering a measure from its finite unit coordinates

Let p be any prime, U=ℤ_pˣ and A_n=(ℤ/p^nℤ)ˣ, including n=0. The actual
reduction red_n:U→A_n is the preceding native unit map. Take integral finite
coefficient functions c_n:A_n→₀ℤ_p, compatible under pushforward along the
native transition t_(m,n):A_n→A_m. Pushforward sums coefficients in each fiber.

A locally constant test f factors through some red_n. Pair its finite test g
with c_n by Σ_a g(a)c_n(a). Refinement preserves this pairing. Two presentations
agree after passing to their maximum level, because the corresponding unit
reduction is surjective. The value is therefore independent of the presentation
and defines a ℤ_p-linear functional I_c on the native LocallyConstant carrier.

Every integral coefficient has norm at most one. Surjectivity bounds each
finite test value by the supremum norm of f, and the ultrametric inequality
bounds the whole pairing by that same norm. The bound does not grow with the
number of fibers. This supplies the continuity missing from a purely algebraic
inverse-limit argument.

Use the native linear inclusion of locally constant into continuous maps.
Its range is a native submodule of C(U,ℤ_p), with the inherited norm; it is dense
by the preceding finite-test density theorem. Descend I_c to that range and
use LinearMap.mkContinuous with constant one. The native subtype inclusion is
uniformly inducing, and ContinuousLinearMap.extend extends the functional to
C(U,ℤ_p), since ℤ_p is complete. Both native APIs apply over rings or semirings;
this argument does not require ℤ_p to be a field. No separate public topology
or function-space carrier is introduced.

The resulting actual native measure μ_c agrees with I_c on locally constant
tests and satisfies ‖μ_c(f)‖≤‖f‖ on all continuous tests. Characteristic tests
recover each coefficient c_n(a). Conversely, reconstructing a measure from its
own coordinates gives the original measure by the preceding separation theorem.
There is thus a unique integral unit measure with any prescribed compatible
family of integral finite coordinates.

At level zero A_0 is a singleton and c_0(1) is total mass. It is not an average.
For p=2, the measure δ_1−δ_(−1) has zero depth-one coordinate but a nonzero
depth-two coordinate. Uniqueness requires all levels. Group depth remains
independent of coefficient precision throughout.

The input is an explicit family with its transition proof. It is not a newly
defined completed group algebra. The next comparison must use the existing
ProfiniteProPGroups Layer 9 carrier, actual quotient equivalences and cofinality,
and must prove the algebra and joint coefficient/group topological comparison.
The coordinate recovery here does not itself identify those topologies.

## Source and ownership checks

The published RJW printed 119–123 / PDF 20–24 was freshly read in full, including
Remark 3.11 and the entire proof and inverse construction of Proposition 3.16.
The retained source PDF has SHA256
78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6.
The explicit bound and ring-general native extension are worker decompositions
of that argument. No new source issue, independent review or all-paper reading
is claimed.

The current handoff, reviewed AUDIT-26 L1 row, relevant predecessor nodes and
signatures, accepted RS-16 boundary and complete Layer 9 completed-algebra
subsection were read. The whole predecessor, all eight reviewed audit rows,
two upstream model documents, roadmap descriptions and relevant links retain
their earlier continuous-session reading provenance. The four predecessor
outputs exactly match our merged PR #3276.

Fifty of the preceding fifty-one guarded input files are unchanged. Dirichlet
has grown from 210 to 217 nodes since the preceding publication: all seven
new whole character-twist nodes and four changed predecessor nodes were read.
Its coefficient-field request now imports the exact supplied PMIA moment node;
the L1 completed-algebra request remains. There is no new reverse dependency.
The source registry and other supplier/ownership inputs are unchanged.

Eight baseline records are added after reading their full statements and
ambient hypotheses. The complete native continuous-linear extension file was
read, together with the inclusion, injectivity, subtype, uniform-embedding,
p-adic completeness and ultrametric APIs. Reused finite pushforward,
supremum norm, norm-one, mkContinuous and closed-locus statements were read.
The declaration index was used only for names and locations. The field-only
normed extension theorem is not used for ℤ_p.

A bounded open-PR title search for “completed group” returned no result. The
broader query was noisy and is not evidence of absence; the archive query
returned a discussion of reductive-group Iwasawa decomposition, not a supplier
for this inverse. Pinned source searches found no exact unit-coordinate
reconstruction adapter. No upstream code is copied or native carrier rebuilt.

## Validation

The complete suggested file elaborates at the pinned baseline with zero errors
and 626 warnings, all and only the expected placeholders. Its source closure
checks 2815 Mathlib modules and two previously built pinned TauCeti modules.
No native library was built and no planned supplier module was imported. No
full proof of the twelve new declarations is claimed. Suggested SHA256:
0c8521eae5c2c77b9f83206b05c13d9a4ebf32934b0353439aebc46e16503311.

The indexed blueprint checker reports zero errors and warnings, and four-file
intake reports zero problems. The filename-correct errata wrapper and whitespace
checks pass. Whole-object preservation, reader/signature/test parity and the
four-file mutation check pass. The reachable dependency graph has 295 nodes,
1194 acyclic edges and 298 baseline leaves, with no unresolved stage leaves.
This does not close the eight explicit source/interface gaps.

Exact integer arithmetic checks 80 families at p=2,3,5,7 through group depth 3:
800 refinement identities, 800 pairing comparisons, 320 uniform valuation
bounds, 10060 coefficient recoveries, 320 mass comparisons and 3200 finite
coefficient/group transition checks. Sixteen colliding-atom tests and the
dyadic depth-one/depth-two counterexample pass. These finite computations
check conventions and examples, not dense extension or limit topology.

One persistent checkout and existing pinned artifacts were used, with one own
Lean process at a time. No own compiler, watcher or language server remains.
Retained scratch evidence: inputs.json, WORKLIST.md, claim.json, claim-bot.json,
issue-before.json, issue-claimed.json, issue-publication.json,
comments-after.json, dirichlet-delta.json, upstream-completed.json,
baseline-read.json, new-nodes.json, append.lean, compile.py,
lean-source-audit.json, suggested-compile.log, arithmetic.py,
arithmetic-results.json, verification.json, publication-guard.json,
submission.json, intake-pr.json and the four final files in handoff-evidence.
The existing source PDF and native artifacts retain their preceding handoff
provenance. No new source copy, repository snapshot or library build is kept.

At publication main 9b5a58905b564df16b77149a70e64b1d416ab4d6, all 51 captured input blobs
and all four predecessor output blobs are unchanged. The whole issue body
and the bot’s exact fresh claim confirmation were checked again. Exactly four
authorized files are submitted from the worker’s own job branch.


## Resume

The inverse from compatible integral coordinates for the actual unit system is decomposed: finite pairings are independent of level, the native locally constant functional has uniform bound one, native dense extension gives an actual ℤ_p-valued measure, and recovery, reconstruction and unique existence are supplied. Compare this explicit-family inverse with the existing ProfiniteProPGroups Layer 9 completed-group-algebra carrier using unit-kernel cofinality and the actual quotient equivalences. Establish the algebra and joint coefficient/group topological equivalence, including the dyadic case; use coefficient powers together with finite-group kernels, never pure T-adic kernels or an integral eigenspace splitting. General adic coefficients, finite-extension lattices and complete source coverage remain separate targets.

The other layer targets and their exact gaps remain in the packet. In particular,
L0a and L4–L6 remain not_read; the coefficient-lattice, character-space,
pseudomeasure and full source-coverage work remains. No stage is closed and no
outgoing request is added by this explicit-family inverse.
