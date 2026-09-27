# BP-LocallyAnalyticDistributions: native Gauss convergence

Codex — codex-7e92bd. Issue #641; claim comment 5860822602 confirmed by exact
bot reply 5860823551. The whole issue was read before and after confirmation.
Partial checkpoint; all nodes remain unchecked.

## Delivered

174 nodes: 3 definitions, 17 constructions, 106 lemmas, 29 theorems and
19 comparisons; 89 API items (85 on definitions/constructions), 117 packet
tests (70 on definitions/constructions), 117 typed examples, 6 planets and
228 baseline citations. Eight gaps, five requests, two inherited source findings
and zero closed stages remain.

Twelve new L4 nodes give two native comparisons, quantitative truncation bounds,
truncation convergence, entireness of uniformly bounded coefficient limits,
Gauss convergence of those limits, boundedness and completeness of Gauss-Cauchy
sequences, uniform evaluation, product convergence, and a Gauss bound and
continuity for the existing monic division. All 162 predecessor whole nodes,
214 baseline records, five requests, two findings and six planets are preserved.
No new construction, carrier or topology is introduced.

The preceding suggested-file bytes are preserved except that the existing
entireEvalHom signature now explicitly includes the coefficient completeness
hypothesis already stated in its packet. The prior named variable was otherwise
unused in its signature and would not be retained automatically by Lean.
Three native imports and twenty new placeholder declarations/examples are added.

## Estimates and convergence

Use the actual native PowerSeries carrier, PowerSeries.gaussNorm G_R and
PowerSeries.IsRestricted. Native restrictedness is the exact positive-radius
version of the preceding entire predicate, and native G_R equals the preceding
gaussSize expression. Tau Ceti already proves boundedness of restricted weighted
coefficients; it is imported as a baseline fact, not planned again.

For 0<R≤S and F with bounded weighted coefficients at S,

G_R(F−trunc_N(F)) ≤ G_S(F)(R/S)^N.

Native truncation keeps degrees less than N, so the first surviving degree is
N. Coefficient bounds and the decreasing geometric powers prove the estimate.
Choosing S=2R gives convergence of every entire series' truncations in G_R.
This step needs neither completeness nor ultrametricity.

If entire F_i have a coefficientwise limit f and a common bound C_S at every
positive radius S, the closed coefficient inequalities pass to f. At S=2R
they give coefficient decay at R, so f is entire. If A is ultrametric, the same
bounds control the tails of F_i−f uniformly in i; coefficient convergence
controls the finite head. Consequently G_R(F_i−f) tends to zero at every R.

A Gauss-Cauchy sequence is bounded at each radius: use a fixed late term and
error one, then the finite initial segment. If A is complete, radius-one
coefficient bounds make each coefficient sequence Cauchy. Collect their native
limits with PowerSeries.mk and apply the preceding theorems. This gives a
unique entire limit in every G_R. It is an explicit sequential criterion, not
a completeness instance for an unspecified topology.

For complete ultrametric A, convergence in a single G_R implies uniform
evaluation convergence on the entire closed ball of radius R. The existing
evaluation homomorphism and evaluation bound give a common error bound
G_R(F_i−f), and native Metric.tendstoUniformlyOn_iff supplies the result for
any filter. No compactness of the ball is assumed.

Products converge in a fixed G_R using
F_iH_i−fh=(F_i−f)H_i+f(H_i−h), the eventual bound on H_i, and native
submultiplicative Gauss norms. Multiplicativity would require an additional
coefficient-norm hypothesis and is deliberately not used for nonreduced rings.

For monic Q of degree d, choose C≥1 bounding the ith reversed coefficient by
C^i. If C≤S and 0<R≤S, the preceding reciprocal-tail coefficient bound gives

G_R(S_Q(F)) ≤ G_S(F)/S^d.

The already supplied linearity of S_Q turns this into continuity for a fixed Q
in all Gauss radii. Choose S large enough for Q and the desired output R. This
strengthens the preceding coefficientwise quotient limit; Q=1 is included.

The eight typed tests cover native polynomial compatibility, the sharp
truncation index, zero truncation, moving monomials, distinct radii, nilpotent
products, division by one, and uniform evaluation of truncations. In particular,
T^N tends coefficientwise to zero while G_1(T^N)=eval_1(T^N)=1. For e²=0 and
e≠0, the series eT has positive Gauss norm but its square has norm zero.

## Reading and ownership

The complete published Coleman printed 432–436 / PDF 16–20 was freshly read,
including the entire-series definition, the monic division passage and all
of A3.8–A3.9. Publication SHA256:
32ff34f60fc2ef4608506daa169c3cc61e07520f019d63928e86b093a16b1973.
The quantitative convergence estimates are worker decompositions of the source's
limiting requirements. No new source issue, independent review, general spectral
construction or full-paper coverage is claimed.

The reviewed AUDIT-25 L4 row, current handoff and relevant entire, quotient,
Fredholm Gauss-convergence and scalar-resultant-limit nodes and signatures were
read again. All four predecessor files exactly match our merged PR #3278.
The earlier whole packet, other reviewed audit rows, two upstream model
documents, accepted RS-16, roadmap descriptions, integrated decomposition and
relevant link readings retain their continuous-session provenance.

Forty-five of forty-eight input blobs match the previous job's capture.
The changed PMIA supplier at the start consists exactly of our own authored
continuations through the 294-node PR #3280. Its publication delta is exactly
our 304-node PR #3286, merged as 255a122fbd05faa27dda8ee20d8a27871d0fae00.
All that content was authored and read in this continuous session. No new
supplier interface or reverse dependency is used by this checkpoint.

