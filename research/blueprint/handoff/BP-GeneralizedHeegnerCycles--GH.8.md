# BP-GeneralizedHeegnerCycles--GH.8 — continuation checkpoint

Issue: #740. Agent/model: ChatGPT Pro / GPT-6 Astra Pro.
Session: `cgpt-20260926-serre-a7d4`.
Branch: `cgpt-20260926-serre-a7d4-gh8`.
Date: 26 September 2026.
Claim comment: 5849041047. Bot confirmation: 5849042082.

## State and preservation

This is a **partial checkpoint**, continuing the files merged from #2953. It is
not a closed GH.8 blueprint and not a Lean formalization. Only the four issue
paths are changed; the canonical roadmap/decomposition and other stage parts
are untouched.

The seven original IDs remain: `weight-zero-cycle`, `modular-quotient-kummer`,
`character-sum-comparison`, `positive-conductor-stabilization`,
`positive-tail-corestriction`, `differential-evaluation`, and
`ordinary-p-old-family`. Their geometric, coefficient, period and family
boundaries are retained. The source issue `GeneralizedHeegnerCycles/E-GH8-1`
is preserved and still needs independent review. No second source error is
asserted from the initial unit-factor discrepancy.

Counts now: **12 nodes** (5 lemmas, 3 theorems, 2 comparisons, 2 applications),
**41 acceptance conditions, 3 planets, 5 baseline references, 10 supplier
requests, 5 explicit gaps, 1 retained source issue**. There are no new object
definitions, hence **0 definition API items and 0 construction unit tests**.
The suggested file separately contains **5 named algebraic signatures and 13
examples**, including the five earlier linear tests. All implementation statuses
remain unchecked; the scope is exactly `GeneralizedHeegnerCycles:GH.8`.

## New mathematical content

The initial-conductor lemma derives the normalized bottom from the *raw* first
trace and degree. Its hypotheses explicitly include u cor(k_1)=a_p k_0 minus the
two Frobenius terms, u d=p-1, the corestriction/restriction degree formula and the
inverse-Frobenius action on k_0. Expanding with the Hecke polynomial gives
u^{-1}(1-alpha^{-1}sigma)(1-alpha^{-1}tau)k_0. This narrows the remaining work to
actual HE.0/HE.2 arithmetic and its transport; it does not postulate a normalized
Euler-system relation as its hypothesis.

A separate negative test shows that changing only a nonzero bottom term by a
factor other than one breaks the norm relation. A uniform rescaling of the
entire system is different and is allowed. The nonzero condition is not an
arithmetic nonvanishing theorem.

The two integral-tower lemmas use forward/backward maps whose composites are
one **fixed** scalar d. Applying the reverse map bounds the kernel, and applying
it componentwise to a compatible target sequence explicitly lifts d times that
sequence. The latter is a constructive compatibility argument, not an appeal
to right-exactness of inverse limits. An integral isomorphism is not asserted
when d is a nonunit.

The regression counterexample is M_n=Z with transition 2, N_n=Z with transition
1, and f_n=2^n. All rational level maps are isomorphisms, but the rationalized
integral limit map is 0 -> Q. The proof uses divisibility by every power of two.
The rational sequence 2^{-n} explains precisely why changing the order of
coefficient extension and inverse limit is invalid without a uniform bound.

The supplier contracts now require choosing the actual coefficient factor on
which the modular quotient is a rational isomorphism. They do **not** assert a
two-sided inverse up to scalar on the entire Jacobian cohomology. Both composite
identities, their common denominator and all corestriction compatibilities
remain concrete geometric/lattice obligations.

## Checks performed in this continuation

Local Python structural checks passed: JSON syntax, exact one-stage scope and
coverage, all original IDs retained, unique IDs, displayed-node DAG, prerequisite
resolution against the displayed node/baseline and explicitly known supplier
stages, required source fields, planet constraints, all five new library names
present in the suggested file, and absence of private paths or Lean proof text
in the packet/document. These are not the repository-wide validator or its
pinned declaration index.

SymPy verified the symbolic initial-factor identity after substituting the raw
root/degree relations. Exact arithmetic also checked **144 two-dimensional
initial-factor models**, including non-scalar inverse Frobenius matrices, and
**2,500 integer matrix/vector cases** for the fixed-denominator scalar identities
using matrices and their adjugates. **40 finite truncation/rational-section
checks** illustrate the counterexample. Finite tests do not prove its infinite
claim; the uniform divisibility proof is written in the blueprint.

**Lean was not compiled.** No Lean/Lake executable or local pinned repository
checkout was available. The file uses the protocol's signature/example form;
none of the seven geometric targets is replaced by an opaque placeholder.
Repository-wide `check_blueprint.py` and pinned-index validation must run in this
pull request's CI. This handoff does not pre-claim their result.

## Evidence and limits

The current WORKERS/PROTOCOL rules and the existing checkpoint/handoff were read.
The roadmap atlas, the integrated decomposition's scope/source header (which
still marks GH.8 not_read), the accepted scoped AUDIT-24 GH.8 verdict and review,
and the relevant HE.0--HE.3/HE.8 ownership descriptions were inspected. The
aggregate library-coverage file exceeded the connector's size limit; a complete
aggregate-audit/link reconciliation is not claimed. AUDIT-24 records the actual
arithmetic comparisons as absent, not already implemented by nearby cohomology.

CH's published Definition 5.2 on printed p. 601 was independently re-read in its
page image. The relevant revised CH section and its Definition 5.2 image were
also inspected, and the parsed Castella Section 6.2 was read. An additional
Castella p. 28 screenshot request failed. The earlier checkpoint's BDP/erratum
reads and source issue are preserved as earlier work, not relabelled as fresh
full source reads or an independent rediscovery.

The actual pinned `LinearMap` definition was re-read and
`Int.natAbs_le_of_dvd_ne_zero` was newly read, including its statement and proof.
The three dual-space references retain the earlier checkpoint's pinned reads.
No current-branch search result is asserted to be a checked pinned declaration.

## Exact continuation

1. Prove the finite Picard--Kummer/Gysin sign and transition comparison, then the
   continuous realization. Keep the degree-zero cusp correction and the actual
   level fields. The multiplicative Kummer map with mu_m does not provide the
   elliptic Tate-module result.
2. Compute HE.0's unit-index/first-degree formula and HE.2's raw first trace,
   with the level descent, Frobenius convention and basepoint corrections. Apply
   `initial-corestriction-comparison` to each source's actual classes. Only then
   resolve the full-order versus half-order discrepancy. Do not infer arithmetic
   nonvanishing from the rescaling test or silently replace a printed constant.
3. Select the correct f-coefficient factor and construct forward/backward
   integral comparison maps. Bound their denominators by one scalar independent
   of the ring-class level, prove both composite identities, and verify
   corestriction naturality. Instantiate the two coherent comparison lemmas in
   GH.3's existing Iwasawa realization; do not duplicate that carrier.
4. Repair or bypass the general CM-character carrier from E-GH8-1, preserving
   the degree-zero exception. Finish the regulator/twist/version comparison and
   the separate local and global injectivity arguments for the p-old family
   statement; do not extend it to p-new or nonordinary specializations.
5. Finish the source-qualified consumer maps to AutomorphicCongruences L2 and
   BSD.6a without duplicating the downstream L6 formulation work. Reconcile all
   applicable reviewed links and elaborate the suggested file at the pins.
   Keep coverage partial until these mathematical and integration gaps close.
