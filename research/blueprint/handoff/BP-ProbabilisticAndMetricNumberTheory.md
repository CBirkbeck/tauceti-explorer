# BP-ProbabilisticAndMetricNumberTheory — handoff

Issue #1041. Codex, session codex-a71f92, 2026-09-27.
Checkpoint: partial; all 27 nodes remain unchecked.
Claim 5851947968 won, confirmed by bot comment 5851948686; whole issue reread after confirmation.
Inspected base: a2bc2ea058abf817d665285781b66428a0bffd41.

## Result and preservation

Added five PM.0 declarations: centered-product-expansion, centered-product-error,
centered-product-uniform-error, complete-period-centered-product and
weighted-moment-comparison. They give exact subset/floor expansions of centered
prime products, an explicit coefficient-dependent remainder, a uniform
(3/2)^|P|/N bound, exact mixed moments on complete periods, and weighted k-th
moment error at most (3/2)^k L^k/N, where L is the sum of absolute weights.

All 22 inherited node objects from the merged #3152 checkpoint are unchanged,
including statements, prerequisites, sources, construction API and tests.
No new carrier or construction was introduced. Generic Bernoulli integration,
independent-product integration, power-of-sum and product-by-fiber identities
are pinned suppliers, not new targets. The inherited second-moment error
2 L^2/N remains sharper than the general k=2 bound.

Inventory: 27 nodes (1 construction, 20 lemmas, 1 comparison, 5 theorems),
7 construction API items, 5 construction tests, 20 additional theorem examples,
5 planets, 33 baseline declarations, 9 sources, 6 gaps and 0 requests.
The 25 example contracts include zero exponents, empty products, repeated prime
coordinates, incomplete periods, a nonzero odd moment and signed weights.
No whole stage is closed.

## Inputs, ownership and source reading

The ordered queue had no eligible higher-kind job. Read WORKERS, blueprint
PROTOCOL, expansion PROTOCOL and UPSTREAM_GUIDE completely in this session;
their hashes were unchanged on this snapshot. No applicable AGENTS file was found.

The four inherited deliverables were byte-identical to this session's fully read
#3152 copies. Reread the six integrated PM library-audit rows and accepted
AUDIT-07 review before planning. Compared the campaign and atlas extract,
accepted RS-07 result/report/review, upstream style documents, audit and matching
link files against the earlier reading. Inputs were unchanged except the GN
supplier packet, which exactly matched this session's fully read/written merged
#3156 result. No GN result is required by these finite declarations.
The integrated PM decomposition and AN.8 packet remain absent; no invented
supplier reference was inserted.

RS-07 keeps the arithmetic probability comparisons in PM.0; generic arithmetic
functions and probability foundations are imported. The exact new finite
centered-moment lemmas were not found in the pinned Mathlib/Tau Ceti screen.
Read each added baseline statement and its hypotheses at the pin. In particular,
an ordered tuple is grouped by prime fibers before independence is used;
repeated positions are not declared independent.

Read the complete Granville–Soundararajan author copy of Sieving and the
Erdos–Kac theorem: internal pages 1–13, proofs of Theorem 1 and Propositions 2–4,
applications discussion, bibliography and index. Selected finite auxiliary
arguments are decomposed; this is not a full extraction of all the source's
results or of its general sieve framework. The exact constants in the five
new declarations are explicitly derived here, not attributed to numbered
source assertions.

The source ledger records the author-copy hash and date. Corresponding finding
passages in arXiv math/0606039v1 were spot-checked. The publisher's preview
(published pages 15–16) was acquired and read, with page 15 visually checked.
The full published chapter endpoint returned subscription HTML. It was not
treated as a PDF or as a complete version-of-record reading.

Three source findings await independent review: E1 restricts k>=0 to k>=1
in the introductory inequality with (k-1)! (checked at published page 15);
E2 corrects the ordered composition count, while retaining the valid upper
bound used in the proof; E3 replaces sigma by sigma squared in the polynomial
example. E2 and E3 are scoped only to the author copy and checked preprint
passages. Exact versions and access limitation are recorded. Searched publisher
pages, arXiv version history and the author's publication lists for corrections;
none was found. No source-wide correctness verdict or author contact is claimed.

