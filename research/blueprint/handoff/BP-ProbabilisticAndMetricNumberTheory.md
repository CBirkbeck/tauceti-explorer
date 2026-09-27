# Arithmetic law and weak-limit checkpoint — BP-ProbabilisticAndMetricNumberTheory

Codex, session `codex-a71f92`, issue #1041, 27 September 2026.
Claim 5854981888 won, confirmed by bot 5854982805 at 10:19:10 UTC.
Whole issue read before and after confirmation. Snapshot
69ab493e4778e308b46c0bad6cae24c1cacb047b; continue merged PR #3225.

## Contribution and boundary

Eight new PM.0 nodes supply arithmetic observation frequencies, inclusive CDF
counts, the correctly normalized characteristic-function sum, the arithmetic
Levy criterion, a Lipschitz comparison of the omega/Omega laws, a vanishing
scaled L1 mean, a changing-measure tail limit and conditional weak-limit
equivalence. All use native empirical measures and probability objects.

For N=m+1, D=Omega-omega, X=(omega-b)/s and Y=(Omega-b)/s, the finite comparison
is |E g(Y)-E g(X)|<=L*(1-1/N)/s for s>0 and any L-Lipschitz real g.
Global boundedness of g is unnecessary for this finite statement. If s_m tends
to positive infinity, the two observations have the same convergence-in-
distribution behavior toward any given Borel probability law, with arbitrary
common centers b_m. Initial zero or negative scales do not matter.

The native Slutsky helper assumes a fixed sampling measure. The proof instead
uses the native bounded-Lipschitz weak-convergence criterion on the changing
pushforward laws. No generic Slutsky or Levy theorem is replanned.
The Gaussian convergence premise for omega is NOT proved. Neither are the
higher repeated-factor moments or the CDF-continuity-point converse criterion.
The new limit statement is an equivalence, not a claim that a limit exists.

All 59 inherited node objects, 93 baseline records, three previous findings
and four source-version records remain unchanged. Only one read-scope sentence
is appended to the Tao 2014 source; the other thirteen source objects remain
identical. PM.1–PM.5 coverage and gaps and all eight planets are unchanged.

Inventory: 67 unchecked nodes (1 construction, 48 lemmas, 1 comparison,
17 theorems); 7 construction API entries; 21 packet test contracts (5 construction
tests and 16 new lemma/theorem regressions); 93 suggested examples; 8 planets;
106 baseline citations; 16 sources; 4 source findings; 6 gaps; no requests.
Every stage remains incomplete; the four unread stages retain not_read coverage.

## Sources and input discipline

Binding documents match the fully read copies in this session. WORKERS reread;
all six reviewed PM audit records reread before planning. No AGENTS.md.
The previous PM inputs, four deliverables, matching links, accepted RS-07,
audits/reviews and upstream style texts are byte-identical except our own
already checked ES3 supplier checkpoint. Previous full input readings apply.
The newly merged GN3 supplier is our own checked Henk product-count checkpoint;
it supplies no new dependency to this slice.

Tao 2014 Section 4 Exercises 46 and 51 and Theorem 47 freshly reread.
Tao 2010 Notes 2: Exercise 5; Section 2 from equation (5) through the full proof
of Theorem 13; Exercise 15 and hint inspected for the probability-target limit.
Only these passages are claimed read. Author HTML SHA-256:
ffa97487e6339d8cef52ad1c0609373738520c027b06ba24a89e8af2caad332d.

E4 records the omitted evaluation at t=0 in Exercise 11's derivative formula:
X=1 gives F(t)=exp(it), whose first derivative at pi is -i, not i.
Its Taylor coefficients at zero remain correct. A bounded title/exercise
correction search and current-page comment occurrence screen found no applicable
correction; no full comment-thread or print-version collation is claimed.
E1–E3 retain their previous version restrictions. E4 is unreviewed and scoped
only to the acquired author HTML, not asserted against a book edition.

Searched both pinned libraries and packet statements for these arithmetic laws.
The other packet search hit was a differential form named omega, not this
arithmetic topic. Read exact statements for all thirteen new baseline references.
Native empirical-measure source reread completely. The convergence definition
supports varying source measures; its fixed-measure helper's restriction was
explicitly checked. No new supplier request or ownership change is necessary.

