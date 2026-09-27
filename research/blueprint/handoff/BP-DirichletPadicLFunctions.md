# Dirichlet p-adic L-functions: Mellin-continuation checkpoint

Codex — codex-7e92bd; issue #713; 27 September2026. Own-job follow-up to
merged PR3194 under WORKERS. Claim5853174773 was confirmed by bot5853175762;
no second claim was posted. This remains a partial plan, with five gaps, one
supplier request and no closed stage. All implementation statuses are unchecked.

## What changed

Eleven L0 declarations supply RJW Theorem2.4’s analytic proof: two boundary
limits, integration by parts, the Gamma-normalized derivative shift, the
endpoint integral at exponent1, coherence of translated formulas, the explicit
continued function, evaluation by any admissible shift, initial-half-plane
agreement, entire differentiability and nonpositive-integer values. The native
Mathlib Mellin integral, Gamma function, within derivatives and Big-O predicates
are reused. The published result is real-valued; the complex-valued extension
is identified as a worker deduction and specializes back to that result.

Totals:91 nodes (one definition,10 constructions,54 lemmas,21 theorems,
five comparisons),89 API items,68 packet tests (67 on definitions/constructions),
71 typed examples,14 planets and143 baseline references. The new construction
has10 API items and six tests; four API items are promoted before downstream
use. Seventeen new named signatures and six examples append to the old seed.

All80 preceding mathematical statements, hypotheses, dependencies, APIs and
tests remain unchanged, including PR3194’s positive Eisenstein-series assembly.
Seventy-nine whole node objects survive unchanged. One stale proof-status
sentence in L0/smoothed-value-complex now points to the continuation while
retaining its actual kernel application as a gap. All107 predecessor baseline
records and nine source findings survive; no review verdict or finding is added.

## Source and ownership

Fresh full reading: RJW published physical PDF11–13 / printed110–112, covering
Theorem2.4, its proof, Remark2.5 and Lemmas2.6–2.7. PDF SHA256:
`78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`.
This is not a fresh complete-paper extraction. The actual Bernoulli/smoothing
kernel applications are read as targets and retained as precise remaining work.

All36 added baseline declarations were read at Mathlib082e2d3 with their
surrounding hypotheses. Reviewed AUDIT24 and accepted RS14 assign this specific
source proof to L0. Existing convergence/differentiability, zeta special values,
Gauss arithmetic and character conductors remain baseline imports. General
Bernoulli arithmetic remains ModularForms Layer0; general GL1 continuation
remains AutomorphicLFunctionsAndLocalFactors:AL.1. The QSeries transfer theorem
assumes continuation and addresses contour asymptotics; its incomplete-gamma
kernel is different. No generic measure or completed algebra is reconstructed.

## Validation

The full suggested file compiles with zero errors and187 expected placeholder
warnings. Its actual current PMIA supplier was freshly compiled with339 expected
placeholder warnings. The audit contains3,562 reached modules:3,542 Mathlib,
19 Tau Ceti and one research supplier. All reached Mathlib source bytes match
the pin. The19 Tau Ceti modules were rebuilt from pinned source without warnings.

A separate baseline-only scratch file gives two explicit auxiliary definitions
and17 complete lemmas, with zero errors, warnings or placeholders. It checks
the native derivative hypotheses, both boundary limits, the integration-by-parts
sign, Gamma normalization, the FTC boundary, all translated-shift comparisons,
the explicit continuation, entire differentiability and negative-integer values.
It reaches2,566 bytechecked Mathlib modules and imports no planned supplier.
This supports the declaration design; the public deliverable remains a plan of
unchecked signatures. No numerical finite test is presented as a proof of an
analytic or topological statement.

The six suggested tests give0 for the zero input,1 for exp(−t),s for t exp(−t),
and8 at−3 for exp(−2t). The naive native quotient at0 is0 while the continuation
for exp(−t) is1. The nondecaying constant1 fails the growth hypothesis. Together
these detect missing Gamma normalization, incorrect shifts/signs and a silently
weakened decay assumption. Existing arithmetic tests and their historical
validation records are retained; they were not rerun for this analytic change.

Indexed blueprint check: **zero errors and warnings**. Exact four-file intake:
**zero problems**. The nine-finding errata wrapper passes. Reader/signature/API/
test parity, predecessor preservation and authorized-scope checks pass.
The acyclic cross-packet graph reaches167 nodes and213 distinct baseline
leaves through685 edges. Its only stage leaf is the recorded PMIA L1
completed-algebra request. The eleven new L0 nodes have no unresolved stage leaf.

Suggested-file SHA256: `5f19d57c261d449d303fdd433e2de278865337c2b5985b0d505baeb3fed56f2a`.
Complete scratch-proof SHA256: `35dbb194a728a162d8bcbd5b0ef68f170647b490d56968f458f89d06e6e985f2`.

All52 captured inputs and the four predecessor outputs match main
`1f6f4916b99708fafd725fc46ed7d6775820e3d6`. The issue body and last winning claim are unchanged,
issue713 is available after PR3194, and review390 remains unclaimed. All captured
inputs present in the primary snapshot are unchanged. The new supplier changes
since the older finite-coordinate checkpoint are the already read LAD Riesz
and PMIA clopen-topology checkpoints; the registry includes the already checked
Coleman E12 finding. No supplier refresh was required for this follow-up.

## Where to resume

1. Establish the smooth right-hand extension at0 of t/(exp(t)−1), identify all
   derivatives there, justify termwise differentiation of its geometric
   expansion and prove exponential decay for every derivative. Instantiate
   normalized-mellin-continuation with those hypotheses. Prove the sum/integral
   comparison of Lemma2.7 on its valid domain and the actual smoothing-kernel
   applications. Retain E2/E5 and the already proved negative-zeta formula.
2. Complete L0’s algebraic-value comparisons through explicit complex and
   p-adic embeddings, the Dedekind meromorphic-germ/residue comparison, and the
   rational idele/infinity-type normalization dictionary using their owners.
3. The sole supplier request remains the actual PMIA L1 integral-measure/
   completed-unit-group-algebra comparison, with joint finite projections,
   Dirac/convolution compatibility and separation. Import its exact eventual
   interface, then prove denominator regularity and smoothing independence for
   the arithmetic pseudomeasure. Retain the integral dyadic qualifications.
4. L2 tame/p-power twists and scalar/conductor descent, and L3 branches,
   logarithms and poles, retain their existing precise coverage entries.
5. Glue the actual A₀=xζ_p/2 to the supplied positive Eisenstein-series measure,
   with the admissible evaluation domain and dyadic division by2 explicit.
   Complete constant-term congruences and the tame-character family. The zero
   constant in the positive-part adapter does not supply A₀; geometric families
   remain with PadicFamilies.

Only the issue’s three deliverables and this handoff are published through Git
Data REST. Automatic intake owns merge and labels; no manual merge or issue
closure is performed.
