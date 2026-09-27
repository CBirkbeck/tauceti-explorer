# BP-ProbabilisticAndMetricNumberTheory — handoff

Issue #1041. Codex, session codex-a71f92, 2026-09-27.
Partial checkpoint; all 42 nodes remain unchecked.
Claim 5853898274 won, confirmed by bot 5853899231; whole issue read before and after.
Inspected base: 0cb49d45ec58cc4a36a5b8e571659faf1e9c6eb4.

## Result and preservation

Added six PM.1 declarations: omega-cutoff-identity, large-prime-log-bound,
centered-cutoff-error, cutoff-power-error, absolute-odd-moment and
cutoff-moment-transfer. They expose the finite cutoff-removal part of the
Granville–Soundararajan deduction of Theorem 1. The inclusive real cutoff uses
the existing primesLE and natural floor. No new definition or carrier is introduced.

For N=m+1 and z>1, the explicit error is
D=log(N)/log(z)+|A_z-b|. Its two summands are distinct-prime removal and the
change of center. The transfer theorem bounds the omega moment error by a
finite binomial sum whose lower absolute moments are bounded by adjacent even
moments. It does not infer a bound on an absolute moment from cancellation
of a signed odd moment.

All 36 inherited node objects are preserved exactly, with their statements,
prerequisites, sources, API and tests. All 49 inherited baseline entries and
all three source findings/source-version records are preserved.
Only GS-SIEVING gains a read-scope entry; the other 10 inherited sources match.
PM.0 and PM.2–PM.5 coverage stays unchanged. PM.1 remains partial.

Inventory: 42 nodes (1 construction, 32 lemmas, 1 comparison, 8 theorems),
7 construction API entries, 5 construction tests, 38 other examples,
7 planets (5 PM.0, 2 PM.1), 61 baseline declarations, 12 sources,
6 gaps and 0 requests. No full stage is closed.

## Inputs, sources and ownership

Reread WORKERS, blueprint PROTOCOL, expansion PROTOCOL and UPSTREAM_GUIDE
completely. No applicable AGENTS.md. The ordered available queue had no
eligible higher-priority job when this claim was taken.
The preceding q-series PR #3206 merged with both checks successful.

Read the six integrated PM audit rows completely, then the inherited reader,
suggested file, handoff, source/coverage/gap metadata and focal omega/moment
nodes. The other inherited nodes are preserved rather than independently
recertified. Earlier complete campaign, atlas, accepted RS-07 and audit/review,
upstream ownership/style and matching-link readings remain applicable:
the 55-input comparison found 52 byte-identical files, 2 unchanged absences
and one changed ES supplier. That supplier exactly matches our own newly
merged PR #3203 deliverable; it supplies no new dependency to this slice.
The missing PM integrated decomposition and AN.8 packet are not invented inputs.

Read every new baseline declaration's statement at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174. Prime sets and floor membership,
prime-factor membership/product divisibility, finite logarithm rules, binomial
expansion and finite Cauchy–Schwarz already exist and are imported.
Library, declaration-index and packet searches did not locate these arithmetic
cutoff contracts already planned or implemented. Tau Ceti's similarly named
number-field prime-power logarithmic count was read: it counts exponents
over one fixed ideal prime, not distinct rational prime divisors of an integer.
The AN.5 divisor-bound nodes likewise concern multiplicities and divisor
growth, not this omega truncation. No general sieve-multiset framework is added.

The unchanged Granville–Soundararajan author-copy hash is
c5c6ce0e61d91cd6da0b4be6b137e4b2fdd3e2c4f11b5c90d8b52b6846532be2.
Its full text was read in the earlier continuation. This continuation reread
internal pp.3–6, especially the entire deduction on p.4, and inspected the
p.4 image. The six nodes are explicit finite refinements of that proof, not
claims that the source states these constants or this general center b.
No new source finding is asserted. E1 remains checked in the published preview;
E2/E3 remain scoped to the checked author/preprint passages because the full
published chapter was not accessible. Existing correction-search records and
version distinctions remain unchanged.

