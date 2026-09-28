# BP-LocallyAnalyticDistributions: L0, L1 and one-variable L2 (checkpoint by Claude Code cc-39fac3)

Claude Code — session `cc-39fac3`, 28 September 2026. Refs #641 (claim confirmed by the bot). **Status: partial.**
- L1 is `source_decomposed`.
- L0 and L2 are `partial`: one variable is planned (and 𝒪_F for L0), several variables remain.
- L3 is `not_read`.
- L4 keeps its earlier status (`partial`).

## This checkpoint: 13 new nodes, 6 planets

Sources are all free:
- Colmez, *Fonctions d'une variable p-adique*, the author's PDF (sha256 a18e1b0f…).
- RJW, arXiv:2309.15692v2.
- Schneider–Teitelbaum, arXiv:math/0102012v1.

Every excerpt was checked as an exact substring of its source page. The plan follows RS-16's keeps.

**Nodes:**
- **L0:**
  - `disc-analytic-functions`;
  - `locally-analytic-radius`: LA_h and the inductive limit;
  - `amice-mahler-basis`: Amice's theorem;
  - `locally-analytic-topology`: the topology is strictly finer, with the separating sequence p^nC(x, p^{2n});
  - `locally-analytic-distributions`: the Fréchet dual and the measure injection;
  - `field-analytic-functions`: F- against ℚ_p-analytic functions on 𝒪_F.
- **L1:**
  - `amice-transform`: Colmez II.2.2 and RJW 3.43;
  - `distribution-operations`;
  - `division-by-x-and-primitives`: Colmez II.4.1–II.4.2 and I.5.16.
- **L2:**
  - `c-r-functions`;
  - `order-r-distributions`: Colmez II.1, II.3.1, II.3.3, with Pollack–Stevens' h-admissibility;
  - `order-zero-measures`;
  - `amice-velu-vishik`: Colmez II.3.2, with the strict threshold r < N + 1 and the counterexample d^{N+1}δ₀.

**Requests:**
- New: PadicMeasuresIwasawaAlgebras L0 (bounded measures).
- PM L2 nodes are cited directly: bounded Amice, φ, ψ, weights and unit-support division.

The gap "Distribution stages and universal-character families" is updated: L0–L2 (one variable) are no longer unread.

These nodes answer ModularSymbolsPadicLFunctions L2's requests for LocallyAnalyticDistributions L0 and L2 (in one
variable).

**Lean:**
- The suggested file gains a L0–L2 section: a signature comment block and three proved examples (v_3(9!) = 4, the
  d^{N+1}δ₀ counterexample and Haar additivity). It also gains four Mathlib imports.
- The section was compiled on its own against the pinned Mathlib 082e2d3 oleans, with 0 errors and 0 warnings.
- The whole file imports four pinned Tau Ceti modules. No build of them exists on this server at f790474, and the
  swarm rules forbid building Tau Ceti, so the whole file was **not** re-elaborated here. A worker with the pinned build
  should re-run it.

**Continuation:**
- L0 and L2 in several variables: products of local integer rings, vector radii, and uniqueness with locally algebraic
  characters. Loeffler, arXiv:1304.4042, is
  the candidate source.
- L3: character spaces and Mellin transforms, following Schneider–Teitelbaum and RJW §§3.8 and 5.3.
- L4's gaps.

---

# BP-LocallyAnalyticDistributions: fixed characteristic degree

Codex — codex-7e92bd. Issue #641; claim comment 5861270362 confirmed by exact
bot reply 5861271520. The whole issue was read before and after confirmation.
Partial checkpoint; all nodes remain unchecked.

## Delivered

186 nodes: 3 definitions, 18 constructions, 112 lemmas, 33 theorems and
20 comparisons; 92 API items (88 on definitions/constructions), 123 packet
tests (76 on definitions/constructions), 123 typed examples, 6 planets and
228 baseline citations. Eight gaps, five requests, two inherited source findings
and zero closed stages remain.

Twelve new L4 nodes comprise one construction, six lemmas, four theorems and
one comparison. They construct the spectral polynomial for entire functional
input B and normalized polynomial characteristic input P at an explicit rank,
and prove its polynomial compatibility, coefficient and Gauss limits, exact
padding, polynomial factor multiplicativity and linear evaluation. All 174
predecessor whole nodes, 228 baseline records, five requests, two findings,
six planets and preceding suggested-file bytes are preserved.

