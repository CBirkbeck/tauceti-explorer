# Fixed repeated-factor moments — BP-ProbabilisticAndMetricNumberTheory

Codex — codex-a71f92, 2026-09-27. Refs #1041. Claim 5855394116 confirmed
by bot 5855395033 at 11:24:15 UTC. Whole issue read before and after confirmation.
Snapshot 9f6442f72eabddda0e8293ddf5e9561e30949ab7. Partial blueprint checkpoint,
not an independent review or stage closure.

## Delivered

Nine new PM.0 declaration plans preserve all 67 inherited nodes:

- Positive geometric expansion for one prime.
- Finite prime product for exp(log(3/2)·D).
- Exact-CRT finite Euler mean comparison.
- Uniform local geometric density bound.
- Uniform finite Euler product bound.
- Uniform exponential moment.
- All fixed natural moments.
- Inclusive exponential tail.
- Scaled moment bound.

Here D=(Omega:R)-(omega:R)>=0 and the sample is 1,...,M, M=m+1.
The main bounds are E[exp(log(3/2)·D)]<=exp(2),
E[|D|^k]<=exp(2)·k!/[log(3/2)]^k, and
P(D>=u)<=exp(2-log(3/2)·u). All constants are uniform in M; the moment
constant depends on k. Zero-th moments equal one. Tail thresholds may be any
real number. The scaled moment theorem requires positive scale.

The proof expands finite nonnegative geometric factors and uses exact joint
prime-power divisibility counts. It assumes neither independence of arithmetic
events nor a convergent infinite Euler product. It completes the fixed-moment
proof plan in Tao Exercise 46(ii), not the surrounding omega variance/Mertens
deduction, the full Hardy–Ramanujan theorem or Erdos–Kac.

Inventory: 76 unchecked nodes (one construction, 55 lemmas, one comparison,
nineteen theorems); seven construction API items; 39 packet tests (five
construction, 34 lemma/theorem); 111 suggested examples; eight unchanged
planets; 116 baseline entries; seventeen sources; four findings; five source
versions; six gaps; zero requests. Every stage remains incomplete, and PM.2–PM.5
retain not_read coverage. No new definition or carrier.

## Readings and preservation

All six integrated reviewed audit rows freshly read before planning. Binding
documents match the complete readings in this continuous session. No AGENTS.md.
All 60 prior consulted paths compared; own four deliverables and all 29 matching
link files unchanged. The changed GN3 supplier is the exact authored blob
291950f3560cff92d6798027ef4b81330a9a3716; ES supplier
dd0138dfaf8f5c92f31f7de708c9c3fd0ff993fe was fully considered during the SV5
input guard. Neither supplies a new dependency for this slice. Prior full
campaign/atlas, RS-07, audit/review, supplier and upstream-style readings apply.

Tao 2014 Section 4 Exercise 46(i)-(ii), the surrounding variance argument,
Theorem 47 and Exercise 51 freshly reread from the same acquired primary HTML.
SHA-256 c55a6de8d4c7d9292ea3bc739bd6339f4555a2bd53ec7f5e4f0a62b684a3dba3.
The source gives an exercise, not this positive-geometric proof or its explicit
constants. No new correction search, version collation or source finding.
All four findings and five source-version objects remain exact.

Ten additional pinned native statements and contexts read: finite geometric
identity, coprimality of distinct prime powers, zero residue iff divisibility,
finite exponential sums, natural exponential multiples, exp/log compatibility,
finite-product majorant, order, factorial domination and exponential quotient.
Existing finite CRT, empirical measure, Markov, geometric bound and telescope
suppliers are reused. Searches of both pins and packet statements found no
existing arithmetic exponential or all-fixed-excess-moment result. General
mean-value theorems and arithmetic-function carriers are not replanned.

All 67 inherited nodes, 106 baseline entries, construction API/tests, findings
and versions remain exact. Only one Tao read-scope entry and one new pinned-code
source record are added; other fifteen sources unchanged. PM.1–PM.5 coverage/gaps
and all eight planets are unchanged.

## Validation

- Pinned-index packet checker: zero errors and warnings.
- Suggested Lean 4.34.0-rc2: 76 signatures, 111 examples, exactly 187 expected
  planning-placeholder warnings and no others. All 8,482 reached Mathlib source
  files byte-match the pin; two Tau Ceti modules built from pinned source.
- Separate scratch Lean: six general proofs (geometric identity, reindexed local
  density bound, reciprocal telescope, factorial moment domination, joint
  prime-power divisibility and tail division), plus six concrete arithmetic
  examples, no placeholders, axioms or diagnostics. Not implementations of all
  nine packet declarations.
- Exact fractions: 800 exponential means; 8,800 fixed moments; 44,000 scaled
  moments; 9,600 inclusive tails; 66 finite Euler mean chains; 615 local density
  checks; 15,410 pointwise local expansions; 600 exponential products; 4,096
  prime-power joint counts; 399 reciprocal telescopes; two rationally certified
  transcendental envelopes; eight rejected mutations.
- Samples 1–800, moment orders 0–10, five positive rational scales; finite Euler
  chains at 1–64,96,128; local cutoffs 0–40 and primes up to 47; pointwise
  identities for n=1–200 and N=n,n+1,n+7; exponent tuples in {0,1,2,3}^4 for
  primes 2,3,5,7. Alternating log-series and exp-series geometric tails provide
  exact rational certificates, not floating point. Finite regressions are not
  proofs of universal or asymptotic statements.
- Earlier regression counts are historical, not rerun.
- Source-envelope, preservation/DAG, synchronized declarations/tests, four-file
  intake and fresh consulted-input/link guards run before publication. Only the
  four authorized deliverables change.

## Resume

PM.0 still needs general additive/strongly additive predicates and prime-power
representation; source-scoped growing-prime comparison beyond the finite bounds;
the exact Kubilius source edition and locators; and the converse weak-convergence
criterion stated through counts at CDF continuity points. Do not duplicate the
native probability or arithmetic-function carriers.

The repeated-factor fixed moments are now supplied. The existing omega/Omega
weak-limit equivalence remains conditional; its missing Gaussian-convergence
premise is not discharged by an exponential bound on their difference.

PM.1 still needs the actual Mertens normalization, source-specific cutoff and
lower-even-moment estimates, uniform growing-order control and valid moment
continuity. The surrounding omega variance estimate and full Hardy–Ramanujan
deduction remain open. PM.2–PM.5 gaps and supplier ownership are unchanged.

Opening the PR ends the claim. Continue the ordered queue; never unclaim
submitted work or manually merge, close or label.