## Validation

- Official blueprint checker with full pinned declaration index: zero errors,
  zero warnings.
- Suggested Lean: 67 declarations and 93 examples, 160 expected planning
  placeholder warnings only, no errors or other warnings. All 8,482 transitive
  Mathlib sources byte-checked against the pin/cache; two Tau Ceti modules built
  from pinned source.
- Separate scratch probe checks the general counting, CDF and characteristic
  formulas, arithmetic Levy equivalence, reciprocal squeeze and a changing-
  measure bounded-Lipschitz transfer bridge, plus six examples. All six general
  statements and six examples compile with no placeholders, axioms or diagnostics;
  no arithmetic Gaussian theorem or full implementation of all eight nodes is claimed.
- Exact tests: 4,800 event counts; 5,400 CDF endpoints; 10,200 characteristic
  values using exact fourth roots of unity; 17,280 Lipschitz comparisons;
  540 scaled mean envelopes; 2,160 tail envelopes; 173 fixed-scale obstructions;
  eight rejected mutations. Ranges and statistics are in the reader.
  Finite regressions do not establish asymptotic limits.
- Errata schema passes. Preservation/DAG, synchronized names and counts,
  source-scope, current-main input guard and four-deliverable intake checks
  are rerun before publication. Only the four issue deliverables are published.

## Exact continuation

Preserve all existing finite residue, moment and cutoff contracts.
PM.0 still needs general additive/strongly additive interfaces and prime-power
representation, Exercise 46's higher moments, the source-specific growing-prime
comparison, exact Kubilius source acquisition, and the counting-at-CDF-continuity-
points characterization of weak convergence. Do not replace these gaps by the
finite CDF formula or the conditional transfer supplied here.

PM.1 still needs Mertens normalization, source-specific cutoff and lower-even-
moment estimates, uniform growing-order control and a valid moment-continuity
argument. Its omega Gaussian convergence is the missing premise for the
Erdos–Kac specialization. PM.2–PM.5 gaps are unchanged. No unread source or
whole stage is claimed closed.

## Historical handoffs

The earlier inventories and open conditional-transfer obligations below are
historical; the checkpoint above supersedes them.

# Repeated-prime-factor checkpoint — BP-ProbabilisticAndMetricNumberTheory

Codex, session `codex-a71f92`, issue #1041, 27 September 2026.
Claim 5854482118 won, confirmed by bot 5854483554; whole issue read before
and after confirmation, and winning claim rechecked before publication.
Snapshot: 29b41cfffdb932b9cf997a250220fdcefe73d7b4.
This continues the other worker's merged PR #3216. All 59 nodes remain
unchecked and every stage remains partial. This is not an independent review.

## Contribution and exact boundaries

Eight new PM.0 nodes close the finite first-moment repeated-factor branch:

- `excess-factorization`: real Omega-minus-omega as the sum of excess exponents.
- `prime-power-tail-count`: finite higher-power indicators for one prime.
- `excess-prime-power-expansion`: finite double sum over native prime and exponent cutoffs.
- `excess-mean-formula`: exact finite mean using the inherited divisibility count.
- `excess-mean-bound`: nonnegative mean bounded by 1-1/N.
- `excess-tail-bound`: the resulting inclusive positive-threshold estimate.
- `excess-scaled-l1`: normalized absolute first-moment comparison.
- `excess-cdf-sandwich`: finite omega-to-Omega event comparison with a common center and positive scale.

For N=m+1, D(n)=(Omega(n):R)-(omega(n):R). The bound is
0<=E[D]<=1-1/N. The existing geometric bound controls the prime-power sum;
enlarging to every integer base gives the existing telescoping sum
sum_{r=2}^N 1/[r(r-1)]=1-1/N. Thus P(t<=D)<=(1-1/N)/t for t>0.
With X=(omega-b)/s,Y=(Omega-b)/s and s,delta>0,
P(X<=x-delta)-(1-1/N)/(s*delta)<=P(Y<=x)<=P(X<=x).
This is not an independence assertion, a pointwise bound, or a Gaussian limit.

All 51 inherited node objects, 61 examples, 78 baseline declarations and 12
source objects are preserved exactly. The three inherited source findings and
their three version records remain unchanged; one precisely scoped author-HTML
version is appended. PM.1-PM.5 coverage and gaps are unchanged. The eight existing
planets remain unchanged (six PM.0, two PM.1); no new planet displaces an inherited one.