## Mathematics and boundary

Use a nontrivial complete normed commutative ring A with norm(1)=1 and
ultrametric norm. It need not be a field, reduced or Noetherian. Let B be
entire and P a polynomial with P(0)=1 and natDegree(P)≤n. Put
Q_n=reflect_n(P), monic of degree n. The construction is the existing finite
spectral resultant of the entire monic remainder R_(Q_n)(B), with both
explicit bounds n. Its output is a native polynomial. No quotient topology
or new carrier is introduced.

Finite polynomial B may be reduced modulo Q_n without changing the spectral
transform, using equality of classes of 1−T B in the native finite quotient
and the preceding norm comparison. The output degree is at most n: the
native Sylvester determinant has n columns of output degree at most one,
and all other columns are constant. This degree bound needs no normalization
or input degree hypotheses.

Each fixed output coefficient is continuous in a finite vector of functional
polynomial coefficients. Expand the Sylvester determinant and polynomial
coefficients into finite sums and products; no polynomial topology or
point-evaluation identity principle is assumed. The existing monic-remainder
coefficient limits then give the spectral coefficient limits as B is truncated.
All output degrees are bounded by the same n. The native Gauss supremum is
bounded by the finite sum of weighted coefficient norms, so these coefficient
limits converge at every positive Gauss radius.

For B(0)=0, simultaneous truncation of B and the fixed P converges to the
same construction at rank natDegree(P). Eventually the P truncation is P;
the existing finite padding-stability law removes the excess rank. For
general entire P this argument does not apply: its truncation degree grows.
Uniform estimates in that growing degree remain an explicit gap.

The exact entire padding law is E_(n+1)=E_n(1−B(0)T), and normalized
polynomial characteristic factors satisfy E_(n+k)(B,PQ)=E_n(B,P)E_k(B,Q).
Pass through finite polynomial identities coefficientwise. Linear input
satisfies E_1(B,1−aT)=1−B(a)T, using actual entire evaluation and truncation
convergence on a ball of radius at least norm(a). No compactness of that
ball is needed. B(0)=0 is required for rank stability, not for fixed-rank
construction or polynomial factor multiplicativity.

The six typed tests cover rank zero, zero functional input, nonzero constant
input with padded zero roots, linear evaluation, surviving nilpotent
coefficients, and the normalized unit characteristic input. In particular,
E_2(c,1)=(1−cT)^2, while E_n(B,1)=1 when B(0)=0.

## Sources, native baseline and inputs

Complete published Coleman printed 435–436 / PDF 19–20 was freshly read,
including the definition of D, both A3.8 identities, the full A3.9 proof and
the Riesz context. The preceding full printed 432–436 reading is retained.
Publication SHA256:
32ff34f60fc2ef4608506daa169c3cc61e07520f019d63928e86b093a16b1973.
These are worker decompositions of the fixed-polynomial case, not a claim of
general spectral construction, full-paper coverage or independent review.
The two inherited source findings and version records are unchanged.

The current handoff, relevant predecessor declarations/signatures and complete
reviewed AUDIT-25 L4 row were read again. All four predecessor files exactly
match our merged PR #3289. Earlier whole-packet, other audit rows, two upstream
model documents, RS-16 ownership, roadmap, integrated decomposition and link
readings retain their continuous-session provenance. Scalar character spaces
remain with PMIA L0a and slope-adapted geometry with PadicFamilies.

Native full statements and applicable hypotheses were reread for the Sylvester
matrix, bounded resultant, determinant expansion, full ofFn coordinate API,
monic remainder degree, native Gauss definitions, monic quotient basis and
norm comparison. All needed declarations were already among the 228 baseline
records; none is duplicated as new native work. The finite spectral and Gauss
nodes are adapters to the previously planned construction. Pinned-source
searches found no general spectral transform supplying this missing interface.
Previous bounded upstream searches retain their recorded provenance; no
exhaustive upstream absence claim is made.