## Verification

The complete suggested file elaborates against Lean 4.34.0-rc2, Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369:
42 declarations and 43 example contracts, 85 expected placeholder warnings,
no other warnings or errors. The inherited file first compiled with 69
expected warnings. The driver byte-checked 8,482 transitive Mathlib source
files and built the two imported Tau Ceti modules from pinned source.

A separate scratch probe proves three general results (logarithmic tail,
binomial power error and normalized finite Cauchy–Schwarz), one concrete
prime-factor identity, and eight examples, without placeholders or diagnostics.
These do not implement the whole packet or the complete empirical integral
transfer theorem.

New regression results:
- 5,500 exact cutoff decompositions and 4,500 exact product bounds, for n=1–500
  and cutoffs including 0, 1, 3/2, prime boundaries and cutoffs above n.
- 444,690 exact rational pointwise binomial checks and 14,580 exact rational
  averaged transfers. Their rational tail budget is the actual maximum
  discarded count plus the exact center discrepancy.
- 9,600 exact squared Cauchy–Schwarz checks, including empty prime sets,
  signed weights and nonzero centers.
- 14,580 separate 60-digit Decimal checks of the actual logarithmic D and
  square-root even envelope, at N=1–60, orders 0–8 and three centers.
  These last analytic checks use tolerance 1e-48 and are not exact proofs.
The negative-bound example caused by dropping an absolute value is checked.

Prior Gaussian and centered-moment regression counts remain in the reader
and previous checkpoint record. They were not rerun by this new cutoff suite.

The official full-index packet checker reports 0 errors and 0 warnings.
The four-file intake check reports 0 problems. The unchanged source findings
and version records pass the errata-v1 checker in an in-memory envelope.
The dependency graph is acyclic, and all 36 inherited node objects match.

The live-main guard passed at a6f03b8681c9524e550f8fdfb83974f35fb58923:
59 consulted paths, including the same two absent inputs. One concurrent
supplier change was explicitly inspected: GeometryOfNumbersAndQuadraticArithmetic
blob 0f9a9414eb331e7fe6a43b58d178fdfefd01f84d adds 22 GN.1 successive-minima,
lower Minkowski and linear-forms nodes, changing no inherited node. Its new
statements and updated coverage/gaps were read for ownership and dependency
impact; this was not a full independent review. None duplicates or supplies
this PM.1 slice, and the PM.4/GN.4 boundary is unchanged. The guard accepts
only that exact inspected blob; all other present consulted inputs match.
There is no new matching link or AGENTS.md. Exactly the four authorized
tracked files differ from the snapshot. Only those deliverables are published;
no scratch probes, scripts, source PDFs or private paths.

## Exact continuation

Reuse this six-node finite cutoff interface rather than planning it again.
To finish the source's deduction, establish Mertens normalization and the
precise bounds for D and lower even moments in the chosen cutoff/order regime.
The finite bound alone does not establish the source's uniform growing-order
Theorem 1 or Propositions 2–4. A valid convergence-of-moments theorem or another
proper weak-convergence route remains essential: Gaussian moment determinacy
alone supplies uniqueness, not convergence.

PM.0 still needs general additive/strongly additive and Omega interfaces,
full prime-power representation, arithmetic CDF/characteristic-function/weak
convergence dictionaries, all-residue joint models and stronger growing-prime
comparisons. Keep using existing empirical and probability carriers.

PM.1 additionally needs complete Turan–Kubilius and Hardy–Ramanujan proof
sources, and ownership routing before any general sieve-multiset extension.
PM.2–PM.5 remain as previously recorded: Weyl/discrepancy; metric approximation
with exact measure/coprimality/monotonicity hypotheses; Gauss dynamics with
genuine pointwise ergodic input and integrability; and short-interval/correlation
ownership and conjectural-status discipline. Recheck live inputs before continuing.