Inventory: **59 nodes** (1 construction, 44 lemmas, 1 comparison, 13 theorems),
**7 construction API items**, **5 construction tests**, **77 typed examples**,
**8 planets**, **93 baseline citations**, **14 sources**, **3 inherited source
findings**, **6 gaps**, **0 requests**. No new definition is introduced.

## Inputs and sources actually inspected

The binding WORKERS, blueprint PROTOCOL, expansion PROTOCOL and UPSTREAM_GUIDE
match their fully read versions in this session. WORKERS was reread. No AGENTS.md
exists in the snapshot. All six integrated reviewed PM audit rows were read before
planning. Required-input comparison against our own preceding PM checkpoint finds
the four updated PM deliverables and our own GN checkpoint #3215 changed; the
29 matching link files and the remaining consulted inputs are byte-identical.
The two previously absent inputs remain absent. Earlier complete campaign/atlas,
accepted RS-07, audit/review and upstream style/ownership readings remain applicable.

Read the other worker's new nine residue-law objects in full, their new baseline
records and source scope, the new handoff, and the corresponding reader/signatures.
Their native CRT and exact residue-law bounds are preserved, not independently
reviewed. Our changed GN supplier is exactly the already authored and checked
first-minimum/coset-counting checkpoint; it supplies no input to this slice.

Read the selected Section 4 passages of Tao's 23 November 2014 author exposition:
the omega/Omega identities, the mean/second-moment context through Remark 45,
Exercise 46, Theorem 47, and Exercise 51 with its normalization. The intervening
multiplication-table discussion is context, not a decomposed target.
Acquired HTML SHA-256:
c55a6de8d4c7d9292ea3bc739bd6339f4555a2bd53ec7f5e4f0a62b684a3dba3.
Only these passages are claimed read. The first-moment proof and finite constants
are worker derivations of an exercise, not a source-supplied proof. Higher
repeated-factor moments and the full Hardy-Ramanujan/Erdos-Kac deductions remain
open. Bounded title/exercise correction search and HTML occurrence screening found
no applicable correction; no complete comment-thread collation or source-wide
correctness verdict is claimed. No new source finding is asserted.

Searched both pinned libraries and the packet collection for the repeated-factor
comparison. Read every new baseline statement at the pin. Existing omega/Omega,
factorization, interval cardinality, finite geometric sums, telescoping, Markov
and real-measure operations are suppliers, not new generic nodes. The additive
statements generated by the two indexed multiplicative suppliers were also checked
in Lean. Existing empirical-measure source was reread completely.

## Verification

- Official packet checker with the full pinned declaration index: **0 errors, 0 warnings**.
- Suggested file: **59 declarations and 77 examples**, elaborating on Lean
  4.34.0-rc2 with **136 expected placeholder warnings**, no errors or other warnings.
- Verified all **8,482** transitive Mathlib source files against the pin/cache;
  freshly built both imported Tau Ceti modules from pinned sources.
- Suggested-file SHA-256:
  937e4751c1459a7732850b928b2b8261f5d5c7d70aeb95dc5c1900a2e462af38.
- Separate scratch proof file: **six general statements and six examples**,
  no placeholders, axioms or diagnostics. It proves the factorization identity,
  nonnegativity, exact exponent count, finite geometric tail, telescope and
  event inclusions. The examples include two generated-supplier checks.
  This is not proof verification of the whole eight-node packet extension.
- Exact rational diagnostics: **1,000** finite expansions, **52,588** prime-tail
  counts, **500** mean/telescope chains, **12,000** tail bounds, **2,000** scaled
  L1 bounds, **5,900** finite geometric inequalities, **20,160** CDF sandwiches,
  and **five** rejected-hypothesis cases. Full ranges are in the reader.
- Dependency, source-version and inherited-object checks, four-path intake and
  current-main input guard pass and are rerun immediately before submission. The guard
  permits only the exact ES supplier blob from our newly merged PR #3222; that
  scalar conductor-saving extension has no new dependency for this slice.

Only the four issue deliverables are published. Scratch probes, scripts, downloaded
HTML and build artifacts are not deliverables.