## Verification

The complete suggested file compiles under Lean 4.34.0-rc2 against Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369: 27 declaration signatures and 25 examples,
52 expected proof-placeholder warnings, no other warnings or errors.
The inherited file was compiled before editing (37 expected warnings).
The driver byte-compared 8,482 transitive Mathlib source files with the pin
and built the imported Tau Ceti empirical-measure module from pinned source.

A separate scratch probe proves seven general lemmas and seven examples with
zero placeholders or warnings. It covers the Boolean-power identity, the
3/2 coefficient bound, model-factor algebra, subset expansion, tuple grouping
by fibers, the existing Bernoulli integral specialization and empirical
averaging. Its examples verify the nonzero third moment at prime 3, the
incomplete/complete mixed pair, the constant square at prime 2, zero sharp
remainder, exponent-one cancellation and a source composition-count boundary.
These probes are not a full formal implementation of the packet.

Exact-rational checks added 22,500 mixed-product cases, including 508
complete-period cases, for subsets of {2,3,5,7}, exponents 0 through 3 and
N=1,...,36. They independently compare direct arithmetic averages with the
subset expansion, model product and both error bounds.
For subsets of {2,3,5}, weights in {-2,0,1,3}, k=0,...,4 and N=1,...,18,
625 tuple models were compared with independently enumerated Boolean atom
models, and 11,250 arithmetic weighted moments were checked, including 850
complete-period cases. Also checked 64 composition counts against recursive
enumeration and the source's still-valid upper bound.

Reran inherited exact checks: 1,000 divisor, 25,000 joint-divisor, 1,000 prime-pair,
2,680 weighted-second-moment cases (181 complete-period), 9,720 pattern cases
(690 complete-period), and 1,920 summed-atom checks.

The official full-index blueprint checker reports 0 errors and 0 warnings.
The source findings and versions pass the errata checker in a scratch-only
errata-v1 envelope; that checker expects an errata document, not a blueprint
packet directly. All four deliverables pass the intake checks (0 problems).
The fresh-main guard passed at 63091de06f3ecc0458e3a3d3f8c6b35f7ec8d9a8:
all 59 guarded paths were unchanged, the two known absences stayed absent,
and no new matching link file appeared. Exactly the four authorized tracked
files differ from the inspected snapshot; all 22 inherited node objects match.
Only the four authorized files are published; no downloaded source, extracted
text, regression code, proof probe, build output or private path is included.

## Exact continuation

PM.0 still needs general additive/strongly additive interfaces, prime-power and
Omega representations, the arithmetic CDF/characteristic-function/weak-convergence
dictionary, the all-residue-class joint model and stronger growing-prime
comparison with its source-specific range. The finite Boolean and mixed-moment
formulas are already present and should not be re-planned.

PM.1 is now partial rather than not_read because the full GS proof was read.
Its remaining decomposition must isolate the Gaussian pairing and collision
estimates, smaller-support contribution with the corrected composition count,
parity bounds and uniform moment range. Add Mertens normalization, large-prime
removal and a valid moment-convergence-to-Gaussian route. The arithmetic
indicators are not iid. Route the general sieve-multiset h(d), r_d and D_k(P)
interfaces before introducing them; their appearance in the source is not
permission to duplicate other owners' sieve infrastructure. Acquire the full
Turan–Kubilius and Hardy–Ramanujan proof sources and the exact Kubilius edition.

PM.2–PM.5 coverage is unchanged: Weyl/discrepancy with precise ES.0 input;
metric approximation with measure/monotonicity/coprimality hypotheses and
existing Borel–Cantelli/Gallagher suppliers; pointwise ergodic and integrability
inputs for Gauss dynamics; short-interval/correlation ownership and the
conjectural status of general Chowla/Sarnak. Recheck live inputs on resumption.