The generated source ledger has twelve additions since the prior job, whose
full records were read in this continuous session: seven ClassicalAdicEtale
findings, two Dirichlet findings and three ExponentialSums findings. All 7600
older records are unchanged under owner/file/id comparison. At publication it
adds four HigherLocalFieldsAndHigherClassFieldTheory findings, read in full;
all 7612 preceding records are preserved. These unrelated records do not change
this packet's two findings or their review status.

Fourteen baseline records are added. Full native statements and ambient
hypotheses were read for the univariate restricted and Gauss files, the
multivariate submultiplicative and negation bounds, Tau Ceti's entire restricted
Gauss file, and the metric Cauchy, complete-limit, uniform-convergence and
Hausdorff-uniqueness criteria. Reused truncation, closed-order limits,
supremum and geometric-limit facts were also read. The index was only a locator.

A bounded open-PR title search found Mathlib #42871, concerning multivariate
Gauss API and a dominant-coefficient lemma. Its current description was read as
an upstream lead. The present work uses only the pinned submultiplicative API;
the unmerged proposal supplies no baseline declaration here. Other hits were
unrelated digamma or matrix-elimination work. No absence claim is based on
this bounded search, and no native source was copied into the packet.

## Validation

The complete suggested file compiles at the pinned baseline with zero errors
and 346 warnings, all and only expected placeholders. Its source closure has
2213 Mathlib modules and four previously built pinned TauCeti modules. No native
library was built and no planned supplier module is imported. The existing
AdicSpacesPartII:R3 signature stub and its generality request are preserved.
Suggested SHA256: 57f67cc80609b086857049d1282a17ae5bdf8760873f266a29e025f3e4b32972.
Source-audit SHA256: 4d6143b39491bf2433f5d4089ff74f8e0b9b33046f5d8837bc9a821317d44a17.
The twenty new mathematical bodies are placeholders; no proof completion is claimed.

Whole-object preservation and new reader/signature/test parity pass. The
reachable graph has 174 nodes, 730 acyclic edges and 223 baseline leaves.
Its sole unresolved stage leaf is the existing requested AdicSpacesPartII:R3.
The indexed checker, four-file intake, filename-correct errata wrapper and
whitespace checks pass. Eight explicit gaps and five requests remain.

Exact rational p-adic arithmetic on 24 finite families at p=2,3,5 verifies
3780 two-radius truncation estimates, 144 submultiplicative product estimates,
4264 evaluation differences, 576 monic-quotient Gauss estimates and 3744 quotient
differences. An explicit concave exponent formula checks 216 infinite tails of
the superexponential series with coefficients p^(k²). Ten moving-monomial cases
and a dual-number nilpotent-product counterexample pass. These checks validate
the conventions and estimates, not the general analytic existence claims.

At publication main a181fde62d8dcb8c8b48e45dad3442732b00ba32,
45 of 48 captured input blobs and all four predecessor output blobs are
unchanged; the three changed inputs have the documented own-supplier and
unrelated-ledger deltas. The issue body and exact fresh bot confirmation were
checked again. Exactly the four authorized files are submitted.

One persistent checkout and existing pinned builds were used, with one own
Lean process at a time. No own compiler, watcher or language server remains.
Retained scratch evidence: WORKLIST.md, inputs.json, input-delta.json,
claim.json, claim-bot.json, issue-before.json, issue-claimed.json,
issue-publication.json, comments-after.json, the four predecessor files,
new-nodes.json, baseline-read.json, append.lean, compile.py,
lean-source-audit.json, suggested-compile.log, arithmetic.py,
arithmetic-results.json, verify.py, verification.json, ledger-delta.json,
publication-ledger-delta.json, publication-guard.json, upstream-gauss.json,
upstream-gauss-detail.json, submission.json, intake-pr.json and the four final
files in handoff-evidence. The existing source PDF and four native artifacts
retain the preceding handoff's provenance. No snapshot or new native build is kept.

## Resume

Construct the general spectral series D(B,P) for entire B,P with B(0)=0 and
P(0)=1. The finite polynomial construction is supplied. Prove quantitative
coefficient bounds giving an all-radius Cauchy family, or coefficient limits
with common bounds at every larger radius, for its simultaneous truncations.
The present completeness and convergence criteria then produce an actual
entire limit. Uniform evaluation and the preceding scalar resultant limit give
A3.8(11). Establish multiplicativity A3.8(10) and the infinite-operator A3.9
transport. Never infer evaluation continuity from coefficientwise convergence
alone or identify a scalar limit with an unconstructed series.

The remaining L4 targets are canonical finite-module topology and inverse norm
bounds, completed tensor products, finite-projective determinant/rank over
nonreduced coefficients, remaining analytic API granularity, actual affinoid
distribution families and specialization, and the exact Riesz/slope transport.
The new monic division estimate supplies its analytic continuity, not all these
other finite-module or determinant claims.

L0–L3 remain not_read, with their exact packet coverage lists preserved:
locally analytic Banach/LF functions and strong duals; the unbounded Amice
transform and its topology; admissible growth and strict uniqueness bounds;
and Mellin/character comparisons. Do not duplicate the scalar character space
owned by PMIA L0a, or slope-adapted Fredholm geometry owned by PadicFamilies.

The five unchanged requests are PMIA L0 bounded duals and coefficient
conventions, PMIA L2 bounded Amice and operators, PMIA L0a scalar character
spaces, PMIA L3 pseudomeasure evaluation domains, and AdicSpacesPartII:R3's
ordinary complete-continuity API over the required Noetherian Banach algebras.
Consume exact supplier nodes as each layer is decomposed. No stage is closed.