## Exact continuation

Keep all finite residue, Boolean, mixed-moment and cutoff contracts. For PM.0,
general additive/strongly additive predicates and their full prime-power
representation remain; the repeated-factor first-moment interface is no substitute.
Decompose Exercise 46's higher-moment bounds and the asymptotic Omega transfer.
The finite CDF sandwich supplies only a comparison between these two observations,
not the general counting/CDF/characteristic-function/weak-convergence dictionary.
Acquire the exact Kubilius source for a growing-prime comparison.

For PM.1, establish Mertens normalization, the source-specific cutoff-error and
lower-even-moment bounds, the uniform growing-order range, and a valid convergence
argument. Determinacy alone is uniqueness, not convergence; arithmetic prime
indicators are not iid. The unchanged PM.2-PM.5 gaps retain their source and
ownership requirements. No whole stage or unread source is closed.

## Historical handoffs

The preceding records follow unchanged. Their inventories and open first-moment
Omega obligations are superseded by the checkpoint above.


# Handoff — BP-ProbabilisticAndMetricNumberTheory

## Full-residue checkpoint — 27 September 2026

Codex, session `codex-hjdg0j`, issue #1041. Claim comment 5854158594 won,
confirmed by bot comment 5854159459. Read the full issue before and after that reply.
Continue merged PR #3209. This is a partial planning checkpoint, not an implementation
or an independent review. All 51 nodes remain unchecked; no whole stage is closed.

### Contribution and preservation

Nine new PM.0 nodes decompose the finite full-residue model:

1. `residue-probability`: exact arithmetic atom mass using the existing residue count.
2. `residue-atom-error`: strict per-atom error below 1/N, with both possible signs.
3. `residue-summed-error`: exact summed absolute error, including the large-period obstruction.
4. `residue-event-error`: the sharp event bound, half the summed error.
5. `residue-statistic-error`: the sharp bound scaled by the statistic's range U-L.
6. `crt-residue-probability`: native CRT transport to a complete residue tuple.
7. `crt-complete-period-law`: the joint uniform product atom law when Q divides N.
8. `crt-summed-error`: exact error summed over all tuples.
9. `crt-statistic-error`: bounded tuple-statistic comparison with the product model.

The sample is still 1,...,N with N=m+1, using the native empirical measure. For
modulus d the correct zero-origin count uses rho(a)=(a-1).val in ZMod d. With
R=N mod d, exactly R atoms have positive discrepancy (d-R)/(N*d); the other
atoms have discrepancy -R/(N*d). The summed absolute error is 2*R*(d-R)/(N*d),
the event bound is half that, and a statistic in [L,U] multiplies the event bound
by U-L. CRT uses arbitrary finite indexed pairwise-coprime positive moduli,
including composite moduli, modulus one and the empty family. No generic counting,
CRT, probability, independence or total-variation carrier is introduced.

All 42 inherited node objects are exactly preserved, including their prerequisites,
source citations, APIs and tests. All inherited baseline entries, source findings,
version records, requests and restructuring data are preserved. Only the existing
Tao source gains a precise read-scope entry. PM.1–PM.5 coverage is unchanged;
the PM.0 gap loses the finite full-residue obligation but retains stronger
source-specific growing-prime comparisons and the other missing interfaces.

Inventory: **51 nodes** (1 construction, 38 lemmas, 1 comparison, 11 theorems),
**7 construction API items**, **5 construction tests**, **61 typed examples**,
**8 planets** (6 PM.0, 2 PM.1), **78 baseline citations**, **12 sources**,
**3 inherited source findings**, **6 gaps**, **0 requests**.

### Evidence and validation

WORKERS, blueprint PROTOCOL, expansion PROTOCOL and UPSTREAM_GUIDE match the
versions already read fully in this session. There is no AGENTS.md in the snapshot.
Read all six integrated reviewed audit rows before planning, the complete campaign
and atlas stage descriptions/edges, full inherited handoff, node-statement inventory,
focal probability nodes, and relevant reader/signature sections. The other inherited
proof/source material is preserved, not independently recertified. The integrated
PM decomposition is absent. Read all 54 touching link-map entries from 53 files;
these are negative screens/provenance, not extra theorem suppliers. The accepted
RS-07 boundary supplies generic arithmetic functions and sums directly from the
library and leaves arithmetic probability in PM.0. The full style readings of
Completed/EffectiveBounds and ArithmeticDirichletSeries from this session remain
byte-identical. Exchangeability's carrier guidance was also consulted in part.