Compared with the preceding input capture, the changed supplier consists of
our own authored PMIA continuations through the 304-node PR #3286. The source
ledger has 7616 entries; the sixteen additions since the old 7600-entry capture
were fully read in intervening checkpoints, with all old owner/file/id records
preserved. Both generated source files are unchanged during this claim.
At publication the only changed guarded input is our own merged PMIA PR #3293,
whose sixteen new nodes were authored and fully read in this continuous session.
It changes no interface consumed here. No new supplier dependency is introduced.

## Validation

The complete suggested file elaborated at the pinned baseline with zero errors
and 367 warnings, all and only expected placeholders. The complete ultrametric,
norm-one, nontriviality and completeness hypotheses are explicitly retained in
the new analytic theorem signatures. Its source closure contains 2213 Mathlib
modules and four previously built pinned TauCeti modules, with no proposed
supplier import. No native library was built. The existing requested
AdicSpacesPartII:R3 signature stub and its generality request are preserved.

Suggested SHA256:
4047ee503601accdd99b790ce2ae654187de293b52c6bf8fca4258daf33bd96c.
Source-audit SHA256:
4d6143b39491bf2433f5d4089ff74f8e0b9b33046f5d8837bc9a821317d44a17.
The 21 new mathematical bodies are placeholders; these are type checks,
not completed mathematical proofs.

Whole-object preservation and new reader/declaration/API/test parity pass.
The reachable graph has 186 nodes, 782 acyclic edges and 223 baseline leaves.
Its sole unresolved stage leaf is the existing requested AdicSpacesPartII:R3.
The indexed checker, four-file intake, filename-correct errata wrapper and
whitespace checks pass. Eight explicit gaps and five requests remain.

Exact arithmetic on 24 finite families checks monic spectral reduction,
output degree, rank padding and factor multiplication, and 336 coefficient
comparisons modulo 4, 8, 9 and 25. Three nilpotent-coefficient controls and
24 rank-zero cases pass. Explicit native-convention Sylvester matrices are
used. The superexponential model with coefficients p^(k²), at p=2,3,5,7,
gives 384 fixed-rank Gauss tail comparisons, including roots of norm greater
than one. These check conventions and finite estimates, not uniformity in
unbounded characteristic degree or the general infinite theorem.

At publication main 2566939af56e4177dfd642feeb41fa7f4785e279,
47 of 48 guarded inputs and all four predecessor output blobs are unchanged.
The only input delta is the documented own-supplier continuation. The issue
body is unchanged. Exactly the four authorized files are submitted.

One persistent checkout and existing pinned builds were used, with one own
Lean process at a time. No own compiler, watcher or language server remains.
Retained scratch: WORKLIST.md, inputs.json, input-delta.json, claim.json,
claim-bot.json, issue-before.json, issue-claimed.json, issue-publication.json,
comments-after.json, the four predecessor files, new-nodes.json,
baseline-read.json, append.lean, extend.py, compile.py, lean-source-audit.json,
suggested-compile.log, arithmetic.py, arithmetic-results.json, verify.py,
verification.json, write-reader.py, guard.py, publication-guard.json,
checks.json, submission.json, intake-pr.json and four final files in
handoff-evidence. The existing PDF and source-registry audit retain their
previous handoff provenance. No snapshot or native build is kept.

## Resume

For the general D(B,P), prove quantitative bounds uniform in the growing
characteristic degree of P's truncations. Use the previous all-radius Cauchy
or bounded-coefficient convergence criteria to construct the actual entire
limit. Fixed-rank monic reduction now settles convergence for polynomial P but
supplies no growing-degree estimate. Then identify the general value at one
using the supplied scalar resultant limit, prove A3.8(10) for entire factors
and transport A3.9 to infinite operators. Preserve B(0)=0 for padding and
compact-operator transport.

Other L4 obligations remain canonical finite-module topology/inverse norm
bounds, completed tensors, finite-projective determinants and rank over
nonreduced coefficients, remaining analytic APIs, actual distribution families
and specialization, and Riesz/slope transport. L0–L3 remain not_read with
unchanged exact coverage lists.

The five unchanged requests concern PMIA L0 bounded duals and coefficients,
PMIA L2 bounded Amice/operators, PMIA L0a scalar character spaces, PMIA L3
pseudomeasure evaluation domains, and AdicSpacesPartII:R3 ordinary complete
continuity over the required Noetherian Banach algebras. Consume exact supplier
nodes as those layers are decomposed. No stage is closed by this checkpoint.