Reread the first six paragraphs of Section 3 of Tao's 254A Supplement 4, through
the strong-versus-weak residue comparison. Exact finite constants and the composite
modulus generalization are explicit worker refinements of its counting/CRT argument.
No rough-number heuristic is imported as a theorem. No new source finding is claimed.
The Granville–Soundararajan findings and edition limitations are inherited unchanged;
this continuation does not claim a new reading or collation of those sources.

Searched packet statements and both pinned libraries for arithmetic empirical-residue
laws. The packet hits concern unrelated analytic residues. Read the actual statements
of all 17 new baseline citations and byte-verified their source files against the
pinned trees. Existing Nat.count_modEq_card and ZMod.prodEquivPi supply the exact
count and CRT. Three indexed multiplicative generators have to_additive-generated
sum counterparts; their actual additive statements were checked in Lean.

- Official packet checker with the full pinned declaration index: **0 errors, 0 warnings**.
- Full suggested file: **51 declarations and 61 examples**, elaborating on Lean
  4.34.0-rc2 at Mathlib 082e2d3 and Tau Ceti f790474 with **112 expected placeholder
  warnings**, no errors or other warnings. The inherited file first compiled with 85.
- Byte-verified all 8,482 transitive Mathlib sources against the pin and cache;
  freshly built the two imported Tau Ceti modules from pinned sources.
- Three temporary complete proof checks, appended only to the authorized suggested
  file and then removed, prove the general exact residue-probability formula from
  the baseline, the CRT natural-cast identity, and the scalar strict error estimate.
  They use no planned placeholders. These checks validate those routes, not the
  complete nine-node implementation.
- Exact rational checks: 98,400 residue atoms/strict errors; 4,800 summed-error and
  attaining-event identities; 15,300 exhaustive subset bounds; 14,400 range-sensitive
  statistic bounds; 12,080 joint atoms; 640 joint summed errors. The reader gives
  all sample/modulus ranges. Incompatible and compatible noncoprime counterexamples
  reject misuse of the product model.
- Source findings/version, acyclic dependency graph, preservation and four-file intake
  checks pass. The publication guard checks current main, relevant input blobs,
  issue body and our winning claim before submission.

The publication guard inspected one concurrent supplier change: geometry-of-numbers
blob 83379c023e7e2d8fe51914637679a4bb9c45c2bd adds five GN.4 coset/sublattice
and first-minimum counting declarations, preserving its inherited nodes. Its new
statements, proof routes and changed coverage/gaps were read for dependency and
ownership impact. Its residue-separation upper count is distinct from the present
arithmetic probability laws; it supplies no new dependency here. This is a scope
check, not an independent review. Only that exact changed blob is accepted by the guard.

No auxiliary Lean file, source download, test script, build artifact or private path
is published. The PR changes exactly the packet, reader, suggested file and this handoff.

### Exact continuation

Reuse the full-residue contracts, the original Boolean laws and the centered moment
contracts. Do not rebuild empirical measures, modular interval counts, CRT, finite
product laws or the finite moment/cutoff interfaces. Strong comparison via these
new formulas is useful when the full product Q is small relative to N. When N<Q,
the summed residue error is exactly 2*(1-N/Q); the formulas do not supply a general
Kubilius comparison for many large primes.

PM.0 still needs general additive/strongly additive functions, full prime-power and
Omega interfaces, the arithmetic CDF/characteristic-function/weak-convergence
dictionary, and source-scoped growing-prime comparison beyond these finite bounds.
Acquire the exact Kubilius source before assigning its theorem contracts.

For PM.1, resume the preserved six-node cutoff interface from PR #3209: establish
Mertens normalization, source-specific bounds for D and lower even moments, the
uniform growing-order range and a valid convergence-to-Gaussian argument. Moment
determinacy alone gives uniqueness, not convergence. The other five stage gaps
and their source-acquisition/ownership requirements remain explicit.

## Historical handoff

The following earlier checkpoint is retained as provenance. Its counts and its
open finite all-residue obligation are superseded by the checkpoint above.

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
